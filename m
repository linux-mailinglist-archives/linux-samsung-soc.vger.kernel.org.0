Return-Path: <linux-samsung-soc+bounces-4278-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DAF9521B5
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 14 Aug 2024 20:00:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 04922B26FE3
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 14 Aug 2024 18:00:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDEF71BD4F7;
	Wed, 14 Aug 2024 18:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xLhnetR5"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBE41B4C3D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2024 17:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723658401; cv=none; b=mnJmXXDJQyTFAaHT8X9SfMtSZvI/5mxL3CTvPXfNlsura6Whqe84Xfz2hbeHacgtOo7QZW0oLXaJtBwCZ/Nv8zHAG/o0zxPCQVrnDzV7OLMguey+BH+9JqfoOUDFL3vsUmok2P9URu8MmvjuwnS+YRyq+MRYrxlRHzw+unMCmT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723658401; c=relaxed/simple;
	bh=gK4sRcaloHcln7TAZ92Aeomv4OGrsTEcLGBDbt0X824=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mc3vmFyWTJ/mddbbP4rG4j+AGvaNnVgMg3bOP7Wq96T6KrG+m3GsDv9Rx8RfCDr7/wg8jpATMKpxeUOlRcEZtsiY4L4Ejr55DDbKVXzfCw3MMkpToU3rnZrLKEs+qNosJKP4pYRUqjXB5j4O4eVwgwmNvlRauGE3uiZ1y/Zmut4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xLhnetR5; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-427fc97a88cso580255e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Aug 2024 10:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723658397; x=1724263197; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e+0+18kAd1ntL3CjGet64KYdk8UF+VMULzQLsO5d54Y=;
        b=xLhnetR55buFiABKFeBzWOcMjZ8dTUU/qL86wAkRHXLEl/4PIe4rMXbXDThQJPw+Oe
         Llovii2JIP7UGH3shLUXZXMauOEiuW+BIbg9ZPB2nMaPEp7iPduCQFCbenZYhtkdNCly
         0a86I1TiFFjb4xuJvv1fV3j5P4irtDXazo3YJvXRKW2lvcBzmPmthDM/pL3ig75HJmwC
         GRwRh17Nat0v3HQ3DxwsY2FuniP6T/kxD7gKESugofxEvCFUuTII9EkB+SzNqwKQ3T93
         NtpU3T5W1Q1ME3+wmIZtNng5S0SOcvYu7HHvfP0RuvoDCGtRFaTSRJg2TZzydOBjWJ1J
         2zvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723658397; x=1724263197;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e+0+18kAd1ntL3CjGet64KYdk8UF+VMULzQLsO5d54Y=;
        b=CKJF9KlKaRhtKiDUt5yC2b4AX7C0TxpGMu6LO+k5N3+wfABkFqnvylfDAr2H9Cd/7Z
         uQMa5uAQJSpD52nQoyL+aE2dgS8ygqUJ9WIXiKw6QhCMpgLQfaw/DtL/JOTK71PGvNEH
         5xCXsXIHJ6rpCmNwJyIrgnUaVuCTFv1cU0UQz03kGIkv9mdvkMFcmwSeZy6yR6atcVWy
         k9YwS0EgEtYA2mgaIM7EIiVNTUCddidOIGlSzv/LQW2x4IlOPwaAVV1uQwUb46FIJ0yC
         bkg3k67u6yhhs0Fz8jBGOFRfybaCqk4O+ddL7Oiypi2XkthNmb97J0J8ikwHRCtOAKjS
         aEaw==
X-Forwarded-Encrypted: i=1; AJvYcCXrcCUYINxnON01nM5nTKSoiRm6tiJr4ZbmFEGjs28pKlPRrX+UjIZICRO+lAoCCak7QSeX1CUXI1gkRK/K/2ffWhA5HVB87wukNG9zjN6j4Rg=
X-Gm-Message-State: AOJu0YywyFLibNKwrvkO6L5cXJVIa1IaHVyPiZcRxqUUM7d8hBoK7jhD
	Z8YDxKOKwl3m8UOV1UTTelUwIYbMn7eA+zSeASSo5B7nFjksoRilvQWN/jznwi4=
X-Google-Smtp-Source: AGHT+IHv1VcCnmzCbrSFCmf9TtFXDTUTp/2jtxGlOatGsJT2eISwIhRuCQHwm7HglJURgLzYox3Nqg==
X-Received: by 2002:a7b:c385:0:b0:429:d43e:db9e with SMTP id 5b1f17b1804b1-429dd26701dmr20162985e9.36.1723658396976;
        Wed, 14 Aug 2024 10:59:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36e4c93714asm13400232f8f.27.2024.08.14.10.59.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 10:59:56 -0700 (PDT)
Message-ID: <64af1408-d3c8-495b-a69c-7a0718eadfc4@linaro.org>
Date: Wed, 14 Aug 2024 19:59:54 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] memory: stm32-fmc2-ebi: simplify with scoped for each
 OF child loop
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Lukasz Luba
 <lukasz.luba@arm.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Santosh Shilimkar <ssantosh@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-tegra@vger.kernel.org
References: <20240812-cleanup-h-of-node-put-memory-v1-0-5065a8f361d2@linaro.org>
 <20240812-cleanup-h-of-node-put-memory-v1-4-5065a8f361d2@linaro.org>
 <20240814174502.00003b2c@Huawei.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240814174502.00003b2c@Huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/08/2024 18:45, Jonathan Cameron wrote:
> On Mon, 12 Aug 2024 15:33:58 +0200
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> Use scoped for_each_available_child_of_node_scoped() when iterating over
>> device nodes to make code a bit simpler.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Might be worth using dev_err_probe() in here. Otherwise LGTM
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
>> ---
>>  drivers/memory/stm32-fmc2-ebi.c | 8 +-------
>>  1 file changed, 1 insertion(+), 7 deletions(-)
>>
>> diff --git a/drivers/memory/stm32-fmc2-ebi.c b/drivers/memory/stm32-fmc2-ebi.c
>> index 1c63eeacd071..7167e1da56d3 100644
>> --- a/drivers/memory/stm32-fmc2-ebi.c
>> +++ b/drivers/memory/stm32-fmc2-ebi.c
>> @@ -1573,29 +1573,25 @@ static int stm32_fmc2_ebi_setup_cs(struct stm32_fmc2_ebi *ebi,
>>  static int stm32_fmc2_ebi_parse_dt(struct stm32_fmc2_ebi *ebi)
>>  {
>>  	struct device *dev = ebi->dev;
>> -	struct device_node *child;
>>  	bool child_found = false;
>>  	u32 bank;
>>  	int ret;
>>  
>> -	for_each_available_child_of_node(dev->of_node, child) {
>> +	for_each_available_child_of_node_scoped(dev->of_node, child) {
>>  		ret = of_property_read_u32(child, "reg", &bank);
>>  		if (ret) {
>>  			dev_err(dev, "could not retrieve reg property: %d\n",
>>  				ret);
>> -			of_node_put(child);
>>  			return ret;
> 			return dev_err_probe(dev, "could not retrieve reg property\n");
> perhaps?

New patch for that... but just mind that deferred probe cannot happen
here, so only part of dev_err_probe() benefits would be used.

Best regards,
Krzysztof


