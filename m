Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFE1A49A70
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 18 Jun 2019 09:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727964AbfFRHXj (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 18 Jun 2019 03:23:39 -0400
Received: from mail.kernel.org ([198.145.29.99]:43478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725870AbfFRHXj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 03:23:39 -0400
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 24B3A2133F;
        Tue, 18 Jun 2019 07:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560842618;
        bh=aIcK8giJ/WbrE61iXtjfzXPTL4lG0NbWO6c7oX7UYyQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=1i/nQ36nfQpP8jYB5z5Y4aveCxKAwge+ERqpI2t6oqDpgTpNwbVl25N3t3OciY6yf
         jSYa0nm2i4BKwHTCtEnqgf1g2BWDcGp2w6tyWnDwDHIeKmS7HfCMfLk30WP6OO3aUf
         2UijoB7tC0K15pQiXuKZC3YokFRTXriMA6JSC2sA=
Received: by mail-lf1-f47.google.com with SMTP id y13so8420572lfh.9;
        Tue, 18 Jun 2019 00:23:38 -0700 (PDT)
X-Gm-Message-State: APjAAAVEt3VjrN6bnmoRS1qGkxZcld7+DB2NxqTKulZdKWnqEGPY+jNY
        596K+wG7ziKk5xChPPRDtIFexPJbu6LKniIeRfM=
X-Google-Smtp-Source: APXvYqyRHNQDL07p1uJ2f/qXQt0uHz3gs1RKOM3JMH7WeEFFTiqYcEscviwS2gclVEBGNFIJl+wI4FH934Nmw0KMC5A=
X-Received: by 2002:a19:e308:: with SMTP id a8mr55812523lfh.69.1560842616344;
 Tue, 18 Jun 2019 00:23:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203144.3850-1-joseph.kogut@gmail.com> <20190616081557.GA3826@kozik-lap>
 <CAL_Jsq+bq2PXA5LSjCmsy=hJq=+S4XK2JrvHct+xM+1HT+=-SQ@mail.gmail.com>
In-Reply-To: <CAL_Jsq+bq2PXA5LSjCmsy=hJq=+S4XK2JrvHct+xM+1HT+=-SQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 18 Jun 2019 09:23:25 +0200
X-Gmail-Original-Message-ID: <CAJKOXPd6OqHohswSzj7UEWJi1E7H53M_gvv4fkYC5kE5ZfN_Aw@mail.gmail.com>
Message-ID: <CAJKOXPd6OqHohswSzj7UEWJi1E7H53M_gvv4fkYC5kE5ZfN_Aw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: add Exynos Mali vendor specifics
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Joseph Kogut <joseph.kogut@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Kukjin Kim <kgene@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 18 Jun 2019 at 00:06, Rob Herring <robh+dt@kernel.org> wrote:
>
> On Sun, Jun 16, 2019 at 2:16 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On Fri, Jun 14, 2019 at 01:31:43PM -0700, Joseph Kogut wrote:
> > > Document vendor specific compatible string for Mali gpus on Exynos SoCs.
> > >
> > > Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> > > ---
> > >  Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> > > index 1b1a74129141..a9704c736d07 100644
> > > --- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> > > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> > > @@ -18,6 +18,7 @@ Required properties:
> > >      + "amlogic,meson-gxm-mali"
> > >      + "rockchip,rk3288-mali"
> > >      + "rockchip,rk3399-mali"
> > > +    + "samsung,exynos-mali"
> >
> > Are there any driver differences for Exynos? If not then why adding
> > another compatible?
>
> Wrong question. Are there any hardware differences? (Trick question
> because difference compared to what?)
>
> Really, this shouldn't be 'exynos', but per SoC. But I'll leave it to
> the Samsung folks to decide how specific it should be.

If vendor compatible is expected, then let's go with per-soc
(Exynos5420) because other SoCs use different Midgard chipsets so they
might come with own differences.

Best regards,
Krzysztof
