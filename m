Return-Path: <linux-samsung-soc+bounces-3742-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE4592BA4C
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  9 Jul 2024 15:01:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 83AA71F242C6
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  9 Jul 2024 13:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B2C16A95C;
	Tue,  9 Jul 2024 13:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a/9dXpZv"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C131684A0
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Jul 2024 13:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720530008; cv=none; b=lG1lHDJz16FcGhn2jVQij1KS7MHwV5rNkAS6U9U4qivOvA8MBuvpoNq0rHX66lY8cFGtzANbb4F90k2B13lyUPzxBiJgbGHaBoSlqK5bnJPLKYnHTq5ftpiwbQS6V0YpWRMhy3uccR9jgFt47P0IM19p7Nx/+Gsghyj7nI3H7TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720530008; c=relaxed/simple;
	bh=Q6+hCxLVHj6awAkKLZL/lFMRRO+jJnpOsXWYwuQTpws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oEKrmIBG8NMPKaXPfdQPOF5VPSxOpdozJ+thJrtSlUD3sRsXU36ROAoJT5Cwro8KRBGV0TlIF1dSxOY10qfpIyZlrExl8V03zyZF/9GWwgPZ/FS+p0U02BjXP6eoP1mi95/lQcjrRdK1uUG1T2FXM79Bx5XKZTRIE7UIXemEXDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a/9dXpZv; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a77e85cb9b4so295919066b.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Jul 2024 06:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720530005; x=1721134805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lpaXR5hesM6QQA2KpWYBxtlXYQSJSMhrc0LMERSNaQc=;
        b=a/9dXpZvNxJWD8QTEP1zIXzfzwag6hxxlNUDIHiFVChFQ9H8qg2U5f798WQYH/OeP8
         PKkDz3OTXbfD7uYawNToWSOLDR01wrf6hL1QNaHnkNzvOtSJRwv1sKx6w0rtmBEJ/qVt
         M7U5jddPmChESNn7877xh2YGwaCELcNSlOXbzXxa1xVvyKINHkPoDwMEpYvqHqhoYjul
         LxDeG9SK6C3jECR2TtsJTyI8POVY+Z+7VwZXiGl9eDvbKi7t8SJV8x8c1sJV8jYk6nGw
         WGStIUElfVIyQPVwCixYRnIYElzUwatVh4FgXv5/GfaHc4sJ2JHjIsP6qCwsAVo31Rps
         OIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720530005; x=1721134805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lpaXR5hesM6QQA2KpWYBxtlXYQSJSMhrc0LMERSNaQc=;
        b=Dl/uY5bflvXsvJgigmqpHcGxFQu4aLiIxr5TRZsjDaRRzqPEgRg5senQs2JeUsC+Om
         GW05e0bv57vmdytgWgdJamS3KRLvfavuAVmwIPvvtJU8HfSnUY+9DNtKTLHWWNf8qFsV
         Gaak1chzfIWCGrSTXQFkjkCV1pVNB3QpaiEv/0gMVPhAeMg8LbW0bnOW6Hu+cqVshEBa
         ygTgqYLL6Ktc9Sg5D4relBMJtVG+Q+ArOMcL51BISORDSSnJ0ceNSVBv+7XLeO+Ch7vC
         fD2BjrEbiU/79qjX0gt+p+qz0dheoBG6L7/Tey4h9Cqf+K2XyEVbTd1ufSFFq57Lzmtn
         Y4UQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3KHZxh0wYRHvpM45DqT/2BIF+NmKWU2gCIFm+CWgOw86eLMVlyLtHenqBIjRR3eOvsQXcJD20y/RQvI6lVbzS7oIJY5z4oIqyhddAXS+eBD8=
X-Gm-Message-State: AOJu0YyGQ/PeR8vYtGxK+U49WFB7KJwEdPairbr7fXFcYRMn7lHOLpCz
	wHFrxbt8pReZEHqhQmNvmDkwkzxmg49CG+rPrpEmCNsF2TBEZQufYSshFpyY704=
