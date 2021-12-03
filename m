Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D2CE467B40
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  3 Dec 2021 17:22:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352740AbhLCQ0B (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 3 Dec 2021 11:26:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239880AbhLCQ0A (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Dec 2021 11:26:00 -0500
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F0DC061751
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Dec 2021 08:22:36 -0800 (PST)
Received: by mail-ua1-x92d.google.com with SMTP id l24so6543199uak.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Dec 2021 08:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NHuewE/Veei0UDZqBdq/IodL9Sy5sNU/wV+cHqy20h4=;
        b=ZXVR2vMEL+7SlbGxyhg+0gI4ac97562jI/VhZM2Vi9fNRW628RJwHeXLuPIGQ3AQo8
         eiKAjskuJEosDtGGtLNIQSnN1Nsbq93ExGOFr4SHi5jWeH51tAnMlTwzkuBE8p0+NJ1J
         9+g2pTEu4TioFPo6mnmYzSTpu2GR7l2+ZjvyykmbQ9iiS099yHHis+lD/gxtHVdWsJ6u
         DB3AjVFdhOjBYsRIrv+ry6fYFnrdRRdtdGK7aNZUI4879dd+ZZV3t+4S8jAfuEh557oa
         YlNTUzD5GeazfVVjABVeV0Xy4cSC+Hr8B5hC5DZn9E7F81t9wc4XDCySvi6vqskl9mYM
         IipQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NHuewE/Veei0UDZqBdq/IodL9Sy5sNU/wV+cHqy20h4=;
        b=Gtpokcevax4bx2MLBjawUZC2JAxZ/7ePp6a20t/fJ8XXDbc/VcDQLzRkq+SP/0Edho
         OZKSKyy7ynOA1GtxPrTyG9xpX/1z892U1+3onq4PIFfQXWcGxXOQicxHHKN5lQk307qh
         618hX2BxNdut7XrrOcBDIOg5zT+YbEvDlUleWOoqNqBb2iWqrUwMm0FJ0EfcgSqzqiaJ
         SuwnAAnjQ4hLVDmgrZiuFL9wXSGjXKY46oYsQflZACiVDAZCBrnQ0jijAZBDbgYH0nfb
         DrB3rX1VgbjxSkru6QSzBWvcBjy1k6eHpDTDZ4disMQdnppmGdtDELEiwHbO7eF3nXRl
         IfIw==
X-Gm-Message-State: AOAM533dtXym8bWYTjE+iWg1Qa6uF/TFdb3J/k5xzpiv6IqxsxsBij7x
        FgR4ro3l3KvLYGhCHnBzX5A2J5hDMwBxTtB8OdJMvA==
X-Google-Smtp-Source: ABdhPJyZ6EdGq6MVye5nYtnAwXKa3h8vHs+Y4vl7S/236hZNbkcPThWPDTg6QHNVkyE8sxPzbA36EIpvAwud/gmgGrs=
X-Received: by 2002:a67:d31c:: with SMTP id a28mr22061114vsj.20.1638548555813;
 Fri, 03 Dec 2021 08:22:35 -0800 (PST)
MIME-Version: 1.0
References: <20211130111325.29328-1-semen.protsenko@linaro.org>
 <20211130111325.29328-4-semen.protsenko@linaro.org> <CAHp75Vd8PFhs8_Ji5x1X2Ph5ey+8JrRuneWCrG=5a+52Lh-ptQ@mail.gmail.com>
In-Reply-To: <CAHp75Vd8PFhs8_Ji5x1X2Ph5ey+8JrRuneWCrG=5a+52Lh-ptQ@mail.gmail.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 3 Dec 2021 18:22:24 +0200
Message-ID: <CAPLW+4mEw0x_rZ19h+rbz4qm=6OVgQvvbEJWL0wWQguMiWB7-g@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND 3/5] tty: serial: samsung: Remove USI initialization
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 1 Dec 2021 at 12:54, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> On Wed, Dec 1, 2021 at 12:42 AM Sam Protsenko
> <semen.protsenko@linaro.org> wrote:
> >
> > USI control is now extracted to dedicated USI driver. Remove USI related
>
> the dedicated
>
> > code from serial driver to avoid conflicts and code duplication.
>
> Would it break run-time bisectability?
> If so, why is it not a problem?
>

It shouldn't. This patch is [3/5], and USI driver (which takes the
control over the USI registers) is [2/5]. As for Device Tree, the only
platform using "samsung,exynos850-uart" right now is Exynos Auto V9
SADK (serial node is declared in exynosautov9.dtsi). I don't have
Exynos Auto V9 datasheet, so I can't really add the USI node properly
there, nor I can test that. I guess it should be done separately from
this patch series.

Chanho, Krzysztof:

Guys, what are your thoughts on this? Basically with this patch series
applied, Exynos Auto V9 serial might become not functional. New USI
node should be added for UART case in Exynos Auto V9 dtsi (providing
correct sysreg, SW_CONF offset, clocks, etc), and serial node should
be encapsulated inside of that USI node. Also, USI node should be
referenced and enabled in SADK dts, providing also "clkreq-on"
property. More details can be found in [PATCH 1/5]. Do you think it's
ok to take this series as is, and add that later? Because otherwise we
might need to collaborate to add that Exynos Auto V9 enablement into
this patch series, which might take more time...

Thanks!

>
> --
> With Best Regards,
> Andy Shevchenko
