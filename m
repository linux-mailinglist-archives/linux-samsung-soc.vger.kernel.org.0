Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9ED76739BD
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 24 Jul 2019 21:43:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390518AbfGXTnS (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 24 Jul 2019 15:43:18 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:44594 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390175AbfGXTnS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 24 Jul 2019 15:43:18 -0400
Received: by mail-wr1-f65.google.com with SMTP id p17so48187199wrf.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jul 2019 12:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dslj9P+lW7e6qJrlTP3vfXS2Cf51Y/kndAh16hKfgsw=;
        b=YAXzbTprT7B2KKWorQpIqWCyvX2Ix4rx7o7EueBei5AcuUOzWZu8eFggTL9FFLbuDg
         VSH1pvm1UXXAi6/lh1BOO0gKovp3JQxoio09t3JNSxPPnZHMD9Um+VfOQCo8koIAM/Vf
         Ujg7P9EI7WBzOZAI7O1HSdlN0Y52c8AYHz/u798rBrrsZlg/HpKmzp2e0NPwpKIpGZDV
         ydCUcM+fo6Vg+qlAKZBY948SXLxr7BSl7RHR21bn74bFLuE+J4NtVyQ8ZRZZf2fp40K7
         5ClN4LVu26GI4eC7fKb+aGZkRNjHXjETUGi4ce3r0R10DDr3f5fMOP/Oe9EGQCpd3591
         ekZw==
X-Gm-Message-State: APjAAAUmRbvflnTdSkm5FZBCw2Ub5Qd43sB1FPJeerjKKNy14jnM+VE2
        TDIEFmpFpHx+mn7O1sFobgc00ryE
X-Google-Smtp-Source: APXvYqyt/nYi/kv5oSj5A+zQK7NJl5V1Y8FdvyGTPvRoDLXBM1S6Qy2pjonLUX7NnFUtT/p0XDyMQw==
X-Received: by 2002:a05:6000:1203:: with SMTP id e3mr13281982wrx.300.1563997395606;
        Wed, 24 Jul 2019 12:43:15 -0700 (PDT)
Received: from kozik-lap ([194.230.155.239])
        by smtp.googlemail.com with ESMTPSA id q10sm50126245wrf.32.2019.07.24.12.43.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2019 12:43:15 -0700 (PDT)
Date:   Wed, 24 Jul 2019 21:43:13 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Guillaume GARDET <guillaume.gardet@free.fr>
Cc:     linux-samsung-soc@vger.kernel.org,
        Guillaume GARDET <guillaume.gardet@arm.com>,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm: dts: exynos: Add GPU/Mali T604 node to exynos5250
Message-ID: <20190724194313.GA1898@kozik-lap>
References: <20190724072008.6272-1-guillaume.gardet@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190724072008.6272-1-guillaume.gardet@free.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Thanks for the patch.

On Wed, Jul 24, 2019 at 09:20:08AM +0200, Guillaume GARDET wrote:
> From: Guillaume GARDET <guillaume.gardet@arm.com>
> 
> Add nodes for GPU (Mali T604) to Exynos5250, disabled by default.

Why disabled? If tested I would expect it to be enabled at least on
tested platforms.

> Tested with kmscube on Chromebook snow.
> 
> Signed-off-by: Guillaume GARDET <guillaume.gardet@arm.com>
> 
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> 
> ---
>  arch/arm/boot/dts/exynos5250.dtsi | 47 +++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index d5e0392b409e..5ce4b2853cf2 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -1097,6 +1097,53 @@
>  		 */
>  		clock-frequency = <24000000>;
>  	};
> +
> +	mali: gpu@0x11800000 {

1. Put the node under /soc (as recently pointed out by Marek Szyprowski)
in an address-sorted mode... if possible (nodes are mixed so find some
reasonable place based on address_.
2. Fix errors from:
make dtbs W=1

> +		compatible = "samsung,exynos5250-mali", "arm,mali-t604";

You also need to update the bindings.

> +		reg = <0x11800000 0x5000>;
> +		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> +		             <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,

Please run checkpatch and fix the errors.

> +			     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "job", "mmu", "gpu";
> +		clocks = <&clock CLK_G3D>;
> +		clock-names = "g3d";
> +		operating-points-v2 = <&gpu_opp_table>;
> +		power-domains = <&pd_g3d>;
> +		status = "disabled";
> +	};
> +
> +	gpu_opp_table: gpu-opp-table {

GPU opp table as subnode of Mali node.

Best regards,
Krzysztof

