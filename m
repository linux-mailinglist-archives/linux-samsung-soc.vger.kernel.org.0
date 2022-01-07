Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82F96487401
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  7 Jan 2022 09:16:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235807AbiAGIQM (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 7 Jan 2022 03:16:12 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38266
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235738AbiAGIQM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 7 Jan 2022 03:16:12 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 54A673F337
        for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Jan 2022 08:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641543371;
        bh=0ETHx7IxO/XI5yIDbHt0JLKs0xDRg+pSbg1JFz236sQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=UEiwGjJnrmfiPlQgvsiLZ/nmhRXsS5MKQ0gs05CwnFmWZavr7qkZzLRo2eXBOfhLL
         3cCmI+fl3vFk5nM41Na0z7vL4hdv6NdkohlEUUmiAc4xE/m4iYWCDI0tqOQo6Q7zGL
         PtQKQXkFLtxz6ocI9RFUXB8F/9iSrekepahIzsM38A6xo2LIm9a8BLcaNeB6J1kjpt
         adxIOlJcYbBTNFuKNF8C9K7nwUHczlhAeNYVx2m7jttSofSg3dZvlEYYx9q3IR/ufO
         WvCFgeD9qzZBE8eBuMuSUJE3SH8BlAP2YYvLtqDkAsghvf7vLItyyWPBUL5mqPBw7X
         Kru3Ca4rx9cdQ==
Received: by mail-ed1-f69.google.com with SMTP id l14-20020aa7cace000000b003f7f8e1cbbdso4005238edt.20
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Jan 2022 00:16:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0ETHx7IxO/XI5yIDbHt0JLKs0xDRg+pSbg1JFz236sQ=;
        b=E1qEKwOSM+1tIwz09AS/FzEplG8JjuCXQ/7SUTSeyMSK9QL694hvB271V4aAf5ZHaA
         XY01g0Cgqzw0Ny1Q1ZppPfJaYceUM020bxW6YBVXKRuq72Fgt2QOFnZ0+DB9MQO+BDsu
         nbxLxL6vwmP3bxWHdd/a7/6NTKKjhJflU6gwiIaKgE7i5SYiMi6nh0uOBfnBGxgdjwEJ
         633RG0cZISDR/L/l4uhOvLbXhi3rlPZGEMtJbAt3M+8REfQzO3eiHtrcnWFbSH2+d6OA
         TIBjqroJ+qNYSoQlzkv7p5QY+2np1w9bw4wNT4n3vdiw5cdhY9OzUqPatAmjQN/ETC1z
         XGxg==
X-Gm-Message-State: AOAM532iVxeAnvwuiZCqsEbEP1ye/JxYWgK2K7acQ7mZTPbA2MZ9tEiS
        7poePqItggXwAu3GBXYpRBsen8E/OKnir0T9MAN3qrBmmmgNQ2n7ifpcTp45oTCQpqlE1FGpxED
        3/ffGX0ASuzX2AQQEniIbkqQIYyOe2bPebd3LjILDST18ScdN
X-Received: by 2002:a17:906:4556:: with SMTP id s22mr49094542ejq.321.1641543370855;
        Fri, 07 Jan 2022 00:16:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxJAm9A5L/ysD8uvohTI87Y9b3PV1DnZGH/7gSFBXzSBxRB+4tVyd7e8dsIFzgTftrZrj+Gw==
X-Received: by 2002:a17:906:4556:: with SMTP id s22mr49094525ejq.321.1641543370622;
        Fri, 07 Jan 2022 00:16:10 -0800 (PST)
Received: from [192.168.1.126] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id 2sm223915ejt.224.2022.01.07.00.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jan 2022 00:16:10 -0800 (PST)
Message-ID: <06320ea8-9297-1e90-dafd-978f73c22fff@canonical.com>
Date:   Fri, 7 Jan 2022 09:16:09 +0100
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAPLW+4nrPKA66GrF4XukyHWHJ=wBycjyK3ZPLCofEFe-VJ9wWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 03/01/2022 21:59, Sam Protsenko wrote:
> On Thu, 30 Dec 2021 at 21:34, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> Hi Chanho and Sam,
>>
>> I am slowly finishing dtschema for Samsung pinctrl drivers [1] and I
>> noticed that Exynos850 and Auto v9 do not define interrupt in pinctrl
>> node with: wakeup-interrupt-controller. This is an interrupt muxing
>> several external wakeup interrupts, e.g. EINT16 - EINT31.
>>
>> For Exynos5433 this looks like:
>> https://elixir.bootlin.com/linux/latest/source/arch/arm64/boot/dts/exynos/exynos5433.dtsi#L857
>>
>> Missing muxed interrupt for Exynos850 and Autov9 might be fine, although
>> you should see in dmesg error log like:
>>     "irq number for muxed EINTs not found"
>>
>> Can you check that your wakeup-interrupt-controller is properly defined
>> in DTSI? If yes, I will need to include such differences in the dtschema.
>>
> 
> In case of Exynos850, no muxed interrupts exist for wakeup GPIO
> domains. Basically, "pinctrl_alive" and "pinctrl_cmgp" domains are
> wake-up capable, and they have dedicated interrupt for each particular
> GPIO pin. All those interrupts are defined in exynos850-pinctrl.dtsi
> file, in next nodes:
>   - pinctrl_alive: gpa0..gpa4 (interrupt numbers 1..36)
>   - pinctrl_cmgp: gpm0..gpm7 (interrupt numbers 39..46)
> 
> All mentioned interrupts are wakeup interrupts, and there are no muxed
> ones. So it seems like it's not possible to specify "interrupts"
> property in pinctrl nodes with wakeup-interrupt-controller. The PM is
> not enabled in Exynos850 platform yet, so I can't really test if
> interrupts I mentioned are able to wake up the system.

Thanks for confirming, I'll adjust the schema.

> 
> After adding this patch ("arm64: dts: exynos: Add missing gpm6 and
> gpm7 nodes to Exynos850"), I can't see this error message anymore:
> 
>     samsung-pinctrl 11c30000.pinctrl: irq number for muxed EINTs not found
> 
> That's because exynos_eint_wkup_init() function exits in this check:
> 
>     if (!muxed_banks) {
>         of_node_put(wkup_np);
>         return 0;
>     }
> 
> But I actually can see another error message, printed in
> exynos_eint_gpio_init() function (for wake-up capable pinctrl nodes,
> because those nodes don't have "interrupts" property now -- you
> removed those in your patch):
> 
>     samsung-pinctrl 11850000.pinctrl: irq number not available
>     samsung-pinctrl 11c30000.pinctrl: irq number not available
> 
> which in turn leads to exynos_eint_gpio_init() function to exit with
> -EINVAL code in the very beginning, and I'm not sure if it's ok? As I
> said, those errors only appear after your patch ("arm64: dts: exynos:
> drop incorrectly placed wakeup interrupts in Exynos850").

Yeah, I replied to this next to my patch. I think my patch was not
correct and you need one - exactly one - interrupt for regular GPIO
interrupts.

> 
> It raises next questions, which I'm trying to think over right now.
> Krzysztof, please let me know if you already have answers to those:
> 
> 1. Regarding "wakeup-interrupt-controller" node (and
> exynos_eint_wkup_init() function): is it ok to not have "interrupts"
> property in there? Would corresponding interrupts specified in child
> nodes (gpa0..gpa4) function as wake-up interrupts in this case? Or
> pinctrl driver should be reworked somehow?

Yes, it should be fine. The message should be changed from error to info
or even debug, maybe depending on SoC-type (so define in struct
samsung_pin_ctrl whether exynos_eint_wkup_init expects muxed wake-ip
interrupts).

> 
> 2. Regarding missing interrupts in pinctrl nodes (and corresponding
> error in exynos_eint_gpio_init() function): should it be reworked in
> some way for Exynos850? Error message seems invalid in Exynos850 case,
> and I'm not even sure if it's ok exynos_eint_gpio_init() fails. Should
> it be modified to work that error around, in case of Exynos850?
> 
> All other pinctrl nodes have a muxed interrupt (except pinctrl_aud,
> but that's probably fine).

The error message is valid - correctly points to wrong configuration.
All pinctrl nodes should have one interrupt, if they have GPIOs capable
of interrupt as a function (usually 0xf as GPIO CON register). Why
pinctrl_aud does not have it? Maybe the function EXT_INT (0xf) is not
available for its pins?

Best regards,
Krzysztof
