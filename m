Return-Path: <linux-samsung-soc+bounces-3525-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FADB91168E
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 21 Jun 2024 01:14:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9551F1C22058
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 20 Jun 2024 23:14:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E17F153503;
	Thu, 20 Jun 2024 23:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cCzDoFSP"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD00214F9CC
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2024 23:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718925226; cv=none; b=KwtkEhYEjRlrb+gQyDbySiw/BJ51bckC2ViuhuybMRHYyxTFJs9SFwTQBy9ZbyCbcvFFsMeZkpfD1XBUhCZcwSMhkNW2U8U2l9rkXLgLgwGjLeb6cgEjcnnlaLw832wGfV8yknhuAQpzkRcqmSMSNQKnb3Osezu/Q1oOyM0sgdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718925226; c=relaxed/simple;
	bh=30eDQdfMwhvrBKYWwgNh+8f2Q3FWPQHYNWjPpfke1EQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t9WFSOU4cIwIYFqPl1fG6/hJGayHSDztwcPVAjygr0JbbOXDFT/v3e5dKNKd18essA4xwD2Am/9oEC6AOFuSXB/JKzFYM6aUJGLDrYd0UPWJ/85qBifzcCEh/v3InO3YGyomjnTyHch/u7W44JujBJPHGrK78CYle/+rHJNc60E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cCzDoFSP; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5c1acd482e4so767280eaf.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jun 2024 16:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718925224; x=1719530024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkNkM6mewnoLT1ZDzP6dyIrgO4uv3nwMETptakYX1vA=;
        b=cCzDoFSP6+D5BsEC9SIaxTQhlpqYQCpV3n3eczsiT+cJne7c48L6cwBIgKEt8ugvI9
         B4v+WlscflbHPTPoWTKQEFQOheQZJCiqRP1xXLH2kDmy1RPBooZ+wUwe1L2w3Qw8gsga
         uVHG93d7eBvFthDCJuxEUsG66vopvqseznf1dvXK8MMoE+U6QBSxf5YjjtEl1Vy7OGYL
         gu1Ymz3M2e+yOVCrzrU2DBqrR+mM7yVqH/8gLF0EaOrMvypK8vriEIag7zL6DVBBJ+O3
         TkqK9B+sgBVwgRmxslZbBi+TNM1WzVNVfGqW8umdkfOsp9UVDlTfuPQkXmKqdvDGfqMI
         9j/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718925224; x=1719530024;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkNkM6mewnoLT1ZDzP6dyIrgO4uv3nwMETptakYX1vA=;
        b=NjxfFGvfS5/jy7TnTFEw4/SoPIWZfvc1chljzsRtVctIHCt9pD3imIMErHpyvdx9NR
         BbaXDFsqvEagwA2qprGjxxDPF3YS1Fk7TdqOv51KAkQ98PQ8rFNgdEKf6s2vj56lhF/e
         ALsmRM4EelSAUMeHtdyLGXy0jDCBqDlbU8gQB55CgbJU7xi6FgTVv5BQWkEGuzdkks9a
         Grqv8rYOSX/DmqFWHXInbhCP0dxIcSeeJUUn9zKRnOU0fajYXbu55vEEFVYMdcD2NeS4
         bLMv6f0GWTobTdocRAtM6RLlNzv+T/CyeRgbf2l9MdVB2qKhvI7dC/pItqxqvAXbqkCR
         VSxA==
X-Forwarded-Encrypted: i=1; AJvYcCWVE9rIGWZN1sgEz+ETkt/sjPIaRo/KUWRTkWc+sisf6lT2d/YrPLxrwvCQ0plovjux1uVnUf6wF+03b+rnVcQhrLve31MUTE1SPaupGDkJKWg=
X-Gm-Message-State: AOJu0YydT8EbrsWQtnYSbII04kAwdaqOyYUVQWne96sKh+7B92JlsLOR
	AI2TZSQKiFPxbLCkMRXVgF1B7bDfSgxswy8zH+V46UN1pR3Jscs8i3n+VgfumaE=
X-Google-Smtp-Source: AGHT+IGfkOlBFdyPdZRGs6qV8pLK9RhP7EnEMBcc7d5J9xrNECGWhpxHFFlYHN0jJINI3/NMS9s1qA==
X-Received: by 2002:a4a:3c11:0:b0:5bb:1ae0:17f0 with SMTP id 006d021491bc7-5c1ba65aa73mr5170181eaf.6.1718925223835;
        Thu, 20 Jun 2024 16:13:43 -0700 (PDT)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5c1d6b7d691sm22699eaf.4.2024.06.20.16.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 16:13:43 -0700 (PDT)
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
Subject: [PATCH v3 5/6] hwrng: exynos: Add SMC based TRNG operation
Date: Thu, 20 Jun 2024 18:13:38 -0500
Message-Id: <20240620231339.1574-6-semen.protsenko@linaro.org>
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

