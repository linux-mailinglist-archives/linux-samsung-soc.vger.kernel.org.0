Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82EB14715C
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 15 Jun 2019 19:04:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725944AbfFOREd (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 15 Jun 2019 13:04:33 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54842 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbfFOREd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 15 Jun 2019 13:04:33 -0400
Received: by mail-wm1-f68.google.com with SMTP id g135so5298453wme.4
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Jun 2019 10:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9Rvu52FQju2nG5XK2GGyQQX/fI8Lzs71tWfVjg7UD8k=;
        b=Bs+eMPciMzzGK4lrT9iL3ImRxlOAZyonnkwpW44L49sLv+7TubcJTwbylrvpPHJ4ry
         w+8wz/jH3wtjWritkxfQTkQWuuI15HoEuu10bHmf6SKWEb2MebPyGiAOFqv8sLPIHOOV
         rU81ID8MDJu186fM736vJP1wQNzgpYRz/FykOrrwhmiytYk2FZ/Ip9Cd68/oiRsx/7co
         4cPo6TSEOuT8EMLArp9C1f/nGX6fCjxWCSBJM/sui1KzPbj1+bPWadyHbwckRW4PiKvh
         26zZx/VUzGoUKDvB9OH1+h5AnYwv7Uj9ruyD6ISNxpjCDqFGyXPJID1WHPkgbGHjk/LU
         gPOg==
X-Gm-Message-State: APjAAAWdD2SBUjuO8B0YYgdaF5AtadcI5J8E40pVd/p2ooE4ZfbF9ImO
        brQEfWKqfwGA8Hl4SAfFdaR+CR4P
X-Google-Smtp-Source: APXvYqwLOL6sDHnk0m12aJwRWZfOM8uZ4S3yATY0LiqIYwCZDG7zrxsvVvr0G6gaBplCD2+FW6NlOQ==
X-Received: by 2002:a1c:1bc9:: with SMTP id b192mr12091821wmb.152.1560618271218;
        Sat, 15 Jun 2019 10:04:31 -0700 (PDT)
Received: from kozik-lap ([194.230.155.186])
        by smtp.googlemail.com with ESMTPSA id y24sm4718925wmi.10.2019.06.15.10.04.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Jun 2019 10:04:30 -0700 (PDT)
Date:   Sat, 15 Jun 2019 19:04:28 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
Cc:     Kukjin Kim <kgene@kernel.org>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Simon Shields <simon@lineageos.org>
Subject: Re: [PATCH] ARM: dts: exynos: add flash support to galaxy-s3 boards
Message-ID: <20190615170428.GA3447@kozik-lap>
References: <20190614155419.14260-1-GNUtoo@cyberdimension.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190614155419.14260-1-GNUtoo@cyberdimension.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Jun 14, 2019 at 05:54:19PM +0200, Denis 'GNUtoo' Carikli wrote:
> From: Simon Shields <simon@lineageos.org>
> 
> The galaxy s3 boards use an aat1290 to control the flash LED.
> This patch adds the relevant device tree configuration to use it.
> 
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

Please use the pin macros from:
include/dt-bindings/pinctrl/samsung.h

Best regards,
Krzysztof

