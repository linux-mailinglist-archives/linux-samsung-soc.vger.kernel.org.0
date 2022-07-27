Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAEE25834A4
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 27 Jul 2022 23:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237432AbiG0VGS (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 27 Jul 2022 17:06:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237087AbiG0VFp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 27 Jul 2022 17:05:45 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F23506173C
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jul 2022 14:04:22 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id n185so10792309wmn.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jul 2022 14:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linexp-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rnCGi6xpPST6ZeDBqGy3tzDc5ZKe/PTe7JtrBaBAkJQ=;
        b=jKnz0njDpEzXq1qOrr+TJWGJdZvFvlo4FArE/EW5YE6q/mzqeKf1+4nbKUmMhOmI/s
         6qM40soN0NJHu1gP/4TUQFr5YNmPZKZWCH6V6Nd/8PJeiVG4WUqx/1T9HlF9iDXcobTp
         I5DwRgu1750bzLYhaJcGQVKxzEuKic5blAyJOrqX6mKIIWMXhlW1o99yTr5jAn7xSHXP
         Nft3zYxnjWvO5343SLrGAp+mqAl0dfJIgG5d2xG7RdArB81fzpxEJrWaOpDAOlyEp6/A
         O88QHHkclMjDzV8saCmLAh8L5LDAfxT7/KZLPrJjPWs+ZSdLy6OThfojI/OlzXEcsdI/
         13Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rnCGi6xpPST6ZeDBqGy3tzDc5ZKe/PTe7JtrBaBAkJQ=;
        b=kxt7zhGWJz1yt0y9Fehc+icBOKm+1WAcqSWVQGXvwEwywM240XvNV23PYDCNp8aO11
         VjsabKbrOpP6ZHBFouP53/J8gs9b/ZbkcXDlBihzhsBo3Y2Eq+i5m13ysCavTtwTGrTC
         oouVqDQNnHiMBHV7fqFRlnPeZRsbcgH1ZWDDx+4dog2gFhsFXqmDsL71UbyByRQPgUcv
         GhCzlXa6lZEqt4kaeCsSh2zQbyK6Tx+QmBpewFxb5ozXU+S7o8PAvHk3koA2LMThdfxy
         pMWZm9KonfUj4cbWoKqoGUQhPXrczxmdp9rbCC7Mg0XNhR3Q/GST5Rb1AOxLWdoiQbox
         Bn3Q==
X-Gm-Message-State: AJIora9Quy5IHuDqpbKUcd6lDZ0Shh5NPyWgbTNcdWuWi3bAbtJ5hmcf
        ql06HukOeSe5WRrL0HT7SrbpYw==
X-Google-Smtp-Source: AGRyM1szxiU43+kQ1HDC7fH8/tRvSPGut666rRtlFyYczLGGo4Q4HXzTxHqpQwtCpbqNSz4f8qKFHQ==
X-Received: by 2002:a05:600c:3ba3:b0:3a3:227b:f754 with SMTP id n35-20020a05600c3ba300b003a3227bf754mr4234756wms.64.1658955862418;
        Wed, 27 Jul 2022 14:04:22 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:65a8:ebd8:4098:d9d0])
        by smtp.gmail.com with ESMTPSA id h6-20020a05600c350600b003a38606385esm37908wmq.3.2022.07.27.14.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 14:04:22 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linexp.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     rui.zhang@intel.com, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, khilman@baylibre.com,
        abailon@baylibre.com, lukasz.luba@arm.com, broonie@kernel.org,
        damien.lemoal@opensource.wdc.com, heiko@sntech.de,
        hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
        talel@amazon.com, thierry.reding@gmail.com, digetx@gmail.com,
        jonathanh@nvidia.com, anarsoul@gmail.com, tiny.windzz@gmail.com,
        baolin.wang7@gmail.com, f.fainelli@gmail.com,
        bjorn.andersson@linaro.org, mcoquelin.stm32@gmail.com,
        glaroque@baylibre.com, miquel.raynal@bootlin.com,
        shawnguo@kernel.org, niklas.soderlund@ragnatech.se,
        matthias.bgg@gmail.com, j-keerthy@ti.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Amit Kucheria <amitk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C,
        S5P AND EXYNOS ARM ARCHITECTURES)
