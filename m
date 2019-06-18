Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 269584A44C
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 18 Jun 2019 16:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729494AbfFROqM (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 18 Jun 2019 10:46:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:33082 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729246AbfFROqM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 10:46:12 -0400
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 522F621479;
        Tue, 18 Jun 2019 14:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560869170;
        bh=0FrwUmL29yHpDepBX+TXabzN3Z0vrRVEY5D8hJER/K0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vL1AF7HnzvWFqCUhenVSNzJEIyNvodIH9eNYtwiPdriqmsnJpyccjU1yw3vcymokz
         PdGon90W3WeIFPOTq4L+VZo/ONCCRPoGmYwWmko0iCWDOyi7M4JhEWsn6lizdfnAio
         oRS1McYyMo4PDZQ/zGAbSpSsJH/qQmaCYTUEOIJo=
Received: by mail-lj1-f171.google.com with SMTP id m23so13390210lje.12;
        Tue, 18 Jun 2019 07:46:10 -0700 (PDT)
X-Gm-Message-State: APjAAAVQpYdZswfKPJJYNABMvw3PNvdM0bAueTd3vBsmRwoYJUWgXtSb
        DWZnYbeNGxrWFa1/RAJgRvTvSTEe422GHoZRUck=
X-Google-Smtp-Source: APXvYqwV+4ngmR3BJWVxI1TlpBTw+CX8G2+LZ8Mr68e3mJyBfeQMh82MbjRoGpXZOfBMf/HkS2+FTEi0li/hsI6ERgI=
X-Received: by 2002:a2e:8155:: with SMTP id t21mr11407580ljg.80.1560869168635;
 Tue, 18 Jun 2019 07:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203144.3850-2-joseph.kogut@gmail.com> <20190614235719.8134-1-joseph.kogut@gmail.com>
 <CAJKOXPc-Xztou+xyibb8YZtfz20q3kzr_gTBoE=R3q_CSk9kzQ@mail.gmail.com> <CAL_Jsq+8s3iNUy5ZCtWW5k-0sa51CR0xdv3Gh_sR=jsVtLmTdQ@mail.gmail.com>
In-Reply-To: <CAL_Jsq+8s3iNUy5ZCtWW5k-0sa51CR0xdv3Gh_sR=jsVtLmTdQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 18 Jun 2019 16:45:57 +0200
X-Gmail-Original-Message-ID: <CAJKOXPd0E1Zg_TOOM3s4haQJnq6hrHaLOPjDkeVz0Gjzp-qROw@mail.gmail.com>
Message-ID: <CAJKOXPd0E1Zg_TOOM3s4haQJnq6hrHaLOPjDkeVz0Gjzp-qROw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm: dts: add ARM Mali GPU node for Odroid XU3
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Joseph Kogut <joseph.kogut@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Kukjin Kim <kgene@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 18 Jun 2019 at 16:18, Rob Herring <robh+dt@kernel.org> wrote:
>
> On Tue, Jun 18, 2019 at 3:27 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On Sat, 15 Jun 2019 at 01:57, Joseph Kogut <joseph.kogut@gmail.com> wrote:
> > >
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
> > >  1 file changed, 26 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> > > index 93a48f2dda49..b8a4246e3b37 100644
> > > --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> > > +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> > > @@ -48,6 +48,32 @@
> > >                 cooling-levels = <0 130 170 230>;
> > >         };
> > >
> > > +       gpu: gpu@11800000 {
> > > +               compatible = "samsung,exynos-mali", "arm,mali-t628";
> > > +               reg = <0x11800000 0x5000>;
> > > +               interrupts = <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
> > > +                            <GIC_SPI 74  IRQ_TYPE_LEVEL_HIGH>,
> > > +                            <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> > > +               interrupt-names = "job", "mmu", "gpu";
> > > +               clocks = <&clock CLK_G3D>;
> > > +               mali-supply = <&buck4_reg>;
> > > +               operating-points-v2 = <&gpu_opp_table>;
> > > +       };
> > > +
> > > +       gpu_opp_table: gpu-opp-table {
> >
> > One more thing - use "opp_table" as node name (generic class of node,
> > matches style with other tables).
>
> 'opp-table' as convention is using '-' rather than '_'.

OK, so rather consistency because most of opp-tables have '_',
including existing DTSes and examples in
Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt and
Documentation/devicetree/bindings/opp/opp.txt.

Best regards,
Krzysztof
