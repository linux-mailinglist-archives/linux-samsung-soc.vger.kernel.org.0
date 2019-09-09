Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B33EADF25
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  9 Sep 2019 20:51:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732391AbfIISvy (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 9 Sep 2019 14:51:54 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36423 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726814AbfIISvy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Sep 2019 14:51:54 -0400
Received: by mail-wr1-f66.google.com with SMTP id y19so15273598wrd.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Sep 2019 11:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZYH37n4KCQat8+rOHr4mHbzSSgCsymuaE13qGjQsEac=;
        b=Hvi3J1DMsxK9qd++kMYwDl9h+G2gkDc1T/D1+BLd46uOjrH0DLGT7riBRFkGECbic+
         bLVndTdsaMASM4SrUo+2IUk2b+Jksx0bZ5L3U9eA6l4djYt76ZmpEKBjtA/ADB3Bsd6j
         3IsTdm4+WyZ5sHBq6l2L5qaRqR2msOukz6+9LoILFuqqKoXALuzVS3OIvzVaMN+UNiQ8
         5Wr1OkhenBFbGIW63LeGouHDPgCaUWPZAw184ISIJUQTd7HFkH3/iZnV7M6dPxfcVCbN
         m+VuFIvFUYBpD/GqFfKmwY2H9R7S+QkqEamu7xksY5gWtOs1v7DeiDVxrpaIuNglEMpg
         /dUQ==
X-Gm-Message-State: APjAAAUegTQefUyAfTIuypv0iNcJg3ut28b98t6CqRnPy30gWW892I8+
        30+thC9o/KuihmYrWmF5uukutf/Z
X-Google-Smtp-Source: APXvYqwYMqz2af4crnEoBQdZXpEqSD7+ogPWiSCOglcSJ7wKL9pf2sB+DDogsMocto2+xeieOMnxYw==
X-Received: by 2002:adf:f48e:: with SMTP id l14mr19309946wro.234.1568055111497;
        Mon, 09 Sep 2019 11:51:51 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id h125sm690613wmf.31.2019.09.09.11.51.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2019 11:51:50 -0700 (PDT)
Date:   Mon, 9 Sep 2019 20:51:48 +0200
From:   "krzk@kernel.org" <krzk@kernel.org>
To:     Yao Lihua <ylhuajnu@outlook.com>
Cc:     "kgene@kernel.org" <kgene@kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/2] ARM: dts: s3c64xx: factor out external fixed clocks
Message-ID: <20190909185148.GA10163@kozik-lap>
References: <20190907024719.16974-1-ylhuajnu@outlook.com>
 <BY5PR12MB36996A79D9B1EEC5162B00F4C4B50@BY5PR12MB3699.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <BY5PR12MB36996A79D9B1EEC5162B00F4C4B50@BY5PR12MB3699.namprd12.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, Sep 07, 2019 at 02:48:08AM +0000, Yao Lihua wrote:
> From: Lihua Yao <ylhuajnu@outlook.com>
> 
> As per arch/arm/mach-s3c64xx/common.c, the external oscillators
> of S3C6400 and S3C6410 are identical. Move them to s3c64xx.dtsi
> and place under root node directly.

Hi,

Thanks for patches!

These are external oscillators so they are not a SoC property. They
should be external.

They could be moved to their own shared DTSI but I am not sure how much
benefit it will bring - it is rather small code duplication.

You need to fix the error in different way. However I do not quite
understand why moving them to the end of DTS fixed the error - they
should be now registered at the end...

Best regards,
Krzysztof