Subject: [PATCH v3 30/32] thermal/drivers/samsung: Switch to new of thermal API
Date:   Wed, 27 Jul 2022 23:02:51 +0200
Message-Id: <20220727210253.3794069-31-daniel.lezcano@linexp.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220727210253.3794069-1-daniel.lezcano@linexp.org>
References: <20220727210253.3794069-1-daniel.lezcano@linexp.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The thermal OF code has a new API allowing to migrate the OF
initialization to a simpler approach. The ops are no longer device
tree specific and are the generic ones provided by the core code.

Convert the ops to the thermal_zone_device_ops format and use the new
API to register the thermal zone with these generic ops.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linexp.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/samsung/exynos_tmu.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index f4ab4c5b4b62..5b1a8a1e193d 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -650,9 +650,9 @@ static void exynos7_tmu_control(struct platform_device *pdev, bool on)
 	writel(con, data->base + EXYNOS_TMU_REG_CONTROL);
 }
 
-static int exynos_get_temp(void *p, int *temp)
+static int exynos_get_temp(struct thermal_zone_device *tz, int *temp)
 {
-	struct exynos_tmu_data *data = p;
+	struct exynos_tmu_data *data = tz->devdata;
 	int value, ret = 0;
 
 	if (!data || !data->tmu_read)
@@ -728,9 +728,9 @@ static void exynos4412_tmu_set_emulation(struct exynos_tmu_data *data,
 	writel(val, data->base + emul_con);
 }
 
-static int exynos_tmu_set_emulation(void *drv_data, int temp)
+static int exynos_tmu_set_emulation(struct thermal_zone_device *tz, int temp)
 {
-	struct exynos_tmu_data *data = drv_data;
+	struct exynos_tmu_data *data = tz->devdata;
 	int ret = -EINVAL;
 
 	if (data->soc == SOC_ARCH_EXYNOS4210)
@@ -750,7 +750,7 @@ static int exynos_tmu_set_emulation(void *drv_data, int temp)
 }
 #else
 #define exynos4412_tmu_set_emulation NULL
-static int exynos_tmu_set_emulation(void *drv_data, int temp)
+static int exynos_tmu_set_emulation(struct thermal_zone *tz, int temp)
 	{ return -EINVAL; }
 #endif /* CONFIG_THERMAL_EMULATION */
 
@@ -997,7 +997,7 @@ static int exynos_map_dt_data(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct thermal_zone_of_device_ops exynos_sensor_ops = {
+static const struct thermal_zone_device_ops exynos_sensor_ops = {
 	.get_temp = exynos_get_temp,
 	.set_emul_temp = exynos_tmu_set_emulation,
 };
@@ -1091,8 +1091,8 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	 * data->tzd must be registered before calling exynos_tmu_initialize(),
 	 * requesting irq and calling exynos_tmu_control().
 	 */
-	data->tzd = thermal_zone_of_sensor_register(&pdev->dev, 0, data,
-						    &exynos_sensor_ops);
+	data->tzd = devm_thermal_of_zone_register(&pdev->dev, 0, data,
+						  &exynos_sensor_ops);
 	if (IS_ERR(data->tzd)) {
 		ret = PTR_ERR(data->tzd);
 		if (ret != -EPROBE_DEFER)
@@ -1104,21 +1104,19 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	ret = exynos_tmu_initialize(pdev);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to initialize TMU\n");
-		goto err_thermal;
+		goto err_sclk;
 	}
 
 	ret = devm_request_irq(&pdev->dev, data->irq, exynos_tmu_irq,
 		IRQF_TRIGGER_RISING | IRQF_SHARED, dev_name(&pdev->dev), data);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to request irq: %d\n", data->irq);
-		goto err_thermal;
+		goto err_sclk;
 	}
 
 	exynos_tmu_control(pdev, true);
 	return 0;
 
-err_thermal:
-	thermal_zone_of_sensor_unregister(&pdev->dev, data->tzd);
 err_sclk:
 	clk_disable_unprepare(data->sclk);
 err_clk:
@@ -1136,9 +1134,7 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 static int exynos_tmu_remove(struct platform_device *pdev)
 {
 	struct exynos_tmu_data *data = platform_get_drvdata(pdev);
-	struct thermal_zone_device *tzd = data->tzd;
 
-	thermal_zone_of_sensor_unregister(&pdev->dev, tzd);
 	exynos_tmu_control(pdev, false);
 
 	clk_disable_unprepare(data->sclk);
-- 
2.25.1

