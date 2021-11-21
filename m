Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB03745850A
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 21 Nov 2021 17:57:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238610AbhKURAR (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 21 Nov 2021 12:00:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238535AbhKURAL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 21 Nov 2021 12:00:11 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4E0DC06175B
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 08:57:05 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id c32so69251867lfv.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 08:57:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z/c3L9M5Ma3qGpA3x9nAf88qy6S1a5Ba+x3EGekEYNU=;
        b=ryDCdJc9hb0A/0ZGJGlDJGPoqjeF9mAGZtnrVwQzNKPL1oPVx+GCbybbh6uxL8zz4k
         f2TzP/xbBcGixFRPE3grNCjfYm6NVzTxWMVRFrktsqIZF8vsr0VFrMoEJ33P8GFP+hoy
         lE1axRuXbtqQM6hMeSUCVg0ryf8nb4SKgiRfwdLK+c4GCbLN0Fnw0uG/c8aQrYE8DKlo
         N2zlcKybgQv2HveCZjR5pIEzzUQRyNIzx6SjpirOPJ02mOl8Sx4e/pw7pSg089gs6q3S
         GP+J1KOUxOaI/cv6W8sDj1/ESdDIGt++NpejwSMIbTjZnuyBAoaQD4YxOmvu8hjcc8+x
         Vp2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z/c3L9M5Ma3qGpA3x9nAf88qy6S1a5Ba+x3EGekEYNU=;
        b=55op1BM7AQY0BUNbaE2WQy5VbOjveoVVzq1TYyUM2HIpJOlkTk+YVxKlwr4JMq0XEU
         i/xG+D/0Cky9/SjNFA8d4RCOw+LNez4XsiWo9sRZxb6SE9p8J+0gnncJlaNlac+S1HAZ
         TsDaAy53afKt74oClrdScw1dIpNWVHCDP34tH4dSBo6Z1A4+on6xToZZyGIEBiRcjIN8
         VwksIzRS5wnRo7thHR0umysasr4cf+3B6pLwJa3sxcMA9bJEujuuR4+BSgksgP0Ep1+E
         wkf6OrUYHrc/K2QY5fc8VsDmEvCmQ1R6qpLVg/zKN02HyBjWy8+bJ36iNaO/OLeAfo+E
         RDrw==
X-Gm-Message-State: AOAM530Zg5KQ9U4v6WYp/HSjuOThFHi+cX1mKTQN3UuldXX+29pTzH1w
        sZ5XJR4ZKFXA3bHW1d0IjB8fLg==
X-Google-Smtp-Source: ABdhPJyZFCQa/4JlNn8zBn+MUxNVer9YyocYBwKUzGhV3smPZJHc/EX63jgW77Pr4BpgWj9lqhlF4A==
X-Received: by 2002:a19:614f:: with SMTP id m15mr49320314lfk.187.1637513824050;
        Sun, 21 Nov 2021 08:57:04 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id x4sm617665ljd.1.2021.11.21.08.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 08:57:03 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v4 09/12] watchdog: s3c2410: Cleanup PMU related code
Date:   Sun, 21 Nov 2021 18:56:44 +0200
Message-Id: <20211121165647.26706-10-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211121165647.26706-1-semen.protsenko@linaro.org>
References: <20211121165647.26706-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Now that PMU enablement code was extended for new Exynos SoCs, it
doesn't look very cohesive and consistent anymore. Do a bit of renaming,
grouping and style changes, to make it look good again. While at it, add
quirks documentation as well.

No functional change, just a refactoring commit.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes in v4:
  - Added R-b tag by Guenter Roeck

Changes in v3:
  - Added quirks documentation
  - Added R-b tag by Krzysztof Kozlowski

Changes in v2:
  - (none): it's a new patch

 drivers/watchdog/s3c2410_wdt.c | 83 ++++++++++++++++++++++++----------
 1 file changed, 58 insertions(+), 25 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index ec341c876225..f211be8bf976 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -56,17 +56,51 @@
 #define EXYNOS5_RST_STAT_REG_OFFSET		0x0404
 #define EXYNOS5_WDT_DISABLE_REG_OFFSET		0x0408
 #define EXYNOS5_WDT_MASK_RESET_REG_OFFSET	0x040c
