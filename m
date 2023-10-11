Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DFBEF7C4E2B
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 11 Oct 2023 11:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbjJKJGe (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 11 Oct 2023 05:06:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233082AbjJKJGd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Oct 2023 05:06:33 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33C59D7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Oct 2023 02:06:31 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-66cfd3a0e61so7372046d6.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Oct 2023 02:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697015190; x=1697619990; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eoGJqBpx4DnJ8f9sTHuaCwd+hLOrI3etlSVQtwSYzRo=;
        b=BOKPZ+92jlDkwOGpZUCml0hqlK+8bzGobPX/zyffxErQUHLd+bzx8wkJ2c5uxSt8QD
         mXtJIdd1MsP7OWj4oDUjmlV8BaY3XcK73YRZs5HtmQxvQRSI3XvAvOBXpm8mUHdhEiNq
         WgDAXe07z03M1j28X/SiXb2Oz7UeQFFv4y22xNm0srTXGHgQ94bOBqT/ds44bfxaxosH
         neEtT116ShVM9Dpy0PjM2guK8Lf4IU/o54JG+7bZbLUg5khTviT3jbDQE43VP2To0Cj/
         nxDROaFcIb9MdQWrsgccLYFdugc/RtnDswopMzHXClVckJm7WwjCi1Ct6OSeLMND7Oqt
         UHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697015190; x=1697619990;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eoGJqBpx4DnJ8f9sTHuaCwd+hLOrI3etlSVQtwSYzRo=;
        b=UyS8YJ3nYPkClVlXPK62fqepE61XYLZOoOXtzYCwchbUA+v5wFyiOq7LZDRyor0Fjw
         WYeI28xL0iViO2SHKZxyvxvNlgB2heTlEmhE1k1B/coVy4Y7V3NGJ7PRn9Fp+cMbvYHK
         q1QVQIRsmsM1aTunBMmYsSJqhMUhofwpjodmXe+Gu5uEOpQv2rGcyE1J56kXBiLJeiOP
         cw3DbPmELfTbdODQsborf3F26jGhWhqXOwpLK0GNJ0u53tc4CC9DsfCBIjEXrej8TMYC
         GKTVi8zyxfNc7CTzWkt+zQVcfWX1Dtav3BmgzKcyWHTEO1GrJGPzzxQjBOewkp7E3anF
         ihCQ==
X-Gm-Message-State: AOJu0YyQZ7FWkAeU3nzH9nLrAc/sVzW3JL0pWDbzqUZkXKqZDr2x23i8
        NX7aQqQWUcY0HvzVS8cTou03b8p7E8ij3uDIo7nMIQ==
X-Google-Smtp-Source: AGHT+IFdQ8tqBV1dqi5xaG7XGfWgTgWoFJqlw9bQU9nodG2NXg1+wmQjaus0dItmXwH0cAGNry/TzU0ByWLIxJoNkmQ=
X-Received: by 2002:a05:6214:3d06:b0:656:5441:a13f with SMTP id
 ol6-20020a0562143d0600b006565441a13fmr23058441qvb.45.1697015190275; Wed, 11
 Oct 2023 02:06:30 -0700 (PDT)
MIME-Version: 1.0
References: <20231010224928.2296997-1-peter.griffin@linaro.org> <2023101101-mauve-underarm-1b48@gregkh>
In-Reply-To: <2023101101-mauve-underarm-1b48@gregkh>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Wed, 11 Oct 2023 10:06:18 +0100
Message-ID: <CADrjBPr2UAfpuuw6M8T5UaiTmCYz0e3jabfDCcUJtH+35mwBKw@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] Add minimal Tensor/GS101 SoC support and
 Oriole/Pixel6 board
To:     Greg KH <greg@kroah.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Greg,

Thanks for your reply!

On Wed, 11 Oct 2023 at 08:44, Greg KH <greg@kroah.com> wrote:
>
> On Tue, Oct 10, 2023 at 11:49:08PM +0100, Peter Griffin wrote:
> > Hi folks,
> >
> > Firstly, thanks to everyone who reviewed the v1 series! V2 incorporates all
> > the review feedback received so far.
> >
> > This series adds initial SoC support for the GS101 SoC and also initial board
> > support for Pixel 6 phone (Oriole).
> >
> > The gs101 / Tensor SoC is also used in Pixel6a (bluejay) and Pixel 6 Pro
> > (raven) phones. Currently DT is added for the gs101 SoC and Oriole.
> > As you can see from the patches the SoC is based on a Samsung Exynos SoC,
> > and therefore lots of the low level Exynos drivers can be re-used.
> >
> > The support added in this series consists of:
> > * cpus
> > * pinctrl
> > * some CCF implementation
> > * watchdog
> > * uart
> > * gpio
>
> So you have sent a patch series that crosses multiple subsystems, who is
> supposed to be taking these patches?  Or do you not want them actually
> merged?

Krzysztof indicated here:
https://lore.kernel.org/all/b1598405-b01f-426a-aaba-89f2d2dc9c2e@linaro.org/
that he would like to be the one applying the entire series through the Samsung
SoC tree. If that's fine with everyone (it's OK with me).

kind regards,

Peter.
