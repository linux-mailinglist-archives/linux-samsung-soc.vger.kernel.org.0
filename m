Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA4545EE741
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 28 Sep 2022 23:06:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234692AbiI1VFh (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 28 Sep 2022 17:05:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234466AbiI1VEj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Sep 2022 17:04:39 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24765DED4A
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Sep 2022 14:02:07 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id bk15so13844954wrb.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Sep 2022 14:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=vcQTbtSOs9FbsFbv8V2t/E69I1IFg9ZKCW8F5npsSmY=;
        b=CldA6l8PsQE4volYx+2c+WpiB+nwv0YmjWOCRJ2jitsIiMxybyPJtc1LZnsKBM583H
         IXeB8uwDMiX2Uc6g8+9jGQfgAUVR6n5N0DVkNEc8tYjSn9M4dE498+sHWP+z//3xVfeS
         I0xXKkFUZf4BuNt0W03QY9IJ4/9w8KjqD1BBliYEhaNvUPcSm7o31KEj8pZazWuefKBJ
         pnJzcJ4fgqEIQ5ESEFKdygajtb+DMgNatYGSWLO3M84HQz0JEiSnOmGCrUydL71nW+A7
         rp5UxeGC9txt2Y8R+PA6lMEBiu8bGAAeVuiNQQJGCCR6K1+I3savt70Pbj6++8YLXfT0
         DQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=vcQTbtSOs9FbsFbv8V2t/E69I1IFg9ZKCW8F5npsSmY=;
        b=N2r0hm99UOlhaIA8d9tULC4WxCIwm6dgaODokMKwsZvxTCdcAXxRekPqXTG0THVH6R
         tdhtxqYf6q/RzZjnF7xONzVwf+O/vgfEvnJjTHwqJn53RkBbxtKn49811m8XvorLm+oS
         ryCIs3V3VFryRDwmFCsvD+vcesL1VVdSUzfYJMzsBVB+OWyq3rdvKac1V1fRMLiXpFIh
         sPYNI/DPE2RBGs6SCUeyLpzfMKgDXOR7MI2Ba8YyC+/rZmCpfJC60tuUJiyp3K4bBVVq
         M0MHnKeHegJr5gKz0hseB3/29UDPlwDIxV6g6AR7FSSFkNXC8klmf+LJkA8QzSeoJ5H/
         wSbg==
X-Gm-Message-State: ACrzQf3VD92l78j5EUf8kcbNpfXzSonwN+h+u+VQhVChMdbOYXKn4xkn
        Fj3a/1T8WHsKREZ+Uwi/EkK5pQ==
X-Google-Smtp-Source: AMsMyM5JfO/6TD5YT+Cv1PR4t6XCevz+OZG/GJawAB2JnaXKWENF3Ep0gFG8kI21CsQnustU9Kuoaw==
X-Received: by 2002:adf:e601:0:b0:228:60f6:2512 with SMTP id p1-20020adfe601000000b0022860f62512mr22632788wrm.334.1664398925745;
        Wed, 28 Sep 2022 14:02:05 -0700 (PDT)
Received: from mai.. ([2a05:6e02:1041:c10:48a2:39eb:9d1b:8b8d])
        by smtp.gmail.com with ESMTPSA id g20-20020a05600c4ed400b003b4931eb435sm2874300wmq.26.2022.09.28.14.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 14:02:05 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        rui.zhang@intel.com, Raju Rangoju <rajur@chelsio.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Amit Kucheria <amitk@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Broadcom Kernel Team <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Antoine Tenart <atenart@kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>, netdev@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-omap@vger.kernel.org
Subject: [PATCH v7 17/29] thermal/of: Remove of_thermal_is_trip_valid()
Date:   Wed, 28 Sep 2022 23:00:47 +0200
Message-Id: <20220928210059.891387-18-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928210059.891387-1-daniel.lezcano@linaro.org>
References: <20220928210059.891387-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

There is no benefit with the of_thermal_is_trip_valid() function as it
does the check the thermal_zone_get_trip() is already doing for the
sake of getting the trip point.

As all the calls have been replaced by thermal_zone_get_trip(), there
is no more users of of_thermal_is_trip_valid().

Remove the function.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/thermal_core.h | 10 ----------
 drivers/thermal/thermal_of.c   | 19 -------------------
 2 files changed, 29 deletions(-)

diff --git a/drivers/thermal/thermal_core.h b/drivers/thermal/thermal_core.h
index b00fc1913734..e9b3af6c2084 100644
--- a/drivers/thermal/thermal_core.h
+++ b/drivers/thermal/thermal_core.h
@@ -138,16 +138,6 @@ thermal_cooling_device_stats_update(struct thermal_cooling_device *cdev,
 #endif /* CONFIG_THERMAL_STATISTICS */
 
 /* device tree support */
-#ifdef CONFIG_THERMAL_OF
-bool of_thermal_is_trip_valid(struct thermal_zone_device *, int);
-#else
-static inline bool of_thermal_is_trip_valid(struct thermal_zone_device *tz,
-					    int trip)
-{
-	return false;
-}
-#endif
-
 int thermal_zone_device_is_enabled(struct thermal_zone_device *tz);
 
 #endif /* __THERMAL_CORE_H__ */
diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
index 89afa59c4915..4e54d62720dc 100644
--- a/drivers/thermal/thermal_of.c
+++ b/drivers/thermal/thermal_of.c
@@ -19,25 +19,6 @@
 
 #include "thermal_core.h"
 
-/**
- * of_thermal_is_trip_valid - function to check if trip point is valid
- *
- * @tz:	pointer to a thermal zone
- * @trip:	trip point to evaluate
- *
- * This function is responsible for checking if passed trip point is valid
- *
- * Return: true if trip point is valid, false otherwise
- */
-bool of_thermal_is_trip_valid(struct thermal_zone_device *tz, int trip)
-{
-	if (trip >= tz->num_trips || trip < 0)
-		return false;
-
-	return true;
-}
-EXPORT_SYMBOL_GPL(of_thermal_is_trip_valid);
-
 static int of_thermal_set_trip_hyst(struct thermal_zone_device *tz, int trip,
 				    int hyst)
 {
-- 
2.34.1

