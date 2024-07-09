Return-Path: <linux-samsung-soc+bounces-3740-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 310DA92BA42
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  9 Jul 2024 15:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A2D981F22331
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  9 Jul 2024 13:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6955315B0E1;
	Tue,  9 Jul 2024 13:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KpiwJ1l6"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CEC158D85
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Jul 2024 13:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720530005; cv=none; b=k6iKrwpFAX2MS+JMGButUKsoHD0rnuJCvoYsbuM+8ARcuIbt4zbTvij5qwDqywnjtgH8+mk+U0ZoOAKaDHYpTprvZbLcgdb09TWU3Yh/TCrGuoXGGKO7YlLdtCBCmob/fx9CBHybsEtvKRBFMk0p7vJOeLjDSFhWh1uBzBLKr0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720530005; c=relaxed/simple;
	bh=V4wSJ9/Zb1OXU1R9ZZfaP5PWSHjzT4TIbVQkHNfaWtE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YRnIFVX64YlZrFsYwdiJhZfWMbgtTjTB6hnDK8i3BGImz7ftjA1lHZB1+paC5/l2Ez0B3FrzSLd+UajpMIsrnAStdl0iQ+YHvNiHQ2eztGcuBe6iesm5F7gxCWwC2iH6BNzqtf8/1GfCnL2GbhW1I5vuFFuv88PdXNKtOv4oyG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KpiwJ1l6; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a77e6dd7f72so335304766b.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Jul 2024 06:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720530002; x=1721134802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f78oiEcMG7OsR22tQ6+SmmwoeavBfLjWwNnYHK7srHU=;
        b=KpiwJ1l68eJOy+80k8UkatGSyep3AsMer89EKvJ6DC6qrRla1nFHW250Rxv2JqTzk4
         aoOYZ8Fq6ktI6P6mDUBA7ATWW4zbPSaqtcsdLbkAQLOKpS3fiwsZoDxIl4oF6WtmKv92
         1j7LgWkSWHFiKqOJpyJFkRCupncHzXSVA2RoWAmcmRPnkbI7D3zmhXxPdGFZ+mjNeJfd
         OskoY8QeP2j3QKlOIGebAE0Yuy/WkIY18/EaFgaPilzBPrvxTMMEfGM6EArtP58nXq/x
         WIpTQoJGoKzbZJhiV5AX8E0xR5prgA5d3mRJWoVJY621UylA27UVlFLnYr+m1zwQt9V8
         NhGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720530002; x=1721134802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f78oiEcMG7OsR22tQ6+SmmwoeavBfLjWwNnYHK7srHU=;
        b=rxmqN/C6GU1iXn70J78jAQggDjhTGQYgcTdvbBxHhZWR5wGFZ+Xe3iTbhbjuWvCZmM
         /VTM6/u1tZ9IZhOsjjI5vqpwo0Ad66NfpbepFVtzZWemjpVErKgFiHDSfdiJCjylvuGj
         PKnKExGSjLW5jZiKKE9vIzAQ12g8ZPmcpNs1lH6w/JVZPM0JQ1DEz5NXM8p23FLPyv6i
         mvSTN+WiUbMvAkRrHReDIfB1Em/rDLW4MLloPQy+XAYj09Qo38N/+PBighzxStXiWjGv
         NsYs4uJOAWFNneri5f1F0/3mNs7qFcjgb2SmkbvY2ub7UMf3g5QANS65IBlSm8gZaCm+
         wulw==
X-Forwarded-Encrypted: i=1; AJvYcCVwZLoCjrgnvUXGs7rKhQRL7oOO2LuSXNgghPEp/ZCcfBoRBx6Qu8l2flPbN43tsVNcF84BxvQ/Ygh65UjSNxteLt+wX2rK3TgE5KrOz2dJRyI=
X-Gm-Message-State: AOJu0YzwcU6L4O3S4kKiNdAqPnWMzVJouZ1mGavw/XRJm7tqFYk0yOlN
	tot/doP4DTYfrUUAbfSBm4E+6q+FuRBwT+EQBLmISwXUC2kGbeBbfBrfH3Vk3lE=
