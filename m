Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 171304836B2
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  3 Jan 2022 19:18:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235417AbiACSSa (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 3 Jan 2022 13:18:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235401AbiACSSa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 3 Jan 2022 13:18:30 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEA68C061784
        for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Jan 2022 10:18:29 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id i11so44579706ljm.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Jan 2022 10:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UudNEOhd8hjgvWTNwwUUTLBQ8kPFCzMPVQCWWe7AQiE=;
        b=SnIS1OO69gfBCTUpwSiX1zLRER5uJzvgOue7kFytF9B1DYkXBK5WnNx7qI4BIjTrIB
         4FjNwNvLJE4hCSF+Kn6wLV3EHyL4j41xPx0jXB412k36S59TZc0jNovqre6FPHvbgp1q
         lAYd714bWH5RAtedTYTYpNyxpchPbYd2lCbXCKLHaNniYEp6AXfNFLbjTsORdqR8tnee
         5ynvE/ZOJbxPt7lRSR2qA8E4pn/veg5DPR1STSSgJpR8Y7aasVcO7D+TrGtTt8r9dsJQ
         cuIhnUsav0WgBl6ErGrStfSigyw1DcAvPxQ3Rs9Od6lV51+HOR7vnQM0iaTwdjFJCuDf
         jLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UudNEOhd8hjgvWTNwwUUTLBQ8kPFCzMPVQCWWe7AQiE=;
        b=aZdWJWewY7hSVbPZZM8MyDXW5KNRsPLkJYRJcZ0sD3rdFFfnVFRlA/2VNZGAYwxQ0l
         PZjt97bnz7M0RSV6QLULuYD7CqIdeywiY2cgRanUbnYranBf04GvsEqugNEhCyvZmMr3
         QsOiSopaJngEvVxbgsBjad3AeeBcQ3IfSyLRTe1gKjszWWqmP6azl/dd6QcAg71+07HS
         1p+jONzLT99ThXq84GUPoz0KuUN/bdfoQsEhanBLDd5LEbfzeWQWlUlAY35T3C4hyJiO
         qla4wBQpQP5CLUmF1NgDYdgkh9Q03LYWR3cafi6cke3NTLoZAnghDYbwI9csjct+8OtH
         67vQ==
X-Gm-Message-State: AOAM531xt6iubNx5MrctO5P69JYx5gwZjdSpM2i5Xcv0sdz1GAZuI+7v
        C7YJWRyBU+PWTd53Jvv8dBTEvQ==
X-Google-Smtp-Source: ABdhPJy5ByATnoPuV5/nfwj8ID14uKOqoK5QL0/gZZk4w7jS739/45sBrgMutt+ryjJmdzSPN7WvtA==
X-Received: by 2002:a2e:8899:: with SMTP id k25mr12073083lji.98.1641233908110;
        Mon, 03 Jan 2022 10:18:28 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id c32sm162352ljr.107.2022.01.03.10.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 10:18:27 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Chanho Park <chanho61.park@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: exynos: Add missing gpm6 and gpm7 nodes to Exynos850
Date:   Mon,  3 Jan 2022 20:18:26 +0200
Message-Id: <20220103181826.2136-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

gpm6 and gpm7 nodes are missing in Exynos850 device tree. Next errors
are reported because of that:

    Missing node for bank gpm6 - invalid DTB
    Missing node for bank gpm7 - invalid DTB

Add missing nodes to make those available to use, and to fix boot
errors.

Fixes: e3493220fd3e ("arm64: dts: exynos: Add initial Exynos850 SoC support")
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
NOTES:
  - Recommend to apply this patch after "arm64: dts: exynos: align
    pinctrl with dtschema in Exynos850"
  - This patch also brings back two interrupts removed in "arm64:
    dts: exynos: drop incorrectly placed wakeup interrupts in Exynos850"

 .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
index a71acf358d2d..f43e4a206282 100644
--- a/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
@@ -194,6 +194,26 @@ gpm5: gpm5-gpio-bank {
 		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	gpm6: gpm6-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	gpm7: gpm7-gpio-bank {
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	/* USI_CMGP0: HSI2C function */
 	hsi2c3_pins: hsi2c3-pins {
 		samsung,pins = "gpm0-0", "gpm1-0";
-- 
2.30.2

