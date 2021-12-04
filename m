Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13B5046847D
	for <lists+linux-samsung-soc@lfdr.de>; Sat,  4 Dec 2021 12:31:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384731AbhLDLei (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 4 Dec 2021 06:34:38 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:56212
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1384736AbhLDLei (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 4 Dec 2021 06:34:38 -0500
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 554FA40038
        for <linux-samsung-soc@vger.kernel.org>; Sat,  4 Dec 2021 11:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638617472;
        bh=rCVX/54x/CgrPrpLk0V2Yu5w/e/PL+rcqFLUdCaiNAQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=trXXzz7TKets0btRqLbTBAk9njTS0y+MwKZGkDw3/5RDrfpBbDP2B3004U5ISiYeI
         28I67qXFnmNC7SkvqOp2wxDM03LAj7wWARykO79LDAx+jJn2ijhRfEtoW1oWaiPCMx
         4V9syUxLiWdv4jzYuRtaqwXBcHcsTb13PLwpp8NeTfDYKKDDkziGhmdZ6PcYNhuxO7
         ggBy41D9kSzTO7yrGVIgzQoia1lOlZEVmFEfkdKI5jssdqPaIKXKQBRz8ELmJPT72L
         YZEssS6avr/TzePRw3bCMh9zIutNjqOccGJOxrhW5kTjJrGdUReXVKvkVSybWsK6XD
         SSt5ZbLjzcE3g==
Received: by mail-lj1-f197.google.com with SMTP id p18-20020a2eb7d2000000b0021ba3ea3c42so2133193ljo.5
        for <linux-samsung-soc@vger.kernel.org>; Sat, 04 Dec 2021 03:31:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rCVX/54x/CgrPrpLk0V2Yu5w/e/PL+rcqFLUdCaiNAQ=;
        b=UtRr/LqR6oSdYAgw7u1Z3lkw0XOj6Bpsviyr9JT5BtSVoaxSeupfgerXXIKQyJixyg
         2l2N/Ib9aKErDxbmcXLt/cM7fPPrlLozCjo/KITdvjO/S9pri6hb01g31yxph9HdT2vF
         b1MU57fg48rclLM3wH9egtbQurpULlQLwqmhZdWSdO9QwnpSzB8BaqcaKSTSEJiNxwav
         Lm7R1zEtEL6Q2VhaOeDg87g5CyWw2PmHAl0AK1npCZWAmx0nFWxN2HfQIh2+s93bKoh4
         FW1N/XVxnn77DM3XsxpW2MkaxwhNAXq5FdTWPnJb+bxIeW+nldf8VN+h2FBKne6XcCTE
         yxOA==
X-Gm-Message-State: AOAM532unyF4hzTZxKXmcikb8YG/F/Uwt0mJiX9vnc1jxOT2GCUSRZQ5
        1ou0nzZcKQflOzQKJ0eTodKfBBQSjGuVjGLdOKUlZljrkRL9SedAJPyxxjHlHsYsEUeDuSavPVv
        YI3YLSB8AdUWUyLD+YRO+XT10BiEPrOKbJowHrZDlEV5HQ5Sc
X-Received: by 2002:a2e:9350:: with SMTP id m16mr23690940ljh.233.1638617471389;
        Sat, 04 Dec 2021 03:31:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyANemDAtCv3+iQ0j3Luy8roKA+GLhqJG/82Ig/FfpWr5kjurx6Zp2lBQNCGA2PYFZoqjVBag==
X-Received: by 2002:a2e:9350:: with SMTP id m16mr23690916ljh.233.1638617471171;
        Sat, 04 Dec 2021 03:31:11 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id g36sm736607lfv.16.2021.12.04.03.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Dec 2021 03:31:09 -0800 (PST)
Message-ID: <e80b2fc7-038a-e05e-6ca1-2bfcffda906b@canonical.com>
Date:   Sat, 4 Dec 2021 12:31:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 RESEND 1/5] dt-bindings: soc: samsung: Add Exynos USI
 bindings
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20211130111325.29328-1-semen.protsenko@linaro.org>
 <20211130111325.29328-2-semen.protsenko@linaro.org>
 <YaZ8BpUaaC+sJYqx@robh.at.kernel.org>
 <CAPLW+4kGGk+umKTVRPNM7R=GaUQa31Uid=K+9ofq8w2mqzGAEA@mail.gmail.com>
 <CAL_JsqLopqkOEWmnvMDWr2rBa5Dm3jf17soqVA=Jx5Hn9BDS_g@mail.gmail.com>
 <CAPLW+4=i0hncEjNAYTyGRxd7Y3peDEgMf-Kw8qGhMW-kpNVv2Q@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAPLW+4=i0hncEjNAYTyGRxd7Y3peDEgMf-Kw8qGhMW-kpNVv2Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04/12/2021 01:18, Sam Protsenko wrote:
> On Fri, 3 Dec 2021 at 22:40, Rob Herring <robh@kernel.org> wrote:
>>
>> On Fri, Dec 3, 2021 at 1:36 PM Sam Protsenko <semen.protsenko@linaro.org> wrote:
>>>
>>> On Tue, 30 Nov 2021 at 21:31, Rob Herring <robh@kernel.org> wrote:
>>>>
>>>> On Tue, Nov 30, 2021 at 01:13:21PM +0200, Sam Protsenko wrote:
>>>>> Add constants for choosing USIv2 configuration mode in device tree.
>>>>> Those are further used in USI driver to figure out which value to write
>>>>> into SW_CONF register. Also document USIv2 IP-core bindings.
>>>>>
>>>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>>>> ---
>>>>> Changes in v2:
>>>>>   - Combined dt-bindings doc and dt-bindings header patches
>>>>>   - Added i2c node to example in bindings doc
>>>>>   - Added mentioning of shared internal circuits
>>>>>   - Added USI_V2_NONE value to bindings header
>>>>>
>>>>>  .../bindings/soc/samsung/exynos-usi.yaml      | 135 ++++++++++++++++++
>>>>>  include/dt-bindings/soc/samsung,exynos-usi.h  |  17 +++
>>>>>  2 files changed, 152 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
>>>>>  create mode 100644 include/dt-bindings/soc/samsung,exynos-usi.h
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
>>>>> new file mode 100644
>>>>> index 000000000000..a822bc62b3cd
>>>>> --- /dev/null
>>>>> +++ b/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
>>>>> @@ -0,0 +1,135 @@
>>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>>> +%YAML 1.2
>>>>> +---
>>>>> +$id: http://devicetree.org/schemas/soc/samsung/exynos-usi.yaml#
>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>> +
>>>>> +title: Samsung's Exynos USI (Universal Serial Interface) binding
>>>>> +
>>>>> +maintainers:
>>>>> +  - Sam Protsenko <semen.protsenko@linaro.org>
>>>>> +  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>>>> +
>>>>> +description: |
>>>>> +  USI IP-core provides selectable serial protocol (UART, SPI or High-Speed I2C).
>>>>> +  USI shares almost all internal circuits within each protocol, so only one
>>>>> +  protocol can be chosen at a time. USI is modeled as a node with zero or more
>>>>> +  child nodes, each representing a serial sub-node device. The mode setting
>>>>> +  selects which particular function will be used.
>>>>> +
>>>>> +  Refer to next bindings documentation for information on protocol subnodes that
>>>>> +  can exist under USI node:
>>>>> +
>>>>> +  [1] Documentation/devicetree/bindings/serial/samsung_uart.yaml
>>>>> +  [2] Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
>>>>> +  [3] Documentation/devicetree/bindings/spi/spi-samsung.txt
>>>>> +
>>>>> +properties:
>>>>> +  $nodename:
>>>>> +    pattern: "^usi@[0-9a-f]+$"
>>>>> +
>>>>> +  compatible:
>>>>> +    const: samsung,exynos-usi-v2
>>>>
>>>> Use SoC based compatibles.
>>>>
>>>
>>> In this particular case, I'd really prefer to have it like this. Most
>>> likely we'll only have USIv1 and USIv1 in the end, and I think that
>>> would be more clear to have USI version in compatible, rather than SoC
>>> name. Please let me know if you have a strong opinion on this one --
>>> if so I'll re-send.
>>
>> Fine if you have some evidence the ratio of versions to SoC are much
>> more than 1:1 and the versions correspond to something (IOW, you
>> aren't making them up).
>>
> 
> Yes, it's documented in TRM for different SoCs (USI version 2), and
> there are even dedicated registers where you can read the USI IP-core
> version. Right now we only know about two USI versions: v1 and v2 (can
> be found for example from different published Samsung downstream
> kernels, and from TRMs). So the USI block is standardized and
> versioned.

There is no version register for USIv1 and it does not look at all as
standardized. At least not documented. Just because later Samsung
introduced some logic behind it, it's not a proof it is standardized.
It's not. Standard comes with specification and there is no such.
Description of current implementation is not a specification.

Best regards,
Krzysztof
