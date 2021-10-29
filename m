Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07C9444016D
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 29 Oct 2021 19:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbhJ2Rum (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 29 Oct 2021 13:50:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbhJ2Rul (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Oct 2021 13:50:41 -0400
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8536C061767
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Oct 2021 10:48:12 -0700 (PDT)
Received: by mail-ua1-x935.google.com with SMTP id o26so19567715uab.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Oct 2021 10:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DrOGKgquGj68N+FzRII+Lf58KuCAUe89IwujQcdy/4Q=;
        b=HQ4VxrHDRaWBn9eDthLXPXVvvyfIh/htD08SuAKthmuVBXQrCKkQLCwdyBg969fbvf
         LjMi/zuSUuX4kUKfrJLt6P8ftpEPQC8ftBcZbby43fTJ8Mts8pVv++gc+c0cCKUEL+WC
         HLYwCZCoJvHhdF6lc3m3bVgfeisMVLDgnd+vzBFvPqcnSRuDQSjmYqww1Jxx8ImIuVkE
         JB0uD7+mg6yUzT9wLJ+NxBMfLGSBM4heaGcsZ3YCilGeabXphmMlv+afuxqP690OgK6+
         3GpCd/N2BENphVwV6nvNRA1cdx2fdMxTbnyqlsn6hxj0nEJlruuv30j/Hs+YhOlnyWZf
         ElTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DrOGKgquGj68N+FzRII+Lf58KuCAUe89IwujQcdy/4Q=;
        b=ya1Ab1q3qeX4L6hBo9vy9HtaNouCKwb/3PnHCZNLv5I+7dMenVO3PqWN/QsHIYJ4tk
         QkTYMysYQ0Odl43Nouo2GjEN9/hWKyW5jrPOgqkOLJUB6lxonGfwaYYxTzx/OYIwEpLu
         7iN1Sh6Cb3AUWBbelkqkwhtRTYDLeneOcxOaPkAcbkusjtpR77OluIfIk3n6h815P1mN
         H2mvzs8sG2tocyvSefBmsCqYPZEdDZ/Krq/9MiCxdugN1PchrqQLe+Yymv43338sPf4j
         imMJpSLFgN7AaCKOj/lokH9BM1IP8fsg1ueiEAOBN9b5lS0HmHuTm7RN/eL9/ZVyq4Kb
         Am2g==
X-Gm-Message-State: AOAM530s/zwjlS4Ujb6I95liOq5Rdq/KtaI3RL2l5FeH4x9MoXJwxzR0
        e7yOKJX+4lX6lbGl5OQP6dHH6INns6QNqon3HqMBqg==
X-Google-Smtp-Source: ABdhPJw97ZjpQ0khx27sW5CU8qv/wx3PQSG1suN1B0G6saGqCBxs3G2r/DljwpOifB0xpTrP681p2yZFn/UPb86FepQ=
X-Received: by 2002:a67:ed5a:: with SMTP id m26mr14451872vsp.35.1635529691793;
 Fri, 29 Oct 2021 10:48:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
 <20211028183527.3050-3-semen.protsenko@linaro.org> <33c823c6-c105-68f1-e7c8-de6c27c5c33c@canonical.com>
In-Reply-To: <33c823c6-c105-68f1-e7c8-de6c27c5c33c@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 29 Oct 2021 20:48:00 +0300
Message-ID: <CAPLW+4k+1-A-gbjG+DGD2SxL-mrzWHQUKnpUXwc_Tw73CTGK-Q@mail.gmail.com>
Subject: Re: [PATCH 2/7] dt-bindings: watchdog: Document Exynos850 watchdog bindings
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        linux-watchdog@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 29 Oct 2021 at 11:02, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 28/10/2021 20:35, Sam Protsenko wrote:
> > Exynos850 SoC has two CPU clusters:
> >   - cluster 0: contains CPUs #0, #1, #2, #3
> >   - cluster 1: contains CPUs #4, #5, #6, #7
> >
> > Each cluster has its own dedicater watchdog timer. Those WDT instances
> > are controlled using different bits in PMU registers, so there should be
> > two different compatible strings (for each cluster), to tell the driver
> > which bits to use for each WDT instance.
> >
> > Also on Exynos850 the peripheral clock and the source clock are two
> > different clocks. Provide a way to specify two clocks in watchdog device
> > tree node.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> >  .../devicetree/bindings/watchdog/samsung-wdt.yaml  | 14 ++++++++++++--
> >  1 file changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > index 93cd77a6e92c..19c7f7767559 100644
> > --- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
> > @@ -22,16 +22,24 @@ properties:
> >        - samsung,exynos5250-wdt                # for Exynos5250
> >        - samsung,exynos5420-wdt                # for Exynos5420
> >        - samsung,exynos7-wdt                   # for Exynos7
> > +      - samsung,exynos850-cl0-wdt             # for Exynos850 (CPU cluster 0)
> > +      - samsung,exynos850-cl1-wdt             # for Exynos850 (CPU cluster 1)
>
> I would prefer to have one compatible and additional u32 property
> pointing to cluster index. The driver would use this property to adjust
> the PMU register offsets or bits.
>
> Why? Because if next time you have three clusters, you will need to make
> three compatibles for something which differs by only two register
> offsets. Both watchdog instances (or three in some unspecified future)
> are here the same, they just control different blocks, therefore should
> accept some parameter instead of making them different compatibles.
>

Agreed. I considered both cases, both looked ugly to me. But having
one compatible is probably better in the end, although it'll require
some additional code in the driver. Anyway, will be done in v2, will
send it soon.

> >
> >    reg:
> >      maxItems: 1
> >
> >    clocks:
> > -    maxItems: 1
> > +    minItems: 1
> > +    items:
> > +      - description: Peripheral clock used for register interface; if it's the
> > +                     only clock, it's also a source clock
> > +      - description: Source clock (optional)
> >
> >    clock-names:
> > +    minItems: 1
> >      items:
> >        - const: watchdog
> > +      - const: watchdog_src
>
> Don't you require src clock on Exynos850?
>

Will be addressed in v2 properly, thanks.

>
>
> Best regards,
> Krzysztof
