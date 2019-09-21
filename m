Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97E4BB9F04
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 21 Sep 2019 19:02:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438415AbfIURCc (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 21 Sep 2019 13:02:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:40286 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438407AbfIURCa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 21 Sep 2019 13:02:30 -0400
Received: from localhost.localdomain (unknown [194.230.155.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7F78F21907;
        Sat, 21 Sep 2019 17:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569085349;
        bh=WMIbHRXqKnTwV8Qyk4jQI2KbATovpC39pOQTs+GXcc0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Jn4oa/WZlNu7XYMRyE3vTpcyy7SDnSQ+LtCys+Cm8vBnYTyInxGkF//s24yG0dQ6j
         tlH9/OEOS4zVc9KHgRphEc3DrVt8hSdMjy24cqhja0nhBFxCFv5DJnD2VyhB2Qerql
         Oc5FC5g6t8yJv1hwGkHoSZkBI7VJFDIThDe+dFaQ=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH v3 8/8] ARM: dts: exynos: Use defines for MCT interrupt GIC SPI/PPI specifier
Date:   Sat, 21 Sep 2019 19:01:52 +0200
Message-Id: <20190921170152.5033-8-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190921170152.5033-1-krzk@kernel.org>
References: <20190921170152.5033-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Replace hard-coded number with appropriate define for GIC SPI or PPI
specifier in interrupt.  This makes code easier to read.  No expected
functionality change.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos4210.dtsi |  8 ++++----
 arch/arm/boot/dts/exynos4412.dtsi |  4 ++--
 arch/arm/boot/dts/exynos5250.dtsi |  4 ++--
 arch/arm/boot/dts/exynos54xx.dtsi | 16 ++++++++--------
 4 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 38c49ab8c733..650bee6355e4 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -116,12 +116,12 @@
 			#interrupt-cells = <1>;
 			interrupt-parent = <&mct>;
 			interrupts = <0>, <1>, <2>, <3>, <4>, <5>;
-			interrupt-map = <0 &gic 0 57 IRQ_TYPE_LEVEL_HIGH>,
-					<1 &gic 0 69 IRQ_TYPE_LEVEL_HIGH>,
+			interrupt-map = <0 &gic GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
+					<1 &gic GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
 					<2 &combiner 12 6>,
 					<3 &combiner 12 7>,
-					<4 &gic 0 42 IRQ_TYPE_LEVEL_HIGH>,
-					<5 &gic 0 48 IRQ_TYPE_LEVEL_HIGH>;
+					<4 &gic GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+					<5 &gic GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		watchdog: watchdog@10060000 {
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index 7e2dabefd53f..0810c14bf424 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -253,11 +253,11 @@
 			#interrupt-cells = <1>;
 			interrupt-parent = <&mct>;
 			interrupts = <0>, <1>, <2>, <3>, <4>;
-			interrupt-map = <0 &gic 0 57 IRQ_TYPE_LEVEL_HIGH>,
+			interrupt-map = <0 &gic GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
 					<1 &combiner 12 5>,
 					<2 &combiner 12 6>,
 					<3 &combiner 12 7>,
-					<4 &gic 1 12 IRQ_TYPE_LEVEL_HIGH>;
+					<4 &gic GIC_PPI 12 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		watchdog: watchdog@10060000 {
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index e0fcf3c2f537..61f22feefda9 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -247,8 +247,8 @@
 					<1 &combiner 23 4>,
 					<2 &combiner 25 2>,
 					<3 &combiner 25 3>,
-					<4 &gic 0 120 IRQ_TYPE_LEVEL_HIGH>,
-					<5 &gic 0 121 IRQ_TYPE_LEVEL_HIGH>;
+					<4 &gic GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+					<5 &gic GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		pinctrl_0: pinctrl@11400000 {
diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
index a1c10a9a86f8..f52c7ce5d320 100644
--- a/arch/arm/boot/dts/exynos54xx.dtsi
+++ b/arch/arm/boot/dts/exynos54xx.dtsi
@@ -77,14 +77,14 @@
 					<1 &combiner 23 4>,
 					<2 &combiner 25 2>,
 					<3 &combiner 25 3>,
-					<4 &gic 0 120 IRQ_TYPE_LEVEL_HIGH>,
-					<5 &gic 0 121 IRQ_TYPE_LEVEL_HIGH>,
-					<6 &gic 0 122 IRQ_TYPE_LEVEL_HIGH>,
-					<7 &gic 0 123 IRQ_TYPE_LEVEL_HIGH>,
-					<8 &gic 0 128 IRQ_TYPE_LEVEL_HIGH>,
-					<9 &gic 0 129 IRQ_TYPE_LEVEL_HIGH>,
-					<10 &gic 0 130 IRQ_TYPE_LEVEL_HIGH>,
-					<11 &gic 0 131 IRQ_TYPE_LEVEL_HIGH>;
+					<4 &gic GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+					<5 &gic GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+					<6 &gic GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+					<7 &gic GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+					<8 &gic GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+					<9 &gic GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+					<10 &gic GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					<11 &gic GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		watchdog: watchdog@101d0000 {
-- 
2.17.1

