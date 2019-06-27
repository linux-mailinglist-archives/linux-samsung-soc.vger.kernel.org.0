Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5E31581F5
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 27 Jun 2019 13:57:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726635AbfF0L5n (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 27 Jun 2019 07:57:43 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40878 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726586AbfF0L5n (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 27 Jun 2019 07:57:43 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190627115742euoutp02360c5fa081d140b2278925e78f00a645~sDEUyh_Pi1462914629euoutp02I;
        Thu, 27 Jun 2019 11:57:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190627115742euoutp02360c5fa081d140b2278925e78f00a645~sDEUyh_Pi1462914629euoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1561636662;
        bh=hto40vsNehMa0OIT4TeT4+M7PyFgh8WgqzLrY9L7ymI=;
        h=From:To:Cc:Subject:Date:References:From;
        b=mRazVsNvMyXmqGazO8gqmSFXF87gi3dbJY/91Tj9AM2C6TmNg3ba/CFkKkvF0ioaU
         oYV7skonm58+YN1esnIhUSjv3HRdJOwqyCuiNBtkifz657AJRMvIASnrEH4R00NoNg
         FYGfuoLTpM+fNdIx8drq3CJ+De6lbVKwESxKxw2w=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190627115741eucas1p287521ce7d41c47328e19234fb2ca1c65~sDEUXSkki1575615756eucas1p2r;
        Thu, 27 Jun 2019 11:57:41 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 11.9A.04325.53FA41D5; Thu, 27
        Jun 2019 12:57:41 +0100 (BST)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190627115740eucas1p124ef4db737adadbe2a4fb8e4f10fd5e8~sDETtgFpf2812028120eucas1p1j;
        Thu, 27 Jun 2019 11:57:40 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-00-5d14af35a215
Received: from eusync1.samsung.com ( [203.254.199.211]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 81.3B.04140.43FA41D5; Thu, 27
        Jun 2019 12:57:40 +0100 (BST)
Received: from AMDC2765.DIGITAL.local ([106.120.51.73]) by
        eusync1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0 64bit
        (built May  5 2014)) with ESMTPA id <0PTR008YQAK1TW00@eusync1.samsung.com>;
        Thu, 27 Jun 2019 12:57:40 +0100 (BST)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Move MALI400 GPU node to "/soc"
Date:   Thu, 27 Jun 2019 13:57:25 +0200
Message-id: <20190627115725.32594-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrOLMWRmVeSWpSXmKPExsWy7djPc7qm60ViDZo+illsnLGe1eL8+Q3s
        FjPO72OyWHvkLrsDi8emVZ1sHn1bVjF6fN4kF8AcxWWTkpqTWZZapG+XwJXx4p1RwTelilkt
        K5gbGNdIdTFyckgImEi8332YrYuRi0NIYAWjxImp/cwQzmdGiTU797F3MXKAVb19rwcRX8Yo
        8eMSTMd/Rok320E6ODnYBAwlut52sYHYIgKqEp/bFrCDFDEL9DFKXN87F6xIWMBJ4sXXE2A2
        C1DRgnO7WUFsXgFbiebOZhaIm+QlVm84AHaGhMBJVolVf/4zQiRcJF6eXMMOYctIXJ7czQJR
        1Mwo8fDcWnYIp4dR4nLTDKgOa4nDxy+CrWAW4JOYtG06M8RDvBIdbUIQJR4Scxp3sIKEhQRi
        Jfb8SJjAKL6AkWEVo3hqaXFuemqxcV5quV5xYm5xaV66XnJ+7iZGYHSc/nf86w7GfX+SDjEK
        cDAq8fCu2CkcK8SaWFZcmXuIUYKDWUmENz9MJFaINyWxsiq1KD++qDQntfgQozQHi5I4bzXD
        g2ghgfTEktTs1NSC1CKYLBMHp1QD41SG0m32DbP575m3Xzp07+bFFWubVBPPq5bLqy3Yd2D3
        rd2B30M1Ov7z2/5iP8BvdLuWtf6cZd03l2U6BrMXJk3VXZe7pEr4W9/NYCm9+s0yM3lLo5Z2
        sBhPEmP4OYdfXGbCqylX7kXcf7Ypz7Tq07twtfSwTQx2PKZfsyQzqs7sCQ6cvrImW4mlOCPR
        UIu5qDgRALSYeliKAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKJMWRmVeSWpSXmKPExsVy+t/xy7om60ViDb6917bYOGM9q8X58xvY
        LWac38dksfbIXXYHFo9NqzrZPPq2rGL0+LxJLoA5issmJTUnsyy1SN8ugSvjxTujgm9KFbNa
        VjA3MK6R6mLk4JAQMJF4+16vi5GLQ0hgCaPExqvv2SCcRiaJPa8/sXcxcnKwCRhKdL3tYgOx
        RQRUJT63LWAHKWIWmMAosXrhLFaQhLCAk8SLryeYQWwWoKIF53aDxXkFbCWaO5tZQGwJAXmJ
        1RsOME9g5FrAyLCKUSS1tDg3PbfYSK84Mbe4NC9dLzk/dxMj0LPbjv3csoOx613wIUYBDkYl
        Ht4VO4VjhVgTy4orcw8xSnAwK4nw5oeJxArxpiRWVqUW5ccXleakFh9ilOZgURLn7RA4GCMk
        kJ5YkpqdmlqQWgSTZeLglGpgnFX9amHBCSGvD+qxnIcP+y3NE3m5IfRS2f2XRfsLl1/NvzPj
        e09nufqCZ/P7J39QURYW5Wn687hl+cOpS+J4rc41Gty2lTm5pOLaz1oBX2bOV4t07z+oWh06
        WSJmwc5Ds44282gaOb+0n8NmqpF0KMyuL8mD80owm5vyzMzLa4Pe3NbaNbPuixJLcUaioRZz
        UXEiAJAjMi/oAQAA
X-CMS-MailID: 20190627115740eucas1p124ef4db737adadbe2a4fb8e4f10fd5e8
CMS-TYPE: 201P
X-CMS-RootMailID: 20190627115740eucas1p124ef4db737adadbe2a4fb8e4f10fd5e8
References: <CGME20190627115740eucas1p124ef4db737adadbe2a4fb8e4f10fd5e8@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

MALI400 GPU hardware module is a standard hardware module integrated to
Exynos3210/4210/4412 SoCs, so it should reside under the "/soc" node.
The only SoC components which are placed in the DT root, are those, which
are a part of CPUs: like ARM architected timers and ARM performance
measurement units.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi | 66 +++++++++++++++----------------
 arch/arm/boot/dts/exynos4.dtsi    | 28 ++++++-------
 2 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index c17870a54acf..5659c4a10729 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -126,39 +126,6 @@
 		};
 	};
 