X-Google-Smtp-Source: AGHT+IFpuXSVDfR9zcYD6UEE6dUM0zQ38CBB1md2Ad0sjVV+v+MC1CRRqx3iEirLTHQ2eq8mi1TqYA==
X-Received: by 2002:a17:906:fb96:b0:a77:c26c:a56e with SMTP id a640c23a62f3a-a780b7053cfmr141321866b.45.1720530005087;
        Tue, 09 Jul 2024 06:00:05 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a6e157bsm76643166b.80.2024.07.09.06.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 06:00:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 09 Jul 2024 14:59:36 +0200
Subject: [PATCH 06/12] thermal/drivers/hisi: simplify with dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-thermal-probe-v1-6-241644e2b6e0@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Q6+hCxLVHj6awAkKLZL/lFMRRO+jJnpOsXWYwuQTpws=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmjTRBwaAjkvl6lx45yY9/ImDeEubME5uwgWFGE
 i+bNA0kPUGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZo00QQAKCRDBN2bmhouD
 11BuD/4vPwK3V9A2LjND5Im9CSALekgwK8+81reARKO6RvGE9eBpawhpL5BznjBw1QsJ6n5wEDW
 u4HfkL6X73SnVpVPx3wBkV55taP5y2WeYsDyuiSHFVYjPy+iGBCstOTmi+I2w9ep99Qoi+C4f0S
 saeTt6RowTWLn+n8PNcDYWh0bl6kkVTt25vdxaIEkifGnPnDCOUPrcA9eG0BzgEk4B1pXdyxQun
 xnzdYByJAnsbHiozgVSObIsmTDQfpk5guaL10G+OlcAWbN8L1i1pAukfDqQvcgRJGuAKviAWrkg
 EX+bMPSx0PZi2MtGkX53wq5+BHeGXMTuLFGuYXqXKE3i2FhBwAjY5wJp8+ay7pr3PVITVz4/5pD
 7bf+V8ig7bAjt2E7vXkYTf79XHF+bZZnmyyyOZfANe/PGCcn7TAS+WTz9KBuN2zDgnYHcpcnIZG
 il2JHZSSkpyLmdulaW1Zw9To9yd7c6+A3okG8069epEysKAZ90Jy+Vg7xOjiLCe0q5/n27wcgFv
 oh6z4UgCqokMVSzGM/BdzM5D1DhOqbjQ99uxdOBtm7s3jSZHxnXnl/4v2XW0SNCdrgze9x9ttdu
 /+Kw/YJn0iYsTK/MqqjfXF/gOCBGincfblbkRGlpqnqB25c0g8opnegbeXBSaEu0tf3nGxYLLZN
 Hj6BN/VzrNndFyw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Error handling in probe() can be a bit simpler with dev_err_probe().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/thermal/hisi_thermal.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/thermal/hisi_thermal.c b/drivers/thermal/hisi_thermal.c
index dd751ae63608..0eb657db62e4 100644
--- a/drivers/thermal/hisi_thermal.c
+++ b/drivers/thermal/hisi_thermal.c
@@ -388,15 +388,10 @@ static int hi6220_thermal_probe(struct hisi_thermal_data *data)
 {
 	struct platform_device *pdev = data->pdev;
 	struct device *dev = &pdev->dev;
-	int ret;
 
 	data->clk = devm_clk_get(dev, "thermal_clk");
-	if (IS_ERR(data->clk)) {
-		ret = PTR_ERR(data->clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get thermal clk: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(data->clk))
+		return dev_err_probe(dev, PTR_ERR(data->clk), "failed to get thermal clk\n");
 
 	data->sensor = devm_kzalloc(dev, sizeof(*data->sensor), GFP_KERNEL);
 	if (!data->sensor)

-- 
2.43.0


