Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC546132EFC
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  7 Jan 2020 20:07:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728645AbgAGTHj (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 7 Jan 2020 14:07:39 -0500
Received: from mail-io1-f67.google.com ([209.85.166.67]:33709 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728307AbgAGTHi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jan 2020 14:07:38 -0500
Received: by mail-io1-f67.google.com with SMTP id z8so523763ioh.0;
        Tue, 07 Jan 2020 11:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eL83IhmbYca+Npr1asR8CaaCAGTGwRjtX816LINHiJ4=;
        b=RLrZOxXIMmF1MhE4PM1Sa8VQoZKrgU1LR5d0ldT6JogLbeCS661EUDG/pqgyvlDsFL
         IoajV/fjjZ8J45uNX75f8fm7EM5gby4YnelGEZJCvyffXggqoBTZ4XtZSThHMeWog9gu
         dfc/WoVFPLDElSvYXcqqusjISy6MAo/iLCHJVvxuAcTZLGY3WQyybVHmG/3n3Dmz6+z1
         3NNEanzS2pZ91WFp3WFhZTFasbjePbmD2WkV56voSFwZ+0e1C/fyFn04Ru2wzRNiApuj
         z3eY3fmCeK6TCAHnEJMZ2y+4WLY6NPuCrhlBV35zJ58i4meOBn4XDM+xv/SCUWcfrMwB
         uVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eL83IhmbYca+Npr1asR8CaaCAGTGwRjtX816LINHiJ4=;
        b=pUzTw4Yf8/Qmv84hWtdcHMx4IASZzrm6Czhz1o+11IeBJfxiswRbJrryUdGzmUclQi
         O0YwC3ENyg8cBe5NM8K7cDfbtt0mbXqlB7H2Thagpw4oKd9eLlCHbaDLPATUJkkIYZ+L
         3RkwbDea/fNk5nTUnUClBP03N5WTug43bajJ42STzWVJZunNiZkv4WcqotaQVhz1Evq9
         SUYoTLlB4BsICvww1tYLyuvpPVDlj97chCqILVHDVe313QTvZbGtx37Undztj0v2Tz8W
         JKINopQctjRmz1lXwImB1pkKGS8u7A7nqgGvjtsi4uWA5qIKq5b2USvHUcJOu3qjSLnh
         1k+w==
X-Gm-Message-State: APjAAAXna0pbG3R1rVtUhkSvESUuyqPDIVbjIC5NlJKA1b6AhJUZAM2S
        P58sco2eTjrAZgDMl2tb2VZ3CCUd2FXePpnpb8bolXnTZgU=
X-Google-Smtp-Source: APXvYqysZuYS/1n72GZMQD9xKS7PrMAogGWhU3hvRiFtIkWkVbE9ikdKnVSN73EbKlebVJc4I/j1UwQV/tXXzYxNrl4=
X-Received: by 2002:a05:6638:a2c:: with SMTP id 12mr961911jao.60.1578424058012;
 Tue, 07 Jan 2020 11:07:38 -0800 (PST)
MIME-Version: 1.0
References: <20200106191003.21584-1-tiny.windzz@gmail.com> <20200106191003.21584-2-tiny.windzz@gmail.com>
 <20200107090449.GA32007@pi3>
In-Reply-To: <20200107090449.GA32007@pi3>
From:   Frank Lee <tiny.windzz@gmail.com>
Date:   Wed, 8 Jan 2020 03:07:25 +0800
Message-ID: <CAEExFWvJx82h1c1QBrQ+DpT4kgEZ0o3q_O7JLbk-1L-iuMGPEw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: exynos: tiny4412: add proper panel node
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kukjin Kim <kgene@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Jan 7, 2020 at 5:04 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Mon, Jan 06, 2020 at 07:10:03PM +0000, Yangtao Li wrote:
> > This patch add at070tn92 panel for tiny4412 board.
>
> Please fix description as in patch 1.
>
> >
> > Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
> > ---
> >  arch/arm/boot/dts/exynos4412-tiny4412.dts | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/exynos4412-tiny4412.dts b/arch/arm/boot/dts/exynos4412-tiny4412.dts
> > index 2b62cb27420c..57f9d09233ad 100644
> > --- a/arch/arm/boot/dts/exynos4412-tiny4412.dts
> > +++ b/arch/arm/boot/dts/exynos4412-tiny4412.dts
> > @@ -66,6 +66,16 @@
> >                       clock-frequency = <24000000>;
> >               };
> >       };
> > +
> > +     panel {
> > +             compatible = "innolux,at070tn92";
> > +
> > +             port {
> > +                     panel_input: endpoint {
> > +                             remote-endpoint = <&lcdc_output>;
> > +                     };
> > +             };
> > +     };
> >  };
> >
> >  &fimd {
> > @@ -74,6 +84,12 @@
> >       #address-cells = <1>;
> >       #size-cells = <0>;
> >       status = "okay";
>
> One empty space here.
>
> > +     port@3 {
> > +             reg = <3>;
>
> Why starting from "3"? Why this is port@3, not just "port"?

From samsung-fimd.txt:
---
The device node can contain 'port' child nodes according to the bindings defined
in [2]. The following are properties specific to those nodes:
- reg: (required) port index, can be:
                0 - for CAMIF0 input,
                1 - for CAMIF1 input,
                2 - for CAMIF2 input,
                3 - for parallel output,
                4 - for write-back interface
---

I guess it is influenced here.
https://elixir.bootlin.com/linux/v5.5-rc5/source/drivers/gpu/drm/exynos/exynos_drm_dpi.c#L170
Without it, lcd is completely black.

Your,
Yangtao

>
> Best regards,
> Krzysztof
>
