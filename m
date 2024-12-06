Return-Path: <linux-samsung-soc+bounces-5658-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 493A69E6911
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  6 Dec 2024 09:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C20241882955
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  6 Dec 2024 08:36:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A24DE1DF732;
	Fri,  6 Dec 2024 08:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="giCKlH7/"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3191C3054;
	Fri,  6 Dec 2024 08:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733474170; cv=none; b=gx/0Ph76i6uadj7YNoQa+yzysqeT7M5GZ+ohou/ZL6rJgz2uwdb9JkUHLi+Dm6P5hQM2LUxBTlGk41crVyRz1ARnt/Pmt3/0ITAum6oChu2hzdI+Uxx+HAeyiNNJ+iNhk2vCTkKYvJ8JDWbDuzyofX5fc202xdptWKZprB88qsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733474170; c=relaxed/simple;
	bh=biysX5rwD8h38rWK+RqAV3h7Q6xppH9Fd8isyf4rwIA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W5FtEKhaR0GltPXWGt/vM5IAKVb06TPN53ugsqCOPEyaZLnfYwx6zrpcec/Oo/Lzi4/I4W2R+l/kWAKzW7DnIVyyXCoM80H0Dp9436zxL3iQ59hSww4jKIftBvWXgUQVHTZdlXcAqcDMFZcvH8kUjrfOyv0q+86OlSpsZ+7vk8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=giCKlH7/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E51C4CED1;
	Fri,  6 Dec 2024 08:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733474169;
	bh=biysX5rwD8h38rWK+RqAV3h7Q6xppH9Fd8isyf4rwIA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=giCKlH7/IEm17aNGwxcd45BYEo43yvCcdkE2ZCCD9+Cr75eqsQIdB0MP+RyTdZfCC
	 IXd9A33cmS/pXhQrVBiAZ0ETgPSzCiN/elKWzRwTjRns+lXFa4wYBzI/HnDlkKrF13
	 3KqCfWjRHvK2azH2Xzw8HrHk4JyusN9H/tYQ016+gX2dVpFPmhRANAiPjJOTj6bPKf
	 KwypQKNIv+4Nq95w3ObbrUJMwZmgMuqglGTnqz9HS5ZEtJuWKut4sWwreBZP2vA/QF
	 ZVoELvq93YS9+TTltJW/EyPmH/bvN48hru7jYqhOT8YAIGf0qWjhbUAd3l1phUBMYP
	 aQGJeD5/nN2Sg==
Message-ID: <fdb4af16-468a-4c23-b8f4-ab60d4b535d2@kernel.org>
Date: Fri, 6 Dec 2024 09:36:03 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] arm64: dts: exynos990: Add clock management unit
 nodes
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241205194020.785846-1-igor.belwon@mentallysanemainliners.org>
 <20241205194020.785846-2-igor.belwon@mentallysanemainliners.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241205194020.785846-2-igor.belwon@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/12/2024 20:40, Igor Belwon wrote:
> Add CMU nodes for:
> - cmu_top: provides clocks for other blocks
> - cmu_hsi0: provides clocks for usb31
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos990.dtsi | 27 +++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
> index c1986f00e443..49bb1e156843 100644
> --- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
> @@ -5,6 +5,7 @@
>   * Copyright (c) 2024, Igor Belwon <igor.belwon@mentallysanemainliners.org>
>   */
>  
> +#include <dt-bindings/clock/samsung,exynos990.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
>  / {
> @@ -199,6 +200,23 @@ pinctrl_peric1: pinctrl@10730000 {
>  			interrupts = <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>;
>  		};
>  
> +		cmu_hsi0: clock-controller@10a00000 {
> +			compatible = "samsung,exynos990-cmu-hsi0";
> +			reg = <0x10a00000 0x8000>;
> +			#clock-cells = <1>;
> +
> +			clocks = <&oscclk>,
> +				 <&cmu_top CLK_DOUT_CMU_HSI0_BUS>,
> +				 <&cmu_top CLK_DOUT_CMU_HSI0_USB31DRD>,
> +				 <&cmu_top CLK_DOUT_CMU_HSI0_USBDP_DEBUG>,
> +				 <&cmu_top CLK_DOUT_CMU_HSI0_DPGTC>;
> +			clock-names = "oscclk", "dout_cmu_hsi0_bus",

One per line.

> +						"dout_cmu_hsi0_usb31drd",

Misaligned.

> +						"dout_cmu_hsi0_usbdp_debug",
> +						"dout_cmu_hsi0_dpgtc";
> +

Drop stray blank line.

> +		};
> +




Best regards,
Krzysztof