-	gpu: gpu@13000000 {
-		compatible = "samsung,exynos4210-mali", "arm,mali-400";
-		reg = <0x13000000 0x10000>;
-		interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "gp",
-				  "gpmmu",
-				  "pp0",
-				  "ppmmu0",
-				  "pp1",
-				  "ppmmu1",
-				  "pp2",
-				  "ppmmu2",
-				  "pp3",
-				  "ppmmu3",
-				  "pmu";
-		clocks = <&cmu CLK_G3D>,
-			 <&cmu CLK_SCLK_G3D>;
-		clock-names = "bus", "core";
-		power-domains = <&pd_g3d>;
-		status = "disabled";
-		/* TODO: operating points for DVFS, assigned clock as 134 MHz */
-	};
-
 	pmu {
 		compatible = "arm,cortex-a7-pmu";
 		interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
@@ -495,6 +462,39 @@
 			status = "disabled";
 		};
 
+		gpu: gpu@13000000 {
+			compatible = "samsung,exynos4210-mali", "arm,mali-400";
+			reg = <0x13000000 0x10000>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 179 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 181 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "gp",
+					  "gpmmu",
+					  "pp0",
+					  "ppmmu0",
+					  "pp1",
+					  "ppmmu1",
+					  "pp2",
+					  "ppmmu2",
+					  "pp3",
+					  "ppmmu3",
+					  "pmu";
+			clocks = <&cmu CLK_G3D>,
+				 <&cmu CLK_SCLK_G3D>;
+			clock-names = "bus", "core";
+			power-domains = <&pd_g3d>;
+			status = "disabled";
+			/* TODO: operating points for DVFS, assigned clock as 134 MHz */
+		};
+
 		mfc: codec@13400000 {
 			compatible = "samsung,mfc-v7";
 			reg = <0x13400000 0x10000>;
diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 7863a21a7a64..1264cc431ff6 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -51,20 +51,6 @@
 		serial3 = &serial_3;
 	};
 
-	gpu: gpu@13000000 {
-		compatible = "samsung,exynos4210-mali", "arm,mali-400";
-		reg = <0x13000000 0x10000>;
-		/*
-		 * CLK_G3D is not actually bus clock but a IP-level clock.
-		 * The bus clock is not described in hardware manual.
-		 */
-		clocks = <&clock CLK_G3D>,
-			 <&clock CLK_SCLK_G3D>;
-		clock-names = "bus", "core";
-		power-domains = <&pd_g3d>;
-		status = "disabled";
-	};
-
 	pmu: pmu {
 		compatible = "arm,cortex-a9-pmu";
 		interrupt-parent = <&combiner>;
@@ -429,6 +415,20 @@
 			};
 		};
 
+		gpu: gpu@13000000 {
+			compatible = "samsung,exynos4210-mali", "arm,mali-400";
+			reg = <0x13000000 0x10000>;
+			/*
+			 * CLK_G3D is not actually bus clock but a IP-level clock.
+			 * The bus clock is not described in hardware manual.
+			 */
+			clocks = <&clock CLK_G3D>,
+				 <&clock CLK_SCLK_G3D>;
+			clock-names = "bus", "core";
+			power-domains = <&pd_g3d>;
+			status = "disabled";
+		};
+
 		i2s1: i2s@13960000 {
 			compatible = "samsung,s3c6410-i2s";
 			reg = <0x13960000 0x100>;
-- 
2.17.1

