Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAC3E43E884
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 28 Oct 2021 20:36:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231438AbhJ1Sia (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 28 Oct 2021 14:38:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231443AbhJ1SiT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Oct 2021 14:38:19 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D736C061227
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Oct 2021 11:35:41 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id p16so15570658lfa.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Oct 2021 11:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PW+Xu5KR0LGnC5ZiTBKpf+hcc7E/gJL7mbWD5u2IRSI=;
        b=xuSKeHbbC4nc+EU9CT3wXw3es14n16X3aTlTv7hYY/KFi/EOzkDwotp+e4efrBTknK
         yoXUrbGpXJzKzCjzaG1j2A3XS7QA6Vkku+P+25hkokJOcLpEg5IgS+CIUUThzgLyOZot
         ixdiNjWNwZmL59+5KZVYYBlD3pFB6IDde6RQnFqssxwjfOYYhvoqkGqK1FW0UmcvsAro
         lUJxahpkhEtl55/8fKE6OJjf2oOTWxcLIbh2gZIIHqmPO/st30RnIKXXfNs+U95VwAJ+
         2eOpm/1W5muC8xWhRfJnskHvK66/3RjGJX991wlDnnhdOURT5Bk7nNdLzwNfv6K4ijIh
         OnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PW+Xu5KR0LGnC5ZiTBKpf+hcc7E/gJL7mbWD5u2IRSI=;
        b=3M4Y2OHUwSNLaoUlKRebfooPZiapqBRtJs6reOHWkHVfzSGf/At4YUqIqav9SSNX3R
         gkkNE1Em+XY8PD3N496qHA089+fSAQmfKBmT9czQ5O8Fcn/gynroulrRZSds01Y2dmPO
         E11IFs9jk0+v36yF9QsTdzX5sDDArvKtU10op6ZkcbQ/yRcVH3O1rOvdmbu0rdc8sF4w
         wZIcZ8c3OIyQDRpthOWetL7yU2P8BEss4CqnzTB9C+EAgvrNBId9x+7K1quibB8P5THp
         pPsHW/ibc6cGSUM+c9YYRwbsTdctyMOUnr7e8vCMkjFw+Tdrdl/pGMowcna5BFw8B8GQ
         6wLg==
X-Gm-Message-State: AOAM5311aALPdRjXctEBeZ2CQVvK6ernVKlZkq5wg3nzFH/OnR+9NAHp
        HcdqdJj7JJgYcNilP4YNScDWNA==
X-Google-Smtp-Source: ABdhPJwOsTrd35+23hcuPbz+sZ6ig7/NhHcGSWEcNkbNR9PlXij1vTP5BSLOqRqr2hbykWMc+rOx2Q==
X-Received: by 2002:a05:6512:1294:: with SMTP id u20mr5634502lfs.218.1635446139796;
        Thu, 28 Oct 2021 11:35:39 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id d20sm388979lfg.8.2021.10.28.11.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 11:35:39 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 7/7] watchdog: s3c2410: Let kernel kick watchdog
Date:   Thu, 28 Oct 2021 21:35:27 +0300
Message-Id: <20211028183527.3050-8-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211028183527.3050-1-semen.protsenko@linaro.org>
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

When "tmr_atboot" module param is set, the watchdog is started in
driver's probe. In that case, also set WDOG_HW_RUNNING bit to let
watchdog core driver know it's running. This way wathcdog core can kick
the watchdog for us (if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED option is
enabled), until user space takes control.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/watchdog/s3c2410_wdt.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index ca082b1226e3..9af014ff1468 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -732,6 +732,21 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	wdt->wdt_device.bootstatus = s3c2410wdt_get_bootstatus(wdt);
 	wdt->wdt_device.parent = dev;
 
+	/*
+	 * If "tmr_atboot" param is non-zero, start the watchdog right now. Also
+	 * set WDOG_HW_RUNNING bit, so that watchdog core can kick the watchdog.
+	 *
+	 * If we're not enabling the watchdog, then ensure it is disabled if it
+	 * has been left running from the bootloader or other source.
+	 */
+	if (tmr_atboot && started == 0) {
+		dev_info(dev, "starting watchdog timer\n");
+		s3c2410wdt_start(&wdt->wdt_device);
+		set_bit(WDOG_HW_RUNNING, &wdt->wdt_device.status);
+	} else if (!tmr_atboot) {
+		s3c2410wdt_stop(&wdt->wdt_device);
+	}
+
 	ret = watchdog_register_device(&wdt->wdt_device);
 	if (ret)
 		goto err_cpufreq;
@@ -740,17 +755,6 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto err_unregister;
 
-	if (tmr_atboot && started == 0) {
-		dev_info(dev, "starting watchdog timer\n");
-		s3c2410wdt_start(&wdt->wdt_device);
-	} else if (!tmr_atboot) {
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

