Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9109953DD11
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  5 Jun 2022 18:37:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351260AbiFEQhX (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 5 Jun 2022 12:37:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351266AbiFEQhV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 5 Jun 2022 12:37:21 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AED61580D
        for <linux-samsung-soc@vger.kernel.org>; Sun,  5 Jun 2022 09:37:19 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id gl15so10934628ejb.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Jun 2022 09:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WpJNIbDh5NM9/LA2AXZHwtz/xCPVDe8SAImpETpoj8g=;
        b=N9WRr0SIGIfSFM1PV7FLX2k9vuTtnv+OpLRrnWNIealggkrkAi9bsjCW9CnSPLRObN
         lS7qIMAzFXFReiLBgrT0iRLFdTkfp8z09PaggPksP0+PDv1qtm7BroNK9yvw058yhuN7
         FFIFKXeTiKOfKBvkiHW0xo10xLINSLnjRVgmxFoudAv2z1Wt0mI/57Zrb9D63DuZZ1Zw
         lEokOzlcQ+q53a/CisoDm4pK3KQr3beLJR1/ng1i9irUGuPZKHPF3fF4UFwlRp+Z5cJN
         7jRYUTZ3oycb4eEONRoIG81o3yRkQRbmfB2hOGqgbEEr2+R5IS9hTfvNwhyWlicFEYf1
         nFkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WpJNIbDh5NM9/LA2AXZHwtz/xCPVDe8SAImpETpoj8g=;
        b=S7kvDFhm35IBy39jfwUUI5eR9elNOrqdrG9exjoBFvJ891gbv+oud646ZCn5S46Vzv
         FR8rTIs6Cu43R/DybjkcVhjB1XdpT3Rgg/x3BYwGUriMxA6JZyZcwZzs+u2Troe3gduk
         tVede2KwaANa1PW1Gs6YTFHQ29L6Ymck2Zw3Sabsi69QJxOmDSDvzHx5A19Sk05RS8tu
         kTPXD8yGaHj3z3R9V2VabmTDy1cYP367xyxV64WNXeJI/nNtkDPu9aRSwebZVKftE4FL
         lFBdWGtBuDqI/TEon+2JMEVyk/hHGfLKFem4nGoNLkVwcvITNzSP9GRSBRVGtCxZAXuM
         pjCg==
X-Gm-Message-State: AOAM532tZHEMRHQNIntKB7Cwrqnso4jaA8/ELWHlEYw/iwqUDUSC++SE
        duXlSRWJE+cxI4RXvT5e/5+yFw==
X-Google-Smtp-Source: ABdhPJztniir6tQ6LTLX/OoMdaiw1BZXZp8MyvP7iQNKlVUY67EqcXTbg1sqLsQY+A9kaaJfZyfuNg==
X-Received: by 2002:a17:907:7e95:b0:6fe:e27a:357b with SMTP id qb21-20020a1709077e9500b006fee27a357bmr17626740ejc.404.1654447037621;
        Sun, 05 Jun 2022 09:37:17 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id w3-20020a1709064a0300b006ff0b457cdasm5346770eju.53.2022.06.05.09.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 09:37:16 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/4] arm64: dts: exynos: align MMC node name with dtschema
Date:   Sun,  5 Jun 2022 18:37:08 +0200
Message-Id: <20220605163710.144210-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220605163710.144210-1-krzysztof.kozlowski@linaro.org>
References: <20220605163710.144210-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The node names should be generic and MMC controller dtschema expects
"mmc".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 75b548e495a0..bd6a354b9cb5 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1820,7 +1820,7 @@ usbhost_dwc3: usb@15a00000 {
 			};
 		};
 
-		mshc_0: mshc@15540000 {
+		mshc_0: mmc@15540000 {
 			compatible = "samsung,exynos7-dw-mshc-smu";
 			interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1833,7 +1833,7 @@ mshc_0: mshc@15540000 {
 			status = "disabled";
 		};
 
-		mshc_1: mshc@15550000 {
+		mshc_1: mmc@15550000 {
 			compatible = "samsung,exynos7-dw-mshc-smu";
 			interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -1846,7 +1846,7 @@ mshc_1: mshc@15550000 {
 			status = "disabled";
 		};
 
-		mshc_2: mshc@15560000 {
+		mshc_2: mmc@15560000 {
 			compatible = "samsung,exynos7-dw-mshc-smu";
 			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
-- 
2.34.1

