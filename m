Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94FAE5EE78F
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 28 Sep 2022 23:06:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234007AbiI1VES (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 28 Sep 2022 17:04:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234388AbiI1VC7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Sep 2022 17:02:59 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B335A7A8B
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Sep 2022 14:01:50 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id v28so8772819wrd.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Sep 2022 14:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=XsxTgl9OJhYT/B2dXFDz/rl/9WpF5J4y9HKMzylFxc4=;
        b=cczLCJu9MTJRQTpXDuR+G9MWjzPOx4NISZUE1EELl15S+ZowmtG+jvuGSgYVu2WPhy
         GARCspgkPOxBtZ0yLZNiM6gD58TZ3Swuknx87oeDIWhgHp8EkKHTaqIm6qp7EnsAwNYu
         V5F34Hs4IJwg7ov/EmiQnB4rzvnSje9dH2YTyE+KcKDY+e9Vbu654+BRZYHBNzNhjWPo
         reUX9dTlSvXl6NxC54g3pcm2qJE6YsZAK4FT+EjCKwEoNPnBirtRAwGEuWQioJXRH4tj
         2PXnptDEOqua3yIuzu8bqex9MMcaqivQQ8oPvHW1XTm2gOoOgiWnH401tgPrMneq8mbi
         5hZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=XsxTgl9OJhYT/B2dXFDz/rl/9WpF5J4y9HKMzylFxc4=;
        b=VTWdxmm7QygMwAwg+kSQ1tEOmqV6+vPhVlc86pCOHcDfqIq/HIO1Kae/2XuLpgQCZU
         yExR/3sCmN0IyvVYjZjr32eh1ku2VHyg+h8elWoAcRdXMaxUAro2yZQtJcIn2JlIi2+J
         MVBpV8QXp1/k6jq7YXdug9M9AsCBOVFKF2OCeS4ro2s24pteqNtORElZcJB/QiLt/mYL
         OLfvBq+ld81tx29/1JznTQi90ugiccQ6OH+UBFSletLlkL1xMHCmHk5M8Rn9ZAFQquro
         ZB1HM0+d+UoFgydqu2ecRKe0lLCeY6kYaqZgz/HV7hh6zd01CsMIAsreIydr+JO/Ou7X
         JTIA==
X-Gm-Message-State: ACrzQf1XyKz6iIO7K2/qBg7tK2wISEUgvuOwOI62cbXp53UHScMvYxRm
        9b5AnP4Su48Hh8tB97w9A4fuRQ==
X-Google-Smtp-Source: AMsMyM7aIhPLPr02I5P+/Nf1yWlWYFDWmhmwBEDPW4A3+jbqfnnB16/IRIiqB6Q17nE5OcGzytz4ow==
X-Received: by 2002:adf:f804:0:b0:228:62fd:6e9a with SMTP id s4-20020adff804000000b0022862fd6e9amr22603162wrp.697.1664398903564;
        Wed, 28 Sep 2022 14:01:43 -0700 (PDT)
Received: from mai.. ([2a05:6e02:1041:c10:48a2:39eb:9d1b:8b8d])
        by smtp.gmail.com with ESMTPSA id g20-20020a05600c4ed400b003b4931eb435sm2874300wmq.26.2022.09.28.14.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 14:01:43 -0700 (PDT)
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
Subject: [PATCH v7 10/29] thermal/drivers/tegra: Use generic thermal_zone_get_trip() function
Date:   Wed, 28 Sep 2022 23:00:40 +0200
Message-Id: <20220928210059.891387-11-daniel.lezcano@linaro.org>
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

Replace a single call to thermal_zone_get_trip() to get a trip point
instead of calling the different ops->get_trip*

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/tegra/soctherm.c        | 33 +++++++++++--------------
 drivers/thermal/tegra/tegra30-tsensor.c | 17 ++++++-------
 2 files changed, 22 insertions(+), 28 deletions(-)

diff --git a/drivers/thermal/tegra/soctherm.c b/drivers/thermal/tegra/soctherm.c
index 1efe470f31e9..96b541458ccd 100644
--- a/drivers/thermal/tegra/soctherm.c
+++ b/drivers/thermal/tegra/soctherm.c
@@ -582,23 +582,23 @@ static int tsensor_group_thermtrip_get(struct tegra_soctherm *ts, int id)
 	return temp;
 }
 
