Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6D15EC64E
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 27 Sep 2022 16:34:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232580AbiI0Odz (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 27 Sep 2022 10:33:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232488AbiI0OdI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Sep 2022 10:33:08 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42DFE69F5C
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Sep 2022 07:33:05 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id n10so15260753wrw.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Sep 2022 07:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=7e6ctEATW9s/XP6ppX0yJV3WjnU6tGYDDticrBE+dlY=;
        b=SEmC5HLruQb91q4xBajU66upItPLiebtVT+iFt8mtN7HOClv+DHAX4ENbahzbJnTwb
         SEdAu8gmbCLC6NEOOseU4HT3h/Yq+/aPIFuNY2b0Rl14tTKlF2KAwOHr2wcE7+8Mss66
         +mybXU0pcrFQ5Z/pd0kQJ01p5cm9UwtTgjZUAWh+7YrcP3DF3XF4JmaeLwMMscQG9oKv
         1F8ywgXTIUVnl/BL0XYojIghFRujPhMOaPy6ASX4QsLgzPp4tFXsX0sfG8zRYWbfVihU
         Y3pBO0vq+Cyqa3j5R5kU+FkNc32w8niSCS1RKh9aLwDsBITjQ6VFxjsrsu3fNOLE2UyI
         R0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7e6ctEATW9s/XP6ppX0yJV3WjnU6tGYDDticrBE+dlY=;
        b=AXa2TQW/5oujNVoTY3oNkF7/COOKtflbveak9wk/WwCe29yt17QPjDpmblMr7F+KUz
         C4/RDdHjwkKzWBxphIrgkfh5+Q7IaK6+i9GiNJJJd7bIg6Yj7o9Qjcf30lY4NUN3cxM1
         L4g8TykmtpGw/fnko7mWdJI7aww1BSDHSKjrmazA8edwfmfykUfmJnTW3vi9wDznw30g
         hVJyF/bwzbA0Um8Dp3J3jNRVKY081ooTQ3M2spm4NHTVyhgFYWszWOksTZd+Z1WHgwbk
         CLKlKN4Nm7lWh25XjIqC/mxk/PpGDAXir5RNO+uvooZo0AY4QlreQPdHYqAK0mHnV4Lq
         vNJg==
X-Gm-Message-State: ACrzQf2Ie1CLq3BC0g0ddc3NcQmq6vaHN4sezCG+4cQdCVHgWMGJStmN
        rbjQ3j20ehXUe6BUVzd4izKx7g==
X-Google-Smtp-Source: AMsMyM6+gMUdLIWCRExVkHM3ZcD1DnU1ZN99swSZ69fg1w96jdY+BmwDhRzTfea+KoLj36DG3IUmAw==
X-Received: by 2002:adf:ebcf:0:b0:22c:9eb4:d6f6 with SMTP id v15-20020adfebcf000000b0022c9eb4d6f6mr8180737wrn.251.1664289183486;
        Tue, 27 Sep 2022 07:33:03 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id l6-20020a05600c4f0600b003b4924493bfsm17518371wmq.9.2022.09.27.07.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 07:33:03 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        rui.zhang@intel.com,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C,
        S5P AND EXYNOS ARM ARCHITECTURES)
Subject: [PATCH v6 09/29] thermal/drivers/exynos: Replace of_thermal_is_trip_valid() by thermal_zone_get_trip()
Date:   Tue, 27 Sep 2022 16:32:19 +0200
Message-Id: <20220927143239.376737-10-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927143239.376737-1-daniel.lezcano@linaro.org>
References: <20220927143239.376737-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The thermal_zone_get_trip() does the same check as
of_thermal_is_trip_valid(). Replace the call to
of_thermal_is_trip_valid() by thermal_zone_get_trip().

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/thermal/samsung/exynos_tmu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 91e6860b5ec4..34b460092308 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -554,13 +554,14 @@ static void exynos4210_tmu_control(struct platform_device *pdev, bool on)
 {
 	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
 	struct thermal_zone_device *tz = data->tzd;
+	struct thermal_trip trip;
 	unsigned int con, interrupt_en = 0, i;
 
 	con = get_con_reg(data, readl(data->base + EXYNOS_TMU_REG_CONTROL));
 
 	if (on) {
 		for (i = 0; i < data->ntrip; i++) {
-			if (!of_thermal_is_trip_valid(tz, i))
+			if (thermal_zone_get_trip(tz, i, &trip))
 				continue;
 
 			interrupt_en |=
@@ -584,13 +585,14 @@ static void exynos5433_tmu_control(struct platform_device *pdev, bool on)
 {
 	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
 	struct thermal_zone_device *tz = data->tzd;
+	struct thermal_trip trip;
 	unsigned int con, interrupt_en = 0, pd_det_en, i;
 
 	con = get_con_reg(data, readl(data->base + EXYNOS_TMU_REG_CONTROL));
 
 	if (on) {
 		for (i = 0; i < data->ntrip; i++) {
-			if (!of_thermal_is_trip_valid(tz, i))
+			if (thermal_zone_get_trip(tz, i, &trip))
 				continue;
 
 			interrupt_en |=
@@ -615,13 +617,14 @@ static void exynos7_tmu_control(struct platform_device *pdev, bool on)
 {
 	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
 	struct thermal_zone_device *tz = data->tzd;
+	struct thermal_trip trip;
 	unsigned int con, interrupt_en = 0, i;
 
 	con = get_con_reg(data, readl(data->base + EXYNOS_TMU_REG_CONTROL));
 
 	if (on) {
 		for (i = 0; i < data->ntrip; i++) {
-			if (!of_thermal_is_trip_valid(tz, i))
+			if (thermal_zone_get_trip(tz, i, &trip))
 				continue;
 
 			interrupt_en |=
-- 
2.34.1

