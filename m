Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8F429CD50
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 26 Aug 2019 12:32:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731007AbfHZKcH (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 26 Aug 2019 06:32:07 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:54140 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730819AbfHZKcF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Aug 2019 06:32:05 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190826103203euoutp01694661fa05821ac0786d8d5ba19aa5ad~_cmrugPb-2530225302euoutp01g
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Aug 2019 10:32:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190826103203euoutp01694661fa05821ac0786d8d5ba19aa5ad~_cmrugPb-2530225302euoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1566815524;
        bh=gPl4hCyxlXu+7tO9CniGO/CTchCikJRVJ6QDZ8L5XPE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jB7K+WhsNNP4HlIfXyZZFncFNOBfaGBwrVoM6xakt6N2LwGWxdUqBDmZY6MFSvfHJ
         rMDzoEnzFOhMlr5HLCWpRMtOQ2knW3gKZtZn1T134/p2QBibMQM5D+qPH34JMLcJ3A
         gNJG/EwU/uyLnDZPKsBii7/Cq2wwz8gQG5t0GCrQ=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190826103203eucas1p11769de3b1e534c5027f72ebeef6deda0~_cmrRRjGS0324103241eucas1p1i;
        Mon, 26 Aug 2019 10:32:03 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 6E.56.04374.325B36D5; Mon, 26
        Aug 2019 11:32:03 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190826103202eucas1p16bd422bd505086e9ee27f528a8b48d57~_cmqhkO5I1331113311eucas1p11;
        Mon, 26 Aug 2019 10:32:02 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190826103202eusmtrp1c96010145a8bc4cdd6f839f73d19797c~_cmqTLDkC1243812438eusmtrp1p;
        Mon, 26 Aug 2019 10:32:02 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-6f-5d63b5236c07
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 48.63.04117.225B36D5; Mon, 26
        Aug 2019 11:32:02 +0100 (BST)
Received: from AMDC2765.DIGITAL.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190826103202eusmtip22a8d39baca137c8f59381178edc78f0c~_cmp76SPK0460104601eusmtip2d;
        Mon, 26 Aug 2019 10:32:02 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2 1/2] ARM: dts: exynos: Add support ARM architected timers
