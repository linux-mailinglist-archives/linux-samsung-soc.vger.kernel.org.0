Return-Path: <linux-samsung-soc+bounces-3741-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C71EB92BA48
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  9 Jul 2024 15:01:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA0991C22FCF
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  9 Jul 2024 13:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58F7169AE6;
	Tue,  9 Jul 2024 13:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZkzMVutB"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC0CC160877
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Jul 2024 13:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720530007; cv=none; b=B0/dF70g5Ev2+4CGRRBHtVQ3DbcFjTj3upd/vWV0iAN0laVB9Os4s+2meLWwFy1E+T+Jd/dPYEGF/d24ruNka4Icx4fR3eahVzAa9LlhFIb61DRYy4C+obbgDad77K+iaWbmv6Q/YBqGLDgdm0bURpKgUH7kX4U+26Tr0Y0tSPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720530007; c=relaxed/simple;
	bh=uAMTrcC0mVom85qx7RgLzbVpmGNoowEa4jhQ0iR1o5U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QRL8Xzcq/7RgHGlw+rV2VuaHrAmdeD+TaZXCXh1MVknueP7oTm9CNe3sYZogWreSillOPiHXXtRuRLD+6Wpa5qPrtvNd54/mpBRFHwLKlu9zbmMa6bnflNZKhY2CiS6VmtC02733XwqmsZHhZcRjTpLODVLA8WrcfJzAp+mqGnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZkzMVutB; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5854ac817afso6091377a12.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Jul 2024 06:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720530003; x=1721134803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ybUy1HdKJy0SC3jBHxTxEhNlXRYkfN8Lxd1LqP4XqS8=;
        b=ZkzMVutBjjYqq5Fe1r6tIXaVmNDF/1uirhsYHQNYPdl4C0zeBl2brP7qVphXOKz2UZ
         MK36gOmsusZ3qyyyfm7nvPSZZa7GBFXMjY+kuxssOc0BY3D1zdrEY3Xj9jUYGa5rSSWO
         hgHNYKA2Slx9rDmhUN4LShWghMy20+J7UTKGVVb9d+EPXN5Lv1M/wLIV/mhlq2IniYQK
         aYbHJRsW7ZlCwirBjhbwxcX4KYNL3az0GVSXgl4u1n2VcsgO3hCosZ6P662F/P/RKo9g
         dktiqbB9tY+inbO/THRndSJdjIxjJgN6juKMZMSvjpHykScfbH1ynDtnMeNPtwsk/RUR
         7rbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720530003; x=1721134803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ybUy1HdKJy0SC3jBHxTxEhNlXRYkfN8Lxd1LqP4XqS8=;
        b=kuFpQShmFGZOhBX8d6u0V1S8e+CLNZNvYoqjuU9lkfZBzl3ZiPNtduyzaXjwniYyZg
         qgpjEth2qiLWLKOqPuuVSQVEuOUZOqZxLyGmaSaQ5oKgC9DmfDGp0cNIdNsqWEshML64
         Jz80rQaTZxbjDf+AdB8RFFKtRCUxyQP5Z8w2eELoWdmAyY0HAcwQeVNCxjEwl3qF4S4e
         vvxMzph4/HG10kzO6ztEAbjTCZ2GeoCAg5IxwjhNRsdKUa2Haod3A0ag66rkjzkcIXeH
         NsOzoWa0+k28oz3B93O1vS+lfJ9oJv9HOx7NQALOj46gio7I36Hk4uxkpaZFKeZ6r0Zo
         OEzg==
X-Forwarded-Encrypted: i=1; AJvYcCV2dOq6lfM0mlBGvy27TX30f6eGsLHNB0FjyaWk85t1fPLezeLG0nOJRou7EprdRn5r7kc542ipB82I+mJ0tR4f44aLs6+nplG32Kb3zB8ivsM=
X-Gm-Message-State: AOJu0YyQAYK2x9jH9l7hD4LDqWWDmzWf0pS/s/7Mq4gA1NyvGFKAqfF7
	v8iOlCFpv7h5cNfSNwgWs3dX57JDvZ03wViYBMb0TfP8l7vjn2F16vFEJ63F3A0=
X-Google-Smtp-Source: AGHT+IEyRyFqkTwfhXvnWJMCl1GxNNv1QnYMVp0FnPJnRyxHf5vBWrGeQmH6Alt/59F10w37lZmLdg==
X-Received: by 2002:a17:906:e246:b0:a6e:fb9b:6769 with SMTP id a640c23a62f3a-a780b89ed2dmr142387766b.75.1720530003303;
        Tue, 09 Jul 2024 06:00:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6e157bsm76643166b.80.2024.07.09.06.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 06:00:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 09 Jul 2024 14:59:35 +0200
