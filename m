Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2731391DC8
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 26 May 2021 19:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234228AbhEZRWZ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 26 May 2021 13:22:25 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:36695 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234187AbhEZRWX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 May 2021 13:22:23 -0400
Received: from mail-vs1-f72.google.com ([209.85.217.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llxD6-0003U5-TH
        for linux-samsung-soc@vger.kernel.org; Wed, 26 May 2021 17:20:48 +0000
Received: by mail-vs1-f72.google.com with SMTP id q16-20020a67d7900000b0290228198e77b6so553124vsj.23
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 May 2021 10:20:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JV6MoAgdMRVWVMSJVrya81SInPwQ1Quu4L2YIeCtm/Y=;
        b=uGfYK4XvufvopBeJUho6DHKyaGlcBHyteA0FkC06GiG3yMYgBK/Zyn9sfZ3C2ycce1
         BeLE++WygFWS+AjmWdfz7ozd9yRlOJAXNgWOV5qKkgrsX0knFLpqsHGia9A2UGDkrANQ
         xq3ImDQM3rsZa/FUmFhRtIafhQbiaYDkm/Z1futiCLttOA9V90CKKu6rwgRjxskVg/ZE
         aNxT2SVhTDIOQVxGmbMCVUjH4WB59L59BthgIFHGDBiSPzUsIOzm47Uy1zicQcv0yN2p
         78UbyPZCCSzxFeelmTs2Cx406cgiNg17p7DHMAQSoA2dIDTB6cUrI0Bo0nL5x9Qsv+eZ
         z2gA==
X-Gm-Message-State: AOAM531xOpJu/GWjZhWp9qFqYGuBw0CYGzzzQ23IMTgj1//fLe+iMLMH
        WKr65X63r2gZhINPdS3yjX8Z5UAeKfndZImdouxW7eWyeHbroXwrpBm6D65LENkoqI8hR/vHulr
        Ckj8GPSDfW27+fHY+MSvpP4xqibZYyA/CG3zvMNvTjxLKQbAx
X-Received: by 2002:a05:6102:1da:: with SMTP id s26mr32608471vsq.16.1622049648025;
        Wed, 26 May 2021 10:20:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1c+0jkPjCD5k0K7ev45c2hRrf0kkR95gKi9F2v/pUwsjH+tUn/weprRUbVrldbL9j/5apYg==
X-Received: by 2002:a05:6102:1da:: with SMTP id s26mr32608451vsq.16.1622049647851;
        Wed, 26 May 2021 10:20:47 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id u195sm2036032vsc.10.2021.05.26.10.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 10:20:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 1/7] mfd: sec-irq: Do not enforce (incorrect) interrupt trigger type
Date:   Wed, 26 May 2021 13:20:30 -0400
Message-Id: <20210526172036.183223-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210526172036.183223-1-krzysztof.kozlowski@canonical.com>
References: <20210526172036.183223-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Krzysztof Kozlowski <krzk@kernel.org>

Interrupt line can be configured on different hardware in different way,
even inverted.  Therefore driver should not enforce specific trigger
type - edge falling - but instead rely on Devicetree to configure it.

The Samsung PMIC drivers are used only on Devicetree boards.

Additionally, the PMIC datasheets describe the interrupt line as active
low with a requirement of acknowledge from the CPU therefore the edge
falling is not correct.

Marek Szyprowski reports that together with DTS change (proper level in
DTS) it fixes RTC alarm failure that he observed from time to time on
TM2e board.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

---

Changes since v1:
1. Mention in commit msg that this fixes TM2e RTC alarm.
2. Add Marek's tested-by.
---
 drivers/mfd/sec-irq.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/sec-irq.c b/drivers/mfd/sec-irq.c
index a98c5d165039..760f88a865ab 100644
--- a/drivers/mfd/sec-irq.c
+++ b/drivers/mfd/sec-irq.c
@@ -480,8 +480,7 @@ int sec_irq_init(struct sec_pmic_dev *sec_pmic)
 	}
 
 	ret = devm_regmap_add_irq_chip(sec_pmic->dev, sec_pmic->regmap_pmic,
-				       sec_pmic->irq,
-				       IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
+				       sec_pmic->irq, IRQF_ONESHOT,
 				       sec_pmic->irq_base, sec_irq_chip,
 				       &sec_pmic->irq_data);
 	if (ret != 0) {
-- 
2.27.0

