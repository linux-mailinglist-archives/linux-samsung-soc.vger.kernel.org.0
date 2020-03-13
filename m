Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 263D7184966
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 13 Mar 2020 15:33:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgCMOdn (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 13 Mar 2020 10:33:43 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:33030 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbgCMOdn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 13 Mar 2020 10:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1584110020; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wSuvYRs2+kOMRbKVk2MsXJmEnZAEsDSj7YJQdXCqPZs=;
        b=fnypYpamxOOB89qg+eCvr7e75TOyNH8acica++zrm6NppStlFNseotqOLofhdyaJmOagQg
        hCnkct/RcXmi7syCZBSzBFDWZ8N36gRbi2rUpT6Fmr+BVLw9IuL2uUqcJkfzKIgPvww0lV
        XlJm62VLkdtBOngtE+pFkvsLKBItXqI=
Date:   Fri, 13 Mar 2020 15:33:34 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 2/2] ARM: DTS: Add devicetree file for the Galaxy S2
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Stenkin Evgeniy <stenkinevgeniy@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Message-Id: <1584110014.3.1@crapouillou.net>
In-Reply-To: <20200313090011.GB7416@pi3>
References: <20200312153411.13535-1-paul@crapouillou.net>
        <20200312153411.13535-2-paul@crapouillou.net> <20200313090011.GB7416@pi3>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,


Le ven., mars 13, 2020 at 10:00, Krzysztof Kozlowski <krzk@kernel.org>=20
a =E9crit :
> On Thu, Mar 12, 2020 at 04:34:11PM +0100, Paul Cercueil wrote:
>>  From: Stenkin Evgeniy <stenkinevgeniy@gmail.com>
>>=20
>>  Add devicetree file for the Exynos 4210 based Galaxy S2 (i9100=20
>> version).
>=20
> Thanks for the patch!
>=20
> It is an GT-I9100.
>=20
> +Cc Marek (I have few questions further)
>=20
>=20
>>=20
>>  Signed-off-by: Stenkin Evgeniy <stenkinevgeniy@gmail.com>
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>   arch/arm/boot/dts/Makefile             |   1 +
>>   arch/arm/boot/dts/exynos4210-i9100.dts | 816=20
>> +++++++++++++++++++++++++
>>   2 files changed, 817 insertions(+)
>>   create mode 100644 arch/arm/boot/dts/exynos4210-i9100.dts
>>=20
>>  diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
>>  index d6546d2676b9..522436d30690 100644
>>  --- a/arch/arm/boot/dts/Makefile
>>  +++ b/arch/arm/boot/dts/Makefile
>>  @@ -181,6 +181,7 @@ dtb-$(CONFIG_ARCH_EXYNOS3) +=3D \
>>   	exynos3250-monk.dtb \
>>   	exynos3250-rinato.dtb
>>   dtb-$(CONFIG_ARCH_EXYNOS4) +=3D \
>>  +	exynos4210-i9100.dtb \
>>   	exynos4210-origen.dtb \
>>   	exynos4210-smdkv310.dtb \
>>   	exynos4210-trats.dtb \
>>  diff --git a/arch/arm/boot/dts/exynos4210-i9100.dts=20
>> b/arch/arm/boot/dts/exynos4210-i9100.dts
>>  new file mode 100644
>>  index 000000000000..c218e34959be
>>  --- /dev/null
>>  +++ b/arch/arm/boot/dts/exynos4210-i9100.dts
>>  @@ -0,0 +1,816 @@
>>  +// SPDX-License-Identifier: GPL-2.0
>>  +/*
>>  + * Samsung's Exynos4210 based Galaxy S2 (i9100 version) device tree
>=20
> Ditto
>=20
>>  + *
>>  + * Copyright (c) 2012 Samsung Electronics Co., Ltd.
>>  + *		http://www.samsung.com
>>  + * Copyright (c) 2020 Stenkin Evgeniy <stenkinevgeniy@gmail.com>
>>  + * Copyright (c) 2020 Paul Cercueil <paul@crapouillou.net>
>>  + *
>>  + * Device tree source file for Samsung's Galaxy S2 smartphone=20
>> (i9100 version),
>>  + * which is based on Samsung's Exynos4210 SoC.
>=20
> Duplicated description, you mentioned it before.
>=20
>>  + */
>>  +
>>  +/dts-v1/;
>>  +#include "exynos4210.dtsi"
>>  +#include "exynos4412-ppmu-common.dtsi"
>>  +
>>  +#include <dt-bindings/gpio/gpio.h>
>>  +#include <dt-bindings/input/linux-event-codes.h>
>>  +
>>  +/ {
>>  +	model =3D "Samsung Galaxy S2 (i9100)";
>=20
> GT-I9100
>=20
>>  +	compatible =3D "samsung,i9100", "samsung,exynos4210",=20
>> "samsung,exynos4";
>=20
> I think it shares a lot with Trats board...
>=20
> Marek, how similar these
> designs are? Maybe it is worth to split some parts and make common=20
> part?

I can try to do it, but it'll be only by comparing the devicetree files.

>>  +
>>  +
>>  +	memory@40000000 {
>>  +		device_type =3D "memory";
>>  +		reg =3D <0x40000000 0x40000000>;
>>  +	};
>>  +
>=20
> You do not have a chosen node, at least for stdout serial selection.
> Probably you should have one... bootargs I guess could come from
> bootloader.

Problem is, I have no idea which UART is available via the USB jig :)

