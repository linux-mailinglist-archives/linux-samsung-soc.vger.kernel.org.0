Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD7C29BFF6
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 27 Oct 2020 18:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1816886AbgJ0RKW (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 27 Oct 2020 13:10:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:38474 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1816884AbgJ0RKV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 13:10:21 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D523A22202;
        Tue, 27 Oct 2020 17:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603818620;
        bh=P3GI9LWe497sjdA4d4F0jRX0TDKcgI7enO1f0pii/NE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=2BhYLErzqeYsJ5YOl6E9MG1l6D11/lW7n7yoAEOXk7UY+Ya1ROXoX6BcwWpVN9MOg
         2wIjhruRfVv/f2rvyKjXLSwerrmpaOsCjga5vf8NrZWW3hbNmhvjFngkvbxV1mcXFY
         qNObRRlowOQUB6FsC9AQnIzljF+nFvyZhGtg73+I=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v2 08/12] ARM: dts: exynos: adjust node names to DT spec in Exynos542x boards
Date:   Tue, 27 Oct 2020 18:09:43 +0100
Message-Id: <20201027170947.132725-9-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027170947.132725-1-krzk@kernel.org>
References: <20201027170947.132725-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Devicetree specification expects device node names to have a generic
name, representing the class of a device.  Also the convention for node
names is to use hyphens, not underscores.

No functional changes.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts      | 4 ++--
 arch/arm/boot/dts/exynos5420-peach-pit.dts         | 6 +++---
 arch/arm/boot/dts/exynos5420-smdk5420.dts          | 2 +-
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi      | 2 +-
 arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi  | 2 +-
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 4 ++--
 arch/arm/boot/dts/exynos5422-odroidxu3.dts         | 8 ++++----
 arch/arm/boot/dts/exynos5800-peach-pi.dts          | 4 ++--
 8 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index dd7f8385d81e..bf457d0c02eb 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -39,7 +39,7 @@ oscclk {
 		};
 	};
 
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 
 		wakeup {
@@ -344,7 +344,7 @@ &hdmi {
 &hsi2c_4 {
 	status = "okay";
 
-	s2mps11_pmic@66 {
+	pmic@66 {
 		compatible = "samsung,s2mps11-pmic";
 		reg = <0x66>;
 
diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 2bcbdf8a39bf..315b3dc9c017 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -138,7 +138,7 @@ panel_in: endpoint {
 		};
 	};
 
-	mmc1_pwrseq: mmc1_pwrseq {
+	mmc1_pwrseq: mmc1-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&gpx0 0 GPIO_ACTIVE_LOW>; /* WIFI_EN */
 		clocks = <&max77802 MAX77802_CLK_32K_CP>;
@@ -205,7 +205,7 @@ &hsi2c_4 {
 	status = "okay";
 	clock-frequency = <400000>;
 
-	max77802: max77802-pmic@9 {
+	max77802: pmic@9 {
 		compatible = "maxim,max77802";
 		interrupt-parent = <&gpx3>;
 		interrupts = <1 IRQ_TYPE_NONE>;
@@ -615,7 +615,7 @@ &hsi2c_7 {
 	status = "okay";
 	clock-frequency = <400000>;
 
-	max98090: codec@10 {
+	max98090: audio-codec@10 {
 		compatible = "maxim,max98090";
 		reg = <0x10>;
 		interrupts = <2 IRQ_TYPE_NONE>;
diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 4e49d8095b29..d506da9fa661 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -129,7 +129,7 @@ &hdmi {
 &hsi2c_4 {
 	status = "okay";
 
-	s2mps11_pmic@66 {
+	pmic@66 {
 		compatible = "samsung,s2mps11-pmic";
 		reg = <0x66>;
 
diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
index b1cf9414ce17..25fb6331c75e 100644
--- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -503,7 +503,7 @@ &dmc {
 &hsi2c_4 {
 	status = "okay";
 
-	s2mps11_pmic@66 {
+	pmic@66 {
 		compatible = "samsung,s2mps11-pmic";
 		reg = <0x66>;
 		samsung,s2mps11-acokb-ground;
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
index b5ec4f47eb3a..86b96f9706db 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-audio.dtsi
@@ -40,7 +40,7 @@ codec {
 
 &hsi2c_5 {
 	status = "okay";
-	max98090: max98090@10 {
+	max98090: audio-codec@10 {
 		compatible = "maxim,max98090";
 		reg = <0x10>;
 		interrupt-parent = <&gpx3>;
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index 5da2d81e3be2..e35af40a55cb 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -13,12 +13,12 @@
 #include "exynos5422-odroid-core.dtsi"
 
 / {
-	gpio_keys {
+	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
 		pinctrl-0 = <&power_key>;
 
-		power_key {
+		power-key {
 			/*
 			 * The power button (SW2) is connected to the PWRON
 			 * pin (active high) of the S2MPS11 PMIC, which acts
diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
index d0f6ac5fa79d..53aee3d56f6a 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
@@ -21,28 +21,28 @@ &i2c_0 {
 	status = "okay";
 
 	/* A15 cluster: VDD_ARM */
-	ina231@40 {
+	power-sensor@40 {
 		compatible = "ti,ina231";
 		reg = <0x40>;
 		shunt-resistor = <10000>;
 	};
 
 	/* memory: VDD_MEM */
-	ina231@41 {
+	power-sensor@41 {
 		compatible = "ti,ina231";
 		reg = <0x41>;
 		shunt-resistor = <10000>;
 	};
 
 	/* GPU: VDD_G3D */
-	ina231@44 {
+	power-sensor@44 {
 		compatible = "ti,ina231";
 		reg = <0x44>;
 		shunt-resistor = <10000>;
 	};
 
 	/* A7 cluster: VDD_KFC */
-	ina231@45 {
+	power-sensor@45 {
 		compatible = "ti,ina231";
 		reg = <0x45>;
 		shunt-resistor = <10000>;
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 60ab0effe474..0ce3443d39a8 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -138,7 +138,7 @@ panel_in: endpoint {
 		};
 	};
 
-	mmc1_pwrseq: mmc1_pwrseq {
+	mmc1_pwrseq: mmc1-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&gpx0 0 GPIO_ACTIVE_LOW>; /* WIFI_EN */
 		clocks = <&max77802 MAX77802_CLK_32K_CP>;
@@ -214,7 +214,7 @@ &hsi2c_4 {
 	status = "okay";
 	clock-frequency = <400000>;
 
-	max77802: max77802-pmic@9 {
+	max77802: pmic@9 {
 		compatible = "maxim,max77802";
 		interrupt-parent = <&gpx3>;
 		interrupts = <1 IRQ_TYPE_NONE>;
-- 
2.25.1

