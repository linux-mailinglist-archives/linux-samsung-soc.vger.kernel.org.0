Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 114A23EEE1C
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 17 Aug 2021 16:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240094AbhHQOID (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 17 Aug 2021 10:08:03 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:38828
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229761AbhHQOIA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Aug 2021 10:08:00 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id D8C013F110
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Aug 2021 14:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629209246;
        bh=jfQmfS4UcdDZ/PX6E9b//KKI404jw/6q3qCv8x9JyfM=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=FNJjlWJ7AdupXru0q1ASDnxbgDiy7a+L5o0IYI7vSbSkb5dWt9LuQqz840yc1Y2PP
         M8Bbg7mPRkjClIRrvBv0gchREXMURyymrqnclUcET/iynKGpA8p2Fci0J+fiV6mL10
         Kr8NjCDu8vpLg3ZtLNDHC1ac29/JZJ5WPdRq09LaYXZoEKSX++qLuvSz2vOjBEsqfV
         7cuOAVjFytCCZ1ZOVLPxptODEnqjNJAjw01C5QIDWOcE7Ppn2Z8aS24ACSltB9qXuO
         j9eMuipnFMMN8TuVTDF0IGATwZqcRbh8eywnc8NJoy+qIG+Wy/LG3ScwiDNkv0AwvY
         ZOBRspTIHdzRw==
Received: by mail-ed1-f69.google.com with SMTP id y39-20020a50bb2a0000b02903bc05daccbaso10645982ede.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Aug 2021 07:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jfQmfS4UcdDZ/PX6E9b//KKI404jw/6q3qCv8x9JyfM=;
        b=reSQ6flPo8THcsLegZ4rGLXSe3aLi3yNVENtfTAmdYdONszdGnHZpL0Jc7qcfqyT5v
         m7He3wkPQ1FvvULSOAOeWgfzf78e5jrHSfuQlf49h/skhrIC/wlGc2lkoZe3u8yQl5GV
         +G28CBcNnGAUyHkvDHpQg/UFhfVcpLynyaMu07FlPz4zv8KRKvElEOIgvGE4frDS1Ep0
         3Ogv9tAjP4e/mDNurh7mjvcmGCVVI+qWBDb+xMQe0GosMIoSEFdc85fv6tHi79Jj4AH5
         7xwnJJ7F5fIDoNko4j5f1OkAu8DaPQUxPsQFHFQp1lDUDJ7K6CO6cnx/aurNpVjKqj4a
         8jLg==
X-Gm-Message-State: AOAM533uKnzaE4j+DzKar0GUdqsjKlPM4CA3Vz20NHQeAB89yhvKMqHK
        E9Hf9lqzWbNvNeNxo4yrzv7cUyFE44Wxt71xXNMrCpEqroZfVqsmEHdQ7RXgU34zd27ktr4AY4P
        8nNVujDGOlmINqU+JBr/3Zm46UuYMU+SJgg5N6xjZDSp8twXU
X-Received: by 2002:a05:6402:35c9:: with SMTP id z9mr4369311edc.249.1629209243910;
        Tue, 17 Aug 2021 07:07:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyszAFp2YNN5KP+dS332IXz7EIzwQDE7qq9Fr9F3rL6OyeZKaqCv4G6V53FVjOklm6MHgpHCA==
X-Received: by 2002:a05:6402:35c9:: with SMTP id z9mr4369292edc.249.1629209243737;
        Tue, 17 Aug 2021 07:07:23 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id m6sm1049328edc.82.2021.08.17.07.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Aug 2021 07:07:22 -0700 (PDT)
Subject: Re: [PATCH 2/2] dt-bindings: rng: convert Samsung Exynos TRNG to
 dtschema
To:     Lukasz Stelmach <l.stelmach@samsung.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org
References: <c3a1d7d2-7b32-b7eb-4647-f86e22f5e5ff@canonical.com>
 <CGME20210817123507eucas1p120be1e5cc942e20bed39b6d810ccdbd1@eucas1p1.samsung.com>
 <dleftj8s10fdvz.fsf%l.stelmach@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <da43d243-35b0-2cc6-f8a0-a5d02c997301@canonical.com>
Date:   Tue, 17 Aug 2021 16:07:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <dleftj8s10fdvz.fsf%l.stelmach@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 17/08/2021 14:34, Lukasz Stelmach wrote:
> It was <2021-08-17 wto 12:05>, when Krzysztof Kozlowski wrote:
>> On 17/08/2021 11:55, Lukasz Stelmach wrote:
>>> It was <2021-08-11 śro 10:43>, when Krzysztof Kozlowski wrote:
>>>> Convert Samsung Exynos SoC True Random Number Generator bindings to DT
>>>> schema format using json-schema.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>>> ---
>>>>  .../bindings/rng/samsung,exynos5250-trng.txt  | 17 -------
>>>>  .../bindings/rng/samsung,exynos5250-trng.yaml | 44 +++++++++++++++++++
>>>>  MAINTAINERS                                   |  2 +-
>>>>  3 files changed, 45 insertions(+), 18 deletions(-)
>>>>  delete mode 100644 Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.txt
>>>>  create mode 100644 Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.yaml
>>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.txt
>>>> b/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.txt
>>>> deleted file mode 100644
>>>> index 5a613a4ec780..000000000000
>>>> --- a/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.txt
>>>> +++ /dev/null
>>>> @@ -1,17 +0,0 @@
>>>> -Exynos True Random Number Generator
>>>> -
>>>> -Required properties:
>>>> -
>>>> -- compatible  : Should be "samsung,exynos5250-trng".
>>>> -- reg         : Specifies base physical address and size of the registers map.
>>>> -- clocks      : Phandle to clock-controller plus clock-specifier pair.
>>>> -- clock-names : "secss" as a clock name.
>>>> -
>>>> -Example:
>>>> -
>>>> -	rng@10830600 {
>>>> -		compatible = "samsung,exynos5250-trng";
>>>> -		reg = <0x10830600 0x100>;
>>>> -		clocks = <&clock CLK_SSS>;
>>>> -		clock-names = "secss";
>>>> -	};
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.yaml
>>>> b/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.yaml
>>>> new file mode 100644
>>>> index 000000000000..a50c34d5d199
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.yaml
>>>> @@ -0,0 +1,44 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id:
>>>> https://protect2.fireeye.com/v1/url?k=f38ca35b-ac179a0d-f38d2814-0cc47a31ce52-1faa1ecb65482b8a&q=1&e=8b3490f9-a5fc-4da0-b2ee-7b0aec781403&u=http%3A%2F%2Fdevicetree.org%2Fschemas%2Frng%2Fsamsung%2Cexynos5250-trng.yaml%23
>>>> +$schema:
>>>> https://protect2.fireeye.com/v1/url?k=9409519d-cb9268cb-9408dad2-0cc47a31ce52-12394c4409905980&q=1&e=8b3490f9-a5fc-4da0-b2ee-7b0aec781403&u=http%3A%2F%2Fdevicetree.org%2Fmeta-schemas%2Fcore.yaml%23
>>>> +
>>>> +title: Samsung Exynos SoC True Random Number Generator
>>>> +
>>>> +maintainers:
>>>> +  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>>> +  - Łukasz Stelmach <l.stelmach@samsung.com>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: samsung,exynos5250-trng
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 1
>>>
>>> How about copying description from above into the description: property?
>>
>> But what to copy? There is no description except generic clock bindings.
>>
> 
> The description that "was" in the txt file.

But there was no description of fields except copy&paste of the core
schema. Do you describe C code like:

...
/* unsigned int is a integer number greater or equal 0 */
unsigned int i;
...


Best regards,
Krzysztof
