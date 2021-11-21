Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69ADC458503
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 21 Nov 2021 17:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238550AbhKURAL (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 21 Nov 2021 12:00:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238366AbhKURAH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 21 Nov 2021 12:00:07 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39065C061714
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 08:57:02 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id m27so68910832lfj.12
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 08:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fiIH1xoCr8k1biy/Rby50kd97KgxwQTY2oULsINanJc=;
        b=cvpH9hdykmNjWOzEx0TonWC4qB78OugqQM6vYOcnoME/FHw0LkuEwKi3Zn5EVZEeGQ
         7tAVF9BTjzEMTPTTVCPkQsR+CH/Eamcfs1+TBjnMvNczDzke3r8ehTrXNB40tC+lWL/M
         2vD8v7vFJk5SHiefhMy7lPnl9niHiuWzQwl9+UsbDadexx05HmQTlDw+sT3U2bHu5Nv/
         v9dcQ3l+eV2L4AWRUrNViojvit5RKt7g6VQ1zoCjzaErh0cCvqEtKyPbCXWchqIgjF1O
         VTTjJlCcijlHKLzLEJ0LB28epupH6c4EzPmT+Xfu/oCeXdTSwDonKtv1R5WszKvMwVl/
         KodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fiIH1xoCr8k1biy/Rby50kd97KgxwQTY2oULsINanJc=;
        b=pOHY5QRvEWY8k2UgyG7fNExeKnfbuBEnfJUyIGbrz0Np48hRnaswyqaXpS26qfQ60R
         QT8yuHy+D/WYRkemUjoXuDcnryKe6oPE22oR9xK455/xP9rGqDxuN+LAtqiMUx3MO/uK
         VupS+KYdu4TfDjQTiWmKHZ2RpL0qq29XDbHZkbd5CimVK67gzRozUw8yxYvjwfas+Tkk
         z6ouNf0xahX6Tw/+wlAqQoaSWhKm5BinhEiPJmsCKXKZkXuNgStEYHm3sLTJQI93pvZE
         z5jKmTSEI96mQxiWFYWrLLaIFrYsvRfT0XfpFDf76r8cuxm2UlFfFeStyq48TEa1Niku
         qDgw==
X-Gm-Message-State: AOAM530U3n5bAhi3VnH/ymGHEFlT+DndR4T3wiVPdKOol81LgBKppaio
        8aeXOTxcpr4G2kLtCwgq68vwbGPrGXpkBo3O
X-Google-Smtp-Source: ABdhPJwStgZtnJwvmEIvnFihEWnBplWxF+U3NSI06zVRYrq5LyuoDGQr6FAM9X0zNNOO/5GNWfunzw==
X-Received: by 2002:ac2:4c0d:: with SMTP id t13mr50981885lfq.172.1637513820599;
        Sun, 21 Nov 2021 08:57:00 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id u7sm628988lja.58.2021.11.21.08.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 08:57:00 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v4 07/12] watchdog: s3c2410: Implement a way to invert mask reg value
Date:   Sun, 21 Nov 2021 18:56:42 +0200
Message-Id: <20211121165647.26706-8-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211121165647.26706-1-semen.protsenko@linaro.org>
References: <20211121165647.26706-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On new Exynos chips (like Exynos850) the MASK_WDT_RESET_REQUEST register
is replaced with CLUSTERx_NONCPU_INT_EN, and its mask bit value meaning
was reversed: for new register the bit value "1" means "Interrupt
enabled", while for MASK_WDT_RESET_REQUEST register "1" means "Mask the
interrupt" (i.e. "Interrupt disabled").

Introduce "mask_reset_inv" boolean field in driver data structure; when
that field is "true", mask register handling function will invert the
value before setting it to the register.

This commit doesn't bring any functional change to existing devices, but
merely provides an infrastructure for upcoming chips support.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
---
Changes in v4:
  - Added R-b tag by Guenter Roeck

Changes in v3:
  - Added R-b tag by Krzysztof Kozlowski

Changes in v2:
  - (none): it's a new patch

 drivers/watchdog/s3c2410_wdt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 4ac0a30e835e..2a61b6ea5602 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -92,6 +92,7 @@ MODULE_PARM_DESC(soft_noboot, "Watchdog action, set to 1 to ignore reboots, 0 to
  * timer reset functionality.
  * @mask_reset_reg: Offset in pmureg for the register that masks the watchdog
  * timer reset functionality.
+ * @mask_reset_inv: If set, mask_reset_reg value will have inverted meaning.
  * @mask_bit: Bit number for the watchdog timer in the disable register and the
  * mask reset register.
  * @rst_stat_reg: Offset in pmureg for the register that has the reset status.
@@ -103,6 +104,7 @@ MODULE_PARM_DESC(soft_noboot, "Watchdog action, set to 1 to ignore reboots, 0 to
 struct s3c2410_wdt_variant {
 	int disable_reg;
 	int mask_reset_reg;
+	bool mask_reset_inv;
 	int mask_bit;
 	int rst_stat_reg;
 	int rst_stat_bit;
@@ -219,7 +221,8 @@ static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
 static int s3c2410wdt_mask_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
 {
 	const u32 mask_val = BIT(wdt->drv_data->mask_bit);
-	const u32 val = mask ? mask_val : 0;
+	const bool val_inv = wdt->drv_data->mask_reset_inv;
+	const u32 val = (mask ^ val_inv) ? mask_val : 0;
 	int ret;
 
 	ret = regmap_update_bits(wdt->pmureg, wdt->drv_data->mask_reset_reg,
-- 
2.30.2

