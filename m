Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 189BE467D6A
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  3 Dec 2021 19:40:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235835AbhLCSnY (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 3 Dec 2021 13:43:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232222AbhLCSnX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Dec 2021 13:43:23 -0500
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7B16C061353
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Dec 2021 10:39:58 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id n6so7264261uak.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Dec 2021 10:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b5p3ztxRNGHTryECHF1HMG/gYrhBfwJYEjUwDGuarzA=;
        b=F9+NXkfAn7qWTyNBpgH+F8s1jl70XfqRKv24CTx6q8kWm9ziIds9qi9GpCvPCRbEla
         P+oYUrVaWbQo0Um8iugAtOoiHU2lg2T17KCHt/tDMIlWbvExmWAyDl4Ilkr4hnfO5Cs/
         T7+puOuC0ieEp+xllRPUwcQphG+2lYnQ43XjTtwOK1E6ie2WRXrWY2+pksimxZBW5x85
         qFcLmzPR7v1Q3ffkcp7ycqRfWEJGMcrJDG0+d4ZOAFDnar26/IthG8pHajcR+FQGto2l
         Qho1y5EAVBnR5Kf5wbfgdoitWwB96YA2BViX+48hTCeBtE7K5GFgvzk3gMycOpagDPpx
         S1KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b5p3ztxRNGHTryECHF1HMG/gYrhBfwJYEjUwDGuarzA=;
        b=u8qt8aYcJ3nXE3rqIjFEVSGJ2wmKIK5adDzuWncqWfuvEB9e6bBK8ZQNCUxQnBvruH
         NPwzIMVtOJf22VTIaVc1vUaR86VIBsLGBTqEcf4V4wAMU/kWapXFr/0lpNSHwKoRi1eh
         QL3wvdj2hiX15JauhJCf9e5p0E7rHG1J5zLQEchzZNPndXUwbE3HGonpvcp2269Jq1T8
         7mNiqs44pceIhj4H/T9t2BjDuFc6gXo1q8t58Ml36vDd7eCc05pCSnjYGQfMq3qqZ9LZ
         ytRp4p5zjo4/HPJR2AwsmFgl9wyJ/5wKEJ8ZCnNT4M/bN3KPci+F1P3seyR5cRL81tOx
         gwpw==
X-Gm-Message-State: AOAM533c1ht3Iop2+twcVlkShsncpQxlxScf0pPrDT4eKx3n4lzPUC4V
        Sv5uhvph958vLvi5d3xHksSV6YCrVjrRxF+3ZH0qAA==
X-Google-Smtp-Source: ABdhPJxoN0d+Ha4ydEmot87mUT0b4uygWp+/4MhofvqZsJysvO/S1XvMIB/hIYACy+ZMw6KdNYPl1P9orZjjE+00clM=
X-Received: by 2002:a9f:2431:: with SMTP id 46mr23233053uaq.114.1638556797916;
 Fri, 03 Dec 2021 10:39:57 -0800 (PST)
MIME-Version: 1.0
References: <20211130111325.29328-1-semen.protsenko@linaro.org>
 <20211130111325.29328-2-semen.protsenko@linaro.org> <1638294184.179325.2713642.nullmailer@robh.at.kernel.org>
 <4b5bebb0-ed74-8132-1e6b-cb7cbc21439c@canonical.com> <CAL_JsqJb4nMBoGLcf-bKpi5kEE+zXQ=dfo5JSBhrqPFeLnCsHw@mail.gmail.com>
 <CAPLW+4=Zdvf4HRNUeVMR9URLSdA867hdXVLYy+k47yLH82uTnA@mail.gmail.com> <CAL_Jsq+FTB+mWOyCBwLFifk8obpMh1ysJ6pqpUzSoW7jzo5FAg@mail.gmail.com>
In-Reply-To: <CAL_Jsq+FTB+mWOyCBwLFifk8obpMh1ysJ6pqpUzSoW7jzo5FAg@mail.gmail.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 3 Dec 2021 20:39:46 +0200
Message-ID: <CAPLW+4nPrGRHbHPfNX0q0O26hDLBiV0s_FRWOUfALNg8kbqgKA@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND 1/5] dt-bindings: soc: samsung: Add Exynos USI bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Chanho Park <chanho61.park@samsung.com>,
        linux-serial@vger.kernel.org,
        Youngmin Nam <youngmin.nam@samsung.com>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        David Virag <virag.david003@gmail.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 2 Dec 2021 at 22:44, Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Dec 2, 2021 at 5:01 AM Sam Protsenko <semen.protsenko@linaro.org> wrote:
