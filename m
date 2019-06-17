Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E813A48916
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 17 Jun 2019 18:36:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726005AbfFQQgk (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 17 Jun 2019 12:36:40 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42092 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725863AbfFQQgj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 12:36:39 -0400
Received: by mail-wr1-f68.google.com with SMTP id x17so10694125wrl.9;
        Mon, 17 Jun 2019 09:36:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8Oy70J7E+pU3L/OYvURWRN5oF2aMwufMYC8uJSROz60=;
        b=TqlIQb7Hadv0say64Ko+LlDAQzMYglr6LpSy720xyDi3qpNOPIrhgmib3pag75S/iX
         40LKrqS/q6L7DdEci2yQPw1eYa3wJjvnKXeIdedU2CJOUOCxssxZHfcxGcXuTNWDGSMG
         8hxg9hQj3lWLOSomwZr1z1lMaQFfcDzPt4gBiIwz6sVV1CJHB/BYAga+O1BB+CA3pA/d
         sJp5Xmnu0iMH5sC8drRxpHhNwNSI0+s2uEGPbWfvrpMfASCNmmqedIL6VD6fd6Yg5PEO
         NfC+9H2hMJjvRbz0ZDnjrBNCMpLQmkSB8eEpVk4/kVgORzHut4RtWICZgdu13nStfQLV
         BTgQ==
X-Gm-Message-State: APjAAAV4WlcPfb4RC1ToYBI3nm38OsUdg8B6ODh8WFR1HZNSQnUk8YDB
        dCYWdI5QQxKyG1ZJ6zWf1ZY=
X-Google-Smtp-Source: APXvYqydGfrS7r/3YJw8wv4J3mDqQdGECHHJ0dsY/h1rw5+NOYNtFdSPKiuX989ub5GjygD6pPlUhg==
X-Received: by 2002:adf:e3cc:: with SMTP id k12mr20423649wrm.159.1560789397834;
        Mon, 17 Jun 2019 09:36:37 -0700 (PDT)
Received: from kozik-lap ([194.230.155.186])
        by smtp.googlemail.com with ESMTPSA id e11sm12061602wrc.9.2019.06.17.09.36.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Jun 2019 09:36:37 -0700 (PDT)
Date:   Mon, 17 Jun 2019 18:36:34 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Joseph Kogut <joseph.kogut@gmail.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, kgene@kernel.org,
        airlied@linux.ie, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm: dts: add ARM Mali GPU node for Odroid XU3
Message-ID: <20190617163634.GA16941@kozik-lap>
References: <20190614203144.3850-2-joseph.kogut@gmail.com>
 <20190614235719.8134-1-joseph.kogut@gmail.com>
 <20190616085928.GB3826@kozik-lap>
 <CAMWSM7j8dtsS4d-hOc3Sk6OJHs+SiGC9tEaZBEmO0VKmtJguKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMWSM7j8dtsS4d-hOc3Sk6OJHs+SiGC9tEaZBEmO0VKmtJguKw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Jun 17, 2019 at 09:15:23AM -0700, Joseph Kogut wrote:
> Hi Krzysztof,
> 
> Thanks for the review.
> 
> On Sun, Jun 16, 2019 at 1:59 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On Fri, Jun 14, 2019 at 04:57:19PM -0700, Joseph Kogut wrote:
> > > Add device tree node for mali gpu on Odroid XU3 SoCs.
> > >
> > > Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> > > ---
> > >
> > > Changes v1 -> v2:
> > > - Use interrupt name ordering from binding doc
> > > - Specify a single clock for GPU node
> > > - Add gpu opp table
> > > - Fix warnings from IRQ_TYPE_NONE
> > >
> > >  .../boot/dts/exynos5422-odroidxu3-common.dtsi | 26 +++++++++++++++++++
> >
> > This should go to exynos5422-odroid-core.dtsi instead, because it is
> > common to entire Odroid Exynos5422 family (not only XU3 family).
> >
> > >  1 file changed, 26 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> > > index 93a48f2dda49..b8a4246e3b37 100644
> > > --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> > > +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> > > @@ -48,6 +48,32 @@
> > >               cooling-levels = <0 130 170 230>;
> > >       };
> > >
> > > +     gpu: gpu@11800000 {
> > > +             compatible = "samsung,exynos-mali", "arm,mali-t628";
> >
> > This is common to all Exynos542x chips so it should go to
> > exynos5420.dtsi. Here you would need to only enable it and provide
> > regulator.
> >
> 
> To clarify, which pieces are specific to the Odroid Exynos 5422
> family, and which are common to the entire Exynos 542x family? I'm
> thinking the gpu node is common to the 542x family, including the
> interrupts and clock, and the regulator and opp table are specific to
> the Odroid 5422?

Opp table depends - it might common to Exynos542x (as all use the same
Mali) or specific to boards (because there is Odroid XU3 Lite with
Exynos5422 working on lower frequencies).

So far the CPU and all bus OPP tables were put in exynos5420.dtsi so I
guess this can go there as well.

For the rest of properties you were correct.

> 
> > Probably this should be also associated with tmu_gpu as a cooling device
> > (if Mali registers a cooling device...). Otherwise the tmu_gpu is not
> > really used for it.
> >
> 
> We have two operating performance points for the GPU, but I'm not sure
> at what temperature we should trip the lower opp. Looking at the trip
> temperatures for the CPU, we have four alerts, and one critical trip.
> The highest alert is 85 C, would it be reasonable to trigger the lower
> GPU opp at this temperature? Should it trigger sooner?

The highest trip point is 120 C and it is critical. In general I would
follow the CPU trip points (so fan should start working at 50 degrees).
Unless you have some other data about recommended trip points. Useful is
vendor kernel (from Samsung, from Hard Kernel).

> 
> > > +             reg = <0x11800000 0x5000>;
> > > +             interrupts = <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
> > > +                          <GIC_SPI 74  IRQ_TYPE_LEVEL_HIGH>,
> > > +                          <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> > > +             interrupt-names = "job", "mmu", "gpu";
> > > +             clocks = <&clock CLK_G3D>;
> > > +             mali-supply = <&buck4_reg>;
> >
> > Please check if always-on property could be removed from buck4.
> 
> I've checked, and this property can be removed safely.
> 
> > Also, what about LDO27? It should be used as well (maybe through
> > vendor-specific properties which would justify the need of new vendor
> > compatible).
> >
> 
> I'm unsure how LDO27 is used, can you elaborate?

It is supplying the VDD_G3DS (with a note "SRAM power"). I do not have
any more data on it. However I did not check in vendor kernel for it.

Best regards,
Krzysztof


> 
> Best,
> Joseph
