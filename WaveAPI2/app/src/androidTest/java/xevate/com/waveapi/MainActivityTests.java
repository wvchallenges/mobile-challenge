package xevate.com.waveapi;

import android.content.Context;
import android.graphics.Point;
import android.net.wifi.WifiManager;
import android.os.RemoteException;
import android.support.test.InstrumentationRegistry;
import android.support.test.rule.ActivityTestRule;
import android.support.test.runner.AndroidJUnit4;
import android.support.test.uiautomator.UiDevice;

import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;


@RunWith(AndroidJUnit4.class)
public class MainActivityTests {
    @Rule
    public ActivityTestRule<MainActivity> mActivityRule
            = new ActivityTestRule<>(MainActivity.class);
    private MainActivity mainActivity;

    @Before
    public void init(){
        UiDevice uiDevice = UiDevice.getInstance(InstrumentationRegistry.getInstrumentation());
        Point[] coordinates = new Point[4];
        coordinates[0] = new Point(248, 1520);
        coordinates[1] = new Point(248, 929);
        coordinates[2] = new Point(796, 1520);
        coordinates[3] = new Point(796, 929);
        try {
            if (!uiDevice.isScreenOn()) {
                uiDevice.wakeUp();
                uiDevice.swipe(coordinates, 10);
            }
        } catch (RemoteException e) {
            e.printStackTrace();
        }
        testWaveAPI2();
    }
    @Before
    public void setActivity() {
        mainActivity = mActivityRule.getActivity();
    }

    @Test
    public void testWaveAPI2() {

        WifiManager wifiManager = (WifiManager)mainActivity.getApplicationContext().getSystemService(Context.WIFI_SERVICE);
        wifiManager.setWifiEnabled(false);

//        ConnectivityManager connec = (ConnectivityManager)getSystemService(Context.CONNECTIVITY_SERVICE);
//
//// ARE WE CONNECTED TO THE NET
//        if ( connec.getNetworkInfo(0).getState() == NetworkInfo.State.CONNECTED ||
//                connec.getNetworkInfo(1).getState() == NetworkInfo.State.CONNECTED ) {
//            // ...
//        }



    }
}