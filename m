Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08F577218B4
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  4 Jun 2023 18:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230437AbjFDQ5Q (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 4 Jun 2023 12:57:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbjFDQ5P (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 4 Jun 2023 12:57:15 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC2B9F;
        Sun,  4 Jun 2023 09:57:11 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-51478f6106cso6032589a12.1;
        Sun, 04 Jun 2023 09:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685897830; x=1688489830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1VmWvVL6neBZJQqs7necMMpsicX/St+oWU2PauccZ4o=;
        b=hqfwUHdhp6wjGd3dT5Qr9SMwOjB7bGuN7BMdJrBixykUByBTCWyq5Ixmb+lQecolaa
         saNjJCXBIDwGkIvvQWhAIjysuP/kwisZiJ7zh0Au/iOR/0Y264US6rHlhjbByAm7yRAX
         dFCfTou6HKEdaaP0p4MCswH4BLe3YsmxN13NUCYEDij4RPCeA8R5XT1zPx03FfdXzwQY
         vAOP9UlwYtsr1rGvYPqURNhGgkqhRvnTIgW3yGeEL/GfEA+zLPa2kq5g/t1WlfBt1zXX
         eLCJrdIrvwg4v3LbvgXz4wEu/zSw5a+iqemeYbJAB4uxn0PffsPyTapO172RD4ngG66B
         R4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685897830; x=1688489830;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1VmWvVL6neBZJQqs7necMMpsicX/St+oWU2PauccZ4o=;
        b=Iv4chBjjJnBiPpt544/Yy5IKBPI8n2uIlJR+gSM+nULi5J+cVEuf+rgaFcIIDRvYFH
         6aRoCNvZjw7y1QAAYOfOv2nSmEF2kASTcZzrt+SAJ6pRIuWScKptlx5g+Jt8ZuCTcvH6
         xyN1dy4WPmcezmi8hhdMSXtGlMeGWxkdT6lKaRsvQqkJq8ZTAav2GT9QpMfNBC0/Aj7v
         6EESbsq0C/IWWzAVyZm/eD2F9LewBR64I4sO/MRYqnum0B69Y9XKo7jociL8ecmF3eKr
         t0F2SxWGB5Iyy1Y8VqBCT6RXcyyz/F24QnZkUyUNtU5cVEO5WAid30avsGTVaZoRddBj
         y6mQ==
X-Gm-Message-State: AC+VfDwXEYeyYP5wtGCMdwCuujF7f9dYJjxTd9lw/l3z94L3JdEktBZd
        i7DyrkAPgZJZ8OAxIPQ1SGs=
X-Google-Smtp-Source: ACHHUZ7ikQAm7IBm8QCbaMM7a8ee38RBJZKnmEuZ1oOIYdhc8tNH29kcjdycLYpT9ypZrL8txPZ8ng==
X-Received: by 2002:a05:6402:884:b0:514:c3ba:d8f5 with SMTP id e4-20020a056402088400b00514c3bad8f5mr6146080edy.10.1685897829671;
        Sun, 04 Jun 2023 09:57:09 -0700 (PDT)
Received: from localhost.my.domain (83.11.101.145.ipv4.supernova.orange.pl. [83.11.101.145])
        by smtp.gmail.com with ESMTPSA id i9-20020a05640200c900b0050bce352dc5sm3004707edu.85.2023.06.04.09.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 09:57:09 -0700 (PDT)
From:   Artur Weber <aweber.kernel@gmail.com>
To:     Olof Johansson <olof@lixom.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Artur Weber <aweber.kernel@gmail.com>
Subject: [PATCH v4] ARM: dts: exynos: Add Samsung Galaxy Tab 3 8.0 boards
Date:   Sun,  4 Jun 2023 18:56:27 +0200
Message-ID: <20230604165627.16963-1-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Introduce support for the Galaxy Tab 3 8.0 series of boards:

 - Samsung Galaxy Tab 3 8.0 WiFi (SM-T310/lt01wifi)
 - Samsung Galaxy Tab 3 8.0 3G (SM-T311/lt013g)
 - Samsung Galaxy Tab 3 8.0 LTE (SM-T315/lt01lte)

What works:

 - Display and backlight
 - Touchscreen
 - GPIO buttons, hall sensor
 - WiFi and Bluetooth
 - USB, fuel gauge, charging
 - Accelerometer and magnetometer
 - Audio: speaker, microphone, headset
 - WiFi model only: light sensor

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
This is an updated version of "[PATCH v3 13/13] ARM: dts: exynos: Add Samsung
Galaxy Tab 3 8.0 boards"[1].

Changed in v4:
- Added touchkey keycodes
- Added audio nodes
- Added MMC aliases
- Fixed dtbs_check warnings
- Fixed indentation in pinctrl sleep state overrides

Changed in v3:
 - Addressed review comments
 - Removed rtc node (RTC is provided by PMIC)
 - Added CPU thermal node
 - Fixed dtbs_check warnings
 - Added common changes from next/dt

Should pass dtbs_check with no errors, provided that the following patches
are present:

Backlight node is adapted to changes from "[PATCH v2 1/4] dt-bindings:
backlight: lp855x: convert to YAML and modernize"[2]. The whole patchset
has been reviewed, waiting for any further reviews or a merge.

Touchkey keycode property is added by "[PATCH 1/2] dt-bindings: mms114: Add
linux,keycodes property for touch keys"[3]. So far only the bindings part
of the patch has been acked, otherwise everything is awaiting review.

Display bindings have been added by "[PATCH v5 1/3] dt-bindings: display:
panel: Add Samsung S6D7AA0 LCD panel controller"[4]. These are already
reviewed and merged into the DRM tree.

[1] https://lore.kernel.org/linux-devicetree/20230501195525.6268-14-aweber.kernel@gmail.com/
[2] https://lore.kernel.org/linux-devicetree/20230519180728.2281-2-aweber.kernel@gmail.com/
[3] https://lore.kernel.org/linux-devicetree/20230521145843.19489-2-aweber.kernel@gmail.com/
[4] https://lore.kernel.org/linux-devicetree/20230519170354.29610-2-aweber.kernel@gmail.com/
---
 arch/arm/boot/dts/Makefile                  |    3 +
 arch/arm/boot/dts/exynos4212-tab3-3g8.dts   |   29 +
 arch/arm/boot/dts/exynos4212-tab3-lte8.dts  |   44 +
 arch/arm/boot/dts/exynos4212-tab3-wifi8.dts |   26 +
 arch/arm/boot/dts/exynos4212-tab3.dtsi      | 1303 +++++++++++++++++++
 5 files changed, 1405 insertions(+)
 create mode 100644 arch/arm/boot/dts/exynos4212-tab3-3g8.dts
 create mode 100644 arch/arm/boot/dts/exynos4212-tab3-lte8.dts
 create mode 100644 arch/arm/boot/dts/exynos4212-tab3-wifi8.dts
 create mode 100644 arch/arm/boot/dts/exynos4212-tab3.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 59829fc90315..6a4ca481171e 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -217,6 +217,9 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
 	exynos4210-smdkv310.dtb \
 	exynos4210-trats.dtb \
 	exynos4210-universal_c210.dtb \
+	exynos4212-tab3-3g8.dtb \
+	exynos4212-tab3-lte8.dtb \
+	exynos4212-tab3-wifi8.dtb \
 	exynos4412-i9300.dtb \
 	exynos4412-i9305.dtb \
 	exynos4412-itop-elite.dtb \
diff --git a/arch/arm/boot/dts/exynos4212-tab3-3g8.dts b/arch/arm/boot/dts/exynos4212-tab3-3g8.dts
new file mode 100644
index 000000000000..d96b2dd44608
--- /dev/null
+++ b/arch/arm/boot/dts/exynos4212-tab3-3g8.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung's Exynos4212 based Galaxy Tab 3 8.0 3G board device tree
+ * source
+ *
+ * Copyright (c) 2013 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ */
+
+/dts-v1/;
+#include "exynos4212-tab3.dtsi"
+
+/ {
+	model = "Samsung Galaxy Tab 3 8.0 3G (SM-T311) based on Exynos4212";
+	compatible = "samsung,t311", "samsung,tab3", "samsung,exynos4212", "samsung,exynos4";
+	chassis-type = "tablet";
+};
+
+/* Pin control sleep state overrides */
+&sleep0 {
+	PIN_SLP(gpb-5, INPUT, UP);
+};
+
+&sleep1 {
+	PIN_SLP(gpl0-0, OUT0, NONE);
+	PIN_SLP(gpl1-0, OUT0, NONE);
+	PIN_SLP(gpl2-4, OUT0, NONE);
+	PIN_SLP(gpm3-3, OUT1, NONE);
+};
diff --git a/arch/arm/boot/dts/exynos4212-tab3-lte8.dts b/arch/arm/boot/dts/exynos4212-tab3-lte8.dts
new file mode 100644
index 000000000000..bbb398eca7b0
--- /dev/null
+++ b/arch/arm/boot/dts/exynos4212-tab3-lte8.dts
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung's Exynos4212 based Galaxy Tab 3 8.0 LTE board device tree
+ * source
+ *
+ * Copyright (c) 2013 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ */
+
+/dts-v1/;
+#include "exynos4212-tab3.dtsi"
+
+/ {
+	model = "Samsung Galaxy Tab 3 8.0 LTE (SM-T315) based on Exynos4212";
+	compatible = "samsung,t315", "samsung,tab3", "samsung,exynos4212", "samsung,exynos4";
+	chassis-type = "tablet";
+};
+
+/* Pin control sleep state overrides */
+&sleep0 {
+	PIN_SLP(gpa0-4, INPUT, UP);
+	PIN_SLP(gpa0-5, INPUT, UP);
+
+	PIN_SLP(gpb-5, INPUT, UP);
+
+	PIN_SLP(gpc0-0, PREV, NONE);
+	PIN_SLP(gpc1-3, INPUT, NONE);
+
+	PIN_SLP(gpf1-6, INPUT, NONE);
+	PIN_SLP(gpf2-2, PREV, NONE);
+};
+
+&sleep1 {
+	PIN_SLP(gpl0-0, PREV, NONE);
+
+	PIN_SLP(gpl1-0, PREV, NONE);
+
+	PIN_SLP(gpl2-1, INPUT, DOWN);
+	PIN_SLP(gpl2-2, INPUT, DOWN);
+	PIN_SLP(gpl2-4, OUT0, NONE);
+	PIN_SLP(gpl2-5, PREV, NONE);
+
+	PIN_SLP(gpm3-3, OUT1, NONE);
+};
diff --git a/arch/arm/boot/dts/exynos4212-tab3-wifi8.dts b/arch/arm/boot/dts/exynos4212-tab3-wifi8.dts
new file mode 100644
index 000000000000..54cb01703b60
--- /dev/null
+++ b/arch/arm/boot/dts/exynos4212-tab3-wifi8.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung's Exynos4212 based Galaxy Tab 3 8.0 WiFi board device tree
+ * source
+ *
+ * Copyright (c) 2013 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ */
+
+/dts-v1/;
+#include "exynos4212-tab3.dtsi"
+
+/ {
+	model = "Samsung Galaxy Tab 3 8.0 WiFi (SM-T310) based on Exynos4212";
+	compatible = "samsung,t310", "samsung,tab3", "samsung,exynos4212", "samsung,exynos4";
+	chassis-type = "tablet";
+};
+
+&i2c_lightsensor {
+	status = "okay";
+
+	lightsensor@10 {
+		compatible = "capella,cm3323";
+		reg = <0x10>;
+	};
+};
diff --git a/arch/arm/boot/dts/exynos4212-tab3.dtsi b/arch/arm/boot/dts/exynos4212-tab3.dtsi
new file mode 100644
index 000000000000..e014100e11f8
--- /dev/null
+++ b/arch/arm/boot/dts/exynos4212-tab3.dtsi
@@ -0,0 +1,1303 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Samsung's Exynos4212 based Galaxy Tab 3 board common source
+ *
+ * Copyright (c) 2013 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ */
+
+/dts-v1/;
+#include "exynos4212.dtsi"
+#include "exynos4412-ppmu-common.dtsi"
+#include "exynos-mfc-reserved-memory.dtsi"
+#include <dt-bindings/clock/samsung,s2mps11.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "exynos-pinctrl.h"
+
+/*
+ * This device does not use the built-in RTC; instead, the RTC in the
+ * S5M8786 PMIC is used instead. Remove the unused node to avoid DTB check
+ * warnings.
+ */
+/delete-node/ &rtc;
+
+/ {
+	compatible = "samsung,tab3", "samsung,exynos4212", "samsung,exynos4";
+
+	memory@40000000 {
+		device_type = "memory";
+
+		/*
+		 * Technically 1.5GB is available, but the latter 512MB is handled
+		 * in a special way by downstream (every second page is skipped),
+		 * and thus doesn't initialize correctly on mainline. Only 1020M is
+		 * used for now.
+		 */
+		reg = <0x40000000 0x3fc00000>;
+	};
+
+	aliases {
+		mmc0 = &mshc_0;   /* Internal storage */
+		mmc1 = &sdhci_2;  /* SD card */
+		mmc2 = &sdhci_3;  /* WiFi */
+	};
+
+	chosen {
+		stdout-path = &serial_2;
+
+		/* Default S-BOOT bootloader loads initramfs here */
+		linux,initrd-start = <0x42000000>;
+		linux,initrd-end = <0x42800000>;
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
+		key-power {
+			gpios = <&gpx2 7 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_POWER>;
+			label = "power";
+			debounce-interval = <10>;
+			wakeup-source;
+		};
+
+		key-up {
+			gpios = <&gpx2 2 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			label = "volume down";
+			debounce-interval = <10>;
+		};
+
+		key-down {
+			gpios = <&gpx3 3 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			label = "volume up";
+			debounce-interval = <10>;
+		};
+
+		key-home {
+			gpios = <&gpx1 2 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_HOME>;
+			label = "home";
+			debounce-interval = <10>;
+		};
+
+		switch-hall-sensor {
+			gpios = <&gpx2 4 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			linux,can-disable;
+			label = "hall effect sensor";
+			debounce-interval = <10>;
+			wakeup-source;
+		};
+	};
+
+	led-touchkeys {
+		compatible = "regulator-led";
+		vled-supply = <&ldo20_reg>;
+		default-state = "off";
+		function = LED_FUNCTION_KBD_BACKLIGHT;
+		color = <LED_COLOR_ID_WHITE>;
+	};
+
+	i2c_max77693: i2c-gpio-1 {
+		compatible = "i2c-gpio";
+		sda-gpios = <&gpm2 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpm2 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmic@66 {
+			compatible = "maxim,max77693";
+			reg = <0x66>;
+			interrupt-parent = <&gpx1>;
+			interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&max77693_irq>;
+
+			regulators {
+				esafeout1_reg: ESAFEOUT1 {
+					regulator-name = "ESAFEOUT1";
+					regulator-boot-on;
+				};
+
+				esafeout2_reg: ESAFEOUT2 {
+					regulator-name = "ESAFEOUT2";
+				};
+
+				charger_reg: CHARGER {
+					regulator-name = "CHARGER";
+					regulator-min-microamp = <60000>;
+					regulator-max-microamp = <2580000>;
+					regulator-boot-on;
+				};
+			};
+
+			charger {
+				compatible = "maxim,max77693-charger";
+
+				maxim,constant-microvolt = <4350000>;
+				maxim,min-system-microvolt = <3600000>;
+				maxim,thermal-regulation-celsius = <100>;
+				maxim,battery-overcurrent-microamp = <3500000>;
+				maxim,charge-input-threshold-microvolt = <4300000>;
+			};
+		};
+	};
+
+	i2c_max77693_fuel: i2c-gpio-2 {
+		compatible = "i2c-gpio";
+		sda-gpios = <&gpy0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpy0 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		fuel-gauge@36 {
+			compatible = "maxim,max17050";
+			reg = <0x36>;
+			interrupt-parent = <&gpx2>;
+			interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&max77693_fuel_irq>;
+
+			maxim,over-heat-temp = <500>;
+			maxim,over-volt = <4500>;
+		};
+	};
+
+	i2c_magnetometer: i2c-gpio-3 {
+		compatible = "i2c-gpio";
+		sda-gpios = <&gpy2 4 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpy2 5 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		magnetometer@2e {
+			compatible = "yamaha,yas532";
+			reg = <0x2e>;
+			iovdd-supply = <&ldo3_reg>;
+			mount-matrix = "-1", "0", "0",
+					  "0", "1", "0",
+					  "0", "0", "-1";
+		};
+	};
+
+	i2c_lightsensor: i2c-gpio-4 {
+		compatible = "i2c-gpio";
+		sda-gpios = <&gpl0 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpl0 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		i2c-gpio,delay-us = <2>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+
+		/* WiFi model uses CM3323, 3G/LTE use CM36653 */
+	};
+
+	i2c_bl: i2c-gpio-5 {
+		compatible = "i2c-gpio";
+		sda-gpios = <&gpm4 3 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&gpm4 2 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		backlight: backlight@2c {
+			compatible = "ti,lp8556";
+			reg = <0x2c>;
+
+			bl-name = "lcd-bl";
+			dev-ctrl = /bits/ 8 <0x80>;
+			init-brt = /bits/ 8 <0x78>; /* 120 */
+
+			power-supply = <&vbatt_reg>;
+			enable-supply = <&backlight_reset_supply>;
+
+			pwms = <&pwm 1 78770 0>;
+			pwm-names = "lp8556";
+
+			rom-a3h {
+				rom-addr = /bits/ 8 <0xa3>;
+				rom-val = /bits/ 8 <0x5e>;
+			};
+
+			rom-a5h {
+				rom-addr = /bits/ 8 <0xa5>;
+				rom-val = /bits/ 8 <0x34>;
+			};
+
+			rom-a7h {
+				rom-addr = /bits/ 8 <0xa7>;
+				rom-val = /bits/ 8 <0xfa>;
+			};
+		};
+	};
+
+	vbatt_reg: voltage-regulator-1 {
+		compatible = "regulator-fixed";
+		regulator-name = "VBATT";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	backlight_reset_supply: voltage-regulator-2 {
+		compatible = "regulator-fixed";
+		regulator-name = "BACKLIGHT_ENVDDIO";
+		pinctrl-names = "default";
+		pinctrl-0 = <&backlight_reset>;
+		gpio = <&gpm0 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	display_3v3_supply: voltage-regulator-3 {
+		compatible = "regulator-fixed";
+		regulator-name = "DISPLAY_3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&lcd_en>;
+		gpio = <&gpc0 1 GPIO_ACTIVE_HIGH>; /* LCD_EN */
+		enable-active-high;
+	};
+
+	mic_bias_reg: voltage-regulator-4 {
+		compatible = "regulator-fixed";
+		regulator-name = "MICBIAS_LDO_2.8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+	};
+
+	submic_bias_reg: voltage-regulator-5 {
+		compatible = "regulator-fixed";
+		regulator-name = "SUB_MICBIAS_LDO_2.8V";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+	};
+
+	sound: sound {
+		compatible = "samsung,midas-audio";
+		model = "TAB3";
+		mic-bias-supply = <&mic_bias_reg>;
+		submic-bias-supply = <&submic_bias_reg>;
+
+		samsung,audio-routing =
+			"HP", "HPOUT1L",
+			"HP", "HPOUT1R",
+
+			"SPK", "SPKOUTLN",
+			"SPK", "SPKOUTLP",
+			"SPK", "SPKOUTRN",
+			"SPK", "SPKOUTRP",
+
+			"RCV", "HPOUT2N",
+			"RCV", "HPOUT2P",
+
+			"LINE", "LINEOUT2N",
+			"LINE", "LINEOUT2P",
+
+			"HDMI", "LINEOUT1N",
+			"HDMI", "LINEOUT1P",
+
+			"IN2LP:VXRN", "MICBIAS1",
+			"IN2LN", "MICBIAS1",
+			"Main Mic", "MICBIAS1",
+
+			"IN1RP", "MICBIAS2",
+			"IN1RN", "MICBIAS2",
+			"Sub Mic", "MICBIAS2",
+
+			"IN1LP", "Headset Mic",
+			"IN1LN", "Headset Mic";
+
+		cpu {
+			sound-dai = <&i2s0 0>;
+		};
+
+		codec {
+			sound-dai = <&wm1811>;
+		};
+	};
+
+	wlan_pwrseq: sdhci3-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpm3 5 GPIO_ACTIVE_LOW>;
+		clocks = <&s5m8767_osc S2MPS11_CLK_BT>;
+		clock-names = "ext_clock";
+	};
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
+&bus_display {
+	devfreq = <&bus_leftbus>;
+	status = "okay";
+};
+
+&bus_dmc {
+	devfreq-events = <&ppmu_dmc0_3>, <&ppmu_dmc1_3>;
+	vdd-supply = <&buck1_reg>;
+	status = "okay";
+};
+
+&bus_fsys {
+	devfreq = <&bus_leftbus>;
+	status = "okay";
+};
+
+&bus_leftbus {
+	devfreq-events = <&ppmu_leftbus_3>, <&ppmu_rightbus_3>;
+	vdd-supply = <&buck3_reg>;
+	status = "okay";
+};
+
+&bus_mfc {
+	devfreq = <&bus_leftbus>;
+	status = "okay";
+};
+
+&bus_peri {
+	devfreq = <&bus_leftbus>;
+	status = "okay";
+};
+
+&bus_rightbus {
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
+			cooling-device = <&cpu0 7 7>, <&cpu1 7 7>;
+		};
+		map1 {
+			/* Corresponds to 200MHz at freq_table */
+			cooling-device = <&cpu0 13 13>, <&cpu1 13 13>;
+		};
+	};
+};
+
+&dsi_0 {
+	vddcore-supply = <&ldo8_reg>;
+	vddio-supply = <&ldo10_reg>;
+	samsung,burst-clock-frequency = <500000000>;
+	samsung,esc-clock-frequency = <20000000>;
+	samsung,pll-clock-frequency = <24000000>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "samsung,lsl080al02", "samsung,s6d7aa0";
+		reg = <0>;
+		power-supply = <&display_3v3_supply>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&lcd_nrst>;
+		reset-gpios = <&gpf0 4 GPIO_ACTIVE_LOW>;
+		backlight = <&backlight>;
+	};
+};
+
+&exynos_usbphy {
+	vbus-supply = <&esafeout1_reg>;
+	status = "okay";
+};
+
+&fimd {
+	status = "okay";
+};
+
+&gpu {
+	mali-supply = <&buck4_reg>;
+	status = "okay";
+};
+
+&hsotg {
+	vusb_d-supply = <&ldo15_reg>;
+	vusb_a-supply = <&ldo12_reg>;
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&i2c_1 {
+	pinctrl-0 = <&i2c1_bus>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	lis3dh: accelerometer@19 {
+		/* K2DH seems to be the same as lis2dh12 in terms of registers */
+		compatible = "st,lis2dh12-accel";
+		reg = <0x19>;
+
+		interrupt-parent = <&gpx0>;
+		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+
+		vdd-supply = <&ldo17_reg>;
+		vddio-supply = <&ldo3_reg>;
+
+		mount-matrix = "-1", "0", "0",
+				  "0", "1", "0",
+				  "0", "0", "-1";
+	};
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
+	touchscreen@48 {
+		/* MELFAS MMS252, using MMS114 compatible for now */
+		compatible = "melfas,mms114";
+		reg = <0x48>;
+		interrupt-parent = <&gpb>;
+		interrupts = <4 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <1280>;
+		avdd-supply = <&ldo21_reg>;
+		vdd-supply = <&ldo25_reg>;
+		linux,keycodes = <KEY_MENU KEY_BACK>;
+	};
+};
+
+&i2c_4 {
+	samsung,i2c-sda-delay = <100>;
+	samsung,i2c-slave-addr = <0x10>;
+	samsung,i2c-max-bus-freq = <100000>;
+	pinctrl-0 = <&i2c4_bus>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	wm1811: audio-codec@1a {
+		compatible = "wlf,wm1811";
+		reg = <0x1a>;
+		clocks = <&pmu_system_controller 0>;
+		clock-names = "MCLK1";
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
+		wlf,micbias-cfg = <0x25 0x2f>;
+
+		wlf,lineout1-feedback;
+		wlf,lineout1-se;
+		wlf,lineout2-se;
+		wlf,ldoena-always-driven;
+
+		AVDD2-supply = <&ldo3_reg>;
+		CPVDD-supply = <&ldo3_reg>;
+		DBVDD1-supply = <&ldo3_reg>;
+		DBVDD2-supply = <&ldo3_reg>;
+		DBVDD3-supply = <&ldo3_reg>;
+		SPKVDD1-supply = <&vbatt_reg>;
+		SPKVDD2-supply = <&vbatt_reg>;
+		wlf,ldo1ena-gpios = <&gpm4 4 GPIO_ACTIVE_HIGH>;
+		wlf,ldo2ena-gpios = <&gpm4 4 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&i2c_7 {
+	samsung,i2c-sda-delay = <100>;
+	samsung,i2c-slave-addr = <0x10>;
+	samsung,i2c-max-bus-freq = <100000>;
+	pinctrl-0 = <&i2c7_bus>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	s5m8767: pmic@66 {
+		compatible = "samsung,s5m8767-pmic";
+		reg = <0x66>;
+		interrupt-parent = <&gpx0>;
+		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&s5m8767_irq &s5m8767_dvs &s5m8767_ds>;
+		wakeup-source;
+
+		s5m8767,pmic-buck-default-dvs-idx = <1>;
+
+		s5m8767,pmic-buck-dvs-gpios = <&gpm3 0 GPIO_ACTIVE_HIGH>,
+						 <&gpm3 1 GPIO_ACTIVE_HIGH>,
+						 <&gpm3 2 GPIO_ACTIVE_HIGH>;
+
+		s5m8767,pmic-buck-ds-gpios = <&gpf3 1 GPIO_ACTIVE_HIGH>,
+						 <&gpf3 2 GPIO_ACTIVE_HIGH>,
+						 <&gpf3 3 GPIO_ACTIVE_HIGH>;
+
+		s5m8767,pmic-buck2-dvs-voltage = <1100000>, <1100000>,
+						<1100000>, <1100000>,
+						<1100000>, <1100000>,
+						<1100000>, <1100000>;
+
+		s5m8767,pmic-buck3-dvs-voltage = <1100000>, <1100000>,
+						<1100000>, <1100000>,
+						<1100000>, <1100000>,
+						<1100000>, <1100000>;
+
+		s5m8767,pmic-buck4-dvs-voltage = <1100000>, <1100000>,
+						<1100000>, <1100000>,
+						<1100000>, <1100000>,
+						<1100000>, <1100000>;
+
+		regulators {
+			ldo1_reg: LDO1 {
+				regulator-name = "VALIVE_1.0V_AP";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode = <1>;
+			};
+
+			ldo2_reg: LDO2 {
+				regulator-name = "VM1M2_1.2V_AP";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode = <1>;
+			};
+
+			ldo3_reg: LDO3 {
+				regulator-name = "VCC_1.8V_AP";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-always-on;
+				op_mode = <1>;
+			};
+
+			ldo5_reg: LDO5 {
+				regulator-name = "VCC_3.3V_MHL";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				op_mode = <1>;
+			};
+
+			ldo8_reg: LDO8 {
+				regulator-name = "VMIPI_1.0V";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
+				op_mode = <3>;
+			};
+
+			ldo9_reg: LDO9 {
+				regulator-name = "VSIL_1.2V";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				op_mode = <1>;
+			};
+
+			ldo10_reg: LDO10 {
+				regulator-name = "VMIPI_1.8V";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				op_mode = <3>;
+			};
+
+			ldo12_reg: LDO12 {
+				regulator-name = "VUOTG_3.0V";
+				regulator-min-microvolt = <3000000>;
+				regulator-max-microvolt = <3000000>;
+				op_mode = <1>;
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			ldo13_reg: LDO13 {
+				regulator-name = "VCC_1.8V_MHL";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				op_mode = <1>;
+			};
+
+			ldo15_reg: LDO15 {
+				regulator-name = "VHSIC_1.0V";
+				regulator-min-microvolt = <1000000>;
+				regulator-max-microvolt = <1000000>;
+				op_mode = <1>;
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			ldo17_reg: LDO17 {
+				regulator-name = "VCC_2.8V_AP";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				op_mode = <1>;
+				regulator-always-on;
+			};
+
+			ldo19_reg: LDO19 {
+				regulator-name = "VLED_IC_1.9V";
+				regulator-min-microvolt = <1900000>;
+				regulator-max-microvolt = <1900000>;
+				op_mode = <1>;
+				regulator-always-on;
+			};
+
+			ldo20_reg: LDO20 {
+				regulator-name = "VTOUCH_3.3V";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				op_mode = <1>;
+			};
+
+			ldo21_reg: LDO21 {
+				regulator-name = "TSP_VDD_3.3V";
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				op_mode = <1>;
+			};
+
+			ldo22_reg: LDO22 {
+				regulator-name = "5M_AF_2.8V";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				op_mode = <1>;
+			};
+
+			ldo23_reg: LDO23 {
+				regulator-name = "VTF_2.8V";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				op_mode = <3>;
+			};
+
+			ldo24_reg: LDO24 {
+				regulator-name = "LEDA_2.8V";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+				op_mode = <1>;
+			};
+
+			ldo25_reg: LDO25 {
+				regulator-name = "TSP_VDD_1.8V";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				op_mode = <1>;
+			};
+
+			ldo26_reg: LDO26 {
+				regulator-name = "CAM_IO_1.8V";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				op_mode = <1>;
+			};
+
+			ldo27_reg: LDO27 {
+				regulator-name = "VTCAM_1.8V";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				op_mode = <1>;
+			};
+
+			buck1_reg: BUCK1 {
+				regulator-name = "VDD_MIF";
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1100000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode = <3>;
+			};
+
+			buck2_reg: BUCK2 {
+				regulator-name = "VDD_ARM";
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1500000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode = <3>;
+			};
+
+			buck3_reg: BUCK3 {
+				regulator-name = "VDD_INT";
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1300000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode = <3>;
+			};
+
+			buck4_reg: BUCK4 {
+				regulator-name = "VDD_G3D";
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <1150000>;
+				regulator-boot-on;
+				op_mode = <3>;
+			};
+
+			buck5_reg: BUCK5 {
+				regulator-name = "VMEM_1.2V_AP";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt	= <1200000>;
+				regulator-always-on;
+				regulator-boot-on;
+				op_mode = <1>;
+			};
+
+			buck6_reg: BUCK6 {
+				regulator-name = "CAM_ISP_CORE_1.2V";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+				op_mode = <1>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+
+		s5m8767_osc: clocks {
+			compatible = "samsung,s5m8767-clk";
+			#clock-cells = <1>;
+			clock-output-names = "en32khz_ap",
+					     "en32khz_cp",
+					     "en32khz_bt";
+		};
+	};
+};
+
+&i2s0 {
+	pinctrl-0 = <&i2s0_bus>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&mshc_0 {
+	broken-cd;
+	non-removable;
+	card-detect-delay = <200>;
+	vmmc-supply = <&ldo22_reg>;
+	clock-frequency = <400000000>;
+	samsung,dw-mshc-ciu-div = <0>;
+	samsung,dw-mshc-sdr-timing = <2 3>;
+	samsung,dw-mshc-ddr-timing = <1 2>;
+	pinctrl-0 = <&sd4_clk &sd4_cmd &sd4_bus4 &sd4_bus8>;
+	pinctrl-names = "default";
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	mmc-ddr-1_8v;
+	status = "okay";
+};
+
+&pinctrl_0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sleep0>;
+
+	lcd_en: lcd-en-pins {
+		samsung,pins = "gpc0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	lcd_nrst: lcd-nrst-pins {
+		samsung,pins = "gpf0-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	s5m8767_ds: s5m8767-ds-pins {
+		samsung,pins = "gpf3-1", "gpf3-2", "gpf3-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+	};
+
+	sleep0: sleep-state {
+		PIN_SLP(gpa0-0, INPUT, NONE);
+		PIN_SLP(gpa0-1, OUT0, NONE);
+		PIN_SLP(gpa0-2, INPUT, NONE);
+		PIN_SLP(gpa0-3, INPUT, UP);
+		PIN_SLP(gpa0-4, INPUT, DOWN);
+		PIN_SLP(gpa0-5, INPUT, DOWN);
+		PIN_SLP(gpa0-6, INPUT, DOWN);
+		PIN_SLP(gpa0-7, INPUT, DOWN);
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
+		PIN_SLP(gpc0-2, INPUT, NONE);
+		PIN_SLP(gpc0-3, INPUT, NONE);
+		PIN_SLP(gpc0-4, INPUT, NONE);
+
+		PIN_SLP(gpc1-0, INPUT, DOWN);
+		PIN_SLP(gpc1-1, INPUT, DOWN);
+		PIN_SLP(gpc1-2, INPUT, DOWN);
+		PIN_SLP(gpc1-3, INPUT, DOWN);
+		PIN_SLP(gpc1-4, INPUT, DOWN);
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
+		PIN_SLP(gpf0-0, INPUT, DOWN);
+		PIN_SLP(gpf0-1, INPUT, DOWN);
+		PIN_SLP(gpf0-2, INPUT, DOWN);
+		PIN_SLP(gpf0-3, INPUT, DOWN);
+		PIN_SLP(gpf0-4, OUT0, NONE);
+		PIN_SLP(gpf0-5, OUT0, NONE);
+		PIN_SLP(gpf0-6, INPUT, DOWN);
+		PIN_SLP(gpf0-7, INPUT, DOWN);
+
+		PIN_SLP(gpf1-0, INPUT, DOWN);
+		PIN_SLP(gpf1-1, INPUT, DOWN);
+		PIN_SLP(gpf1-2, INPUT, DOWN);
+		PIN_SLP(gpf1-3, INPUT, DOWN);
+		PIN_SLP(gpf1-4, INPUT, DOWN);
+		PIN_SLP(gpf1-5, INPUT, DOWN);
+		PIN_SLP(gpf1-6, INPUT, DOWN);
+		PIN_SLP(gpf1-7, INPUT, DOWN);
+
+		PIN_SLP(gpf2-0, INPUT, DOWN);
+		PIN_SLP(gpf2-1, INPUT, DOWN);
+		PIN_SLP(gpf2-2, INPUT, DOWN);
+		PIN_SLP(gpf2-3, INPUT, DOWN);
+		PIN_SLP(gpf2-4, INPUT, DOWN);
+		PIN_SLP(gpf2-5, INPUT, DOWN);
+		PIN_SLP(gpf2-6, INPUT, DOWN);
+		PIN_SLP(gpf2-7, INPUT, DOWN);
+
+		PIN_SLP(gpf3-0, INPUT, DOWN);
+		PIN_SLP(gpf3-1, INPUT, DOWN);
+		PIN_SLP(gpf3-2, INPUT, DOWN);
+		PIN_SLP(gpf3-3, INPUT, DOWN);
+		PIN_SLP(gpf3-4, PREV, NONE);
+		PIN_SLP(gpf3-5, OUT0, DOWN);
+
+		PIN_SLP(gpj0-0, INPUT, DOWN);
+		PIN_SLP(gpj0-1, INPUT, DOWN);
+		PIN_SLP(gpj0-2, INPUT, DOWN);
+		PIN_SLP(gpj0-3, OUT0, NONE);
+		PIN_SLP(gpj0-4, INPUT, DOWN);
+		PIN_SLP(gpj0-5, INPUT, DOWN);
+		PIN_SLP(gpj0-6, OUT0, NONE);
+		PIN_SLP(gpj0-7, OUT0, NONE);
+
+		PIN_SLP(gpj1-0, OUT0, NONE);
+		PIN_SLP(gpj1-1, INPUT, DOWN);
+		PIN_SLP(gpj1-2, PREV, NONE);
+		PIN_SLP(gpj1-3, INPUT, DOWN);
+		PIN_SLP(gpj1-4, INPUT, DOWN);
+	};
+};
+
+&pinctrl_1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&sleep1>;
+
+	bt_shutdown: bt-shutdown-pins {
+		samsung,pins = "gpl0-6";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	bt_host_wakeup: bt-host-wakeup-pins {
+		samsung,pins = "gpx2-6";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	bt_device_wakeup: bt-device-wakeup-pins {
+		samsung,pins = "gpx3-1";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	backlight_reset: backlight-reset-pins {
+		samsung,pins = "gpm0-1";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	gpio_keys: gpio-keys-pins {
+		samsung,pins = "gpx1-2", "gpx2-2", "gpx2-4", "gpx2-7", "gpx3-3";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
+
+	max77693_irq: max77693-irq-pins {
+		samsung,pins = "gpx1-5";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+	};
+
+	max77693_fuel_irq: max77693-fuel-irq-pins {
+		samsung,pins = "gpx2-3";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+	};
+
+	sdhci2_cd: sdhci2-cd-irq-pins {
+		samsung,pins = "gpx3-4";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+	};
+
+	s5m8767_dvs: s5m8767-dvs-pins {
+		samsung,pins = "gpm3-0", "gpm3-1", "gpm3-2";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+	};
+
+	s5m8767_irq: s5m8767-irq-pins {
+		samsung,pins = "gpx0-7";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
+	};
+
+	sleep1: sleep-state {
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
+		PIN_SLP(gpl0-0, INPUT, DOWN);
+		PIN_SLP(gpl0-1, INPUT, NONE);
+		PIN_SLP(gpl0-2, INPUT, NONE);
+		PIN_SLP(gpl0-3, INPUT, DOWN);
+		PIN_SLP(gpl0-4, INPUT, DOWN);
+		PIN_SLP(gpl0-6, PREV, NONE);
+
+		PIN_SLP(gpl1-0, INPUT, DOWN);
+		PIN_SLP(gpl1-1, OUT0, NONE);
+		PIN_SLP(gpl2-0, INPUT, DOWN);
+		PIN_SLP(gpl2-1, PREV, NONE);
+		PIN_SLP(gpl2-2, PREV, NONE);
+		PIN_SLP(gpl2-3, INPUT, DOWN);
+		PIN_SLP(gpl2-4, INPUT, DOWN);
+		PIN_SLP(gpl2-5, INPUT, DOWN);
+		PIN_SLP(gpl2-6, INPUT, DOWN);
+		PIN_SLP(gpl2-7, INPUT, DOWN);
+
+		PIN_SLP(gpm0-0, PREV, NONE);
+		PIN_SLP(gpm0-1, OUT0, NONE);
+		PIN_SLP(gpm0-2, INPUT, DOWN);
+		PIN_SLP(gpm0-3, INPUT, DOWN);
+		PIN_SLP(gpm0-4, INPUT, DOWN);
+		PIN_SLP(gpm0-5, INPUT, DOWN);
+		PIN_SLP(gpm0-6, INPUT, DOWN);
+		PIN_SLP(gpm0-7, INPUT, DOWN);
+
+		PIN_SLP(gpm1-0, INPUT, DOWN);
+		PIN_SLP(gpm1-1, INPUT, DOWN);
+		PIN_SLP(gpm1-2, INPUT, NONE);
+		PIN_SLP(gpm1-3, INPUT, NONE);
+		PIN_SLP(gpm1-4, INPUT, NONE);
+		PIN_SLP(gpm1-5, INPUT, NONE);
+		PIN_SLP(gpm1-6, OUT0, NONE);
+
+		PIN_SLP(gpm2-0, INPUT, NONE);
+		PIN_SLP(gpm2-1, INPUT, NONE);
+		PIN_SLP(gpm2-2, OUT0, NONE);
+		PIN_SLP(gpm2-3, INPUT, DOWN);
+		PIN_SLP(gpm2-4, INPUT, DOWN);
+
+		PIN_SLP(gpm3-0, PREV, NONE);
+		PIN_SLP(gpm3-1, PREV, NONE);
+		PIN_SLP(gpm3-2, PREV, NONE);
+		PIN_SLP(gpm3-3, INPUT, DOWN);
+		PIN_SLP(gpm3-4, INPUT, DOWN);
+		PIN_SLP(gpm3-5, PREV, NONE);
+		PIN_SLP(gpm3-6, INPUT, DOWN);
+		PIN_SLP(gpm3-7, OUT0, NONE);
+
+		PIN_SLP(gpm4-0, INPUT, DOWN);
+		PIN_SLP(gpm4-1, INPUT, DOWN);
+		PIN_SLP(gpm4-2, INPUT, DOWN);
+		PIN_SLP(gpm4-3, INPUT, DOWN);
+		PIN_SLP(gpm4-4, PREV, NONE);
+		PIN_SLP(gpm4-5, INPUT, NONE);
+		PIN_SLP(gpm4-6, INPUT, DOWN);
+		PIN_SLP(gpm4-7, INPUT, DOWN);
+
+		PIN_SLP(gpy0-0, INPUT, DOWN);
+		PIN_SLP(gpy0-1, INPUT, DOWN);
+		PIN_SLP(gpy0-2, INPUT, NONE);
+		PIN_SLP(gpy0-3, INPUT, NONE);
+		PIN_SLP(gpy0-4, INPUT, DOWN);
+		PIN_SLP(gpy0-5, INPUT, DOWN);
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
+	sleep2: sleep-state {
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
+	sleep3: sleep-state {
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
+	assigned-clock-parents = <&clock CLK_XUSBXTI>;
+};
+
+&pwm {
+	pinctrl-0 = <&pwm1_out>;
+	pinctrl-names = "default";
+	samsung,pwm-outputs = <1>;
+	status = "okay";
+};
+
+&sdhci_2 {
+	bus-width = <4>;
+	cd-gpios = <&gpx3 4 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_bus4 &sdhci2_cd>;
+	pinctrl-names = "default";
+	vmmc-supply = <&ldo23_reg>;
+	status = "okay";
+};
+
+&sdhci_3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	non-removable;
+	bus-width = <4>;
+
+	mmc-pwrseq = <&wlan_pwrseq>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sd3_clk &sd3_cmd &sd3_bus4>;
+	status = "okay";
+
+	brcmf: wifi@1 {
+		compatible = "brcm,bcm4334-fmac", "brcm,bcm4329-fmac";
+		reg = <1>;
+
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
+		compatible = "brcm,bcm4330-bt"; /* BCM4334B0 */
+		pinctrl-0 = <&bt_shutdown &bt_device_wakeup &bt_host_wakeup>;
+		pinctrl-names = "default";
+		max-speed = <3000000>;
+		shutdown-gpios = <&gpl0 6 GPIO_ACTIVE_HIGH>;
+		device-wakeup-gpios = <&gpx3 1 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpx2 6 GPIO_ACTIVE_HIGH>;
+		clocks = <&s5m8767_osc S2MPS11_CLK_BT>;
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
+	vtmu-supply = <&ldo10_reg>;
+	status = "okay";
+};

base-commit: a3119e95a0d193a0c13168ba48bd081ce11060ff
-- 
2.41.0

