Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F898297CE3
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 24 Oct 2020 16:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1762092AbgJXOpD (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 24 Oct 2020 10:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1762097AbgJXOpB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 24 Oct 2020 10:45:01 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 616A9C0613CE;
        Sat, 24 Oct 2020 07:44:59 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id d3so5999046wma.4;
        Sat, 24 Oct 2020 07:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wiH9i3m3JM2Yy4x0/bddp4Bbcw69jBfuspBdCqBqQtE=;
        b=if6WiiiJsY4U2ncHAEPZRNSJx1BY9ylWOKCOA2IawAhiyWahtKvdlSj4lDmLYRT8Ao
         k6jZNH45Ru2iLKZACms1UW4BtRpBIVaTeYrZ+7Xj0JB8pE82S60zjCLH0LXNpV+LNGwL
         nqnbTwgs/a1wL3QD+NEeJMtXuScBy/Y6lhAKe4KxMjYIEr4omv/5DwORfBUlgBdDEnqX
         kpm9zqXiw69GvOuuMmn3xRr6BlmL+wb8ViKunTL2uPEGSaMZD95EUZGUTM5MpSvfTBWH
         VSucXGNrNa1bCJz3TEJP3aHENffFdZ8E8i7+60EtlJpZ31NBPEC77fTig2jrFeWJpxWQ
         hXFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wiH9i3m3JM2Yy4x0/bddp4Bbcw69jBfuspBdCqBqQtE=;
        b=NhLKm6cvriC+6GbBojqkcFsslgrht36FaU15a1umUUK2fva2sUuY2rjFkDKKs98/IE
         IlCr/CpcP9vUilh+ifd1V7vKsP7zzocKljOidiP/E23o0xW0KXnCbPuDFwoejeaOv4Ve
         gErI5H9fsyXXxXhB3GjN7w5h4cOp7lle6LM0giKU4JEMy3rP6NlOFIaMuS3m1WYTtNVC
         qBkcInLzXSFB5mn/jV6TVb4kW7eg5jbKnoc+qATunDp2kG9f29NyC7xY5tmHheNQaZvO
         S7L7EQMi/BJewz/6y0/P8mJnYwr0zKdL6FP5mITsAiec42HC/NzMaX6NvGd531R+MCrk
         jRDQ==
X-Gm-Message-State: AOAM531GIDO9PITJbZZb2Za9hpr80CAvvmK0DdTevWQ4z/foBYB8EoGs
        ZR6qGN6ikrFxbNlK2HnJ6G1OgXEYrVRWzYDC
X-Google-Smtp-Source: ABdhPJzX08PQM41zTBAkeOMGiHjtd9rUEeqNO8CTOMgzXtOmh/RvFcnmPns8FJKuCiP49PQH99+V7g==
X-Received: by 2002:a1c:9c41:: with SMTP id f62mr7136407wme.23.1603550697860;
        Sat, 24 Oct 2020 07:44:57 -0700 (PDT)
Received: from adroid (165-170-184-091.ip-addr.vsenet.de. [91.184.170.165])
        by smtp.gmail.com with ESMTPSA id v9sm10287528wmh.23.2020.10.24.07.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 07:44:57 -0700 (PDT)
From:   =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     kgene@kernel.org, krzk@kernel.org, devicetree@vger.kernel.org,
        martin.juecker@gmail.com
Subject: [PATCH 2/5] ARM: dts: add Samsung's exynos4412-based p4note boards
Date:   Sat, 24 Oct 2020 16:44:18 +0200
Message-Id: <20201024144421.34435-3-martin.juecker@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201024144421.34435-1-martin.juecker@gmail.com>
References: <20201024144421.34435-1-martin.juecker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The p4note family contains a couple of variants of the Galaxy Note 10.1
tablet with mainly different modems. The GT-N8010/GT-N8013 is the wifi
only version.

Signed-off-by: Martin Jücker <martin.juecker@gmail.com>
---
 arch/arm/boot/dts/Makefile                    |    1 +
 arch/arm/boot/dts/exynos4412-p4note-n801x.dts |   16 +
 arch/arm/boot/dts/exynos4412-p4note.dtsi      | 1057 +++++++++++++++++
 3 files changed, 1074 insertions(+)
 create mode 100644 arch/arm/boot/dts/exynos4412-p4note-n801x.dts
 create mode 100644 arch/arm/boot/dts/exynos4412-p4note.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 4572db3fa5ae..b6d72bd7ebac 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -195,6 +195,7 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
 	exynos4412-odroidx.dtb \
 	exynos4412-odroidx2.dtb \
 	exynos4412-origen.dtb \
+	exynos4412-p4note-n801x.dtb \
 	exynos4412-smdk4412.dtb \
 	exynos4412-tiny4412.dtb \
 	exynos4412-trats2.dtb
diff --git a/arch/arm/boot/dts/exynos4412-p4note-n801x.dts b/arch/arm/boot/dts/exynos4412-p4note-n801x.dts
new file mode 100644
index 000000000000..e7fb5b96e6c6
--- /dev/null
+++ b/arch/arm/boot/dts/exynos4412-p4note-n801x.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung's Galaxy Note 10.1 - N801x (wifi only version)
+ *
+ * Copyright (c) 2020 Martin Jücker <martin.juecker@gmail.com>
+ */
+
+/dts-v1/;
+#include "exynos4412-p4note.dtsi"
+
+/ {
+	model = "Samsung Galaxy Note 10.1 (GT-N8010/N8013) based on Exynos4412";
+	compatible = "samsung,n801x", "samsung,p4note", "samsung,exynos4412", "samsung,exynos4";
+
+	/* this is the base variant without any kind of modem */
+};
diff --git a/arch/arm/boot/dts/exynos4412-p4note.dtsi b/arch/arm/boot/dts/exynos4412-p4note.dtsi
new file mode 100644
index 000000000000..6d7e84f40e92
--- /dev/null
+++ b/arch/arm/boot/dts/exynos4412-p4note.dtsi
@@ -0,0 +1,1057 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung's Exynos4412 based p4note device family base DT
+ *
+ * Copyright (c) 2020 Martin Jücker <martin.juecker@gmail.com>
+ */
+
+/dts-v1/;
+#include "exynos4412.dtsi"
+#include "exynos4412-ppmu-common.dtsi"
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/maxim,max77686.h>
+#include <dt-bindings/pinctrl/samsung.h>
+
+/ {
+	compatible = "samsung,p4note", "samsung,exynos4412", "samsung,exynos4";
+
+	memory@40000000 {
+		device_type = "memory";
+		reg = <0x40000000 0x80000000>;
+	};
+
+	chosen {
+		stdout-path = &serial_2;
+	};
+
+	firmware@204f000 {
+		compatible = "samsung,secure-firmware";
+		reg = <0x0204F000 0x1000>;
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
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&gpio_keys>;
+
+		key-down {
+			gpios = <&gpx2 2 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			label = "volume down";
+			debounce-interval = <10>;
+		};
+
+		key-up {
+			gpios = <&gpx3 3 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			label = "volume up";
+			debounce-interval = <10>;
+		};
+
+		key-power {
+			gpios = <&gpx2 7 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			label = "power";
+			debounce-interval = <10>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
+	tsp_reg_1: voltage-regulator-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "TSP_FIXED_VOLTAGES_1";
+		pinctrl-names = "default";
+		pinctrl-0 = <&tsp_reg_gpio_1>;
+		gpios = <&gpm4 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	tsp_reg_2: voltage-regulator-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "TSP_FIXED_VOLTAGES_2";
+		pinctrl-names = "default";
+		pinctrl-0 = <&tsp_reg_gpio_2>;
+		gpios = <&gpb 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	tsp_reg_3: voltage-regulator-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "TSP_FIXED_VOLTAGES_3";
+		pinctrl-names = "default";
+		pinctrl-0 = <&tsp_reg_gpio_3>;
+		gpios = <&gpb 7 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <20000>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	wlan_pwrseq: sdhci3-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpm3 5 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&wifi_reset>;
+		pinctrl-names = "default";
+		clocks = <&max77686 MAX77686_CLK_PMIC>;
+		clock-names = "ext_clock";
+	};
+
+	i2c-gpio-10 {
+		compatible = "i2c-gpio";
+		sda-gpios = <&gpy2 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpy2 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ak8975@c {
+			compatible = "asahi-kasei,ak8975";
+			reg = <0x0c>;
+			interrupt-parent = <&gpm4>;
+			interrupts = <7 IRQ_TYPE_EDGE_RISING>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&ak8975_irq>;
+		};
+	};
+
+	i2c-gpio-14 {
+		compatible = "i2c-gpio";
+		sda-gpios = <&gpy0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpy0 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		max17042@36 {
+			compatible = "maxim,max17042";
+			reg = <0x36>;
+			interrupt-parent = <&gpx2>;
+			interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+			maxim,rsns-microohm = <10000>;
+			maxim,over-heat-temp = <600>;
+			maxim,over-volt = <4300>;
+		};
+	};
+
+	i2c-gpio-19 {
+		compatible = "i2c-gpio";
+		sda-gpios = <&gpm4 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpm4 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <5>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		stmpe_mfd@41 {
+			compatible = "st,stmpe811";
+			reg = <0x41>;
+			interrupt-parent = <&gpx0>;
+			interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
+			interrupt-controller;
+			irq-trigger = <0x1>;
+			st,adc-freq = <3>;
+			st,mod-12b = <1>;
+			st,ref-sel = <0>;
+			st,sample-time = <3>;
+
+			stmpe_adc: stmpe_adc {
+				compatible = "st,stmpe-adc";
+				#io-channel-cells = <1>;
+				st,norequest-mask = <0x2F>;
+			};
+		};
+	};
+};
+
+&adc {
+	status = "okay";
+};
+
+&bus_dmc {
+	devfreq-events = <&ppmu_dmc0_3>, <&ppmu_dmc1_3>;
+	vdd-supply = <&buck1_reg>;
+	status = "okay";
+};
+
+&bus_acp {
+	devfreq = <&bus_dmc>;
+	status = "okay";
+};
+
+&bus_c2c {
+	devfreq = <&bus_dmc>;
+	status = "okay";
+};
+
+&bus_leftbus {
+	devfreq-events = <&ppmu_leftbus_3>, <&ppmu_rightbus_3>;
+	vdd-supply = <&buck3_reg>;
+	status = "okay";
+};
+
+&bus_rightbus {
+	devfreq = <&bus_leftbus>;
+	status = "okay";
+};
+
+&bus_display {
+	devfreq = <&bus_leftbus>;
+	status = "okay";
+};
+
+&bus_fsys {
+	devfreq = <&bus_leftbus>;
+	status = "okay";
+};
+
+&bus_peri {
+	devfreq = <&bus_leftbus>;
+	status = "okay";
+};
+
+&bus_mfc {
+	devfreq = <&bus_leftbus>;
+	status = "okay";
+};
+
+&cpu0 {
+	cpu0-supply = <&buck2_reg>;
+};
+
+&cpu_thermal {
+	cooling-maps {
+		map0 {
+			/* Corresponds to 800MHz at freq_table */
+			cooling-device = <&cpu0 7 7>, <&cpu1 7 7>, <&cpu2 7 7>, <&cpu3 7 7>;
+		};
+		map1 {
+			/* Corresponds to 200MHz at freq_table */
+			cooling-device = <&cpu0 13 13>, <&cpu1 13 13>, <&cpu2 13 13>, <&cpu3 13 13>;
+		};
+	};
+};
+
+&ehci {
+	status = "okay";
+};
+
+&exynos_usbphy {
+	status = "okay";
+};
+
+&fimd {
+	pinctrl-0 = <&lcd_clk &lcd_data24 &pwm1_out>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	display-timings {
+		timing0 {
+			clock-frequency = <66666666>;
+			hactive = <1280>;
+			vactive = <800>;
+			hfront-porch = <18>;
+			hback-porch = <36>;
+			hsync-len = <16>;
+			vback-porch = <16>;
+			vfront-porch = <4>;
+			vsync-len = <3>;
+			hsync-active = <1>;
+		};
+	};
+};
+
+&gpu {
+	mali-supply = <&buck4_reg>;
+	status = "okay";
+};
+
+&hsotg {
+	vusb_a-supply = <&ldo12_reg>;
+	dr_mode = "peripheral";
+	status = "okay";
+};
+
+&i2c_3 {
+	samsung,i2c-sda-delay = <100>;
+	samsung,i2c-slave-addr = <0x10>;
+	samsung,i2c-max-bus-freq = <400000>;
+	pinctrl-0 = <&i2c3_bus>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	touchscreen@4a {
+		compatible = "atmel,maxtouch";
+		reg = <0x4a>;
+		reset-gpios = <&gpm0 4 GPIO_ACTIVE_HIGH>;
+		interrupt-parent = <&gpm2>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&tsp_rst &tsp_irq>;
+		pinctrl-names = "default";
+	};
+};
+
+&i2c_7 {
+	samsung,i2c-sda-delay = <100>;
+	samsung,i2c-slave-addr = <0x10>;
+	samsung,i2c-max-bus-freq = <400000>;
+	pinctrl-0 = <&i2c7_bus>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	max77686: max77686_pmic@9 {
+		compatible = "maxim,max77686";
+		interrupt-parent = <&gpx0>;
+		interrupts = <7 IRQ_TYPE_NONE>;
+		pinctrl-0 = <&max77686_irq>;
+		pinctrl-names = "default";
+		reg = <0x09>;
+		#clock-cells = <1>;
+
+		voltage-regulators {
+
+			/* WM8994 audio */
+			ldo3_reg: LDO3 {
+				regulator-name = "VCC_1.8V_AP";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			/* Unknown */
+			ldo5_reg: LDO5 {
+				regulator-name = "VCC_1.8V_IO";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			/* CSI IP block */
+			ldo8_reg: LDO8 {
+				regulator-name = "VMIPI_1.0V";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			/* IR LED on/off */
+			ldo9_reg: LDO9 {
+				regulator-name = "VLED_IC_1.9V";
+				regulator-min-microvolt = <1950000>;
+				regulator-max-microvolt = <1950000>;
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			/* CSI IP block */
+			ldo10_reg: LDO10 {
+				regulator-name = "VMIPI_1.8V";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			/* Unknown */
+			ldo11_reg: LDO11 {
+				regulator-name = "VABB1_1.9V";
+				regulator-min-microvolt = <1950000>;
+				regulator-max-microvolt = <1950000>;
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			/* USB OTG */
+			ldo12_reg: LDO12 {
+				regulator-name = "VUOTG_3.0V";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			/* Unknown */
+			ldo14_reg: LDO14 {
+				regulator-name = "VABB2_1.9V";
+				regulator-min-microvolt = <1950000>;
+				regulator-max-microvolt = <1950000>;
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			/* Camera ISX012 */
+			ldo18_reg: LDO18 {
+				regulator-name = "CAM_IO_1.8V";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			/* Camera S5K6A3 */
+			ldo19_reg: LDO19 {
+				regulator-name = "VT_CORE_1.8V";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			/* MMC2 */
+			ldo21_reg: LDO21 {
+				regulator-name = "VTF_2.8V";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				maxim,ena-gpios = <&gpy2 0 GPIO_ACTIVE_HIGH>;
+			};
+
+			/* ADC */
+			ldo23_reg: LDO23 {
+				regulator-name = "VDD_ADC_3.3V";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			/* Camera S5K6A3 */
+			ldo24_reg: LDO24 {
+				regulator-name = "CAM_A2.8V";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			/* IR LED sending */
+			ldo25_reg: LDO25 {
+				regulator-name = "VLED_3.3V";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			/* Camera ISX012 */
+			ldo26_reg: LDO26 {
+				regulator-name = "3MP_AF_2.8V";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			buck1_reg: BUCK1 {
+				regulator-name = "VDD_MIF";
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			buck2_reg: BUCK2 {
+				regulator-name = "VDD_ARM";
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			buck3_reg: BUCK3 {
+				regulator-name = "VDD_INT";
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-always-on;
+				regulator-boot-on;
+			};
+
+			buck4_reg: BUCK4 {
+				regulator-name = "VDD_G3D";
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1075000>;
+				regulator-boot-on;
+			};
+
+			buck9_reg: BUCK9 {
+				regulator-name = "3MP_CORE_1.2V";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+	};
+};
+
+&mshc_0 {
+	broken-cd;
+	non-removable;
+	card-detect-delay = <200>;
+	clock-frequency = <400000000>;
+	samsung,dw-mshc-ciu-div = <0>;
+	samsung,dw-mshc-sdr-timing = <2 3>;
+	samsung,dw-mshc-ddr-timing = <1 2>;
+	pinctrl-0 = <&sd4_clk &sd4_cmd &sd4_bus4 &sd4_bus8>;
+	pinctrl-names = "default";
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	status = "okay";
+};
+
+&pinctrl_0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sleep0>;
+
+	tsp_reg_gpio_2: tsp-reg-gpio-2 {
+		samsung,pins = "gpb-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	tsp_reg_gpio_3: tsp-reg-gpio-3 {
+		samsung,pins = "gpb-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	sleep0: sleep-states {
+		PIN_SLP(gpa0-0, INPUT, NONE);
+		PIN_SLP(gpa0-1, OUT0, NONE);
+		PIN_SLP(gpa0-2, INPUT, NONE);
+		PIN_SLP(gpa0-3, INPUT, UP);
+		PIN_SLP(gpa0-4, INPUT, NONE);
+		PIN_SLP(gpa0-5, INPUT, DOWN);
+		PIN_SLP(gpa0-6, INPUT, DOWN);
+		PIN_SLP(gpa0-7, INPUT, UP);
+
+		PIN_SLP(gpa1-0, INPUT, DOWN);
+		PIN_SLP(gpa1-1, INPUT, DOWN);
+		PIN_SLP(gpa1-2, INPUT, DOWN);
+		PIN_SLP(gpa1-3, INPUT, DOWN);
+		PIN_SLP(gpa1-4, INPUT, DOWN);
+		PIN_SLP(gpa1-5, INPUT, DOWN);
+
+		PIN_SLP(gpb-0, INPUT, NONE);
+		PIN_SLP(gpb-1, INPUT, NONE);
+		PIN_SLP(gpb-2, INPUT, NONE);
+		PIN_SLP(gpb-3, INPUT, NONE);
+		PIN_SLP(gpb-4, INPUT, DOWN);
+		PIN_SLP(gpb-5, INPUT, DOWN);
+		PIN_SLP(gpb-6, INPUT, DOWN);
+		PIN_SLP(gpb-7, INPUT, DOWN);
+
+		PIN_SLP(gpc0-0, INPUT, DOWN);
+		PIN_SLP(gpc0-1, INPUT, DOWN);
+		PIN_SLP(gpc0-2, INPUT, DOWN);
+		PIN_SLP(gpc0-3, INPUT, DOWN);
+		PIN_SLP(gpc0-4, INPUT, DOWN);
+
+		PIN_SLP(gpc1-0, INPUT, UP);
+		PIN_SLP(gpc1-1, PREV, NONE);
+		PIN_SLP(gpc1-2, INPUT, UP);
+		PIN_SLP(gpc1-3, INPUT, UP);
+		PIN_SLP(gpc1-4, INPUT, UP);
+
+		PIN_SLP(gpd0-0, INPUT, DOWN);
+		PIN_SLP(gpd0-1, OUT0, NONE);
+		PIN_SLP(gpd0-2, INPUT, NONE);
+		PIN_SLP(gpd0-3, INPUT, NONE);
+
+		PIN_SLP(gpd1-0, INPUT, DOWN);
+		PIN_SLP(gpd1-1, INPUT, DOWN);
+		PIN_SLP(gpd1-2, INPUT, NONE);
+		PIN_SLP(gpd1-3, INPUT, NONE);
+
+		PIN_SLP(gpf0-0, OUT0, NONE);
+		PIN_SLP(gpf0-1, OUT0, NONE);
+		PIN_SLP(gpf0-2, OUT0, NONE);
+		PIN_SLP(gpf0-3, OUT0, NONE);
+		PIN_SLP(gpf0-4, OUT0, NONE);
+		PIN_SLP(gpf0-5, OUT0, NONE);
+		PIN_SLP(gpf0-6, OUT0, NONE);
+		PIN_SLP(gpf0-7, OUT0, NONE);
+
+		PIN_SLP(gpf1-0, OUT0, NONE);
+		PIN_SLP(gpf1-1, OUT0, NONE);
+		PIN_SLP(gpf1-2, OUT0, NONE);
+		PIN_SLP(gpf1-3, OUT0, NONE);
+		PIN_SLP(gpf1-4, OUT0, NONE);
+		PIN_SLP(gpf1-5, OUT0, NONE);
+		PIN_SLP(gpf1-6, OUT0, NONE);
+		PIN_SLP(gpf1-7, OUT0, NONE);
+
+		PIN_SLP(gpf2-0, OUT0, NONE);
+		PIN_SLP(gpf2-1, OUT0, NONE);
+		PIN_SLP(gpf2-2, OUT0, NONE);
+		PIN_SLP(gpf2-3, OUT0, NONE);
+		PIN_SLP(gpf2-4, OUT0, NONE);
+		PIN_SLP(gpf2-5, OUT0, NONE);
+		PIN_SLP(gpf2-6, OUT0, NONE);
+		PIN_SLP(gpf2-7, OUT0, NONE);
+
+		PIN_SLP(gpf3-0, OUT0, NONE);
+		PIN_SLP(gpf3-1, OUT0, NONE);
+		PIN_SLP(gpf3-2, OUT0, NONE);
+		PIN_SLP(gpf3-3, OUT0, NONE);
+		PIN_SLP(gpf3-4, OUT0, NONE);
+		PIN_SLP(gpf3-5, OUT0, NONE);
+
+		PIN_SLP(gpj0-0, INPUT, DOWN);
+		PIN_SLP(gpj0-1, INPUT, DOWN);
+		PIN_SLP(gpj0-2, INPUT, DOWN);
+		PIN_SLP(gpj0-3, PREV, NONE);
+		PIN_SLP(gpj0-4, PREV, NONE);
+		PIN_SLP(gpj0-5, OUT0, NONE);
+		PIN_SLP(gpj0-6, OUT0, NONE);
+		PIN_SLP(gpj0-7, OUT0, NONE);
+
+		PIN_SLP(gpj1-0, OUT0, NONE);
+		PIN_SLP(gpj1-1, INPUT, DOWN);
+		PIN_SLP(gpj1-2, PREV, NONE);
+		PIN_SLP(gpj1-3, OUT0, NONE);
+	};
+};
+
+&pinctrl_1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sleep1>;
+
+	uart_sel: uart-sel {
+		samsung,pins = "gpl2-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-val = <1>;
+		/* 0 = CP, 1 = AP (serial output) */
+	};
+
+	gpio_keys: gpio-keys {
+		samsung,pins = "gpx2-2", "gpx2-7", "gpx3-3";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	wifi_host_wake: wifi-host-wake {
+		samsung,pins = "gpx2-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	bt_shutdown: bt-shutdown {
+		samsung,pins = "gpl0-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+		samsung,pin-val = <1>;
+	};
+
+	bt_device_wakeup: bt-device-wakeup {
+		samsung,pins = "gpx3-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	bt_host_wakeup: bt-host-wakeup {
+		samsung,pins = "gpx2-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+	};
+
+	max77686_irq: max77686-irq {
+		samsung,pins = "gpx0-7";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	sdhci2_cd_irq: sdhci2-cd-irq {
+		samsung,pins = "gpx3-4";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	tsp_rst: tsp-rst {
+		samsung,pins = "gpm0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-val = <1>;
+	};
+
+	tsp_reg_gpio_1: tsp-reg-gpio-1 {
+		samsung,pins = "gpm4-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	tsp_irq: tsp-irq {
+		samsung,pins = "gpm2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	wifi_reset: wifi-reset {
+		samsung,pins = "gpm3-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	sd3_wifi: sd3-wifi {
+		samsung,pins = "gpk3-3", "gpk3-4", "gpk3-5", "gpk3-6";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	ak8975_irq: ak8975-irq {
+		samsung,pins = "gpm4-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_F>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+	};
+
+	sleep1: sleep-states {
+		PIN_SLP(gpk0-0, PREV, NONE);
+		PIN_SLP(gpk0-1, PREV, NONE);
+		PIN_SLP(gpk0-2, PREV, NONE);
+		PIN_SLP(gpk0-3, PREV, NONE);
+		PIN_SLP(gpk0-4, PREV, NONE);
+		PIN_SLP(gpk0-5, PREV, NONE);
+		PIN_SLP(gpk0-6, PREV, NONE);
+
+		PIN_SLP(gpk1-0, INPUT, DOWN);
+		PIN_SLP(gpk1-1, INPUT, DOWN);
+		PIN_SLP(gpk1-2, INPUT, DOWN);
+		PIN_SLP(gpk1-3, PREV, NONE);
+		PIN_SLP(gpk1-4, PREV, NONE);
+		PIN_SLP(gpk1-5, PREV, NONE);
+		PIN_SLP(gpk1-6, PREV, NONE);
+
+		PIN_SLP(gpk2-0, INPUT, DOWN);
+		PIN_SLP(gpk2-1, INPUT, DOWN);
+		PIN_SLP(gpk2-2, INPUT, DOWN);
+		PIN_SLP(gpk2-3, INPUT, DOWN);
+		PIN_SLP(gpk2-4, INPUT, DOWN);
+		PIN_SLP(gpk2-5, INPUT, DOWN);
+		PIN_SLP(gpk2-6, INPUT, DOWN);
+
+		PIN_SLP(gpk3-0, OUT0, NONE);
+		PIN_SLP(gpk3-1, INPUT, NONE);
+		PIN_SLP(gpk3-2, INPUT, DOWN);
+		PIN_SLP(gpk3-3, INPUT, NONE);
+		PIN_SLP(gpk3-4, INPUT, NONE);
+		PIN_SLP(gpk3-5, INPUT, NONE);
+		PIN_SLP(gpk3-6, INPUT, NONE);
+
+		PIN_SLP(gpl0-0, OUT0, NONE);
+		PIN_SLP(gpl0-1, INPUT, NONE);
+		PIN_SLP(gpl0-2, INPUT, NONE);
+		PIN_SLP(gpl0-3, INPUT, DOWN);
+		PIN_SLP(gpl0-4, PREV, NONE);
+		PIN_SLP(gpl0-6, PREV, NONE);
+
+		PIN_SLP(gpl1-0, OUT0, NONE);
+		PIN_SLP(gpl1-1, OUT0, NONE);
+
+		PIN_SLP(gpl2-0, INPUT, DOWN);
+		PIN_SLP(gpl2-1, INPUT, DOWN);
+		PIN_SLP(gpl2-2, INPUT, DOWN);
+		PIN_SLP(gpl2-3, INPUT, DOWN);
+		PIN_SLP(gpl2-4, OUT0, NONE);
+		PIN_SLP(gpl2-5, INPUT, DOWN);
+		PIN_SLP(gpl2-6, PREV, NONE);
+		PIN_SLP(gpl2-7, PREV, NONE);
+
+		PIN_SLP(gpm0-0, PREV, NONE);
+		PIN_SLP(gpm0-1, OUT0, NONE);
+		PIN_SLP(gpm0-2, INPUT, DOWN);
+		PIN_SLP(gpm0-3, INPUT, NONE);
+		PIN_SLP(gpm0-4, OUT0, NONE);
+		PIN_SLP(gpm0-5, OUT0, NONE);
+		PIN_SLP(gpm0-6, INPUT, DOWN);
+		PIN_SLP(gpm0-7, OUT0, NONE);
+
+		PIN_SLP(gpm1-0, INPUT, NONE);
+		PIN_SLP(gpm1-1, INPUT, NONE);
+		PIN_SLP(gpm1-2, INPUT, NONE);
+		PIN_SLP(gpm1-3, INPUT, NONE);
+		PIN_SLP(gpm1-4, INPUT, NONE);
+		PIN_SLP(gpm1-5, INPUT, NONE);
+		PIN_SLP(gpm1-6, INPUT, DOWN);
+
+		PIN_SLP(gpm2-0, INPUT, NONE);
+		PIN_SLP(gpm2-1, INPUT, NONE);
+		PIN_SLP(gpm2-2, OUT0, NONE);
+		PIN_SLP(gpm2-3, OUT0, DOWN);
+		PIN_SLP(gpm2-4, INPUT, DOWN);
+
+		PIN_SLP(gpm3-0, PREV, NONE);
+		PIN_SLP(gpm3-1, PREV, NONE);
+		PIN_SLP(gpm3-2, PREV, NONE);
+		PIN_SLP(gpm3-3, OUT1, NONE);
+		PIN_SLP(gpm3-4, OUT0, DOWN);
+		PIN_SLP(gpm3-5, PREV, NONE);
+		PIN_SLP(gpm3-6, PREV, NONE);
+		PIN_SLP(gpm3-7, OUT0, NONE);
+
+		PIN_SLP(gpm4-0, INPUT, NONE);
+		PIN_SLP(gpm4-1, INPUT, NONE);
+		PIN_SLP(gpm4-2, INPUT, DOWN);
+		PIN_SLP(gpm4-3, INPUT, DOWN);
+		PIN_SLP(gpm4-4, PREV, NONE);
+		PIN_SLP(gpm4-5, OUT0, NONE);
+		PIN_SLP(gpm4-6, OUT0, NONE);
+		PIN_SLP(gpm4-7, INPUT, DOWN);
+
+		PIN_SLP(gpy0-0, INPUT, DOWN);
+		PIN_SLP(gpy0-1, INPUT, DOWN);
+		PIN_SLP(gpy0-2, INPUT, NONE);
+		PIN_SLP(gpy0-3, INPUT, NONE);
+		PIN_SLP(gpy0-4, INPUT, NONE);
+		PIN_SLP(gpy0-5, INPUT, NONE);
+
+		PIN_SLP(gpy1-0, INPUT, DOWN);
+		PIN_SLP(gpy1-1, INPUT, DOWN);
+		PIN_SLP(gpy1-2, INPUT, DOWN);
+		PIN_SLP(gpy1-3, INPUT, DOWN);
+
+		PIN_SLP(gpy2-0, PREV, NONE);
+		PIN_SLP(gpy2-1, INPUT, DOWN);
+		PIN_SLP(gpy2-2, INPUT, NONE);
+		PIN_SLP(gpy2-3, INPUT, NONE);
+		PIN_SLP(gpy2-4, INPUT, NONE);
+		PIN_SLP(gpy2-5, INPUT, NONE);
+
+		PIN_SLP(gpy3-0, INPUT, DOWN);
+		PIN_SLP(gpy3-1, INPUT, DOWN);
+		PIN_SLP(gpy3-2, INPUT, DOWN);
+		PIN_SLP(gpy3-3, INPUT, DOWN);
+		PIN_SLP(gpy3-4, INPUT, DOWN);
+		PIN_SLP(gpy3-5, INPUT, DOWN);
+		PIN_SLP(gpy3-6, INPUT, DOWN);
+		PIN_SLP(gpy3-7, INPUT, DOWN);
+
+		PIN_SLP(gpy4-0, INPUT, DOWN);
+		PIN_SLP(gpy4-1, INPUT, DOWN);
+		PIN_SLP(gpy4-2, INPUT, DOWN);
+		PIN_SLP(gpy4-3, INPUT, DOWN);
+		PIN_SLP(gpy4-4, INPUT, DOWN);
+		PIN_SLP(gpy4-5, INPUT, DOWN);
+		PIN_SLP(gpy4-6, INPUT, DOWN);
+		PIN_SLP(gpy4-7, INPUT, DOWN);
+
+		PIN_SLP(gpy5-0, INPUT, DOWN);
+		PIN_SLP(gpy5-1, INPUT, DOWN);
+		PIN_SLP(gpy5-2, INPUT, DOWN);
+		PIN_SLP(gpy5-3, INPUT, DOWN);
+		PIN_SLP(gpy5-4, INPUT, DOWN);
+		PIN_SLP(gpy5-5, INPUT, DOWN);
+		PIN_SLP(gpy5-6, INPUT, DOWN);
+		PIN_SLP(gpy5-7, INPUT, DOWN);
+
+		PIN_SLP(gpy6-0, INPUT, DOWN);
+		PIN_SLP(gpy6-1, INPUT, DOWN);
+		PIN_SLP(gpy6-2, INPUT, DOWN);
+		PIN_SLP(gpy6-3, INPUT, DOWN);
+		PIN_SLP(gpy6-4, INPUT, DOWN);
+		PIN_SLP(gpy6-5, INPUT, DOWN);
+		PIN_SLP(gpy6-6, INPUT, DOWN);
+		PIN_SLP(gpy6-7, INPUT, DOWN);
+	};
+};
+
+&pinctrl_2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sleep2>;
+
+	sleep2: sleep-states {
+		PIN_SLP(gpz-0, INPUT, DOWN);
+		PIN_SLP(gpz-1, INPUT, DOWN);
+		PIN_SLP(gpz-2, INPUT, DOWN);
+		PIN_SLP(gpz-3, INPUT, DOWN);
+		PIN_SLP(gpz-4, INPUT, DOWN);
+		PIN_SLP(gpz-5, INPUT, DOWN);
+		PIN_SLP(gpz-6, INPUT, DOWN);
+	};
+};
+
+&pinctrl_3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sleep3>;
+
+	sleep3: sleep-states {
+		PIN_SLP(gpv0-0, INPUT, DOWN);
+		PIN_SLP(gpv0-1, INPUT, DOWN);
+		PIN_SLP(gpv0-2, INPUT, DOWN);
+		PIN_SLP(gpv0-3, INPUT, DOWN);
+		PIN_SLP(gpv0-4, INPUT, DOWN);
+		PIN_SLP(gpv0-5, INPUT, DOWN);
+		PIN_SLP(gpv0-6, INPUT, DOWN);
+		PIN_SLP(gpv0-7, INPUT, DOWN);
+
+		PIN_SLP(gpv1-0, INPUT, DOWN);
+		PIN_SLP(gpv1-1, INPUT, DOWN);
+		PIN_SLP(gpv1-2, INPUT, DOWN);
+		PIN_SLP(gpv1-3, INPUT, DOWN);
+		PIN_SLP(gpv1-4, INPUT, DOWN);
+		PIN_SLP(gpv1-5, INPUT, DOWN);
+		PIN_SLP(gpv1-6, INPUT, DOWN);
+		PIN_SLP(gpv1-7, INPUT, DOWN);
+
+		PIN_SLP(gpv2-0, INPUT, DOWN);
+		PIN_SLP(gpv2-1, INPUT, DOWN);
+		PIN_SLP(gpv2-2, INPUT, DOWN);
+		PIN_SLP(gpv2-3, INPUT, DOWN);
+		PIN_SLP(gpv2-4, INPUT, DOWN);
+		PIN_SLP(gpv2-5, INPUT, DOWN);
+		PIN_SLP(gpv2-6, INPUT, DOWN);
+		PIN_SLP(gpv2-7, INPUT, DOWN);
+
+		PIN_SLP(gpv3-0, INPUT, DOWN);
+		PIN_SLP(gpv3-1, INPUT, DOWN);
+		PIN_SLP(gpv3-2, INPUT, DOWN);
+		PIN_SLP(gpv3-3, INPUT, DOWN);
+		PIN_SLP(gpv3-4, INPUT, DOWN);
+		PIN_SLP(gpv3-5, INPUT, DOWN);
+		PIN_SLP(gpv3-6, INPUT, DOWN);
+		PIN_SLP(gpv3-7, INPUT, DOWN);
+
+		PIN_SLP(gpv4-0, INPUT, DOWN);
+		PIN_SLP(gpv4-1, INPUT, DOWN);
+	};
+};
+
+&pmu_system_controller {
+	assigned-clocks = <&pmu_system_controller 0>;
+	assigned-clock-parents =  <&clock CLK_XUSBXTI>;
+};
+
+&rtc {
+	clocks = <&clock CLK_RTC>, <&max77686 MAX77686_CLK_AP>;
+	clock-names = "rtc", "rtc_src";
+	status = "okay";
+};
+
+&sdhci_2 {
+	bus-width = <4>;
+	cd-gpios = <&gpx3 4 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4 &sdhci2_cd_irq>;
+	pinctrl-names = "default";
+	vmmc-supply = <&ldo21_reg>;
+	status = "okay";
+};
+
+&sdhci_3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	non-removable;
+	bus-width = <4>;
+	mmc-pwrseq = <&wlan_pwrseq>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd3_clk &sd3_cmd &sd3_wifi &wifi_host_wake>;
+	status = "okay";
+
+	brcmf: wifi@1 {
+		reg = <0x1>;
+		compatible = "brcm,bcm4329-fmac";
+		interrupt-parent = <&gpx2>;
+		interrupts = <5 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "host-wake";
+	};
+};
+
+&serial_0 {
+	pinctrl-0 = <&uart0_data &uart0_fctl>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4330-bt";
+		pinctrl-0 = <&bt_shutdown &bt_device_wakeup &bt_host_wakeup>;
+		pinctrl-names = "default";
+
+		max-speed = <2000000>;
+		shutdown-gpios = <&gpl0 6 GPIO_ACTIVE_HIGH>;
+		device-wakeup-gpios = <&gpx3 1 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpx2 6 GPIO_ACTIVE_HIGH>;
+		clocks = <&max77686 MAX77686_CLK_PMIC>;
+		clock-names = "lpo";
+	};
+};
+
+&serial_1 {
+	status = "okay";
+};
+
+&serial_2 {
+	pinctrl-0 = <&uart_sel>;
+	pinctrl-names = "default";
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