-#define QUIRK_HAS_PMU_CONFIG			(1 << 0)
-#define QUIRK_HAS_RST_STAT			(1 << 1)
-#define QUIRK_HAS_WTCLRINT_REG			(1 << 2)
+
+/**
+ * Quirk flags for different Samsung watchdog IP-cores.
+ *
+ * This driver supports multiple Samsung SoCs, each of which might have
+ * different set of registers and features supported. As watchdog block
+ * sometimes requires modifying PMU registers for proper functioning, register
+ * differences in both watchdog and PMU IP-cores should be accounted for. Quirk
+ * flags described below serve the purpose of telling the driver about mentioned
+ * SoC traits, and can be specified in driver data for each particular supported
+ * device.
+ *
+ * %QUIRK_HAS_WTCLRINT_REG: Watchdog block has WTCLRINT register. It's used to
+ * clear the interrupt once the interrupt service routine is complete. It's
+ * write-only, writing any values to this register clears the interrupt, but
+ * reading is not permitted.
+ *
+ * %QUIRK_HAS_PMU_MASK_RESET: PMU block has the register for disabling/enabling
+ * WDT reset request. On old SoCs it's usually called MASK_WDT_RESET_REQUEST,
+ * new SoCs have CLUSTERx_NONCPU_INT_EN register, which 'mask_bit' value is
+ * inverted compared to the former one.
+ *
+ * %QUIRK_HAS_PMU_RST_STAT: PMU block has RST_STAT (reset status) register,
+ * which contains bits indicating the reason for most recent CPU reset. If
+ * present, driver will use this register to check if previous reboot was due to
+ * watchdog timer reset.
+ *
+ * %QUIRK_HAS_PMU_AUTO_DISABLE: PMU block has AUTOMATIC_WDT_RESET_DISABLE
+ * register. If 'mask_bit' bit is set, PMU will disable WDT reset when
+ * corresponding processor is in reset state.
+ *
+ * %QUIRK_HAS_PMU_CNT_EN: PMU block has some register (e.g. CLUSTERx_NONCPU_OUT)
+ * with "watchdog counter enable" bit. That bit should be set to make watchdog
+ * counter running.
+ */
+#define QUIRK_HAS_WTCLRINT_REG			(1 << 0)
+#define QUIRK_HAS_PMU_MASK_RESET		(1 << 1)
+#define QUIRK_HAS_PMU_RST_STAT			(1 << 2)
 #define QUIRK_HAS_PMU_AUTO_DISABLE		(1 << 3)
 #define QUIRK_HAS_PMU_CNT_EN			(1 << 4)
 
 /* These quirks require that we have a PMU register map */
-#define QUIRKS_HAVE_PMUREG			(QUIRK_HAS_PMU_CONFIG | \
-						 QUIRK_HAS_RST_STAT | \
-						 QUIRK_HAS_PMU_AUTO_DISABLE | \
-						 QUIRK_HAS_PMU_CNT_EN)
+#define QUIRKS_HAVE_PMUREG \
+	(QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_RST_STAT | \
+	 QUIRK_HAS_PMU_AUTO_DISABLE | QUIRK_HAS_PMU_CNT_EN)
 
 static bool nowayout	= WATCHDOG_NOWAYOUT;
 static int tmr_margin;
