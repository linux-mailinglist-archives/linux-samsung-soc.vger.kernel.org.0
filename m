Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 31CF06ACD4C
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  6 Mar 2023 19:57:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230058AbjCFS5E (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 6 Mar 2023 13:57:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbjCFS4t (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 13:56:49 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78E322FCD3
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Mar 2023 10:55:25 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id a7so6476959pfx.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Mar 2023 10:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678128916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R/SLFvJsUujuShQfZT5sk4tBl30biEXQxhjzUcMVQlY=;
        b=actdtHBwAm2I4J/E5BvEwKoX3Pq87A+DLbO8chSzsJcKmsM238DQPiy1QauwFtHpJP
         TQN+8jDKlP0M+FSbw1VvIL6kBkQoRLEByOHFG9ISAb7g529gCiSHkyEzcdtd0uLzVFBi
         LV7+UFwuDsYtTrU5m9KxutxLZCZfBZB+T2HJcr2HRL5w3j2wD4tGOtWvG3Oi+VTD9XxE
         AcSO2kGX6hwQ5H2bXXYFe3MEqLe66QtzoN8XQkPYnoAvXmfH3MDQ7rYx+iApoCwgRICz
         p6YoJ5SMu57B7I+Bd2svL6GfnFkyxTQDIIWkjcumMS7fT9vkl5E9SaTXdzh1Td5B/W4T
         s0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678128916;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/SLFvJsUujuShQfZT5sk4tBl30biEXQxhjzUcMVQlY=;
        b=Fi+ASNtF4mRU/Z6pie7BpXMbz0ewxmiOPyZD/PLmXBctX8XxXsfxt5sQiUkTY+2+39
         6DHBT4PlZLOgy69UHKwUiV1Egibx1TK+2FFOuzSSDFAdZw76dO+F2DfVUipaSYhu5zlH
         vzM4M0p03v+Pb4kq5e0pSCKf1H2O7+OAGP4ZO4z/gi0ThnmALCHY7Y7MEZ1S1ccXbh78
         FG/FrsZItRq1RLXfj7QE0Wvkny8Xx+BytQVkkGhVARKL9JCmxVToCxC7sluqpadCqY60
         tnm9mhkIZ26ARzeTQiKmpIJwq18Hms/q54oHONEI6bTE/4yQwIc8UwpUtoySZd3Ot+91
         5eiA==
X-Gm-Message-State: AO0yUKW/urQFz9//tR66Hl2JPyjBgAg9WUT1hvcBbQIkDDBskzhFQC6A
        4+mRg/WJ8iTE0HWpliJymX7Aql+y4d7gh2TlArXgrA==
X-Google-Smtp-Source: AK7set9lhwqpVKZ4u2/ZN//+vl67fX5+f/0VMJrj/dzV8JrVkGMm8tkBCY24bEdB6+ZBXCEejqEt4MqRYNiG5s7KOIk=
X-Received: by 2002:a65:6a85:0:b0:503:25af:f50d with SMTP id
 q5-20020a656a85000000b0050325aff50dmr4143071pgu.4.1678128916514; Mon, 06 Mar
 2023 10:55:16 -0800 (PST)
MIME-Version: 1.0
References: <20230223042133.26551-1-semen.protsenko@linaro.org>
 <167811290503.11716.15730246749418548221.b4-ty@linaro.org> <48c8a0cf-08dc-a831-33ef-3b8e32eef2d3@linaro.org>
In-Reply-To: <48c8a0cf-08dc-a831-33ef-3b8e32eef2d3@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 6 Mar 2023 12:55:05 -0600
Message-ID: <CAPLW+4=9Vwxd4upa3j_cKtRrNyyx_XCz+TgOOziMguEonbHb0g@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] clk: samsung: exynos850: Add missing clocks for PM
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Chanho Park <chanho61.park@samsung.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        David Virag <virag.david003@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 6 Mar 2023 at 09:51, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 06/03/2023 15:28, Krzysztof Kozlowski wrote:
> > On Wed, 22 Feb 2023 22:21:27 -0600, Sam Protsenko wrote:
> >> As a part of preparation for PM enablement in Exynos850 clock driver,
> >> this patch series implements CMU_G3D, and also main gate clocks for AUD
> >> and HSI CMUs. The series brings corresponding changes to bindings, the
> >> driver and SoC dts file.
> >>
> >> Changes in v2:
> >>   - Rebased all patches on top of the most recent soc/for-next tree
> >>   - Added A-b and R-b tags
> >>   - Minor fixes
> >>
> >> [...]
> >
> > Applied, thanks!
> >
> > [1/6] dt-bindings: clock: exynos850: Add Exynos850 CMU_G3D
> >       https://git.kernel.org/krzk/linux/c/067ba1605806e52118bb598afb357718df9f0e19
> > [2/6] dt-bindings: clock: exynos850: Add AUD and HSI main gate clocks
> >       https://git.kernel.org/krzk/linux/c/e289665ed0d6df9fca3ebc128f1232d305e4600b
> > [3/6] clk: samsung: clk-pll: Implement pll0818x PLL type
> >       https://git.kernel.org/krzk/linux/c/a6feedab8ab9a9e4483deb0bcc87919d92c88b7e
> > [4/6] clk: samsung: exynos850: Implement CMU_G3D domain
> >       https://git.kernel.org/krzk/linux/c/c5704a56893b4e77e434597c7c53d878bb3073b0
> > [5/6] clk: samsung: exynos850: Add AUD and HSI main gate clocks
> >       https://git.kernel.org/krzk/linux/c/d8d12e0d079aff4b1d8079a0a55944c0596f1d67
> > [6/6] arm64: dts: exynos: Add CMU_G3D node for Exynos850 SoC
> >       https://git.kernel.org/krzk/linux/c/ad8f6ad9a4f219950df65731a8ff91baa022c4b0
>
> And builds are broken. Please mention in cover letter or commit
> dependencies and ordering...
>

Just checked all most recent commits on your for-next and next/clk
branches. Seem to build fine for me. AFAIR I checked all patches in
that series, and I guess there shouldn't be any issues if you apply
those in the same order they are numbered inside the series. Or you
mean you have some clash between different series? Anyways, I'm glad
to help, but I'd need more details on where exactly the problem is (or
maybe you already fixed it?).

Thanks!

> Best regards,
> Krzysztof
>
