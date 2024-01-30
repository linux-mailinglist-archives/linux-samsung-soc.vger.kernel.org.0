Return-Path: <linux-samsung-soc+bounces-1551-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1C8841E98
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 30 Jan 2024 10:02:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A29F1F2AA63
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 30 Jan 2024 09:02:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 694E15821A;
	Tue, 30 Jan 2024 09:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LwaMoCZJ"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55DC58133
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jan 2024 09:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706605361; cv=none; b=Op+6PmyKA6/Rpdpbngp7epU6t/NtcGx0QzysXzc7qMiodcf9K06cGjOM6dhbZ5jty+fYys0B8ah9FqsGuXrH4CK2Op7DX80AxEG4L/cqu3r6RGbXeMNfNHHrX5zjVijsB6+WJbESN5AoKEhoNij1ZbZTSwOCUNFSkZHFDGXQsKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706605361; c=relaxed/simple;
	bh=A74S1vb4LGaWbhEPrN85iaKrH9GsTPrM2NFZfHdl6KI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FFLo5iXxi9gtKDqOOHhVkBjpU7VY+oS921jccy6wU/mrAMyqhKmKdlfm668MOYqeRjRkmzezBMFT55LY5W8fPm5wlQ4dn2eB2z2/R1ZyRs6oeM8n9erK0Z4iwQfT9tCmhl3D5p51oojHmsCwrsYpiqXL76c7mZ2tpekF1xCXi+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LwaMoCZJ; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-55f496d60e4so323108a12.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jan 2024 01:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706605358; x=1707210158; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AJ1SS5lGnja3l6pkjsRDIrrPuA4A70zNu5IKEP8FxBE=;
        b=LwaMoCZJZaOhoJF6DO8bVwDMDQprRp6tF5oyWzeAJJUckfRCh8me75/Zy06Bcejlo7
         78bAka4bGQl/6eKaxIv3BmrijS2kJqA4J33wPtsdos5xgh6Mn81iGQ5c+QCHGvduXpuu
         hUodrOXyw0P96l7m0a8eW2Rf7HnQdi0HR+tYS4db2TRE+ui8BRkcf5XcXE/cIgv9OV7S
         JOTJiRSHVE97UHeAxkOxwoIbUvqAkcI5SBwExCLgIGKUZR/yCZXwGrCIW9VPlPxFbjqv
         1sZ41O7TV4rWhePDZZXwO/rYKkHZPNRx98MdKm/SYQaOy7QISEVMuAHNBX5P65b7ghV9
         rw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706605358; x=1707210158;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AJ1SS5lGnja3l6pkjsRDIrrPuA4A70zNu5IKEP8FxBE=;
        b=s8vrpnyXMRoCfbp4iB/duc4sObWkb177h1P27zfu76izf6n3yaVinE/aZPH5kcHaBJ
         2QsX2S7CxBf60KdFkUf+wGfeHRx6m8+TZXVMn7jJN/FVJY9JuDOUus8aBsxvQIr+QTYI
         cEiYD3VDHP1W0blpCIxYKAm/HeWS94kOqT+rXq8jQP6jawmKb1bibMGYl2sx8/0HkPfM
         lZiXORa2OmKbRdl3azVYenRb99pyAaixCWoBkFTUCFW6hlRuFYygTR7rrLrMdNKVZgYb
         0jQSQEPykd9qBrCge34DrOWw1VJf+cqSIv8816ivYEKSYTFEGuFMPez+4RUSf/7X9AT2
         YMdw==
X-Gm-Message-State: AOJu0YzuUz3KoibOiKD/Cz+xfxL7bZgJ/yJERXNqijTY3zrJlpbm7dqf
	+TqcU7Bn8Zg5ImG8lCgkEBDpQ+IlLYRij4sGefGOHmvDdibR7XXSByqeGYGKktc=
X-Google-Smtp-Source: AGHT+IGLGUS/RKRGlxhE379px+mhIpeN89YnVx8XpKul0mTd5bXkph9TUNBA+lok4sTqh+XWzHQu1g==
X-Received: by 2002:a05:6402:2550:b0:55e:de86:65d7 with SMTP id l16-20020a056402255000b0055ede8665d7mr4875439edb.31.1706605357952;
        Tue, 30 Jan 2024 01:02:37 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id fg14-20020a056402548e00b00558a1937dddsm4578826edb.63.2024.01.30.01.02.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 01:02:37 -0800 (PST)
Message-ID: <cd7445d5-28a8-425d-bbae-48619330ef2f@linaro.org>
Date: Tue, 30 Jan 2024 09:02:35 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] arm64: dts: exynos: gs101: enable cmu-peric1 clock
 controller
Content-Language: en-US
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com,
 willmcvicker@google.com, semen.protsenko@linaro.org,
 alim.akhtar@samsung.com, s.nawrocki@samsung.com, tomasz.figa@gmail.com,
 cw00.choi@samsung.com, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20240129174703.1175426-1-andre.draszik@linaro.org>
 <20240129174703.1175426-6-andre.draszik@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240129174703.1175426-6-andre.draszik@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/29/24 17:46, André Draszik wrote:
> Enable the cmu-peric1 clock controller. It feeds additional USI, I3C
> and PWM interfaces / busses.
> 
> Note that &sysreg_peric1 needs a clock to be able to access its
> registers and now that Linux knows about this clock, we need to add it
> in this commit as well so as to keep &sysreg_peric1 working, so that
> the clock can be enabled as and when needed.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> ---
> v2:
> * merge patch #8 from original series version 1 into this patch, i.e.
> add the clock to &sysreg_peric1 in this commit & update commit message
> * collect Reviewed-by: tags
> ---
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> index aaac04df5e65..e1bcf490309a 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -429,9 +429,20 @@ serial_0: serial@10a00000 {
>  			};
>  		};
>  
> +		cmu_peric1: clock-controller@10c00000 {
> +			compatible = "google,gs101-cmu-peric1";
> +			reg = <0x10c00000 0x4000>;
> +			#clock-cells = <1>;
> +			clocks = <&ext_24_5m>,
> +				 <&cmu_top CLK_DOUT_CMU_PERIC1_BUS>,
> +				 <&cmu_top CLK_DOUT_CMU_PERIC1_IP>;
> +			clock-names = "oscclk", "bus", "ip";
> +		};
> +
>  		sysreg_peric1: syscon@10c20000 {
>  			compatible = "google,gs101-peric1-sysreg", "syscon";
>  			reg = <0x10c20000 0x10000>;
> +			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK>;
>  		};
>  
>  		pinctrl_peric1: pinctrl@10c40000 {

