Return-Path: <linux-samsung-soc+bounces-1746-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7552384B223
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  6 Feb 2024 11:12:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E5F01B21EDE
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  6 Feb 2024 10:12:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55D9A12E1CD;
	Tue,  6 Feb 2024 10:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WAFP24jr"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612C412DDB3
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Feb 2024 10:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707214348; cv=none; b=DUU/MSD5DD80UoC7iHslYHLVMyQpp25rc2X/JfgTMbuJpU70yxDQkcQt61vt3EMJlNdhhvMWjYFmbdO4tCHzRBd1+Let2SGby6MDOrBpqAfwzg6eeaKGHXHOoXbiVnqtlA4N+J+u4JD3qL6XjvzHCVZ3OLBAvjgDmALrNYqovmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707214348; c=relaxed/simple;
	bh=2kkntFscAGFcilGUZcjv10/hbMY5Rc+m1vHakRck2HI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mgqS1B67b1sr7YiO8JbNpXULz1e5dUd1J4PXaAFhO8mnhD/UwLG+d09abvZvvzFFMi+Dn2Tl4SW2c5I90cKg9fEFc2rJllgVhB82YU+ZX48mIgBbCGRN+Ch1z+uK2UPvyKlyvM96HTYHOBWldS7IdxmDE2T6gKPGBnMw7Y1OB7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WAFP24jr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40fe2d3d5cbso3409645e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Feb 2024 02:12:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707214344; x=1707819144; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s4AKQc1OU+P/MBk5ClD2FgFCHNl8qCzWMztGeRi5aeM=;
        b=WAFP24jrTSKm52ElGepGpqZXKldNl3Am8Xrhjyr0nExC5UBiWtsD/CMDJ5N2ZWPbSa
         8vfWffNjJBA915sFzU3mGzqLotJroGCihzV4Lbpq4cpzFmobk3163IIEslzz0nvq6JOO
         tWToVtnJe1vOBBorA7/XZan2FhHeuXvjj/y7zRt+AS0zEtnwdlSsWqGycxKuoD7ez/I9
         pvroZGDaJsBlq11DhMDEyxDTHvY07tstRfHgBRIBWMsy7gJ1Na56/6Y5XvMD+mca1vd8
         HdswIKtRq46jinDyaY9ABbItwRiJRaBhsnr95nTXWwTEN6ciKSpE6784GIG8wSUiA4no
         7Fvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707214344; x=1707819144;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s4AKQc1OU+P/MBk5ClD2FgFCHNl8qCzWMztGeRi5aeM=;
        b=JO6EBDAzD133WgKU3RABhPkabefcmWwKuvglsQTh7dReY0p3SWjOooNynbMcv43KgE
         osxhktHLXW3F2L8xiTqbN/9fImLiu/7bZCkbfpJq2ImFNqmstjv9OiqspbafDvHc8BiL
         67R7gRHRIY18l7eF65dpYKp4JaERqP/onp8g3s5jufzfz9s75IyVJKF/o/82S8fXADIc
         jQYs11/7EF0deeHv5GcU/wQCzlQN9WoYWwdempdDNixJHeZ586QDst+d+ALXVnRcFOa3
         f2PAv0TLgFfoCA1NwXeUYbA8PZxRHk1YAZ4SZzJbxG9BQ//qisouFs48i+DcfGiDcljM
         CGtA==
X-Gm-Message-State: AOJu0YwCE2qJDbGO7v/BgINiz0VS3TnqPJ2cK6oe2pYu9BEXwJXrT+k7
	WnELr3PJM6F1xdoYeMbcFDPirXotE24otyxBIrTNgA5UbPSX7PRT6ilW53BgkcA=
