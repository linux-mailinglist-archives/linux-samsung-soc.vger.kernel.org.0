Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AC2118BE1D
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 19 Mar 2020 18:34:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728164AbgCSRe2 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 19 Mar 2020 13:34:28 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:57010 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728189AbgCSRe2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Mar 2020 13:34:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1584639258; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=18a4lIsFRB2+ZKigoJK5xTVAuW10rKL6AztAWVH3Lgc=;
        b=beW9rUTcuR4qGKh/k4cn4Ir4oYqS5NO2Uyafa6YrLcZiU42/OixBUJACoFDJfaJckWiFzf
        Cl9KesLv/FBz3lvo7SF6BsOYZUY3/G9RmNkIkirJpUc2a7LrEjXxxfmQ5SemKUuY66lPlm
        LvLwI50J07h6KhALUbBn2H7pYQgca2M=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Stenkin Evgeniy <stenkinevgeniy@gmail.com>,
        Jonas Heinrich <onny@project-insanity.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 2/2] ARM: DTS: Add devicetree file for the Galaxy S2
Date:   Thu, 19 Mar 2020 18:34:11 +0100
Message-Id: <20200319173411.20607-2-paul@crapouillou.net>
In-Reply-To: <20200319173411.20607-1-paul@crapouillou.net>
References: <20200319173411.20607-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Stenkin Evgeniy <stenkinevgeniy@gmail.com>

Add devicetree file for the Exynos 4210 based Galaxy S2 (i9100 version).

Signed-off-by: Stenkin Evgeniy <stenkinevgeniy@gmail.com>
Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: - Change i9100 to GT-I9100
        - Remove redundant description in header
    	- Add chosen node with stdout-path
    	- Rename regulator nodes since there was no regulator-2
    	- Rename i2c-gpio-3 to i2c-gpio
    	- Use IRQ_TYPE_EDGE_FALLING instead of hardcoded '2'
        - Remove spi-cpol, spi-cpha as they glitch the LCD panel
    	- Make CS gpio active-low
    	- Update ehci node to add 'phys' instead of ports
    	- Remove duplicated ehci node
    	- Reorder nodes to appear in alphabetical order
    	- Remove useless newlines
    	- Remove regulator provided to touchscreen node since it does not expect any
    
    v3: - Change CPU regulator name to VARM_1.2V_C210 as in the datasheet
        - Remove unused gpios for the max8997 pmic
        - Remove redundant interrupts/interrupt-parent for max8997 pmic

 arch/arm/boot/dts/Makefile             |   1 +
 arch/arm/boot/dts/exynos4210-i9100.dts | 768 +++++++++++++++++++++++++
 2 files changed, 769 insertions(+)
 create mode 100644 arch/arm/boot/dts/exynos4210-i9100.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index d6546d2676b9..522436d30690 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -181,6 +181,7 @@ dtb-$(CONFIG_ARCH_EXYNOS3) += \
 	exynos3250-monk.dtb \
 	exynos3250-rinato.dtb
 dtb-$(CONFIG_ARCH_EXYNOS4) += \
+	exynos4210-i9100.dtb \
 	exynos4210-origen.dtb \
 	exynos4210-smdkv310.dtb \
 	exynos4210-trats.dtb \
