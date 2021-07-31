Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EE283DC4E0
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 31 Jul 2021 10:12:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232491AbhGaIM6 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 31 Jul 2021 04:12:58 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:44722
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232273AbhGaIM6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 31 Jul 2021 04:12:58 -0400
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id D60C23F233
        for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Jul 2021 08:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627719170;
        bh=HofaMjseVcCUgqSYBsyKnJ2om6JL+Ag5g9O40Ge5/aA=;
        h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=KrCfpMKt7a20tIXJx0UX6vAmt0qXGZnxmrsdapyDypuBya8UfXsLCxfVU7XAF9vRp
         mVmOHEl8a/8HerNeScDyX4/MuICS6qe7utL38F+FMZrCdo3Pua6sOYmYyRM/xBd6Cn
         N/icXqx2z1L0PHAahtdEIFxCy2CItLRbRJ1tmdftcvLUkGXMjszt4flEeUPrny8V3K
         gqn7X75b6geCkACZVLrKW4eTkDOhQoNlXEcIEZv3NA77ksQwqTNdDdhTU2tAZ3k/oY
         1zN1lDBS5lr6BVqdA3zli48hI87lMkiqgogps3JxU8wnCPfK0ZnA2nwixZ18pOqlwW
         WMhlHoBXZ9RZA==
Received: by mail-ed1-f70.google.com with SMTP id de5-20020a0564023085b02903bb92fd182eso5865240edb.8
        for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Jul 2021 01:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HofaMjseVcCUgqSYBsyKnJ2om6JL+Ag5g9O40Ge5/aA=;
        b=P8Wqt9+mAq6UIGMNtSv1TpmRJOOzhyUivNcsMounK80u2uF7KDwDMqMqtEe6+1ZJOd
         gj2cch4dKn9WBPGKBisxkcRmLe09RaFPGeCBVEbNG2/OoUOeU6mhNu2Ou1ms8dlTtsr/
         VUlpbT7sIQzwbO+dR2PODyWBy4c/BLA/OVQcrOe+HVMlTowQFBH2FYdNsJyqwRkC+1oM
         QGjnqdCel7PNEZ99lfunlYOs6Enw9v5M1RSX/9Y4fr5lP1Y7adnDXwGsD0YhJEAFxL27
         vgcDGfWqzIOj7ULEWF3Z8y7xV1soqKTLK/GcCzMj7l+L3dYQiVfL967J1GD3MKy5hVIn
         teVQ==
X-Gm-Message-State: AOAM532JtqdpMRjOv9c1J8gRODbTo9AgR3xsDEbh6M1b9EjmSNkS1tHR
        mIWckhxwZWQoHw1RlmDI5ScoVhMe0nou0XyJHPzWiKl4ykHG2mRXb60/uhB44bOUGJOQcnHy4vH
        Ki1sYtEATL9h8Or8ZqvZzD5ryYshzWwJRWALCA4iv5592tVgC
X-Received: by 2002:a17:906:cd1a:: with SMTP id oz26mr6577411ejb.101.1627719170297;
        Sat, 31 Jul 2021 01:12:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwm7c/vYPdEZ6qJ4RX+9vAac/dbPuwTMcFunGU0oW5pq2v9q/TLiem2CXVaQ4vIsN9WXGr5Fg==
X-Received: by 2002:a17:906:cd1a:: with SMTP id oz26mr6577395ejb.101.1627719170126;
        Sat, 31 Jul 2021 01:12:50 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id r16sm1860561edt.15.2021.07.31.01.12.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jul 2021 01:12:49 -0700 (PDT)
Subject: Re: [PATCH 00/12] Add minimal support for Exynos850 SoC
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <5e35b0a7-13aa-3c62-ca49-14af2fcb2a08@canonical.com>
 <c3486111-0ec9-9679-d2a2-68b2f33a2450@canonical.com>
 <CAPLW+4kbnJEBkc0D=RWt59JxBan8X1uDy6sSXBiYAq8N9FDV6A@mail.gmail.com>
 <13f166bb-7103-25d5-35a6-8ec53a1f1817@canonical.com>
Message-ID: <2dacc205-04ce-c206-a393-50ba0d5aa1a7@canonical.com>
Date:   Sat, 31 Jul 2021 10:12:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <13f166bb-7103-25d5-35a6-8ec53a1f1817@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 31/07/2021 09:29, Krzysztof Kozlowski wrote:
> On 30/07/2021 21:02, Sam Protsenko wrote:
>> Hi Krzysztof,
>>
>> On Fri, 30 Jul 2021 at 20:21, Krzysztof Kozlowski
>> <krzysztof.kozlowski@canonical.com> wrote:
>>>
>>> On 30/07/2021 17:18, Krzysztof Kozlowski wrote:
>>>> On 30/07/2021 16:49, Sam Protsenko wrote:
>>>>> This patch series adds initial platform support for Samsung Exynos850
>>>>> SoC [1]. With this patchset it's possible to run the kernel with BusyBox
>>>>> rootfs as a RAM disk. More advanced platform support (like MMC driver
>>>>> additions) will be added later. The idea is to keep the first submission
>>>>> minimal to ease the review, and then build up on top of that.
>>>>>
>>>>> [1] https://www.samsung.com/semiconductor/minisite/exynos/products/mobileprocessor/exynos-850/
>>>>>
>>>>
>>>> Great work!
>>>>
>>
>> Thanks, Krzysztof! And thank you for reviewing the whole series.
>>
>>>> What's the SoC revision number (should be accessible via
>>>> /sys/bus/soc/devices/soc0/)? Recent wrap in numbering of Exynos chips
>>>> might bring confusion...
>>
>> # cat /sys/devices/soc0/revision
>> 0
> 
> soc_id but you're right it won't be set for unknown SoCs. You need to
> extend drivers/soc/samsung/exynos-chipid.c to parse new values (E3830000
> for product ID) and maybe new register offsets (previous offset is 0x0,
> for 3830 is 0x10 I think). Also revision mask might change.
> 
>>> Judging by vendor's sources it is quite confusing. It looks mostly like
>>> Exynos3830 but in few other cases it uses Exynos9 compatibles (Exynos9,
>>> Exynos9820). Only in few places there is Exynos850. Marketing department
>>> made it so confusing...  The revision embedded in SoC would be very
>>> interesting.
>>>
>>
>> As I understand, this SoC is called Exynos850 everywhere now.
>> Exynos3830 is its old name, not used anymore. As you noticed from
>> patch #2, it shares some definitions with Exynos9 SoC, so I guess some
>> software is similar for both architectures. Not sure about hardware
>> though, never worked with Exynos9 CPUs. Anyway, I asked Samsung
>> representatives about naming, and it seems like we should stick to
>> "Exynos850" name, even in code.
> 
> 
> Since the chip identifies itself as E3830000, I would prefer naming
> matching real product ID instead of what is pushed by marketing or sales
> representatives. The marketing names don't have to follow any
> engineering rules, they can be changed and renamed. Sales follows rather
> money and corporate rules, not consistency for upstream project.

On the other hand we have already two exceptions for naming
inconsistency - Exynos3250 identifies itself as 3472 (which is confusing
because 3250 is two core and there is a separate quad-core
Exyons3472...) and Exynos5800 is actually marketing name for a revision
of Exynos5422. Maybe indeed will be easier to go with the branded name
850...


Best regards,
Krzysztof