Subject: [PATCH 05/12] thermal/drivers/exynos: simplify with
 dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-thermal-probe-v1-5-241644e2b6e0@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2154;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=uAMTrcC0mVom85qx7RgLzbVpmGNoowEa4jhQ0iR1o5U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmjTRAedXAsDTOKwPCKtVeeBDQKl2GzAwF+mcHe
 Zf9U59jtBCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZo00QAAKCRDBN2bmhouD
 18itD/9VymA98RLj+xi7Rq9XMA4oXDVEu1ExLXuCaztzc4IZ5DS+lAXwA60GwTRyHSg12gpxodX
 wGTxdIsXm4HQC6MocbLKhr2jRUFWF5mhHytUE4GUUvT3J4F8fc73MSKOfMa/Le2ZZtj2uvOWBK0
 nKj10iZWWvmTqZTX/bn9itKX3HfshX45Y9TLwc2XuczRzqCelbhxTpqZ9N4vI2XdNOQ13wHXq7A
 LGO2+oDYGzzp4+2ilbIJWIQI598b0kyEqWyYaPtMWlOUVBZRBhOvAG0XnSaJjR0MWXBoNsO+JjJ
 q4EeU+DKyl/CQnkVw3p8pZrunC3T3EaDD8IknOUF2ZiJyuD37ahtQQvv7clKHWzWiQcAgCGazqp
 3X7JYISIOiq8eYnguL6kSLvstAD8KPb14mlScjX/J/vq74Cxp61tA8oPJl0ZwiUzpfGxuQvBTAs
 2vQV6Zv/GDJLqwG+vPPrFjVzCId3rhmIfdJCCkHZKopeHQmi/220/XRfXg4UYRvtpado0ozAEaa
 RBywtVfSWiQMs9txTHYbqQXEz73r3/K/wVi1+mHB6IE4ImufypcbAQLpgM7aqn3HZtprwamb2vZ
 RMBUeMTZ63ZOlIdRXRwjTG0SULdlI2iKGH2LOTd6JbxVw1wcsy3SS+FrtgP6uKkfxBb1NR0EnIf
 qywB8pGu0hH/zaQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Error handling in probe() can be a bit simpler with dev_err_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/samsung/exynos_tmu.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index 1152871cc982..96cffb2c44ba 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -1037,17 +1037,14 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 		return ret;
 
 	data->clk = devm_clk_get(dev, "tmu_apbif");
-	if (IS_ERR(data->clk)) {
-		dev_err(dev, "Failed to get clock\n");
-		return PTR_ERR(data->clk);
-	}
+	if (IS_ERR(data->clk))
+		return dev_err_probe(dev, PTR_ERR(data->clk), "Failed to get clock\n");
 
 	data->clk_sec = devm_clk_get(dev, "tmu_triminfo_apbif");
 	if (IS_ERR(data->clk_sec)) {
-		if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO) {
-			dev_err(dev, "Failed to get triminfo clock\n");
-			return PTR_ERR(data->clk_sec);
-		}
+		if (data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO)
+			return dev_err_probe(dev, PTR_ERR(data->clk_sec),
+					     "Failed to get triminfo clock\n");
 	} else {
 		ret = clk_prepare(data->clk_sec);
 		if (ret) {
@@ -1067,8 +1064,7 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	case SOC_ARCH_EXYNOS7:
 		data->sclk = devm_clk_get(dev, "tmu_sclk");
 		if (IS_ERR(data->sclk)) {
-			dev_err(dev, "Failed to get sclk\n");
-			ret = PTR_ERR(data->sclk);
+			ret = dev_err_probe(dev, PTR_ERR(data->sclk), "Failed to get sclk\n");
 			goto err_clk;
 		} else {
 			ret = clk_prepare_enable(data->sclk);
@@ -1091,9 +1087,7 @@ static int exynos_tmu_probe(struct platform_device *pdev)
 	data->tzd = devm_thermal_of_zone_register(dev, 0, data,
 						  &exynos_sensor_ops);
 	if (IS_ERR(data->tzd)) {
-		ret = PTR_ERR(data->tzd);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to register sensor: %d\n", ret);
+		ret = dev_err_probe(dev, PTR_ERR(data->tzd), "Failed to register sensor\n");
 		goto err_sclk;
 	}
 

-- 
2.43.0


