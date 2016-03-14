/*
 * Copyright (C) 2015 The CyanogenMod Project
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

import android.app.ActionBar;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.ListPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceActivity;
import android.preference.PreferenceCategory;
import android.preference.PreferenceManager;
import android.view.Menu;
import android.view.MenuItem;

import org.cyanogenmod.internal.util.ScreenType;

public class TouchscreenGestureSettings extends PreferenceActivity {
    private static final String CATEGORY_AMBIENT_DISPLAY = "ambient_display_key";

    private static final String KEY_CHOP_CHOP = "gesture_chop_chop";
    private static final String KEY_TWIST = "gesture_camera_action";

    private String mGesture;
    private ShortcutPickHelper mPicker;

    private OnPreferenceChangeListener mPrefListener = new OnPreferenceChangeListener() {
        @Override
        public boolean onPreferenceChange(Preference preference, Object newValue) {
            if (((String) newValue).equals("4")) {
                mGesture = preference.getKey();
                mPicker.pickShortcut(null, null, 0);
            }
            return true;
        }
    };

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        addPreferencesFromResource(R.xml.gesture_panel);
        PreferenceCategory ambientDisplayCat = (PreferenceCategory)
                findPreference(CATEGORY_AMBIENT_DISPLAY);
        if (ambientDisplayCat != null) {
            ambientDisplayCat.setEnabled(CMActionsSettings.isDozeEnabled(getContentResolver()));
        }
        final ActionBar actionBar = getActionBar();
        actionBar.setDisplayHomeAsUpEnabled(true);

        ListPreference chopchop = (ListPreference) findPreference(KEY_CHOP_CHOP);
        ListPreference twist = (ListPreference) findPreference(KEY_TWIST);

        mPicker = new ShortcutPickHelper(this, new ShortcutPickHelper.OnPickListener() {
            @Override
            public void shortcutPicked(String uri, String friendlyName, boolean isApplication) {
                if (uri == null) {
                    return;
                }
                if (mGesture != null) {
                    putSettingsString(mGesture + "_custom", uri);
                    mGesture = null;
                }
            }
        });

        chopchop.setOnPreferenceChangeListener(mPrefListener);
        twist.setOnPreferenceChangeListener(mPrefListener);
    }

    private void putSettingsString(String key, String value) {
        SharedPreferences prefs = PreferenceManager.getDefaultSharedPreferences(this);
        prefs.edit().putString(key, value).apply();
    }

    @Override
    protected void onResume() {
        super.onResume();

        // If running on a phone, remove padding around the listview
        if (!ScreenType.isTablet(this)) {
            getListView().setPadding(0, 0, 0, 0);
        }
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == android.R.id.home) {
            onBackPressed();
            return true;
        }
        return false;
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        if (requestCode != RESULT_CANCELED && resultCode != RESULT_CANCELED) {
            mPicker.onActivityResult(requestCode, resultCode, data);
        }
    }
}
