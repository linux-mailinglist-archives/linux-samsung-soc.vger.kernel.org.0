Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB95867B8DC
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 25 Jan 2023 18:58:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236052AbjAYR6B (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 25 Jan 2023 12:58:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235092AbjAYR6A (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 12:58:00 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 907551167B
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 09:57:56 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so1901436wmc.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 09:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JSWaSlJ4ls7ihTqo1gmqPaRQG3AJ8x16qE0HQc0/6H4=;
        b=RjxMTQ2NYyLKhYJGoZCJ2C570WDNtdtfynWQ8hgzkCr3WnHwtXGZBlQwmniMafmAjR
         zXdh5+1TpcyqRBBd6Xq+QqU6XdDtXx2yU6PvDW/fkEn8IvxWzMK2NZ09q3R82AW5wPTS
         NJJOYWc/f1uc/icXoRu4TvqAWt4snsA6sTB6kbzBEouOOkh6HzLw0BsMFU2ETb8hgZjz
         eCjIy9RvF1uPOPRmyezmEvBLkSHBxp1UaBAH+q74R64iMp+v7m82rqCIQAqt2Ptq/Iu7
         YaNJ0v0MZg2yTn3ZtjEMQdIhyQSizKlYUVqFNNA5PAg8qhzvEzch9XOD38Ojp36Nzr4G
         5Z4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSWaSlJ4ls7ihTqo1gmqPaRQG3AJ8x16qE0HQc0/6H4=;
        b=QMIDBZ2W+Nnd2ejDPAvwF2Az/+tGpyb8IT8KG7unJXmMaGMteN3Nr0nY6LGDJNjW7x
         XnBqfpHGJidDkqk7LFW0SK7vALPHdrKNunvDj1zI2V/GaWBqxO3EM6Txo8oCzPRkgTU+
         fY/SYutO2Fnfr9nvHAfwn64qgBcNFb2FbCQV8Hb4XuEGtQI+aispe9HnXwkSOqwORmVv
         HbBeYk3/F1/2Mmyr67G5Kj+HWj9gH/eRLsqwgXp9DMeSQO9Ci6wf1bybYJL18ED5PxlP
         /ixppxELHdd9L3+US5LeG6aTulFWCJwjofFNTQhcT6YVBUsPe/WQxrC9qptt69zNcW/6
         CqpQ==
X-Gm-Message-State: AFqh2kpZBTKMf+HRDxrlM1Yc20+/UP8OCTwOGOj1tWjA5MNHuDQ2mPF4
        HnBtBx7RZ6VcUVyv0M47XezWVA==
X-Google-Smtp-Source: AMrXdXth6bnqN6T91DOTrI/5Fj1J/UyobctlisUWYO9JNMUKFVm3+tNFzhCxH9lMkoiuoC3zuHu+bw==
X-Received: by 2002:a05:600c:181a:b0:3d2:2043:9cbf with SMTP id n26-20020a05600c181a00b003d220439cbfmr32703067wmp.10.1674669475201;
        Wed, 25 Jan 2023 09:57:55 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k21-20020a05600c1c9500b003da28dfdedcsm3421197wms.5.2023.01.25.09.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 09:57:54 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] ARM: dts: exynos: add unit address to DWC3 node wrapper in Exynos5250
Date:   Wed, 25 Jan 2023 18:57:50 +0100
Message-Id: <20230125175751.675090-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Neither simple-bus bindings nor dtc W=1 accept device nodes in soc@ node
which do not have unit address.  Therefore usethe address space
of child device (actual DWC3 Controller) as the wrapper's address to
fix:

  exynos5250-smdk5250.dtb: soc: usb3: {'compatible': ['samsung,exynos5250-dwusb3'],
    ... } should not be valid under {'type': 'object'}

  exynos5250.dtsi:638.16-653.5: Warning (simple_bus_reg): /soc/usb3: missing or empty reg/ranges property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos5250.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 97e89859ba3d..510be05f50ed 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -635,8 +635,9 @@ i2s2: i2s@12d70000 {
 			#sound-dai-cells = <1>;
 		};
 
-		usbdrd: usb3 {
+		usbdrd: usb-wrapper@12000000 {
 			compatible = "samsung,exynos5250-dwusb3";
+			reg = <0x12000000 0x10000>;
 			clocks = <&clock CLK_USB3>;
 			clock-names = "usbdrd30";
 			#address-cells = <1>;
-- 
2.34.1

