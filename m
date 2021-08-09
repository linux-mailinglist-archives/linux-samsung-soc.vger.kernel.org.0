Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86ADF3E4495
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  9 Aug 2021 13:23:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235043AbhHILXV (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 9 Aug 2021 07:23:21 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:43092
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234996AbhHILXV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Aug 2021 07:23:21 -0400
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id F354F3F353
        for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Aug 2021 11:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628508179;
        bh=vRoT5BSxcI/qFuszLL/O88HOU90cRS5N0ZHejOSe9B0=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Z/pzPbyaPCnYQ2p2HAMMNKIjwl14P/uQ7RpsR3NQbl3bIG2uMCKYnd+ZjG6qDO492
         8teWO2WAh4iF27UISNIUj9AL5LEFmJPafrMGzSjWBuIablPlGB/hFgUaQ3iqz5893S
         qaobIZhEVLgar+lzCNyEh9kcQ17I3KMebzA+UB3nO3NMPk77Pxw7gvxn6gMrwwwTst
         cy3BVgP2WzGNmOJDxwQMyaDZuKGCqZnbxkM4Wy8dQPWtUuAh7LRAXGS2zZKi4lQqMp
         aFI3N2R5zEkbsMmKu5gAuc9DwQ/0qXUEV9PeZ1hBZ0jZySbMgXYNGszxI4JTGsHUF3
         LzW1Jkgw7sMYg==
Received: by mail-ej1-f70.google.com with SMTP id k22-20020a1709061596b02905a370b2f477so4404021ejd.17
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Aug 2021 04:22:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vRoT5BSxcI/qFuszLL/O88HOU90cRS5N0ZHejOSe9B0=;
        b=MnaV3hp9ZJrd+l2oZZfi+nj+duTtv7FJKD5PIBxqX45uzURudYmoDw/8b+NZxgCHrC
         ZmrFOgaQpMiZBB+MHPStiGpv/8q4ciUWWz2BS0VEBUOtb3KJ4YL4m+0mD0DY+4XoNyk+
         6egKAXoriN73B+4+6jd/8I4mq1vefuABxrGhm0jIaVPAJjlvk+hwJK8wDFx3JXRkrX1s
         cK9XTvC4z8Aw3kV95d4O8Zm6oEFP16GAHc9cjj7qE67PY4w6Q5CxQ+5QwP452ELvYc8g
         EaCPZrnA99b7XmW7Um/LCTRmOoBaTdO/WTaZ4TL23tp1GID/jzSOzMSOBE5z9RtllFzW
         vd/g==
X-Gm-Message-State: AOAM531/Jg+nGHA6Dkj+4gOm/q24r8NrqX80mEOu6/Y0cxBLubVvly5V
        a0P/aB9OmUt6WFmIXcdUsUZdZ7kjXIgUo7C/YvJrcUX+xDjVu5sT4qDHceRWHR7JL/o+qmmpeR6
        5Yca4Oe64Bu1pNBEj0BYzHrdgDhHWpXjpZLFk/AhqGW5iN7FU
X-Received: by 2002:a50:cc06:: with SMTP id m6mr8360392edi.97.1628508179582;
        Mon, 09 Aug 2021 04:22:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6XjMI02FzZDa29mvOYI4lhR2QTlk6CwiRU3KFxBkR1w1Iwv1+C2mD+X6K5L1Go6NB91ffkw==
X-Received: by 2002:a50:cc06:: with SMTP id m6mr8360357edi.97.1628508179449;
        Mon, 09 Aug 2021 04:22:59 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id l20sm5813866ejb.23.2021.08.09.04.22.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 04:22:59 -0700 (PDT)
Subject: Re: [PATCH v2 7/8] clk: samsung: Add Exynos850 clock driver stub
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc:     Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
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
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20210806152146.16107-1-semen.protsenko@linaro.org>
 <20210806152146.16107-8-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <3add6f87-7293-e1ae-8f9e-c69e9de18cf5@canonical.com>
Date:   Mon, 9 Aug 2021 13:22:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806152146.16107-8-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/08/2021 17:21, Sam Protsenko wrote:
> For now it's just a stub driver to make the serial driver work. Later it
> will be implemented properly. This driver doesn't really change clocks,
> only registers the UART clock as a fixed-rate clock. Without this clock
> driver the UART driver won't work, as it's trying to obtain "uart" clock
> and fails if it's not able to.
> 
> In order to get a functional serial console we have to implement that
> minimal clock driver with "uart" clock. It's not necessary to actually
> configure clocks, as those are already configured in bootloader, so
> kernel can rely on that for now.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v2:
>   - Used hard coded clock indexes, as clock bindings were removed; will
>     add clock bindings back (reimplemented) once proper clock driver is
>     ready
>   - Removed .data = 0 for exynos850-oscclk, as it's in BSS section
>   - Removed comma for terminator {}
>   - Made exynos850_clk_init() static
>   - Removed checking np for NULL, as it's already done in of_iomap()
> 
>  drivers/clk/samsung/Makefile        |  1 +
>  drivers/clk/samsung/clk-exynos850.c | 64 +++++++++++++++++++++++++++++
>  2 files changed, 65 insertions(+)
>  create mode 100644 drivers/clk/samsung/clk-exynos850.c
> 
> diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> index 028b2e27a37e..c46cf11e4d0b 100644
> --- a/drivers/clk/samsung/Makefile
> +++ b/drivers/clk/samsung/Makefile
> @@ -17,6 +17,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos5433.o
>  obj-$(CONFIG_EXYNOS_AUDSS_CLK_CON) += clk-exynos-audss.o
>  obj-$(CONFIG_EXYNOS_CLKOUT)	+= clk-exynos-clkout.o
>  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos7.o
> +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)	+= clk-exynos850.o
>  obj-$(CONFIG_S3C2410_COMMON_CLK)+= clk-s3c2410.o
>  obj-$(CONFIG_S3C2410_COMMON_DCLK)+= clk-s3c2410-dclk.o
>  obj-$(CONFIG_S3C2412_COMMON_CLK)+= clk-s3c2412.o
> diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
> new file mode 100644
> index 000000000000..36c7c7fe7cf0
> --- /dev/null
> +++ b/drivers/clk/samsung/clk-exynos850.c
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2019 Samsung Electronics Co., Ltd.
> + * Copyright (C) 2021 Linaro Ltd.
> + *
> + * Common Clock Framework support for Exynos850 SoC.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clkdev.h>
> +#include <linux/clk-provider.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +
> +#include "clk.h"
> +
> +/* Will be extracted to bindings header once proper clk driver is implemented */
> +#define OSCCLK		1
> +#define DOUT_UART	2
> +#define CLK_NR_CLKS	3
> +
> +/* Fixed rate clocks generated outside the SoC */
> +static struct samsung_fixed_rate_clock exynos850_fixed_rate_ext_clks[] __initdata = {
> +	FRATE(OSCCLK, "fin_pll", NULL, 0, 26000000),
> +};
> +
> +/*
> + * Model the UART clock as a fixed-rate clock for now, to make serial driver
> + * work. This clock is already configured in the bootloader.
> + */
> +static const struct samsung_fixed_rate_clock exynos850_peri_clks[] __initconst = {
> +	FRATE(DOUT_UART, "DOUT_UART", NULL, 0, 200000000),
> +};
> +
> +static const struct of_device_id ext_clk_match[] __initconst = {
> +	{ .compatible = "samsung,exynos850-oscclk" },

One more thing - I am not sure anymore if this is correct. AFAIR, we
wanted to drop compatibles for external clocks.

Chanwoo, Sylwester, Tomasz,
Do you remember the recommended approach? Shall it be like Exynos542x
(samsung,exynos5420-oscclk) or Exynos5433?


BTW, I am now converting some of existing clock controller bindings to
dtschema.

Best regards,
Krzysztof
