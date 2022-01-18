Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0E01492553
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 18 Jan 2022 13:02:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241191AbiARMCg (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 18 Jan 2022 07:02:36 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:47508
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241149AbiARMCf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jan 2022 07:02:35 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A76DA3F1DD
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 12:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642507354;
        bh=eZGgEJwb4k2AmPBX3xsd6X1+Izl+vWTMgTLmYq3TTjI=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=sZQ7N2mQJ3DPMnWzB9D4BjNp2O8Ynfl2Kq0eGb6acYRS1xlBjKlhwACb8J/ydaNrn
         HK91zlP1MUUVyovVbeaMtekU86/bxoCK5HsA+rmzi0bxHjGqJe3XBSDfjNz75zKeqg
         r4Ce5pZYrvCVD9uJ/JGLLbIJ/ZSDlxgZsIOyc80JxUY8ygrzSgz5TbhdZYkbwruzKL
         gieW/IrMLTclAeRCd81/9ckGqdPCV11MU06s2Rp639DaVSnAZMmi0Z+SoUwU7TxGar
         D7TrZjjkZKsz6bW/rj6HcTGPBrSOf1p8D8bNzuh3Jol/+z9FQHbe2yM24cV2VP3QZO
         5G81vaXRMwvRA==
Received: by mail-ed1-f70.google.com with SMTP id ee53-20020a056402293500b004022f34edcbso6104091edb.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jan 2022 04:02:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=eZGgEJwb4k2AmPBX3xsd6X1+Izl+vWTMgTLmYq3TTjI=;
        b=aN0G4nmEKFGmu3VUVt5U2xakhHjEtWPHLQZK4xDESDVbIUNTTSbjN/pEE6fDWw9fp6
         slqnWfbpclUleRZP/L2QkjAmGefMvRgtOQE1rwGDJ4UnovSQeBQqPAeRVAjnEg1y3KNC
         72/ninvDI08gtXNqlpDBbD0UN1DNH0q7YuIg9P6xwq9yEo72GPeK7UiaXu0RUOGC8abg
         oEpHptYMCNQKGSekIrruFARYP76n/DEm2rOBcvfZRW61kXv5A9tNYFFzEG7PXW4CGQhP
         aVpKsrU+/8IGC0unje+6aBsFfQQpUonJM3iNS2k21qCDALTHKLs9wy1c5uEGC8H74RMH
         uxVw==
X-Gm-Message-State: AOAM531UgI/aHAYVT9bKXym249HZcRYwaLwPAa2mkGgqPAYAPyODRyjW
        K98yTjqA5Ca/FWMdFp6NU2luhUaNuO0r1z1DinRKwf2N+54/rm5VCKkyWVv0pYSBNKqpeUz4B2p
        k2Ho9NDAxkGhjMgCnuKMbojOvlk3zKItGNzazbhPE4Z+CCSwJ
X-Received: by 2002:aa7:dc05:: with SMTP id b5mr25011243edu.46.1642507353965;
        Tue, 18 Jan 2022 04:02:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz9dWZZ+YLLdAVoevXZjPfCjTYNF6Ad+CsqISTbe8L31l1U0/jf3wKJ12FmDq7FvmjyBa8V/A==
X-Received: by 2002:aa7:dc05:: with SMTP id b5mr25011233edu.46.1642507353846;
        Tue, 18 Jan 2022 04:02:33 -0800 (PST)
Received: from [192.168.0.41] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id gn8sm5285150ejc.23.2022.01.18.04.02.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 04:02:33 -0800 (PST)
Message-ID: <48f61a86-e85c-2505-72f7-76ccae9a3817@canonical.com>
Date:   Tue, 18 Jan 2022 13:02:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 1/3 v2] spi: s3c64xx: Delete unused boardfile helpers
Content-Language: en-US
To:     Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Cc:     linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>
References: <20220118110928.120640-1-linus.walleij@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118110928.120640-1-linus.walleij@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 18/01/2022 12:09, Linus Walleij wrote:
> The helpers to use SPI host 1 and 2 are unused in the kernel
> and taking up space and maintenance hours. New systems should
> use device tree and not this, so delete the code.
> 
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Sylwester Nawrocki <snawrocki@kernel.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1-v2:
> - Split out to separate patch
> ---
>  arch/arm/mach-s3c/Kconfig                 | 12 ----
>  arch/arm/mach-s3c/devs.c                  | 72 -----------------------
>  arch/arm/mach-s3c/setup-spi-s3c64xx.c     |  9 ---
>  arch/arm/mach-s3c/spi-core-s3c24xx.h      |  6 --
>  include/linux/platform_data/spi-s3c64xx.h |  8 ---
>  5 files changed, 107 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
