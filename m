Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD89B9EFD
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 21 Sep 2019 19:02:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438396AbfIURC1 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 21 Sep 2019 13:02:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:40176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438395AbfIURC0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 21 Sep 2019 13:02:26 -0400
Received: from localhost.localdomain (unknown [194.230.155.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DC43621882;
        Sat, 21 Sep 2019 17:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569085346;
        bh=K7z//Y/yLJWsZpw2WZeSz4YckSjsAIIkQrg5GbosjAU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eOCyX2tGs+6hBnI46pENiaekDrJv2+ild9ii0foLROp6wXYdIrsxBJGc7K73fVjBV
         /WJPERUnAjGmhfrBOV1I4pRs+PCF3/b0ZvhPpHitUgG030cPL4oyWAEeEyjGnoshBY
         7NmqiV3yAEkvPX3NLyS1AM4vEogbSsfz2Zq1ElH8=
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
Subject: [RFT v3 7/8] ARM: dts: exynos: Remove MCT subnode for interrupt map on Exynos54xx
Date:   Sat, 21 Sep 2019 19:01:51 +0200
Message-Id: <20190921170152.5033-7-krzk@kernel.org>
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

Tested on Odroid XU (Exynos5410), Odroid HC1 (Exynos5422) and Arndale
Octa (Exynos5420).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos54xx.dtsi | 37 ++++++++++++++-----------------
 1 file changed, 17 insertions(+), 20 deletions(-)

diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
index 247d23872384..a1c10a9a86f8 100644
--- a/arch/arm/boot/dts/exynos54xx.dtsi
+++ b/arch/arm/boot/dts/exynos54xx.dtsi
@@ -67,27 +67,24 @@
 		mct: timer@101c0000 {
 			compatible = "samsung,exynos4210-mct";
 			reg = <0x101c0000 0xb00>;
-			interrupt-parent = <&mct_map>;
+			#address-cells = <0>;
+			#size-cells = <0>;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&mct>;
 			interrupts = <0>, <1>, <2>, <3>, <4>, <5>, <6>, <7>,
-					<8>, <9>, <10>, <11>;
-
-			mct_map: mct-map {
-				#interrupt-cells = <1>;
-				#address-cells = <0>;
-				#size-cells = <0>;
-				interrupt-map = <0 &combiner 23 3>,
-						<1 &combiner 23 4>,
-						<2 &combiner 25 2>,
-						<3 &combiner 25 3>,
-						<4 &gic 0 120 IRQ_TYPE_LEVEL_HIGH>,
-						<5 &gic 0 121 IRQ_TYPE_LEVEL_HIGH>,
-						<6 &gic 0 122 IRQ_TYPE_LEVEL_HIGH>,
-						<7 &gic 0 123 IRQ_TYPE_LEVEL_HIGH>,
-						<8 &gic 0 128 IRQ_TYPE_LEVEL_HIGH>,
-						<9 &gic 0 129 IRQ_TYPE_LEVEL_HIGH>,
-						<10 &gic 0 130 IRQ_TYPE_LEVEL_HIGH>,
-						<11 &gic 0 131 IRQ_TYPE_LEVEL_HIGH>;
-			};
+				     <8>, <9>, <10>, <11>;
+			interrupt-map = <0 &combiner 23 3>,
+					<1 &combiner 23 4>,
+					<2 &combiner 25 2>,
+					<3 &combiner 25 3>,
+					<4 &gic 0 120 IRQ_TYPE_LEVEL_HIGH>,
+					<5 &gic 0 121 IRQ_TYPE_LEVEL_HIGH>,
+					<6 &gic 0 122 IRQ_TYPE_LEVEL_HIGH>,
+					<7 &gic 0 123 IRQ_TYPE_LEVEL_HIGH>,
+					<8 &gic 0 128 IRQ_TYPE_LEVEL_HIGH>,
+					<9 &gic 0 129 IRQ_TYPE_LEVEL_HIGH>,
+					<10 &gic 0 130 IRQ_TYPE_LEVEL_HIGH>,
+					<11 &gic 0 131 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		watchdog: watchdog@101d0000 {
-- 
2.17.1

