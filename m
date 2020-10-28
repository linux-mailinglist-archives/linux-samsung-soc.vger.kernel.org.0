Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42ECC29DD20
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 29 Oct 2020 01:35:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731942AbgJ1WT2 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 28 Oct 2020 18:19:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:60546 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731687AbgJ1WRl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:17:41 -0400
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B58EA24740
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2020 13:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603890293;
        bh=dkbTH9Le4h56RNP77vJJswVlJA/MlUGBPK0NF5o7eyo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tabdqm2aJplXzKMgJ4nEeAG7z+7hbXIKb28PV3gCParplhx60j6wyViEcvSEuo27Y
         O4PIv86W0HscH+Q6f7Vx4j4bFY6j0C9Xa7OkWOSaa9ZjdPcDbS5g0xKbz1gNI9jXCk
         MTzTVu9CMX5VX+Oh6Miz2yAkEq1IsphCCpJu+M3Y=
Received: by mail-oi1-f173.google.com with SMTP id k65so4858475oih.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2020 06:04:53 -0700 (PDT)
X-Gm-Message-State: AOAM533a4XMUUxPd8BJbkBM5DE2lwP+WqdTNa4X8TPboX0R3orUXf4gJ
        QOG14tuiPRXrqsNSae3Fz+wSKvJWM0ahBBIrliM=
X-Google-Smtp-Source: ABdhPJwDMaP1MChXtj96eDV5/lC/V7LA3nnYGs5OIihSuUHr4A+qiej0MBLIqCZ7zW4kHe/CabJxRTyy7vDTmA3xz1U=
X-Received: by 2002:aca:2310:: with SMTP id e16mr4878752oie.47.1603890292927;
 Wed, 28 Oct 2020 06:04:52 -0700 (PDT)
MIME-Version: 1.0
References: <20201007083944.27910-1-ardb@kernel.org> <CGME20201028091912eucas1p13fb9cd947faa6bfd79199ea79648b6af@eucas1p1.samsung.com>
 <20201007083944.27910-3-ardb@kernel.org> <920965b8-6f87-3f82-9fce-d3051fc543ca@samsung.com>
 <CACPK8XfNfqToFBe0GPFTGrnPhNTYhSDiEagpB7ayBSW1DC-THA@mail.gmail.com>
 <CAMj1kXH90MzCUJ_DHZ_2=JcWBX=Qf1PT-A9PX9EeBTVx22EkaQ@mail.gmail.com> <20201028130050.GL1551@shell.armlinux.org.uk>
In-Reply-To: <20201028130050.GL1551@shell.armlinux.org.uk>
From:   Ard Biesheuvel <ardb@kernel.org>
Date:   Wed, 28 Oct 2020 14:04:41 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFWAr+-fnThgtY_jTg1_=kmhHRS5+X6jXAG9K7GegCchg@mail.gmail.com>
Message-ID: <CAMj1kXFWAr+-fnThgtY_jTg1_=kmhHRS5+X6jXAG9K7GegCchg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: move device tree mapping out of linear region
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Joel Stanley <joel@jms.id.au>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 28 Oct 2020 at 14:01, Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> On Wed, Oct 28, 2020 at 01:52:48PM +0100, Ard Biesheuvel wrote:
> > Does this help?
> >
> > diff --git a/arch/arm/include/asm/memory.h b/arch/arm/include/asm/memory.h
> > index bb79e52aeb90..4f355bda872a 100644
> > --- a/arch/arm/include/asm/memory.h
> > +++ b/arch/arm/include/asm/memory.h
> > @@ -68,8 +68,8 @@
> >  #define XIP_VIRT_ADDR(physaddr)  (MODULES_VADDR + ((physaddr) & 0x000fffff))
> >
> >  #define FDT_FIXED_BASE         UL(0xff800000)
> > -#define FDT_FIXED_SIZE         (2 * PMD_SIZE)
> > -#define FDT_VIRT_ADDR(physaddr)        ((void *)(FDT_FIXED_BASE |
> > (physaddr) % PMD_SIZE))
> > +#define FDT_FIXED_SIZE         (2 * SECTION_SIZE)
> > +#define FDT_VIRT_ADDR(physaddr)        ((void *)(FDT_FIXED_BASE |
> > (physaddr) % SECTION_SIZE))
>
> Is this correct? If the FDT fixed size is 2x, why does FDT_VIRT_ADDR()
> only work for half of it?
>

Perhaps the naming is confusing. This is only used to obtain the start
of the virtually mapped DT, which amounts to the virtual address of
the section plus the physical address modulo the section size.

I will rename physaddr to physbase when I respin this as a patch.
Shall I rename FDT_VIRT_ADDR to FDT_VIRT_BASE as well?
