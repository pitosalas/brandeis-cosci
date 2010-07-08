package com.salas.active;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.TextView;


public class ActiveThird extends Activity implements OnClickListener {
	private static final String TAG = "ThirdBase";
	
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.third);
        
        // Set up click listeners for all the buttons
        View homebasebutton = findViewById(R.id.third_to_home);
        homebasebutton.setOnClickListener(this);
        View secondbasebutton = findViewById(R.id.third_to_second);
        secondbasebutton.setOnClickListener(this);
        TextView third_base_log = (TextView) findViewById(R.id.secLog);
        third_base_log.append("[THIRDBASE] onCreate called");
    }
    
    public void onClick(View v) {
        Log.d(TAG, "clicked on button");
        Intent intent;
        if (v.getId() == R.id.third_to_home) {
        	intent = new Intent(ActiveThird.this, ActiveHome.class);
        } else {
        	intent = new Intent(ActiveThird.this, ActiveSecond.class);       
        }
        startActivity(intent);
    } 
}