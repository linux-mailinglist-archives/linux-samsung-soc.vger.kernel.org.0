Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1679C440E55
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 31 Oct 2021 13:22:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232223AbhJaMZK (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 31 Oct 2021 08:25:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232251AbhJaMZG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 31 Oct 2021 08:25:06 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12C3AC061714
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Oct 2021 05:22:35 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id z20so55285849edc.13
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Oct 2021 05:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=v1ALKVAV1JgdK4QzthVSLXM7sORd9wbh/mpPKizi5Uo=;
        b=CYLu6Q18vKqG9zCctDBW5P1RIyv8BqZ0+peJO/+wBtxj6zmB9y5aYxwvTLFZ9srb9v
         HqkcyJgtj3az0o0VfhVh/BDrrh/m6LcjxBB6IgPAICClma9dAqPLK+Vz08zo3EoBxeeD
         JTGHYaYhtHLd/uKBzlNVfbQ9P+W4d8WFFkYmBGIgmEyTOiUGPArKrv+HiuR/zVpd9viz
         f8A/SQFeKzXtykQpBeeM2uMjhAS0djRooQokWgvBBb8dMOhpk/bhfQbIFP3CV86Cz57z
         kXKhdxOF7Gtf21r0gUWkrDsbl6TCW5FsRzhWDthJBd7D8VPgJEABc4CRC2RBo3IRRnkb
         q/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=v1ALKVAV1JgdK4QzthVSLXM7sORd9wbh/mpPKizi5Uo=;
        b=My87PcgaydErUfsj6RHsfbOVTzrrC31NidkRsRHJTtERuYCCeXwqcpWlDwzg+8QDPc
         XFjd9qoWKo5nK/AtNSihfNPcsw+6Ku49+H/ZaH8ok+uV8FXqtF8+MEKGifaJunDtkZQw
         yXIOqR28H+LDuh6utOyljYM5N4T5MR2pBg7pMtDjzr7H54j1iwXp/YFDxWNdK3Mt0Svb
         zh8kFu45b4KX4hSesvoenn3zSardJTER2ColgFwM3oxhBJbUPmkzxc82ZkZWec6Ual5P
         fvwSbjUplBLB0SnGAdUlJ+8+uYJa518fiwgHU8Wk81TIUvm85RKdUR6T9zT2OyetExKr
         bjDA==
X-Gm-Message-State: AOAM530svprD1/hR0cCugWa07+wZgFjSCPlYH/4/1n+MJGiKhogpPkao
        uhHyqAjbO/p7wMnl1NuDO+QyaQ==
X-Google-Smtp-Source: ABdhPJwXtfLM7Ajx5Z4zIR6aPcQbqiOeQ+akbnsqup90cbqkdzuCTWR3eWVE9nlxk4QVZ0wotKC9TA==
X-Received: by 2002:a05:6402:1744:: with SMTP id v4mr22776981edx.366.1635682953656;
        Sun, 31 Oct 2021 05:22:33 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id x3sm7739235edd.67.2021.10.31.05.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Oct 2021 05:22:33 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 10/12] watchdog: s3c2410: Support separate source clock
Date:   Sun, 31 Oct 2021 14:22:14 +0200
Message-Id: <20211031122216.30212-11-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211031122216.30212-1-semen.protsenko@linaro.org>
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Right now all devices supported in the driver have the single clock: it
acts simultaneously as a bus clock (providing register interface
clocking) and source clock (driving watchdog counter). Some newer Exynos
chips, like Exynos850, have two separate clocks for that. In that case
two clocks will be passed to the driver from the resource provider, e.g.
Device Tree. Provide necessary infrastructure to support that case:
  - use source clock's rate for all timer related calculations
  - use bus clock to gate/ungate the register interface

