Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAAC94AAF1
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 18 Jun 2019 21:17:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730308AbfFRTRx (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 18 Jun 2019 15:17:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:45246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730261AbfFRTRx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 15:17:53 -0400
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 979D821655;
        Tue, 18 Jun 2019 19:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560885471;
        bh=ZWSK86V7NI7b40wV2ulvMwUX6gfBoaYFIEZv+jaBbAQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=N3cQP/TQIfiQCkE4SosugroCeeMv81f7VN+IJUTKMSRSZMMv3XrX1pMK+oXUXAN1N
         6CeFt24hrYcRNSlnvsHwxnAjf2tvrQtodqrDzONLzIGY/M3lXRra5QYKzpLDUiIwPA
         nXWGebBJV66EJxreKLS8y/V4S+qnQAnFUKrV3UuA=
Received: by mail-lf1-f49.google.com with SMTP id q26so10178552lfc.3;
        Tue, 18 Jun 2019 12:17:51 -0700 (PDT)
X-Gm-Message-State: APjAAAXiKR0g+O20E0ZeCd9kX5aV0nmh3F/MhFCYdYA1ZxM8wKRYEmBO
        XDyoF1VZUbOc1JxnUErFg3BFWvHVE4I8QWO0I3A=
X-Google-Smtp-Source: APXvYqzPJjXzgwHiYzzytAPPYZZVCa+SGp9n9sKYmF0r/LKdiMln5BTA1yn7nIrb6RGQBDcCjSOtkT5IHe2Wvc8o4Es=
X-Received: by 2002:a19:e308:: with SMTP id a8mr1782969lfh.69.1560885469745;
 Tue, 18 Jun 2019 12:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203144.3850-2-joseph.kogut@gmail.com> <20190614235719.8134-1-joseph.kogut@gmail.com>
 <20190616085928.GB3826@kozik-lap> <CAMWSM7j8dtsS4d-hOc3Sk6OJHs+SiGC9tEaZBEmO0VKmtJguKw@mail.gmail.com>
 <20190617163634.GA16941@kozik-lap> <CAMWSM7ibdtSGJfNwsYXGXMEkWJTG9Gd-PCd6nPS0bLPd5v+4rA@mail.gmail.com>
In-Reply-To: <CAMWSM7ibdtSGJfNwsYXGXMEkWJTG9Gd-PCd6nPS0bLPd5v+4rA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 18 Jun 2019 21:17:38 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeODKo+nNTfmk9z1DaULrJMyNzuspBbFXXEkFqJ2hHYuw@mail.gmail.com>
Message-ID: <CAJKOXPeODKo+nNTfmk9z1DaULrJMyNzuspBbFXXEkFqJ2hHYuw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm: dts: add ARM Mali GPU node for Odroid XU3
To:     Joseph Kogut <joseph.kogut@gmail.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, kgene@kernel.org,
        airlied@linux.ie, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 18 Jun 2019 at 19:42, Joseph Kogut <joseph.kogut@gmail.com> wrote:
> > >
> > > > > +             reg = <0x11800000 0x5000>;
> > > > > +             interrupts = <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
> > > > > +                          <GIC_SPI 74  IRQ_TYPE_LEVEL_HIGH>,
> > > > > +                          <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> > > > > +             interrupt-names = "job", "mmu", "gpu";
> > > > > +             clocks = <&clock CLK_G3D>;
> > > > > +             mali-supply = <&buck4_reg>;
> > > >
> > > > Please check if always-on property could be removed from buck4.
> > >
> > > I've checked, and this property can be removed safely.
> > >
> > > > Also, what about LDO27? It should be used as well (maybe through
> > > > vendor-specific properties which would justify the need of new vendor
> > > > compatible).
> > > >
> > >
> > > I'm unsure how LDO27 is used, can you elaborate?
> >
> > It is supplying the VDD_G3DS (with a note "SRAM power"). I do not have
> > any more data on it. However I did not check in vendor kernel for it.
> >
>
> After checking (a fork of) the vendor sources [1], it seems to me that
> this regulator is used for memory voltage related to Samsung's
> Adaptive Supply Voltage, for which there is a pending patchset [2].
>
> This seems to me to be out of the scope of this patchset, could you confirm?
>
> [1] https://github.com/kumajaya/android_kernel_samsung_universal5422/blob/ad41104d43e6470f8d4880d65b259dc7b903cc0d/arch/arm/mach-exynos/asv-exynos5422.c#L1052
> [2] https://lwn.net/Articles/784958/

Hi,

Indeed the vendor sources suggest that voltage scaling of this
regulator depends on ASV, not on frequency. However still the
regulator is there in the hardware so it should be in the bindings as
well (specific to Exynos). I guess the driver should also enable it
but this is separate topic (adding per-platform quirks to Panfrost
driver). Putting it to bindings also follows advice from line 12:
https://elixir.bootlin.com/linux/v5.2-rc5/source/Documentation/devicetree/bindings/writing-bindings.txt#L12

Best regards,
Krzysztof
