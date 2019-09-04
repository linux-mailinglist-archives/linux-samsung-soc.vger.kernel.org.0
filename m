Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19F49A7F45
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  4 Sep 2019 11:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729650AbfIDJYx (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 4 Sep 2019 05:24:53 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:48464 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729643AbfIDJYx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 05:24:53 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190904092451euoutp01c6d262c38313fc6137dd42453d9d546d~BMfkf7v4e1981319813euoutp010
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Sep 2019 09:24:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190904092451euoutp01c6d262c38313fc6137dd42453d9d546d~BMfkf7v4e1981319813euoutp010
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1567589091;
        bh=icoXPCScds9GOxVXeBes5t/StJRmpirbL+4fD1OUcHc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IDZMM5zj2j+MmlJddogyg0z0DqICszOtzjnuJ6h3eUFhx85J5t7a38MOAy7wm95dt
         41f66MrKBjE8G2g4gNNYFNAbeJpY9pcDUT3Y/BRXpDemacwE1YdUOBjmpDY9sWY1cw
         W4gEG7pF6a1hAyt6eKsTYmLuxTuKGUjnmZbmsdOk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190904092450eucas1p18c8d539bcda924804cd591f3aff27c1c~BMfkEjKRN1405814058eucas1p1-;
        Wed,  4 Sep 2019 09:24:50 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 8C.31.04469.2E28F6D5; Wed,  4
        Sep 2019 10:24:50 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190904092450eucas1p2d1d24bae0effe335a5068b39323e9475~BMfjYM_cK2897028970eucas1p25;
        Wed,  4 Sep 2019 09:24:50 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190904092449eusmtrp2adc59ab78340db36a1c141fe06f96663~BMfjKA1Ft2791027910eusmtrp2O;
        Wed,  4 Sep 2019 09:24:49 +0000 (GMT)
X-AuditID: cbfec7f2-569ff70000001175-ec-5d6f82e22208
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 12.07.04166.1E28F6D5; Wed,  4
        Sep 2019 10:24:49 +0100 (BST)
Received: from AMDC2765.DIGITAL.local (unknown [106.120.51.73]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190904092449eusmtip16267bc26912514d261a5a43022596f96~BMfi0NTcH1532115321eusmtip1J;
        Wed,  4 Sep 2019 09:24:49 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 1/3] arm64: dts: exynos: Move GPU under /soc node for
 Exynos5433
Date:   Wed,  4 Sep 2019 11:24:40 +0200
Message-Id: <20190904092442.26260-2-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190904092442.26260-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJIsWRmVeSWpSXmKPExsWy7djP87qPmvJjDXbfUrF4MG8bm8XGGetZ
        Lc6f38BuMeP8PiaLtUfusjuwemxa1cnm0bdlFaPH501yAcxRXDYpqTmZZalF+nYJXBmtF6ez
        F8yRqzgydRVLA+NHsS5GTg4JAROJR+8WM3cxcnEICaxglJj84DkrhPOFUeLKxOlQmc+MEt8+
        LWaCadn0qo8JIrGcUWL1/OuMcC1Xb09gBqliEzCU6HrbxQZiiwioSnxuW8AOYjMLbGeUaLws
        CGILCwRJ9C/+wwpiswDVPNo8lwXE5hWwlfj3cRE7xDZ5idUbDoDN5BSwk9i/6x3YMgmBy2wS
        kw9egTrJReJhzxYoW1ji1fEtUM0yEv93zmeCaGhmlHh4bi07hNPDKHG5aQYjRJW1xOHjF4HO
        4AA6T1Ni/S59iLCjxM21E9lBwhICfBI33gpCPMAnMWkbKFxAwrwSHW1CENVqErOOr4Nbe/DC
        JWYI20Oidf1aFkgATWSUOLVrM/sERvlZCMsWMDKuYhRPLS3OTU8tNsxLLdcrTswtLs1L10vO
        z93ECEwAp/8d/7SD8eulpEOMAhyMSjy8O/zyYoVYE8uKK3MPMUpwMCuJ8IbuyYkV4k1JrKxK
        LcqPLyrNSS0+xCjNwaIkzlvN8CBaSCA9sSQ1OzW1ILUIJsvEwSnVwKjgXVr7UmO+Zu4ksfQp
        ms9Ct0ZZ1mZ6mX+9+ypQ+/3mRytfby7mbAhr6Oh+s7r2uEr812mzr8xtDn9rkvr+UPcEp1+y
        cQrVO3cpl9/acUr34QztF+6nluVKTZsR0XO1epZPpWjgubu7algM1mi8+hJzqe5+jKFH0MU3
        92wqOr33qVosnzxl2jolluKMREMt5qLiRACs44W+/AIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFLMWRmVeSWpSXmKPExsVy+t/xu7oPm/JjDfo6TS0ezNvGZrFxxnpW
        i/PnN7BbzDi/j8li7ZG77A6sHptWdbJ59G1ZxejxeZNcAHOUnk1RfmlJqkJGfnGJrVK0oYWR
        nqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXkbrxensBXPkKo5MXcXSwPhRrIuRk0NC
        wERi06s+pi5GLg4hgaWMEq+737FBJGQkTk5rYIWwhSX+XOtigyj6xChx+sk2dpAEm4ChRNfb
        LrAGEQFVic9tC9hBipgFdjJKNF+fDVYkLBAgsf3BCrAiFqCiR5vnsoDYvAK2Ev8+LmKH2CAv
        sXrDAWYQm1PATmL/rneMILYQUE3/nk+sExj5FjAyrGIUSS0tzk3PLTbUK07MLS7NS9dLzs/d
        xAgMx23Hfm7ewXhpY/AhRgEORiUe3h1+ebFCrIllxZW5hxglOJiVRHhD9+TECvGmJFZWpRbl
        xxeV5qQWH2I0BTpqIrOUaHI+MFbySuINTQ3NLSwNzY3Njc0slMR5OwQOxggJpCeWpGanphak
        FsH0MXFwSjUwaq/avO1IOEeBbdGqMumc6pSD/3gTZwczvjzL4PlphlT3i9bdAvsOOUq+SQ3Q
        /icS+v33uvVWQZNTmM9aFx7p9w/PUtGd7vWliHX990OmZ/W2vzqhnm+x6EfowTmvVupaTvp9
        sPi8knCJi4nFTpFMx2B59mKN2MP/qj6/Kzj6hk1jwqYU9ddblFiKMxINtZiLihMBnLCadF0C
        AAA=
X-CMS-MailID: 20190904092450eucas1p2d1d24bae0effe335a5068b39323e9475
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190904092450eucas1p2d1d24bae0effe335a5068b39323e9475
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190904092450eucas1p2d1d24bae0effe335a5068b39323e9475
References: <20190904092442.26260-1-m.szyprowski@samsung.com>
        <CGME20190904092450eucas1p2d1d24bae0effe335a5068b39323e9475@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Mali GPU hardware module is a standard hardware module integrated to
Exynos5433 SoCs, so it should reside under the "/soc" node. The only SoC
components which are placed in the DT root, are those, which are a part
of CPUs: like ARM architected timers and ARM performance measurement
units.

Fixes: f0a6208b90bd ("arm64: dts: exynos: Add GPU/Mali T760 node to Exynos5433")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 102 ++++++++++-----------
 1 file changed, 51 insertions(+), 51 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index a76f620f7f35..239bf44d174b 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -249,57 +249,6 @@
 		};
 	};
 
