Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EF04494BB
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 18 Jun 2019 00:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbfFQWGq (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 17 Jun 2019 18:06:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:49714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726776AbfFQWGp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 18:06:45 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D01E72063F;
        Mon, 17 Jun 2019 22:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560809204;
        bh=1JsNZwhNkO0kTZcSPtRFxPGFWoSJ54GPBuKfdAJwxrc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ZUTmevJ6tL/g+/RFMAphBIpHgG6pPxCOpnpryx2BmPwfKsHAg1w9C6Tk3vzcR/WBv
         bqAy4XjRX56vANJcuGABufyQKSV96dYyqEF7UUVIrD2jdeN7W2xyRzvvX200DQgTfu
         k2gkUOC9Z/cBVpsS2USRh/GFplpOK6VggtryOFN0=
Received: by mail-qt1-f175.google.com with SMTP id x47so12767251qtk.11;
        Mon, 17 Jun 2019 15:06:44 -0700 (PDT)
X-Gm-Message-State: APjAAAXI4UXKaUqdd2CrtYOuk3+bm0/7iz+Xef4hm58DR30yOK3uH+kp
        AWsvo4Z5nAKv6MQhb8yUd6le6O/tDLa4YPZmXw==
X-Google-Smtp-Source: APXvYqxlH9tPhbZNNJkrT85aR9svIHlNTL+sG99zdJoKOt8Ty1YrE3qm/ShFbczH/rR++XU8qWfC4jV3flp5vTydqXs=
X-Received: by 2002:a05:6214:248:: with SMTP id k8mr23820532qvt.200.1560809204093;
 Mon, 17 Jun 2019 15:06:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203144.3850-1-joseph.kogut@gmail.com> <20190616081557.GA3826@kozik-lap>
In-Reply-To: <20190616081557.GA3826@kozik-lap>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 17 Jun 2019 16:06:31 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+bq2PXA5LSjCmsy=hJq=+S4XK2JrvHct+xM+1HT+=-SQ@mail.gmail.com>
Message-ID: <CAL_Jsq+bq2PXA5LSjCmsy=hJq=+S4XK2JrvHct+xM+1HT+=-SQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: add Exynos Mali vendor specifics
To:     Krzysztof Kozlowski <krzk@kernel.org>
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

On Sun, Jun 16, 2019 at 2:16 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Fri, Jun 14, 2019 at 01:31:43PM -0700, Joseph Kogut wrote:
> > Document vendor specific compatible string for Mali gpus on Exynos SoCs.
> >
> > Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> > index 1b1a74129141..a9704c736d07 100644
> > --- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt
> > @@ -18,6 +18,7 @@ Required properties:
> >      + "amlogic,meson-gxm-mali"
> >      + "rockchip,rk3288-mali"
> >      + "rockchip,rk3399-mali"
> > +    + "samsung,exynos-mali"
>
> Are there any driver differences for Exynos? If not then why adding
> another compatible?

Wrong question. Are there any hardware differences? (Trick question
because difference compared to what?)

Really, this shouldn't be 'exynos', but per SoC. But I'll leave it to
the Samsung folks to decide how specific it should be.

Rob
