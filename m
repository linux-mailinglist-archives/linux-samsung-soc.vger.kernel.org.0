Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C5D5728F1
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 24 Jul 2019 09:20:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726166AbfGXHUW (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 24 Jul 2019 03:20:22 -0400
Received: from smtp1-g21.free.fr ([212.27.42.1]:57465 "EHLO smtp1-g21.free.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725882AbfGXHUW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 24 Jul 2019 03:20:22 -0400
Received: from localhost.localdomain (unknown [91.163.92.88])
        by smtp1-g21.free.fr (Postfix) with ESMTP id 8711EB0054E;
        Wed, 24 Jul 2019 09:20:20 +0200 (CEST)
From:   Guillaume GARDET <guillaume.gardet@free.fr>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Guillaume GARDET <guillaume.gardet@arm.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH] arm: dts: exynos: Add GPU/Mali T604 node to exynos5250
Date:   Wed, 24 Jul 2019 09:20:08 +0200
Message-Id: <20190724072008.6272-1-guillaume.gardet@free.fr>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Guillaume GARDET <guillaume.gardet@arm.com>

Add nodes for GPU (Mali T604) to Exynos5250, disabled by default.
Tested with kmscube on Chromebook snow.

Signed-off-by: Guillaume GARDET <guillaume.gardet@arm.com>

Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org

---
 arch/arm/boot/dts/exynos5250.dtsi | 47 +++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index d5e0392b409e..5ce4b2853cf2 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -1097,6 +1097,53 @@
 		 */
 		clock-frequency = <24000000>;
 	};
+
+	mali: gpu@0x11800000 {
+		compatible = "samsung,exynos5250-mali", "arm,mali-t604";
+		reg = <0x11800000 0x5000>;
+		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+		             <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "job", "mmu", "gpu";
+		clocks = <&clock CLK_G3D>;
+		clock-names = "g3d";
+		operating-points-v2 = <&gpu_opp_table>;
+		power-domains = <&pd_g3d>;
+		status = "disabled";
+	};
+
+	gpu_opp_table: gpu-opp-table {
+		compatible = "operating-points-v2";
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-microvolt = <925000>;
+		};
+		opp-160000000 {
+			opp-hz = /bits/ 64 <160000000>;
+			opp-microvolt = <925000>;
+		};
+		opp-266000000 {
+			opp-hz = /bits/ 64 <266000000>;
+			opp-microvolt = <1025000>;
+		};
+		opp-350000000 {
+			opp-hz = /bits/ 64 <350000000>;
+			opp-microvolt = <1075000>;
+		};
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <1125000>;
+		};
+		opp-450000000 {
+			opp-hz = /bits/ 64 <450000000>;
+			opp-microvolt = <1150000>;
+		};
+		opp-533000000 {
+			opp-hz = /bits/ 64 <533000000>;
+			opp-microvolt = <1250000>;
+		};
+	};
 };
 
 &dp {
-- 
2.22.0


