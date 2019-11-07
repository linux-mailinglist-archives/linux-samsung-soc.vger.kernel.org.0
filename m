Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CADCDF2B45
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  7 Nov 2019 10:48:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387905AbfKGJsj (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 7 Nov 2019 04:48:39 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:44276 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387629AbfKGJsh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Nov 2019 04:48:37 -0500
Received: by mail-ed1-f67.google.com with SMTP id a67so1337771edf.11;
        Thu, 07 Nov 2019 01:48:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ryVCGfYMOEex1ENMBo3WtYsy72Zmz0c5VfDM/zRq6jQ=;
        b=iRrmkvhuuwcK/3ifMAhuUt7/1itMUSd/1uW0JxDY6JGLtO1WWlWtQ0AZpxQqJVfvEN
         zYqRDByMsnUAcIKNhfzkSBx+IYFvVEPZFjM+shutSaYF50k29lx3JiFP5V9IU6WsNJF5
         4RW8V8Pr3tVY27FkqBHO4MzDA19uNE4G74NYcGPF2NGuBcg+1BC/ZiVaSFGiynX0SYni
         N4+OHmd7/4rSUSnbyF7L9tf40pKLe2HwES49jO7cH7CWbLdWsJP9bf9057bGdI9hjsjm
         JKiF5NoKVilMGL93C8PHt4PowhTX9nGMFSHId49EUg9xHM3Pf5PYPLhgFFnnVjHYaN/6
         F2vg==
X-Gm-Message-State: APjAAAVqg7w6Tcj9ohxhvshUWtmJMwoICFJii1gryY99FUjzpuedFv2W
        z0aN0lheEcv50JlBLKG5K6k=
X-Google-Smtp-Source: APXvYqxtciFqyfuAvEMMp+eSFo/4y6pUhhge7L1IjrIdDo63s82J7dG7Ds8DoAxmytx2VsSq7WgHBQ==
X-Received: by 2002:a17:906:49d1:: with SMTP id w17mr2089977ejv.101.1573120115626;
        Thu, 07 Nov 2019 01:48:35 -0800 (PST)
Received: from pi3 ([194.230.155.180])
        by smtp.googlemail.com with ESMTPSA id p12sm41369edr.4.2019.11.07.01.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2019 01:48:34 -0800 (PST)
Date:   Thu, 7 Nov 2019 10:48:32 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marian Mihailescu <mihailescu2m@gmail.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, kgene@kernel.org
Subject: Re: [PATCH v4 2/2] ARM: dts: exynos5420: add mali dt node and enable
 mali on Odroid XU3/4
Message-ID: <20191107094832.GA2142@pi3>
References: <20191106225527.9121-1-mihailescu2m@gmail.com>
 <20191106225527.9121-2-mihailescu2m@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191106225527.9121-2-mihailescu2m@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Nov 07, 2019 at 09:25:27AM +1030, Marian Mihailescu wrote:
> Add device tree node for Mali GPU for Exynos 542x SoC.
> GPU is disabled by default, and is enabled for each board after the
> regulator is defined. Tested on Odroid-XU4.
> 
> Changes since v3:
> - fixed compatible to match bindings

Changelog does not go to commit message. Put it after msg separator
(---).

Except this looks good so I will fix it up while applying.

Best regards,
Krzysztof


> 
> Changes since v2:
> - separate patch for bindings
> - fixed bindings typo
> 
> Changes since v1:
> - used generic node and label for GPU
> - added bindings for compatible
> - fixed irq indentation
> - fixed interrupt-names to match bindings
> - added cooling cells for future TMU connection
> - used generic node and label for GPU opp table
> - removed always-on from SoC GPU regulator
> 
> Signed-off-by: Marian Mihailescu <mihailescu2m@gmail.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi             | 50 +++++++++++++++++++++++++++
>  arch/arm/boot/dts/exynos5422-odroid-core.dtsi |  6 +++-
>  2 files changed, 55 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 7d51e0f4ab79..31b5f7ba0e3b 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -670,6 +670,56 @@
>  			iommus = <&sysmmu_gscl1>;
>  		};
>  
> +		gpu: gpu@11800000 {
> +			compatible = "samsung,exynos5420-mali", "arm,mali-t628";
> +			reg = <0x11800000 0x5000>;
> +			interrupts = <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "job", "mmu", "gpu";
> +
> +			clocks = <&clock CLK_G3D>;
> +			clock-names = "core";
> +			power-domains = <&g3d_pd>;
> +			operating-points-v2 = <&gpu_opp_table>;
> +
> +			status = "disabled";
> +			#cooling-cells = <2>;
> +
> +			gpu_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp@177000000 {
> +					opp-hz = /bits/ 64 <177000000>;
> +					opp-microvolt = <812500>;
> +				};
> +				opp@266000000 {
> +					opp-hz = /bits/ 64 <266000000>;
> +					opp-microvolt = <862500>;
> +				};
> +				opp@350000000 {
> +					opp-hz = /bits/ 64 <350000000>;
> +					opp-microvolt = <912500>;
> +				};
> +				opp-420000000 {
> +					opp-hz = /bits/ 64 <420000000>;
> +					opp-microvolt = <962500>;
> +				};
> +				opp-480000000 {
> +					opp-hz = /bits/ 64 <480000000>;
> +					opp-microvolt = <1000000>;
> +				};
> +				opp-543000000 {
> +					opp-hz = /bits/ 64 <543000000>;
> +					opp-microvolt = <1037500>;
> +				};
> +				opp-600000000 {
> +					opp-hz = /bits/ 64 <600000000>;
> +					opp-microvolt = <1150000>;
> +				};
> +			};
> +		};
> +
>  		scaler_0: scaler@12800000 {
>  			compatible = "samsung,exynos5420-scaler";
>  			reg = <0x12800000 0x1294>;
> diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> index 422692b20c46..ce774f7b2ce0 100644
> --- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
> @@ -522,7 +522,6 @@
>  				regulator-name = "vdd_g3d";
>  				regulator-min-microvolt = <800000>;
>  				regulator-max-microvolt = <1400000>;
> -				regulator-always-on;
>  				regulator-boot-on;
>  
>  				regulator-state-mem {
> @@ -659,6 +658,11 @@
>  	status = "okay";
>  };
>  
> +&gpu {
> +	mali-supply = <&buck4_reg>;
> +	status = "okay";
> +};
> +
>  &rtc {
>  	status = "okay";
>  	clocks = <&clock CLK_RTC>, <&s2mps11_osc S2MPS11_CLK_AP>;
> -- 
> 2.14.1
> 
