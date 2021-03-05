Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81E2932E6E8
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  5 Mar 2021 11:59:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229688AbhCEK7A (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 5 Mar 2021 05:59:00 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:51048 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbhCEK6x (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 5 Mar 2021 05:58:53 -0500
Received: from mail-wm1-f71.google.com ([209.85.128.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lI8AV-0001Fx-K9
        for linux-samsung-soc@vger.kernel.org; Fri, 05 Mar 2021 10:58:51 +0000
Received: by mail-wm1-f71.google.com with SMTP id l16so365945wmc.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Mar 2021 02:58:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4aJfVlauewtRE5vCynuYGIqgJwZdZisFk3AW2s1txII=;
        b=SPfJbyBajx0klbuhmN2HiKexkehp0V8xGoZOU8+E+dbVG4+kBW8Kk36m1Hyw4vI6J4
         Mr8/4Kk8PZH3k76Jfd7hXIGbNaUx4MmHYxL7CTFRG3OlggJOFsly52jkVfWGMC6zpKJ/
         8yC61R3cqMGv+yrSXTMcot932SDI9XA77QXTVOoJkrLT9SFl7pt1x3T4UPlnXoUtIU79
         w+ejZQ54otabeoWpnnyz9GJ4vDFp12HMTJzX7hv69Sw4RTBHdmossL8eHKub1cTy3uwn
         v6GMwPLQKv1FQtHa5V6d7SyQcxRnwKy/s4VAS+hlyxHfoL9bnxclk0L0HLA3niY8sf2e
         n1RA==
X-Gm-Message-State: AOAM530JVxYtkj/Sirltgx0jwTAJQBet8Px4A1dkDVF1fhPFg/n4tRiL
        ntpctYhNbdMwNWJVbdONXm3cEi29KGTnetzx7BQP7u0NOBd07rjseOTbpf4ciKQUPwTrKaqKFOH
        xzgorq38FXe/DimCUSQYcLJ7yaJgluT5kMPqLisJjNBvvr1aL
X-Received: by 2002:a7b:cb99:: with SMTP id m25mr8423383wmi.64.1614941931429;
        Fri, 05 Mar 2021 02:58:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmQw4qIFRa6N+eh+U12JE4vYPax7TgkB7xnzrasYQiJvSoeqLGr8BCj354zBBg7bPpy0fgIA==
X-Received: by 2002:a7b:cb99:: with SMTP id m25mr8423363wmi.64.1614941931318;
        Fri, 05 Mar 2021 02:58:51 -0800 (PST)
Received: from [192.168.1.116] (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id h2sm4309640wrq.81.2021.03.05.02.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 02:58:51 -0800 (PST)
Subject: Re: [RFT PATCH v3 24/27] tty: serial: samsung_tty: Add support for
 Apple UARTs
To:     Hector Martin <marcan@marcan.st>,
        linux-arm-kernel@lists.infradead.org
Cc:     Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Tony Lindgren <tony@atomide.com>,
        Mohamed Mediouni <mohamed.mediouni@caramail.com>,
        Stan Skowronek <stan@corellium.com>,
        Alexander Graf <graf@amazon.com>,
        Will Deacon <will@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Christoph Hellwig <hch@infradead.org>,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210304213902.83903-1-marcan@marcan.st>
 <20210304213902.83903-25-marcan@marcan.st>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <3ed6840e-1c12-4145-c2d5-cb05cac156e9@canonical.com>
Date:   Fri, 5 Mar 2021 11:58:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210304213902.83903-25-marcan@marcan.st>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04/03/2021 22:38, Hector Martin wrote:
> Apple SoCs are a distant descendant of Samsung designs and use yet
> another variant of their UART style, with different interrupt handling.
> 
> In particular, this variant has the following differences with existing
> ones:
> 
> * It includes a built-in interrupt controller with different registers,
>   using only a single platform IRQ
> 
> * Internal interrupt sources are treated as edge-triggered, even though
>   the IRQ output is level-triggered. This chiefly affects the TX IRQ
>   path: the driver can no longer rely on the TX buffer empty IRQ
>   immediately firing after TX is enabled, but instead must prime the
>   FIFO with data directly.
> 
> Signed-off-by: Hector Martin <marcan@marcan.st>
> ---
>  drivers/tty/serial/Kconfig       |   2 +-
>  drivers/tty/serial/samsung_tty.c | 238 +++++++++++++++++++++++++++++--
>  include/linux/serial_s3c.h       |  16 +++
>  3 files changed, 247 insertions(+), 9 deletions(-)
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
