Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC27B61BC
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 18 Sep 2019 12:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbfIRKrT (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 18 Sep 2019 06:47:19 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56577 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725899AbfIRKrT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Sep 2019 06:47:19 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190918104717euoutp017775816d052caad94831fe7b8d0c78c5~FgpjAEVwb1221812218euoutp019
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Sep 2019 10:47:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190918104717euoutp017775816d052caad94831fe7b8d0c78c5~FgpjAEVwb1221812218euoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1568803637;
        bh=QugPE4MZnx6zOp3ibFXL7/tFN1aS3dnRmu2waVbHhbU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jQBxVnX+gdnkAq5lPfUkO0AHwl8a0jW+wZRyExafM93EuhJwvo7nIEV/Zcu4CY/FS
         fp/yZ0x9MWJyi3Dy2rvlXe+8PHUEAJrwtnd2biMOZGXk2nrDSrskBILBC5Zd/PieaC
         rIgFNZUfhBfTFgF/2+dR/S8vg1Mz0wc9qX5P8Xlk=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190918104716eucas1p251ed5e0abaefa4977186953756c7a64d~Fgph_xYSK3054430544eucas1p2j;
        Wed, 18 Sep 2019 10:47:16 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 58.E3.04374.43B028D5; Wed, 18
        Sep 2019 11:47:16 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190918104715eucas1p2a051a537a0e86becfbbcb36c172ef705~FgphB12FA2474324743eucas1p2l;
        Wed, 18 Sep 2019 10:47:15 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190918104715eusmtrp28a53b56ffffba7d241ce9ab9da663899~FgpgyO67u1585315853eusmtrp2W;
        Wed, 18 Sep 2019 10:47:15 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-7b-5d820b34c12f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 26.C6.04166.33B028D5; Wed, 18
        Sep 2019 11:47:15 +0100 (BST)
Received: from AMDC3061.DIGITAL.local (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190918104714eusmtip1d4031a28619ce1c6ff5a432d49a3f23d~FgpgJq3xP0589505895eusmtip1M;
        Wed, 18 Sep 2019 10:47:14 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
        krzk@kernel.org, sbkim73@samsung.com, alsa-devel@alsa-project.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v1 9/9] ARM: dts: arndale: Add audio support (WM1811 CODEC
 boards)
Date:   Wed, 18 Sep 2019 12:46:34 +0200
Message-Id: <20190918104634.15216-10-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190918104634.15216-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSe0gUYRTF+2Z2dkZtZRpNbyZJi0IGaaLRVBJGQZsU2AMlTWrTQUVdZUdN
        C1F3NV/5SmTFfGFiaonbJpJJWrq1qPkCDVE0IyGRlsJXvm3XUfrvd889h3P5+CicqSMcqAhF
        HKdUyKOkYktR6+fVgRNeVqrgk8v9wI4Md2Hs69Jmgi35PiNmRzJ0iK3SDxDs4KCWZJdHsjBW
        9+MrwZYOdmBsk36SZBd+dxJsxns9yXb/yiTY4fpFzMdapl1QiWVtZZOkTNeYLZa9qU2Racq3
        kSy/pRHJFnRH/MhAS+9QLioigVO6n79nGa6vLkexKjpRs34jFakkOciCAtoL1ubG8BxkSTF0
        PYKpXKPYvGDoRQTFXxwFXkCQN3psLzDRpBYJgRcIatSFu4MpUJu2QppdYtoD8j7lIzPb0nYw
        UZ69U4HTGxgYN8tE5oUNfQvSjH8IM4toF9AMfdzRJbQ3jLbNkEKdE7zUfsDNbGHS54emd9qA
        biXheb0KF0yXILOkSiSwDcwZWnbDjrDdVoUJATWCJ+0TpDAUIvhmqEaC6xx0G4ZNZ1Cm+1yh
        +Z27IF8A42QPZpaBtoYx4wGzjJvwaasGF2QJZD1mBLczrDdqMIEdIHdme/ccGUz19JLCMxYg
        qCvCC5FT2f+uaoQakT0Xz0eHcbyngnvgxsuj+XhFmFtITLQOmX5P35Zh6S3q2LjfhWgKSfdL
        oD81mCHkCXxSdBcCCpfaSvySU4IZSag86SGnjLmrjI/i+C50mBJJ7SWP9k0HMXSYPI6L5LhY
        Trm3xSgLh1REGK4q/P/OrkUF9lZ61Iy7sD4HY+dvjq055x+9MruSc3Zjq+J25aG8KaaoobLA
        11ndHhIQoQxkLmfRiqXisL4BLvIZnxzsn9dptaK9aEfg9qdzNhXz12u9K5g7p2yvLekGgo7+
        DMisVad70j75NVpS8irQNd33zKR+NW01sWFcKuLD5R7HcSUv/weelMSjOQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgkeLIzCtJLcpLzFFi42I5/e/4XV1j7qZYg+WXhC2uXDzEZLFxxnpW
        i6kPn7BZXGndxGgx/8g5Vovz5zewW3y70sFksenxNVaLGef3MVmsPXKX3eLz+/2sFq17j7Bb
        HH7TzmpxccUXJgc+jw2fm9g8ds66y+6xaVUnm8fmJfUe0+f8Z/To27KK0ePzJrkA9ig9m6L8
        0pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jCML5jAWNAlU
        TP8d1MDYxNvFyMkhIWAicXttM0sXIxeHkMBSRol5tyYydTFyACWkJOa3KEHUCEv8udbFBlHz
        iVHi6oS7rCAJNgFDid6jfYwgtoiAmMTtOZ3MIEXMAl3MEu93/AIrEhYIkrj1eA4biM0ioCox
        /cJBFhCbV8BG4urOJ+wQG+QlVm84wAxicwLFP114AFYjJGAtseDYNMYJjHwLGBlWMYqklhbn
        pucWG+oVJ+YWl+al6yXn525iBMbCtmM/N+9gvLQx+BCjAAejEg/vgVMNsUKsiWXFlbmHGCU4
        mJVEeANq62OFeFMSK6tSi/Lji0pzUosPMZoCHTWRWUo0OR8Yp3kl8YamhuYWlobmxubGZhZK
        4rwdAgdjhATSE0tSs1NTC1KLYPqYODilGhgtJE8nfospyq5aV8GRzePT0spkWBB9bhLnY5PQ
        xe8fWUx8sPPO4k+s5dXf5DavX/lXg6ObeUH1sUenbf1deTV71pjaWT5mE+Q7pNlgevpq5vT6
        h759171cI7gZ9+9y/69avnTD0WNVpRGOTF0vl86UFPpydc66U3nsLplqrXy/ju1kzJu7bIMS
        S3FGoqEWc1FxIgAnEdf7mwIAAA==
X-CMS-MailID: 20190918104715eucas1p2a051a537a0e86becfbbcb36c172ef705
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190918104715eucas1p2a051a537a0e86becfbbcb36c172ef705
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190918104715eucas1p2a051a537a0e86becfbbcb36c172ef705
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
        <CGME20190918104715eucas1p2a051a537a0e86becfbbcb36c172ef705@eucas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add sound node and the clock configurations for the I2S controller
for audio support on the Exynos5250 SoC Arndale boards with
WM1811 based audio daugther board.

We need to increase drive strength of the I2S bus, otherwise
the audio CODEC doesn't work. Likely the CODEC's master clock
is the main issue here.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/boot/dts/exynos5250-arndale.dts | 27 +++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index dc6fa6fe83f1..62aa6720aa88 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -11,6 +11,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/clock/samsung,s2mps11.h>
+#include <dt-bindings/sound/samsung-i2s.h>
 #include "exynos5250.dtsi"
 
 / {
@@ -135,6 +136,12 @@
 		};
 	};
 
