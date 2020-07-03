Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA211213F55
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  3 Jul 2020 20:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbgGCSpC (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 3 Jul 2020 14:45:02 -0400
Received: from mail.kernel.org ([198.145.29.99]:41902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726265AbgGCSpC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Jul 2020 14:45:02 -0400
Received: from localhost.localdomain (unknown [194.230.155.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4D24F2084C;
        Fri,  3 Jul 2020 18:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593801902;
        bh=E5ODK+zPYcUI/xkNuYY2iPmP/64zi/oLkCo3IcDM4rY=;
        h=From:To:Cc:Subject:Date:From;
        b=Nfp4bInTESWHj3zeVVnzenA8XTMNSHun3Hg0QxpYgU39DB01VWLdwSMTksIoTnwOO
         YMSYSq6lMIlvz6BCKaVEzdeszASYrLdN7qerDBVyEA4cxU6nbSJfZTnv4gkQBfNAP1
         1PERMbcQYpqsPLQmEOZyxSTcL3rzIcqrJ8fVpAQA=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v3 1/3] ARM: dts: exynos: Define fixed regulators in root node for consistency in Origen
Date:   Fri,  3 Jul 2020 20:44:49 +0200
Message-Id: <20200703184451.19535-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Remove the regulators node and define fixed regulators directly under
the root node.  This makes Exynos4412 Origen board consistent with other
Exynos boards.

Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v2:
1. Remove also "reg" property

Changes since v1:
1. New patch
---
 arch/arm/boot/dts/exynos4412-origen.dts | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-origen.dts b/arch/arm/boot/dts/exynos4412-origen.dts
index dc865be40751..8b11ad391252 100644
--- a/arch/arm/boot/dts/exynos4412-origen.dts
+++ b/arch/arm/boot/dts/exynos4412-origen.dts
@@ -33,20 +33,13 @@
 		reg = <0x0203F000 0x1000>;
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		mmc_reg: regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "VMEM_VDD_2.8V";
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <2800000>;
-			gpio = <&gpx1 1 GPIO_ACTIVE_HIGH>;
-			enable-active-high;
-		};
+	mmc_reg: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VMEM_VDD_2.8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&gpx1 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
 	};
 
 	display-timings {
-- 
2.17.1