On some Exynos chips like Exynos850 the access to Security Sub System
(SSS) registers is protected with TrustZone, and therefore only possible
from EL3 monitor software. The Linux kernel is running in EL1, so the
only way for the driver to obtain TRNG data is via SMC calls to EL3
monitor. Implement such SMC operation and use it when EXYNOS_SMC flag is
set in the corresponding chip driver data.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes in v3:
  - Added appropriate error messages for the case when init SMC command fails

Changes in v2:
  - Used the "reversed Christmas tree" style in the variable declaration
    block in exynos_trng_do_read_smc()
  - Renamed .quirks to .flags in the driver structure
  - Added Krzysztof's R-b tag

 drivers/char/hw_random/exynos-trng.c | 140 +++++++++++++++++++++++++--
 1 file changed, 130 insertions(+), 10 deletions(-)

diff --git a/drivers/char/hw_random/exynos-trng.c b/drivers/char/hw_random/exynos-trng.c
index 6ef2ee6c9804..9fa30583cc86 100644
--- a/drivers/char/hw_random/exynos-trng.c
+++ b/drivers/char/hw_random/exynos-trng.c
@@ -10,6 +10,7 @@
  * Krzysztof Kozłowski <krzk@kernel.org>
  */
 
+#include <linux/arm-smccc.h>
 #include <linux/clk.h>
 #include <linux/crypto.h>
 #include <linux/delay.h>
@@ -22,6 +23,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 
 #define EXYNOS_TRNG_CLKDIV		0x0
 
@@ -44,16 +46,41 @@
 #define EXYNOS_TRNG_FIFO_LEN		8
 #define EXYNOS_TRNG_CLOCK_RATE		500000
 
+/* Driver feature flags */
+#define EXYNOS_SMC			BIT(0)
+
+#define EXYNOS_SMC_CALL_VAL(func_num)			\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,		\
+			   ARM_SMCCC_SMC_32,		\
+			   ARM_SMCCC_OWNER_SIP,		\
+			   func_num)
+
+/* SMC command for DTRNG access */
+#define SMC_CMD_RANDOM			EXYNOS_SMC_CALL_VAL(0x1012)
+
+/* SMC_CMD_RANDOM: arguments */
+#define HWRNG_INIT			0x0
+#define HWRNG_EXIT			0x1
+#define HWRNG_GET_DATA			0x2
+#define HWRNG_RESUME			0x3
+
+/* SMC_CMD_RANDOM: return values */
+#define HWRNG_RET_OK			0x0
+#define HWRNG_RET_RETRY_ERROR		0x2
+
+#define HWRNG_MAX_TRIES			100
+
 struct exynos_trng_dev {
 	struct device	*dev;
 	void __iomem	*mem;
 	struct clk	*clk;	/* operating clock */
 	struct clk	*pclk;	/* bus clock */
 	struct hwrng	rng;
+	unsigned long	flags;
 };
 
