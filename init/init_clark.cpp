/*
   Copyright (c) 2013, The Linux Foundation. All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#include <string.h>
#include <stdlib.h>

#include "vendor_init.h"
#include "property_service.h"
#include "log.h"
#include "util.h"

void vendor_load_properties()
{
    char platform[PROP_VALUE_MAX];
    char sku[PROP_VALUE_MAX];
    char car[PROP_VALUE_MAX];
    int rc;

    rc = property_get("ro.board.platform", platform);
    if (!rc || strncmp(platform, ANDROID_TARGET, PROP_VALUE_MAX))
        return;

    property_get("ro.boot.hardware.sku", sku);
    property_get("ro.boot.carrier", car);

    property_set("ro.product.model", sku);

    if (strstr(sku, "XT1572")) {
        property_set("ro.product.display", "Moto X Style");
        property_set("ro.telephony.default_network", "9");
        property_set("telephony.lteOnCdmaDevice", "0");
        // Region specifics
        if (strstr(car, "retin")) {
            /* India */
            property_set("persist.radio.multisim.config", "dsds");
            property_set("persist.radio.plmn_name_cmp", "1");
            property_set("ro.fsg-id", "emea_dsds");
            property_set("ro.build.description", "clark_retasia_ds-user 6.0 MPH24.49-18 18 release-keys");
            property_set("ro.build.fingerprint", "motorola/clark_retasia_ds/clark_ds:6.0/MPH24.49-18/18:user/release-keys");
        } else {
            property_set("ro.build.description", "clark_reteu-user 5.1.1 LPH23.116-18 23 release-keys");
            property_set("ro.build.fingerprint", "motorola/clark_reteu/clark:5.1.1/LPH23.116-18/23:user/release-keys");
        }
    } else if (strstr(sku, "XT1575")) {
        /* US */
        property_set("ro.product.display", "Moto X Pure Edition");
        property_set("ro.ril.force_eri_from_xml", "true");
        property_set("ro.telephony.get_imsi_from_sim", "true");
        property_set("ro.telephony.default_network", "10");
        property_set("telephony.lteOnCdmaDevice", "1");
        property_set("ro.build.description", "clark_retus-user 6.0 MPH24.49-18 18 release-keys");
        property_set("ro.build.fingerprint", "motorola/clark_retus/clark:6.0/MPH24.49-18/18:user/release-keys");
    }
}
