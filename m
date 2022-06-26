Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81D9855B1A9
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 26 Jun 2022 14:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234351AbiFZMDv (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 26 Jun 2022 08:03:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234336AbiFZMDu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 26 Jun 2022 08:03:50 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E98DBF5BE
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jun 2022 05:03:48 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id sb34so13507747ejc.11
        for <linux-samsung-soc@vger.kernel.org>; Sun, 26 Jun 2022 05:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MR+U/uv/sFjluVAnKsew00EB++5ncTIGVWbEuuMWfRM=;
        b=JNj4ATZc5CVCi2t3fTINxa9ELhyZk3hwB02+pcG9CQN437fmTf8vKSI64OID3H9baH
         fyJeHzSoP7gJVId+LA2Cszj4LKY4faXwXCkORt5umeUDtcWDAql8fzw7gteTcyPidPZy
         UfDi373pp3n+3DHY5YFfLgPoMm+e669GUtVyLCsWksZi7YHXRhrh0zIfB7Sav8yZkKez
         JjbBLjD8wnvxCrQnAQR1YCxWHaVHPkpV/vhnQmeAm6qYDGqWT9kJGrNZpokSU4gMD1FI
         rZmdFKoZgmopisozOBwR/fOQ0aaisEtKnq57vqRfaSym5M8qHcXMmkJ5dT0AuM/gMCQd
         cv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MR+U/uv/sFjluVAnKsew00EB++5ncTIGVWbEuuMWfRM=;
        b=kLNMLP0PIjcRWRKyJs07GELNt0jYw4F8WR08GHB6mIFWFB596SrV0OVDcCpHVCuDix
         7SPy3IWMafBBo+tJrFmTG3De6NWTVKPe+6+7qZPOZgR//T/T3yZPqf4WOtvhVr86SlUs
         2QViTbJLu2umRiQdZvNqFcrQBVGXnyb1x6V7/Lv4pREj2mYgQ/PJmjB+0udMxe6u1kBS
         rgN9oe5PJOcRNb12TU3tTkwW7/TXBNCTWA8n/k3BVxytiD6iuHag4128KFbmo6k0dXGK
         YANH6kckLehUcJytrGLr6cwaQNAUTBc3ciaTkbCtRQ/CqsamHpfgpuB9IyWfqL0wYCT/
         a4qw==
X-Gm-Message-State: AJIora8dHgWUdNJo1T7P8D1FMpL6GrXrJUABIZo5Aw6rMPidfTDIZkbd
        QkUB3xGZcw61ywrkFZ4dOW6WHQ==
X-Google-Smtp-Source: AGRyM1vrX+NQCvsTSQ4ytCg0vIbGH4yopPHMm15pqoZyIntBxfRtbiGZkb36GyWsAjk2WTcZJeXiaA==
X-Received: by 2002:a17:906:72cd:b0:722:d84b:30e3 with SMTP id m13-20020a17090672cd00b00722d84b30e3mr7889852ejl.726.1656245027347;
        Sun, 26 Jun 2022 05:03:47 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id q24-20020a170906b29800b0072629374590sm3751585ejz.120.2022.06.26.05.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 05:03:46 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/5] ARM: dts: s3c24xx: align SDHCI node name with dtschema
Date:   Sun, 26 Jun 2022 14:03:39 +0200
Message-Id: <20220626120342.38851-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220626120342.38851-1-krzysztof.kozlowski@linaro.org>
References: <20220626120342.38851-1-krzysztof.kozlowski@linaro.org>
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

The node names should be generic and DT schema expects "mmc".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/s3c2416.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/s3c2416.dtsi b/arch/arm/boot/dts/s3c2416.dtsi
index 4f084f4fe44f..4660751cb207 100644
--- a/arch/arm/boot/dts/s3c2416.dtsi
+++ b/arch/arm/boot/dts/s3c2416.dtsi
@@ -45,7 +45,7 @@ uart_3: serial@5000c000 {
 		status = "disabled";
 	};
 
-	sdhci_1: sdhci@4ac00000 {
+	sdhci_1: mmc@4ac00000 {
 		compatible = "samsung,s3c6410-sdhci";
 		reg = <0x4AC00000 0x100>;
 		interrupts = <0 0 21 3>;
@@ -56,7 +56,7 @@ sdhci_1: sdhci@4ac00000 {
 		status = "disabled";
 	};
 
-	sdhci_0: sdhci@4a800000 {
+	sdhci_0: mmc@4a800000 {
 		compatible = "samsung,s3c6410-sdhci";
 		reg = <0x4A800000 0x100>;
 		interrupts = <0 0 20 3>;
-- 
2.34.1

