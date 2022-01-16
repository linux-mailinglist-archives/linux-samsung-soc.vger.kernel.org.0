Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4108D48FE26
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 16 Jan 2022 18:15:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233505AbiAPRPW (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 16 Jan 2022 12:15:22 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:49772
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233470AbiAPRPV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 16 Jan 2022 12:15:21 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9FD733F1DD
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Jan 2022 17:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642353320;
        bh=WxX9PqVqnoB087SnVZ/g7nOzuTnhj5somlhtfwJ+2L0=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=VTuZ5CLmf+df64oz0XrYGy2CBZ3mrVD5Juf/GeY9J+YjTQgyZqoOkQbCNBjm3ATE2
         ilkK5FO7uUySZ1h2KD8fJ2I9oYnFjOupu2Xtbckpyt46kUja5hjCNAMSHp6p0enPsY
         2ObKuyOHOejEKySCPewEk4Fd3z9EphQjaCIrdMqpupjivtiZCd5MQRZQT1UY5D8cEp
         xQa8hXlo218wB6hOfpS8GNmrE/scBRrbSRy5FodDhAz4Qnx7i8nPd6SUE3A5zWr49D
         rWaH7XeTmvnUsRaOyT7uwqVpCR/Ke9rhmDAbJZ5dkQOWQ70SZDDuOS50LObCoT3cyC
         ScKq3ulcKkClw==
Received: by mail-ed1-f72.google.com with SMTP id p14-20020aa7c88e000000b0040240401a02so1382906eds.14
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Jan 2022 09:15:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=WxX9PqVqnoB087SnVZ/g7nOzuTnhj5somlhtfwJ+2L0=;
        b=iR+imlF9y550wJgRF/PK3hmsdlEF0qH/wvyAlozi8IdllCFTPKSlKc7I+wCr8x5EvH
         nRTVwLVsCse9FfFmcpvifxWpl0gCqpDUE+iPHXEYfwdveMhdP4RaALzosKd9sG223/cu
         ECnRPnkrTIh7qnqVNxZd/Li4xwQmmzL/XFQ0vC8zaE3OJ19Iw8YZ/Lh5/PW7XsUK5Hvp
         Jmh8vxMUVG7WTdFBcd5qB9/PM3P3WaZ4r5xSPiPiMNdLtJPiGW7YIu9NkZcm2svmxLys
         Q4paLjPMMy6qfiOMbqhoSYIKtUPv9w/vy8Y4QEtyGRLCkBWdr7+2UlFWKoECJPCu/LSr
         QWmg==
X-Gm-Message-State: AOAM530g+L0TcdVkoATqGMBjWu5AD8GgFslQ9NPeaGY0JKWXEs5M97dE
        rxLMT2zAJFr/MhPZErusjzBO+vX5+Qb9UIQBhtYizAUsVxYdwFAnu6GzfJveswj+HG5YE5II1/z
        Txb6QBsHP1X12dtKmz3bN1vJNtqmrxQCosZlAA6JKVUitKuXg
X-Received: by 2002:a05:6402:942:: with SMTP id h2mr4660808edz.352.1642353320360;
        Sun, 16 Jan 2022 09:15:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx05hTg774/4frTMC+NfLDsnFU3vWXZskBCDC006uOc1cdGn7ljtGBP291zHXmn/0GJYxwBug==
X-Received: by 2002:a05:6402:942:: with SMTP id h2mr4660802edz.352.1642353320248;
        Sun, 16 Jan 2022 09:15:20 -0800 (PST)
Received: from [192.168.0.35] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id n7sm1062460ejj.82.2022.01.16.09.15.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jan 2022 09:15:19 -0800 (PST)
Message-ID: <e966dfb3-0f90-68fe-f27e-caeda2abf0bd@canonical.com>
Date:   Sun, 16 Jan 2022 18:15:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: Exynos850 and ExynosAuto v9 pinctrl wakeup muxed interrupt
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Chanho Park <chanho61.park@samsung.com>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>
References: <3c0087a9-5c3b-d665-136e-6110a0482775@canonical.com>
 <CAPLW+4nrPKA66GrF4XukyHWHJ=wBycjyK3ZPLCofEFe-VJ9wWg@mail.gmail.com>
 <06320ea8-9297-1e90-dafd-978f73c22fff@canonical.com>
 <CAPLW+4=xD5hM_tYDD+kwqkiVq5h0tjO+7q6Akbd6iO_Ou-g=0A@mail.gmail.com>
 <1a09cd4e-71da-43e6-9732-33d704e1744e@canonical.com>
 <CAPLW+4kEQYrTvMwodbha4SV9mDS36sjxdsiCwVQptmoShb_5hQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAPLW+4kEQYrTvMwodbha4SV9mDS36sjxdsiCwVQptmoShb_5hQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 15/01/2022 21:38, Sam Protsenko wrote:
> On Sat, 15 Jan 2022 at 17:46, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> This would mean that my dts patch removing all interrupts for alive and
>> cmgp was correct:
>> https://lore.kernel.org/linux-samsung-soc/66754058-187e-ffd5-71ba-4720101f5d98@canonical.com/T/#mf0b06ebdac554d57d8230dc546c3d57d59d7bd6b
>> Was it?
>>
> 
> Yep. But patches [1,2] I sent recently should be probably applied
> before yours -- they belong together. Please take those in your patch
> series (when sending the next version).
> 
> Thanks!
> 
> [1] https://lkml.org/lkml/2022/1/14/861
> [2] https://lkml.org/lkml/2022/1/3/680
> 
>>> Will send the patch soon -- please add it to the beginning of your
>>> series along with my other patch I already submitted.

DTS and driver changes never go via same tree, so if you say there is
such dependency, then my patch should wait till another release so your
driver change will be in mainline.

What is actually the dependency here between my patch removing incorrect
interrupts and yours:
1. removing EINT for these GPIO banks from pinctrl driver,
2. adding missing GPIO banks?


Best regards,
Krzysztof
