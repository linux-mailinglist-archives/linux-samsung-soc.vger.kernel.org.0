Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D5A4581F0
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 27 Jun 2019 13:56:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbfF0L4O (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 27 Jun 2019 07:56:14 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46728 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbfF0L4O (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 27 Jun 2019 07:56:14 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190627115611euoutp01b83f38d601f78e6e4474765620a2627f~sDDAI8Bjg1395813958euoutp01z;
        Thu, 27 Jun 2019 11:56:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190627115611euoutp01b83f38d601f78e6e4474765620a2627f~sDDAI8Bjg1395813958euoutp01z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1561636571;
        bh=bE/VlrZLAxBMgBl05LgJ8tALX1n4la4rZt1pZKOt6vY=;
        h=From:To:Cc:Subject:Date:References:From;
        b=PM53scPuvQnnZHnBZlvIvh9DYQ3SOOWGygNaxCLJ3mYhknE/aiSWLHe3HEFkzdoAN
         mJjEKvT6tYdL0zhI16EZGonFlFae3G7b6AZjyoV7vYh0EYX2tJJ/f/1JFj8LGyYZLr
         zWhUVn36sK7EIR0LdqE5T0nTZxUgo8VbVKduHQtw=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190627115610eucas1p1c17318ef9b7cf89f79839ad7b0476d3b~sDC-pYGTE0487204872eucas1p1Z;
        Thu, 27 Jun 2019 11:56:10 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 43.C1.04377.ADEA41D5; Thu, 27
        Jun 2019 12:56:10 +0100 (BST)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190627115610eucas1p2973086ecaa3b2c3b7c802c7c8ac5e6bc~sDC-BVekw0574705747eucas1p2c;
        Thu, 27 Jun 2019 11:56:10 +0000 (GMT)
X-AuditID: cbfec7f4-5632c9c000001119-3e-5d14aeda348e
Received: from eusync1.samsung.com ( [203.254.199.211]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id C2.0B.04140.9DEA41D5; Thu, 27
        Jun 2019 12:56:09 +0100 (BST)
Received: from AMDC2765.DIGITAL.local ([106.120.51.73]) by
        eusync1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0 64bit
        (built May  5 2014)) with ESMTPA id <0PTR008XZAHGTW00@eusync1.samsung.com>;
        Thu, 27 Jun 2019 12:56:09 +0100 (BST)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] ARM: dts: exynos: Remove PMU interrupt from MALI400 GPU on
 Exynos4210
Date:   Thu, 27 Jun 2019 13:55:53 +0200
Message-id: <20190627115553.32426-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBLMWRmVeSWpSXmKPExsWy7djPc7q31onEGpyYImWxccZ6Vovz5zew
        W8w4v4/JYu2Ru+wOLB6bVnWyefRtWcXo8XmTXABzFJdNSmpOZllqkb5dAlfG48OrWAvO6Fes
        W7+ZqYFxuloXIyeHhICJxN7+bUwgtpDACkaJLVd9IOzPjBIdX3JhajZPPsTYxcgFFF/GKHFm
        62YmCOc/o8T82cdZQKrYBAwlut52sYHYIgKqEp/bFrCDFDEL9DFKXN87lxkkISwQIfH74yR2
        EJsFqOhryyywBl4BW4mrF3YxQqyTl1i94QAzSLOEwElWiY0Pm5kgEi4S67fuhrJlJC5P7maB
        KGpmlHh4bi07hNPDKHG5aQbUKGuJw8cvsoLYzAJ8EpO2TQcaywEU55XoaBOCKPGQWPdnKTPE
        07ESO1/uYZrAKL6AkWEVo3hqaXFuemqxUV5quV5xYm5xaV66XnJ+7iZGYHyc/nf8yw7GXX+S
        DjEKcDAq8fAy7BGOFWJNLCuuzD3EKMHBrCTCmx8mEivEm5JYWZValB9fVJqTWnyIUZqDRUmc
        t5rhQbSQQHpiSWp2ampBahFMlomDU6qBUelepOnBdbzPbMXKA9s3Xv0+oTKeRyqROSzviszv
        xf9lV294GjfpR8e2P+ej+Yv575o+KHHJk1RWOPpp9tTeZ0e/2R20COPtr3026afH4QdbXgbe
        1tGLWbLgvMDKo29m5TqzuOSUff6e6rBAZO6DfvWIyHc8mcFTWv13XNGec5f35HSN2cy5x5RY
        ijMSDbWYi4oTAeaBeDqLAgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOJMWRmVeSWpSXmKPExsVy+t/xy7o314nEGmzq07XYOGM9q8X58xvY
        LWac38dksfbIXXYHFo9NqzrZPPq2rGL0+LxJLoA5issmJTUnsyy1SN8ugSvj8eFVrAVn9CvW
        rd/M1MA4Xa2LkZNDQsBEYvPkQ4xdjFwcQgJLGCW6D31kgXAamSSuzFrIAlLFJmAo0fW2iw3E
        FhFQlfjctoAdpIhZYAKjxOqFs1hBEsICERK/P05iB7FZgIq+tswCa+AVsJW4emEXI8Q6eYnV
        Gw4wT2DkWsDIsIpRJLW0ODc9t9hIrzgxt7g0L10vOT93EyPQu9uO/dyyg7HrXfAhRgEORiUe
        3hU7hWOFWBPLiitzDzFKcDArifDmh4nECvGmJFZWpRblxxeV5qQWH2KU5mBREuftEDgYIySQ
        nliSmp2aWpBaBJNl4uCUamDcdc9I4+bXAoZ1ytUMn5LX2N2bbHmoTk8sPjlIzlsz7s3kE5ki
        Sb8r6v2NWa+5dz/94RvE9kJ6y6MFPK6pZy3fH2dYHLX3y02Vm14tjA6Xv61cpam3WqnJR9+e
        8admaMIfjx8v+E8nrToSfE9GI0b4rsHpNucfAQlBZfwfwuo/xXnOWWYX6azEUpyRaKjFXFSc
        CADKtaOD6gEAAA==
X-CMS-MailID: 20190627115610eucas1p2973086ecaa3b2c3b7c802c7c8ac5e6bc
CMS-TYPE: 201P
X-CMS-RootMailID: 20190627115610eucas1p2973086ecaa3b2c3b7c802c7c8ac5e6bc
References: <CGME20190627115610eucas1p2973086ecaa3b2c3b7c802c7c8ac5e6bc@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The PMU module of MALI400 GPU is optional and it looks that it is not
present on Exynos4210, because any access to its registers causes external
abort. This patch removes "pmu" interrupt for Exynos4210 SoCs, so the
driver will skip the PMU module. This fixes following fault during kernel
boot:

 8<--- cut here ---
 Unhandled fault: imprecise external abort (0x1406) at 0x00000000
 pgd = (ptrval)
 [00000000] *pgd=00000000
 Internal error: : 1406 [#1] PREEMPT SMP ARM
 Modules linked in:
 CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.2.0-rc6-next-20190625-00005-g6fc2b61c64ab #6241
 Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
 PC is at lima_pmu_init+0x38/0x108
 LR is at arm_heavy_mb+0x1c/0x38
 pc : [<c059eb78>]    lr : [<c011aa6c>]    psr: 60000013
 sp : d94c9da0  ip : d9000200  fp : d94bd070
 r10: 00000001  r9 : 00000000  r8 : c1065aec
 r7 : 00000000  r6 : 00000000  r5 : 00000000  r4 : d94bd070
 r3 : e0932000  r2 : 0000ffff  r1 : 00000000  r0 : d94bd070
 Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
 Control: 10c5387d  Table: 4000404a  DAC: 00000051
 Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
 ...
 [<c059eb78>] (lima_pmu_init) from [<c059e6f8>] (lima_device_init+0x244/0x5a0)
 [<c059e6f8>] (lima_device_init) from [<c059e40c>] (lima_pdev_probe+0x7c/0xd8)
 [<c059e40c>] (lima_pdev_probe) from [<c05afcb8>] (platform_drv_probe+0x48/0x9c)
 [<c05afcb8>] (platform_drv_probe) from [<c05ad594>] (really_probe+0x1c4/0x400)
 [<c05ad594>] (really_probe) from [<c05ad988>] (driver_probe_device+0x78/0x1b8)
 [<c05ad988>] (driver_probe_device) from [<c05add30>] (device_driver_attach+0x58/0x60)
 [<c05add30>] (device_driver_attach) from [<c05ade34>] (__driver_attach+0xfc/0x160)
 [<c05ade34>] (__driver_attach) from [<c05ab650>] (bus_for_each_dev+0x68/0xb4)
 [<c05ab650>] (bus_for_each_dev) from [<c05ac734>] (bus_add_driver+0x104/0x20c)
 [<c05ac734>] (bus_add_driver) from [<c05aece0>] (driver_register+0x78/0x10c)
 [<c05aece0>] (driver_register) from [<c0103214>] (do_one_initcall+0x8c/0x430)
 [<c0103214>] (do_one_initcall) from [<c0f01328>] (kernel_init_freeable+0x3c8/0x4d0)
 [<c0f01328>] (kernel_init_freeable) from [<c0ac3aa0>] (kernel_init+0x8/0x10c)
 [<c0ac3aa0>] (kernel_init) from [<c01010b4>] (ret_from_fork+0x14/0x20)
 Exception stack(0xd94c9fb0 to 0xd94c9ff8)
 ...
 ---[ end trace 96ddc2a2879732ab ]---

The PMU module seems to work fine on Exynos4412 SoCs, so the patch also
moves the interrupt definitions to exynos4210.dtsi and exynos4412.dtsi
respectively, to keep only the common part in exynos4.dtsi.

Fixes: 13efd80acaa4 ("ARM: dts: exynos: Add GPU/Mali 400 node to Exynos4")
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi    | 22 ----------------------
 arch/arm/boot/dts/exynos4210.dtsi | 20 ++++++++++++++++++++
 arch/arm/boot/dts/exynos4412.dtsi | 22 ++++++++++++++++++++++
 3 files changed, 42 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 6005cfbbed89..7863a21a7a64 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -54,28 +54,6 @@
 	gpu: gpu@13000000 {
 		compatible = "samsung,exynos4210-mali", "arm,mali-400";
 		reg = <0x13000000 0x10000>;
-		interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
-			     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
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
 		/*
 		 * CLK_G3D is not actually bus clock but a IP-level clock.
 		 * The bus clock is not described in hardware manual.
diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 6122da368092..f220716239db 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -450,6 +450,26 @@
 };
 
 &gpu {
+	interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-names = "gp",
+			  "gpmmu",
+			  "pp0",
+			  "ppmmu0",
+			  "pp1",
+			  "ppmmu1",
+			  "pp2",
+			  "ppmmu2",
+			  "pp3",
+			  "ppmmu3";
 	operating-points-v2 = <&gpu_opp_table>;
 
 	gpu_opp_table: opp_table {
diff --git a/arch/arm/boot/dts/exynos4412.dtsi b/arch/arm/boot/dts/exynos4412.dtsi
index 7bed6842575a..d20db2dfe8e2 100644
--- a/arch/arm/boot/dts/exynos4412.dtsi
+++ b/arch/arm/boot/dts/exynos4412.dtsi
@@ -717,6 +717,28 @@
 };
 
 &gpu {
+	interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
+		     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+	interrupt-names = "gp",
+			  "gpmmu",
+			  "pp0",
+			  "ppmmu0",
+			  "pp1",
+			  "ppmmu1",
+			  "pp2",
+			  "ppmmu2",
+			  "pp3",
+			  "ppmmu3",
+			  "pmu";
 	operating-points-v2 = <&gpu_opp_table>;
 
 	gpu_opp_table: opp_table {
-- 
2.17.1

