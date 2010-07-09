package com.salas.active;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.TextView;


public abstract class ActiveBase extends Activity implements OnClickListener {
	private static final String TAG = "ActoveBase";
	private TextView log_view;
	int theLayout, firstButton, secondButton, logWin;
	View firstBtnView, secondBtnView;
	Intent firstBtnIntent, secondBtnIntent;
	String baseName;
	
	public ActiveBase(String name, int layout, int first, int second, int logWin) {
		theLayout = layout;
		firstButton = first;
		secondButton = second;
		baseName = name;
		this.logWin = logWin;
	}
	
	public void setButtonIntents(Intent firstI, Intent secondI) {
		firstBtnIntent = firstI;
		secondBtnIntent = secondI;
	}
	
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(theLayout);
        
        // Set up click listeners for all the buttons
        firstBtnView = findViewById(firstButton);
        firstBtnView.setOnClickListener(this);
        secondBtnView = findViewById(secondButton);
        secondBtnView.setOnClickListener(this);
        log_view = (TextView) findViewById(logWin);
        addToLog("onCreate Called");
    }

    @Override
    public void onRestoreInstanceState(Bundle savedInstanceState) {
    	addToLog("onRestoreInstanceState called");
    }
    
    @Override
    public void onRestart() {
    	super.onRestart();
    	addToLog("onRestart called");
    }
    
    @Override
    public void onStart() {
    	super.onStart();
    	addToLog("onStart called");
    }
    
    @Override
    public void onResume() {
    	super.onResume();
    	addToLog("onResume called");
    }
    
    @Override
    public void onSaveInstanceState(Bundle savedInstanceState) {
    	super.onSaveInstanceState(savedInstanceState);
    	addToLog("onSaveInstanceState called");
    }
    
    @Override
    public void onPause() {
    	super.onPause();
    	addToLog("onPause called");
    }
    
    @Override
    public void onStop() {
    	super.onStop();
    	addToLog("onStop called");
    }
    
    @Override
    public void onDestroy() {
    	super.onDestroy();
    	addToLog("onStop called");
    }
       
    public void onClick(View v) {
        Log.d(TAG, "clicked on button");
        Intent intent;
        if (v.getId() == firstButton) {
        	intent = firstBtnIntent;
        } else {
        	intent = secondBtnIntent;   
        }
        startActivity(intent);
    }
    
    public void addToLog(String text) {
    	log_view.append(baseName + text + "\n");
    }
}