Date:   Mon, 26 Aug 2019 12:31:41 +0200
Message-Id: <20190826103142.3477-3-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826103142.3477-1-m.szyprowski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPIsWRmVeSWpSXmKPExsWy7djP87rKW5NjDdY1cVtsnLGe1eL6l+es
        FufPb2C32PT4GqvFjPP7mCzWHrnL7sDmsWlVJ5vH5iX1Hn1bVjF6fN4kF8ASxWWTkpqTWZZa
        pG+XwJXxeck9loKnwhW/Z8xha2DcKNDFyMkhIWAiMXPrDeYuRi4OIYEVjBId59azQDhfGCV+
        915ig3A+M0pcnb+VGablzNFTUInljBJtK94xgiTAWt4tCQex2QQMJbredrGB2CIC3hKTz/xl
        B2lgFtjGKLGl9wHYJGEBH4kf/1rAmlkEVCW2Ht7J2sXIwcErYCMx55gVxDJ5idUbDjCDhDkF
        bCUerDCECN9nk1iyNhrCdpE423WNDcIWlnh1fAs7hC0jcXpyD9g3EgLNjBIPz61lh3B6GCUu
        N81ghKiyljh8/CLYXmYBTYn1u/Qhwo4SbZfXgIUlBPgkbrwVBAkzA5mTtk1nhgjzSnS0CUFU
        q0nMOr4Obu3BC5egQeUhMb/zCBMkqCYwSpxpfsw+gVF+FsKyBYyMqxjFU0uLc9NTi43zUsv1
        ihNzi0vz0vWS83M3MQKTwel/x7/uYNz3J+kQowAHoxIPb0JpcqwQa2JZcWXuIUYJDmYlEd4c
        /cRYId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzVDA+ihQTSE0tSs1NTC1KLYLJMHJxSDYydSh67
        mcS0hR+V7BfrS33I8lXCyIgnP0PyU+fuJXFN3UmRjdJl9dFRNgqXsz4xZLNF6lboTuF57x9h
        q9f+69gVXaboygMzbS/mZdqv8fx0e5aHYwfHyeVek2U3tmf+/mTG2zWH61J7cX3z7Tcb363P
        bvh/dl7ucqkL+4Nuqd1L2xz9w2pvlBJLcUaioRZzUXEiAMB0oRkCAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrALMWRmVeSWpSXmKPExsVy+t/xe7pKW5NjDTZskbDYOGM9q8X1L89Z
        Lc6f38BusenxNVaLGef3MVmsPXKX3YHNY9OqTjaPzUvqPfq2rGL0+LxJLoAlSs+mKL+0JFUh
        I7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/j85J7LAVPhSt+z5jD
        1sC4UaCLkZNDQsBE4szRU2wgtpDAUkaJq2s8IOIyEienNbBC2MISf651AdVwAdV8YpS49eYB
        WAObgKFE19suMFtEwFfi8ZuVLCBFzAI7GCW27HgL1i0s4CPx418LI4jNIqAqsfXwTqA4Bwev
        gI3EnGNWEAvkJVZvOMAMEuYUsJV4sMIQ4h4biT+P5rFOYORbwMiwilEktbQ4Nz232EivODG3
        uDQvXS85P3cTIzA0tx37uWUHY9e74EOMAhyMSjy8CaXJsUKsiWXFlbmHGCU4mJVEeHP0E2OF
        eFMSK6tSi/Lji0pzUosPMZoCnTSRWUo0OR8YN3kl8YamhuYWlobmxubGZhZK4rwdAgdjhATS
        E0tSs1NTC1KLYPqYODilGhijZK9eTlmvlPNg0uMo9Sn2SkfzJ06Y8Daz5qbt7W3Hr7IbXHUP
        MtPOXvdTvfBkHf+JXlZ/G4c924LFjJnez5aOWWF/46Hm311qkkoCBvZml65/ZdvHIGSWJdi/
        YevH0ylC0kWM8j1sX1rurlm0pszzzzrZrowDvYKO1olXwwqOXdzUZ/gsKESJpTgj0VCLuag4
        EQAgUnEgYwIAAA==
X-CMS-MailID: 20190826103202eucas1p16bd422bd505086e9ee27f528a8b48d57
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190826103202eucas1p16bd422bd505086e9ee27f528a8b48d57
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190826103202eucas1p16bd422bd505086e9ee27f528a8b48d57
References: <20190826103142.3477-1-m.szyprowski@samsung.com>
        <CGME20190826103202eucas1p16bd422bd505086e9ee27f528a8b48d57@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

All CortexA7/A15 based Exynos SoCs have ARM architected timers, so enable
support for them directly in the base dtsi for Exynos3250, Exynos5250
and Exynos54xx SoCs. None of the known firmware properly configures arch
timer registers, so mark them as not-fw-configured and set frequency
to 24MHz, which is the only configuration supported by the remaining
drivers (clocks) so far.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi | 10 ++++++++++
 arch/arm/boot/dts/exynos5250.dtsi |  1 +
 arch/arm/boot/dts/exynos54xx.dtsi | 10 ++++++++++
 3 files changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 5659c4a10729..01e06b49d702 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -132,6 +132,16 @@
 			     <GIC_SPI 19 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+		clock-frequency = <24000000>;
+		arm,cpu-registers-not-fw-configured;
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		#address-cells = <1>;
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 4157a1315db9..f78897413cbc 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -1089,6 +1089,7 @@
 		 * so we need the value from DT.
 		 */
 		clock-frequency = <24000000>;
+		arm,cpu-registers-not-fw-configured;
 	};
 };
 
diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
index 9c3b63b7cac6..4e6c29530632 100644
--- a/arch/arm/boot/dts/exynos54xx.dtsi
+++ b/arch/arm/boot/dts/exynos54xx.dtsi
@@ -45,6 +45,16 @@
 		status = "disabled";
 	};
 
+	timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+		clock-frequency = <24000000>;
+		arm,cpu-registers-not-fw-configured;
+	};
+
 	soc: soc {
 		sysram@2020000 {
 			compatible = "mmio-sram";
-- 
2.17.1