-static int tegra_thermctl_set_trip_temp(struct thermal_zone_device *tz, int trip, int temp)
+static int tegra_thermctl_set_trip_temp(struct thermal_zone_device *tz, int trip_id, int temp)
 {
 	struct tegra_thermctl_zone *zone = tz->devdata;
 	struct tegra_soctherm *ts = zone->ts;
+	struct thermal_trip trip;
 	const struct tegra_tsensor_group *sg = zone->sg;
 	struct device *dev = zone->dev;
-	enum thermal_trip_type type;
 	int ret;
 
 	if (!tz)
 		return -EINVAL;
 
-	ret = tz->ops->get_trip_type(tz, trip, &type);
+	ret = thermal_zone_get_trip(tz, trip_id, &trip);
 	if (ret)
 		return ret;
 
-	if (type == THERMAL_TRIP_CRITICAL) {
+	if (trip.type == THERMAL_TRIP_CRITICAL) {
 		/*
 		 * If thermtrips property is set in DT,
 		 * doesn't need to program critical type trip to HW,
@@ -609,7 +609,7 @@ static int tegra_thermctl_set_trip_temp(struct thermal_zone_device *tz, int trip
 		else
 			return 0;
 
-	} else if (type == THERMAL_TRIP_HOT) {
+	} else if (trip.type == THERMAL_TRIP_HOT) {
 		int i;
 
 		for (i = 0; i < THROTTLE_SIZE; i++) {
@@ -620,7 +620,7 @@ static int tegra_thermctl_set_trip_temp(struct thermal_zone_device *tz, int trip
 				continue;
 
 			cdev = ts->throt_cfgs[i].cdev;
-			if (get_thermal_instance(tz, cdev, trip))
+			if (get_thermal_instance(tz, cdev, trip_id))
 				stc = find_throttle_cfg_by_name(ts, cdev->type);
 			else
 				continue;
@@ -687,25 +687,20 @@ static const struct thermal_zone_device_ops tegra_of_thermal_ops = {
 	.set_trips = tegra_thermctl_set_trips,
 };
 
-static int get_hot_temp(struct thermal_zone_device *tz, int *trip, int *temp)
+static int get_hot_temp(struct thermal_zone_device *tz, int *trip_id, int *temp)
 {
-	int ntrips, i, ret;
-	enum thermal_trip_type type;
+	int i, ret;
+	struct thermal_trip trip;
 
-	ntrips = of_thermal_get_ntrips(tz);
-	if (ntrips <= 0)
-		return -EINVAL;
+	for (i = 0; i < thermal_zone_get_num_trips(tz); i++) {
 
-	for (i = 0; i < ntrips; i++) {
-		ret = tz->ops->get_trip_type(tz, i, &type);
+		ret = thermal_zone_get_trip(tz, i, &trip);
 		if (ret)
 			return -EINVAL;
-		if (type == THERMAL_TRIP_HOT) {
-			ret = tz->ops->get_trip_temp(tz, i, temp);
-			if (!ret)
-				*trip = i;
 
-			return ret;
+		if (trip.type == THERMAL_TRIP_HOT) {
+			*trip_id = i;
+			return 0;	
 		}
 	}
 
diff --git a/drivers/thermal/tegra/tegra30-tsensor.c b/drivers/thermal/tegra/tegra30-tsensor.c
index c34501287e96..cbaad2245f1d 100644
--- a/drivers/thermal/tegra/tegra30-tsensor.c
+++ b/drivers/thermal/tegra/tegra30-tsensor.c
@@ -316,18 +316,17 @@ static void tegra_tsensor_get_hw_channel_trips(struct thermal_zone_device *tzd,
 	*hot_trip  = 85000;
 	*crit_trip = 90000;
 
-	for (i = 0; i < tzd->num_trips; i++) {
-		enum thermal_trip_type type;
-		int trip_temp;
+	for (i = 0; i < thermal_zone_get_num_trips(tzd); i++) {
 
-		tzd->ops->get_trip_temp(tzd, i, &trip_temp);
-		tzd->ops->get_trip_type(tzd, i, &type);
+		struct thermal_trip trip;
 
-		if (type == THERMAL_TRIP_HOT)
-			*hot_trip = trip_temp;
+		thermal_zone_get_trip(tzd, i, &trip);
+		
+		if (trip.type == THERMAL_TRIP_HOT)
+			*hot_trip = trip.temperature;
 
-		if (type == THERMAL_TRIP_CRITICAL)
-			*crit_trip = trip_temp;
+		if (trip.type == THERMAL_TRIP_CRITICAL)
+			*crit_trip = trip.temperature;
 	}
 
 	/* clamp hardware trips to the calibration limits */
-- 
2.34.1

