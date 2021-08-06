Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9E93E2EA6
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  6 Aug 2021 18:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239282AbhHFQ6N (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 6 Aug 2021 12:58:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239567AbhHFQ6N (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Aug 2021 12:58:13 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 099A9C06179A
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Aug 2021 09:57:57 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id d20so2974888vso.8
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Aug 2021 09:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jyRdCsrj1GlEr3i17zCrA/RuqWCQgwoVhsTIqjVReGU=;
        b=nw1Ts52SCu6B1wsbHInWfDu47KHigBfQozSZLjBb5uG4y8/sFe4OzQZByR10dzSDEs
         VpeJMGrhJ4imYXUKE407mfRV/2sXCbQdp5Xgmmh8mxxdafY5TAYqvoA7yiD/X1OBJfDv
         L38Qz5zSW759Tlgb4Re6g7MVPiM120RfUVHS8XfxJEZdfEjK+QTf40Gx7FdUgzYvLs3O
         7i4rU/tFT/CTMvwz2RBJem3GMzZehap/lEWlgCBkZ2F7vtXIZ4GH4O5ex6HqecyGdJYb
         jRuiffdHUN8YpCLTZ5ryZeEVHQzo7JSv9v3Omt524ezJTQciAhiRlSJMCKZf2/Q+LwXz
         hUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jyRdCsrj1GlEr3i17zCrA/RuqWCQgwoVhsTIqjVReGU=;
        b=hTlaPRCCj5tf0bcyqAe+d2ShUjNgxKP1iqVdp1OokYPhO6robzEvZtV+i9Vtdtm9qp
         x2V5w+xfyUCdX3wJ/0Q5jtokpLxUNVQq7rhxQhRjyh968YwverxQJ/++7FSRGyG9ZkkZ
         9jW8mgYYaqaG8QauIy+UJCWjNRDHowGVqIEMVsHE1dedegOufYeaTpqPVjPYLdNHFZDf
         8ENWXu76CAKf0PAx6kkig6TlFq1EJ4AxMLMv7zT+hdsexpDjmzTpAiPu02LNLJY1RHPh
         gM0clH2oTrhH/9aynDYwq4DXfyN+9S6tHZsZt2d+Nfrs756ec4Y2ZfjZbJMx6mRYyd1e
         cQkQ==
X-Gm-Message-State: AOAM532t9dSzhp5eNKJddx8qIL9ODJjSSFYYCxY2GUjt37XkberxgbuB
        7BO9zrl3o1D/bUlQfNKgJ4CoZZwfvsYAB7XO/+q9Cw==
X-Google-Smtp-Source: ABdhPJzTq25yNSWiZXX2jLUbzoFsDlhmE5adtlQiqtv29jZT5m3Z+k1kQXXoo4aeW5KqY9IKZmmCWimAcVFI3/TcDgk=
X-Received: by 2002:a05:6102:ecb:: with SMTP id m11mr9911739vst.34.1628269075986;
 Fri, 06 Aug 2021 09:57:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-13-semen.protsenko@linaro.org> <455cfb5e-dff7-a5c0-3875-49abe3e900f3@canonical.com>
 <CAPLW+4nDS0atrbUFagDA0W_Ky5MvOiY+N+NQoQ+me4pndp_iWg@mail.gmail.com>
 <68734f6c-fc76-595c-8d34-8924dbbbb845@canonical.com> <CAPLW+4n_JKj5xeBHXONcv__vyAFvx3fhXoxJa17NTHK1RSJFJw@mail.gmail.com>
 <b753796c-2ce6-4166-7c20-289e950237ad@canonical.com> <bb08f7a4-1da9-fb20-f091-6a3c37a1f898@canonical.com>
In-Reply-To: <bb08f7a4-1da9-fb20-f091-6a3c37a1f898@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 6 Aug 2021 19:57:43 +0300
Message-ID: <CAPLW+4=7n3a2FL9YHYj8dPn+2obFLHvW6DpsDjnG-bxX9--HbQ@mail.gmail.com>
Subject: Re: [PATCH 12/12] arm64: dts: exynos: Add Exynos850 SoC support
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     =?UTF-8?Q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 6 Aug 2021 at 15:48, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 06/08/2021 14:32, Krzysztof Kozlowski wrote:
> > On 06/08/2021 14:07, Sam Protsenko wrote:
> >> On Fri, 6 Aug 2021 at 10:49, Krzysztof Kozlowski
> >> <krzysztof.kozlowski@canonical.com> wrote:
> >>>
> >>> On 06/08/2021 01:06, Sam Protsenko wrote:
> >>>> On Sat, 31 Jul 2021 at 12:03, Krzysztof Kozlowski
> >>>> <krzysztof.kozlowski@canonical.com> wrote:
> >>>>
> >>>>>>
> >>>>>> This patch adds minimal SoC support. Particular board device tree =
files
> >>>>>> can include exynos850.dtsi file to get SoC related nodes, and then
> >>>>>> reference those nodes further as needed.
> >>>>>>
> >>>>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> >>>>>> ---
> >>>>>>  .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 782 +++++++++++++=
+++++
> >>>>>>  arch/arm64/boot/dts/exynos/exynos850-usi.dtsi |  30 +
> >>>>>>  arch/arm64/boot/dts/exynos/exynos850.dtsi     | 245 ++++++
> >>>>>
> >>>>> Not buildable. Missing Makefile, missing DTS. Please submit with in=
itial
> >>>>> DTS, otherwise no one is able to verify it even compiles.
> >>>>>
> >>>>
> >>>> This device is not available for purchase yet. I'll send the patch f=
or
> >>>> board dts once it's announced. I can do all the testing for now, if
> >>>> you have any specific requests. Would it be possible for us to revie=
w
> >>>> and apply only SoC support for now? Will send v2 soon...
> >>>
> >>> What you propose is equal to adding a driver (C source code) without
> >>> ability to compile it. What's the point of having it in the kernel? I=
t's
> >>> unverifiable, unbuildable and unusable.
> >>>
> >>
> >> Yes, I understand. That's adding code with no users, and it's not a
> >> good practice.
> >>
> >>> We can review the DTSI however merging has to be with a DTS. Usually =
the
> >>> SoC vendor adds first an evalkit (e.g. SMDK board). Maybe you have on=
e
> >>> for Exynos850? Otherwise if you cannot disclose the actual board, the
> >>> DTSI will have to wait. You can submit drivers, though.
> >>>
> >>
> >> Sure, let's go this way. I'll send v2 soon. Improving patches and
> >> having Reviewed-by tag for those would good enough for me at this
> >> point. I'll continue to prepare another Exynos850 related patches
> >> until the actual board is announced, like proper clock driver, reset,
> >> MMC, etc. Is it ok if I send those for a review too (so I can fix all
> >> issues ahead)?
> >
> > Sure, prepare all necessary drivers earlier. I suspect clocks will be a
> > real pain because of significant changes modeled in vendor kernel. I
> > remember Pawe=C5=82 Chmiel (+Cc) was doing something for these:
> > https://github.com/PabloPL/linux/tree/exynos7420
> >
> > I mentioned before - you should also modify the chipid driver. Check
> > also other drivers in drivers/soc/samsung, although some are needed onl=
y
> > for suspend&resume.
> >

Yes, in due course... There won't be much problems with chip-id
driver. But pretty much all platform drivers depend on clk, and that
one I'm afraid I'll have to implement from scratch. Will take me a
while, as vendor's codebase for clk driver is huge and depend on
another huge non-upstreamable abstraction layer framework they have,
and also they have kind of strange home brewed composite clocks...
Anyway, that's what I'm going to look into next.

Btw, I just sent v2 :)

>
> You can also take a look at Exynos8895 efforts:
> https://github.com/ivoszbg/linux/commits/for-upstream/exynos8895
>
> Since knowledge, datasheets and efforts are quite spread all over, I
> keep track of some work here:
> https://exynos.wiki.kernel.org/community
>

Thanks, Krzysztof! I'm sure that info will help a lot with further
work, like clock driver.

>
> Best regards,
> Krzysztof
