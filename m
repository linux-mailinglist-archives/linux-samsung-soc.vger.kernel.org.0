Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B68D1488A7
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 17 Jun 2019 18:16:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727536AbfFQQQB (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 17 Jun 2019 12:16:01 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:33097 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726923AbfFQQQB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 12:16:01 -0400
Received: by mail-vs1-f67.google.com with SMTP id m8so6506622vsj.0;
        Mon, 17 Jun 2019 09:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qQmSRu+9/ciMEk74FdjnT5EyLM/oYfhns2Sv98gXQKQ=;
        b=TCZMnL+FLD4zJekHRbUA172UIv9s/PfZRpM+7lk5d5crxqQkbWMH4nQ7nVeABx5Zy1
         VO/tRNFw5InXjJr3dOIiAj6JkBUmUBoU/N3Evcn4NRXL/BF9E9Zcr9GFHqhdSWGOxPhc
         eT8fdgbwbObFgkJ2s0BlHuI+ZfoFlHaKYHG5hGVpYHLxAMdmroXn77Jwh85pgthDHVnt
         RCfOQ7rSL9VGRw1Vb+uIjiUHPTnMJUioxJJt6SQ5EU/0aqoge+8yWJ+k5kOWdbGzFLJ6
         xl6XUTrJa0LLsvVLFfA9qhuZTJ5TpNrkRKZ9Ps2j9+sQIUcitV86uCfbk9Zz1VJHxVkL
         rrnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qQmSRu+9/ciMEk74FdjnT5EyLM/oYfhns2Sv98gXQKQ=;
        b=LvwuASBVsvkluiUTWVrO7oxrEFBpkfznmsDkMNZevod2r6TtnbK2priIkL5aqV3T7Y
         Vn6c8b+dwJ8TKg+MJY7vdOsJOx5hedB6sX80vzHTTSDNlPuUfb1tVaUJLI7+CSNwWuNA
         a9vML41/BiYJc05Oc0nU2VXwo+xAb3pdUZbOp2kUFE4As2MbqgxDUNQrlk+BRwXmq2mI
         xYAJYc4OQwflgIDfHURcMtziYQfH1sRCWZpGVJuquJAFd1gmx7Dt7DX8tLjbyoSz9qQa
         Fg+k49VDash76BUkaEBQGvEzPSJeEVwJ0m/nZ1tcU8Jdrm1/ZFfEbr2mSDJpVieLiNoK
         UB9w==
X-Gm-Message-State: APjAAAXn1FxmAYGmmpk4Z4lQo6WWWQaSmi/brFVZ4/y/qoz9MRMNGWXb
        6xs/UEd6Z5g3Gfh9z3bGgW8jr0pCfz01VIQNf+4=
X-Google-Smtp-Source: APXvYqzjRBBZjUcF4pveR06nHvyJQ46JmxJV/AnG40g/cVPwL2BF5JdmZMIDvskR2BhvlBGM6E3kQ6SK1aYsBQ4tJok=
X-Received: by 2002:a67:f998:: with SMTP id b24mr49714206vsq.180.1560788159899;
 Mon, 17 Jun 2019 09:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203144.3850-2-joseph.kogut@gmail.com> <20190614235719.8134-1-joseph.kogut@gmail.com>
 <20190616085928.GB3826@kozik-lap>
In-Reply-To: <20190616085928.GB3826@kozik-lap>
From:   Joseph Kogut <joseph.kogut@gmail.com>
Date:   Mon, 17 Jun 2019 09:15:23 -0700
Message-ID: <CAMWSM7j8dtsS4d-hOc3Sk6OJHs+SiGC9tEaZBEmO0VKmtJguKw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm: dts: add ARM Mali GPU node for Odroid XU3
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, kgene@kernel.org,
        airlied@linux.ie, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

Thanks for the review.

On Sun, Jun 16, 2019 at 1:59 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Fri, Jun 14, 2019 at 04:57:19PM -0700, Joseph Kogut wrote:
> > Add device tree node for mali gpu on Odroid XU3 SoCs.
> >
> > Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> > ---
> >
> > Changes v1 -> v2:
> > - Use interrupt name ordering from binding doc
> > - Specify a single clock for GPU node
> > - Add gpu opp table
> > - Fix warnings from IRQ_TYPE_NONE
> >
> >  .../boot/dts/exynos5422-odroidxu3-common.dtsi | 26 +++++++++++++++++++
>
> This should go to exynos5422-odroid-core.dtsi instead, because it is
> common to entire Odroid Exynos5422 family (not only XU3 family).
>
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> > index 93a48f2dda49..b8a4246e3b37 100644
> > --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> > +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> > @@ -48,6 +48,32 @@
> >               cooling-levels = <0 130 170 230>;
> >       };
> >
> > +     gpu: gpu@11800000 {
> > +             compatible = "samsung,exynos-mali", "arm,mali-t628";
>
> This is common to all Exynos542x chips so it should go to
> exynos5420.dtsi. Here you would need to only enable it and provide
> regulator.
>

To clarify, which pieces are specific to the Odroid Exynos 5422
family, and which are common to the entire Exynos 542x family? I'm
thinking the gpu node is common to the 542x family, including the
interrupts and clock, and the regulator and opp table are specific to
the Odroid 5422?

> Probably this should be also associated with tmu_gpu as a cooling device
> (if Mali registers a cooling device...). Otherwise the tmu_gpu is not
> really used for it.
>

We have two operating performance points for the GPU, but I'm not sure
at what temperature we should trip the lower opp. Looking at the trip
temperatures for the CPU, we have four alerts, and one critical trip.
The highest alert is 85 C, would it be reasonable to trigger the lower
GPU opp at this temperature? Should it trigger sooner?

> > +             reg = <0x11800000 0x5000>;
> > +             interrupts = <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
> > +                          <GIC_SPI 74  IRQ_TYPE_LEVEL_HIGH>,
> > +                          <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> > +             interrupt-names = "job", "mmu", "gpu";
> > +             clocks = <&clock CLK_G3D>;
> > +             mali-supply = <&buck4_reg>;
>
> Please check if always-on property could be removed from buck4.

I've checked, and this property can be removed safely.

> Also, what about LDO27? It should be used as well (maybe through
> vendor-specific properties which would justify the need of new vendor
> compatible).
>

I'm unsure how LDO27 is used, can you elaborate?

Best,
Joseph
