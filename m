Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D681230B23
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 28 Jul 2020 15:11:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729853AbgG1NLz (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 28 Jul 2020 09:11:55 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:36028 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729991AbgG1NLz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Jul 2020 09:11:55 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200728131152euoutp0243ed209052a766e1c47f0cfe47eaf323~l7LbU4qcM2637626376euoutp02v
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Jul 2020 13:11:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200728131152euoutp0243ed209052a766e1c47f0cfe47eaf323~l7LbU4qcM2637626376euoutp02v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1595941913;
        bh=EfyRTsECRK0+PLgB/p1ukeUZ6ZwlHWpus9yYA8mxb2s=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=sljLF2asE9r4qS9yF2S1SRdqbCfYZnT4wbYeTcVpd3VkW1NzU3vVi65RYUZykLiTl
         q8YM9wjc8cxIv7jsBsRAF5gwyLjIEPtuYBNOf4W+E0A/NTHIJYkonO8ECtL1i69LBg
         s2M39hsVS69jqIewKBxJSYa1OtQH7JqCK1bQey6g=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200728131152eucas1p159968d85604f6dbb55c98697be3455dd~l7La_WYiX1534315343eucas1p1G;
        Tue, 28 Jul 2020 13:11:52 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 89.19.05997.814202F5; Tue, 28
        Jul 2020 14:11:52 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200728131152eucas1p1d6794f603d1c3474eb6a7bfad04cec6b~l7LarOpu-1537115371eucas1p1C;
        Tue, 28 Jul 2020 13:11:52 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200728131152eusmtrp1b0f72a1e1c58ae35c057638e8f1b6f0f~l7LaqlWum1588415884eusmtrp15;
        Tue, 28 Jul 2020 13:11:52 +0000 (GMT)
X-AuditID: cbfec7f4-65dff7000000176d-a1-5f2024184b6e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id DA.95.06017.814202F5; Tue, 28
        Jul 2020 14:11:52 +0100 (BST)
Received: from AMDC3061.digital.local (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200728131151eusmtip2a1a3e20a90bef66a1adab4c0f1858c92~l7LaMKsK02270622706eusmtip2b;
        Tue, 28 Jul 2020 13:11:51 +0000 (GMT)
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     broonie@kernel.org, krzk@kernel.org
Cc:     simon@lineageos.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        b.zolnierkie@samsung.com, m.szyprowski@samsung.com,
        linux-samsung-soc@vger.kernel.org, s.nawrocki@samsung.com
Subject: [PATCH v3 3/3] ARM: dts: exynos: Add sound support to Midas
Date:   Tue, 28 Jul 2020 15:11:11 +0200
Message-Id: <20200728131111.14334-3-s.nawrocki@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200728131111.14334-1-s.nawrocki@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmleLIzCtJLcpLzFFi42LZduzneV0JFYV4g8UtChZXLh5istg4Yz2r
        xdSHT9gs5h85x2px/vwGdosZ5/cxWaw9cpfdonXvEXaLw2/aWS22nLnN5sDlseFzE5vHplWd
        bB4t6zexefRtWcXo8XmTXABrFJdNSmpOZllqkb5dAlfGiZMbWAuumlQcPDqduYHxiFYXIyeH
        hICJxIH1z5m6GLk4hARWMEqs6lvLCuF8YZRoeXyXEcL5zCix+fArZpiWY//vMEMkljNKrDnc
        xgjXcur2JlaQKjYBQ4neo32MILaIgLrE/RlNYHOZBW4ySszc1McGkhAWcJGYOKGPCcRmEVCV
        uHZ3FVgzr4C1xI2Gq+wQ6+QlVm84ALSOg4NTwEbiyYwEkDkSAs3sEgfXvYc6yUXiwcWbrBC2
        sMSr41ugemUkTk/uYYFqYJTo2X2bHcKZwChx//gCRogqa4k7536xgWxgFtCUWL9LHyLsKHFq
        yxmwsIQAn8SNt4IgYWYgc9K26cwQYV6JjjYhiGoVid+rpjNB2FIS3U/+s0CUeEgsf5MECZ9+
        oNff7maawCg/C2HXAkbGVYziqaXFuempxUZ5qeV6xYm5xaV56XrJ+bmbGIFJ5PS/4192MO76
        k3SIUYCDUYmH94O4QrwQa2JZcWXuIUYJDmYlEV6ns6fjhHhTEiurUovy44tKc1KLDzFKc7Ao
        ifMaL3oZKySQnliSmp2aWpBaBJNl4uCUamC03jrfrL9lh8HObL2DMb1B9/TXdciuSk16f8/a
        /8Wn/U+05pW41ca8n7PtzMVV9854PZquFdc2I+pJzPtrmsuWXV/M4XrD3WPXizdv7nkn/jqU
        ZLlI8bXP9w9nlUL3nP/wceEeMU6/GU1FFr91fP/NmRX9uqTRIpx5l7FWkXl58vfW2VZsF7x3
        KbEUZyQaajEXFScCADUu0LYeAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNLMWRmVeSWpSXmKPExsVy+t/xe7oSKgrxBqcP8FpcuXiIyWLjjPWs
        FlMfPmGzmH/kHKvF+fMb2C1mnN/HZLH2yF12i9a9R9gtDr9pZ7XYcuY2mwOXx4bPTWwem1Z1
        snm0rN/E5tG3ZRWjx+dNcgGsUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK
        +nY2Kak5mWWpRfp2CXoZJ05uYC24alJx8Oh05gbGI1pdjJwcEgImEsf+32HuYuTiEBJYyiix
        v/MKkMMBlJCSmN+iBFEjLPHnWhcbRM0nRol7jw+ygiTYBAwleo/2MYLYIgKaEh3zbrOCFDEL
        PAQadPw+WEJYwEVi4oQ+JhCbRUBV4trdVWDNvALWEjcarrJDbJCXWL3hANhiTgEbiSczEkDC
        QkAl62c9ZJzAyLeAkWEVo0hqaXFuem6xkV5xYm5xaV66XnJ+7iZGYEBvO/Zzyw7GrnfBhxgF
        OBiVeHhniCrEC7EmlhVX5h5ilOBgVhLhdTp7Ok6INyWxsiq1KD++qDQntfgQoynQTROZpUST
        84HRllcSb2hqaG5haWhubG5sZqEkztshcDBGSCA9sSQ1OzW1ILUIpo+Jg1OqgVG0zkd1xYoS
        /6VCnumz1+1XKHLU7HRdIXSDxfPX8zWlsswCjz7uZj/XaxHhwHfha9Fe/fTG780Hl1wrVZ7o
        sqDbf9Lr6ymrD0UaFXxeVKHOnB2/xi/S+de1yqa62KudWf+c8iuD+ZPvWwUn7PhgOIvx7el/
        nXsvlRxbY7gpstXVROTpI4d0RSWW4oxEQy3mouJEAKwlCDh+AgAA
X-CMS-MailID: 20200728131152eucas1p1d6794f603d1c3474eb6a7bfad04cec6b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200728131152eucas1p1d6794f603d1c3474eb6a7bfad04cec6b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200728131152eucas1p1d6794f603d1c3474eb6a7bfad04cec6b
References: <20200728131111.14334-1-s.nawrocki@samsung.com>
        <CGME20200728131152eucas1p1d6794f603d1c3474eb6a7bfad04cec6b@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Simon Shields <simon@lineageos.org>

Update the never-mainlined "samsung,trats2-audio" binding and instead
use the new "samsung,midas-audio" binding.

Signed-off-by: Simon Shields <simon@lineageos.org>
[s.nawrocki: fixed DAPM routing entries for MICBIAS1/2, adjusted to
 new cpu/codec binding, corrected the regulator nodes indexing]
Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes for v3:
 - none.

Changes for v2:
 - reordering to maintain alphabetical order,
 - corrected the fixed voltage regulator nodes indexing,
 - whitespace fixes.
---
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 42 +++++++++++++++-
 arch/arm/boot/dts/exynos4412-i9300.dts      |  4 ++
 arch/arm/boot/dts/exynos4412-midas.dtsi     | 78 ++++++++++++++++++++++++-----
 arch/arm/boot/dts/exynos4412-n710x.dts      | 37 +++++++++++++-
 4 files changed, 145 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
index 53b3ca3..89ed81f 100644
--- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
+++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
@@ -33,7 +33,7 @@
 		};
 	};
 