X-Google-Smtp-Source: AGHT+IEeriJvbTmGkLzoFhu4w4DX/KE/KgTI6bDgim7aEIkTDJf0fpBsm7D1mMLhV9g+9hF62pQ5nw==
X-Received: by 2002:a17:906:4713:b0:a75:4723:b3b3 with SMTP id a640c23a62f3a-a780b705254mr136181866b.44.1720530000690;
        Tue, 09 Jul 2024 06:00:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6e157bsm76643166b.80.2024.07.09.05.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 06:00:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 09 Jul 2024 14:59:34 +0200
Subject: [PATCH 04/12] thermal/drivers/exynos: simplify probe() with local
 dev variable
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-thermal-probe-v1-4-241644e2b6e0@linaro.org>
References: <20240709-thermal-probe-v1-0-241644e2b6e0@linaro.org>
In-Reply-To: <20240709-thermal-probe-v1-0-241644e2b6e0@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4669;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=V4wSJ9/Zb1OXU1R9ZZfaP5PWSHjzT4TIbVQkHNfaWtE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmjTQ/AnkEzKq5ROG0a+eokqfAmnj00xbIkiQ4a
 TFG6e2ZyWSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZo00PwAKCRDBN2bmhouD
 1yZiD/4jNvAShM4vglgexAc6XF/2hixi58swvYJA00t+uj23rUy04E4TT5ciStwziYrSXtyTYS2
 0ZILGpEelDV1fULI+qPc72lCRi/CsxEDWDVwbyz2vcmzrjpPg8TLVNEF2bDYMEzWZJuF3fcyJVg
 MArkSKydEbI8fK7VkN/oIypSNFYPLK1kX1O2kFB1MxqRBeYNlGxrJ5Cpi2E5B10JKTa2bWoq6Cl
 t5SKAgFs0pmuMaxbNkFk5M2kMv19vubS3mdRbTM0MAVpm+1ahnkR4ITwRWLn4Z45+mkD7Vq28PU
 IREO9oeydPTG2P8Qzy6GgWyqM0es0aTTqrKsYlhOUehuusp+fIScfz+4Dm+9RPT75gw6K7WG0Nu
 FM87LThd67ixjFpPpEz2Y5EWtbbNQhX654q1xukNTqfBgUuTkxRsm0FC3od7CR+B2EEoMCpKbhe
 FVSvaKDt1C9tqzJGPto4TKWlsjsZC0fBnhFdAuA5jxRV1nV0Oq6i9WozDtIEqRthg2XR/ACSylx
 feEUOeSiCcD7O30FLRBLUQlql/MieIi2CuvNFHrfQme6Ae0FmS2bWWUCBGOwGKk+QrNeMmS2BdD
 Cj7XmcbgfRI2bor7fZTkZIWy33PLEDmtlrIU9lJJKx1t30DFM2FMhVJjL13bf37N1kJbF5YF9nD
 HzUVw4zpL0aqBJg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Simplify the probe() function by using local 'dev' instead of