-	gpu: gpu@14ac0000 {
-		compatible = "samsung,exynos5433-mali", "arm,mali-t760";
-		reg = <0x14ac0000 0x5000>;
-		interrupts = <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "job", "mmu", "gpu";
-		clocks = <&cmu_g3d CLK_ACLK_G3D>;
-		clock-names = "core";
-		power-domains = <&pd_g3d>;
-		operating-points-v2 = <&gpu_opp_table>;
-		status = "disabled";
-
-		gpu_opp_table: opp_table {
-			compatible = "operating-points-v2";
-
-			opp-160000000 {
-				opp-hz = /bits/ 64 <160000000>;
-				opp-microvolt = <1000000>;
-			};
-			opp-267000000 {
-				opp-hz = /bits/ 64 <267000000>;
-				opp-microvolt = <1000000>;
-			};
-			opp-350000000 {
-				opp-hz = /bits/ 64 <350000000>;
-				opp-microvolt = <1025000>;
-			};
-			opp-420000000 {
-				opp-hz = /bits/ 64 <420000000>;
-				opp-microvolt = <1025000>;
-			};
-			opp-500000000 {
-				opp-hz = /bits/ 64 <500000000>;
-				opp-microvolt = <1075000>;
-			};
-			opp-550000000 {
-				opp-hz = /bits/ 64 <550000000>;
-				opp-microvolt = <1125000>;
-			};
-			opp-600000000 {
-				opp-hz = /bits/ 64 <600000000>;
-				opp-microvolt = <1150000>;
-			};
-			opp-700000000 {
-				opp-hz = /bits/ 64 <700000000>;
-				opp-microvolt = <1150000>;
-			};
-		};
-	};
-
 	psci {
 		compatible = "arm,psci";
 		method = "smc";
@@ -1125,6 +1074,57 @@
 			power-domains = <&pd_gscl>;
 		};
 
+		gpu: gpu@14ac0000 {
+			compatible = "samsung,exynos5433-mali", "arm,mali-t760";
+			reg = <0x14ac0000 0x5000>;
+			interrupts = <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu";
+			clocks = <&cmu_g3d CLK_ACLK_G3D>;
+			clock-names = "core";
+			power-domains = <&pd_g3d>;
+			operating-points-v2 = <&gpu_opp_table>;
+			status = "disabled";
+
+			gpu_opp_table: opp_table {
+				compatible = "operating-points-v2";
+
+				opp-160000000 {
+					opp-hz = /bits/ 64 <160000000>;
+					opp-microvolt = <1000000>;
+				};
+				opp-267000000 {
+					opp-hz = /bits/ 64 <267000000>;
+					opp-microvolt = <1000000>;
+				};
+				opp-350000000 {
+					opp-hz = /bits/ 64 <350000000>;
+					opp-microvolt = <1025000>;
+				};
+				opp-420000000 {
+					opp-hz = /bits/ 64 <420000000>;
+					opp-microvolt = <1025000>;
+				};
+				opp-500000000 {
+					opp-hz = /bits/ 64 <500000000>;
+					opp-microvolt = <1075000>;
+				};
+				opp-550000000 {
+					opp-hz = /bits/ 64 <550000000>;
+					opp-microvolt = <1125000>;
+				};
+				opp-600000000 {
+					opp-hz = /bits/ 64 <600000000>;
+					opp-microvolt = <1150000>;
+				};
+				opp-700000000 {
+					opp-hz = /bits/ 64 <700000000>;
+					opp-microvolt = <1150000>;
+				};
+			};
+		};
+
 		scaler_0: scaler@15000000 {
 			compatible = "samsung,exynos5433-scaler";
 			reg = <0x15000000 0x1294>;
-- 
2.17.1

