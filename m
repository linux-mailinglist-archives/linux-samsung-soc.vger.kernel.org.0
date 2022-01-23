Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E39049753B
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 23 Jan 2022 20:27:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229995AbiAWT1r (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 23 Jan 2022 14:27:47 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:44880
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229846AbiAWT1r (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 23 Jan 2022 14:27:47 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 84D5B40012
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 19:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642966066;
        bh=ppmQZmGXEKGMtrtBOd5SScL6e8veRA8HtdHIjXJZG0w=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=YNGLBkoQhuf5rRR5RaqxyVIhCCXrEMAEcXJiFMCCACaguE+Clj4cps7r3V7tZUflN
         GjJTCzy7hkr0NfB7QBoD2pouTz5SuXVAuG6OzfgLX+CKo2ZdXb4X9LckEiNU+R8Wbe
         3sbrxIg6QlqkFG2cbfotof5dfHDIz/oaox7MGl8lpt+7zKZqhG73uGDIrA8zifZH4X
         m6hs2LRzUqRJxQ2C7QW0UsMA7upxA/31bs0n6KJ9fDUvtgJrp5XzOmk3+0jPFLt7Cv
         yXDzmW/aJLTm5J12+AxbjmNjnjLKOLwlSk1+pBkaEVuhPLunPH6BSNR9qIKnkAnYV/
         u7KW2kG3qypxQ==
Received: by mail-ed1-f70.google.com with SMTP id p17-20020aa7c891000000b004052d1936a5so7370152eds.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 11:27:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ppmQZmGXEKGMtrtBOd5SScL6e8veRA8HtdHIjXJZG0w=;
        b=aoixbrGwBFbc0PmVcN4Tr293iOSn0cYgsxcRBZk5NFo3aSSVfVbWFsBRfbz4TxBFxV
         HGx83p9Nsw+SnHlgAL3vAXVwlccipaeeQeN7JPZjEAvqINw4iTRc1ueTOoqidR/xghU4
         5mPRsM36smDkQIAqdwDPSu88ng/3o/Q+f7eJpohpiz2vbyxVTN04bASZ3wVNqXVXDp3W
         5c91z5WseXZvb6qNDjg8kezMU3ojMdOOCmlZGmrtZ3aG2mFjfBFs47F98vOlU/JXFyvS
         1i4m1UwmjAJTuMGEQttG3SpJfYQQpXdqETTWjiqkjhTo9MKrSNHK3aZ8kEXmLxnki+fD
         iPOw==
X-Gm-Message-State: AOAM5301aWB0etfphvwN5sZ0oA93ttYNY5kKZlCWGxWhsSX1S+TmzTpk
        xAK42161J4ubl/OYTvBQ66EudeBu5W+Zqyy8xXBhV1J8jGEVBq+gdA586Rh9zSY5wbX+kKgFN3a
        NrPx2swHH7vV1Wy9LvYZCa7W3DLPJc0eeChc3soX6i4ZRHL/n
X-Received: by 2002:a17:907:948d:: with SMTP id dm13mr10172420ejc.497.1642966065730;
        Sun, 23 Jan 2022 11:27:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYdWmSNLpkZ+Kmyls8Ku61DVbiK+Tc7UmnRy4ygyhjafJ3yLRtLz1Z7RyK/7j1hq0JpfWVcQ==
X-Received: by 2002:a17:907:948d:: with SMTP id dm13mr10172415ejc.497.1642966065553;
        Sun, 23 Jan 2022 11:27:45 -0800 (PST)
Received: from [192.168.0.52] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id g15sm5380240edy.77.2022.01.23.11.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jan 2022 11:27:45 -0800 (PST)
Message-ID: <72a50afd-df9f-ceb3-898e-070d70dc0221@canonical.com>
Date:   Sun, 23 Jan 2022 20:27:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [GIT PULL] arm64: dts: samsung: Second pull for v5.17
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>
Cc:     arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES" 
        <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
References: <20211227112959.7325-1-krzysztof.kozlowski@canonical.com>
 <CAPLW+4n-1H5Yu3wQaus-UJ_VW_TjHrNUHaPCGCMURXg8EqxjyA@mail.gmail.com>
 <CAK8P3a1ou-ZdrXN0MHQoJ+gGbvhXT-e2qt96_f9M8VwrdX0pAg@mail.gmail.com>
 <CAOesGMgF3S5_XsWjEqq=-zfYXwOWFpFNA6afL81wceRUA_0FeQ@mail.gmail.com>
 <CAPLW+4k8=ymx56R7bKOt8kMVG_uUgrTsCkVd5wiY_rkYq8dYbQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAPLW+4k8=ymx56R7bKOt8kMVG_uUgrTsCkVd5wiY_rkYq8dYbQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22/01/2022 13:38, Sam Protsenko wrote:
> On Wed, 19 Jan 2022 at 18:53, Olof Johansson <olof@lixom.net> wrote:
>>
>> On Wed, Jan 19, 2022 at 8:07 AM Arnd Bergmann <arnd@arndb.de> wrote:
>>>
>>> On Wed, Jan 19, 2022 at 4:11 PM Sam Protsenko
>>> <semen.protsenko@linaro.org> wrote:
>>>> On Mon, 27 Dec 2021 at 13:30, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
>>>>
>>>> Hi Olof, Arnd,
>>>>
>>>> Just want to check if it's possible for those patches to be applied in
>>>> v5.17? Sorry for the noise, but that's important to me.
>>>
>>> I can see that Olof merged merged this into the "arm/late" branch in
>>> the soc tree,
>>> so I assume he still plans to send it in the next few days.
>>
>> Yep, will be sent up today most likely.
>>
> 
> Thanks for detailed answer! Glad to hear it's still a possibility.
> Please let me know if you need any actions on my side (like rebasing,
> etc).
> 
>>> With the timing over Christmas, I sent out the large bulk of the
>>> contents (anything
>>> I merged before Dec 23) last year, and Linus already merged it, the rest ended
>>> up in the "late" branch.
>>>
>>> As usual, there is no guarantee that late changes make it in, but I have seen
>>> no indication of any problems so far.
>>
>> Correct. Been sitting on it for a while in case there were fixes
>> coming in for the first pieces that got merged, but in traditional
>> fashion I'm guessing those will start to show up a few days after the
>> late branch gets merged. :)

Olof,
v5.17-rc1 came earlier, so I see this part did not make into it. Is
there a chance for a past-rc1 pull to Linus with it?

Sam,
Anyway the patches wont' get lost (you mentioned such worry in previous
email to me). They might just need to wait. Unfortunately if patch,
especially with new feature, is coming in the end of cycle, there is a
risk it won't make it. The patches have to wait a few days in my trees
before I send them to Arnd/Olof, so if the patch is coming after rc6, I
can push it to Arnd/Olof around rc7, you see there is very little time.

Best regards,
Krzysztof
