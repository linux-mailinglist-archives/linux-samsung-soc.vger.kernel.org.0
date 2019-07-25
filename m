Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7E2A7492F
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Jul 2019 10:34:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389504AbfGYIey (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 25 Jul 2019 04:34:54 -0400
Received: from foss.arm.com ([217.140.110.172]:53782 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388546AbfGYIey (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 25 Jul 2019 04:34:54 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B0CE344;
        Thu, 25 Jul 2019 01:34:54 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7006F3F694;
        Thu, 25 Jul 2019 01:34:53 -0700 (PDT)
From:   Guillaume <guillaume.gardet@arm.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Guillaume GARDET <guillaume.gardet@arm.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH V2 1/2] arm: dts: exynos: Add GPU/Mali T604 node to exynos5250
Date:   Thu, 25 Jul 2019 10:34:32 +0200
Message-Id: <20190725083433.6505-1-guillaume.gardet@arm.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190724072008.6272-1-guillaume.gardet@free.fr>
References: <20190724072008.6272-1-guillaume.gardet@free.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Guillaume GARDET <guillaume.gardet@arm.com>

Add nodes for GPU (Mali T604) to Exynos5250.
Tested with kmscube and glmark2-es2-drm on Chromebook snow.
Load tested on arndale board.

Signed-off-by: Guillaume GARDET <guillaume.gardet@arm.com>

Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
---
V2 changes: 
  * move mali node as /soc sub-node
  * move gpu_opp_table as mali sub-node
  * minor style updates
  * test on arndale board
  * enable by default
  * add dt bindings, in a separate patch

 arch/arm/boot/dts/exynos5250.dtsi | 47 +++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index d5e0392b409e..f7f34d469bde 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -328,6 +328,52 @@
 			iommus = <&sysmmu_rotator>;
 		};
 
+		mali: gpu@11800000 {
+			compatible = "samsung,exynos5250-mali", "arm,mali-t604";
+			reg = <0x11800000 0x5000>;
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu";
+			clocks = <&clock CLK_G3D>;
+			clock-names = "g3d";
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&pd_g3d>;
+
+			gpu_opp_table: gpu-opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					opp-microvolt = <925000>;
+				};
+				opp-160000000 {
+					opp-hz = /bits/ 64 <160000000>;
+					opp-microvolt = <925000>;
+				};
+				opp-266000000 {
+					opp-hz = /bits/ 64 <266000000>;
+					opp-microvolt = <1025000>;
+				};
+				opp-350000000 {
+					opp-hz = /bits/ 64 <350000000>;
+					opp-microvolt = <1075000>;
+				};
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+					opp-microvolt = <1125000>;
+				};
+				opp-450000000 {
+					opp-hz = /bits/ 64 <450000000>;
+					opp-microvolt = <1150000>;
+				};
+				opp-533000000 {
+					opp-hz = /bits/ 64 <533000000>;
+					opp-microvolt = <1250000>;
+				};
+			};
+		};
+
 		tmu: tmu@10060000 {
 			compatible = "samsung,exynos5250-tmu";
 			reg = <0x10060000 0x100>;
-- 
2.22.0

