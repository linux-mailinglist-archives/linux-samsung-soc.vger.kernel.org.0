Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5006E43F8B1
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 29 Oct 2021 10:20:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232356AbhJ2IXR (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 29 Oct 2021 04:23:17 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:40636
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232373AbhJ2IXQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Oct 2021 04:23:16 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E10B73F1A3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Oct 2021 08:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635495647;
        bh=Bi4B10tf1+rkfIAVbvMvJJMvuw7D9Q/GbwyuK5RC4pI=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Nei5+d6iVMa0BT2o0faBi8F3sYbZGwmmlcLjm/5qwhfphIKzmQGBG5fBgp2Uh4SX+
         MMtTabl+jJknKE6V2QDts+bFcZuFlBeMiR21xPJbYyZcfYP2V1WDgo9s8OfWTAwWLq
         ZgBV8eUtw2elsYH7COJOVZrnr4k7C/WXmz9wG6/BzkX+sONYJQgBXcZFUcgd5vTLHT
         IR+cOwAHcU3vydgJGEDwtfQwfcWm4xlcvgRk8BpsQnTvuq5GzpqGdQ3bnxiZq9Df4N
         NwfOQo7UeIGNzHLDEJf+bZlLPNGDE7IBlKKMqkwBpb3V/ePdzEhGYkScM+nY2evwpP
         MLVZXvEY9LDnw==
Received: by mail-lf1-f69.google.com with SMTP id bq29-20020a056512151d00b003ffce2467adso3853140lfb.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Oct 2021 01:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Bi4B10tf1+rkfIAVbvMvJJMvuw7D9Q/GbwyuK5RC4pI=;
        b=3FX8dLKhFssYjbiEHbUaplL6AuK2/JJTwUxvrT2/5GCHVS1WnCoULaDTxXsQ/AMwp8
         YhJGX0XgtvvmiO3+l0Sm8/G3h9kI5ZRaAowvyu+cfUFRRWDelnmiW7IKSC3ovI/jPHMW
         OTqIE8YIgXInd3yTwt3Howy/EJ2zlBkCPOFUDE3BPzYugL/bEyB4aFyfoCaE7GyEXmgz
         Bh1GCu7vA+AEKvEdZmk1Ev2g8KphlBBMQyicCaCbJeT0XtYNzes51Qbcw8GLY+Chn5MF
         FXeA0psyKkS5+7eWmmLHIHQ0Y5k+BFuMVpG6MLL0tb0K1GdxSggFtNkoQ88bTRdNH5Dv
         dhPA==
X-Gm-Message-State: AOAM533fshhlc8zH7M3dBIhBsWQpciSG8TuaJaAgd4V7/U96dILllYLV
        bcbDMTxO/f1qHvDsL/CnQEKyr93g4O2We88CKnEv4pfnJVo4nLxuRsZuL1WbpWSs6fm8bkCUmoV
        31L8L7gZl7ipAyOxwqeipbIKQnsmbqNQvjf0tJwrywS5Cvf43
X-Received: by 2002:a05:651c:54d:: with SMTP id q13mr10390619ljp.239.1635495646969;
        Fri, 29 Oct 2021 01:20:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4pINxrptGOxH7NZYI5h0TvkcQmSgqzXl/LkvLtKkn6a+VY6u+tAk14SEoQws3XyvoryNK7g==
X-Received: by 2002:a05:651c:54d:: with SMTP id q13mr10390598ljp.239.1635495646778;
        Fri, 29 Oct 2021 01:20:46 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id 2sm263837lfq.239.2021.10.29.01.20.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 01:20:46 -0700 (PDT)
Subject: Re: [PATCH 7/7] watchdog: s3c2410: Let kernel kick watchdog
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
 <20211028183527.3050-8-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <94e19dfb-5283-8826-c421-0ff140a370ab@canonical.com>
Date:   Fri, 29 Oct 2021 10:20:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211028183527.3050-8-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 28/10/2021 20:35, Sam Protsenko wrote:
> When "tmr_atboot" module param is set, the watchdog is started in
> driver's probe. In that case, also set WDOG_HW_RUNNING bit to let
> watchdog core driver know it's running. This way wathcdog core can kick

s/wathcdog/watchdog/

> the watchdog for us (if CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED option is
> enabled), until user space takes control.

This does not explain why you move the code around. I guess you miss
here information that we should start the watchdog before registering
it? If so please explain why.

> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 26 +++++++++++++++-----------
>  1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index ca082b1226e3..9af014ff1468 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -732,6 +732,21 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  	wdt->wdt_device.bootstatus = s3c2410wdt_get_bootstatus(wdt);
>  	wdt->wdt_device.parent = dev;
>  
> +	/*
> +	 * If "tmr_atboot" param is non-zero, start the watchdog right now. Also
> +	 * set WDOG_HW_RUNNING bit, so that watchdog core can kick the watchdog.
> +	 *
> +	 * If we're not enabling the watchdog, then ensure it is disabled if it
> +	 * has been left running from the bootloader or other source.
> +	 */
> +	if (tmr_atboot && started == 0) {
> +		dev_info(dev, "starting watchdog timer\n");
> +		s3c2410wdt_start(&wdt->wdt_device);
> +		set_bit(WDOG_HW_RUNNING, &wdt->wdt_device.status);
> +	} else if (!tmr_atboot) {
> +		s3c2410wdt_stop(&wdt->wdt_device);
> +	}
> +
>  	ret = watchdog_register_device(&wdt->wdt_device);
>  	if (ret)
>  		goto err_cpufreq;
> @@ -740,17 +755,6 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto err_unregister;
>  
> -	if (tmr_atboot && started == 0) {
> -		dev_info(dev, "starting watchdog timer\n");
> -		s3c2410wdt_start(&wdt->wdt_device);
> -	} else if (!tmr_atboot) {
> -		/* if we're not enabling the watchdog, then ensure it is
> -		 * disabled if it has been left running from the bootloader
> -		 * or other source */
> -
> -		s3c2410wdt_stop(&wdt->wdt_device);
> -	}
> -
>  	platform_set_drvdata(pdev, wdt);
>  
>  	/* print out a statement of readiness */
> 


Best regards,
Krzysztof
