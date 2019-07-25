Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 72AB874E1E
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Jul 2019 14:27:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728567AbfGYM1J (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 25 Jul 2019 08:27:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:51724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727890AbfGYM1J (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 25 Jul 2019 08:27:09 -0400
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BF15722C7C
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2019 12:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564057628;
        bh=hvi3f3uSdwxr0fxa/SPUSykPmRb3g6bN/bUFZtDjvhI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=YZpskwbt1odRPzwi3XE+eml0ZTe9NPpZWTrMsgmJGPx4Y+qK+C7h906w6fLgMqtIU
         wHY0uOpjn1sjLb2P+cNhxg2E7sYmG1NlZq6DCzEjnDt37XfLmMHh9y/Feyj/djLrlW
         T8zZoehu8Pc5sagkTOSounsKUgxflLe6nTcz2/b8=
Received: by mail-lj1-f170.google.com with SMTP id t28so47798823lje.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2019 05:27:07 -0700 (PDT)
X-Gm-Message-State: APjAAAUuIZtqAwi/ks88HXq6xSWbYttJw9eQ0PWJAV9qP9eiPavlmWgB
        fyCCufdO30C0S5Ty1xFzFQT3+6vUYyjYNfAnLYg=
X-Google-Smtp-Source: APXvYqzN8ydq4aVkNBBiwc3aMzUs16m0V4H8GdXu0fjMbItklJjwxFqKAyKZIP0rj6F/MAszB1Y2IdacyLLN14bbkeM=
X-Received: by 2002:a2e:124b:: with SMTP id t72mr46505545lje.143.1564057625857;
 Thu, 25 Jul 2019 05:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190724072008.6272-1-guillaume.gardet@free.fr>
 <20190725083433.6505-1-guillaume.gardet@arm.com> <CAJKOXPejSxxH5DJPyEHTt=VEOdVgiXOm1c3MKKir-qRxtDcLLA@mail.gmail.com>
 <DBBPR08MB4678546DF9EE76EE6427DBB783C10@DBBPR08MB4678.eurprd08.prod.outlook.com>
In-Reply-To: <DBBPR08MB4678546DF9EE76EE6427DBB783C10@DBBPR08MB4678.eurprd08.prod.outlook.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 25 Jul 2019 14:26:54 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdLd5C0FPwijGwTWW9t46exysdqgeb07txPhp-f_b5DFA@mail.gmail.com>
Message-ID: <CAJKOXPdLd5C0FPwijGwTWW9t46exysdqgeb07txPhp-f_b5DFA@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] arm: dts: exynos: Add GPU/Mali T604 node to exynos5250
To:     Guillaume Gardet <Guillaume.Gardet@arm.com>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 25 Jul 2019 at 13:35, Guillaume Gardet <Guillaume.Gardet@arm.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > Sent: 25 July 2019 13:19
> > To: Guillaume Gardet <Guillaume.Gardet@arm.com>
> > Cc: linux-samsung-soc@vger.kernel.org; Kukjin Kim <kgene@kernel.org>; linux-
> > arm-kernel@lists.infradead.org
> > Subject: Re: [PATCH V2 1/2] arm: dts: exynos: Add GPU/Mali T604 node to
> > exynos5250
> >
> > On Thu, 25 Jul 2019 at 10:34, Guillaume <guillaume.gardet@arm.com> wrote:
> > >
> > > From: Guillaume GARDET <guillaume.gardet@arm.com>
> > >
> > > Add nodes for GPU (Mali T604) to Exynos5250.
> > > Tested with kmscube and glmark2-es2-drm on Chromebook snow.
> > > Load tested on arndale board.
> > >
> > > Signed-off-by: Guillaume GARDET <guillaume.gardet@arm.com>
> > >
> > > Cc: Kukjin Kim <kgene@kernel.org>
> > > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > ---
> > > V2 changes:
> > >   * move mali node as /soc sub-node
> > >   * move gpu_opp_table as mali sub-node
> > >   * minor style updates
> > >   * test on arndale board
> > >   * enable by default
> >
> > I was not specific enough. It can stay disabled in the DTSI because not all
> > resources are provided. The board DTSes (all or ones which are
> > tested) will enable it and provide missing resources - mali-supply.
>
> I think all resources are provided, since no mali-supply property is needed here.

No, regulator is not provided. On all Exynos boards Mali uses its own
dedicated regulator (and sometimes additional one). It worked in your
case because the regulator was set as always-on but this is a
workaround for lack of consumers. Once there is a consumer, the
regulator should not be always-on to save the energy when not used.

> So, I can either enable it by default for all exynos5250 platforms there, or I can enable it only for Arndale board and Chromebook snow. What do you prefer?

Then please enable it on tested platforms.

>
> > Just like:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f
> > 0a6208b90bdd44f48f5718c8bb0eb1e763d14c0
> >
> > >   * add dt bindings, in a separate patch
> >
> > Put the bindings before DTS change.
>
> Yes, makes sense.
>
> >
> > >
> > >  arch/arm/boot/dts/exynos5250.dtsi | 47
> > > +++++++++++++++++++++++++++++++
> > >  1 file changed, 47 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/exynos5250.dtsi
> > > b/arch/arm/boot/dts/exynos5250.dtsi
> > > index d5e0392b409e..f7f34d469bde 100644
> > > --- a/arch/arm/boot/dts/exynos5250.dtsi
> > > +++ b/arch/arm/boot/dts/exynos5250.dtsi
> > > @@ -328,6 +328,52 @@
> > >                         iommus = <&sysmmu_rotator>;
> > >                 };
> > >
> > > +               mali: gpu@11800000 {
> > > +                       compatible = "samsung,exynos5250-mali", "arm,mali-t604";
> > > +                       reg = <0x11800000 0x5000>;
> > > +                       interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                    <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
> > > +                                    <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> > > +                       interrupt-names = "job", "mmu", "gpu";
> > > +                       clocks = <&clock CLK_G3D>;
> > > +                       clock-names = "g3d";
> >
> > According to bindings this is not proper clock name. I wonder why it was
> > working... it seems the driver expects first clock to be always the core clock.
>
> Yes, it works, because 1st clock is assumed to be the core clock.
> Clock names are optional and could be omitted as in https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm/boot/dts/rk3288.dtsi?h=v5.3-rc1#n1284
> Not sure if it would be better to rename it to 'core', or  just skip it? Any opinion?

The driver can change anytime and it might look for "core" so DTS
should follow the bindings. Additionally, Panfrost might behave
differently than Arm driver. So "core" please.

Best regards,
Krzysztof
