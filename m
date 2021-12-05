Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84315468C16
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  5 Dec 2021 17:24:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235898AbhLEQ1u (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 5 Dec 2021 11:27:50 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:49386
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235873AbhLEQ1u (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 5 Dec 2021 11:27:50 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 09D304003A
        for <linux-samsung-soc@vger.kernel.org>; Sun,  5 Dec 2021 16:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638721461;
        bh=nbJ6HUZTiIpY2dLLhX4P5MU4lthn/nI4dze09TvpBwY=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=FrDbT8zY0mOFyOHsL8w0TZ5pRkPNLG8TTZ+bj4cDbsFgLWK7uno29d4JV3gnc6xyV
         NoJXELsJuWLGni5DBIYvs7eErG7jKoAoisZ3H2xXhgSoGpU7v5PN25amCNS6JwBHEd
         mxmF8JfRQAq1zYgTyUpWtrUzjgABTbUYIJUF8VUgFGxQOIZTNXtA30kIos0pc3Rsfe
         RqFfNfdYJWl5OhRn+D7RE5/t8H00nTDOnqPog1LuXqSmezUHpHiOG/eisFw1NTU6Sp
         WfQsvVfDywo4/wnnIzBgwJDO6OL9FHs57f3pA3Xn71/motLTuCp1kQA4RqaB+ouqeT
         v72jFX2JFYXvw==
Received: by mail-lf1-f72.google.com with SMTP id e23-20020a196917000000b0041bcbb80798so582125lfc.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Dec 2021 08:24:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nbJ6HUZTiIpY2dLLhX4P5MU4lthn/nI4dze09TvpBwY=;
        b=7OQyzgkm0zstEwBfHde+6hnyIlUvQoQ+azrZ6lcofs4PhrQ8ssQF/cNJTPsqIFGy5R
         BZ9GqnllylKthNfojq4Tr94b461yQYZtTV+lfl2PDCMZ/0QQfsLuRsWB8v3YtVJ/nKQU
         t93dSopcKBKfMOS5XJWOvOpsYmpkNJThIC8vRA8SBKNNEJo0b8OJl4nZCSj3cu5/6ImR
         drF5trsbijmUDzaWTEgu3f/NJxRqtzrr4bRnrvqHDpzhGAzJDxIcvrO7yV+rOWulM7Bp
         d5IzpBKOP3uNL5LpMsOs9JGIl6Sj255NU+WEHW3avCNvHO7w9MOtX0GSuT1iyz7q2r/2
         ROVQ==
X-Gm-Message-State: AOAM532rbK695Hk2gTioZ7pDEn4X7uBYvbGSld74C4t3iifta8yj3BQp
        iF9fNSb2mgl84x3b6heh1nVwgpUNWE9pZtDUHXS2tejNnVfVhNCHEz/TSWbktDUNwo+cfi4+M0l
        91x0jjtPUJeYwzqnMYHMrKM6SuCyOhAqKhNB3sfIY6bGgn3Aw
X-Received: by 2002:a05:6512:1510:: with SMTP id bq16mr28585910lfb.628.1638721460386;
        Sun, 05 Dec 2021 08:24:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzR/xCJPwKB2U8RdTOYNbXSPYhS9ES4jpT5RpBqrBntCiLjZSPJ+9rYbwp9ILjuquAir6a5Hw==
X-Received: by 2002:a05:6512:1510:: with SMTP id bq16mr28585885lfb.628.1638721460121;
        Sun, 05 Dec 2021 08:24:20 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id l5sm1102009ljh.66.2021.12.05.08.24.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Dec 2021 08:24:19 -0800 (PST)
Message-ID: <fb31a159-6d2e-6c9a-439f-f19ef4fd4732@canonical.com>
Date:   Sun, 5 Dec 2021 17:24:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v3 0/5] soc: samsung: Add USI driver
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20211204195757.8600-1-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211204195757.8600-1-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04/12/2021 20:57, Sam Protsenko wrote:
> USIv2 IP-core provides selectable serial protocol (UART, SPI or
> High-Speed I2C); only one can be chosen at a time. This series
> implements USIv2 driver, which allows one to select particular USI
> function in device tree, and also performs USI block initialization.
> 
> With that driver implemented, it's not needed to do USI initialization
> in protocol drivers anymore, so that code is removed from the serial
> driver.
> 
> Because USI driver is tristate (can be built as a module), serial driver
> was reworked so it's possible to use its console part as a module too.
> This way we can load serial driver module from user space and still have
> serial console functional.
> 
> Design features:
>   - "reg" property contains USI registers start address (0xc0 offset);
>     it's used in the driver to access USI_CON and USI_OPTION registers.
>     This way all USI initialization (reset, HWACG, etc) can be done in
>     USIv2 driver separately, rather than duplicating that code over
>     UART/SPI/I2C drivers
>   - System Register (system controller node) and its SW_CONF register
>     offset are provided in "samsung,sysreg" property; it's used to
>     select USI function (protocol to be used)
>   - USI function is specified in "samsung,mode" property; integer value
>     is used to simplify parsing
>   - there is "samsung,clkreq-on" bool property, which makes driver
>     disable HWACG control (needed for UART to work properly)
>   - PCLK and IPCLK clocks are both provided to USI node; apparently both
>     need to be enabled to access USI registers
>   - protocol nodes are embedded (as a child nodes) in USI node; it
>     allows correct init order, and reflects HW properly
>   - USI driver is a tristate: can be also useful from Android GKI
>     requirements point of view
>   - driver functions are implemented with further development in mind:
>     - we might want to add some DebugFs interface later
>     - some functions might need to be revealed to serial drivers with
>       EXPORT_SYMBOL(), and provide somehow pointer to needed USI driver
>       instance
>     - another USI revisions could be added (like USIv1)
> 
> Changes in v3:
>   - Renamed compatible from samsung,exynos-usi-v2 to samsung,exynos850-usi
>   - Used clk_bulk API instead of handling each clock separately
>   - Spell check fixes and coding style fixes
>   - Improved dt-bindings doc
> 
> Changes in v2:
>   - Renamed all 'usi_v2' wording to just 'usi' everywhere
>   - Removed patches adding dependency on EXYNOS_USI for UART/I2C/SPI
>     drivers
>   - Added patch: "tty: serial: samsung: Fix console registration from
>     module"
>   - Combined dt-bindings doc and dt-bindings header patches
>   - Reworked USI driver to be ready for USIv1 addition
>   - Improved dt-bindings
>   - Added USI_V2_NONE mode value
> 
> Sam Protsenko (5):
>   dt-bindings: soc: samsung: Add Exynos USI bindings
>   soc: samsung: Add USI driver
>   tty: serial: samsung: Remove USI initialization
>   tty: serial: samsung: Enable console as module
>   tty: serial: samsung: Fix console registration from module
> 

All this looks good to me. The serial driver changes should come
together with this one (usi driver is now a dependency for them). If I
am correct, mention this please in future cover letter (if there is such).

I will still need DTSI changes for Exynos Auto v9 and confirmation that
is not being used downstream and breaking DTB ABI is okay. Because this
will be a non-bisctable and also a DTB ABI break.

Best regards,
Krzysztof
