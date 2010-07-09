package com.salas.active;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;


public class ActiveSecond extends Activity implements OnClickListener {
	private static final String TAG = "SecondBase";
	
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.second);
        
        // Set up click listeners for all the buttons
        View firstbasebutton = findViewById(R.id.FirstBase);
        firstbasebutton.setOnClickListener(this);
    }
    
    public void onClick(View v) {
        Log.d(TAG, "clicked on button");
        Intent intent = new Intent(ActiveSecond.this, ActiveFirst.class);
        startActivity(intent);
    } 
}