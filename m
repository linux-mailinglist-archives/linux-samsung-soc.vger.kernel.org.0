Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16A724824CC
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 31 Dec 2021 17:20:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231285AbhLaQUV (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 31 Dec 2021 11:20:21 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:46564
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231283AbhLaQUT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 31 Dec 2021 11:20:19 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5431A3FFDA
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Dec 2021 16:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640967618;
        bh=Z7M8b7DGvygZMI+7ttfn6LCkk2k7GpWqVpA4Kxd1ezE=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=HTz3Hxz2LKIQvPI1ovX7jYeS3UeRU3cBDKUxgML9as1cBGSFG31/b44RgM4RR+d+B
         h+Wmjp8mKKELmcE1L5ST/gR51m0hxffV7rNz4VApO+toG0FYt6+WBxwZ+OaJ9/WWID
         3tudte4BNSoEjzYPMuBYpFdoFkv+t44FRTv5Yn16DMXqHUjTT8fOcTxNFTb17XoUzd
         /FtbbHkFPoLpLR0waaK4kyyJvEKsafM35utko8hmbYp+0N6aRxYimHkzBfTRdbWZjM
         tgeQxnvVsV4k0taRDB84Hy0TJf5BZG//xS2kGvuRe/4ZSbIN43FzFXzpARUpTiwn5c
         9yAHxn42B2u/Q==
Received: by mail-lj1-f199.google.com with SMTP id y4-20020a2e95c4000000b0022dbab5f69eso6671391ljh.14
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Dec 2021 08:20:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z7M8b7DGvygZMI+7ttfn6LCkk2k7GpWqVpA4Kxd1ezE=;
        b=DE858uqgy61XvWggDFSEnijWxOjevEbKIPBolPL0rLuF9N60dmf8JJJSF1MYrv1OfH
         0lmdDmtRzCkI5LcMohHJ7OhwxTnicbIy6vCQHlkNVPAbzhvco7+6XQ+DTJVyvrGueKsR
         O715itY533j7vbVQ/M3674BhaZlc/l0/2UMLN4yPANR8N3VB99KMfSvEmYGaXv2Yibcx
         CAW9Qqzf6bShznWjTuHvkzjJShijJKHasBrM3sHlaP3FHleHwbmX5penaor/l12lP01S
         lKq5Et7/Yb30o/GOmK8CmSSuDWuiFRWRr5c2QPnK9Bpdw3TTO/TtsKHL/lmDMSSPYVzr
         ETQw==
X-Gm-Message-State: AOAM5320VGJ9uQB0WPl9lEMSCdelTg+1k/hmVUwMNMJObBGqA5ehyiwR
        8yr8ZlBDjF1ugpa31M7/fSCOlXldDWpR4vrDdZ2jvE30oQMWaFlRSHfMTGKfQl9ZLYJXVsp+dk4
        G7gEbyiAc5FD7eC7YsVca0wIAeFwvRpYMi44k1wA4j2sEIwkT
X-Received: by 2002:ac2:4c3a:: with SMTP id u26mr6648161lfq.213.1640967617771;
        Fri, 31 Dec 2021 08:20:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzYHKziaPuSIgn24MRjvaAfYo6FQZzBFG6SSspGPMra+rTqAGt0xm6C4a64WrxRSjqk34g2LA==
X-Received: by 2002:ac2:4c3a:: with SMTP id u26mr6648147lfq.213.1640967617618;
        Fri, 31 Dec 2021 08:20:17 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id bx10sm2817607ljb.3.2021.12.31.08.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Dec 2021 08:20:16 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 03/24] ARM: dts: exynos: drop unused pinctrl defines in Exynos3250
Date:   Fri, 31 Dec 2021 17:19:09 +0100
Message-Id: <20211231161930.256733-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211231161930.256733-1-krzysztof.kozlowski@canonical.com>
References: <20211231161930.256733-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The PIN_OUT/PIN_OUT_SET/PIN_CFG defines for pin controller pin
configuration are not used.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos3250-pinctrl.dtsi | 25 -----------------------
 1 file changed, 25 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250-pinctrl.dtsi b/arch/arm/boot/dts/exynos3250-pinctrl.dtsi
index dff3c6e3aa1f..a616cb1aca29 100644
--- a/arch/arm/boot/dts/exynos3250-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos3250-pinctrl.dtsi
@@ -19,31 +19,6 @@ _pin {								\
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_ ##_drv>;		\
 	}
 
-#define PIN_OUT(_pin, _drv)						\
-	_pin {								\
-		samsung,pins = #_pin;					\
-		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;	\
-		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;		\
-		samsung,pin-drv = <EXYNOS4_PIN_DRV_ ##_drv>;		\
-	}
-
-#define PIN_OUT_SET(_pin, _val, _drv)					\
-	_pin {								\
-		samsung,pins = #_pin;					\
-		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;	\
-		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;		\
-		samsung,pin-drv = <EXYNOS4_PIN_DRV_ ##_drv>;		\
-		samsung,pin-val = <_val>;				\
-	}
-
-#define PIN_CFG(_pin, _sel, _pull, _drv)				\
-	_pin {								\
-		samsung,pins = #_pin;					\
-		samsung,pin-function = <_sel>;				\
-		samsung,pin-pud = <EXYNOS_PIN_PULL_ ##_pull>;		\
-		samsung,pin-drv = <EXYNOS4_PIN_DRV_ ##_drv>;		\
-	}
-
 #define PIN_SLP(_pin, _mode, _pull)					\
 	_pin {								\
 		samsung,pins = #_pin;					\
-- 
2.32.0

