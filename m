Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE938474787
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 14 Dec 2021 17:20:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233428AbhLNQU6 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 14 Dec 2021 11:20:58 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:58466
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231253AbhLNQU5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Dec 2021 11:20:57 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 82A193F1F2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Dec 2021 16:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639498856;
        bh=g72ITHpP/7K4Fh+hY6HlPMtuc/bG4lnmI0aLyihu7SE=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=YXj5kSLyl8bOuIy4i6GRBdZ4iTRkw7zIvB8zOiOA42Dpwo7V1m5vo0SRYOlXqktki
         K5P1HGPDF5RjuRseMq2pzmH43YrFe6J4/rmzo7lel6BFgVhY0mwwFLyosdh03lYN5s
         8GRn0vSeLiKtR5fgE9KSganjGawDRZVdmWEBDoz4sXSTPSf/QZKS4p3v84zSC4FqsC
         Kd3PgH4q694b2Xe8N1x4s4tmrZlmiq1Hc3LG5dPYi1KZY8IH1jjBgwCLlFA/3naGsu
         BcevwvkqQXVC9GBIzB1yDR6ntH20fv9aG299Lu+bVdKk1sQbv053BHi7QTOVVPJhae
         Ls2c7H2ohb2tw==
Received: by mail-lf1-f70.google.com with SMTP id e23-20020a196917000000b0041bcbb80798so8978661lfc.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Dec 2021 08:20:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=g72ITHpP/7K4Fh+hY6HlPMtuc/bG4lnmI0aLyihu7SE=;
        b=NK7s0ZzUUIPEC7XGoCJjI0dOwdwY8/B/SxiahJxWj5zvldMBTGyD1d14BKpRxZmCdR
         h+MmGTKshELNyipJuNbMuBVk55KbgkEysEeV2UXnTmWXYQV0O7Z3j2Zkd/60JRP6xzTl
         dqCpzlvaVVrf86aQc43kqzN1nnFMhNPKzc9ovJWLmGkZH4se3VqSKvRWNtG88ZDarWFC
         WAnH7uO9ZVdwk+z1yYVCx2XhSJbaOOqS88Ef4sKWUd4G5a53RtW1ry/38LsXfdyIMWQG
         +SZe7lQa+3HJJfMBf7Fie+ej6OapsuxWQJCUJRYQkPIb/UoHUZAL6z8S6oj7LJLfVpQO
         yYAA==
X-Gm-Message-State: AOAM533ThAKiermtkZN/CGoGq3oM/LGC62p9G+Xdxlw2qFwDMlbewrmP
        Sb/DDvE+L4v7WUqUlMNSE6D6y9BDhSENIhfhg9qxarv5C+RAX5JJbexY5f7t5usSrZfiMIjVNXG
        R0R8gmnN1ZV9Qvva6PuO3k3ZOEgpS0lfKFphUFQsIdgxZi95E
X-Received: by 2002:a05:6512:3503:: with SMTP id h3mr5805382lfs.235.1639498855774;
        Tue, 14 Dec 2021 08:20:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGdv+GMQwbnRoitBS7QBe4nCDhfEFoyFZe3SNqC32gORq8viuxl4Tm8fvxQYz8nQWL+HOjVw==
X-Received: by 2002:a05:6512:3503:: with SMTP id h3mr5805362lfs.235.1639498855592;
        Tue, 14 Dec 2021 08:20:55 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id bp41sm29251lfb.129.2021.12.14.08.20.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Dec 2021 08:20:55 -0800 (PST)
Message-ID: <146b173e-f445-bebc-d44c-afd41123eb80@canonical.com>
Date:   Tue, 14 Dec 2021 17:20:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 1/2] dt-bindings: clock: exynos850: Add bindings for
 Exynos850 sysreg clocks
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     linux-samsung-soc@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        David Virag <virag.david003@gmail.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>
References: <20211126203641.24005-1-semen.protsenko@linaro.org>
 <YagPWOj0CLxE/+ER@robh.at.kernel.org>
 <CAPLW+4=LTd8i2Tqr7Wa0NDRTJ5mRJXP=EvRCx84WxnwCDQ1eVg@mail.gmail.com>
 <CAPLW+4nk7Y8Psg9ZVacvzJeAV3VAGWfi+9hTPWgTeAWqh67AKQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAPLW+4nk7Y8Psg9ZVacvzJeAV3VAGWfi+9hTPWgTeAWqh67AKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/12/2021 17:15, Sam Protsenko wrote:
> On Tue, 7 Dec 2021 at 22:54, Sam Protsenko <semen.protsenko@linaro.org> wrote:
>>
>> On Thu, 2 Dec 2021 at 02:12, Rob Herring <robh@kernel.org> wrote:
>>>
>>> On Fri, 26 Nov 2021 22:36:40 +0200, Sam Protsenko wrote:
>>>> System Register is used to configure system behavior, like USI protocol,
>>>> etc. SYSREG clocks should be provided to corresponding syscon nodes, to
>>>> make it possible to modify SYSREG registers.
>>>>
>>>> While at it, add also missing PMU and GPIO clocks, which looks necessary
>>>> and might be needed for corresponding Exynos850 features soon.
>>>>
>>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>>> ---
>>>>  include/dt-bindings/clock/exynos850.h | 12 +++++++++---
>>>>  1 file changed, 9 insertions(+), 3 deletions(-)
>>>>
>>>
>>> Acked-by: Rob Herring <robh@kernel.org>
>>
>> Hi Sylwester,
>>
>> Can you please review and apply this series, if it's ok?
>>
> 
> Hi Krzysztof,
> 
> Do you think it's possible to take this series in your tree? Once it's
> applied, I can send the board support (dts) series -- this is the only
> remaining blocker for that right now.

I would need an Ack from Sylwester anyway. If you have dependencies (the
DTS), you should send them together with it. Once Sylwester applies this
patch, the DTS either waits till next release or it has to be modified
to not depend on this patch.

Best regards,
Krzysztof
