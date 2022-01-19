Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1286E4935AE
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 19 Jan 2022 08:43:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351620AbiASHm4 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 19 Jan 2022 02:42:56 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:55000
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1351544AbiASHm4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 02:42:56 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5F14F3F211
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Jan 2022 07:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642578175;
        bh=mobfvpRkY9BTXvz2dBYlaHUJOSiUxXxS0pbTEQukDr0=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=OiwzY1nkpB4WHSvmsV47/wIxpTsX9OJrP8cJn6OOki+mZoMRKDJVYuL00oeFskwI0
         wOmxpCr6R0YXqpNAkViu3YiVx/nS/Nly3FjTsueVqwitr1aStDBeLkuhC6RAwDiiNS
         mn4ci6VNnNWYC872LEV3WYNMiV9dDGx/rl7s+X1yiKk5J7Yn7OgLKTY4Rj0WMzKNgG
         ZbEgJ7C/+TasnWxjVXsFaIc63ez7To4kAneXTXyGTJWSkDorYQxzpPq2qSQFq+tDbM
         C5Lf0hfWR/lrVWuKJfRcJ03Tabqmot+ptHaD/D544BIPU2BCArg0dPrXw1EbGn0kOl
         5RM7N3tWV/9yg==
Received: by mail-ed1-f72.google.com with SMTP id ee53-20020a056402293500b004022f34edcbso1462512edb.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 23:42:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mobfvpRkY9BTXvz2dBYlaHUJOSiUxXxS0pbTEQukDr0=;
        b=T7cyV13AY3Att0RR7hJMBRQ2mRD95pdlZlCRmHx1VnTgok0VdKm9GkYUWLYjRBTqZU
         fHdks+f9S6xGno/vDRZX7IbdtTDn9PZDjlV3mow81I/KiaJM+lMRnwqY6AaZPpMzD4u0
         pyZQ8VK3Q+guNuJgk0TCfuvOmPSCcWPb8v+QRL+DA2SRqFEvP9s/u95IvPBD8nKOtFCC
         246zxQGX3utiymIeBnaEUNx/9g4X0YhqZLZgMjwmBi+AKheQELcb36MZu/3m+zpI9J7G
         doKBvvjVJ5TGW6M15GE7Z80E0EmuafBNHhx/PL0Nf7QsgkgR2GGXNZI5H4ulfnQADssr
         iI/A==
X-Gm-Message-State: AOAM531M1NFC0uiTgA3o7mDNQpUrCCV/6XtDXvD987ZklXPwDfU4d5oz
        nqq3tYkIJIpMwwWFEK61e/Wfb6Rvtvcw3QoPwxmd4rvXfWFJ8ng0HFeamYyZ72RkH+POK0jffYf
        MNPxN0L6kshn3JqnWDocK2upk9Pdd8qEYhNnJMxKibd17+zZU
X-Received: by 2002:a17:906:1e09:: with SMTP id g9mr22773278ejj.37.1642578174784;
        Tue, 18 Jan 2022 23:42:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxyVB8e3NpTCHAbBG19K9xGl2wiaX9fPzOn3eaI23ml+9C110AHTUlc8a4fsM8/nZDOu3Et3Q==
X-Received: by 2002:a17:906:1e09:: with SMTP id g9mr22773273ejj.37.1642578174594;
        Tue, 18 Jan 2022 23:42:54 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id x1sm6213922eju.18.2022.01.18.23.42.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 23:42:54 -0800 (PST)
Message-ID: <47891d3a-11fe-ea2a-b2ac-296a51a86a02@canonical.com>
Date:   Wed, 19 Jan 2022 08:42:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 2/3 v3] spi: s3c64xx: Drop custom gpio setup argument
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Cc:     linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>
References: <20220118230915.157797-1-linus.walleij@linaro.org>
 <20220118230915.157797-2-linus.walleij@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118230915.157797-2-linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/01/2022 00:09, Linus Walleij wrote:
> The SPI0 platform population function was taking a custom
> gpio setup callback but the only user pass NULL as
> argument so drop this argument.
> 
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Sylwester Nawrocki <snawrocki@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - No changes
> ChangeLog v1->v2:
> - Split out to separate patch
> ---
>  arch/arm/mach-s3c/devs.c                  | 5 ++---
>  arch/arm/mach-s3c/mach-crag6410.c         | 2 +-
>  include/linux/platform_data/spi-s3c64xx.h | 4 +---
>  3 files changed, 4 insertions(+), 7 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
