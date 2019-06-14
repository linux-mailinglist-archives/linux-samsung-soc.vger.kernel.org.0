Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 535A246397
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 14 Jun 2019 18:03:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbfFNQDO (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 14 Jun 2019 12:03:14 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:53823 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbfFNQDO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 14 Jun 2019 12:03:14 -0400
Received: from collins (196.109.29.93.rev.sfr.net [93.29.109.196])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 8AB6D20000C;
        Fri, 14 Jun 2019 16:03:12 +0000 (UTC)
Message-ID: <8e9ed72e3bfae4118f8577ad9fbe137770a12326.camel@bootlin.com>
Subject: Re: [PATCH] ARM: dts: exynos: add flash support to galaxy-s3 boards
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Simon Shields <simon@lineageos.org>
Date:   Fri, 14 Jun 2019 18:03:12 +0200
In-Reply-To: <20190614155419.14260-1-GNUtoo@cyberdimension.org>
References: <20190614155419.14260-1-GNUtoo@cyberdimension.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Le vendredi 14 juin 2019 à 17:54 +0200, Denis 'GNUtoo' Carikli a
écrit :
> From: Simon Shields <simon@lineageos.org>
> 
> The galaxy s3 boards use an aat1290 to control the flash LED.
> This patch adds the relevant device tree configuration to use it.

Looks good to me:
Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> Signed-off-by: Simon Shields <simon@lineageos.org>
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org> [rebase]
> ---
>  arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 32 +++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> index 30eee5942eff..375aeca09882 100644
> --- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> +++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
> @@ -15,6 +15,24 @@
>  		i2c10 = &i2c_cm36651;
>  	};
>  
> +	aat1290 {
> +		compatible = "skyworks,aat1290";
> +		flen-gpios = <&gpj1 1 GPIO_ACTIVE_HIGH>;
> +		enset-gpios = <&gpj1 2 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-names = "default", "host", "isp";
> +		pinctrl-0 = <&camera_flash_host>;
> +		pinctrl-1 = <&camera_flash_host>;
> +		pinctrl-2 = <&camera_flash_isp>;
> +
> +		flash-led {
> +			label = "flash";
> +			led-max-microamp = <520833>;
> +			flash-max-microamp = <1012500>;
> +			flash-max-timeout-us = <1940000>;
> +		};
> +	};
> +
>  	lcd_vdd3_reg: voltage-regulator-6 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "LCD_VDD_2.2V";
> @@ -131,6 +149,20 @@
>  	regulator-max-microvolt = <2800000>;
>  };
>  
> +&pinctrl_0 {
> +	camera_flash_host: camera-flash-host {
> +		samsung,pins = "gpj1-0";
> +		samsung,pin-function = <1>;
> +		samsung,pin-val = <0>;
> +	};
> +
> +	camera_flash_isp: camera-flash-isp {
> +		samsung,pins = "gpj1-0";
> +		samsung,pin-function = <1>;
> +		samsung,pin-val = <1>;
> +	};
> +};
> +
>  &s5c73m3 {
>  	standby-gpios = <&gpm0 1 GPIO_ACTIVE_LOW>;   /* ISP_STANDBY */
>  	vdda-supply = <&ldo17_reg>;

