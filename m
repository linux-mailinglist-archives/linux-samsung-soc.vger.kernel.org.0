Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0040DB9F08
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 21 Sep 2019 19:02:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438400AbfIURC1 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 21 Sep 2019 13:02:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:39996 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438377AbfIURCX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 21 Sep 2019 13:02:23 -0400
Received: from localhost.localdomain (unknown [194.230.155.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 22C3020820;
        Sat, 21 Sep 2019 17:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569085342;
        bh=7bM9pWcEH6BpytbPP5wmLlyloc+4k6xwQpF8p+f70xM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qR2E8wm+9EaURawg/o+x76l6LzAuuiYPNDPR/GYxJO1kUtrcZVxbyzG/a8SpZCisk
         qBmOAmoVdbLFSv+xHT8mm1y8mjn09dZ75YSaBv9J5G0w/wfPph3DUxiwtyZcT+M0cf
         BVHSVrSUUUP+uHBlSyXnVzt8DBIWYUxytrsrZanY=
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
Subject: [RFT v3 6/8] ARM: dts: exynos: Remove MCT subnode for interrupt map on Exynos5250
Date:   Sat, 21 Sep 2019 19:01:50 +0200
Message-Id: <20190921170152.5033-6-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190921170152.5033-1-krzk@kernel.org>
References: <20190921170152.5033-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Multi Core Timer node has interrupts routed to two different parents -
GIC and combiner.  This was modeled with a interrupt-map within a
subnode but can be expressed in an easier and more common way, directly
in the node itself.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Not tested.
---
 arch/arm/boot/dts/exynos5250.dtsi | 30 ++++++++++++------------------
 1 file changed, 12 insertions(+), 18 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 7a01349317a3..e0fcf3c2f537 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -233,28 +233,22 @@
 			power-domains = <&pd_mau>;
 		};
 
-		timer@101c0000 {
+		mct: timer@101c0000 {
 			compatible = "samsung,exynos4210-mct";
 			reg = <0x101C0000 0x800>;
-			interrupt-controller;
-			#interrupt-cells = <2>;
-			interrupt-parent = <&mct_map>;
-			interrupts = <0 0>, <1 0>, <2 0>, <3 0>,
-				     <4 0>, <5 0>;
 			clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MCT>;
 			clock-names = "fin_pll", "mct";
-
-			mct_map: mct-map {
-				#interrupt-cells = <2>;
-				#address-cells = <0>;
-				#size-cells = <0>;
-				interrupt-map = <0x0 0 &combiner 23 3>,
-						<0x1 0 &combiner 23 4>,
-						<0x2 0 &combiner 25 2>,
-						<0x3 0 &combiner 25 3>,
-						<0x4 0 &gic 0 120 IRQ_TYPE_LEVEL_HIGH>,
-						<0x5 0 &gic 0 121 IRQ_TYPE_LEVEL_HIGH>;
-			};
+			#address-cells = <0>;
+			#size-cells = <0>;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&mct>;
+			interrupts = <0>, <1>, <2>, <3>, <4>, <5>;
+			interrupt-map = <0 &combiner 23 3>,
+					<1 &combiner 23 4>,
+					<2 &combiner 25 2>,
+					<3 &combiner 25 3>,
+					<4 &gic 0 120 IRQ_TYPE_LEVEL_HIGH>,
+					<5 &gic 0 121 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		pinctrl_0: pinctrl@11400000 {
-- 
2.17.1