> >
> > On Wed, 1 Dec 2021 at 18:20, Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Tue, Nov 30, 2021 at 2:04 PM Krzysztof Kozlowski
> > > <krzysztof.kozlowski@canonical.com> wrote:
> > > >
> > > > On 30/11/2021 18:43, Rob Herring wrote:
> > > > > On Tue, 30 Nov 2021 13:13:21 +0200, Sam Protsenko wrote:
> > > > >> Add constants for choosing USIv2 configuration mode in device tree.
> > > > >> Those are further used in USI driver to figure out which value to write
> > > > >> into SW_CONF register. Also document USIv2 IP-core bindings.
> > > > >>
> > > > >> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > > > >> ---
> > > > >> Changes in v2:
> > > > >>   - Combined dt-bindings doc and dt-bindings header patches
> > > > >>   - Added i2c node to example in bindings doc
> > > > >>   - Added mentioning of shared internal circuits
> > > > >>   - Added USI_V2_NONE value to bindings header
> > > > >>
> > > > >>  .../bindings/soc/samsung/exynos-usi.yaml      | 135 ++++++++++++++++++
> > > > >>  include/dt-bindings/soc/samsung,exynos-usi.h  |  17 +++
> > > > >>  2 files changed, 152 insertions(+)
> > > > >>  create mode 100644 Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml
> > > > >>  create mode 100644 include/dt-bindings/soc/samsung,exynos-usi.h
> > > > >>
> > > > >
> > > > > My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> > > > > on your patch (DT_CHECKER_FLAGS is new in v5.13):
> > > > >
> > > > > yamllint warnings/errors:
> > > > >
> > > > > dtschema/dtc warnings/errors:
> > > > > Documentation/devicetree/bindings/soc/samsung/exynos-usi.example.dts:35.39-42.15: Warning (unique_unit_address): /example-0/usi@138200c0/serial@13820000: duplicate unit-address (also used in node /example-0/usi@138200c0/i2c@13820000)
> > > >
> > > > Rob,
> > > >
> > > > The checker complains about two nodes with same unit-address, even
> > > > though the node name is different. Does it mean that our idea of
> > > > embedding two children in USI and having enabled only one (used one) is
> > > > wrong?
> > >
> > > IIRC, we allow for this exact scenario, and there was a change in dtc
> > > for it. So I'm not sure why this triggered.
> > >
> >
> > It's triggered from WARNING(unique_unit_address, ...), because it
> > calls static void check_unique_unit_address_common() function with
> > disable_check=false. I guess we should interpret that this way: the
> > warning makes sense in regular case, when having the same unit address
> > for two nodes is wrong. So the warning is reasonable, it's just not
> > relevant in this particular case. What can be done:
> >
> >   1. We can introduce some specific property to mark nodes with
> > duplicated address as intentional. check_unique_unit_address_common()
> > can be extended then to omit checking the nodes if that property is
> > present.
> >   2. We can just ignore that warning in this particular case (and
> > similar cases).
> >   3. We can add some disambiguation note to that warning message, like
> > "if it's intentional -- please ignore this message"
> >
> > I'm all for option (3), as it's the easiest one, and still reasonable.
> > Rob, what do you think? Can we just ignore that warning in further
> > versions of this patch series?
>
> Just change the dtc flags to '-Wno-unique_unit_address
> -Wunique_unit_address_if_enabled' for both examples and dtbs.
>

Thanks. Submitted that separately from this series: [1].

[1] https://lkml.org/lkml/2021/12/3/762

> Rob
