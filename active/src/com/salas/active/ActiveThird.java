package com.salas.active;

import android.content.Intent;
import android.os.Bundle;

public class ActiveThird extends ActiveBase {

	public ActiveThird() {
		super("[third]", R.layout.third, R.id.third_to_home, R.id.third_to_second,R.id.secLog);
	}
	
    @Override
	public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
		setButtonIntents(new Intent(ActiveThird.this, ActiveHome.class), 
				    	new Intent(ActiveThird.this, ActiveSecond.class));

    }

}
