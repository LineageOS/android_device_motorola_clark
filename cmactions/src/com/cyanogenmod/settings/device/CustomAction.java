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
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Vibrator;
import android.preference.PreferenceManager;
import android.util.Log;

import java.net.URISyntaxException;

public class CustomAction implements SensorAction {
    private static final String TAG = "CMActions";

    private static final int TURN_SCREEN_ON_WAKE_LOCK_MS = 500;

    private Context mContext;
    private String mUri;
    private final int mVibratorPeriod;
    private final Vibrator mVibrator;

    public CustomAction(Context context, int vibratorPeriod, String key) {
        mContext = context;
        mVibrator = (Vibrator) mContext.getSystemService(Context.VIBRATOR_SERVICE);
        mVibratorPeriod = vibratorPeriod;

        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(mContext);
        mUri = prefs.getString(key + "_custom", "");
    }

    @Override
    public void action() {
        mVibrator.vibrate(mVibratorPeriod);
        if (!mUri.equals("")) {
            try {
                Intent intent = Intent.parseUri(mUri, 0);
                intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                mContext.startActivity(intent);
            } catch (URISyntaxException e) {
                // ignore
            }
        }
    }
}
