/*
 * Copyright (c) 2015 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.cyanogenmod.settings.device;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.PowerManager;
import android.os.SystemClock;
import android.preference.PreferenceManager;
import android.util.Log;

public class DozePulseAction implements SensorAction, ScreenStateNotifier {
    private static final String TAG = "CMActions";

    public static final String DOZE_ACTION = "doze";
    public static final String WAKE_ACTION = "wake";
    public static final String NO_ACTION = "none";

    private static final int DELAY_BETWEEN_DOZES_IN_MS = 1500;

    private final Context mContext;
    private final PowerManager mPowerManager;

    private String mKey;

    private long mLastDoze;

    public DozePulseAction(Context context, String key) {
        mContext = context;
        mPowerManager = (PowerManager) context.getSystemService(Context.POWER_SERVICE);
        mKey = key;
    }

    @Override
    public void screenTurnedOn() {
    }

    @Override
    public void screenTurnedOff() {
        mLastDoze = System.currentTimeMillis();
    }

    public void action() {
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(mContext);
        String action = prefs.getString(mKey, "");
        if (action.equals(DOZE_ACTION)) {
            if (mayDoze()) {
                if (CMActionsService.DEBUG) Log.d(TAG, "Sending doze.pulse intent");
                mContext.sendBroadcast(new Intent("com.android.systemui.doze.pulse"));
            }
        } else if (action.equals(WAKE_ACTION)) {
            if (!mPowerManager.isScreenOn()) {
                mPowerManager.wakeUp(SystemClock.uptimeMillis());
            }
        }
    }

    public synchronized boolean mayDoze() {
        long now = System.currentTimeMillis();
        if (now - mLastDoze > DELAY_BETWEEN_DOZES_IN_MS) {
            if (CMActionsService.DEBUG) Log.d(TAG, "Allowing doze");
            mLastDoze = now;
            return true;
        } else {
            if (CMActionsService.DEBUG) Log.d(TAG, "Denying doze");
            return false;
        }
    }
}
