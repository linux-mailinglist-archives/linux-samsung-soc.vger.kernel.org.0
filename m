Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B183B9EF7
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 21 Sep 2019 19:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438368AbfIURCQ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 21 Sep 2019 13:02:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:39786 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438031AbfIURCP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 21 Sep 2019 13:02:15 -0400
Received: from localhost.localdomain (unknown [194.230.155.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 49C4321882;
        Sat, 21 Sep 2019 17:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569085334;
        bh=MnKtv/tVqwT4kcJd+5kJhN0nMZpd4Rb6U5zHzZea9kc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Qdzak8FXP6sF8L36U+PL+SiqYIyQODTkLk9gEs6cDNSplUhr21xWrYLZsacQJ4otl
         O5qhwe5zbzuiGF2pfAzrAdjBf5hDooZxA5F0XQ6UjYwB+QNmC7LOG1yab/wC0yW8BE
         a4OJPmQJa1VDWY+f9H1Mv1FcMZnfXAObLIJcu7Bo=
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
Subject: [RFT v3 4/8] ARM: dts: exynos: Remove MCT subnode for interrupt map on Exynos4210
Date:   Sat, 21 Sep 2019 19:01:48 +0200
Message-Id: <20190921170152.5033-4-krzk@kernel.org>
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
 arch/arm/boot/dts/exynos4210.dtsi | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 6d3f19562aab..38c49ab8c733 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -109,23 +109,19 @@
 		mct: timer@10050000 {
 			compatible = "samsung,exynos4210-mct";
 			reg = <0x10050000 0x800>;
-			interrupt-parent = <&mct_map>;
-			interrupts = <0>, <1>, <2>, <3>, <4>, <5>;
 			clocks = <&clock CLK_FIN_PLL>, <&clock CLK_MCT>;
 			clock-names = "fin_pll", "mct";
-
-			mct_map: mct-map {
-				#interrupt-cells = <1>;
-				#address-cells = <0>;
-				#size-cells = <0>;
-				interrupt-map =
-					<0 &gic 0 57 IRQ_TYPE_LEVEL_HIGH>,
+			#address-cells = <0>;
+			#size-cells = <0>;
+			#interrupt-cells = <1>;
+			interrupt-parent = <&mct>;
+			interrupts = <0>, <1>, <2>, <3>, <4>, <5>;
+			interrupt-map = <0 &gic 0 57 IRQ_TYPE_LEVEL_HIGH>,
 					<1 &gic 0 69 IRQ_TYPE_LEVEL_HIGH>,
 					<2 &combiner 12 6>,
 					<3 &combiner 12 7>,
 					<4 &gic 0 42 IRQ_TYPE_LEVEL_HIGH>,
 					<5 &gic 0 48 IRQ_TYPE_LEVEL_HIGH>;
-			};
 		};
 
 		watchdog: watchdog@10060000 {
-- 
2.17.1