@@ -146,8 +180,8 @@ static const struct s3c2410_wdt_variant drv_data_exynos5250  = {
 	.mask_bit = 20,
 	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
 	.rst_stat_bit = 20,
-	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
-		  | QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_AUTO_DISABLE,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
@@ -156,8 +190,8 @@ static const struct s3c2410_wdt_variant drv_data_exynos5420 = {
 	.mask_bit = 0,
 	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
 	.rst_stat_bit = 9,
-	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
-		  | QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_AUTO_DISABLE,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynos7 = {
@@ -166,8 +200,8 @@ static const struct s3c2410_wdt_variant drv_data_exynos7 = {
 	.mask_bit = 23,
 	.rst_stat_reg = EXYNOS5_RST_STAT_REG_OFFSET,
 	.rst_stat_bit = 23,	/* A57 WDTRESET */
-	.quirks = QUIRK_HAS_PMU_CONFIG | QUIRK_HAS_RST_STAT \
-		  | QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_AUTO_DISABLE,
+	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET | \
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_AUTO_DISABLE,
 };
 
 static const struct of_device_id s3c2410_wdt_match[] = {
@@ -253,24 +287,24 @@ static int s3c2410wdt_enable_counter(struct s3c2410_wdt *wdt, bool en)
 	return ret;
 }
 
-static int s3c2410wdt_mask_and_disable_reset(struct s3c2410_wdt *wdt, bool mask)
+static int s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
 {
 	int ret;
 
 	if (wdt->drv_data->quirks & QUIRK_HAS_PMU_AUTO_DISABLE) {
-		ret = s3c2410wdt_disable_wdt_reset(wdt, mask);
+		ret = s3c2410wdt_disable_wdt_reset(wdt, !en);
 		if (ret < 0)
 			return ret;
 	}
 
-	if (wdt->drv_data->quirks & QUIRK_HAS_PMU_CONFIG) {
-		ret = s3c2410wdt_mask_wdt_reset(wdt, mask);
+	if (wdt->drv_data->quirks & QUIRK_HAS_PMU_MASK_RESET) {
+		ret = s3c2410wdt_mask_wdt_reset(wdt, !en);
 		if (ret < 0)
 			return ret;
 	}
 
 	if (wdt->drv_data->quirks & QUIRK_HAS_PMU_CNT_EN) {
-		ret = s3c2410wdt_enable_counter(wdt, !mask);
+		ret = s3c2410wdt_enable_counter(wdt, en);
 		if (ret < 0)
 			return ret;
 	}
@@ -531,7 +565,7 @@ static inline unsigned int s3c2410wdt_get_bootstatus(struct s3c2410_wdt *wdt)
 	unsigned int rst_stat;
 	int ret;
 
-	if (!(wdt->drv_data->quirks & QUIRK_HAS_RST_STAT))
+	if (!(wdt->drv_data->quirks & QUIRK_HAS_PMU_RST_STAT))
 		return 0;
 
 	ret = regmap_read(wdt->pmureg, wdt->drv_data->rst_stat_reg, &rst_stat);
@@ -672,7 +706,7 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_cpufreq;
 
-	ret = s3c2410wdt_mask_and_disable_reset(wdt, false);
+	ret = s3c2410wdt_enable(wdt, true);
 	if (ret < 0)
 		goto err_unregister;
 
@@ -707,7 +741,7 @@ static int s3c2410wdt_remove(struct platform_device *dev)
 	int ret;
 	struct s3c2410_wdt *wdt = platform_get_drvdata(dev);
 
-	ret = s3c2410wdt_mask_and_disable_reset(wdt, true);
+	ret = s3c2410wdt_enable(wdt, false);
 	if (ret < 0)
 		return ret;
 
@@ -724,8 +758,7 @@ static void s3c2410wdt_shutdown(struct platform_device *dev)
 {
 	struct s3c2410_wdt *wdt = platform_get_drvdata(dev);
 
-	s3c2410wdt_mask_and_disable_reset(wdt, true);
-
+	s3c2410wdt_enable(wdt, false);
 	s3c2410wdt_stop(&wdt->wdt_device);
 }
 
@@ -740,7 +773,7 @@ static int s3c2410wdt_suspend(struct device *dev)
 	wdt->wtcon_save = readl(wdt->reg_base + S3C2410_WTCON);
 	wdt->wtdat_save = readl(wdt->reg_base + S3C2410_WTDAT);
 
-	ret = s3c2410wdt_mask_and_disable_reset(wdt, true);
+	ret = s3c2410wdt_enable(wdt, false);
 	if (ret < 0)
 		return ret;
 
@@ -760,7 +793,7 @@ static int s3c2410wdt_resume(struct device *dev)
 	writel(wdt->wtdat_save, wdt->reg_base + S3C2410_WTCNT);/* Reset count */
 	writel(wdt->wtcon_save, wdt->reg_base + S3C2410_WTCON);
 
-	ret = s3c2410wdt_mask_and_disable_reset(wdt, false);
+	ret = s3c2410wdt_enable(wdt, true);
 	if (ret < 0)
 		return ret;
 
-- 
2.30.2