-static int exynos_trng_do_read(struct hwrng *rng, void *data, size_t max,
-			       bool wait)
+static int exynos_trng_do_read_reg(struct hwrng *rng, void *data, size_t max,
+				   bool wait)
 {
 	struct exynos_trng_dev *trng = (struct exynos_trng_dev *)rng->priv;
 	int val;
@@ -70,7 +97,40 @@ static int exynos_trng_do_read(struct hwrng *rng, void *data, size_t max,
 	return max;
 }
 
-static int exynos_trng_init(struct hwrng *rng)
+static int exynos_trng_do_read_smc(struct hwrng *rng, void *data, size_t max,
+				   bool wait)
+{
+	struct arm_smccc_res res;
+	unsigned int copied = 0;
+	u32 *buf = data;
+	int tries = 0;
+
+	while (copied < max) {
+		arm_smccc_smc(SMC_CMD_RANDOM, HWRNG_GET_DATA, 0, 0, 0, 0, 0, 0,
+			      &res);
+		switch (res.a0) {
+		case HWRNG_RET_OK:
+			*buf++ = res.a2;
+			*buf++ = res.a3;
+			copied += 8;
+			tries = 0;
+			break;
+		case HWRNG_RET_RETRY_ERROR:
+			if (!wait)
+				return copied;
+			if (++tries >= HWRNG_MAX_TRIES)
+				return copied;
+			cond_resched();
+			break;
+		default:
+			return -EIO;
+		}
+	}
+
+	return copied;
+}
+
+static int exynos_trng_init_reg(struct hwrng *rng)
 {
 	struct exynos_trng_dev *trng = (struct exynos_trng_dev *)rng->priv;
 	unsigned long sss_rate;
@@ -103,6 +163,24 @@ static int exynos_trng_init(struct hwrng *rng)
 	return 0;
 }
 
+static int exynos_trng_init_smc(struct hwrng *rng)
+{
+	struct exynos_trng_dev *trng = (struct exynos_trng_dev *)rng->priv;
+	struct arm_smccc_res res;
+	int ret = 0;
+
+	arm_smccc_smc(SMC_CMD_RANDOM, HWRNG_INIT, 0, 0, 0, 0, 0, 0, &res);
+	if (res.a0 != HWRNG_RET_OK) {
+		dev_err(trng->dev, "SMC command for TRNG init failed (%d)\n",
+			(int)res.a0);
+		ret = -EIO;
+	}
+	if ((int)res.a0 == -1)
+		dev_info(trng->dev, "Make sure LDFW is loaded by your BL\n");
+
+	return ret;
+}
+
 static int exynos_trng_probe(struct platform_device *pdev)
 {
 	struct exynos_trng_dev *trng;
@@ -112,21 +190,29 @@ static int exynos_trng_probe(struct platform_device *pdev)
 	if (!trng)
 		return ret;
 
+	platform_set_drvdata(pdev, trng);
+	trng->dev = &pdev->dev;
+
+	trng->flags = (unsigned long)device_get_match_data(&pdev->dev);
+
 	trng->rng.name = devm_kstrdup(&pdev->dev, dev_name(&pdev->dev),
 				      GFP_KERNEL);
 	if (!trng->rng.name)
 		return ret;
 
-	trng->rng.init = exynos_trng_init;
-	trng->rng.read = exynos_trng_do_read;
 	trng->rng.priv = (unsigned long)trng;
 
-	platform_set_drvdata(pdev, trng);
-	trng->dev = &pdev->dev;
+	if (trng->flags & EXYNOS_SMC) {
+		trng->rng.init = exynos_trng_init_smc;
+		trng->rng.read = exynos_trng_do_read_smc;
+	} else {
+		trng->rng.init = exynos_trng_init_reg;
+		trng->rng.read = exynos_trng_do_read_reg;
 
-	trng->mem = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(trng->mem))
-		return PTR_ERR(trng->mem);
+		trng->mem = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(trng->mem))
+			return PTR_ERR(trng->mem);
+	}
 
 	pm_runtime_enable(&pdev->dev);
 	ret = pm_runtime_resume_and_get(&pdev->dev);
@@ -170,12 +256,31 @@ static int exynos_trng_probe(struct platform_device *pdev)
 
 static void exynos_trng_remove(struct platform_device *pdev)
 {
+	struct exynos_trng_dev *trng = platform_get_drvdata(pdev);
+
+	if (trng->flags & EXYNOS_SMC) {
+		struct arm_smccc_res res;
+
+		arm_smccc_smc(SMC_CMD_RANDOM, HWRNG_EXIT, 0, 0, 0, 0, 0, 0,
+			      &res);
+	}
+
 	pm_runtime_put_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 
 static int exynos_trng_suspend(struct device *dev)
 {
+	struct exynos_trng_dev *trng = dev_get_drvdata(dev);
+	struct arm_smccc_res res;
+
+	if (trng->flags & EXYNOS_SMC) {
+		arm_smccc_smc(SMC_CMD_RANDOM, HWRNG_EXIT, 0, 0, 0, 0, 0, 0,
+			      &res);
+		if (res.a0 != HWRNG_RET_OK)
+			return -EIO;
+	}
+
 	pm_runtime_put_sync(dev);
 
 	return 0;
@@ -183,6 +288,7 @@ static int exynos_trng_suspend(struct device *dev)
 
 static int exynos_trng_resume(struct device *dev)
 {
+	struct exynos_trng_dev *trng = dev_get_drvdata(dev);
 	int ret;
 
 	ret = pm_runtime_resume_and_get(dev);
@@ -191,6 +297,20 @@ static int exynos_trng_resume(struct device *dev)
 		return ret;
 	}
 
+	if (trng->flags & EXYNOS_SMC) {
+		struct arm_smccc_res res;
+
+		arm_smccc_smc(SMC_CMD_RANDOM, HWRNG_RESUME, 0, 0, 0, 0, 0, 0,
+			      &res);
+		if (res.a0 != HWRNG_RET_OK)
+			return -EIO;
+
+		arm_smccc_smc(SMC_CMD_RANDOM, HWRNG_INIT, 0, 0, 0, 0, 0, 0,
+			      &res);
+		if (res.a0 != HWRNG_RET_OK)
+			return -EIO;
+	}
+
 	return 0;
 }
 
-- 
2.39.2