All devices that use the single clock are kept intact: if only one clock
is passed from Device Tree, it will be used for both purposes as before.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Reworded commit message to be more formal
  - Used separate "has_src_clk" trait to tell if source clock is present
  - Renamed clock variables to match their purpose
  - Removed caching source clock rate, obtaining it in place each time instead
  - Renamed err labels for more consistency

 drivers/watchdog/s3c2410_wdt.c | 52 +++++++++++++++++++++++++---------
 1 file changed, 39 insertions(+), 13 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index fdb1a1e9bd04..c733917c5470 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -118,7 +118,9 @@ struct s3c2410_wdt_variant {
 
 struct s3c2410_wdt {
 	struct device		*dev;
-	struct clk		*clock;
+	struct clk		*bus_clk; /* for register interface (PCLK) */
+	struct clk		*src_clk; /* for WDT counter */
+	bool			has_src_clk;
 	void __iomem		*reg_base;
 	unsigned int		count;
 	spinlock_t		lock;
@@ -348,7 +350,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 				    unsigned int timeout)
 {
 	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
-	unsigned long freq = clk_get_rate(wdt->clock);
+	unsigned long freq = clk_get_rate(wdt->src_clk);
 	unsigned int count;
 	unsigned int divisor = 1;
 	unsigned long wtcon;
@@ -597,26 +599,43 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	wdt->clock = devm_clk_get(dev, "watchdog");
-	if (IS_ERR(wdt->clock)) {
-		dev_err(dev, "failed to find watchdog clock source\n");
-		ret = PTR_ERR(wdt->clock);
+	wdt->bus_clk = devm_clk_get(dev, "watchdog");
+	if (IS_ERR(wdt->bus_clk)) {
+		dev_err(dev, "failed to find bus clock\n");
+		ret = PTR_ERR(wdt->bus_clk);
 		goto err;
 	}
 
-	ret = clk_prepare_enable(wdt->clock);
+	ret = clk_prepare_enable(wdt->bus_clk);
 	if (ret < 0) {
-		dev_err(dev, "failed to enable clock\n");
+		dev_err(dev, "failed to enable bus clock\n");
 		return ret;
 	}
 
+	/*
+	 * "watchdog_src" clock is optional; if it's not present -- just skip it
+	 * and use "watchdog" clock as both bus and source clock.
+	 */
+	wdt->src_clk = devm_clk_get(dev, "watchdog_src");
+	if (!IS_ERR(wdt->src_clk)) {
+		wdt->has_src_clk = true;
+		ret = clk_prepare_enable(wdt->src_clk);
+		if (ret < 0) {
+			dev_err(dev, "failed to enable source clock\n");
+			ret = PTR_ERR(wdt->src_clk);
+			goto err_bus_clk;
+		}
+	} else {
+		wdt->src_clk = wdt->bus_clk;
+	}
+
 	wdt->wdt_device.min_timeout = 1;
-	wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt->clock);
+	wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt->src_clk);
 
 	ret = s3c2410wdt_cpufreq_register(wdt);
 	if (ret < 0) {
 		dev_err(dev, "failed to register cpufreq\n");
-		goto err_clk;
+		goto err_src_clk;
 	}
 
 	watchdog_set_drvdata(&wdt->wdt_device, wdt);
@@ -694,8 +713,12 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
  err_cpufreq:
 	s3c2410wdt_cpufreq_deregister(wdt);
 
- err_clk:
-	clk_disable_unprepare(wdt->clock);
+ err_src_clk:
+	if (wdt->has_src_clk)
+		clk_disable_unprepare(wdt->src_clk);
+
+ err_bus_clk:
+	clk_disable_unprepare(wdt->bus_clk);
 
  err:
 	return ret;
@@ -714,7 +737,10 @@ static int s3c2410wdt_remove(struct platform_device *dev)
 
 	s3c2410wdt_cpufreq_deregister(wdt);
 
-	clk_disable_unprepare(wdt->clock);
+	if (wdt->has_src_clk)
+		clk_disable_unprepare(wdt->src_clk);
+
+	clk_disable_unprepare(wdt->bus_clk);
 
 	return 0;
 }
-- 
2.30.2

