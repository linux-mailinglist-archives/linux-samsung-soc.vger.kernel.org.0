Return-Path: <linux-samsung-soc+bounces-3522-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E4445911681
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 21 Jun 2024 01:13:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 674731F23224
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 20 Jun 2024 23:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A136114F9C8;
	Thu, 20 Jun 2024 23:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zLoT0FUk"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888331459F2
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2024 23:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718925224; cv=none; b=hro5D/WvIdUKQiioEb9MhrTVSTONBk4xTUAbY8emUD1k2B6k+n27AFy+EuhSG6Y69y9PUxeMOIpXXTytVF088ZkALvoLcKqwovR1GcQtA0RCG2+i+v6UFcsOTTJ4covARVyYuhoMtctLVNS+SXfPDPau2zZrEpRSmVFL0oW2p90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718925224; c=relaxed/simple;
	bh=0NJAlAhjPxHb78Pwy3uSoG6ChmdliSLy1tTMW6140b4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tpe+6Z/33Mra2LMSnNF9KkbxGZIfvtnH3V1VR7JXeoXlQiAc1nSLTG0myhzD3AFe+m/6ZfGkTeemfivFkQ9b21BkpuM1/UqXSudmATJmfRKa0IQTpq6UgPNruNBkrBYqXjFKUMPVWAao0eTQ4LYbFn00oFs5mCtMwW9I5StsuZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zLoT0FUk; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3d23db75f5cso782083b6e.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2024 16:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718925221; x=1719530021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BATlvT+ON6RviBgwB4syCf5hzbCPLHDaJ0daEPb1cT8=;
        b=zLoT0FUkKhmjWtlgiQeg5Law8XfyukHjyp+Y7PFSXQQAGp+mZdhFd4ltroqv+Wq8V5
         9mfmi4SCqZuswGzfIzZXHpBOuetTwfbr3BOtPjvJhOB3tzIn7sxQPe+Vg8xoOxl+mSmI
         O4/cY2GafsJ83mxjgOCy24HG2JTxyJpAUbYfWUPbr1kRZhQEI43IXxWPdKygWhSuFqjk
         rvZx2DeXuv4Pv3cmv1/H4TLR+VdNnntWL3xdw3Wbd5G5Ei9/LPj/nj8WTlci4DBA3D7i
         J+XuhAYj0T3NTcgnlLUgw7ha/+ELwEAI1PK77owc4BKA8MDHq5IaCnKklERXbCjGaBW2
         wvfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718925221; x=1719530021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BATlvT+ON6RviBgwB4syCf5hzbCPLHDaJ0daEPb1cT8=;
        b=WoLlwprvNu1badtvwhSAwm2vDu5XyfaONBXRQ5NK0yo5gDU7WwRGdI62J3BRXcsWcu
         TIm83hmVQmUYrbADyBkdfOn8EjI98rGM9ks3DomqNzHp1Nid4BeD1vLh5OTMB+fF2e/N
         FX+rLRAN+aHp1s0dOLO23ElAC68EEpGyjHXjRyj8r7a4gi4rCFm3YsXQAcLh1oT00Xhm
         EEaVE1UdAaXVlMDGbV9tren+RmFFnXfUV15A+kPjCinRrt1JqSe0NsbuvM2Q7GTEGZpi
         k+f9kAHyRG3+gIH44J1mHuRs1jF5iAl0nKk/xtSPmp5kUzW/02YxCkKmv71FRbSfP8DS
         rKQg==
X-Forwarded-Encrypted: i=1; AJvYcCWyGDuNAwSi5EyP4KQXavrS9wWbuQ6/2Hy3gU4fcU5IEe712ltCpDRwaUMhHoE+ed2bYHiUEclNswozb9g4YaFCNARFrnYygKFblouJZRJTtdM=
X-Gm-Message-State: AOJu0YwGu4uJ+h4xFRX3hnorij8KvUTJ6WVYaGbNxeFjhkOWiSsqeWxt
	lO+i7ORqpae/ML6NecTFbS0IWg9WL26Aua11vx46qE56axzl4dJ91PiBy7E/XAiPgb2hVcmQBFt
	S
X-Google-Smtp-Source: AGHT+IEKb6IknyNKfozPN/QAZLLLGaOcrLym6h7VLNCVPFwfAvcGLmQyegTh/tAgk3vnZ27Ac09bFw==
X-Received: by 2002:a05:6808:2391:b0:3d2:2f52:c617 with SMTP id 5614622812f47-3d51baf8f68mr8339992b6e.47.1718925221409;
        Thu, 20 Jun 2024 16:13:41 -0700 (PDT)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d5344de334sm86675b6e.8.2024.06.20.16.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 16:13:41 -0700 (PDT)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Anand Moon <linux.amoon@gmail.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] hwrng: exynos: Improve coding style
Date: Thu, 20 Jun 2024 18:13:35 -0500
Message-Id: <20240620231339.1574-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240620231339.1574-1-semen.protsenko@linaro.org>
References: <20240620231339.1574-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix obvious style issues. Some of those were found with checkpatch, and
some just contradict the kernel coding style guide.

No functional change.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Łukasz Stelmach <l.stelmach@samsung.com>
---
Changes in v3:
  - Added '\n' in dev_err("clock divider too large")
  - Added A-b tag from Łukasz

Changes in v2:
  - Added Krzysztof's R-b tag

 drivers/char/hw_random/exynos-trng.c | 63 +++++++++++++---------------
 1 file changed, 30 insertions(+), 33 deletions(-)

