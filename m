Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E267F434527
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 20 Oct 2021 08:29:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbhJTGcI (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 20 Oct 2021 02:32:08 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:50382
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229741AbhJTGcH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Oct 2021 02:32:07 -0400
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C0BA63FFEE
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Oct 2021 06:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634711392;
        bh=+C7j6Axj6CVrWYcGUbunCsR2ObDM60EbLz6FdNE8UeI=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=HAaGIRbiXpm5WWudYMgc5kEkp2GaoQ++Ms06w2I429+pRQHB8JCOLw5bD8ohwga95
         gG4QlDRH7Y96gWXHi55dU8SGehfqLLaVFNjQZogADJWQ1SeptQ7cJdmxXYBllGC4p7
         p2m6fUsyYmlOytm0Yr/vVjK0ybfsee5V+1vLaPHoFues6TwJa4TEoIXVtWJZQ1Ud7F
         ve+tNEkRdpi4wwH+Cm3v7luQxqlG6zjUme2isdF29axrm3TdgqQvwWZYwAxHzCkzw1
         JVUViCspi/hY9PFDDJsnnAXEF20D6ert1gLSpj1BDg2sD8XKrsF4AJrReaEUq+guoK
         ZqpMLXD+Eiv9w==
Received: by mail-lj1-f198.google.com with SMTP id 132-20020a2e058a000000b00210aeaca823so1411900ljf.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 23:29:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+C7j6Axj6CVrWYcGUbunCsR2ObDM60EbLz6FdNE8UeI=;
        b=7nrpHr3eNZLluzMs4yqnq1gRrRBr9JCzo3PnDQl1jSj74++jUCs4PzSUY8+Rm6t6y0
         +3dn+HGEZn7Thc05dChulf8biaSXZOoztgfXdvEXGsL3ARlYWoJL4U0q7vS3kOjNt5DP
         Fx4bWzF0pPsQIkoIBr4rpmVwI3lAQOIEkMzEb1iLIIRkEzagy3uG1i5uNLuue15+LjOz
         aWpo0PPnIKlcBVdCESh3DxlcLeZdXtMyMjj312KKkmF3Ij83CpIJIhEr1CBsHn/CxgWK
         yqUS6dSooJc/HIKqJGSOAVKHm9outf+hvGZy+T73xkzzR9YfpawK4qn4bKRwZChttGpC
         pACQ==
X-Gm-Message-State: AOAM533o2CFvUh//SZBt23+pavc2T7RPDZF0LNfgIeHDgpOosjsd8fBA
        G6MZ9GCdeFat+zLFoDI40xAOHEVgV/h9V7rCwIzmRsIkrJMavsPuuTxmVCTW97qUjav5QVJrX4p
        VphB2QFYbL0OzwJekIEtNkuhB7qMVF/CqfD/LvjLBVFaAJoFV
X-Received: by 2002:a2e:9f15:: with SMTP id u21mr11438655ljk.312.1634711392119;
        Tue, 19 Oct 2021 23:29:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwP5WwHr60sUzj/tD2gAs9X9/L3PPyPtv3HiPteVRciCfCIKtbIUfpTo9xXxZBqO5b7GgYmbw==
X-Received: by 2002:a2e:9f15:: with SMTP id u21mr11438634ljk.312.1634711391910;
        Tue, 19 Oct 2021 23:29:51 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id g10sm111551lfu.103.2021.10.19.23.29.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 23:29:51 -0700 (PDT)
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
References: <20211019131724.3109-1-semen.protsenko@linaro.org>
 <20211019131724.3109-3-semen.protsenko@linaro.org>
 <6dbd4812-bac3-55dc-108e-c322e8a493de@canonical.com>
 <6ce55971-bee5-1bc9-c3a2-28e6ede37401@canonical.com>
 <CAPLW+4mE09AOSco+X9qE=1sjXvNVkOxtJqur+HoBJExxiw0J=g@mail.gmail.com>
 <YW8E6oeIoRdpmPL8@piout.net>
 <CAPLW+4k26qZDug4JkuPaM_gZMgz8LPg7GHe-5C7zKzEGtzdp=g@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 2/4] rtc: s3c: Add time range
Message-ID: <effeb83b-7923-7086-5b4f-36266015e137@canonical.com>
Date:   Wed, 20 Oct 2021 08:29:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4k26qZDug4JkuPaM_gZMgz8LPg7GHe-5C7zKzEGtzdp=g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/10/2021 21:12, Sam Protsenko wrote:
> Krzysztof, do you have by chance the doc for different SoCs supported
> by S3C RTC driver? I can implement proper values for min/max range for
> each SoC, as Alexandre asked, by adding those to driver data. But I
> need max year register value (100, 1000, etc) for each of those chips:
> 
>   - "samsung,s3c2410-rtc"
>   - "samsung,s3c2416-rtc"
>   - "samsung,s3c2443-rtc"
>   - "samsung,s3c6410-rtc"
>   - "samsung,exynos3250-rtc"
> 
> For example Exynos850 TRM states that BCDYEAR register has [11:0] bits
> for holding the year value in BCD format, so it's 10^(12/4)=1000 years
> max.
> 

I think all S3C chips have only 8-bit wide year, so 2000-2099, while
S5Pv210 and Exynos has 12-bit (1000 years). However I doubt there is big
benefit of supporting more than 2100. :) If you still want, you would
need to create the patch carefully because not many people can test it...


Best regards,
Krzysztof