-	lcd_vdd3_reg: voltage-regulator-7 {
+	lcd_vdd3_reg: voltage-regulator-10 {
 		compatible = "regulator-fixed";
 		regulator-name = "LCD_VDD_2.2V";
 		regulator-min-microvolt = <2200000>;
@@ -42,7 +42,7 @@
 		enable-active-high;
 	};
 
-	ps_als_reg: voltage-regulator-8 {
+	ps_als_reg: voltage-regulator-11 {
 		compatible = "regulator-fixed";
 		regulator-name = "LED_A_3.0V";
 		regulator-min-microvolt = <3000000>;
@@ -171,6 +171,44 @@
 	status = "okay";
 };
 
+&sound {
+	samsung,audio-routing =
+		"HP", "HPOUT1L",
+		"HP", "HPOUT1R",
+
+		"SPK", "SPKOUTLN",
+		"SPK", "SPKOUTLP",
+		"SPK", "SPKOUTRN",
+		"SPK", "SPKOUTRP",
+
+		"RCV", "HPOUT2N",
+		"RCV", "HPOUT2P",
+
+		"HDMI", "LINEOUT1N",
+		"HDMI", "LINEOUT1P",
+
+		"LINE", "LINEOUT2N",
+		"LINE", "LINEOUT2P",
+
+		"IN1LP", "MICBIAS1",
+		"IN1LN", "MICBIAS1",
+		"Main Mic", "MICBIAS1",
+
+		"IN1RP", "Sub Mic",
+		"IN1RN", "Sub Mic",
+
+		"IN2LP:VXRN", "MICBIAS2",
+		"Headset Mic", "MICBIAS2",
+
+		"IN2RN", "FM In",
+		"IN2RP:VXRP", "FM In";
+};
+
+&submic_bias_reg {
+	gpio = <&gpf2 0 GPIO_ACTIVE_HIGH>;
+	enable-active-high;
+};
+
 &touchkey_reg {
 	gpio = <&gpm0 0 GPIO_ACTIVE_HIGH>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/exynos4412-i9300.dts b/arch/arm/boot/dts/exynos4412-i9300.dts
index f8125a9..3691802 100644
--- a/arch/arm/boot/dts/exynos4412-i9300.dts
+++ b/arch/arm/boot/dts/exynos4412-i9300.dts
@@ -20,3 +20,7 @@
 		reg =  <0x40000000 0x40000000>;
 	};
 };
+
+&sound {
+	fm-sel-gpios = <&gpl0 3 GPIO_ACTIVE_HIGH>;
+};
diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
index 2c8111c..8e7a032 100644
--- a/arch/arm/boot/dts/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
@@ -102,6 +102,30 @@
 		status = "disabled";
 	};
 
