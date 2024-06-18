Return-Path: <linux-samsung-soc+bounces-3454-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2DB90DBE3
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 18 Jun 2024 20:51:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C22F1F23338
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 18 Jun 2024 18:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7010C15ECEF;
	Tue, 18 Jun 2024 18:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B1CnBC4l"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A286157A41
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 18:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718736662; cv=none; b=rKMmklHbA8UqCzvsaj6D/MpgoGrs2EZAGROiVp29Cys4YQV2Y5xxmmGHyi4Vx74F1xoqzomJSq056tUfiKcjQE81sXauP0zNLmln6k70CoVsJ9TuCHejxxwSqmUYfREEU9cV3xsqs+XQuRL+b4QLnjHBohNp4etBIOZLSJRQyuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718736662; c=relaxed/simple;
	bh=NkHkzXa3IOCwA/bnH2ptoDEs9xXxwvdNDNIjWAKEBgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V64yMD64NYmAxD4Yv0IRunwZKGn1SWs70UVShSBrd+3mVec4gb+hNNL3D3nlBcube/Egwu29P7fcFtaOsUsB3QPREEwUzx6r+TVmEl7p4bkCthWxjZYWGmjbbvh4AzzyPh3MOglgYy/iKP/PgC15h1GL9H9g9oXveX1Uq8u8ADU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B1CnBC4l; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-35f236a563cso4493100f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 11:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718736659; x=1719341459; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4NNuHMGJgaTKLiPOtfYsc30dpCZBTyvx+s6PAIySkOw=;
        b=B1CnBC4lv0uxVhTJbMMGvOs0BWMpAcBioHJ2pf2C56XX4fYvC27/QDtazMbHCar/ti
         /kjpXDCVZcgA3iRYgkIaDHEEdYrP3oD+smcGm85WdlfdoaLXgUjAGnUrKbLiA8hg5P6R
         +Jl0IeOt29DLT9UrjIieWa6Z9EgT340zxob6iBgrX7g8cYxCeZ4QXOKeQZVD/eELbsq0
         cIviw/Buu7wB9o708z3WKx9xr40FCnBMjvzHg3IU8XDIPHZKkI6LU9JZzoWqJvSPaH4D
         8jdP0z9r1b1nDK32Pwa2ABEl8jjHKR0vycOf9ORWyqU5pJ5KxdY4BOTUNJcH8XxxV2AT
         OXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718736659; x=1719341459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4NNuHMGJgaTKLiPOtfYsc30dpCZBTyvx+s6PAIySkOw=;
        b=Z+5O5H2POgbY/0VJ6IjbUkzxzwsOt23fpxB1PXg55pxIY5a+TqtwUd6Q9W2zp1DpS/
         PFsjHBUtEIiEqsIzL8inrhxoQU4GssNN9oE7CJ4cGrB5gVaDu3WgHzmgnxBY0U8l4z88
         rNvpckX5hB7lrxW6/l9ngLP04uGeWjjyBHbfV0qyy/8ynHEfRLsNzV4cxflu0n0WJOHc
         09eQzYSLgLEap03pEmQVN/55Di4P39PTob7cZJLN3cLLpVny0WndQe1PFWn1c/vX5MCh
         UdjOdnvCzfqzvcqcNZnTfCY3EBgRGwBkxkaB0CizSVCSe+2ajEu+Zc3zHsh++m653Iwb
         L1aQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLYGAcgbx2JzWTa/yBc0leJMuN+MZcsCKMlF9xStkynlo67NvC9IuouSmhu/jqVkVMhUAeNPRD9wo+OipTXZYrtnAENnxUy7/t1hXX8Ncf08s=
X-Gm-Message-State: AOJu0YwjssxtBEOS/NFSP2IAvFFPPvESzMVECF6o0vSX3kuCViym60ik
	hLlRHuNN36b2DEcA/AS+JZ9tPB83jKUfvbQr5ccmyeqnm0GE+8InQXyuJyARX2o=
X-Google-Smtp-Source: AGHT+IEQ5dUal8MlXaC9EXR+oZ5/RpW012l22b3onGYiqW8pfuRDA//boP9uvD07m2VUMQn/ucFrhQ==
X-Received: by 2002:a05:6000:8:b0:35f:e0f:69a6 with SMTP id ffacd0b85a97d-363175b925cmr328399f8f.27.1718736658756;
        Tue, 18 Jun 2024 11:50:58 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:5d11:7fa7:8997:f811? ([2a00:f41:9028:9df3:5d11:7fa7:8997:f811])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509c8fbsm14732083f8f.43.2024.06.18.11.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 11:50:58 -0700 (PDT)
Message-ID: <ad04e203-4244-4cd3-9c9a-fae002962990@linaro.org>
Date: Tue, 18 Jun 2024 20:50:52 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/23] gcc-sdm845: Add rates to the GP clocks
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 phone-devel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-input@vger.kernel.org,
 linux-leds@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-2-e3f6662017ac@gmail.com>
 <wnf3mfgdm4p4f5wrxdtlx4wccnizdvohc7iiyu5t22eeb67r57@xun3r73hksrg>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <wnf3mfgdm4p4f5wrxdtlx4wccnizdvohc7iiyu5t22eeb67r57@xun3r73hksrg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/18/24 19:50, Dmitry Baryshkov wrote:
> On Tue, Jun 18, 2024 at 04:59:36PM GMT, Dzmitry Sankouski wrote:
>> sdm845 has "General Purpose" clocks that can be muxed to
>> SoC pins.
>>
>> Those clocks may be used as e.g. PWM sources for external peripherals.
>> Add more frequencies to the table for those clocks so it's possible
>> for arbitrary peripherals to make use of them.
>>
>> See also: bf8bb8eaccf(clk: qcom: gcc-msm8916: Add rates to the GP clocks)
> 
> Each time I look at the table attached to the GP CLK, I feel that it's
> plain wrong. In the end the GPCLK can in theory have arbitrary value
> depending on the usecase.
> 
> Bjorn, Konrad, maybe we should add special clk_ops for GP CLK which
> allow more flexibility than a default clk_rcg2_ops?

If we can somehow get max m/n/d values for all possible parents, sure

Konrad