&pdev->dev.  While touching devm_kzalloc(), use preferred sizeof(*)
syntax.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/samsung/exynos_tmu.c | 42 +++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 6482513bfe66..1152871cc982 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -1004,11 +1004,11 @@ static const struct thermal_zone_device_ops exynos_sensor_ops = {
 
 static int exynos_tmu_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct exynos_tmu_data *data;
 	int ret;
 
-	data = devm_kzalloc(&pdev->dev, sizeof(struct exynos_tmu_data),
-					GFP_KERNEL);
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
@@ -1020,7 +1020,7 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	 * TODO: Add regulator as an SOC feature, so that regulator enable
 	 * is a compulsory call.
 	 */
-	ret = devm_regulator_get_enable_optional(&pdev->dev, "vtmu");
+	ret = devm_regulator_get_enable_optional(dev, "vtmu");
 	switch (ret) {
 	case 0:
 	case -ENODEV:
@@ -1028,8 +1028,7 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	case -EPROBE_DEFER:
 		return -EPROBE_DEFER;
 	default:
-		dev_err(&pdev->dev, "Failed to get enabled regulator: %d\n",
-			ret);
+		dev_err(dev, "Failed to get enabled regulator: %d\n", ret);
 		return ret;
 	}
 
@@ -1037,44 +1036,44 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	data->clk = devm_clk_get(&pdev->dev, "tmu_apbif");
+	data->clk = devm_clk_get(dev, "tmu_apbif");
 	if (IS_ERR(data->clk)) {
-		dev_err(&pdev->dev, "Failed to get clock\n");
+		dev_err(dev, "Failed to get clock\n");
 		return PTR_ERR(data->clk);
 	}
 
-	data->clk_sec = devm_clk_get(&pdev->dev, "tmu_triminfo_apbif");
+	data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
 	if (IS_ERR(data->clk_sec)) {
 		if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO) {
-			dev_err(&pdev->dev, "Failed to get triminfo clock\n");
+			dev_err(dev, "Failed to get triminfo clock\n");
 			return PTR_ERR(data->clk_sec);
 		}
 	} else {
 		ret = clk_prepare(data->clk_sec);
 		if (ret) {
-			dev_err(&pdev->dev, "Failed to get clock\n");
+			dev_err(dev, "Failed to get clock\n");
 			return ret;
 		}
 	}
 
 	ret = clk_prepare(data->clk);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to get clock\n");
+		dev_err(dev, "Failed to get clock\n");
 		goto err_clk_sec;
 	}
 
 	switch (data->soc) {
 	case SOC_ARCH_EXYNOS5433:
 	case SOC_ARCH_EXYNOS7:
-		data->sclk = devm_clk_get(&pdev->dev, "tmu_sclk");
+		data->sclk = devm_clk_get(dev, "tmu_sclk");
 		if (IS_ERR(data->sclk)) {
-			dev_err(&pdev->dev, "Failed to get sclk\n");
+			dev_err(dev, "Failed to get sclk\n");
 			ret = PTR_ERR(data->sclk);
 			goto err_clk;
 		} else {
 			ret = clk_prepare_enable(data->sclk);
 			if (ret) {
-				dev_err(&pdev->dev, "Failed to enable sclk\n");
+				dev_err(dev, "Failed to enable sclk\n");
 				goto err_clk;
 			}
 		}
@@ -1085,33 +1084,32 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 
 	ret = exynos_tmu_initialize(pdev);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to initialize TMU\n");
+		dev_err(dev, "Failed to initialize TMU\n");
 		goto err_sclk;
 	}
 
-	data->tzd = devm_thermal_of_zone_register(&pdev->dev, 0, data,
+	data->tzd = devm_thermal_of_zone_register(dev, 0, data,
 						  &exynos_sensor_ops);
 	if (IS_ERR(data->tzd)) {
 		ret = PTR_ERR(data->tzd);
 		if (ret != -EPROBE_DEFER)
-			dev_err(&pdev->dev, "Failed to register sensor: %d\n",
-				ret);
+			dev_err(dev, "Failed to register sensor: %d\n", ret);
 		goto err_sclk;
 	}
 
 	ret = exynos_thermal_zone_configure(pdev);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to configure the thermal zone\n");
+		dev_err(dev, "Failed to configure the thermal zone\n");
 		goto err_sclk;
 	}
 
-	ret = devm_request_threaded_irq(&pdev->dev, data->irq, NULL,
+	ret = devm_request_threaded_irq(dev, data->irq, NULL,
 					exynos_tmu_threaded_irq,
 					IRQF_TRIGGER_RISING
 						| IRQF_SHARED | IRQF_ONESHOT,
-					dev_name(&pdev->dev), data);
+					dev_name(dev), data);
 	if (ret) {
-		dev_err(&pdev->dev, "Failed to request irq: %d\n", data->irq);
+		dev_err(dev, "Failed to request irq: %d\n", data->irq);
 		goto err_sclk;
 	}
 

-- 
2.43.0


