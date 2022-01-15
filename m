Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8861548F7E2
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 15 Jan 2022 17:35:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233113AbiAOQfO (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 15 Jan 2022 11:35:14 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:51132
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229819AbiAOQfN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 15 Jan 2022 11:35:13 -0500
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 8F1313F206
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Jan 2022 16:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642264512;
        bh=CwDGjXexcWukGO6o7MB2duK736BQTMtBwS9EGSGHvB0=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:
         In-Reply-To:Content-Type;
        b=UlCjSB1Yjr+RXN7xuytgdzyTX13jC6YLAavUsRxO3ygx2ikX36hhprUQceAhYWudz
         vZh5PYICkwmchPSOAq4yeBhJN3Q3SLRqxsBMMq9PbBOpn2cEPsg0Pkxgh2gbntvh9c
         RsSRESagMWQypBm3f1hAd4LOjBNQ+b4rFl/KYguho35QaoJNqi7NSg6GnJAJAIZaxK
         XYh8O93AxEyDBTLrYLSB7427BswkVHWxzmYiEcDGSeoDNkuEibaCt6rKPw4TvBvw4I
         gLDUJKU+CqRA3XaTkt0fAWa/bVkcJ6meXh6qNBF+LveXXOgMxaCG+NbNbdA5F+CqYQ
         0Ecu76vCS9iyQ==
Received: by mail-wm1-f72.google.com with SMTP id i81-20020a1c3b54000000b003467c58cbddso10091929wma.5
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Jan 2022 08:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CwDGjXexcWukGO6o7MB2duK736BQTMtBwS9EGSGHvB0=;
        b=GgZWQ6D8yfuTM+5/K10+EUkAC8XjVriwMS/o71mu++2zDm9F+BuhTZcl3S/E8Rtt6O
         6enu1DtQuAm1gpmdswT8r3Sxrjc/w68DN33Uo6EP9h5uBgyHB5gG8DeB7hXEXgt9GZUT
         5nLYzBxCxGWN0z55sRxQWtDhVTH1Hps4Noru6rbYqvM9INU3m4It6l9x6uKdxgoIeVUL
         kShOq3WFt2hg6Ar7y7WGko6jee4iciOWAZENiIonTflK1chePrJJ9S13nn81yXXaZ78F
         RmTDSD/RKv56H+oLuMR2WhTrDr/yN7BDGfdFfWHdcP0/FNm+HZNM30Jb3xx1nmnq+n1V
         zmhQ==
X-Gm-Message-State: AOAM531EPbOTNOO/XQg1b5hi8F07SzuuFG00FT+Zwy2CFsTLX7LpHeSq
        x69AleUwuukyEEU42DECTmsIYTDszHwGG5BFhDD21WiWgYyks5XHcrjnGw8Km4EaxdlSsbdus8l
        CpVZ2lz/xnle7BydOWolEBu2XehF/IzBtsiF2D2eETHnZla82
X-Received: by 2002:a05:600c:1991:: with SMTP id t17mr12917105wmq.25.1642264512174;
        Sat, 15 Jan 2022 08:35:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJHkjVRSHes/vsUP6CPF0iTbfZjptRO264KpO2gWf1ByuGJHX0lmJIwgcOEK1rosA5D9hj4w==
X-Received: by 2002:a05:600c:1991:: with SMTP id t17mr12917092wmq.25.1642264511987;
        Sat, 15 Jan 2022 08:35:11 -0800 (PST)
Received: from [192.168.0.35] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id z4sm8193001wmf.44.2022.01.15.08.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jan 2022 08:35:11 -0800 (PST)
Message-ID: <9d3cb398-56fa-a07e-1932-baf6f75cf81f@canonical.com>
Date:   Sat, 15 Jan 2022 17:35:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 1/3] dt-bindings: arm: samsung: document chagallwifi board
 binding
Content-Language: en-US
To:     Henrik Grimler <henrik@grimler.se>, semen.protsenko@linaro.org,
        virag.david003@gmail.com, martin.juecker@gmail.com,
        cw00.choi@samsung.com, m.szyprowski@samsung.com,
        alim.akhtar@samsung.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20220113154019.74434-1-henrik@grimler.se>
 <20220113154019.74434-2-henrik@grimler.se>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220113154019.74434-2-henrik@grimler.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 13/01/2022 16:40, Henrik Grimler wrote:
> Add binding for Samsung Galaxy Tab S 10.5", based on Exynos 5420 with
> codename chagallwifi. It was released in 2014 and has several siblings
> with similar hardware.
> 
> Signed-off-by: Henrik Grimler <henrik@grimler.se>
> ---
>  .../devicetree/bindings/arm/samsung/samsung-boards.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> index 052cd94113d4..3f2ffb0d7b46 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
> @@ -140,6 +140,7 @@ properties:
>          items:
>            - enum:
>                - insignal,arndale-octa           # Insignal Arndale Octa
> +              - samsung,chagallwifi             # Samsung SM-T800

"samsung,chagall-wifi"
(reason given in patch #3)

Best regards,
Krzysztof
