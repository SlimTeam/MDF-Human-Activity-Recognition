%% Taken from Huji Data Set
function viddata = ReadLoadLKFromVid2OpticalFlowCSV(vid_csv_filename)
            
    metadata = ReadVid2OpticalFlowMetadata(vid_csv_filename);

    lkcsv=csvread(vid_csv_filename,1,0);
    numFrames = size(lkcsv,1);
    xblocks = str2double(metadata('NUM_BLOCKS_X'));
    yblocks = str2double(metadata('NUM_BLOCKS_Y'));
    blockwidth = str2double(metadata('BLOCK_WIDTH'));
    blockheight = str2double(metadata('BLOCK_HEIGHT'));

    processing_width = str2double(metadata('PROCESSING_WIDTH'));
    processing_height = str2double(metadata('PROCESSING_HEIGHT'));

    numBlocks = xblocks*yblocks;
    sframe = str2double(metadata('START_FRAME'));
    eframe = str2double(metadata('END_FRAME'));
    skip = str2double(metadata('FRAME_SKIP'))+1;
    frame_range = sframe:skip:eframe;
    frame_range = frame_range(1:numFrames); 

    X = zeros(numBlocks,numFrames);
    Y = zeros(numBlocks,numFrames);
    tracking_valid = zeros(numBlocks,numFrames);
    cannysum = zeros(numBlocks,numFrames);
    fpcount = zeros(numBlocks,numFrames);
    backprojerr = zeros(numBlocks,numFrames);


    t=0;
    for yb=1:yblocks
        for xb=1:xblocks
            t=t+1;

            if mod(t,10)==0
%                fprintf('%sLoading block %d/%d...\n',log_line_prefix,t,numBlocks);
            end

            % Each LK block data is composed of six elements: valid,x,y,sum_canny,num_fpoints,backproj_err. The valid
            % vector is 0 if the result is invalid and 1 if it is valid.
            ind = 1+(t-1)*6; % Ind to the first column of the current block (Matlab is 1 based).

            valid = lkcsv(:,ind);
            x = lkcsv(:,ind+1);
            y = lkcsv(:,ind+2);
            block_canny = lkcsv(:,ind+3);
            block_num_fpoints = lkcsv(:,ind+4);
            block_backproj_err = lkcsv(:,ind+5);


            % suppress large motions that dont make sense
            max_valid_x = min([blockwidth 50]);
            max_valid_y = min([blockheight 50]);
            valid = valid .* (abs(x)<max_valid_x);
            valid = valid .* (abs(y)<max_valid_y);

            % Need at least two points to interpolate missing data...
            if sum(valid) > 2

                % Set invalid points to nan
                invalid_logical = valid==0;

                if sum(invalid_logical)>0

                    x(invalid_logical) = interp1(frame_range(~invalid_logical),x(~invalid_logical),frame_range(invalid_logical));
                    y(invalid_logical) = interp1(frame_range(~invalid_logical),y(~invalid_logical),frame_range(invalid_logical));

                     % Handle nans on boundaries...
                    if isnan(x(1)) || isnan(x(end))
                        temp=find(~isnan(x));
                        if numel(temp)>0
                            first_not_nan=temp(1);
                            x(1:first_not_nan-1) = x(first_not_nan);
                            y(1:first_not_nan-1) = y(first_not_nan);
                            last_not_nan=temp(end);
                            x(last_not_nan+1:end) = x(last_not_nan);
                            y(last_not_nan+1:end) = y(last_not_nan);
                        else
                            % Entire block is nan??
                        end
                    end
                end
            else
                % This block is entirely invalid.
                valid(:) = 0;
                x(:) = 0;
                y(:) = 0;
            end

            tracking_valid(t,:) = valid;
            X(t,:) = x;
            Y(t,:) = y;
            cannysum(t,:) = block_canny;
            fpcount(t,:) = block_num_fpoints;
            backprojerr(t,:) = block_backproj_err;

        end
    end

    viddata.num_frames = numFrames;
    viddata.width = processing_width;
    viddata.height = processing_height;
    viddata.num_x_cells = xblocks;
    viddata.num_y_cells = yblocks;
    viddata.skip = skip;
    viddata.csv_fname = vid_csv_filename;
    viddata.frame_range = frame_range;
    viddata.num_blocks = numBlocks;
    viddata.LK_X = X ./ viddata.width; % Normalize to image size.
    viddata.LK_Y = Y ./ viddata.height;
    viddata.LK_valid = tracking_valid;
    viddata.cannysum = cannysum ./ (blockwidth*blockheight);
    viddata.fpcount = fpcount ./ (blockwidth*blockheight);
    viddata.backprojerr = backprojerr;
    viddata.fps = str2double(metadata('FPS'));

end

