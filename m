Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91408416355
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 23 Sep 2021 18:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242349AbhIWQ3R (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 23 Sep 2021 12:29:17 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:38773 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242290AbhIWQ3F (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Sep 2021 12:29:05 -0400
Received: by mail-wr1-f52.google.com with SMTP id u18so18876303wrg.5;
        Thu, 23 Sep 2021 09:27:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6oZ+XUtQEDrny/KQntjDoiQWQURAQNGi1iLVidQw//k=;
        b=rHawQ8SXR+/N/K2YoK+SAKotCOy1EwfMuM7tu+h58BWpWPc6OozTItMqa9KoV2EfE5
         WHM6u2PGgeq40hjLijiUgacD08Ofv4Gp1YhZFybde0kEpjO9Ia+WxgJvZXI3RWAi33b3
         Is6zFvHe6JpU2NcQyVf47IFZYX6dHvEjjz+KvRt6hHKiZxMCYq59BeAcGJPSBAVpFC87
         M+EQF/xmjl4x/l8HbAexiXRuxU9+5Jdt1BLjFyCIEKsCzjQby/L1czVDImtPSCZWtIdZ
         3Z4uvQ6QgzGKYgLiUL+KcmSspCI37Aa8q5kuMAZanOE4tU8jQz11eKpd7Pukgp3jb4kV
         LhdQ==
X-Gm-Message-State: AOAM531eVwLzF3UcQn1KY9jNgp0XsfjGXJvOGM0V6xN7M6QsAgtRqzr1
        IuH9ZFVO9fgy6D/w26ESXy3xnKP4Lcj1WA==
X-Google-Smtp-Source: ABdhPJx1XUGWyc8DO+i1cz/XpGWL6buzyo9KmMMCSh32fHq65J1KI02NFcY6GOANSG215QA6Ti6udQ==
X-Received: by 2002:a1c:2543:: with SMTP id l64mr16960192wml.9.1632414451033;
        Thu, 23 Sep 2021 09:27:31 -0700 (PDT)
Received: from [192.168.0.134] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.googlemail.com with ESMTPSA id g2sm6249670wrb.20.2021.09.23.09.27.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Sep 2021 09:27:30 -0700 (PDT)
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Will McVicker <willmcvicker@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <20210920190350.3860821-2-willmcvicker@google.com>
 <a8d40b96-bcb2-5eb6-b0e5-c20c14471c8a@kernel.org>
 <CAMuHMdWdHF49qj+qV-DnbDDv14J3y98TPHd_6y_i7o7_azhErg@mail.gmail.com>
 <2c8a79f7-711a-b075-745f-ea77b82a1117@canonical.com>
 <CABYd82bzKh=QQHyk-kPXekzCKx+Uy-z2TY5qAQQNfuew=h=O-w@mail.gmail.com>
 <001cd621-53d1-fe22-0eaa-d13137827297@canonical.com>
 <YUx5uhKW/Jy2r3lv@google.com>
 <30a1d0f3-a17c-bf87-2519-542063a7a663@kernel.org>
 <YUyMyVezyjfv1Hs7@google.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v1 1/4] clk: samsung: change COMMON_CLK_SAMSUNG default
 config logic
Message-ID: <6ea9e6fc-1b38-7a45-3aed-c092da5fc044@kernel.org>
Date:   Thu, 23 Sep 2021 18:27:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUyMyVezyjfv1Hs7@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 23/09/2021 16:18, Lee Jones wrote:
>> Thanks Lee, you described the use case. In general I like it and support
>> it, except for what I wrote in the other mail.
>>
>> Vendor does not contribute much therefore there is no balance in
>> upstreaming. Since none of other vendor's platforms are supported, I am
>> looking only at what is supported. From that perspective - the change
>> proposed by Will and previous guys, does not have much sense.
>>
>> My perspective probably would change a lot if vendor did contribute some
>> of its non-edge platforms (3-5 years old)... especially that unlike few
>> community guys (e.g. PostmarketOS), vendor has shit-tons of money and
>> the hardware manuals. :)
> 
> But no incentive to upstream code old (dead) platforms that they no
> longer make money from.  We're not talking about kind-hearted
> individuals here.  These are business entities.
> 
> What is the business incentive to put hundreds of thousands of dollars
> into something with no RoI?

Before you mentioned business entities refrain from upstreaming recent
hardware. You question upstreaming not that recent, so basically
business entity will claim it has zero incentives working with upstream.

Actually there are incentives for both cases - better code quality for
the pieces being base for future devices, selling mainline supported
hardware to other businesses, eventually less work for themselves around
keeping code in sync with mainline. All these are of course difficult to
measure from business perspective.

> 
>> Instead of pushing this change, please let's give some incentive to the
>> vendor for upstreaming anything.
> 
> Again, you're being specific.  We would also like/need to make the
> same kinds of changes to other vendor configurations.  One's which do
> contribute significantly at their own cost.

Yes, I am specific because we talk here about specfic Kconfig changes
for one specific ARM sub-architecture. Same set of changes can be
applied to other SoCs and usually have more sense there because number
of upstream platforms is bigger.

If you have 10 different pinctrl drivers, you might decide to narrow the
defconfigs to subset of it. If you have 2-3, the extra complexity does
not matter and you just enable all of them. That's also decision we made
few years ago internally in Samsung.

> The technical reasoning cannot be different because you do or don't
> like the way the company operates.  Try to detach a little from
> your feelings during discussions which should be purely technical.

I mentioned the less-contributing vendor arguments because you said:

>> Vendors are not able to upstream all functionality right away

That's the side-topic in this discussion.

Technically, all supported Exynos platforms require selecting
ARCH_EXYNOS and require all drivers selected by ARCH_EXYNOS. If you
mention some unsupported out-of-tree platforms, which I cannot
audit/see/use, it is not a valid reason to change statement above. Make
them supported, available to audit and check and statement above stops
being valid.

Best regards,
Krzysztof
