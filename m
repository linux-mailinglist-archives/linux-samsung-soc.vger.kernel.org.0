Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E7194475B9
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  7 Nov 2021 21:30:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236491AbhKGUcl (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 7 Nov 2021 15:32:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236386AbhKGUci (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 7 Nov 2021 15:32:38 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 110FFC061746
        for <linux-samsung-soc@vger.kernel.org>; Sun,  7 Nov 2021 12:29:54 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id o18so31562529lfu.13
        for <linux-samsung-soc@vger.kernel.org>; Sun, 07 Nov 2021 12:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iLKLfoVwJNu4r8/+qUFz6o9Y+DOB/hZ4XDcDw1uqaHQ=;
        b=e3VgPMSAzLAnZ44gUoWpXW5KvtMb7Vf3Dxs9lQwW6VLg57vjV6y1ATnysS5FN1/kBD
         8nMNvwYZB99Kf7pZoqWbJx90oGd+hbqKHWqE08g5rxnXuxxVrdBOtMsjFS1nfQ7TkKEo
         dOEujjER+zjIExdFLcbivbfeykFNJ0In5xlSoi+M59Rg5PUhWWdt9FOnHjszvolrT7lq
         Tnhsdie6WxKDOmyVSCLnmv5aJDfX7mv910xb50ePwsAjMtrx0D5XTIxA1mc/bB6dhNsD
         4NMfhnZSL/p7Pr9VsDX6O9FGf9qLg8R3IrZo4mKapGgCJ1BCsX8H7t3c308MfBvuZAyd
         0LgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iLKLfoVwJNu4r8/+qUFz6o9Y+DOB/hZ4XDcDw1uqaHQ=;
        b=SgTv9vRzbtSY16WD2KGSI6y1oKiiYhz4Gc93klZgDD/8pwReFx2H8l9qvjy+d3l305
         PZrHriF8T87IRur4voi/rF+sTjcMBBAKmcS1qpJaqGcow28CN83sCySScJ2ugUu/zjzZ
         3MnuI/9elw91RaKCz7Kh+K219I7I6gvl0RzUqs4X+Al0yoRSDZ7grTJ93SaOkmN89AAC
         Bl/To4lj45X2qsfz+wPgHFjWzbd8p3wuFuv8rIkwdIa+IoaaDaIQSFPCbqWazyge/vED
         b2SCcc8ut8UYodvpSSlP8jk6KIWyO057xTXGP2hvq0VLf3oKra1qG4YloiIyHdghLETT
         9qRg==
X-Gm-Message-State: AOAM530B9vpR9dYfYErWCBM/Wq44ikuJULcKOFKP4D77F6EkpAwiBEYh
        g69AnMYXk7ElrSQ+JJUhNNgvBg==
X-Google-Smtp-Source: ABdhPJwDdQX1V2BSXClLvTMM3lN0haGxLEVG3UUOjN/yIKSoRQUXlslUz2LRf1mWXVIq666jdHR09g==
X-Received: by 2002:a05:6512:10c5:: with SMTP id k5mr69608972lfg.677.1636316992448;
        Sun, 07 Nov 2021 12:29:52 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id j20sm1573345lfu.199.2021.11.07.12.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 12:29:52 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 04/12] watchdog: s3c2410: Let kernel kick watchdog
Date:   Sun,  7 Nov 2021 22:29:35 +0200
Message-Id: <20211107202943.8859-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211107202943.8859-1-semen.protsenko@linaro.org>
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

When "tmr_atboot" module param is set, the watchdog is started in
driver's probe. In that case, also set WDOG_HW_RUNNING bit to let
watchdog core driver know it's running. This way watchdog core can kick
the watchdog for us (if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED option is
enabled), until user space takes control.

WDOG_HW_RUNNING bit must be set before registering the watchdog. So the
"tmr_atboot" handling code is moved before watchdog registration, to
avoid performing the same check twice. This is also logical because
WDOG_HW_RUNNING bit makes WDT core expect actually running watchdog.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
Changes in v3:
  - Added R-b tag by Krzysztof Kozlowski

Changes in v2:
  - Added explanation on moving the code block to commit message
  - [PATCH 03/12] handles the case when tmr_atboot is present but valid
    timeout wasn't found

 drivers/watchdog/s3c2410_wdt.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 00421cf22556..0845c05034a1 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -604,6 +604,21 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	wdt->wdt_device.bootstatus = s3c2410wdt_get_bootstatus(wdt);
 	wdt->wdt_device.parent = dev;
 
+	/*
+	 * If "tmr_atboot" param is non-zero, start the watchdog right now. Also
+	 * set WDOG_HW_RUNNING bit, so that watchdog core can kick the watchdog.
+	 *
+	 * If we're not enabling the watchdog, then ensure it is disabled if it
+	 * has been left running from the bootloader or other source.
+	 */
+	if (tmr_atboot) {
+		dev_info(dev, "starting watchdog timer\n");
+		s3c2410wdt_start(&wdt->wdt_device);
+		set_bit(WDOG_HW_RUNNING, &wdt->wdt_device.status);
+	} else {
+		s3c2410wdt_stop(&wdt->wdt_device);
+	}
+
 	ret = watchdog_register_device(&wdt->wdt_device);
 	if (ret)
 		goto err_cpufreq;
@@ -612,17 +627,6 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_unregister;
 
-	if (tmr_atboot) {
-		dev_info(dev, "starting watchdog timer\n");
-		s3c2410wdt_start(&wdt->wdt_device);
-	} else {
-		/* if we're not enabling the watchdog, then ensure it is
-		 * disabled if it has been left running from the bootloader
-		 * or other source */
-
-		s3c2410wdt_stop(&wdt->wdt_device);
-	}
-
 	platform_set_drvdata(pdev, wdt);
 
 	/* print out a statement of readiness */
-- 
2.30.2

