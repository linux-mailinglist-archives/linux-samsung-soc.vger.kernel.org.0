Return-Path: <linux-samsung-soc+bounces-2366-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E1B88AF88
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 25 Mar 2024 20:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69BAF1C60EA4
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 25 Mar 2024 19:13:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C16911CB8;
	Mon, 25 Mar 2024 19:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sIYy5YVi"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EAFA12B77
	for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Mar 2024 19:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711394024; cv=none; b=THTNDelFlsseR9XDRrc7GnBSSl2x03Dv8Y72TdXPjUhWof3s4vXTJDc8BBpqEnky6qq+u3qJ+QmX2QchwW+OtgmZMYjWhHkqCl4O1A1Dmf8PTy7dWdju7dXk1kc/MLTxkZ8Q5pyrKRX2WKkmH7yClBCwTGH6gB4UJSaH4fnF8sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711394024; c=relaxed/simple;
	bh=swZpm+FOboZ7NHTMfD+QKXlE30Z5OvwnQEYIKKKGXww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OQqES51+QQofdbscDY/TS4U0IC3M7n2oH5nfn5LLUHTT6tdFreR+1rOHrSBbpy4qLdoz/5fi6K1x7A00fmCb1unRAktUIP2UUvSNKH6+PcYWuqZqkYcsO3zT9haEFl9ckf06LkB+MFYl7jmsonNTFbr2GF3WpaKIUvyCliOrpLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sIYy5YVi; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so620111966b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Mar 2024 12:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711394021; x=1711998821; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nbzmB+zL0vc7kuIehiH4vjEBMbTsMZOL2LB5BPg0ugg=;
        b=sIYy5YViqKWOvjyvc2u0wJQTQnl/azBOnLl02Uyneg4B4OlicTBmvG2dJpwQCLbw3W
         fVFv8AumdWtd/zyBm8AmMrFEL4sWAZxl3CDV2KFZ/xNPKf7JvKruGFKKfIfOaN5+5hAR
         VFTVONPJm6JkDOWTNbjLG5dmt6v5NNtHtzJqBZ3pODkQIMM8LarTRCZfBbf0lS0CnoJ2
         cSN+bjlTUZ2NMtjl/fCvxUv9pGic5VCIKek4O06+JsGKF4Rrl+BM71YYEl0U1Sa2FMgk
         T733poCn7fw40NcLYQySivxsClkexLbaIfz5Y9WV1w589UN5M0MpZ+ElZ+KsBmHPRnwZ
         dnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711394021; x=1711998821;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbzmB+zL0vc7kuIehiH4vjEBMbTsMZOL2LB5BPg0ugg=;
        b=vQpN/xjsVDdEA3HRtPuAb58O7muKY2XSWS/l1wsYgoriIffUoy7fPESKI80r5lZEuz
         R3CnBsQ8B8GJqGl9aAnNY3S2C0+POi03CpP258Sz28WGQSfjWsAcaWjt+PO+FMA1zkNV
         /8Ge84RpQsf29l9WBNB7ik4e3assn0l91nxa14TRgxt/h3x1hFjJxlMB2ayfg1DKnShZ
         sdAkj7Ce6tzZ8tEQ2CxiBOy65Yqd/7UpJhDfI759kPzPvDtyLpYLuInzRLxVJNNvtFFW
         l+yiG160S4kCXLVLxchC6S6HyifnQtaKQ9fbHCMslSJY7uLU/wagwBU6/fl6es7t6Y09
         plxg==
X-Forwarded-Encrypted: i=1; AJvYcCVVBKcaHUsM4tT/7Zac6O1Num3/PB5G9ynlarFAEwqvrqtQbAGPBXiJOAeiFnVN03ry2S6In4HDnEzcCoSvnv2Rpq3bPr7YXwdzphVLAcM6ysY=
X-Gm-Message-State: AOJu0Yw09Tl3s3w5/aNgkpWwxMLbkBFhahxmT25rJ4gqDEoDPqbHp/CB
	N5rBCjNNc672VsmLxUPuJkPsq8Gjkv85A8y0EB+8yyiwtDmXtgBTiux8c8JzZu8=
X-Google-Smtp-Source: AGHT+IErnMv9U3X+pdCW9pSyAie/zQ5UpaM78VwNlo874bKymPS21a812lPQqez66q3x0vtFb7RmPQ==
X-Received: by 2002:a17:906:5d2:b0:a46:af60:7c72 with SMTP id t18-20020a17090605d200b00a46af607c72mr5353869ejt.54.1711394020607;
        Mon, 25 Mar 2024 12:13:40 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id y4-20020a1709060a8400b00a46bec6da9fsm3325673ejf.203.2024.03.25.12.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 12:13:40 -0700 (PDT)
Message-ID: <0c4c7bb6-3f94-4996-8d13-8214ee3debe8@linaro.org>
Date: Mon, 25 Mar 2024 20:13:37 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] power: reset: add new gs101-poweroff driver
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Alexey Klimov <alexey.klimov@linaro.org>, sre@kernel.org,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org,
 conor+dt@kernel.org, linux-samsung-soc@vger.kernel.org,
 semen.protsenko@linaro.org, linux-kernel@vger.kernel.org,
 klimov.linux@gmail.com, kernel-team@android.com, tudor.ambarus@linaro.org,
 andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com,
 alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
 elder@linaro.org
References: <20240320020549.71810-1-alexey.klimov@linaro.org>
 <20240320020549.71810-3-alexey.klimov@linaro.org>
 <4d5b2da7-2a45-4a9f-8a96-a6840d2751a2@linaro.org>
 <CADrjBPrthH4cKBpDeGV8u2ydErCJuqbdBhFQs+62k7bfPyJNvA@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CADrjBPrthH4cKBpDeGV8u2ydErCJuqbdBhFQs+62k7bfPyJNvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22/03/2024 13:25, Peter Griffin wrote:
> Hi Krzysztof,
> 
> Thanks for your review feedback!
> 
> On Wed, 20 Mar 2024 at 07:20, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 20/03/2024 03:05, Alexey Klimov wrote:
>>> +
>>> +     ret = devm_work_autocancel(dev, &gs101->shutdown_work,
>>> +                                gs101_shutdown_work_fn);
>>> +     if (ret) {
>>> +             dev_err(dev, "failed to register gs101 shutdown_work: %i\n", ret);
>>> +             unregister_keyboard_notifier(&gs101->keyboard_nb);
>>> +             return ret;
>>> +     }
>>> +
>>> +     gs101_poweroff_ctx = gs101;
>>> +     platform_set_drvdata(pdev, gs101);
>>> +
>>> +     /*
>>> +      * At this point there is a chance that psci_sys_poweroff already
>>> +      * registered as pm_power_off hook but unfortunately it cannot power
>>> +      * off the gs101 SoC hence we are rewriting it here just as is.
>>> +      */
>>> +     pm_power_off = gs101_poweroff;
>>
>> So that's a duplicated syscon power off driver. Why syscon does not
>> work? syscon_node_to_regmap() does not return correct regmap?
> 
> Yes, for gs101 the regmap handling PMU registers is now created by
> exynos-pmu driver and is obtained using
> exynos_get_pmu_regmap_by_phandle() API. That was required due to the
> SMC call required to write to these registers from Linux.
> 
>> If so,
>> this should be fixed instead of copying the driver with basically only
>> one difference.
> 
> Are you suggesting we should add some API to syscon.c that allows
> regmaps created in other drivers like exynos-pmu.c or altera-sysmgr.c
> to be registered in the syscon_list?

Yes, I think this could work.

Best regards,
Krzysztof


