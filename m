Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36A914A8AF
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 18 Jun 2019 19:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729554AbfFRRmW (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 18 Jun 2019 13:42:22 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:42706 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729325AbfFRRmW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 13:42:22 -0400
Received: by mail-ua1-f65.google.com with SMTP id a97so6827908uaa.9;
        Tue, 18 Jun 2019 10:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nIlhxSJsICJWoP5wubMZz79sEFNcBWjpKtMJBr5laEU=;
        b=cPLXP2Z8PB/3LQ8+iFmRMJH7QH3h6p8I3OWwo5GObI+Gwoafa0UGtF9xlWLqFHQEDY
         XDV0lKvVApc0L6elCQJBDo/vrffQbyPJt828Tick6dQZD2z+4nT/vTsAxgTrCy2AYskZ
         bup+0m65zYHDuSKHzF3OHLerxTMZPH/Gb2p6Dzk7Cl247y5Ig/URppV/5DJl5B4mdLsC
         JOaeCRQDoz7LNI4aplVs0OwTQLgRXQeh1eJsiLGTEnZYomG5bCsUI0z+d9b8/o20cOpM
         11itH8XYABN1CXQeQzbc4P8QkVDIZi0dkNERvm4Ski+m04HsqWA9Wr0442YdodriJd+v
         U9ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nIlhxSJsICJWoP5wubMZz79sEFNcBWjpKtMJBr5laEU=;
        b=IWI/LZb6rONyhm4TralT5cw+qHT2OANhOLbyHlnuNe9PnWU4kgp+mapSBAaemmj8Ya
         lIlK9voOPY/1KJVunlRMDOXztIF9BksoZDovwf1y6oHxPR9CFAs7zdejMWIETUl4UNNU
         MISjxUT1B4FoSVNhYchzPFvoYsunw1nDcogC79LWbbL0gkbPdooz0zqvdmOemomuCxxF
         x79LHQXbaxrPrNXbPOwnwXfKlFQY3fWLYTYrdhTVfuwKFH+Ji6z/hGovhhm40eE+hCi7
         9LJPkv5JnXCJmoqXWvK2DtRj5+38+XtUl57GOG9R/0+6V3szkUodOxfrCNfXlhnG8X+t
         dBbw==
X-Gm-Message-State: APjAAAWVrQVHnQuA9AS+g2vlEYH/XxOKnN1X5c8GOFsUyCqUo29pOSZc
        5KS0roFMIyTlrBSgMYw2MGNNS7fOId/nVkCfhE8=
X-Google-Smtp-Source: APXvYqxqliQ4cJH5WUQ8rBfkKuCcdaQXorhmxA+QCpvEgqzX9rgQNf20t2CaSN/i5BDJ2M8zF9yjT+vsifnR5DK5sSM=
X-Received: by 2002:ab0:5928:: with SMTP id n37mr2564486uad.24.1560879740607;
 Tue, 18 Jun 2019 10:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203144.3850-2-joseph.kogut@gmail.com> <20190614235719.8134-1-joseph.kogut@gmail.com>
 <20190616085928.GB3826@kozik-lap> <CAMWSM7j8dtsS4d-hOc3Sk6OJHs+SiGC9tEaZBEmO0VKmtJguKw@mail.gmail.com>
 <20190617163634.GA16941@kozik-lap>
In-Reply-To: <20190617163634.GA16941@kozik-lap>
From:   Joseph Kogut <joseph.kogut@gmail.com>
Date:   Tue, 18 Jun 2019 10:41:44 -0700
Message-ID: <CAMWSM7ibdtSGJfNwsYXGXMEkWJTG9Gd-PCd6nPS0bLPd5v+4rA@mail.gmail.com>
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

On Mon, Jun 17, 2019 at 9:36 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Jun 17, 2019 at 09:15:23AM -0700, Joseph Kogut wrote:
> > Hi Krzysztof,
> >
> > Thanks for the review.
> >
> > On Sun, Jun 16, 2019 at 1:59 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >
> > > On Fri, Jun 14, 2019 at 04:57:19PM -0700, Joseph Kogut wrote:
> > > > Add device tree node for mali gpu on Odroid XU3 SoCs.
> > > >
> > > > Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> > > > ---
> > > >
> > > > Changes v1 -> v2:
> > > > - Use interrupt name ordering from binding doc
> > > > - Specify a single clock for GPU node
> > > > - Add gpu opp table
> > > > - Fix warnings from IRQ_TYPE_NONE
> > > >
> > > >  .../boot/dts/exynos5422-odroidxu3-common.dtsi | 26 +++++++++++++++++++
> > >
> > > This should go to exynos5422-odroid-core.dtsi instead, because it is
> > > common to entire Odroid Exynos5422 family (not only XU3 family).
> > >
> > > >  1 file changed, 26 insertions(+)
> > > >
> > > > diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> > > > index 93a48f2dda49..b8a4246e3b37 100644
> > > > --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> > > > +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> > > > @@ -48,6 +48,32 @@
> > > >               cooling-levels = <0 130 170 230>;
> > > >       };
> > > >
> > > > +     gpu: gpu@11800000 {
> > > > +             compatible = "samsung,exynos-mali", "arm,mali-t628";
> > >
> > > This is common to all Exynos542x chips so it should go to
> > > exynos5420.dtsi. Here you would need to only enable it and provide
> > > regulator.
> > >
> >
> > To clarify, which pieces are specific to the Odroid Exynos 5422
> > family, and which are common to the entire Exynos 542x family? I'm
> > thinking the gpu node is common to the 542x family, including the
> > interrupts and clock, and the regulator and opp table are specific to
> > the Odroid 5422?
>
> Opp table depends - it might common to Exynos542x (as all use the same
> Mali) or specific to boards (because there is Odroid XU3 Lite with
> Exynos5422 working on lower frequencies).
>
> So far the CPU and all bus OPP tables were put in exynos5420.dtsi so I
> guess this can go there as well.
>
> For the rest of properties you were correct.
>
> >
> > > Probably this should be also associated with tmu_gpu as a cooling device
> > > (if Mali registers a cooling device...). Otherwise the tmu_gpu is not
> > > really used for it.
> > >
> >
> > We have two operating performance points for the GPU, but I'm not sure
> > at what temperature we should trip the lower opp. Looking at the trip
> > temperatures for the CPU, we have four alerts, and one critical trip.
> > The highest alert is 85 C, would it be reasonable to trigger the lower
> > GPU opp at this temperature? Should it trigger sooner?
>
> The highest trip point is 120 C and it is critical. In general I would
> follow the CPU trip points (so fan should start working at 50 degrees).
> Unless you have some other data about recommended trip points. Useful is
> vendor kernel (from Samsung, from Hard Kernel).
>
> >
> > > > +             reg = <0x11800000 0x5000>;
> > > > +             interrupts = <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
> > > > +                          <GIC_SPI 74  IRQ_TYPE_LEVEL_HIGH>,
> > > > +                          <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> > > > +             interrupt-names = "job", "mmu", "gpu";
> > > > +             clocks = <&clock CLK_G3D>;
> > > > +             mali-supply = <&buck4_reg>;
> > >
> > > Please check if always-on property could be removed from buck4.
> >
> > I've checked, and this property can be removed safely.
> >
> > > Also, what about LDO27? It should be used as well (maybe through
> > > vendor-specific properties which would justify the need of new vendor
> > > compatible).
> > >
> >
> > I'm unsure how LDO27 is used, can you elaborate?
>
> It is supplying the VDD_G3DS (with a note "SRAM power"). I do not have
> any more data on it. However I did not check in vendor kernel for it.
>

After checking (a fork of) the vendor sources [1], it seems to me that
this regulator is used for memory voltage related to Samsung's
Adaptive Supply Voltage, for which there is a pending patchset [2].

This seems to me to be out of the scope of this patchset, could you confirm?

[1] https://github.com/kumajaya/android_kernel_samsung_universal5422/blob/ad41104d43e6470f8d4880d65b259dc7b903cc0d/arch/arm/mach-exynos/asv-exynos5422.c#L1052
[2] https://lwn.net/Articles/784958/
