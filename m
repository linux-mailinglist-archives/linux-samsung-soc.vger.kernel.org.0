Return-Path: <linux-samsung-soc+bounces-1099-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D45B3835FE9
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 22 Jan 2024 11:43:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 639DC1F230BE
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 22 Jan 2024 10:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA20F3A1BB;
	Mon, 22 Jan 2024 10:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x4Q7PVWx"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163883A8C8
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 10:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705920218; cv=none; b=jLuNfg2RBWwf7JzqKP+K5SgYs/ZUE2hvgnxhTBAPq3DAeUhHzp/fm7/OpWRoawWEmGzKnOUP8CoLHr04duAx7UbaoSZO7g0MaGUZhSWfMR5WRAHkGaoTtH+FXJSktXEBvL1bD25WKPC0HSYA95MCKUOS6gH9/Jzae7WEBY400TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705920218; c=relaxed/simple;
	bh=G2rg0RVpaJXoTS1t+c88MQAG+n4RDZSpAdanbEIai+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Epwm8L1fkxGUbRr2Wa5epg8P1v11uD87uq8BjytexsBNS3qwBfWqPbazL7Mxzycv8NJieXHQFYDN94nDA7QOSsGX/YHEQkf/0D9vyLbxGZ8DL55had/fahrfjjUF1p9g9nAaR3YoRQiN1WtI+MdG/ZAcFBbJYPo8S5iaVoK3IdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x4Q7PVWx; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40e72a567eeso36923875e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 02:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705920215; x=1706525015; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WJi7Kub9j8XPpjseteV7fOmuOQUAq2I8Psbou7iQhJM=;
        b=x4Q7PVWxPGhJqInLKSCkvWynkEPzgBHAJYFJF5OzqjQ32BJWZ+2NEM0y0bnobugelH
         1iyuNEDL2BiMLHoOygocjGpO+GDH5Jg81BGcfPkb469yevrXYurX8zv1hRgRqsBaxmK4
         LqoacyfKnpcF0yCa5aClhMruzw5dkZGAzvstH0b5an9DdFsd4MbaPyOIsRnLC3/TVB55
         a7wrPwURE2DwxHdOleSBjhERBwXbcCCaWbfV6yKwuKXqqaU+NwKDggeHWXJVqYrDDz3+
         qs/MHXXKbDMFwcqKUbgW97t1p3PP2B5SqtymxWTIhtqAPWP9C/BqeZjCT4OB50MuqUpt
         4KlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705920215; x=1706525015;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WJi7Kub9j8XPpjseteV7fOmuOQUAq2I8Psbou7iQhJM=;
        b=iFygj4/OpoUEihb4U2GzQr+oa8ZlHOSzpWSVVH87oxWCq8r7e9XRx0j5IJIakeXB66
         XOQ+gaKM00IAF1AOmOCkMxhv9uxUIO/MxNxrqYjfDWfiaCQlnWzbyDb118wN5IhW3jBG
         Ojl8BZlhQgU7eveKCY8Es1GBGQE4lhpCJuyeTUvtsbpiEd8VA+E2BH/QCdgy0qIMU6HP
         C8MqTnFkSw9IjJLxhtKtdGegXQ62bw252pNowqkQJU8Oq9mZDE1jUQKFTDyo0nKQTguT
         gSY1UfHgsqVFRo5EJM+HbIVdAAmnmCdPpq9Vk+n/vfxXOMXrBVku4ZfdQhaNpyXIAvLm
         bpXw==
X-Gm-Message-State: AOJu0YyqHUOQlgZCLZ2ZmsJezGhXQxCDMPVH7qcd4dYYaVDPVNfAoXNz
	3rM2IwQs9FZQjdTxHSYShnN3IGs/+gyeQKfyW2EefSVyjfqCJoK+iG2oVm8hWUQ=
X-Google-Smtp-Source: AGHT+IFoYnkKnsRHvrlIPiQE2GjoOtTAKR19xj4/zyQto6Ii4NPZpSR7Ig0V7sKmpr7tGMeG/mTGkg==
X-Received: by 2002:a05:600c:2ed2:b0:40e:72a7:9536 with SMTP id q18-20020a05600c2ed200b0040e72a79536mr1147079wmn.316.1705920215442;
        Mon, 22 Jan 2024 02:43:35 -0800 (PST)
Received: from [192.168.1.20] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id bg42-20020a05600c3caa00b0040e3733a32bsm42115898wmb.41.2024.01.22.02.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jan 2024 02:43:34 -0800 (PST)
Message-ID: <fe1afd93-28d9-43d9-89a1-111265bf0999@linaro.org>
Date: Mon, 22 Jan 2024 11:43:33 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: s5pv210: fix pm.c kernel-doc warning
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: patches@armlinux.org.uk, Alim Akhtar <alim.akhtar@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
References: <20240114052751.17242-1-rdunlap@infradead.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240114052751.17242-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/01/2024 06:27, Randy Dunlap wrote:
> Use the correct function name in the kernel-doc comment to prevent
> a kernel-doc warning:
> 
> arch/arm/mach-s5pv210/pm.c:61: warning: expecting prototype for s3c_pm_do_restore(). Prototype was for s3c_pm_do_restore_core() instead
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: patches@armlinux.org.uk
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org

Several checkpatch warnings:
WARNING: Use a single space after Cc:
#12:
Cc:  <patches@armlinux.org.uk>

WARNING: Use a single space after Cc:
#15:
Cc:  <linux-arm-kernel@lists.infradead.org>

WARNING: Use a single space after Cc:
#16:
Cc:  <linux-samsung-soc@vger.kernel.org>


Fixed and applied.

ount: Size of the ptr array.
>   *

Best regards,
Krzysztof


