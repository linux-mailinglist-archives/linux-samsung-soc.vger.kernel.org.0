Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41FC8473E2
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 16 Jun 2019 10:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726495AbfFPI7d (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 16 Jun 2019 04:59:33 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53929 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbfFPI7d (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 16 Jun 2019 04:59:33 -0400
Received: by mail-wm1-f68.google.com with SMTP id x15so6260699wmj.3;
        Sun, 16 Jun 2019 01:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ITLiVQZ3ttHS2OCmJVdr2pwqDxExpjxblx6QJpo79NY=;
        b=UcRqfMoVfGiOkkddlSHIWgofPQt9zz+2+jDvHGKKMVVd+weowCwmvDSbbB37VJSqzw
         aW3vWfdqLRkcwrYY0pdRCtX8jKuEYrHMtNZ0Sk2hPqFyQKPJkmvgWL07/eDyoLsmi/hF
         FY0DjOT2NOIhliKlIay6/4fHqLeZj3xxU9ljngtakNEceCfw9OabDWse/AdHJ6p2lmp3
         KNsAVAca1JHtGmOvjFd29B02SjDgrm2zqxOMV0G643ORaQy3p5Kqmy8NZu5zYrxr3wqi
         RtSunfhD1G7aymULwdyGGgTjmBfkyOPpJyN48k2iToycpImOkJTv+E7uyrwoXVJO+uVX
         dEow==
X-Gm-Message-State: APjAAAUCeBZ09TyOwpriR09BmqEBLvZoL9Yrm28vJgiWxHM+mEfYu8++
        wnQ3p76tNOYMaG56Ej1KBGs=
X-Google-Smtp-Source: APXvYqzSFlADfZGpYrtAtOjU/NYmJZYEAkWsu4on1+2TMhvgCshgH31ng4O8HIUzQ+YcUwFU6kLTWA==
X-Received: by 2002:a1c:6156:: with SMTP id v83mr9069782wmb.81.1560675571337;
        Sun, 16 Jun 2019 01:59:31 -0700 (PDT)
Received: from kozik-lap ([194.230.155.186])
        by smtp.googlemail.com with ESMTPSA id s7sm4514716wmc.2.2019.06.16.01.59.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Jun 2019 01:59:30 -0700 (PDT)
Date:   Sun, 16 Jun 2019 10:59:28 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Joseph Kogut <joseph.kogut@gmail.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, kgene@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm: dts: add ARM Mali GPU node for Odroid XU3
Message-ID: <20190616085928.GB3826@kozik-lap>
References: <20190614203144.3850-2-joseph.kogut@gmail.com>
 <20190614235719.8134-1-joseph.kogut@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190614235719.8134-1-joseph.kogut@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Jun 14, 2019 at 04:57:19PM -0700, Joseph Kogut wrote:
> Add device tree node for mali gpu on Odroid XU3 SoCs.
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
> 
> Changes v1 -> v2:
> - Use interrupt name ordering from binding doc
> - Specify a single clock for GPU node
> - Add gpu opp table
> - Fix warnings from IRQ_TYPE_NONE
> 
>  .../boot/dts/exynos5422-odroidxu3-common.dtsi | 26 +++++++++++++++++++

This should go to exynos5422-odroid-core.dtsi instead, because it is
common to entire Odroid Exynos5422 family (not only XU3 family).

>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> index 93a48f2dda49..b8a4246e3b37 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> @@ -48,6 +48,32 @@
>  		cooling-levels = <0 130 170 230>;
>  	};
> 
> +	gpu: gpu@11800000 {
> +		compatible = "samsung,exynos-mali", "arm,mali-t628";

This is common to all Exynos542x chips so it should go to
exynos5420.dtsi. Here you would need to only enable it and provide
regulator.

Probably this should be also associated with tmu_gpu as a cooling device
(if Mali registers a cooling device...). Otherwise the tmu_gpu is not
really used for it.

> +		reg = <0x11800000 0x5000>;
> +		interrupts = <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 74  IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "job", "mmu", "gpu";
> +		clocks = <&clock CLK_G3D>;
> +		mali-supply = <&buck4_reg>;

Please check if always-on property could be removed from buck4. Also,
what about LDO27? It should be used as well (maybe through
vendor-specific properties which would justify the need of new vendor
compatible).


Best regards,
Krzysztof

> +		operating-points-v2 = <&gpu_opp_table>;
> +	};
> +
> +	gpu_opp_table: gpu-opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-177000000 {
> +			opp-hz = /bits/ 64 <117000000>;
> +			opp-microvolt = <812500>;
> +		};
> +
> +		opp-600000000 {
> +			opp-hz = /bits/ 64 <600000000>;
> +			opp-microvolt = <1150000>;
> +		};
> +	};
> +
>  	thermal-zones {
>  		cpu0_thermal: cpu0-thermal {
>  			thermal-sensors = <&tmu_cpu0 0>;
> --
> 2.22.0
> 
