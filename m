Return-Path: <linux-samsung-soc+bounces-1248-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B86A983C0D2
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Jan 2024 12:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 497071F2412E
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Jan 2024 11:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65D632C68D;
	Thu, 25 Jan 2024 11:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="opKgYAfZ"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9176817735
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 11:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706182308; cv=none; b=E8j2yTvSp5IKg4CSFOiuXxD9Xe1BP/XdUvQo3Bu/myXEzoFGNVjVTNGJTSTb9CfNt8QnrV/oP0aKYxGDo2XXovMe3vpUYkz2/I8/G8Q8DofLadrN7XWN2Iw9BvlVVU0JU3kf+tMBpTOmumo977ium9GUBO2QLm+Yk4pwVY9fdTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706182308; c=relaxed/simple;
	bh=Gkox73kJQuPMe66Dq8WQy5T/1qpGqY8Q73OZXUdTLMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XawSNn9pO7Z5kDtAV9BcB1/hDX3E5mUwGYMSlIYtA/Ld5kOH2E4T2YrGyc9RT7TlIPSAdXaM1Xfn7j02Z7SR9F5KhZdfvPEXQ0+z0ZnbW6YAOKpDzwSkPFyd6TRyE0aAsPGFskRJSRoPNZuYFw9knB4mVQx/4NWekXZxrGEFIfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=opKgYAfZ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a26ed1e05c7so742021466b.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 03:31:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706182305; x=1706787105; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kXUM1YzAYFxAt6CaSZMDshr9nnMeTjeJvJ3fZvy8u/s=;
        b=opKgYAfZ5aaJt0W7P2JLzR805OtAPLvUkor0EjHZxh+D0O0xa9hAVxLF66ycScTY+a
         RQIAZcIrOpj8g3AOdUKiADlJRn3XMFphf+VJ7+s+XcTXyE1KvirJy6YEKeKLkKmzuvfm
         FEn9NyqaAiCLTtk3OJR08HCiA5V8UkMOIU4UerDF3YrCelmgnV5hNF8DnXhUDbUFBqWW
         ynlC0sKRdiPkG/mFLwPXNC7Q2dfLKZWKRgiF5xZBuqxq2IiEGdiVRtqfMWE2cIrenNHw
         RmysPCG4GUu8eRxRR39I0GhE+WxyjKvQpYhBJjREUF015NIFDVjGoyWqE9t6Ft3ZqAzd
         5+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706182305; x=1706787105;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kXUM1YzAYFxAt6CaSZMDshr9nnMeTjeJvJ3fZvy8u/s=;
        b=nMmrtEYkXL9hAxxcliJHQGjr0fcoLmR1QiRHSxJ/q0Xj1VCvSdcptoTwPMmhVw0ca/
         PLopZndpV9o5Ys9BC13OIRc65Ybu+/F4R/jv/XP5gMNDldAfgtQd1OM37vxvlHVdCjeW
         tagddIKi01K7HfkTtco+6MJscdDnafxqInJzcQ4TlFH3e50//wDgm87w9L8GFaU1Nwa9
         A6pdszOb0Fzz5Mdncra68T9HGQ0p6hw92ZXg4G0OjieE5fmwEi/m5XDStkl84KYT/jMR
         XG+/p+C4YFMVvSMhwxNAnXROnxytrw1CopPlwLDFPKX14sEWLAtDxt5TmVZ6GcvbeypO
         jR6w==
X-Gm-Message-State: AOJu0Ywwx9tUo/h6ERc72b+fnxYZmclx2Nde5MpXtcLe7eieKh2PQxfr
	R39jeNbJcu0EWwXDsVTe38curZNwZ9y1Sgzua3JlRItENK8ZV9I/sj3WmeP+ql4=
X-Google-Smtp-Source: AGHT+IG+EI2F/oVESA9vZty2MHPPsg/wRRdsbAdTQn1xzmWa06cwSrT2Culo5UeVGzoI/+EGUXZ1hQ==
X-Received: by 2002:a17:906:250c:b0:a2e:893f:7333 with SMTP id i12-20020a170906250c00b00a2e893f7333mr281802ejb.5.1706182304677;
        Thu, 25 Jan 2024 03:31:44 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id tk11-20020a170907c28b00b00a3040040011sm928081ejc.45.2024.01.25.03.31.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jan 2024 03:31:44 -0800 (PST)
Message-ID: <986db909-144b-465a-8c46-273042a4fe5e@linaro.org>
Date: Thu, 25 Jan 2024 12:31:42 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm/arm64: samsung: Enable W=1 on dtbs by default
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231116211739.3228239-1-robh@kernel.org>
 <ee10e67b-6a2f-4ab5-91ef-e42d2f03a424@linaro.org>
 <CAL_JsqJ67tZOmhTHQ7KqEbFuDjK8sKHR1FFtAFAaGjZ4uYi9Uw@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAL_JsqJ67tZOmhTHQ7KqEbFuDjK8sKHR1FFtAFAaGjZ4uYi9Uw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/11/2023 15:58, Rob Herring wrote:
> On Fri, Nov 17, 2023 at 3:19 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 16/11/2023 22:17, Rob Herring wrote:
>>> Samsung platforms are clean of W=1 dtc warnings, so enable the warnings
>>> by default. This way submitters don't have to remember to run a W=1
>>> build of the .dts files and the grumpiness of the maintainers can be
>>> reduced.
>>>
>>> Signed-off-by: Rob Herring <robh@kernel.org>
>>> ---
>>> Well, there's a couple of warnings on 32-bit, but they look fixable to
>>> me.
>>>
>>> There's a few other platforms we could do this to. Sadly, they are still
>>> the minority. Otherwise, we could change the default and add a flag to
>>> disable (I_STILL_HAVENT_FIXED_MY_PLATFORMS=1).
>>
>> 64-bit has still few warnings:
>> https://krzk.eu/#/builders/29/builds/3710/steps/26/logs/warnings__6_
> 
> I may move that graph check to W=2. There's some cases where port@1 is
> optional and it doesn't really make sense to fix these.
> 
> Also, Conor wants to do this for all of riscv, but this solution is
> per directory. So I need to rework it to use a different variable that
> can be per directory or global.

Just to clarify, because I still have this patch in my inbox: I assume
you are going to send a v2 of this, so I drop it.

Best regards,
Krzysztof


