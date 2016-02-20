package com.example.tanmay.mlwear;

import android.app.Activity;
import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Bundle;
import android.support.wearable.view.WatchViewStub;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.TextView;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MainActivity extends Activity implements SensorEventListener{

    String activityRecorded;
    SensorManager sensorManager;
    Sensor accel;
    Sensor gyro;
    boolean fileOpen = false;
    FileWriter faccel;
    BufferedWriter bwAccel;
    FileWriter fGyro;
    BufferedWriter bwGyro;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        final WatchViewStub stub = (WatchViewStub) findViewById(R.id.watch_view_stub);
        stub.setOnLayoutInflatedListener(new WatchViewStub.OnLayoutInflatedListener() {
            @Override
            public void onLayoutInflated(WatchViewStub stub) {

            }
        });
        sensorManager = (SensorManager)getSystemService(Context.SENSOR_SERVICE);
        accel = sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        gyro = sensorManager.getDefaultSensor(Sensor.TYPE_GYROSCOPE);
      // findViewById(R.id.stop).setEnabled(false);
    }

    public void onResume()
    {
        super.onResume();
        sensorManager.registerListener(this, accel, SensorManager.SENSOR_DELAY_GAME);
        sensorManager.registerListener(this, gyro, SensorManager.SENSOR_DELAY_GAME);

    }

    @Override
    protected void onPause() {
        super.onPause();
        sensorManager.unregisterListener(this);

    }

    public void setActivity(View v)
    {
        RadioButton rb = (RadioButton)v;
        switch(rb.getId())
        {
            case R.id.radioButton3:
            {
                if (rb.isChecked())
                {
                    ((RadioButton)findViewById(R.id.radioButton10)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton4)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton5)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton6)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton7)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton8)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton9)).setChecked(false);
                }
                break;
            }

            case R.id.radioButton4:
            {
                if (rb.isChecked())
                {
                    ((RadioButton)findViewById(R.id.radioButton10)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton3)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton5)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton6)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton7)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton8)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton9)).setChecked(false);
                }
                break;
            }
            case R.id.radioButton5:
            {
                if (rb.isChecked())
                {
                    ((RadioButton)findViewById(R.id.radioButton10)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton3)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton4)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton6)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton7)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton8)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton9)).setChecked(false);
                }
                break;
            }
            case R.id.radioButton6:
            {
                if (rb.isChecked())
                {
                    ((RadioButton)findViewById(R.id.radioButton10)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton3)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton4)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton5)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton7)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton8)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton9)).setChecked(false);
                }
                break;
            }
            case R.id.radioButton7:
            {
                if (rb.isChecked())
                {
                    ((RadioButton)findViewById(R.id.radioButton10)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton3)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton4)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton6)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton5)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton8)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton9)).setChecked(false);
                }
                break;
            }
            case R.id.radioButton8:
            {
                if (rb.isChecked())
                {
                    ((RadioButton)findViewById(R.id.radioButton10)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton3)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton4)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton6)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton7)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton5)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton9)).setChecked(false);
                }
                break;
            }
            case R.id.radioButton9:
            {
                if (rb.isChecked())
                {
                    ((RadioButton)findViewById(R.id.radioButton10)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton3)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton4)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton6)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton7)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton8)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton5)).setChecked(false);
                }
                break;
            }
            case R.id.radioButton10:
            {
                if (rb.isChecked())
                {
                    ((RadioButton)findViewById(R.id.radioButton5)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton3)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton4)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton6)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton7)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton8)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton9)).setChecked(false);
                }
                break;
            }
            default:

            { ((RadioButton)findViewById(R.id.radioButton10)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton3)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton4)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton6)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton7)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton8)).setChecked(false);
                    ((RadioButton)findViewById(R.id.radioButton9)).setChecked(false);
                ((RadioButton)findViewById(R.id.radioButton5)).setChecked(false);

            }
        }
        activityRecorded = ((RadioButton)v).getText().toString();
    }

    public void startRecording(View v)
    {
        try {
            Log.d("ML", "Creating files");
            findViewById(R.id.stop).setEnabled(true);
            findViewById(R.id.start).setEnabled(false);
            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
            String currentDateandTime = sdf.format(new Date());
            String fpathAccel = "/sdcard/Accel.txt";
            //+activityRecorded+"_"+currentDateandTime+".txt";
            String fpathGyro = "/sdcard/Gyro.txt";
                    //+activityRecorded+"_"+currentDateandTime+".txt";
            File fileaccel = new File(fpathAccel);
            File fileGyro = new File(fpathGyro);
            //outputStream = openFileOutput(fpathAccel,Context.MODE_PRIVATE);
                        // If file does not exists, then create it
            if (!fileaccel.exists()) {
                fileaccel.createNewFile();
            }
            if (!fileGyro.exists()) {
                fileGyro.createNewFile();
            }
            fileOpen = true;
            faccel = new FileWriter(fileaccel,true);
            fGyro = new FileWriter(fileGyro,true);
            bwAccel = new BufferedWriter(faccel);
            bwGyro = new BufferedWriter(fGyro);
            bwAccel.write("\n\n" + activityRecorded + " at " + currentDateandTime+"\n");
            bwGyro.write("\n\n" + activityRecorded + " at " + currentDateandTime+"\n");







        } catch (Exception e) {
            e.printStackTrace();

        }

    }

    public void stopRecording(View v)
    {
        try{
            if (bwGyro!=null && bwAccel!=null)
            {bwAccel.close();
            bwGyro.close();
            faccel.close();
                fGyro.close();
            fileOpen = false;}
            findViewById(R.id.start).setEnabled(true);
        }
        catch (IOException io)
        {

        }


    }

    @Override
    public void onAccuracyChanged(Sensor sensor, int accuracy) {
    }

    @Override
    public void onSensorChanged(SensorEvent event) {


        float linear_acc_x = 0;
        float linear_acc_y = 0;
        float linear_acc_z = 0;

        float heading = 0;

        float gyro_x = 0;
        float gyro_y = 0;
        float gyro_z = 0;



       /* if (fileOpen)
            Log.d("ML","FIle is open");*/

        if(event.sensor.getType() == Sensor.TYPE_ACCELEROMETER && fileOpen) {
            linear_acc_x = event.values[0];
            linear_acc_y = event.values[1];
            linear_acc_z = event.values[2];
            try{
                if (bwAccel!=null)
                {
                    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
                    String currentDateandTime = sdf.format(new Date());
                    String content = currentDateandTime+"  "+linear_acc_x + " " + linear_acc_y + " " + linear_acc_z + "\n";
                    bwAccel.write(content);
                    Log.d("ML", "Accelerometer sensor data writing");
                }

            }
            catch (IOException io)
            {
                //Toast.makeText(getApplicationContext(),"Cannot write to file",Toast.LENGTH_LONG).show();
            }
        }


        else if (event.sensor.getType() == Sensor.TYPE_GYROSCOPE){
            gyro_x = event.values[0];
            gyro_y = event.values[1];
            gyro_z = event.values[2];
            try{
                if (bwGyro!=null)
                {
                    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
                    String currentDateandTime = sdf.format(new Date());
                    bwGyro.append(currentDateandTime + " " + gyro_x + " " + gyro_y + " " + gyro_z + "\n");
                    Log.d("ML", "Gyrometer sensor data writing");
                }

            }
            catch (Exception io)
            {
                //Toast.makeText(getApplicationContext(),"Cannot write to file",Toast.LENGTH_LONG).show();
            }
        }

    }
}
