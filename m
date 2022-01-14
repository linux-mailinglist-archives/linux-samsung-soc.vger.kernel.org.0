Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BE7A48F08C
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 14 Jan 2022 20:43:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234013AbiANTnU (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 14 Jan 2022 14:43:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbiANTnU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 14 Jan 2022 14:43:20 -0500
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E530C06173E
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jan 2022 11:43:20 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id m15so18750761uap.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jan 2022 11:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SuDrM47lFk/xDnPQavWDEhpvX1OVCj87e4C8wMv47ek=;
        b=uU0y8MeH7ve3HVo6h9z/sLq34dpYEr+rV2qzGcCr4pvByRsnTngS3RdUC929Q5Dg3a
         MNHT6FEFCpjGpCIUCNfZ63m1xfrbIoVSY7mkvVbrn97TRWm7hYztComguPi9lLrvt+tj
         K9itw2i0WKtyXbLQwfyRtRf8tqfLa51Kp1KRkABTRJfNhhFvCMr31GE6BcfkpTYe6UB5
         74P5fMJxMcHiPeXjBF6PBn7JWkCMk1TE2IAWkGsK9Mrwt+1FxI72fj+7/ZkC5DgZM/bs
         hYcuaPnqNkBuGvXpNsoVi12P2Uj25JPYntMniKtJ6cvZHUZJHVoRHGcnzmAjVLrBEBlr
         khZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SuDrM47lFk/xDnPQavWDEhpvX1OVCj87e4C8wMv47ek=;
        b=zscwjAqBBgJQStBMHwndqowDBlGLT+KqVJsgkzElaJFApqk8ZRFlvab14ES7Kd2LF8
         FxNdmdH33uNjm1MDRQPKxsbg1rwt0DrhBwbVXIRWhcYDyJdu28flxMsIL8O6t/7DUwkb
         OaGlja8Pl9muq9qC2/EZVuNgVktr21zhr6QNOPX0+LPYNd4VlK21wdeIbsaiUiZqvUkN
         afaoaVldPPw7obSX8Tf4gLHc6I/jAojFUe6KZ3Zbko1Gn1e8QaVHH3P+KAS8nZT3xQfs
         I3ErUXFv370mNuonwr727Ykj2Wu7vrVdUKzlD6bnN1eLGBlOPIxjEVPcopGWOVlAaTpu
         HVVQ==
X-Gm-Message-State: AOAM532a98yKf46v0R9Oh6EX266YcOWB2XUtK2KuMrlCWQsJKCF84NVS
        2fuqitE1AJJRzzw6/+ldcpT9AbB2O8cF2Iv6388Ixg==
X-Google-Smtp-Source: ABdhPJyeMH1f9mXJzL3vPuJzvceBqGFTOKsg1Rw8BBDEk0mroinGSUCRlAly7dYzr6vVxaSCf8tdOhRcDxTleLBBqN0=
X-Received: by 2002:a9f:3e09:: with SMTP id o9mr4836020uai.114.1642189399311;
 Fri, 14 Jan 2022 11:43:19 -0800 (PST)
MIME-Version: 1.0
References: <20220103181826.2136-1-semen.protsenko@linaro.org> <b40fedf8-73d7-6f4e-d26e-2f274b15228a@canonical.com>
In-Reply-To: <b40fedf8-73d7-6f4e-d26e-2f274b15228a@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 14 Jan 2022 21:43:07 +0200
Message-ID: <CAPLW+4k7VEh0E312Cw=AjufOo_OisJ5yrLm1QdhAcHFqayVv+w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: exynos: Add missing gpm6 and gpm7 nodes to Exynos850
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Chanho Park <chanho61.park@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 7 Jan 2022 at 10:05, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 03/01/2022 19:18, Sam Protsenko wrote:
> > gpm6 and gpm7 nodes are missing in Exynos850 device tree. Next errors
> > are reported because of that:
> >
> >     Missing node for bank gpm6 - invalid DTB
> >     Missing node for bank gpm7 - invalid DTB
> >
> > Add missing nodes to make those available to use, and to fix boot
> > errors.
> >
> > Fixes: e3493220fd3e ("arm64: dts: exynos: Add initial Exynos850 SoC support")
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> > NOTES:
> >   - Recommend to apply this patch after "arm64: dts: exynos: align
> >     pinctrl with dtschema in Exynos850"
> >   - This patch also brings back two interrupts removed in "arm64:
> >     dts: exynos: drop incorrectly placed wakeup interrupts in Exynos850"
>
> I'll take it after the merge window and apply it before my series (so
> without -gpio-bank suffix).
>

Sure, whatever you think is best.

> >
> >  .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 20 +++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
> > index a71acf358d2d..f43e4a206282 100644
> > --- a/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
> > @@ -194,6 +194,26 @@ gpm5: gpm5-gpio-bank {
> >               interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> >       };
> >
> > +     gpm6: gpm6-gpio-bank {
> > +             gpio-controller;
> > +             #gpio-cells = <2>;
> > +
> > +             interrupt-controller;
> > +             #interrupt-cells = <2>;
> > +             interrupt-parent = <&gic>;
> > +             interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
> > +     };
> > +
> > +     gpm7: gpm7-gpio-bank {
> > +             gpio-controller;
> > +             #gpio-cells = <2>;
> > +
> > +             interrupt-controller;
> > +             #interrupt-cells = <2>;
> > +             interrupt-parent = <&gic>;
> > +             interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> > +     };
> > +
> >       /* USI_CMGP0: HSI2C function */
> >       hsi2c3_pins: hsi2c3-pins {
> >               samsung,pins = "gpm0-0", "gpm1-0";
> >
>
>
> Best regards,
> Krzysztof
