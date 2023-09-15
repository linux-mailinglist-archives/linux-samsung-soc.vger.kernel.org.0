Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE4627A1A5B
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 15 Sep 2023 11:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233740AbjIOJV4 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 15 Sep 2023 05:21:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233679AbjIOJVx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Sep 2023 05:21:53 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9955271B
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Sep 2023 02:21:27 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2bb9a063f26so30566291fa.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 15 Sep 2023 02:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694769686; x=1695374486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxVrkiCAkoIq59ofHyv2OHqXSOCmWARXvwgAt/o802g=;
        b=Gx6kcamkcQfFh1/lEF6b1MwtdgJcqz8lXI/AqDOhLDIiJD1AT+0J/OsgIQ9sZf03zq
         quD8mjm0tQUGg8PgzsiwzRg0dTPRV0uOT8jaqAtxE+iGMagMfVZBLcHJeml5MzZO0eUP
         LhAIu7viUH8YIWEch5EE0yjo0sx8HlTkgpKJwf0ciJE0ylUP+Uw+RDV6g0XgYqjy6Uyi
         Cllf+UAqm3+veHcqVm/nY2KFkyK+7KXYKyloG/G/wWZofJveOXGjW9FP6PbKcmwYkHZr
         wLKV+OfHsEupWjzhx45w4PBkd5V3nEm1pS99Q7iURKYmcmGO3OH9vYbn9Be+o7tKu6jP
         LEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694769686; x=1695374486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lxVrkiCAkoIq59ofHyv2OHqXSOCmWARXvwgAt/o802g=;
        b=u13YqBRxfyxGwWt0gvdAgU8uMubtH9Q8vSMWGcT0khhuXBpWiGzmrTJH7XfKeCER6p
         7VaS2zbSLGlLieHRRokXY/FYMF51iP1gCEB1XycGk6MVpnJyHOC6wk5Egj+CRtrI8Zax
         pmRhlkzStRRxf14G3a5jImMMtb949dEiD9yC4esXBytSQtBnWnotZ0ofEG3MWPQw7Rki
         a8cs0th1Lrw0QRnHvVnsWpVAG9U5Dbp/BtlTtSTJmw9CSZX6oo6pNQGDA0NGqnAL5r4Q
         LJw/CZVIbtvQ9W/sbOkiyd/Cndi7uKKSfveiFolts7A7NAo8A4OJH+H64+Zzpwamyz68
         Nplw==
X-Gm-Message-State: AOJu0Yzo1NvIX10GS4td/GB/c3vTaXVupEX0v4hv7syqr2HWc3RrvhBb
        UuIDlZ7JCKK3Oj7qKbuZSK7H2w==
X-Google-Smtp-Source: AGHT+IELGUxnnw8NcjpWERdHd/HFBh9WJ0OdjTLN86Kk7Wo+a3UlN/uFXOriKAm42ZCQmu0toMURCQ==
X-Received: by 2002:a05:651c:1033:b0:2bc:d7d6:258f with SMTP id w19-20020a05651c103300b002bcd7d6258fmr907223ljm.35.1694769686215;
        Fri, 15 Sep 2023 02:21:26 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-94-254-63-18.NA.cust.bahnhof.se. [94.254.63.18])
        by smtp.gmail.com with ESMTPSA id p8-20020a2e7408000000b002b9ec22d9fasm639376ljc.29.2023.09.15.02.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 02:21:25 -0700 (PDT)
From:   Ulf Hansson <ulf.hansson@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 11/17] pmdomain: samsung: Move Kconfig option to the pmdomain subsystem
Date:   Fri, 15 Sep 2023 11:19:57 +0200
Message-Id: <20230915092003.658361-12-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230915092003.658361-1-ulf.hansson@linaro.org>
References: <20230915092003.658361-1-ulf.hansson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Kconfig option belongs closer to the corresponding implementation,
hence let's move it from the soc subsystem to the pmdomain subsystem.

Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/Kconfig         | 1 +
 drivers/pmdomain/samsung/Kconfig | 8 ++++++++
 drivers/soc/samsung/Kconfig      | 4 ----
 3 files changed, 9 insertions(+), 4 deletions(-)
 create mode 100644 drivers/pmdomain/samsung/Kconfig

diff --git a/drivers/pmdomain/Kconfig b/drivers/pmdomain/Kconfig
index 8afe69251dd2..4a411e0985c3 100644
--- a/drivers/pmdomain/Kconfig
+++ b/drivers/pmdomain/Kconfig
@@ -10,5 +10,6 @@ source "drivers/pmdomain/mediatek/Kconfig"
 source "drivers/pmdomain/qcom/Kconfig"
 source "drivers/pmdomain/renesas/Kconfig"
 source "drivers/pmdomain/rockchip/Kconfig"
+source "drivers/pmdomain/samsung/Kconfig"
 
 endmenu
diff --git a/drivers/pmdomain/samsung/Kconfig b/drivers/pmdomain/samsung/Kconfig
new file mode 100644
index 000000000000..0debfe36b00a
--- /dev/null
+++ b/drivers/pmdomain/samsung/Kconfig
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0
+if SOC_SAMSUNG
+
+config EXYNOS_PM_DOMAINS
+	bool "Exynos PM domains" if COMPILE_TEST
+	depends on (ARCH_EXYNOS && PM_GENERIC_DOMAINS) || COMPILE_TEST
+
+endif
diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
index 7a8f291e7704..27ec99af77e3 100644
--- a/drivers/soc/samsung/Kconfig
+++ b/drivers/soc/samsung/Kconfig
@@ -48,10 +48,6 @@ config EXYNOS_PMU_ARM_DRIVERS
 	bool "Exynos PMU ARMv7-specific driver extensions" if COMPILE_TEST
 	depends on EXYNOS_PMU
 
-config EXYNOS_PM_DOMAINS
-	bool "Exynos PM domains" if COMPILE_TEST
-	depends on (ARCH_EXYNOS && PM_GENERIC_DOMAINS) || COMPILE_TEST
-
 config SAMSUNG_PM_CHECK
 	bool "S3C2410 PM Suspend Memory CRC"
 	depends on PM && (ARCH_S3C64XX || ARCH_S5PV210)
-- 
2.34.1

