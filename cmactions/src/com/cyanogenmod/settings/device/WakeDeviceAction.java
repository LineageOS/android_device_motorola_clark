/*
 * Copyright (c) 2016 The CyanogenMod Project
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
import android.os.PowerManager;
import android.os.SystemClock;
import android.os.Vibrator;
import android.util.Log;

public class WakeDeviceAction implements SensorAction {
    private static final String TAG = "CMActions";

    private static final int TURN_SCREEN_ON_WAKE_LOCK_MS = 500;

    private PowerManager mPowerManager;
    private final int mVibratorPeriod;
    private final Vibrator mVibrator;

    public WakeDeviceAction(Context mContext, int vibratorPeriod) {
        mPowerManager = (PowerManager) mContext.getSystemService(Context.POWER_SERVICE);
        mVibrator = (Vibrator) mContext.getSystemService(Context.VIBRATOR_SERVICE);
        mVibratorPeriod = vibratorPeriod;
    }

    @Override
    public void action() {
        mVibrator.vibrate(mVibratorPeriod);
        if (!mPowerManager.isScreenOn()) {
            mPowerManager.wakeUp(SystemClock.uptimeMillis());
        }
    }
}
