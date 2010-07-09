package com.salas.active;

import android.content.Intent;
import android.os.Bundle;

public class ActiveFirst extends ActiveBase {

	public ActiveFirst() {
		super("[first]", R.layout.first, R.id.first_to_home, R.id.first_to_third,R.id.secLog);
	}
	
    @Override
	public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
		setButtonIntents(new Intent(ActiveFirst.this, ActiveHome.class), 
				    	new Intent(ActiveFirst.this, ActiveSecond.class));

    }

}
