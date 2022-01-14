Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1B2048EE1E
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 14 Jan 2022 17:31:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243362AbiANQbZ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 14 Jan 2022 11:31:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbiANQbY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 14 Jan 2022 11:31:24 -0500
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94F53C06161C
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jan 2022 08:31:24 -0800 (PST)
Received: by mail-ua1-x935.google.com with SMTP id r15so17896552uao.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jan 2022 08:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W8BJonKrUJJxs6hl3AJin2CViuhqfsYAJVcPiVusuxk=;
        b=FVz/5ga9KDCjl3940tWLE8mGBZK0qp5+0D8dwAkEC/bELGBz8Yt7AeFV0DGofHxTDg
         4K5/jDfYjNIsCv2mlW/1JWH/fSvS8lBrmYjCeKjwlRBAZuB6DJWmmhdrFTy1UpF8Own+
         qg2NSV0Ae5EsWZlix+p4ff82s3peHqyy9hwIXOls2EPJBS9c0AGl98puoo+rLQZ21T0v
         PDjG/qb0dlQl0Hi5jt10l2Aju4Yk8OFyftrbbizO0VClnSXEK/DLW3dzc0pDNlNGGwIi
         eHgWxC1gERsGmzm0a9LJL8dXPJwcvrdIm1yKnTBT52hBzOgJkndtZuptXwY32gLmcXUg
         P3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W8BJonKrUJJxs6hl3AJin2CViuhqfsYAJVcPiVusuxk=;
        b=ghA/1E22rw2xAd1fiJ0t/ADoCG7afp8LiH7mob4X5cCQnXcOn1mDcw7uHaommwdOBQ
         qPOSnJEkUHSR57+nPBzwqthXE+spEiQSUq72zozbxboI3W+LJWyZGkvl4Wtv/nNDZBS9
         O2HMQzAkP2O5sx8bWxlRQ8JZawBG6ndYiD7bFcC+NSoLB1FUb5Ecp6MLFLb02tm3Nwla
         MZiPBtB20yjG+x+RzIwihD2nrZOzzYYu8CWUxQqx4QxFO0Ja/voDrzJHHnfVVnJ696WJ
         qNyFUIJhu1hpvx8cgz//4ZjJDmv8zcbPGfr2YRiqVxMsQtYFdR+SbCQZz5lEr/xvTl8d
         g+OQ==
X-Gm-Message-State: AOAM532dn4DX80seXMgjIuWtnxKR8KoDXfCR4NuBh6899kxJWnl5DsjA
        X8HeI536u5K5Emw+UYdeTUH4W1OGlXwPjmbDDdmXFA==
X-Google-Smtp-Source: ABdhPJwGPrbufoRUrKieMfzFagq+YhPGKN+V0bGRe+G+nT/sM+zB7wLo3Kt2aIV5ertn1H9IivMjTJ2tKWNsrWL1Cl4=
X-Received: by 2002:a05:6102:108c:: with SMTP id s12mr4452918vsr.20.1642177883703;
 Fri, 14 Jan 2022 08:31:23 -0800 (PST)
MIME-Version: 1.0
References: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com> <20220111201722.327219-22-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220111201722.327219-22-krzysztof.kozlowski@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 14 Jan 2022 18:31:11 +0200
Message-ID: <CAPLW+4=t0z-aMhCSp4K3L8EqH_BzinsLuRcopbCQr_xzgFCYVA@mail.gmail.com>
Subject: Re: [PATCH v2 28/28] arm64: dts: exynos: use dedicated wake-up
 pinctrl compatible in ExynosAutov9
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 11 Jan 2022 at 22:19, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Older Samsung Exynos SoC pin controller nodes (Exynos3250, Exynos4,
> Exynos5, Exynos5433) with external wake-up interrupts, expected to have
> one interrupt for multiplexing these wake-up interrupts.  Also they
> expected to have exactly one pin controller capable of external wake-up
> interrupts.
>
> It seems however that newer ARMv8 Exynos SoC like Exynos850 and
> ExynosAutov9 have differences:
> 1. No multiplexed external wake-up interrupt, only direct,
> 2. More than one pin controller capable of external wake-up interrupts.
>
> Use dedicated ExynosAutov9 compatible for its external wake-up interrupts
> controller to indicate the differences.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> index de8fcb82eaec..807d500d6022 100644
> --- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
> @@ -208,7 +208,7 @@ pinctrl_alive: pinctrl@10450000 {
>                         reg = <0x10450000 0x1000>;
>
>                         wakeup-interrupt-controller {
> -                               compatible = "samsung,exynos7-wakeup-eint";
> +                               compatible = "samsung,exynosautov9-wakeup-eint";
>                         };
>                 };
>
> --
> 2.32.0
>
