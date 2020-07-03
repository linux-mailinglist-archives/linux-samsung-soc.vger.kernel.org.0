Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0708213F5B
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  3 Jul 2020 20:45:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726779AbgGCSpJ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 3 Jul 2020 14:45:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:42062 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726265AbgGCSpI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Jul 2020 14:45:08 -0400
Received: from localhost.localdomain (unknown [194.230.155.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D20242084C;
        Fri,  3 Jul 2020 18:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593801908;
        bh=VOTi1V2zpkYNZEtWGYLh7ChvI2/wVXR9VoyMzyTCcfw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KDukjuyUkFjF3oBik86tY+eZc0sVKGM9gFvfH9FujniO+XFg3xJOVdomLKi2n7Jc6
         kfx0ikweHXe1ZX7wsCLQtjYx9+/NG/I0Iex7Q9xDOO7xTpbLX1Sttz4x7FpO+WguTs
         7TxPRxHBI/59QNf5XtSi5rcmTg+p/WWLHo4Oj9ek=
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
Subject: [PATCH v3 3/3] ARM: dts: exynos: Define fixed regulators in root node for consistency in SMDK5420
Date:   Fri,  3 Jul 2020 20:44:51 +0200
Message-Id: <20200703184451.19535-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703184451.19535-1-krzk@kernel.org>
References: <20200703184451.19535-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Remove the regulators node and define fixed regulators directly under
the root node.  This makes SMDK5420 board consistent with other Exynos
boards.

Name the fixed regulator nodes consistently.

Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v2:
1. Remove also "reg" property

Changes since v1:
1. New patch
---
 arch/arm/boot/dts/exynos5420-smdk5420.dts | 53 ++++++++++-------------
 1 file changed, 22 insertions(+), 31 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index e3f2afe8359a..83fa800fa1eb 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -32,40 +32,31 @@
 		};
 	};
 
-	regulators {
-		compatible = "simple-bus";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		vdd: fixed-regulator@0 {
-			compatible = "regulator-fixed";
-			reg = <0>;
-			regulator-name = "vdd-supply";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-always-on;
-		};
+	vdd: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd-supply";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
 
-		dbvdd: fixed-regulator@1 {
-			compatible = "regulator-fixed";
-			reg = <1>;
-			regulator-name = "dbvdd-supply";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-		};
+	dbvdd: regulator-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "dbvdd-supply";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 
-		spkvdd: fixed-regulator@2 {
-			compatible = "regulator-fixed";
-			reg = <2>;
-			regulator-name = "spkvdd-supply";
-			regulator-min-microvolt = <5000000>;
-			regulator-max-microvolt = <5000000>;
-			regulator-always-on;
-		};
+	spkvdd: regulator-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "spkvdd-supply";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
 	};
 
-	usb300_vbus_reg: regulator-usb300 {
+	usb300_vbus_reg: regulator-3 {
 		compatible = "regulator-fixed";
 		regulator-name = "VBUS0";
 		regulator-min-microvolt = <5000000>;
@@ -76,7 +67,7 @@
 		enable-active-high;
 	};
 
-	usb301_vbus_reg: regulator-usb301 {
+	usb301_vbus_reg: regulator-4 {
 		compatible = "regulator-fixed";
 		regulator-name = "VBUS1";
 		regulator-min-microvolt = <5000000>;
-- 
2.17.1

