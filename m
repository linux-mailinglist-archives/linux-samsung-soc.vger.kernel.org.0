Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FD0343E877
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 28 Oct 2021 20:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231316AbhJ1SiG (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 28 Oct 2021 14:38:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231281AbhJ1SiE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Oct 2021 14:38:04 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81168C061225
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Oct 2021 11:35:36 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id i13so5960327lfe.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Oct 2021 11:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kJm4UDkAbEJvQh9HALOCQ6tEN9zC09iwiQ+sFyCLYgE=;
        b=awFZuQDoz3AdUzy8hAHB8H14qF4LsV6ic436GNJqxRmGWXrfvunMJPcZfysKVQNoBI
         oM0jjE5poX7G/9DppOduxmQsGS1cMHhlPgGWpmEopYnq6Gb99R22SkW11wyD9jW3/F6F
         5wMWMnvbY4vX3Z6QUxhdjw47aFy/LdsDnXfBCxRDpVDnnD0LBw/+ODSXl0PWY40o0mhv
         x3o5vVu89AZ5uyEtWt7a3dU79Lr9f+CirtGMc43SGhQLOw4W28ilcLLOGK7V14eO5V/L
         nC+Xdk9WJ8J4xwinHsxOF02IUgRArvWdhsaXAEecuHVblStD+bRreIcjYD8DRbzo4Xlu
         OGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kJm4UDkAbEJvQh9HALOCQ6tEN9zC09iwiQ+sFyCLYgE=;
        b=KYmRoyA4ky26cXQEgX4ymim7Hn5SIqf7qsCNj8ZdfCa1SzVZZdX3U6u7CwEx0PotRx
         WVGImm/rrODfWgjJZfJn+fptIzhpQ/U6p/IAfZmINqiCkL6a5qasXsXWnD2W4ZOUI8x0
         vJ6CtfNleo204FC5Z1qrPF0ojIfIXqNtgQO66F7evVZu+LmOwlUKC25en1IarKvgFTYo
         zoBf1MW3dvdFWWTZHLJDGfZGmNBKw0R3NZm6NYZmgMcd0Dd+0S93jMAA421SoGQMpIJA
         2l1fzRIdakayL2xBD3lAw8A+2ido+sFNuDBJr4FRiHqH/wmFQ/EBf8rPvJidE/oEsKu4
         RsCQ==
X-Gm-Message-State: AOAM531n4PbnP8HY0POIEFZdwUEwof6PKcAXRwhhQuS7GHivPYnAbW1Q
        mazRb2J/RVUrxLTW2+simQUFmA==
X-Google-Smtp-Source: ABdhPJyicTgTmaeYWegOiAj36uy8bc/j7jLBVHfsBaeWirYLWUIvqClf7XZ2wk9dVOhwTeZC3BIB7Q==
X-Received: by 2002:a05:6512:3a89:: with SMTP id q9mr5812095lfu.172.1635446134819;
        Thu, 28 Oct 2021 11:35:34 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id h1sm239725ljb.121.2021.10.28.11.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 11:35:34 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 4/7] watchdog: s3c2410: Add support for WDT counter enable
Date:   Thu, 28 Oct 2021 21:35:24 +0300
Message-Id: <20211028183527.3050-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211028183527.3050-1-semen.protsenko@linaro.org>
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On new Exynos chips (like Exynos850) WDT counter must be enabled to make
WDT functional. It's done via CLUSTERx_NONCPU_OUT register, in
CNT_EN_WDT bit. Add infrastructure needed to enable that counter.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/watchdog/s3c2410_wdt.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 7c163a257d3c..a5ef7171a90e 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -97,12 +97,16 @@ struct s3c2410_wdt;
  * @rst_stat_reg: Offset in pmureg for the register that has the reset status.
  * @rst_stat_bit: Bit number in the rst_stat register indicating a watchdog
  * reset.
+ * @cnt_en_reg: Offset in pmureg for the register that enables WDT counter.
+ * @cnt_en_bit: Bit number for "watchdog counter enable" in cnt_en register.
  * @quirks: A bitfield of quirks.
  * @disable_auto_reset: If set, this function will be called to disable
  * automatic setting the WDT as a reset reason in RST_STAT on CPU reset; uses
  * disable_reg field.
  * @mask_reset: If set, this function will be called to mask WDT reset request;
  * uses mask_reset_reg and mask_bit fields.
+ * @enable_counter: If set, this function will be called to enable WDT counter;
+ * uses cnt_en_reg and cnt_en_bit fields.
  */
 
 struct s3c2410_wdt_variant {
@@ -111,9 +115,12 @@ struct s3c2410_wdt_variant {
 	int mask_bit;
 	int rst_stat_reg;
 	int rst_stat_bit;
+	int cnt_en_reg;
+	int cnt_en_bit;
 	u32 quirks;
 	int (*disable_auto_reset)(struct s3c2410_wdt *wdt, bool mask);
 	int (*mask_reset)(struct s3c2410_wdt *wdt, bool mask);
+	int (*enable_counter)(struct s3c2410_wdt *wdt, bool mask);
 };
 
 struct s3c2410_wdt {
@@ -132,6 +139,7 @@ struct s3c2410_wdt {
 
 static int s3c2410wdt_disable_wdt_reset(struct s3c2410_wdt *wdt, bool mask);
 static int s3c2410wdt_mask_wdt_reset(struct s3c2410_wdt *wdt, bool mask);
+static int s3c2410wdt_enable_counter(struct s3c2410_wdt *wdt, bool en);
 
 static const struct s3c2410_wdt_variant drv_data_s3c2410 = {
 	.quirks = 0
@@ -246,6 +254,20 @@ static int s3c2410wdt_mask_wdt_reset(struct s3c2410_wdt *wdt, bool mask)
 	return ret;
 }
 
+static int s3c2410wdt_enable_counter(struct s3c2410_wdt *wdt, bool en)
+{
+	const u32 mask_val = 1 << wdt->drv_data->cnt_en_bit;
+	const u32 val = en ? mask_val : 0;
+	int ret;
+
+	ret = regmap_update_bits(wdt->pmureg, wdt->drv_data->cnt_en_reg,
+				 mask_val, val);
+	if (ret < 0)
+		dev_err(wdt->dev, "failed to update reg(%d)\n", ret);
+
+	return ret;
+}
+
 static int s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
 {
 	int ret;
@@ -262,6 +284,12 @@ static int s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
 			return ret;
 	}
 
+	if (wdt->drv_data->enable_counter) {
+		ret = wdt->drv_data->enable_counter(wdt, en);
+		if (ret < 0)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.30.2

