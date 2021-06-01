Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A035E3917D1
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 26 May 2021 14:49:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234423AbhEZMua (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 26 May 2021 08:50:30 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:56849 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234858AbhEZMs4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 May 2021 08:48:56 -0400
Received: from mail-ua1-f69.google.com ([209.85.222.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llswV-0000ug-Tv
        for linux-samsung-soc@vger.kernel.org; Wed, 26 May 2021 12:47:23 +0000
Received: by mail-ua1-f69.google.com with SMTP id i33-20020ab042240000b029020adb6e9ffcso692887uai.23
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 May 2021 05:47:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=63wtLBW+6811tc2wM3xGC8HMgV4U9MLtscg3Brvx6/I=;
        b=Zo+w+nBOcsvkgnBSHqU6uHevqRinCj0aACCWx1vDBTZZp/6nNGuCWTSXGiedbsch6L
         Dmco3XftmF7PxIIu3AoHesUBqg/+Dzn68jPm0c7kzLDQF6xnyvhC2E3LpcnnlRr0BrDf
         /huz+FNHUtpk03/FuNmsepW+MR7szH4msvWRwO0j4WlR0SpDnFtMZZuMI+4nkx3nulWX
         +OjFEtPYpFDaKdEhY1ynPd+2SSOIlCzOQJkE9YH1kQGnZ/+ltYfrJtigoiB5A+4V8nP5
         M0kpCxukMkTnSM2oe8hHnJoRdwWl+RHRcGPsbRtNaUj786Bzzt9RTCUX3Z5C8CtNewjn
         yOVQ==
X-Gm-Message-State: AOAM531DMSPLEexIhTF1YQPK2A0zUTyJo7SOSTzU5tOl4T6C0+ikRRAT
        fws3F4pRzeGZtlILIf5g198YSQIexdUHkZZTDDGPuToX4JlezC65C3dqcaaTm9574dH5MPoe9LY
        hBC0zNtYxwYwbBrRMcl/C4v+pbjYahIZE8WcQLi6EdFuQwoiz
X-Received: by 2002:a1f:eec6:: with SMTP id m189mr28997969vkh.5.1622033242689;
        Wed, 26 May 2021 05:47:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGXY4h0rmF++o4wqDou76qRmdKHAt/W8UvAFVzu+jFZ3c1eLygDNepjjkFiySFdPpaAvkZPQ==
X-Received: by 2002:a1f:eec6:: with SMTP id m189mr28997924vkh.5.1622033242172;
        Wed, 26 May 2021 05:47:22 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id c126sm875817vkh.47.2021.05.26.05.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 05:47:21 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [RESEND PATCH v2 01/13] mfd: max8997: Simplify getting of_device_id match data
Date:   Wed, 26 May 2021 08:46:59 -0400
Message-Id: <20210526124711.33223-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
References: <20210526124711.33223-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use of_device_get_match_data() to make the code slightly smaller.  There
is also no need to wrap it in a check for CONFIG_OF, because dev.of_node
will be set only with OF support.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. Remove check for CONFIG_OF
---
 drivers/mfd/max8997.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/max8997.c b/drivers/mfd/max8997.c
index 68d8f2b95287..2141de78115d 100644
--- a/drivers/mfd/max8997.c
+++ b/drivers/mfd/max8997.c
@@ -11,6 +11,7 @@
 #include <linux/slab.h>
 #include <linux/i2c.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/interrupt.h>
 #include <linux/pm_runtime.h>
@@ -145,11 +146,9 @@ static struct max8997_platform_data *max8997_i2c_parse_dt_pdata(
 static inline unsigned long max8997_i2c_get_driver_data(struct i2c_client *i2c,
 						const struct i2c_device_id *id)
 {
-	if (IS_ENABLED(CONFIG_OF) && i2c->dev.of_node) {
-		const struct of_device_id *match;
-		match = of_match_node(max8997_pmic_dt_match, i2c->dev.of_node);
-		return (unsigned long)match->data;
-	}
+	if (i2c->dev.of_node)
+		return (unsigned long)of_device_get_match_data(&i2c->dev);
+
 	return id->driver_data;
 }
 
-- 
2.27.0