+	vbatt_reg: voltage-regulator-7 {
+		compatible = "regulator-fixed";
+		regulator-name = "VBATT";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	mic_bias_reg: voltage-regulator-8 {
+		compatible = "regulator-fixed";
+		regulator-name = "MICBIAS_LDO_2.8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&gpf1 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	submic_bias_reg: voltage-regulator-9 {
+		compatible = "regulator-fixed";
+		regulator-name = "SUB_MICBIAS_LDO_2.8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
@@ -266,16 +290,18 @@
 		clock-names = "ext_clock";
 	};
 
-	sound {
-		compatible = "samsung,trats2-audio";
-		samsung,i2s-controller = <&i2s0>;
-		samsung,model = "Trats2";
-		samsung,audio-codec = <&wm1811>;
-		samsung,audio-routing =
-			"SPK", "SPKOUTLN",
-			"SPK", "SPKOUTLP",
-			"SPK", "SPKOUTRN",
-			"SPK", "SPKOUTRP";
+	sound: sound {
+		compatible = "samsung,midas-audio";
+		model = "Midas";
+		mic-bias-supply = <&mic_bias_reg>;
+		submic-bias-supply = <&submic_bias_reg>;
+
+		cpu {
+			sound-dai = <&i2s0 0>;
+		};
+		codec {
+			sound-dai = <&wm1811>;
+		};
 	};
 
 	thermistor-ap {
@@ -597,11 +623,37 @@
 	wm1811: wm1811@1a {
 		compatible = "wlf,wm1811";
 		reg = <0x1a>;
-		clocks = <&pmu_system_controller 0>;
-		clock-names = "MCLK1";
-		DCVDD-supply = <&ldo3_reg>;
+		clocks = <&pmu_system_controller 0>,
+			<&max77686 MAX77686_CLK_PMIC>;
+		clock-names = "MCLK1", "MCLK2";
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupt-parent = <&gpx3>;
+		interrupts = <6 IRQ_TYPE_LEVEL_HIGH>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+		#sound-dai-cells = <0>;
+
+		wlf,gpio-cfg = <0x3 0x0 0x0 0x0 0x0 0x0
+			0x0 0x8000 0x0 0x0 0x0>;
+		wlf,micbias-cfg = <0x2f 0x2b>;
+
+		wlf,lineout1-feedback;
+		wlf,lineout1-se;
+		wlf,lineout2-se;
+		wlf,ldoena-always-driven;
+
+		AVDD2-supply = <&vbatt_reg>;
 		DBVDD1-supply = <&ldo3_reg>;
+		DBVDD2-supply = <&vbatt_reg>;
+		DBVDD3-supply = <&vbatt_reg>;
+		DCVDD-supply = <&ldo3_reg>;
+		CPVDD-supply = <&vbatt_reg>;
+		SPKVDD1-supply = <&vbatt_reg>;
+		SPKVDD2-supply = <&vbatt_reg>;
 		wlf,ldo1ena = <&gpj0 4 0>;
+		wlf,ldo2ena = <&gpj0 4 0>;
 	};
 };
 
diff --git a/arch/arm/boot/dts/exynos4412-n710x.dts b/arch/arm/boot/dts/exynos4412-n710x.dts
index 4189e1f..2361d89 100644
--- a/arch/arm/boot/dts/exynos4412-n710x.dts
+++ b/arch/arm/boot/dts/exynos4412-n710x.dts
@@ -13,7 +13,7 @@
 
 	/* bootargs are passed in by bootloader */
 
-	cam_vdda_reg: voltage-regulator-7 {
+	cam_vdda_reg: voltage-regulator-10 {
 		compatible = "regulator-fixed";
 		regulator-name = "CAM_SENSOR_CORE_1.2V";
 		regulator-min-microvolt = <1200000>;
@@ -74,6 +74,41 @@
 	status = "okay";
 };
 
+&sound {
+	samsung,audio-routing =
+		"HP", "HPOUT1L",
+		"HP", "HPOUT1R",
+
+		"SPK", "SPKOUTLN",
+		"SPK", "SPKOUTLP",
+
+		"RCV", "HPOUT2N",
+		"RCV", "HPOUT2P",
+
+		"HDMI", "LINEOUT1N",
+		"HDMI", "LINEOUT1P",
+
+		"LINE", "LINEOUT2N",
+		"LINE", "LINEOUT2P",
+
+		"IN1LP", "MICBIAS2",
+		"IN1LN", "MICBIAS2",
+		"Headset Mic", "MICBIAS2",
+
+		"IN1RP", "Sub Mic",
+		"IN1RN", "Sub Mic",
+
+		"IN2LP:VXRN", "Main Mic",
+		"IN2LN", "Main Mic",
+
+		"IN2RN", "FM In",
+		"IN2RP:VXRP", "FM In";
+};
+
+&submic_bias_reg {
+	regulator-always-on;
+};
+
 &touchkey_reg {
 	gpio = <&gpm0 5 GPIO_ACTIVE_HIGH>;
 	status = "okay";
-- 
2.7.4

