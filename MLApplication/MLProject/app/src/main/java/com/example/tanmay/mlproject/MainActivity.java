package com.example.tanmay.mlproject;

import android.content.Context;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Bundle;
import android.support.design.widget.FloatingActionButton;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.View;
import android.view.Menu;
import android.view.MenuItem;
import android.view.WindowManager;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.Toast;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MainActivity extends AppCompatActivity implements SensorEventListener {

    String activityRecorded;
    SensorManager sensorManager;
    Sensor accel;
    Sensor gyro;
    boolean fileOpen = false;
    FileWriter fwaccel;
    FileWriter fwgyro;
    BufferedWriter bwaccel;
    BufferedWriter bwGyro;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        sensorManager = (SensorManager)getSystemService(Context.SENSOR_SERVICE);
        accel = sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        gyro = sensorManager.getDefaultSensor(Sensor.TYPE_GYROSCOPE);
        findViewById(R.id.stop).setEnabled(false);


    }

    public void onResume()
    {
        super.onResume();
        sensorManager.registerListener(this, accel, SensorManager.SENSOR_DELAY_GAME);
        sensorManager.registerListener(this, gyro, SensorManager.SENSOR_DELAY_GAME);

    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.menu_main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @Override
    protected void onPause() {
        super.onPause();
         sensorManager.unregisterListener(this);

    }

    public void setActivity(View v)
    {
        activityRecorded = ((RadioButton)v).getText().toString();
    }

    public void startRecording(View v)
    {
        try {
            Log.d("ML","Creating files");
            findViewById(R.id.stop).setEnabled(true);
            findViewById(R.id.start).setEnabled(false);
            String personName = ((EditText)findViewById(R.id.person)).getText().toString();
            SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
            String currentDateandTime = sdf.format(new Date());
            String fpathAccel = "/sdcard/Accel_"+personName+"_"+activityRecorded+"_"+currentDateandTime+".txt";
            String fpathGyro = "/sdcard/Gyro_"+personName+"_"+activityRecorded+"_"+currentDateandTime+".txt";
            File fileaccel = new File(fpathAccel);
            File fileGyro = new File(fpathGyro);
            // If file does not exists, then create it
            if (!fileaccel.exists()) {
                fileaccel.createNewFile();
            }
            if (!fileGyro.exists()) {
                fileGyro.createNewFile();
                fileGyro.createNewFile();
            }
            fwaccel = new FileWriter(fileaccel.getAbsoluteFile());
            bwaccel = new BufferedWriter(fwaccel);

            fwgyro = new FileWriter(fileGyro.getAbsoluteFile());
            bwGyro = new BufferedWriter(fwgyro);
            fileOpen = true;



            Log.d("Suceess", "Sucess");



        } catch (IOException e) {
            e.printStackTrace();

        }

    }

    public void stopRecording(View v)
    {
        try{
            bwaccel.close();
            bwGyro.close();
            fileOpen = false;
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

        Log.d("ML","In onsensorchanged "+event.sensor.getType());
        Log.d("ML","Accelerometer  "+Sensor.TYPE_ACCELEROMETER);

        if (fileOpen)
            Log.d("ML","FIle is open");

        if(event.sensor.getType() == Sensor.TYPE_ACCELEROMETER && fileOpen) {
            linear_acc_x = event.values[0];
            linear_acc_y = event.values[1];
            linear_acc_z = event.values[2];
            try{
                if (bwaccel!=null)
                {
                    SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
                    String currentDateandTime = sdf.format(new Date());
                    bwaccel.write(currentDateandTime+" "+linear_acc_x + " " + linear_acc_y + " " + linear_acc_z + "\n");
                }
                Log.d("ML","Accelerometer sensor data writing");
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
                    bwGyro.write(currentDateandTime+" "+gyro_x + " " + gyro_y + " " + gyro_z + "\n");
                }
                Log.d("ML","Gyrometer sensor data writing");
            }
            catch (IOException io)
            {
                //Toast.makeText(getApplicationContext(),"Cannot write to file",Toast.LENGTH_LONG).show();
            }
        }

    }
}
