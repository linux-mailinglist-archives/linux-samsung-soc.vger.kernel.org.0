Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6DF95806C3
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 25 Jul 2022 23:30:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237471AbiGYVaI (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 25 Jul 2022 17:30:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237537AbiGYV3S (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 25 Jul 2022 17:29:18 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB34F255A7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Jul 2022 14:28:08 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id b6so7614231wmq.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Jul 2022 14:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linexp-org.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5ySF+b0toG9yTVS3ACVkkX+IpUHvtJQ/EOrRyNhrRXg=;
        b=s6z7yoSV0rekPzE4RDgRa5y5JvTAMcHuEGlvc5yE01gfsHE/h+bkbXvzMdz4cv830a
         Yfd8XaLjC5vFDocgKRQ2ft27kY3GJj0TmnODwt2nEtVTEnAvOT5B9NDyjXG+U9wBTsEQ
         xYyNbPfWhrJlsQo2v9XeM3TZggY9EjSovtTF9kKqARweT1hvK4gU7f0Za9ZD5hFJ1qzP
         knYiTCcn+JyO8aHU/I2WFS7vDmh3GlpIWRMrYnz8rwouDDnAdwEYTEZs+hBFTOX+jjHP
         cn2MHZn5jEZ34FBOmrQh0LS7uARU/9FuQj0tN3Yd5TEMCIXkzZv8McogKvYj7dH/TShu
         Dg0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5ySF+b0toG9yTVS3ACVkkX+IpUHvtJQ/EOrRyNhrRXg=;
        b=4ldFzRuKWzogczTIBygWYXIzaxeNMQ2bGE5djjYHdeocTE8D6f6bg8aCsER5VTP5WS
         LFTr0S3bgNA+XSDQGNdXJXIoH5RYgbXcFbRdu53xeyYuHopKwhl/XS/XfkkeRuRvOCKA
         Sph341i8bTOI9vvYpuCDocYMxBxzkeWOTuVRwzJ3qX577lIC507rr1cjSfFP6uc9GZHX
         LqH8e/+0DTL5cyZ1gH09c7JS086Mhqx1Fcj5M3D3GF3Dbbnu5Hg4Yma3bTb8KcxoKwae
         +NG7KU9fLSy5xBdp0Rsiy8IUZQEQ5Fv5/O5IFW6Izec3wN/dhn/V8p+QoGct8LMxJWGe
         9EhQ==
X-Gm-Message-State: AJIora+50QzwAKzlEeZqXd+AwO94zjLRApV/fS49hI+wOpxQZ3pfwYCo
        lLtLEnWLGVPTb06D56VVXgmYSw==
X-Google-Smtp-Source: AGRyM1t7vq2vDZZFgYRcdteW9NvkgZMxCdv/oe6Ppug+VrhMCGytQcJClM5w0E1gbcjuWx6jpaQxEw==
X-Received: by 2002:a1c:2783:0:b0:3a2:fd82:bf46 with SMTP id n125-20020a1c2783000000b003a2fd82bf46mr22261412wmn.29.1658784488465;
        Mon, 25 Jul 2022 14:28:08 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:1780:8e54:dd38:6668])
        by smtp.gmail.com with ESMTPSA id r17-20020a5d52d1000000b0021d68a504cbsm12668772wrv.94.2022.07.25.14.28.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 14:28:08 -0700 (PDT)
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
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org (open list:SAMSUNG THERMAL DRIVER),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C,
        S5P AND EXYNOS ARM ARCHITECTURES)
Subject: [PATCH v2 30/32] thermal/drivers/samsung: Switch to new of thermal API
Date:   Mon, 25 Jul 2022 23:26:35 +0200
Message-Id: <20220725212637.2818207-31-daniel.lezcano@linexp.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220725212637.2818207-1-daniel.lezcano@linexp.org>
References: <20220725212637.2818207-1-daniel.lezcano@linexp.org>
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