X-Google-Smtp-Source: AGHT+IHeOMyRcoLpdZuoIMq70PHMoNO6cKBr77dSUsPF029rgNy+rf9D84ozJqkx37/VLgYDecUcDQ==
X-Received: by 2002:a05:600c:5109:b0:40e:ac4f:7156 with SMTP id o9-20020a05600c510900b0040eac4f7156mr1827991wms.5.1707214344636;
        Tue, 06 Feb 2024 02:12:24 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWPtp3JC/ANDqq97XXixhPbVr778Ixnvi73AOPWqfvcFc08X742MHN1hZ3XwSgdTUk2nmC+rxPhDXzsauPC68M+oBZcRuO5GO/tYrLQ9iz+PhM/YZsKdXyhGWGKQnFHH+jjmaMgI9L8RflpQTfdOtQjk4fAwc0tAXvbqO1CHBHSVyZERfguh20GEUIxOGduHnkV34pdJHuM6E8DPselTMWicX5u6B/bbvQ7i/T8dYAG9DHJmBJgp3L3wvn6oBH38yxQSYKeaRE6CDvSXYr0KJ0+x9m4HBtGRvGp+kKE6YHMnMJc/hvwg9SUk4eHvP0fhE+sB9Qzbyj/8KHzrw==
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id f17-20020a05600c4e9100b0040ec66021a7sm1484053wmq.1.2024.02.06.02.12.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 02:12:24 -0800 (PST)
Message-ID: <0a2604e7-8b30-4cf9-9099-ba3681bc5538@linaro.org>
Date: Tue, 6 Feb 2024 11:12:22 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] serial: samsung: honor fifosize from dts at first
Content-Language: en-US
To: Tamseel Shams <m.shams@samsung.com>, alim.akhtar@samsung.com,
 krzysztof.kozlowski+dt@linaro.org, gregkh@linuxfoundation.org,
 jirislaby@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
References: <CGME20240205082441epcas5p1e904f4f95852de3fd8663742ed5131df@epcas5p1.samsung.com>
 <20240205082434.36531-1-m.shams@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240205082434.36531-1-m.shams@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/02/2024 09:24, Tamseel Shams wrote:
> Currently for platforms which passes UART fifosize from DT gets
> override by local driver structure "s3c24xx_serial_drv_data",
> which is not intended. Change the code to honor fifosize from
> device tree at first.
> 
> Signed-off-by: Tamseel Shams <m.shams@samsung.com>
> ---
> Change Log:
> v1 -> v2:
> Acknowledged Krzysztof's comments
> Initialized "ret" variable
> 
>  drivers/tty/serial/samsung_tty.c | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> index 71d17d804fda..e5dc2c32b1bd 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -1952,7 +1952,7 @@ static int s3c24xx_serial_probe(struct platform_device *pdev)
>  	struct device_node *np = pdev->dev.of_node;
>  	struct s3c24xx_uart_port *ourport;
>  	int index = probe_index;
> -	int ret, prop = 0;
> +	int ret = 1, prop = 0;

I am sorry, but return of probe function cannot be positive.

>  
>  	if (np) {
>  		ret = of_alias_get_id(np, "serial");
> @@ -1990,8 +1990,7 @@ static int s3c24xx_serial_probe(struct platform_device *pdev)
>  	}
>  
>  	if (np) {
> -		of_property_read_u32(np,
> -			"samsung,uart-fifosize", &ourport->port.fifosize);
> +		ret = of_property_read_u32(np, "samsung,uart-fifosize", &ourport->port.fifosize);
>  
>  		if (of_property_read_u32(np, "reg-io-width", &prop) == 0) {
>  			switch (prop) {
> @@ -2009,10 +2008,13 @@ static int s3c24xx_serial_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	if (ourport->drv_data->fifosize[index])
> -		ourport->port.fifosize = ourport->drv_data->fifosize[index];
> -	else if (ourport->info->fifosize)
> -		ourport->port.fifosize = ourport->info->fifosize;
> +	if (ret) {

Are you sure that you are checking correct ret?

Best regards,
Krzysztof