diff --git a/drivers/char/hw_random/exynos-trng.c b/drivers/char/hw_random/exynos-trng.c
index 0ed5d22fe667..266bdad84f3c 100644
--- a/drivers/char/hw_random/exynos-trng.c
+++ b/drivers/char/hw_random/exynos-trng.c
@@ -23,45 +23,41 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 
-#define EXYNOS_TRNG_CLKDIV         (0x0)
-
-#define EXYNOS_TRNG_CTRL           (0x20)
-#define EXYNOS_TRNG_CTRL_RNGEN     BIT(31)
-
-#define EXYNOS_TRNG_POST_CTRL      (0x30)
-#define EXYNOS_TRNG_ONLINE_CTRL    (0x40)
-#define EXYNOS_TRNG_ONLINE_STAT    (0x44)
-#define EXYNOS_TRNG_ONLINE_MAXCHI2 (0x48)
-#define EXYNOS_TRNG_FIFO_CTRL      (0x50)
-#define EXYNOS_TRNG_FIFO_0         (0x80)
-#define EXYNOS_TRNG_FIFO_1         (0x84)
-#define EXYNOS_TRNG_FIFO_2         (0x88)
-#define EXYNOS_TRNG_FIFO_3         (0x8c)
-#define EXYNOS_TRNG_FIFO_4         (0x90)
-#define EXYNOS_TRNG_FIFO_5         (0x94)
-#define EXYNOS_TRNG_FIFO_6         (0x98)
-#define EXYNOS_TRNG_FIFO_7         (0x9c)
-#define EXYNOS_TRNG_FIFO_LEN       (8)
-#define EXYNOS_TRNG_CLOCK_RATE     (500000)
-
+#define EXYNOS_TRNG_CLKDIV		0x0
+
+#define EXYNOS_TRNG_CTRL		0x20
+#define EXYNOS_TRNG_CTRL_RNGEN		BIT(31)
+
+#define EXYNOS_TRNG_POST_CTRL		0x30
+#define EXYNOS_TRNG_ONLINE_CTRL		0x40
+#define EXYNOS_TRNG_ONLINE_STAT		0x44
+#define EXYNOS_TRNG_ONLINE_MAXCHI2	0x48
+#define EXYNOS_TRNG_FIFO_CTRL		0x50
+#define EXYNOS_TRNG_FIFO_0		0x80
+#define EXYNOS_TRNG_FIFO_1		0x84
+#define EXYNOS_TRNG_FIFO_2		0x88
+#define EXYNOS_TRNG_FIFO_3		0x8c
+#define EXYNOS_TRNG_FIFO_4		0x90
+#define EXYNOS_TRNG_FIFO_5		0x94
+#define EXYNOS_TRNG_FIFO_6		0x98
+#define EXYNOS_TRNG_FIFO_7		0x9c
+#define EXYNOS_TRNG_FIFO_LEN		8
+#define EXYNOS_TRNG_CLOCK_RATE		500000
 
 struct exynos_trng_dev {
-	struct device    *dev;
-	void __iomem     *mem;
-	struct clk       *clk;
-	struct hwrng rng;
+	struct device	*dev;
+	void __iomem	*mem;
+	struct clk	*clk;
+	struct hwrng	rng;
 };
 
 static int exynos_trng_do_read(struct hwrng *rng, void *data, size_t max,
 			       bool wait)
 {
-	struct exynos_trng_dev *trng;
+	struct exynos_trng_dev *trng = (struct exynos_trng_dev *)rng->priv;
 	int val;
 
 	max = min_t(size_t, max, (EXYNOS_TRNG_FIFO_LEN * 4));
-
-	trng = (struct exynos_trng_dev *)rng->priv;
-
 	writel_relaxed(max * 8, trng->mem + EXYNOS_TRNG_FIFO_CTRL);
 	val = readl_poll_timeout(trng->mem + EXYNOS_TRNG_FIFO_CTRL, val,
 				 val == 0, 200, 1000000);
@@ -87,7 +83,7 @@ static int exynos_trng_init(struct hwrng *rng)
 	 */
 	val = sss_rate / (EXYNOS_TRNG_CLOCK_RATE * 2);
 	if (val > 0x7fff) {
-		dev_err(trng->dev, "clock divider too large: %d", val);
+		dev_err(trng->dev, "clock divider too large: %d\n", val);
 		return -ERANGE;
 	}
 	val = val << 1;
@@ -122,7 +118,7 @@ static int exynos_trng_probe(struct platform_device *pdev)
 
 	trng->rng.init = exynos_trng_init;
 	trng->rng.read = exynos_trng_do_read;
-	trng->rng.priv = (unsigned long) trng;
+	trng->rng.priv = (unsigned long)trng;
 
 	platform_set_drvdata(pdev, trng);
 	trng->dev = &pdev->dev;
@@ -175,7 +171,7 @@ static int exynos_trng_probe(struct platform_device *pdev)
 
 static void exynos_trng_remove(struct platform_device *pdev)
 {
-	struct exynos_trng_dev *trng =  platform_get_drvdata(pdev);
+	struct exynos_trng_dev *trng = platform_get_drvdata(pdev);
 
 	clk_disable_unprepare(trng->clk);
 
@@ -204,7 +200,7 @@ static int exynos_trng_resume(struct device *dev)
 }
 
 static DEFINE_SIMPLE_DEV_PM_OPS(exynos_trng_pm_ops, exynos_trng_suspend,
-			 exynos_trng_resume);
+				exynos_trng_resume);
 
 static const struct of_device_id exynos_trng_dt_match[] = {
 	{
@@ -225,6 +221,7 @@ static struct platform_driver exynos_trng_driver = {
 };
 
 module_platform_driver(exynos_trng_driver);
+
 MODULE_AUTHOR("Łukasz Stelmach");
 MODULE_DESCRIPTION("H/W TRNG driver for Exynos chips");
 MODULE_LICENSE("GPL v2");
-- 
2.39.2