+	sound {
+		compatible = "samsung,arndale-wm1811";
+		samsung,audio-cpu = <&i2s0>;
+		samsung,audio-codec = <&wm1811>;
+	};
+
 	fixed-rate-clocks {
 		xxti {
 			compatible = "samsung,clock-xxti";
@@ -499,12 +506,24 @@
 	};
 };
 
+&clock {
+	assigned-clocks = <&clock CLK_FOUT_EPLL>;
+	assigned-clock-rates = <49152000>;
+};
+
+&clock_audss {
+	assigned-clocks = <&clock_audss EXYNOS_MOUT_AUDSS>;
+	assigned-clock-parents = <&clock CLK_FOUT_EPLL>;
+};
+
 &i2c_3 {
 	status = "okay";
 
-	wm1811a@1a {
+	wm1811: codec@1a {
 		compatible = "wlf,wm1811";
 		reg = <0x1a>;
+		clocks = <&i2s0 CLK_I2S_CDCLK>;
+		clock-names = "MCLK1";
 
 		AVDD2-supply = <&main_dc_reg>;
 		CPVDD-supply = <&main_dc_reg>;
@@ -540,9 +559,15 @@
 };
 
 &i2s0 {
+	assigned-clocks = <&i2s0 CLK_I2S_RCLK_SRC>;
+	assigned-clock-parents = <&clock_audss EXYNOS_I2S_BUS>;
 	status = "okay";
 };
 
+&i2s0_bus {
+	samsung,pin-drv = <EXYNOS4_PIN_DRV_LV2>;
+};
+
 &mixer {
 	status = "okay";
 };
-- 
2.17.1

