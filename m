Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7023E4D62
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  9 Aug 2021 21:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235583AbhHITtd (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 9 Aug 2021 15:49:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236113AbhHITtc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Aug 2021 15:49:32 -0400
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CE69C061796
        for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Aug 2021 12:49:12 -0700 (PDT)
Received: by mail-ua1-x92e.google.com with SMTP id y14so2529612uai.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 09 Aug 2021 12:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hS6mugWBVrdBQ+s7IARTItkpVBPXB78DcP4vbl3NLWs=;
        b=QY6l0sqm3EoO1m/gimf3XnQgtuS8sTIBI7UqsEBihWhm5H7qzrLmVtwxNt0QmHTT3J
         t1VgtqEiZaEuEO++9s7QLSzCvVvQbM5k7ZdkksIDZ+g4wC48oPtTeVNDz+lSDR6VVkiB
         SUSEgu7LOJVX/1Gr9kFZk0RTKoBSpIPX0e9dLq8tmGwwq7q3wlamtQy5c8lpUo/E3QJQ
         TnD8XnZZt29w18gb/nz1EMdtolhsYjU9f94oB4MQsGeqfVx8q/Xt0zTlr47cLtdhvuVY
         kfFoAOMgnJSV4oOjRrN1B7bLOXzRTBrrLMJF1dvsK2ZsKigwAjsrW5D6yM2VU4fTVogy
         aVKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hS6mugWBVrdBQ+s7IARTItkpVBPXB78DcP4vbl3NLWs=;
        b=Gu9HE2Szps00GQX7d3OUC/DM6JOWlYwcD5rKRBChA2V/iPljN4f4gbAEcfsrqbrJLT
         j+v1SSeQSIXhQmf7bETD+sHdIYpyt1V7/fogmA4Rs9XF7f+HHGwMcT5aK57a/7ENkNvG
         0nN8ewHBDu75xNLJ8hwgaIR0SrJCf2akEScOllDVbeRu4l/IO42N3mPWdRTVq46XIihC
         UVGu2OBAN0y1yhEVSWxIWf0lxypVXEXenIv4Q/Wlw59G7LKQQJa3szTzoQ7HjleFcCj9
         Yk6NC1xDrhV2sWbFWuY+6bq4haihKuQUViy4SI5JZPQbC9UYWkJBpY0wo9t+2U/Vp+Vq
         8Tog==
X-Gm-Message-State: AOAM532WR60wQ9vq5cJsIlabx2RoLZJusMh5kt84NY4nqFOoVtyFFDEQ
        iLUaTsEAibgn7h99nY4206O/DElYFG3q0q8UzUBylA==
X-Google-Smtp-Source: ABdhPJy/Qhm5JfnmTrQPU4LpGpAFA7J5SesGxho4OVHDozLtLefBxN5PeCdlTmo330sDP43G5PnlmowL0u+AlzB4BG4=
X-Received: by 2002:ab0:7014:: with SMTP id k20mr3973392ual.9.1628538551175;
 Mon, 09 Aug 2021 12:49:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210806152146.16107-1-semen.protsenko@linaro.org>
 <20210806152146.16107-8-semen.protsenko@linaro.org> <3add6f87-7293-e1ae-8f9e-c69e9de18cf5@canonical.com>
In-Reply-To: <3add6f87-7293-e1ae-8f9e-c69e9de18cf5@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 9 Aug 2021 22:48:59 +0300
Message-ID: <CAPLW+4=-uUcoLCjjBAC2K5NLswnXGXW1qrsTJrb_uZDgOQ5Ehw@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] clk: samsung: Add Exynos850 clock driver stub
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Marc Zyngier <maz@kernel.org>,
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 9 Aug 2021 at 14:23, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 06/08/2021 17:21, Sam Protsenko wrote:
> > For now it's just a stub driver to make the serial driver work. Later it
> > will be implemented properly. This driver doesn't really change clocks,
> > only registers the UART clock as a fixed-rate clock. Without this clock
> > driver the UART driver won't work, as it's trying to obtain "uart" clock
> > and fails if it's not able to.
> >
> > In order to get a functional serial console we have to implement that
> > minimal clock driver with "uart" clock. It's not necessary to actually
> > configure clocks, as those are already configured in bootloader, so
> > kernel can rely on that for now.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> > Changes in v2:
> >   - Used hard coded clock indexes, as clock bindings were removed; will
> >     add clock bindings back (reimplemented) once proper clock driver is
> >     ready
> >   - Removed .data = 0 for exynos850-oscclk, as it's in BSS section
> >   - Removed comma for terminator {}
> >   - Made exynos850_clk_init() static
> >   - Removed checking np for NULL, as it's already done in of_iomap()
> >
> >  drivers/clk/samsung/Makefile        |  1 +
> >  drivers/clk/samsung/clk-exynos850.c | 64 +++++++++++++++++++++++++++++
> >  2 files changed, 65 insertions(+)
> >  create mode 100644 drivers/clk/samsung/clk-exynos850.c
> >
> > diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefile
> > index 028b2e27a37e..c46cf11e4d0b 100644
> > --- a/drivers/clk/samsung/Makefile
> > +++ b/drivers/clk/samsung/Makefile
> > @@ -17,6 +17,7 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)       += clk-exynos5433.o
> >  obj-$(CONFIG_EXYNOS_AUDSS_CLK_CON) += clk-exynos-audss.o
> >  obj-$(CONFIG_EXYNOS_CLKOUT)  += clk-exynos-clkout.o
> >  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)        += clk-exynos7.o
> > +obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)        += clk-exynos850.o
> >  obj-$(CONFIG_S3C2410_COMMON_CLK)+= clk-s3c2410.o
> >  obj-$(CONFIG_S3C2410_COMMON_DCLK)+= clk-s3c2410-dclk.o
> >  obj-$(CONFIG_S3C2412_COMMON_CLK)+= clk-s3c2412.o
> > diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
> > new file mode 100644
> > index 000000000000..36c7c7fe7cf0
> > --- /dev/null
> > +++ b/drivers/clk/samsung/clk-exynos850.c
> > @@ -0,0 +1,64 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2019 Samsung Electronics Co., Ltd.
> > + * Copyright (C) 2021 Linaro Ltd.
> > + *
> > + * Common Clock Framework support for Exynos850 SoC.
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/clkdev.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/of.h>
> > +#include <linux/of_address.h>
> > +
> > +#include "clk.h"
> > +
> > +/* Will be extracted to bindings header once proper clk driver is implemented */
> > +#define OSCCLK               1
> > +#define DOUT_UART    2
> > +#define CLK_NR_CLKS  3
> > +
> > +/* Fixed rate clocks generated outside the SoC */
> > +static struct samsung_fixed_rate_clock exynos850_fixed_rate_ext_clks[] __initdata = {
> > +     FRATE(OSCCLK, "fin_pll", NULL, 0, 26000000),
> > +};
> > +
> > +/*
> > + * Model the UART clock as a fixed-rate clock for now, to make serial driver
> > + * work. This clock is already configured in the bootloader.
> > + */
> > +static const struct samsung_fixed_rate_clock exynos850_peri_clks[] __initconst = {
> > +     FRATE(DOUT_UART, "DOUT_UART", NULL, 0, 200000000),
> > +};
> > +
> > +static const struct of_device_id ext_clk_match[] __initconst = {
> > +     { .compatible = "samsung,exynos850-oscclk" },
>
> One more thing - I am not sure anymore if this is correct. AFAIR, we
> wanted to drop compatibles for external clocks.
>

I'll remove oscclk from the clock driver and device tree. It's not
needed right now anyway, as that driver is just a stub.

But I'd still like to know the proper way to define external clocks. I
can see that in exynos7.dtsi and exynos5433.dtsi there is just regular
fixed clock defined for "oscclk" (or "fin_pll"), and then that clock
is referenced in corresponding clock driver by its
'clock-output-names' property. I guess that approach is the
recommended one?

> Chanwoo, Sylwester, Tomasz,
> Do you remember the recommended approach? Shall it be like Exynos542x
> (samsung,exynos5420-oscclk) or Exynos5433?
>
>
> BTW, I am now converting some of existing clock controller bindings to
> dtschema.
>

I'll try to review those in a day, that might also be helpful when I
get to clk implementation. Btw, thank you for reviewing my patches in
such a quick pace!

> Best regards,
> Krzysztof