> This introduces side effect of changing the initialization order of
> fin_pll and clock-controller@7e00f000. As of commit 3f6d439f2022
> ("clk: reverse default clk provider initialization order in of_clk_init()"),
> clock providers are initialized in the orders they are present in the
> device tree unless the clocks' dependencies are specified explicitly.
> 
> without this patch:
>   [    0.000000] S3C6410 clocks: apll = 0, mpll = 0
>   [    0.000000]  epll = 0, arm_clk = 0
> 
> with this patch:
>   [    0.000000] S3C6410 clocks: apll = 532000000, mpll = 532000000
>   [    0.000000]  epll = 24000000, arm_clk = 532000000
> 
> Fixes: 3f6d439f2022 ("clk: reverse default clk provider initialization order in of_clk_init()")
> Signed-off-by: Lihua Yao <ylhuajnu@outlook.com>
> ---
>  arch/arm/boot/dts/s3c6410-mini6410.dts | 22 ----------------------
>  arch/arm/boot/dts/s3c6410-smdk6410.dts | 22 ----------------------
>  arch/arm/boot/dts/s3c64xx.dtsi         | 14 ++++++++++++++
>  3 files changed, 14 insertions(+), 44 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/s3c6410-mini6410.dts b/arch/arm/boot/dts/s3c6410-mini6410.dts
> index 5201512054c4..7028507b7076 100644
> --- a/arch/arm/boot/dts/s3c6410-mini6410.dts
> +++ b/arch/arm/boot/dts/s3c6410-mini6410.dts
> @@ -28,28 +28,6 @@
>  		bootargs = "console=ttySAC0,115200n8 earlyprintk root=/dev/nfs rw nfsroot=192.168.31.2:/srv/nfs/tiny6410,nfsvers=3 ip=dhcp";
>  	};
>  
> -	clocks {
> -		compatible = "simple-bus";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		fin_pll: oscillator@0 {
> -			compatible = "fixed-clock";
> -			reg = <0>;
> -			clock-frequency = <12000000>;
> -			clock-output-names = "fin_pll";
> -			#clock-cells = <0>;
> -		};
> -
> -		xusbxti: oscillator@1 {
> -			compatible = "fixed-clock";
> -			reg = <1>;
> -			clock-output-names = "xusbxti";
> -			clock-frequency = <48000000>;
> -			#clock-cells = <0>;
> -		};
> -	};
> -
>  	srom-cs1@18000000 {
>  		compatible = "simple-bus";
>  		#address-cells = <1>;
> diff --git a/arch/arm/boot/dts/s3c6410-smdk6410.dts b/arch/arm/boot/dts/s3c6410-smdk6410.dts
> index a9a5689dc462..10a854b488a8 100644
> --- a/arch/arm/boot/dts/s3c6410-smdk6410.dts
> +++ b/arch/arm/boot/dts/s3c6410-smdk6410.dts
> @@ -28,28 +28,6 @@
>  		bootargs = "console=ttySAC0,115200n8 earlyprintk rootwait root=/dev/mmcblk0p1";
>  	};
>  
> -	clocks {
> -		compatible = "simple-bus";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -
> -		fin_pll: oscillator@0 {
> -			compatible = "fixed-clock";
> -			reg = <0>;
> -			clock-frequency = <12000000>;
> -			clock-output-names = "fin_pll";
> -			#clock-cells = <0>;
> -		};
> -
> -		xusbxti: oscillator@1 {
> -			compatible = "fixed-clock";
> -			reg = <1>;
> -			clock-output-names = "xusbxti";
> -			clock-frequency = <48000000>;
> -			#clock-cells = <0>;
> -		};
> -	};
> -
>  	srom-cs1@18000000 {
>  		compatible = "simple-bus";
>  		#address-cells = <1>;
> diff --git a/arch/arm/boot/dts/s3c64xx.dtsi b/arch/arm/boot/dts/s3c64xx.dtsi
> index 2e611df37911..672764133cea 100644
> --- a/arch/arm/boot/dts/s3c64xx.dtsi
> +++ b/arch/arm/boot/dts/s3c64xx.dtsi
> @@ -39,6 +39,20 @@
>  		};
>  	};
>  
> +	fin_pll: oscillator-0 {
> +		compatible = "fixed-clock";
> +		clock-frequency = <12000000>;
> +		clock-output-names = "fin_pll";
> +		#clock-cells = <0>;
> +	};
> +
> +	xusbxti: oscillator-1 {
> +		compatible = "fixed-clock";
> +		clock-frequency = <48000000>;
> +		clock-output-names = "xusbxti";
> +		#clock-cells = <0>;
> +	};
> +
>  	soc: soc {
>  		compatible = "simple-bus";
>  		#address-cells = <1>;
> -- 
> 2.17.1
> 
