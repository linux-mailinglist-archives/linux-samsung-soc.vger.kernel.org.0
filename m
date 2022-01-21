Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 597F7495C0C
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 21 Jan 2022 09:35:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231162AbiAUIfZ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 21 Jan 2022 03:35:25 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:58034
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232805AbiAUIfY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Jan 2022 03:35:24 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6FB354000F
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jan 2022 08:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642754122;
        bh=h7b33DeTvzBNpVO9xtR6SrRKZdczqz3V7QKsSMc1HTE=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=A2Hur4/zqseoVGUm4gZnVoWWlVcUaOEaNTWwDL3DFhmjpNhWNS+Slhz9uGdn9zfLo
         cG0bSMOohQU1AUsX6cKWu7+5cOGcv6ATrrLSAi4Kx6xAzEBrK4uwlvn+eSHGwV4lWB
         2W2GSLkClNSuGQhmKa279Fa64hvCSG8jq1vINLEd4umeGsfaPiJ57SER+o3MWDlzW7
         QNyqncIgPfTJHgYRLlX4SqK83yZbrpPubReh2R8GYl+1/eNrkiruYfy33zRWUk49Rj
         Q7dgeP2xUAcjoCJoaQ5IRQISqip8ULHh86HqW978YSGHO/B0FwVm9rbFlJS2KnUSBT
         aXmb2wOyEu1yg==
Received: by mail-ed1-f69.google.com with SMTP id o10-20020a056402438a00b00403212b6b1aso8359950edc.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jan 2022 00:35:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=h7b33DeTvzBNpVO9xtR6SrRKZdczqz3V7QKsSMc1HTE=;
        b=l1Dir6PPZfNJvx727kalxxKERQcQjQrL2TDv6+ZCj//X2cZ1meywDVwKHYfLEUZidP
         aaHxFH46LivDbk41CPxKrH05XaZ+USahhdYPiz7nI1b7vIOnAeDw5mMPouH78bGzfFl7
         qvTZ0eHvLzPXWqOg7koE7X8FENxKEO0mumam2fF9n8iTtWZ0d6OacV5ZeSgH2QrnW6/k
         4pahV2HWhl68naHnkreV1daDSZFdOzopWSBOgo4WCyA7b10/usazehvBECO4xcny8kQC
         kRNFwER2GtvbRmiOcwVImuWZL5Sw+yznVC4PqfzsA77LXwE7YiywcpwMA6pt/wMct1mY
         HXqA==
X-Gm-Message-State: AOAM533efoL4mnLOb3oznqo3vGeKhyHqMwATam03easU+mXAw/no8l9w
        LdAdWbDV5Oi8zlJCtDS73E9m+ptg2+NWUKzmbNy6fqJJz8OQq/Z6/6ATMkkd21NKHnQ57Z9ZKfq
        iM6hQrXWWcGniIMtHFiZ3hRtBwyAuN8hmjbMt/wuiRPTwWJZE
X-Received: by 2002:aa7:d9d4:: with SMTP id v20mr3470524eds.234.1642754121941;
        Fri, 21 Jan 2022 00:35:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIYeq/Ed3URUhIn6WPpagBUgmUBHhym8SeaQc3F2a9sHPJ9ZLkk4zZZiOX2+0I08qYGOPgCA==
X-Received: by 2002:aa7:d9d4:: with SMTP id v20mr3470511eds.234.1642754121737;
        Fri, 21 Jan 2022 00:35:21 -0800 (PST)
Received: from [192.168.0.50] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id s13sm1819610ejo.207.2022.01.21.00.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jan 2022 00:35:21 -0800 (PST)
Message-ID: <32a92895-d724-c1bf-4eab-15c971625cf0@canonical.com>
Date:   Fri, 21 Jan 2022 09:35:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [RFC 0/3] iommu/samsung: Introduce Exynos sysmmu-v8 driver
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Cho KyongHo <pullip.cho@samsung.com>,
        Hyesoo Yu <hyesoo.yu@samsung.com>,
        Janghyuck Kim <janghyuck.kim@samsung.com>,
        Jinkyu Yang <jinkyu1.yang@samsung.com>,
        Alex <acnwigwe@google.com>, Carlos Llamas <cmllamas@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Erick Reyes <erickreyes@google.com>,
        "J . Avila" <elavila@google.com>, Jonglin Lee <jonglin@google.com>,
        Mark Salyzyn <salyzyn@google.com>,
        Thierry Strudel <tstrudel@google.com>,
        Will McVicker <willmcvicker@google.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220120201958.2649-1-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220120201958.2649-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/01/2022 21:19, Sam Protsenko wrote:
> This is a draft of a new IOMMU driver used in modern Exynos SoCs (like
> Exynos850) and Google's GS101 SoC (used in Pixel 6 phone). Most of its
> code were taken from GS101 downstream kernel [1], with some extra
> patches on top (fixes from Exynos850 downstream kernel and some porting
> changes to adapt it to the mainline kernel). All development history can
> be found at [2].
> 
> Similarities with existing exynos-iommu.c is minimal. I did some
> analysis using similarity-tester tool:
> 
> 8<-------------------------------------------------------------------->8
>     $ sim_c -peu -S exynos-iommu.c "|" samsung-*
> 
>     exynos-iommu.c consists for 15 % of samsung-iommu.c material
>     exynos-iommu.c consists for 1 %  of samsung-iommu-fault.c material
>     exynos-iommu.c consists for 3 %  of samsung-iommu.h material
> 8<-------------------------------------------------------------------->8
> 
> So the similarity is very low, most of that code is some boilerplate
> that shouldn't be extracted to common code (like allocating the memory
> and requesting clocks/interrupts in probe function).

This is not a prove of lack of similarities. The vendor drivers have
proven track of poor quality and a lot of code not compatible with Linux
kernel style.

Therefore comparing mainline driver, reviewed and well tested, with a
vendor out-of-tree driver is wrong. You will almost always have 0% of
similarities, because vendor kernel drivers are mostly developed from
scratch instead of re-using existing drivers.

Recently Samsung admitted it - if I extend existing driver, I will have
to test old and new platform, so it is easier for me to write a new driver.

No, this is not that approach we use it in mainline.

Linaro should know it much better.

> 
> It was tested on v5.4 Android kernel on Exynos850 (E850-96 board) with
> DPU use-case (displaying some graphics to the screen). Also it
> apparently works fine on v5.10 GS101 kernel (on Pixel 6). On mainline
> kernel I managed to build, match and bind the driver. No real world test
> was done, but the changes from v5.10 (where it works fine) are minimal
> (see [2] for details). So I'm pretty sure the driver is functional.

No, we do not take untested code or code for different out-of-tree
kernels, not for mainline.

I am pretty sure drivers is poor or not working.

> 
> For this patch series I'd like to receive some high-level review for
> driver's design and architecture. Coding style and API issues I can fix
> later, when sending real (not RFC) series. Particularly I'd like to hear
> some opinions about:
>   - namings: Kconfig option, file names, module name, compatible, etc
>   - modularity: should this driver be a different platform driver (like
>     in this series), or should it be integrated into existing
>     exynos-iommu.c driver somehow
>   - dt-bindings: does it look ok as it is, or some interface changes are
>     needed

You sent bindings in TXT with dead code inside, and you ask if it is ok.
I consider this approach that you sent whatever junk to us hoping that
we will point all the issues instead of finding them by yourself.

I am pretty sure you have several folks in Linaro who can perform first
review and bring the code closer to mainline style.


Best regards,
Krzysztof
