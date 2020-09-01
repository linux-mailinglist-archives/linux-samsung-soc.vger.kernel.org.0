Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7F882589B9
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  1 Sep 2020 09:55:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727842AbgIAHzH (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 1 Sep 2020 03:55:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:46620 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727952AbgIAHzF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Sep 2020 03:55:05 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 41DEA2087D;
        Tue,  1 Sep 2020 07:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598946904;
        bh=jo0TEjb4oFqy23dX7Vx1SN0zpgavTqm3lgmfKgpI6go=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=09NFs5Nw/grlyEykgeMtJ2vqGVM4kUbas5enm4A5HkuiMNwdPzSBuffDA2EdF3G9X
         7pc2y4yjsNNXUHl8P7ThQIPmvWZz0UhJ4IVCQK+5k79muEy0sU7Biwxw+/YTx64kvy
         w0LkMzD1T2/3hYESEP0q6krysqUHZuTA7lfTyMag=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 09/13] ARM: dts: exynos: Use S5M8767 clock in S3C RTC in Exynos5250 Spring
Date:   Tue,  1 Sep 2020 09:54:13 +0200
Message-Id: <20200901075417.22481-10-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901075417.22481-1-krzk@kernel.org>
References: <20200901075417.22481-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use the 32 kHz clock from S5M8767 PMIC in the S3C RTC node. Except
making the S3C RTC working, this also fixes dtbs_check warnings:

  arch/arm/boot/dts/exynos5250-spring.dt.yaml: rtc@101e0000: clocks: [[2, 337]] is too short
  arch/arm/boot/dts/exynos5250-spring.dt.yaml: rtc@101e0000: clock-names: ['rtc'] is too short

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5250-spring.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/dts/exynos5250-spring.dts
index b6fcf847fc2f..166a0d287633 100644
--- a/arch/arm/boot/dts/exynos5250-spring.dts
+++ b/arch/arm/boot/dts/exynos5250-spring.dts
@@ -7,6 +7,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/clock/samsung,s2mps11.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/input/input.h>
@@ -141,7 +142,7 @@
 						 <1200000>, <1200000>,
 						 <1200000>, <1200000>;
 
-		clocks {
+		s5m8767_osc: clocks {
 			compatible = "samsung,s5m8767-clk";
 			#clock-cells = <1>;
 			clock-output-names = "en32khz_ap",
@@ -522,6 +523,12 @@
 	};
 };
 
+&rtc {
+	status = "okay";
+	clocks = <&clock CLK_RTC>, <&s5m8767_osc S2MPS11_CLK_AP>;
+	clock-names = "rtc", "rtc_src";
+};
+
 &sd1_bus4 {
 	samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 };
-- 
2.17.1

