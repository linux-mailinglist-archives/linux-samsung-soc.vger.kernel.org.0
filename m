Return-Path: <linux-samsung-soc+bounces-2187-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D618704D6
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  4 Mar 2024 16:08:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A1C81C2136E
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  4 Mar 2024 15:08:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 604A146B9A;
	Mon,  4 Mar 2024 15:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BczQ7PZ0"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E9345945
	for <linux-samsung-soc@vger.kernel.org>; Mon,  4 Mar 2024 15:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709564886; cv=none; b=iiWQfmPruIf8ncnZ9yELvaO9dErFmC/9XMTdUURx59ulBJw/YYi8IWFMMTQyokb9mXwZGENFDWfWfwv1UzY1SQ7zytFkBaAZK2R4GnCU8VCxfMkXPxfF2UT7QQiRjjLBMBNh9QZm6gcSItv9T5g//dr61CLgpNYJ2BzLkmnmtIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709564886; c=relaxed/simple;
	bh=w3PBycgE5KHNjiwIZFWtuv3cryHmosPTHisjae3Cl9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pnwaSvZdlxP/Qz1M6WlzxhgNvNNiPCwLEU1gmPov8MZEC+kqVVE02scVHhQEl7yQD5aVcYyI1m1YXVnVLywoG+BH5moHSHk7bBKEGXw3oJm1GmPGy6IKNsugxe6JCygZ2JW79du5qTw07URcizrfIkpcvgcM7vDel5ls/7p2MNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BczQ7PZ0; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-563b7b3e3ecso6995775a12.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Mar 2024 07:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709564883; x=1710169683; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yTt/ssrM4/gkwMB47Vt7DZXgM+Jjq2XnZKPPn4t0qGA=;
        b=BczQ7PZ0o/sUewHHJUOF42Vzz1Q5iUKHKf6acHFhLAGVgXJ51ihiPwOVOeuatpidZ6
         SOUb0mhsYnAVpF8TV423IO5fmR32C2FW9BwoDDBnl0b53UY2HFaGh34sUHfi+K0xFgFB
         3fWNkkGhI02mFwo+E2ZLM61uKM+y9af6/Tfrc/Mb4gIL92NavsHf8jApKiGH7K/g5rM3
         8O/0hjAqJtlJ1cUGRgxgkEbaDIHbnXvxsStG/Ku7P3jpdkOaYhIaCNanXG66W46gVbxL
         LYwSeG6HUd/F+lexzdCyDNsxr2nee3zIl4rTmfQlMCDOzxnswhmNt+jkUxC1CjNTl4g7
         u7rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709564883; x=1710169683;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yTt/ssrM4/gkwMB47Vt7DZXgM+Jjq2XnZKPPn4t0qGA=;
        b=BQKew3o9HVjzdB1Sw6p2JUytkG2nI7wE0X8LckkWnCR1VehXIdQy3S+JE/FvrZsTIy
         shgdQZ4WqOeKFratSas9tgczIUyUTRFqJRBnVNi5prl9ZZn1TvUysuIINpKZGyRz6+e4
         DEe395vyiBTYjAJR7D8JvjcmwgBdYzioVFvxnB+XYXRspUjDMzpC2mne28yC2D5X8k/4
         nh8DENFnFrMF8csfnIWD3hWmJBhkEtdNwrLF/rx/naVO7GDncz9pDLinzRoSBQ7dRF2m
         JE8ApKfzRWHcic/ZzFfIAf9q1XR2T8GT7MnAfX7PbcJRAR5Oo/UfOEuRs4cIyPVArrFI
         jIcw==
X-Forwarded-Encrypted: i=1; AJvYcCXHEdj/uZMAQADrn+/tzwQ9RAR0UVAQF2OJZh0IEsCz3FaFD5Q0xw4IIjqeA+oEmyGjIoQACvysHPBmUm02hB6C53faR/yNCkE6crYdq9uQT9g=
X-Gm-Message-State: AOJu0YyRUIR5ra012+VZ4Btnp9a9Mt05kqWIaz+Hw7cnwo/Bysdq3iZ9
	uiRlEOou9vMB+eRTrxp9XsT3vo8m7YNE99NggvffMoxGuPrKbapdQlgnNhjnnFY=
X-Google-Smtp-Source: AGHT+IHnciny4I2qRm1qkWET3GolK2plGnmIVTtngvfzF42asVksmki7HK7pXUzMc2h5OnMgpclnUQ==
X-Received: by 2002:a50:cdd0:0:b0:566:3f3e:3a23 with SMTP id h16-20020a50cdd0000000b005663f3e3a23mr6142390edj.1.1709564883036;
        Mon, 04 Mar 2024 07:08:03 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.97])
        by smtp.gmail.com with ESMTPSA id v3-20020aa7d9c3000000b0056629f5de88sm4687133eds.61.2024.03.04.07.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 07:08:02 -0800 (PST)
Message-ID: <1f4a2ada-0867-4ee0-bf27-4d69ab85b2e4@linaro.org>
Date: Mon, 4 Mar 2024 16:08:00 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: exynos5: Init data before registering interrupt
 handler
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>,
 Jesper Nilsson <jesper.nilsson@axis.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@axis.com
References: <20240304-i2c_exynos5-v1-1-e91c889d2025@axis.com>
 <vpe5jvnhz3r5cpfiofwrelp62awe74knbxrz47i2deflczx276@yahhrshr355r>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <vpe5jvnhz3r5cpfiofwrelp62awe74knbxrz47i2deflczx276@yahhrshr355r>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04/03/2024 16:04, Andi Shyti wrote:
>> -
>>  	i2c->variant = of_device_get_match_data(&pdev->dev);
>> +	if (!i2c->variant) {
>> +		dev_err(&pdev->dev, "can't match device variant\n");
>> +		return -ENODEV;
> 
> return dev_err_probe(), please.

How this condition even possibly happen? And how is this related to the
problem described here?

No, don't mix two different issues.

Best regards,
Krzysztof