diff --git a/arch/arm/boot/dts/exynos4210-i9100.dts b/arch/arm/boot/dts/exynos4210-i9100.dts
new file mode 100644
index 000000000000..a4147113f0c4
--- /dev/null
+++ b/arch/arm/boot/dts/exynos4210-i9100.dts
@@ -0,0 +1,768 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung's Exynos4210 based Galaxy S2 (GT-I9100 version) device tree
+ *
+ * Copyright (c) 2012 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ * Copyright (c) 2020 Stenkin Evgeniy <stenkinevgeniy@gmail.com>
+ * Copyright (c) 2020 Paul Cercueil <paul@crapouillou.net>
+ */
+
+/dts-v1/;
+#include "exynos4210.dtsi"
+#include "exynos4412-ppmu-common.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+
+/ {
+	model = "Samsung Galaxy S2 (GT-I9100)";
+	compatible = "samsung,i9100", "samsung,exynos4210", "samsung,exynos4";
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x40000000 0x40000000>;
+	};
+
+	chosen {
+		stdout-path = "serial2:115200n8";
+	};
+
+	vemmc_reg: regulator-0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VMEM_VDD_2.8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&gpk0 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	tsp_reg: regulator-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "TSP_FIXED_VOLTAGES";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpl0 3 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <70000>;
+		enable-active-high;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	cam_af_28v_reg: regulator-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "8M_AF_2.8V_EN";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&gpk1 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	cam_io_en_reg: regulator-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "CAM_IO_EN";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&gpe2 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	cam_io_12v_reg: regulator-4 {
+		compatible = "regulator-fixed";
+		regulator-name = "8M_1.2V_EN";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		gpio = <&gpe2 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vt_core_15v_reg: regulator-5 {
+		compatible = "regulator-fixed";
+		regulator-name = "VT_CORE_1.5V";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		gpio = <&gpe2 2 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		vol-down {
+			gpios = <&gpx2 1 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			label = "volume down";
+			debounce-interval = <10>;
+		};
+
+		vol-up {
+			gpios = <&gpx2 0 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			label = "volume up";
+			debounce-interval = <10>;
+		};
+
+		power {
+			gpios = <&gpx2 7 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			label = "power";
+			debounce-interval = <10>;
+			wakeup-source;
+		};
+
+		ok {
+			gpios = <&gpx3 5 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_OK>;
+			label = "ok";
+			debounce-interval = <10>;
+		};
+	};
+
+	wlan_pwrseq: sdhci3-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpl1 2 GPIO_ACTIVE_LOW>;
+	};
+
+	i2c_max17042_fuel: i2c-gpio {
+		compatible = "i2c-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sda-gpios = <&gpy4 0 GPIO_ACTIVE_HIGH>;
+		scl-gpios = <&gpy4 1 GPIO_ACTIVE_HIGH>;
+		i2c-gpio,delay-us = <5>;
+
+		battery@36 {
+			compatible = "maxim,max17042";
+
+			interrupt-parent = <&gpx2>;
+			interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+
+			pinctrl-0 = <&max17042_fuel_irq>;
+			pinctrl-names = "default";
+
+			reg = <0x36>;
+			maxim,over-heat-temp = <700>;
+			maxim,over-volt = <4500>;
+		};
+	};
+
+	spi-lcd {
+		compatible = "spi-gpio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		num-chipselects = <1>;
+		cs-gpios = <&gpy4 3 GPIO_ACTIVE_LOW>;
+		sck-gpios = <&gpy3 1 GPIO_ACTIVE_HIGH>;
+		mosi-gpios = <&gpy3 3 GPIO_ACTIVE_HIGH>;
+
+		lcd@0 {
+			compatible = "samsung,ld9040";
+			reg = <0>;
+
+			spi-max-frequency = <1200000>;
+
+			vdd3-supply = <&vmipi_reg>;
+			vci-supply = <&vcclcd_reg>;
+
+			reset-gpios = <&gpy4 5 GPIO_ACTIVE_HIGH>;
+			power-on-delay = <10>;
+			reset-delay = <10>;
+
+			panel-width-mm = <90>;
+			panel-height-mm = <154>;
+
+			display-timings {
+				timing {
+					clock-frequency = <23492370>;
+					hactive = <480>;
+					vactive = <800>;
+					hback-porch = <16>;
+					hfront-porch = <16>;
+					vback-porch = <2>;
+					vfront-porch = <28>;
+					hsync-len = <2>;
+					vsync-len = <1>;
+					hsync-active = <0>;
+					vsync-active = <0>;
+					de-active = <0>;
+					pixelclk-active = <0>;
+				};
+			};
+
+			port {
+				lcd_ep: endpoint {
+					remote-endpoint = <&fimd_dpi_ep>;
+				};
+			};
+		};
+	};
+
+	fixed-rate-clocks {
+		xxti {
+			compatible = "samsung,clock-xxti";
+			clock-frequency = <0>;
+		};
+
+		xusbxti {
+			compatible = "samsung,clock-xusbxti";
+			clock-frequency = <24000000>;
+		};
+	};
+
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			cooling-maps {
+				map0 {
+					/* Corresponds to 800MHz */
+					cooling-device = <&cpu0 2 2>;
+				};
+				map1 {
+					/* Corresponds to 200MHz */
+					cooling-device = <&cpu0 4 4>;
+				};
+			};
+		};
+	};
+};
+
+&camera {
+	status = "okay";
+};
+
+&cpu0 {
+	cpu0-supply = <&varm_breg>;
+};
+
+&ehci {
+	status = "okay";
+
+	phys = <&exynos_usbphy 1>;
+	phy-names = "host";
+};
+
+&exynos_usbphy {
+	status = "okay";
+
+	vbus-supply = <&safe1_sreg>;
+};
+
+&fimc_0 {
+	status = "okay";
+
+	assigned-clocks = <&clock CLK_MOUT_FIMC0>, <&clock CLK_SCLK_FIMC0>;
+	assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
+	assigned-clock-rates = <0>, <160000000>;
+};
+
+&fimc_1 {
+	status = "okay";
+
+	assigned-clocks = <&clock CLK_MOUT_FIMC1>, <&clock CLK_SCLK_FIMC1>;
+	assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
+	assigned-clock-rates = <0>, <160000000>;
+};
+
+&fimc_2 {
+	status = "okay";
+
+	assigned-clocks = <&clock CLK_MOUT_FIMC2>, <&clock CLK_SCLK_FIMC2>;
+	assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
+	assigned-clock-rates = <0>, <160000000>;
+};
+
+&fimc_3 {
+	status = "okay";
+
+	assigned-clocks = <&clock CLK_MOUT_FIMC3>, <&clock CLK_SCLK_FIMC3>;
+	assigned-clock-parents = <&clock CLK_SCLK_MPLL>;
+	assigned-clock-rates = <0>, <160000000>;
+};
+
+&fimd {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	samsung,invert-vden;
+	samsung,invert-vclk;
+
+	pinctrl-0 = <&lcd_clk>, <&lcd_data24>;
+	pinctrl-names = "default";
+
+	port@3 {
+		reg = <3>;
+
+		fimd_dpi_ep: endpoint {
+			remote-endpoint = <&lcd_ep>;
+		};
+	};
+};
+
+&gpu {
+	status = "okay";
+
+	mali-supply = <&vg3d_breg>;
+	regulator-microvolt-offset = <50000>;
+	regulator-microsecs-delay = <50>;
+};
+
+&hsotg {
+	status = "okay";
+
+	dr_mode = "otg";
+	vusb_d-supply = <&vusb_reg>;
+	vusb_a-supply = <&vusbdac_reg>;
+};
+
+&i2c_3 {
+	status = "okay";
+
+	samsung,i2c-sda-delay = <100>;
+	samsung,i2c-slave-addr = <0x10>;
+	samsung,i2c-max-bus-freq = <100000>;
+
+	pinctrl-0 = <&i2c3_bus>;
+	pinctrl-names = "default";
+
+	mxt224-touchscreen@4a {
+		compatible = "atmel,maxtouch";
+		reg = <0x4a>;
+
+		interrupt-parent = <&gpx0>;
+		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
+&i2c_5 {
+	status = "okay";
+
+	samsung,i2c-sda-delay = <100>;
+	samsung,i2c-slave-addr = <0x10>;
+	samsung,i2c-max-bus-freq = <100000>;
+
+	pinctrl-0 = <&i2c5_bus>;
+	pinctrl-names = "default";
+
+	max8997_pmic@66 {
+		compatible = "maxim,max8997-pmic";
+		reg = <0x66>;
+
+		interrupts-extended = <&gpx0 7 IRQ_TYPE_NONE>,
+				      <&gpx2 3 IRQ_TYPE_EDGE_FALLING>;
+
+		max8997,pmic-buck1-uses-gpio-dvs;
+		max8997,pmic-buck2-uses-gpio-dvs;
+		max8997,pmic-buck5-uses-gpio-dvs;
+
+		max8997,pmic-ignore-gpiodvs-side-effect;
+		max8997,pmic-buck125-default-dvs-idx = <0>;
+
+		max8997,pmic-buck125-dvs-gpios = <&gpx0 5 GPIO_ACTIVE_HIGH>,
+						 <&gpx0 6 GPIO_ACTIVE_HIGH>,
+						 <&gpl0 0 GPIO_ACTIVE_HIGH>;
+
+		max8997,pmic-buck1-dvs-voltage = <1350000>, <1300000>,
+						 <1250000>, <1200000>,
+						 <1150000>, <1100000>,
+						 <1000000>, <950000>;
+
+		max8997,pmic-buck2-dvs-voltage = <1100000>, <1000000>,
+						 <950000>,  <900000>,
+						 <1100000>, <1000000>,
+						 <950000>,  <900000>;
+
+		max8997,pmic-buck5-dvs-voltage = <1200000>, <1200000>,
+						 <1200000>, <1200000>,
+						 <1200000>, <1200000>,
+						 <1200000>, <1200000>;
+
+		pinctrl-0 = <&max8997_irq>, <&otg_gp>, <&usb_sel>;
+		pinctrl-names = "default";
+
+		regulators {
+			vadc_reg: LDO1 {
+				regulator-name = "VADC_3.3V_C210";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+
+			};
+			valive_reg: LDO2 {
+				regulator-name = "VALIVE_1.1V_C210";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-always-on;
+
+			};
+
+			vusb_reg: LDO3 {
+				regulator-name = "VUSB_1.1V_C210";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+			};
+
+			vmipi_reg: LDO4 {
+				regulator-name = "VMIPI_1.8V";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			vhsic_reg: LDO5 {
+				regulator-name = "VHSIC_1.2V";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+			};
+
+			vpda_reg: LDO6 {
+				regulator-name = "VCC_1.8V_PDA";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+			};
+
+			vcam_reg: LDO7 {
+				regulator-name = "CAM_ISP_1.8V";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			vusbdac_reg: LDO8 {
+				regulator-name = "VUSB+VDAC_3.3V_C210";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			vccpda_reg: LDO9 {
+				regulator-name = "VCC_2.8V_PDA";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-always-on;
+			};
+
+			vtouch_reg: LDO11 {
+				regulator-name = "TOUCH_2.8V";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				regulator-always-on;
+			};
+
+			vpll_reg: LDO10 {
+				regulator-name = "VPLL_1.1V";
+				regulator-min-microvolt = <1100000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-always-on;
+			};
+
+			vtcam_reg: LDO12 {
+				regulator-name = "VT_CAM_1.8V";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			vcclcd_reg: LDO13 {
+				regulator-name = "VCC_3.0V_LCD";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+			};
+
+			vmotor_reg: LDO14 {
+				regulator-name = "VCC_2.8V_MOTOR";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vled_reg: LDO15 {
+				regulator-name = "LED_A_2.8V";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			camsensor_reg: LDO16 {
+				regulator-name = "CAM_SENSOR_IO_1.8V";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			vtf_reg: LDO17 {
+				regulator-name = "VTF_2.8V";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vtouchled_reg: LDO18 {
+				regulator-name = "TOUCH_LED_3.3V";
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <3300000>;
+			};
+
+			vddq_reg: LDO21 {
+				regulator-name = "VDDQ_M1M2_1.2V";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+			};
+
+			varm_breg: BUCK1 {
+				regulator-name = "VARM_1.2V_C210";
+				regulator-min-microvolt = <65000>;
+				regulator-max-microvolt = <2225000>;
+				regulator-always-on;
+			};
+
+			vint_breg: BUCK2 {
+				regulator-name = "VINT_1.1V_C210";
+				regulator-min-microvolt = <65000>;
+				regulator-max-microvolt = <2225000>;
+				regulator-always-on;
+			};
+
+			vg3d_breg: BUCK3 {
+				regulator-name = "G3D_1.1V";
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+			};
+
+			camisp_breg: BUCK4 {
+				regulator-name = "CAM_ISP_CORE_1.2V";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vmem_breg: BUCK5 {
+				regulator-name = "VMEM_1.2V";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+			};
+
+			vccsub_breg: BUCK7 {
+				regulator-name = "VCC_SUB_2.0V";
+				regulator-min-microvolt = <2000000>;
+				regulator-max-microvolt = <2000000>;
+				regulator-always-on;
+			};
+
+			safe1_sreg: ESAFEOUT1 {
+				regulator-name = "SAFEOUT1";
+			};
+
+			safe2_sreg: ESAFEOUT2 {
+				regulator-name = "SAFEOUT2";
+				regulator-boot-on;
+			};
+
+			charger_reg: CHARGER {
+				regulator-name = "CHARGER";
+				regulator-min-microamp = <60000>;
+				regulator-max-microamp = <2580000>;
+				regulator-always-on;
+			};
+
+			chargercv_reg: CHARGER_CV {
+				regulator-name = "CHARGER_CV";
+				regulator-min-microvolt = <3800000>;
+				regulator-max-microvolt = <4100000>;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&i2c_7 {
+	status = "okay";
+
+	samsung,i2c-sda-delay = <100>;
+	samsung,i2c-slave-addr = <0x10>;
+	samsung,i2c-max-bus-freq = <400000>;
+
+	pinctrl-0 = <&i2c7_bus>;
+	pinctrl-names = "default";
+
+	ak8975@c {
+		compatible = "asahi-kasei,ak8975";
+		reg = <0x0c>;
+
+		gpios = <&gpx2 2 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&pinctrl_0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sleep0>;
+
+	sleep0: sleep-states {
+		gpa0-0 {
+			samsung,pins = "gpa0-0";
+			samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+			samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+		};
+
+		gpa0-1 {
+			samsung,pins = "gpa0-1";
+			samsung,pin-con-pdn = <EXYNOS_PIN_PDN_OUT0>;
+			samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+		};
+
+		gpa0-2 {
+			samsung,pins = "gpa0-2";
+			samsung,pin-con-pdn = <EXYNOS_PIN_PDN_INPUT>;
+			samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+		};
+
+		gpa0-3 {
+			samsung,pins = "gpa0-3";
+			samsung,pin-con-pdn = <EXYNOS_PIN_PDN_OUT1>;
+			samsung,pin-pud-pdn = <EXYNOS_PIN_PULL_NONE>;
+		};
+	};
+};
+
+&pinctrl_1 {
+	mhl_int: mhl-int {
+		samsung,pins = "gpf3-5";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	i2c_mhl_bus: i2c-mhl-bus {
+		samsung,pins = "gpf0-4", "gpf0-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+	};
+
+	usb_sel: usb-sel {
+		samsung,pins = "gpl0-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		samsung,pin-val = <0>;
+	};
+
+	bt_en: bt-en {
+		samsung,pins = "gpl0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		samsung,pin-val = <0>;
+	};
+
+	bt_res: bt-res {
+		samsung,pins = "gpl1-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV4>;
+		samsung,pin-val = <0>;
+	};
+
+	otg_gp: otg-gp {
+		samsung,pins = "gpx3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		samsung,pin-val = <0>;
+	};
+
+	mag_mhl_gpio: mag-mhl-gpio {
+		samsung,pins = "gpd0-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	max8997_irq: max8997-irq {
+		samsung,pins = "gpx0-7";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	max17042_fuel_irq: max17042-fuel-irq {
+		samsung,pins = "gpx2-3";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	tsp224_irq: tsp224-irq {
+		samsung,pins = "gpx0-4";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+	};
+};
+
+&sdhci_0 {
+	status = "okay";
+
+	bus-width = <8>;
+	non-removable;
+	vmmc-supply = <&vemmc_reg>;
+
+	pinctrl-0 = <&sd0_clk>, <&sd0_cmd>, <&sd0_bus8>;
+	pinctrl-names = "default";
+};
+
+&sdhci_2 {
+	status = "okay";
+
+	bus-width = <4>;
+	cd-gpios = <&gpx3 4 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&vtf_reg>;
+
+	pinctrl-0 = <&sd2_clk>, <&sd2_cmd>, <&sd2_bus4>;
+	pinctrl-names = "default";
+};
+
+&sdhci_3 {
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	non-removable;
+	bus-width = <4>;
+	mmc-pwrseq = <&wlan_pwrseq>;
+	vmmc-supply = <&vtf_reg>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd3_clk>, <&sd3_cmd>, <&sd3_bus4>;
+
+	brcmf: wifi@1 {
+		compatible = "brcm,bcm4330-fmac";
+		reg = <1>;
+
+		interrupt-parent = <&gpx2>;
+		interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wake";
+	};
+};
+
+&serial_0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&bt_en>, <&bt_res>, <&uart0_data>, <&uart0_fctl>;
+
+	bluetooth {
+		compatible = "brcm,bcm4330-bt";
+
+		shutdown-gpios = <&gpl0 4 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpl1 0 GPIO_ACTIVE_HIGH>;
+		device-wakeup-gpios = <&gpx3 1 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpx2 6 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&serial_1 {
+	status = "okay";
+};
+
+&serial_2 {
+	status = "okay";
+};
+
+&serial_3 {
+	status = "okay";
+};
+
+&tmu {
+	status = "okay";
+};
-- 
2.25.1

