Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2F19BB955
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 23 Sep 2019 18:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395294AbfIWQOt (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 23 Sep 2019 12:14:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:59014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2395236AbfIWQOs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 12:14:48 -0400
Received: from localhost.localdomain (unknown [194.230.155.145])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BDF392089F;
        Mon, 23 Sep 2019 16:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569255288;
        bh=Gx9Sv2CF5OTZ8trzCLgiPyHqEt/kwqhbnPXiX7vSKz0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eFkWh0ZyAyKn0SZZEtgiznSGxr4BKJrN4TzxQN9S+UAeWu0zt7pfITee7a9iKJJFV
         l3Whu42Bscx77qLGDXx8OhuB1mVNquw9Kvxzd/XfSXXpKqu8vdKIGnhyczrDPhSv+Z
         CAebRLdmzMfoEBfBQ5/ngLippU8mFOvjLhT6WvM4=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [RFT v4 6/8] ARM: dts: exynos: Remove MCT subnode for interrupt map on Exynos5250
Date:   Mon, 23 Sep 2019 18:14:09 +0200
Message-Id: <20190923161411.9236-6-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190923161411.9236-1-krzk@kernel.org>
References: <20190923161411.9236-1-krzk@kernel.org>
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

Changes since v3:
1. Use interrupts-extended instead of interrupts-map.
---
 arch/arm/boot/dts/exynos5250.dtsi | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 7a01349317a3..a549eafd2c64 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -236,25 +236,14 @@
 		timer@101c0000 {
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
+			interrupts-extended = <&combiner 23 3>,
+					      <&combiner 23 4>,
+					      <&combiner 25 2>,
+					      <&combiner 25 3>,
+					      <&gic 0 120 IRQ_TYPE_LEVEL_HIGH>,
+					      <&gic 0 121 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
 		pinctrl_0: pinctrl@11400000 {
-- 
2.17.1

