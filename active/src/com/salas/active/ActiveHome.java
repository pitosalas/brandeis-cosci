package com.salas.active;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;

public class ActiveHome extends Activity implements OnClickListener {
	private static final String TAG = "FirstBase";
	
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.main);
        
        // Set up click listeners for all the buttons
        View secondBaseButton = findViewById(R.id.SecondBase);
        secondBaseButton.setOnClickListener(this);
    }
    
    public void onClick(View v) {
        Log.d(TAG, "clicked on button");
        Intent intent = new Intent(ActiveHome.this, ActiveSecond.class);
        startActivity(intent);
    }
     
}