package com.recoverywise; // This should match your package name

import com.facebook.react.ReactActivity;
import android.os.Bundle; // Add this import

public class MainActivity extends ReactActivity {

  /**
   * Returns the name of the main component registered from JavaScript. This is used to schedule
   * rendering of the component.
   */
  @Override
  protected String getMainComponentName() {
    return "RecoveryWise";
  }

  // Add this method for React Navigation
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(null);
  }
}
