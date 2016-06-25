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

package com.dirtyunicorns.settings.device;

import android.content.res.Resources;
import android.app.IntentService;
import android.content.Context;
import android.content.Intent;
import android.os.PowerManager;
import android.provider.Settings;
import android.util.Log;

import java.util.List;
import java.util.LinkedList;

public class MotoActionsService extends IntentService implements ScreenStateNotifier,
        UpdatedStateNotifier {
    private static final String TAG = "MotoActions";

    private final Context mContext;

    private final DozePulseAction mDozePulseAction;
    private final PowerManager mPowerManager;
    private final ScreenReceiver mScreenReceiver;
    private final SensorHelper mSensorHelper;

    private final List<ScreenStateNotifier> mScreenStateNotifiers = new LinkedList<ScreenStateNotifier>();
    private final List<UpdatedStateNotifier> mUpdatedStateNotifiers =
                        new LinkedList<UpdatedStateNotifier>();

    public MotoActionsService(Context context) {
        super("MotoActionService");
        mContext = context;

        Log.d(TAG, "Starting");

        MotoActionsSettings MotoActionsSettings = new MotoActionsSettings(context, this);
        mSensorHelper = new SensorHelper(context);
        mScreenReceiver = new ScreenReceiver(context, this);

        mDozePulseAction = new DozePulseAction(context);
        mScreenStateNotifiers.add(mDozePulseAction);

        // Actionable sensors get screen on/off notifications
        mScreenStateNotifiers.add(new FlatUpSensor(MotoActionsSettings, mSensorHelper, mDozePulseAction));
        mScreenStateNotifiers.add(new ProximitySensor(MotoActionsSettings, mSensorHelper, mDozePulseAction));
        mScreenStateNotifiers.add(new StowSensor(MotoActionsSettings, mSensorHelper, mDozePulseAction));

        // Other actions that are always enabled
        mUpdatedStateNotifiers.add(new CameraActivationSensor(MotoActionsSettings, mSensorHelper));
        Resources res = context.getResources();
        boolean hasChopChop = res.getBoolean(R.bool.config_hasChopChop);
        if (hasChopChop){
            mUpdatedStateNotifiers.add(new ChopChopSensor(MotoActionsSettings, mSensorHelper));
        } else {
            Log.d(TAG, "No ChopChop");
        }

        mUpdatedStateNotifiers.add(new ProximitySilencer(MotoActionsSettings, context, mSensorHelper));
        mUpdatedStateNotifiers.add(new FlipToMute(MotoActionsSettings, context, mSensorHelper));

        mPowerManager = (PowerManager) context.getSystemService(Context.POWER_SERVICE);
        updateState();
    }

    @Override
    protected void onHandleIntent(Intent intent) {
    }

    @Override
    public void screenTurnedOn() {
        for (ScreenStateNotifier screenStateNotifier : mScreenStateNotifiers) {
            screenStateNotifier.screenTurnedOn();
        }
    }

    @Override
    public void screenTurnedOff() {
        for (ScreenStateNotifier screenStateNotifier : mScreenStateNotifiers) {
            screenStateNotifier.screenTurnedOff();
        }
    }

    public void updateState() {
        if (mPowerManager.isInteractive()) {
            screenTurnedOn();
        } else {
            screenTurnedOff();
        }
        for (UpdatedStateNotifier notifier : mUpdatedStateNotifiers) {
            notifier.updateState();
        }
    }
}
