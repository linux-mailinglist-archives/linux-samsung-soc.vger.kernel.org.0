Return-Path: <linux-samsung-soc+bounces-586-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E5680D169
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 11 Dec 2023 17:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3461B1C21407
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 11 Dec 2023 16:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEB654D593;
	Mon, 11 Dec 2023 16:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dyNzIuvI"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38866D2
	for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Dec 2023 08:24:33 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40c48d7a7a7so8951775e9.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Dec 2023 08:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702311871; x=1702916671; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9EoMc0LJN2cW+5Q5aC0JNLH7fMTVOl1UiwgXS6s9cls=;
        b=dyNzIuvItkAIIYXgI53PwEWaA/B2rnTK6+oAhZwGpSFCo32olfVv8bqmBavKjrKnsQ
         yyM0QXq5m3P+2fd/GwDpADa7/aWfhOiuUU9dE6rfaaXxUeLOYSyBvP3CqRF4kRqME3OR
         0Zf+LE2nD3IN8fIy5PB0XxQ2YPQdzA4/tbqVIt16o2TB1AX3CcW6fOoXkhSqOdW7M+32
         rM0kU03vis8GVTtW/wJR96l+XEVDujUBOHrZGOc8wCGjAzfEr27Jt6F0T7tnzXeJjOAW
         N8bfOXPAiJrQoaI5kVuDwpshPnD8yyyqAFIJI9Bl6odDrmPXAy/7tGbePzADn1ObSAOw
         DyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311871; x=1702916671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9EoMc0LJN2cW+5Q5aC0JNLH7fMTVOl1UiwgXS6s9cls=;
        b=QSBisOzJoX5PiOPLchvOsuYdMox5mvE2N0D2mAACB8WHeUsdr55LH1yCG1nF7WXRjI
         Ezl5YB0qCVkDMpXFgeV2+8M6dbMCsORz2aqLQGBnA1yHFkdAlPZ0vg7F1ragl2hX/J1h
         BYynycbFYFH3E0+U0MwthsDckR5jdkPO5HFVfJFH0rBSkLi9hUF3VrsFyePabeEsI3ov
         fnQO23cSjaCIjCjedgblITy3+VOVat+z8D47VDqX7rxQyZyV/psnRLY0P+Qoyi/k22xf
         RMwr/3lDGHUgyl61+YNn5cLWfvOWMhEARbApZJgmYCNqLoajDXtPEMEQFpYBm7UB5rv8
         radQ==
X-Gm-Message-State: AOJu0Yyq0MkD5Z03NUdfQmeTe3nkyMidFjrWCMk2MsPcXAczYdNqlJDQ
	Ye/+SHhnVF9eH2ECKNEbSz9HXQ==
X-Google-Smtp-Source: AGHT+IEcDXMRBChVf/ruGshwxCUUy0HpzNbE6jP+Z2Gf7NHHeS1bASus5hAj61+IVem8P/6qm/pdcg==
X-Received: by 2002:a05:6000:1282:b0:334:b26b:4477 with SMTP id f2-20020a056000128200b00334b26b4477mr2607553wrx.25.1702311871571;
        Mon, 11 Dec 2023 08:24:31 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-28-58.as13285.net. [92.29.28.58])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d58c4000000b0033333bee379sm8923103wrf.107.2023.12.11.08.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:24:31 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v7 12/16] watchdog: s3c2410_wdt: Add support for Google gs101 SoC
Date: Mon, 11 Dec 2023 16:23:27 +0000
Message-ID: <20231211162331.435900-13-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231211162331.435900-1-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds the compatibles and drvdata for the Google
gs101 SoC found in Pixel 6, Pixel 6a & Pixel 6 pro phones.

Similar to Exynos850 it has two watchdog instances, one for
each cluster and has some control bits in PMU registers.

gs101 also has the dbgack_mask bit in wtcon register, so
we also enable QUIRK_HAS_DBGACK_BIT.

Tested-by: Will McVicker <willmcvicker@google.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/watchdog/s3c2410_wdt.c | 49 ++++++++++++++++++++++++++++++----
 1 file changed, 44 insertions(+), 5 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index b7a03668f743..c3046610ab5d 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -69,6 +69,13 @@
 #define EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT	25
 #define EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT	24
 
+#define GS_CLUSTER0_NONCPU_OUT			0x1220
+#define GS_CLUSTER1_NONCPU_OUT			0x1420
+#define GS_CLUSTER0_NONCPU_INT_EN		0x1244
+#define GS_CLUSTER1_NONCPU_INT_EN		0x1444
+#define GS_CLUSTER2_NONCPU_INT_EN		0x1644
+#define GS_RST_STAT_REG_OFFSET			0x3B44
+
 /**
  * DOC: Quirk flags for different Samsung watchdog IP-cores
  *
@@ -270,7 +277,35 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
 };
 
+static const struct s3c2410_wdt_variant drv_data_gs101_cl0 = {
+	.mask_reset_reg = GS_CLUSTER0_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.mask_reset_inv = true,
+	.rst_stat_reg = GS_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = 0,
+	.cnt_en_reg = GS_CLUSTER0_NONCPU_OUT,
+	.cnt_en_bit = 8,
+	.quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET |
+		  QUIRK_HAS_PMU_CNT_EN | QUIRK_HAS_WTCLRINT_REG |
+		  QUIRK_HAS_DBGACK_BIT,
+};
+
+static const struct s3c2410_wdt_variant drv_data_gs101_cl1 = {
+	.mask_reset_reg = GS_CLUSTER1_NONCPU_INT_EN,
+	.mask_bit = 2,
+	.mask_reset_inv = true,
+	.rst_stat_reg = GS_RST_STAT_REG_OFFSET,
+	.rst_stat_bit = 1,
+	.cnt_en_reg = GS_CLUSTER1_NONCPU_OUT,
+	.cnt_en_bit = 7,
+	.quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET |
+		  QUIRK_HAS_PMU_CNT_EN | QUIRK_HAS_WTCLRINT_REG |
+		  QUIRK_HAS_DBGACK_BIT,
+};
+
 static const struct of_device_id s3c2410_wdt_match[] = {
+	{ .compatible = "google,gs101-wdt",
+	  .data = &drv_data_gs101_cl0 },
 	{ .compatible = "samsung,s3c2410-wdt",
 	  .data = &drv_data_s3c2410 },
 	{ .compatible = "samsung,s3c6410-wdt",
@@ -605,9 +640,10 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 	}
 
 #ifdef CONFIG_OF
-	/* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index */
+	/* Choose Exynos9 SoC family driver data w.r.t. cluster index */
 	if (variant == &drv_data_exynos850_cl0 ||
-	    variant == &drv_data_exynosautov9_cl0) {
+	    variant == &drv_data_exynosautov9_cl0 ||
+	    variant == &drv_data_gs101_cl0) {
 		u32 index;
 		int err;
 
@@ -620,9 +656,12 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
 		case 0:
 			break;
 		case 1:
-			variant = (variant == &drv_data_exynos850_cl0) ?
-				&drv_data_exynos850_cl1 :
-				&drv_data_exynosautov9_cl1;
+			if (variant == &drv_data_exynos850_cl0)
+				variant = &drv_data_exynos850_cl1;
+			else if (variant == &drv_data_exynosautov9_cl0)
+				variant = &drv_data_exynosautov9_cl1;
+			else if (variant == &drv_data_gs101_cl0)
+				variant = &drv_data_gs101_cl1;
 			break;
 		default:
 			return dev_err_probe(dev, -EINVAL, "wrong cluster index: %u\n", index);
-- 
2.43.0.472.g3155946c3a-goog


