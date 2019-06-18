Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEE8C4A3B1
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 18 Jun 2019 16:18:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729264AbfFROSq (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 18 Jun 2019 10:18:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:47182 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729135AbfFROSq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 10:18:46 -0400
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0261021655;
        Tue, 18 Jun 2019 14:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560867525;
        bh=fmH1HS1i21FXBrdGVVcYis11lRtY96O6Nq7hw7xpuXc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JoDrQk3MgbRvSeO+7rtnkhiCNb09N7doFTHOV7WnAsndUpzx+LxFKG5zn2RpjsgeQ
         E8wiAS1v58NskYQsv3sgTFHkFapWDgDYH7WE/SoMd4gryGJpNbrOGyIeLHGGkAnMwt
         FEOhMsVWLZ4cKFsLpkBHVVq21MDiyEMW+ocxBnLQ=
Received: by mail-qt1-f180.google.com with SMTP id j19so15450389qtr.12;
        Tue, 18 Jun 2019 07:18:44 -0700 (PDT)
X-Gm-Message-State: APjAAAVxz8j81r1x0ALQQzFqFqOaqzSxZ5UzMOZqHbNtcVnmkzFNRxH+
        1XcRERm1QOm0hpIpJPFb8aZ6Bk/Nb9cvgBeZrw==
X-Google-Smtp-Source: APXvYqxqXrhBkfwz+CkmpI6Dnza5Sqa7IVWFgp1FgSWrNioXxep7UkwWRLPmku5uTgQa9FsH0l163BNzQrHu5CpPAQs=
X-Received: by 2002:aed:3f10:: with SMTP id p16mr35442573qtf.110.1560867524199;
 Tue, 18 Jun 2019 07:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203144.3850-2-joseph.kogut@gmail.com> <20190614235719.8134-1-joseph.kogut@gmail.com>
 <CAJKOXPc-Xztou+xyibb8YZtfz20q3kzr_gTBoE=R3q_CSk9kzQ@mail.gmail.com>
In-Reply-To: <CAJKOXPc-Xztou+xyibb8YZtfz20q3kzr_gTBoE=R3q_CSk9kzQ@mail.gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 18 Jun 2019 08:18:32 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+8s3iNUy5ZCtWW5k-0sa51CR0xdv3Gh_sR=jsVtLmTdQ@mail.gmail.com>
Message-ID: <CAL_Jsq+8s3iNUy5ZCtWW5k-0sa51CR0xdv3Gh_sR=jsVtLmTdQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm: dts: add ARM Mali GPU node for Odroid XU3
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Joseph Kogut <joseph.kogut@gmail.com>
Cc:     Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>,
        David Airlie <airlied@linux.ie>,
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

On Tue, Jun 18, 2019 at 3:27 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Sat, 15 Jun 2019 at 01:57, Joseph Kogut <joseph.kogut@gmail.com> wrote:
> >
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
> >  1 file changed, 26 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> > index 93a48f2dda49..b8a4246e3b37 100644
> > --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> > +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> > @@ -48,6 +48,32 @@
> >                 cooling-levels = <0 130 170 230>;
> >         };
> >
> > +       gpu: gpu@11800000 {
> > +               compatible = "samsung,exynos-mali", "arm,mali-t628";
> > +               reg = <0x11800000 0x5000>;
> > +               interrupts = <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
> > +                            <GIC_SPI 74  IRQ_TYPE_LEVEL_HIGH>,
> > +                            <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> > +               interrupt-names = "job", "mmu", "gpu";
> > +               clocks = <&clock CLK_G3D>;
> > +               mali-supply = <&buck4_reg>;
> > +               operating-points-v2 = <&gpu_opp_table>;
> > +       };
> > +
> > +       gpu_opp_table: gpu-opp-table {
>
> One more thing - use "opp_table" as node name (generic class of node,
> matches style with other tables).

'opp-table' as convention is using '-' rather than '_'.

Rob