>>  +	vemmc_reg: regulator-0 {
>>  +		compatible =3D "regulator-fixed";
>>  +		regulator-name =3D "VMEM_VDD_2.8V";
>>  +		regulator-min-microvolt =3D <2800000>;
>>  +		regulator-max-microvolt =3D <2800000>;
>>  +		gpio =3D <&gpk0 2 GPIO_ACTIVE_HIGH>;
>>  +		enable-active-high;
>=20
> This looks like a stub/fake regulator. Probably it shoould be replaced
> with proper regulator coming from PMIC (few seems to be missing=20
> there).
>=20
> I don't have the schematics so I cannot judge... I see Trats has the
> same.
>=20
> Marek, mayybe you know, is it really a separate regulator?
>=20
>>  +	};
>>  +
>>  +	tsp_reg: regulator-1 {
>>  +		compatible =3D "regulator-fixed";
>>  +		regulator-name =3D "TSP_FIXED_VOLTAGES";
>>  +		regulator-min-microvolt =3D <3300000>;
>>  +		regulator-max-microvolt =3D <3300000>;
>>  +		gpio =3D <&gpl0 3 GPIO_ACTIVE_HIGH>;
>>  +		startup-delay-us =3D <70000>;
>>  +		enable-active-high;
>>  +		regulator-boot-on;
>>  +		regulator-always-on;
>=20
> always-on and boot-on should not be needed. You have a consumer for=20
> this
> regulator.
>=20
>>  +	};
>>  +
>>  +	cam_af_28v_reg: regulator-3 {
>>  +		compatible =3D "regulator-fixed";
>>  +		regulator-name =3D "8M_AF_2.8V_EN";
>>  +		regulator-min-microvolt =3D <2800000>;
>>  +		regulator-max-microvolt =3D <2800000>;
>>  +		gpio =3D <&gpk1 1 GPIO_ACTIVE_HIGH>;
>>  +		enable-active-high;
>>  +	};
>>  +
>>  +	cam_io_en_reg: regulator-4 {
>>  +		compatible =3D "regulator-fixed";
>>  +		regulator-name =3D "CAM_IO_EN";
>>  +		regulator-min-microvolt =3D <2800000>;
>>  +		regulator-max-microvolt =3D <2800000>;
>>  +		gpio =3D <&gpe2 1 GPIO_ACTIVE_HIGH>;
>>  +		enable-active-high;
>>  +	};
>>  +
>>  +	cam_io_12v_reg: regulator-5 {
>>  +		compatible =3D "regulator-fixed";
>>  +		regulator-name =3D "8M_1.2V_EN";
>>  +		regulator-min-microvolt =3D <1200000>;
>>  +		regulator-max-microvolt =3D <1200000>;
>>  +		gpio =3D <&gpe2 5 GPIO_ACTIVE_HIGH>;
>>  +		enable-active-high;
>>  +	};
>>  +
>>  +	vt_core_15v_reg: regulator-6 {
>>  +		compatible =3D "regulator-fixed";
>>  +		regulator-name =3D "VT_CORE_1.5V";
>>  +		regulator-min-microvolt =3D <1500000>;
>>  +		regulator-max-microvolt =3D <1500000>;
>>  +		gpio =3D <&gpe2 2 GPIO_ACTIVE_HIGH>;
>>  +		enable-active-high;
>>  +	};
>>  +
>>  +	gpio-keys {
>>  +		compatible =3D "gpio-keys";
>>  +
>>  +		vol-down {
>>  +			gpios =3D <&gpx2 1 GPIO_ACTIVE_LOW>;
>>  +			linux,code =3D <KEY_VOLUMEDOWN>;
>>  +			label =3D "volume down";
>>  +			debounce-interval =3D <10>;
>>  +		};
>>  +
>>  +		vol-up {
>>  +			gpios =3D <&gpx2 0 GPIO_ACTIVE_LOW>;
>>  +			linux,code =3D <KEY_VOLUMEUP>;
>>  +			label =3D "volume up";
>>  +			debounce-interval =3D <10>;
>>  +		};
>>  +
>>  +		power {
>>  +			gpios =3D <&gpx2 7 GPIO_ACTIVE_LOW>;
>>  +			linux,code =3D <KEY_POWER>;
>>  +			label =3D "power";
>>  +			debounce-interval =3D <10>;
>>  +			wakeup-source;
>>  +		};
>>  +
>>  +		ok {
>>  +			gpios =3D <&gpx3 5 GPIO_ACTIVE_LOW>;
>>  +			linux,code =3D <KEY_OK>;
>>  +			label =3D "ok";
>>  +			debounce-interval =3D <10>;
>>  +		};
>>  +	};
>>  +
>>  +	wlan_pwrseq: sdhci3-pwrseq {
>>  +		compatible =3D "mmc-pwrseq-simple";
>>  +		reset-gpios =3D <&gpl1 2 GPIO_ACTIVE_LOW>;
>>  +	};
>>  +
>>  +	i2c_max17042_fuel: i2c-gpio-3 {
>=20
> i2c-gpio-3 -> i2c-gpio
>=20
>>  +		compatible =3D "i2c-gpio";
>>  +		#address-cells =3D <1>;
>>  +		#size-cells =3D <0>;
>>  +
>>  +		sda-gpios =3D <&gpy4 0 GPIO_ACTIVE_HIGH>;
>>  +		scl-gpios =3D <&gpy4 1 GPIO_ACTIVE_HIGH>;
>>  +		i2c-gpio,delay-us =3D <5>;
>>  +
>>  +		battery@36 {
>>  +			compatible =3D "maxim,max17042";
>>  +
>>  +			interrupt-parent =3D <&gpx2>;
>>  +			interrupts =3D <3 2>;
>=20
> s/2/IRQ_TYPE_EDGE_FALLING/
>=20
>>  +
>>  +			pinctrl-0 =3D <&max17042_fuel_irq>;
>>  +			pinctrl-names =3D "default";
>>  +
>>  +			reg =3D <0x36>;
>>  +			maxim,over-heat-temp =3D <700>;
>>  +			maxim,over-volt =3D <4500>;
>>  +
>=20
> Remove empty line.
>=20
>>  +		};
>>  +	};
>>  +
>>  +	spi-lcd {
>>  +		compatible =3D "spi-gpio";
>>  +		#address-cells =3D <1>;
>>  +		#size-cells =3D <0>;
>>  +
>>  +		num-chipselects =3D <1>;
>>  +		cs-gpios =3D <&gpy4 3 GPIO_ACTIVE_HIGH>;
>>  +		sck-gpios =3D <&gpy3 1 GPIO_ACTIVE_HIGH>;
>>  +		mosi-gpios =3D <&gpy3 3 GPIO_ACTIVE_HIGH>;
>>  +
>>  +		lcd@0 {
>>  +			compatible =3D "samsung,ld9040";
>>  +			reg =3D <0>;
>>  +
>>  +			spi-max-frequency =3D <1200000>;
>>  +			spi-cpol;
>>  +			spi-cpha;
>>  +
>>  +			vdd3-supply =3D <&vmipi_reg>;
>>  +			vci-supply =3D <&vcclcd_reg>;
>>  +
>>  +			reset-gpios =3D <&gpy4 5 GPIO_ACTIVE_HIGH>;
>>  +			power-on-delay =3D <10>;
>>  +			reset-delay =3D <10>;
>>  +
>>  +			panel-width-mm =3D <90>;
>>  +			panel-height-mm =3D <154>;
>>  +
>>  +			display-timings {
>>  +				timing {
>>  +					clock-frequency =3D <23492370>;
>>  +					hactive =3D <480>;
>>  +					vactive =3D <800>;
>>  +					hback-porch =3D <16>;
>>  +					hfront-porch =3D <16>;
>>  +					vback-porch =3D <2>;
>>  +					vfront-porch =3D <28>;
>>  +					hsync-len =3D <2>;
>>  +					vsync-len =3D <1>;
>>  +					hsync-active =3D <0>;
>>  +					vsync-active =3D <0>;
>>  +					de-active =3D <0>;
>>  +					pixelclk-active =3D <0>;
>>  +				};
>>  +			};
>>  +
>>  +			port {
>>  +				lcd_ep: endpoint {
>>  +					remote-endpoint =3D <&fimd_dpi_ep>;
>>  +				};
>>  +			};
>>  +		};
>>  +	};
>>  +
>>  +	fixed-rate-clocks {
>>  +		xxti {
>>  +			compatible =3D "samsung,clock-xxti";
>>  +			clock-frequency =3D <0>;
>>  +		};
>>  +
>>  +		xusbxti {
>>  +			compatible =3D "samsung,clock-xusbxti";
>>  +			clock-frequency =3D <24000000>;
>>  +		};
>>  +	};
>>  +
>>  +	thermal-zones {
>>  +		cpu_thermal: cpu-thermal {
>>  +			cooling-maps {
>>  +				map0 {
>>  +					/* Corresponds to 800MHz */
>>  +					cooling-device =3D <&cpu0 2 2>;
>>  +				};
>>  +				map1 {
>>  +					/* Corresponds to 200MHz */
>>  +					cooling-device =3D <&cpu0 4 4>;
>>  +				};
>>  +			};
>>  +		};
>>  +	};
>>  +
>>  +};
>>  +
>>  +&camera {
>>  +	status =3D "okay";
>>  +};
>>  +
>>  +&cpu0 {
>>  +	cpu0-supply =3D <&varm_breg>;
>>  +};
>>  +
>>  +&exynos_usbphy {
>>  +	status =3D "okay";
>>  +
>>  +	vbus-supply =3D <&safe1_sreg>;
>>  +};
>>  +
>>  +&fimc_0 {
>>  +	status =3D "okay";
>>  +
>>  +	assigned-clocks =3D <&clock CLK_MOUT_FIMC0>, <&clock=20
>> CLK_SCLK_FIMC0>;
>>  +	assigned-clock-parents =3D <&clock CLK_SCLK_MPLL>;
>>  +	assigned-clock-rates =3D <0>, <160000000>;
>>  +};
>>  +
>>  +&fimc_1 {
>>  +	status =3D "okay";
>>  +
>>  +	assigned-clocks =3D <&clock CLK_MOUT_FIMC1>, <&clock=20
>> CLK_SCLK_FIMC1>;
>>  +	assigned-clock-parents =3D <&clock CLK_SCLK_MPLL>;
>>  +	assigned-clock-rates =3D <0>, <160000000>;
>>  +};
>>  +
>>  +&fimc_2 {
>>  +	status =3D "okay";
>>  +
>>  +	assigned-clocks =3D <&clock CLK_MOUT_FIMC2>, <&clock=20
>> CLK_SCLK_FIMC2>;
>>  +	assigned-clock-parents =3D <&clock CLK_SCLK_MPLL>;
>>  +	assigned-clock-rates =3D <0>, <160000000>;
>>  +};
>>  +
>>  +&fimc_3 {
>>  +	status =3D "okay";
>>  +
>>  +	assigned-clocks =3D <&clock CLK_MOUT_FIMC3>, <&clock=20
>> CLK_SCLK_FIMC3>;
>>  +	assigned-clock-parents =3D <&clock CLK_SCLK_MPLL>;
>>  +	assigned-clock-rates =3D <0>, <160000000>;
>>  +};
>>  +
>>  +&fimd {
>>  +	status =3D "okay";
>>  +	#address-cells =3D <1>;
>>  +	#size-cells =3D <0>;
>>  +
>>  +	samsung,invert-vden;
>>  +	samsung,invert-vclk;
>>  +
>>  +	pinctrl-0 =3D <&lcd_clk>, <&lcd_data24>;
>>  +	pinctrl-names =3D "default";
>>  +
>>  +	port@3 {
>>  +		reg =3D <3>;
>>  +
>>  +		fimd_dpi_ep: endpoint {
>>  +			remote-endpoint =3D <&lcd_ep>;
>>  +		};
>>  +	};
>>  +};
>>  +
>>  +&hsotg {
>>  +	status =3D "okay";
>>  +
>>  +	dr_mode =3D "otg";
>>  +	vusb_d-supply =3D <&vusb_reg>;
>>  +	vusb_a-supply =3D <&vusbdac_reg>;
>>  +};
>>  +
>>  +&ehci {
>=20
> Order the phandle/nodes in alphabetical order, please. So:
>=20
> &ehci ...
> &hsoth ...
> &i2c ...
>=20
> etc.
>=20
>>  +	status =3D "okay";
>>  +
>>  +	port@0 {
>>  +		status =3D "okay";
>>  +	};
>>  +
>>  +	port@1 {
>>  +		status =3D "okay";
>>  +	};
>>  +
>>  +	port@2 {
>>  +		status =3D "okay";
>>  +	};
>>  +};
>>  +
>=20
> Double empty line.
>=20
>>  +
>>  +&i2c_3 {
>>  +	status =3D "okay";
>>  +
>>  +	samsung,i2c-sda-delay =3D <100>;
>>  +	samsung,i2c-slave-addr =3D <0x10>;
>>  +	samsung,i2c-max-bus-freq =3D <100000>;
>>  +
>>  +	pinctrl-0 =3D <&i2c3_bus>;
>>  +	pinctrl-names =3D "default";
>>  +
>>  +	mxt224-touchscreen@4a {
>>  +		compatible =3D "atmel,maxtouch";
>>  +		reg =3D <0x4a>;
>>  +
>>  +		interrupt-parent =3D <&gpx0>;
>>  +		interrupts =3D <4 IRQ_TYPE_EDGE_FALLING>;
>>  +
>>  +		avdd-supply =3D <&tsp_reg>;
>>  +		vdd-supply =3D <&tsp_reg>;
>>  +	};
>>  +};
>>  +
>>  +&i2c_7 {
>>  +	status =3D "okay";
>>  +
>>  +	samsung,i2c-sda-delay =3D <100>;
>>  +	samsung,i2c-slave-addr =3D <0x10>;
>>  +	samsung,i2c-max-bus-freq =3D <400000>;
>>  +
>>  +	pinctrl-0 =3D <&i2c7_bus>;
>>  +	pinctrl-names =3D "default";
>>  +
>>  +	ak8975@c {
>>  +		compatible =3D "asahi-kasei,ak8975";
>>  +		reg =3D <0x0c>;
>>  +
>>  +		gpios =3D <&gpx2 2 GPIO_ACTIVE_HIGH>;
>>  +	};
>>  +};
>>  +
>>  +
>>  +&i2c_5 {
>>  +	status =3D "okay";
>>  +
>>  +	samsung,i2c-sda-delay =3D <100>;
>>  +	samsung,i2c-slave-addr =3D <0x10>;
>>  +	samsung,i2c-max-bus-freq =3D <100000>;
>>  +
>>  +	pinctrl-0 =3D <&i2c5_bus>;
>>  +	pinctrl-names =3D "default";
>>  +
>>  +	max8997_pmic@66 {
>>  +		compatible =3D "maxim,max8997-pmic";
>>  +		reg =3D <0x66>;
>>  +
>>  +		interrupts-extended =3D <&gpx0 7 0>, <&gpx2 3 2>;
>>  +		interrupt-parent =3D <&gpx0>;
>>  +		interrupts =3D <7 IRQ_TYPE_NONE>;
>>  +
>>  +		otg_en-gpios =3D <&gpx3 3 0>;
>>  +		usb_sel-gpios =3D <&gpl0 6 0>;
>>  +
>>  +		max8997,pmic-buck1-uses-gpio-dvs;
>>  +		max8997,pmic-buck2-uses-gpio-dvs;
>>  +		max8997,pmic-buck5-uses-gpio-dvs;
>>  +
>>  +		max8997,pmic-ignore-gpiodvs-side-effect;
>>  +		max8997,pmic-buck125-default-dvs-idx =3D <0>;
>>  +
>>  +		max8997,pmic-buck125-dvs-gpios =3D <&gpx0 5 GPIO_ACTIVE_HIGH>,
>>  +						 <&gpx0 6 GPIO_ACTIVE_HIGH>,
>>  +						 <&gpl0 0 GPIO_ACTIVE_HIGH>;
>>  +
>>  +		max8997,pmic-buck1-dvs-voltage =3D <1350000>, <1300000>,
>>  +						 <1250000>, <1200000>,
>>  +						 <1150000>, <1100000>,
>>  +						 <1000000>, <950000>;
>>  +
>>  +		max8997,pmic-buck2-dvs-voltage =3D <1100000>, <1000000>,
>>  +						 <950000>,  <900000>,
>>  +						 <1100000>, <1000000>,
>>  +						 <950000>,  <900000>;
>>  +
>>  +		max8997,pmic-buck5-dvs-voltage =3D <1200000>, <1200000>,
>>  +						 <1200000>, <1200000>,
>>  +						 <1200000>, <1200000>,
>>  +						 <1200000>, <1200000>;
>>  +
>>  +		pinctrl-0 =3D <&max8997_irq>, <&otg_gp>, <&usb_sel>;
>>  +		pinctrl-names =3D "default";
>>  +
>>  +		regulators {
>>  +			vadc_reg: LDO1 {
>>  +				regulator-name =3D "VADC_3.3V_C210";
>>  +				regulator-min-microvolt =3D <3300000>;
>>  +				regulator-max-microvolt =3D <3300000>;
>>  +				regulator-always-on;
>>  +
>>  +			};
>=20
> Add empty line.
>=20
>>  +			valive_reg: LDO2 {
>>  +				regulator-name =3D "VALIVE_1.1V_C210";
>>  +				regulator-min-microvolt =3D <1100000>;
>>  +				regulator-max-microvolt =3D <1100000>;
>>  +				regulator-always-on;
>>  +
>>  +			};
>>  +
>>  +			vusb_reg: LDO3 {
>>  +				regulator-name =3D "VUSB_1.1V_C210";
>>  +				regulator-min-microvolt =3D <1100000>;
>>  +				regulator-max-microvolt =3D <1100000>;
>>  +			};
>>  +
>>  +			vmipi_reg: LDO4 {
>>  +				regulator-name =3D "VMIPI_1.8V";
>>  +				regulator-min-microvolt =3D <1800000>;
>>  +				regulator-max-microvolt =3D <1800000>;
>>  +				regulator-always-on;
>>  +			};
>>  +
>>  +			vhsic_reg: LDO5 {
>>  +				regulator-name =3D "VHSIC_1.2V";
>>  +				regulator-min-microvolt =3D <1200000>;
>>  +				regulator-max-microvolt =3D <1200000>;
>>  +				regulator-always-on;
>>  +			};
>>  +
>>  +			vpda_reg: LDO6 {
>>  +				regulator-name =3D "VCC_1.8V_PDA";
>>  +				regulator-min-microvolt =3D <1800000>;
>>  +				regulator-max-microvolt =3D <1800000>;
>>  +				regulator-always-on;
>>  +			};
>>  +
>>  +			vcam_reg: LDO7 {
>>  +				regulator-name =3D "CAM_ISP_1.8V";
>>  +				regulator-min-microvolt =3D <1800000>;
>>  +				regulator-max-microvolt =3D <1800000>;
>>  +			};
>>  +
>>  +			vusbdac_reg: LDO8 {
>>  +				regulator-name =3D "VUSB+VDAC_3.3V_C210";
>>  +				regulator-min-microvolt =3D <3300000>;
>>  +				regulator-max-microvolt =3D <3300000>;
>>  +			};
>>  +
>>  +			vccpda_reg: LDO9 {
>>  +				regulator-name =3D "VCC_2.8V_PDA";
>>  +				regulator-min-microvolt =3D <2800000>;
>>  +				regulator-max-microvolt =3D <2800000>;
>>  +				regulator-always-on;
>>  +			};
>>  +
>>  +			vtouch_reg: LDO11 {
>>  +				regulator-name =3D "TOUCH_2.8V";
>>  +				regulator-min-microvolt =3D <2800000>;
>>  +				regulator-max-microvolt =3D <2800000>;
>>  +				regulator-always-on;
>>  +			};
>>  +
>>  +			vpll_reg: LDO10 {
>>  +				regulator-name =3D "VPLL_1.1V";
>>  +				regulator-min-microvolt =3D <1100000>;
>>  +				regulator-max-microvolt =3D <1100000>;
>>  +				regulator-always-on;
>>  +			};
>>  +
>>  +			vtcam_reg: LDO12 {
>>  +				regulator-name =3D "VT_CAM_1.8V";
>>  +				regulator-min-microvolt =3D <1800000>;
>>  +				regulator-max-microvolt =3D <1800000>;
>>  +			};
>>  +
>>  +			vcclcd_reg: LDO13 {
>>  +				regulator-name =3D "VCC_3.0V_LCD";
>>  +				regulator-min-microvolt =3D <3000000>;
>>  +				regulator-max-microvolt =3D <3000000>;
>>  +			};
>>  +
>>  +			vmotor_reg: LDO14 {
>>  +				regulator-name =3D "VCC_2.8V_MOTOR";
>>  +				regulator-min-microvolt =3D <2800000>;
>>  +				regulator-max-microvolt =3D <2800000>;
>>  +			};
>>  +
>>  +			vled_reg: LDO15 {
>>  +				regulator-name =3D "LED_A_2.8V";
>>  +				regulator-min-microvolt =3D <2800000>;
>>  +				regulator-max-microvolt =3D <2800000>;
>>  +			};
>>  +
>>  +			camsensor_reg: LDO16 {
>>  +				regulator-name =3D "CAM_SENSOR_IO_1.8V";
>>  +				regulator-min-microvolt =3D <1800000>;
>>  +				regulator-max-microvolt =3D <1800000>;
>>  +			};
>>  +
>>  +			vtf_reg: LDO17 {
>>  +				regulator-name =3D "VTF_2.8V";
>>  +				regulator-min-microvolt =3D <2800000>;
>>  +				regulator-max-microvolt =3D <2800000>;
>>  +			};
>>  +
>>  +			vtouchled_reg: LDO18 {
>>  +				regulator-name =3D "TOUCH_LED_3.3V";
>>  +				regulator-min-microvolt =3D <2500000>;
>>  +				regulator-max-microvolt =3D <3300000>;
>>  +			};
>>  +
>>  +			vddq_reg: LDO21 {
>>  +				regulator-name =3D "VDDQ_M1M2_1.2V";
>>  +				regulator-min-microvolt =3D <1200000>;
>>  +				regulator-max-microvolt =3D <1200000>;
>>  +				regulator-always-on;
>>  +			};
>>  +
>>  +			varm_breg: BUCK1 {
>>  +				//regulator-name =3D "VARM_1.2V_C210";
>>  +				regulator-name =3D "vdd_arm";
>>  +				regulator-min-microvolt =3D <65000>;
>>  +				regulator-max-microvolt =3D <2225000>;
>>  +				regulator-always-on;
>>  +			};
>>  +
>>  +			vint_breg: BUCK2 {
>>  +				regulator-name =3D "VINT_1.1V_C210";
>>  +				regulator-min-microvolt =3D <65000>;
>>  +				regulator-max-microvolt =3D <2225000>;
>>  +				regulator-always-on;
>>  +			};
>>  +
>>  +			vg3d_breg: BUCK3 {
>>  +				regulator-name =3D "G3D_1.1V";
>>  +				regulator-min-microvolt =3D <900000>;
>>  +				regulator-max-microvolt =3D <1200000>;
>>  +				regulator-always-on;
>>  +			};
>>  +
>>  +			camisp_breg: BUCK4 {
>>  +				regulator-name =3D "CAM_ISP_CORE_1.2V";
>>  +				regulator-min-microvolt =3D <1200000>;
>>  +				regulator-max-microvolt =3D <1200000>;
>>  +			};
>>  +
>>  +			vmem_breg: BUCK5 {
>>  +				regulator-name =3D "VMEM_1.2V";
>>  +				regulator-min-microvolt =3D <1200000>;
>>  +				regulator-max-microvolt =3D <1200000>;
>>  +				regulator-always-on;
>>  +			};
>>  +
>>  +			vccsub_breg: BUCK7 {
>>  +				regulator-name =3D "VCC_SUB_2.0V";
>>  +				regulator-min-microvolt =3D <2000000>;
>>  +				regulator-max-microvolt =3D <2000000>;
>>  +				regulator-always-on;
>>  +			};
>>  +
>>  +			safe1_sreg: ESAFEOUT1 {
>>  +				regulator-name =3D "SAFEOUT1";
>>  +			};
>>  +
>>  +			safe2_sreg: ESAFEOUT2 {
>>  +				regulator-name =3D "SAFEOUT2";
>>  +				regulator-boot-on;
>>  +			};
>>  +
>>  +			charger_reg: CHARGER {
>>  +				regulator-name =3D "CHARGER";
>>  +				regulator-min-microamp =3D <60000>;
>>  +				regulator-max-microamp =3D <2580000>;
>>  +				regulator-always-on;
>>  +			};
>>  +
>>  +			chargercv_reg: CHARGER_CV {
>>  +				regulator-name =3D "CHARGER_CV";
>>  +				regulator-min-microvolt =3D <3800000>;
>>  +				regulator-max-microvolt =3D <4100000>;
>>  +				regulator-always-on;
>>  +			};
>>  +
>=20
> Empty line, not needed.
>=20
>>  +		};
>>  +
>=20
> Empty line, not needed.
>=20
>>  +	};
>>  +};
>>  +
>>  +
>=20
> Empty line, not needed. Please fix them in all places.
>=20
>>  +&gpu {
>>  +	status =3D "okay";
>>  +
>>  +	mali-supply =3D <&vg3d_breg>;
>>  +	regulator-microvolt-offset =3D <50000>;
>>  +	regulator-microsecs-delay =3D <50>;
>>  +};
>>  +
>=20
> and more...
>=20
>>  +
>>  +&sdhci_0 {
>>  +	status =3D "okay";
>>  +
>>  +	bus-width =3D <8>;
>>  +	non-removable;
>>  +	vmmc-supply =3D <&vemmc_reg>;
>>  +
>>  +	pinctrl-0 =3D <&sd0_clk>, <&sd0_cmd>, <&sd0_bus8>;
>>  +	pinctrl-names =3D "default";
>>  +};
>>  +
>>  +&sdhci_2 {
>>  +	status =3D "okay";
>>  +
>>  +	bus-width =3D <4>;
>>  +	cd-gpios =3D <&gpx3 4 GPIO_ACTIVE_LOW>;
>>  +	vmmc-supply =3D <&vtf_reg>;
>>  +
>>  +	pinctrl-0 =3D <&sd2_clk>, <&sd2_cmd>, <&sd2_bus4>;
>>  +	pinctrl-names =3D "default";
>>  +};
>>  +
>>  +&ehci {
>=20
> Duplicated.
>=20
> Best regards,
> Krzysztof

For all other comments: ACK, will fix this mess in V2.

Cheers,
-Paul


=

