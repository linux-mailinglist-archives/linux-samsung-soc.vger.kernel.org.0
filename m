Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D86A23917E4
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 26 May 2021 14:50:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234282AbhEZMwN (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 26 May 2021 08:52:13 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56959 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234942AbhEZMtf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 May 2021 08:49:35 -0400
Received: from mail-ua1-f70.google.com ([209.85.222.70])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llsx9-00013y-GQ
        for linux-samsung-soc@vger.kernel.org; Wed, 26 May 2021 12:48:03 +0000
Received: by mail-ua1-f70.google.com with SMTP id o7-20020ab01e870000b029020d37e3e144so732677uak.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 May 2021 05:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Ff7mSFDiPKWIRPLH13ytxRgyCEPx2Ey1Zs19kp0hAg=;
        b=n7LIG1ax55EBrIGWeSuldgfzBjDmg2HaEmzlsceYaFQCvgYTteT7M6SidfR9uMz7kQ
         gN3n19vYbqcxNKFr8B33COhWT2a+XAPmR0E9FnTarQX7ocwTkYnQkDzNYNyPQNyxr6U6
         NpKHnU32aozUhUAHNPGFnq6522+DWFCTGi5GJsNMGwI+5H051dlc6HAIG2KgmrAVeGO2
         ccVD9j5hkk0z7qUDPS6qgej4bYpbbnEVxSUA/eP+jfntfkoypewOVZ5srDxteHUUIK8B
         OyFvuSGC1C5ITE2XAyjS/ro+MtR8uCFYLCd55hX5lUranfwRtehx8d0U9JMIdYIoylBm
         1GZQ==
X-Gm-Message-State: AOAM530PpeKYiysylyMtBDO75FZ5Or3cHR3qwQkCJvfqGZWuW5sg8Xyr
        zVCReku2KGk0D8ZTGkdffxKKIXWKPhT4B3zsAn/AgeMuu59hSurCtzgtK7birayrr8Yu3ZT1PGN
        SIXZt10DWABDalOhq+u4fHHsGhpH7cKiEY3V0qXuI2hjQQKbl
X-Received: by 2002:a67:efda:: with SMTP id s26mr30788862vsp.8.1622033282595;
        Wed, 26 May 2021 05:48:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvzp8HuLrUUCnUNiZlA3le4xYeTGQur5HspC6co1WVkd+XDr3puQBLsVJFCIEz3BujO0hIwg==
X-Received: by 2002:a67:efda:: with SMTP id s26mr30788839vsp.8.1622033282400;
        Wed, 26 May 2021 05:48:02 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c126sm875817vkh.47.2021.05.26.05.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:47:59 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [RESEND PATCH v2 12/13] mfd: sec: Enable wakeup from suspend via devicetree property
Date:   Wed, 26 May 2021 08:47:10 -0400
Message-Id: <20210526124711.33223-13-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
References: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Set device wakeup capability from devicetree property (done by drivers
core), instead of always setting it to 0 (because value in platform data
is not assigned).

This should not have visible effect on actual resuming from suspend
because the child device - S5M RTC driver - is responsible for waking
up and sets device wakeup unconditionally.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/mfd/sec-core.c           | 8 --------
 include/linux/mfd/samsung/core.h | 3 ---
 2 files changed, 11 deletions(-)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index a9d4fbc51997..1fb29c45f5cf 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -298,12 +298,6 @@ sec_pmic_i2c_parse_dt_pdata(struct device *dev)
 	if (!pd)
 		return ERR_PTR(-ENOMEM);
 
-	/*
-	 * ToDo: the 'wakeup' member in the platform data is more of a linux
-	 * specfic information. Hence, there is no binding for that yet and
-	 * not parsed here.
-	 */
-
 	pd->manual_poweroff = of_property_read_bool(dev->of_node,
 						"samsung,s2mps11-acokb-ground");
 	pd->disable_wrstbi = of_property_read_bool(dev->of_node,
@@ -337,7 +331,6 @@ static int sec_pmic_probe(struct i2c_client *i2c,
 	}
 
 	sec_pmic->device_type = (unsigned long)of_device_get_match_data(sec_pmic->dev);
-	sec_pmic->wakeup = pdata->wakeup;
 	sec_pmic->pdata = pdata;
 
 	switch (sec_pmic->device_type) {
@@ -429,7 +422,6 @@ static int sec_pmic_probe(struct i2c_client *i2c,
 	if (ret)
 		return ret;
 
-	device_init_wakeup(sec_pmic->dev, sec_pmic->wakeup);
 	sec_pmic_configure(sec_pmic);
 	sec_pmic_dump_rev(sec_pmic);
 
diff --git a/include/linux/mfd/samsung/core.h b/include/linux/mfd/samsung/core.h
index 9864f13b7814..b0d049a56d16 100644
--- a/include/linux/mfd/samsung/core.h
+++ b/include/linux/mfd/samsung/core.h
@@ -69,8 +69,6 @@ struct sec_pmic_dev {
 	unsigned long device_type;
 	int irq;
 	struct regmap_irq_chip_data *irq_data;
-
-	bool wakeup;
 };
 
 int sec_irq_init(struct sec_pmic_dev *sec_pmic);
@@ -82,7 +80,6 @@ struct sec_platform_data {
 	struct sec_opmode_data		*opmode;
 	int				num_regulators;
 
-	bool				wakeup;
 	bool				buck_voltage_lock;
 
 	int				buck_gpios[3];
-- 
2.27.0

