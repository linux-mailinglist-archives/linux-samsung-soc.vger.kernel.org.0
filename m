Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF4B367B3D8
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 25 Jan 2023 15:05:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235649AbjAYOE7 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 25 Jan 2023 09:04:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235712AbjAYOE4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 09:04:56 -0500
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A112589BE
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 06:04:52 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-4ff1fa82bbbso217892387b3.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 06:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+LBRkUPcT5cSLfU1Shlwd9jP9M0+3VXXbQQB1UsR0NA=;
        b=Ybae0TdtOy+PKR7+AepH0BGeexUntFKPlKJKW1aUPxYL05djkRvKrtQatEDytHbYEE
         P+DVgGQq/VBgllZHqKhxt6aYOWOJH+D4y6TG9YwzLW2ePnNseemEVc6+UE+sMLWlB9vo
         RUiT+eMYKUpd2IY4keBXDfbNUw48PN/x6OIso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+LBRkUPcT5cSLfU1Shlwd9jP9M0+3VXXbQQB1UsR0NA=;
        b=eCJTI9I9SuqJPbO/1hAKPa0dcdAiMlgPyvypi2nr/0KVrky+CSych/AEVEHf6Gi1tw
         kSiaTQPfOWIvQZ4tSuabJqr0SJCErXlZoPs2G0u4XORSuXSYQLhTAEONwkU/jt59644O
         df+m76GDdkFQGwz3DDaWhb56Dv96rq6Ik3cifFoYq+ixGkLX92fYM+Jh/osvIEdQWaU1
         clqzh91Qk0mB2PQDOH9apYsS0B0sFHmbZHka2EcNgVBCPJH08Tvm1rvnjO9bS6Rw1eBT
         PhunFK7efzAA32iRpuVjTAQIz3SBvyVlj8jHpUKFrTl82PltMGBKiz13b0yiAg9NRt0r
         VvrQ==
X-Gm-Message-State: AO0yUKWXqGjmh4CsjF37oNLTzeYBHHJnNXEyjVnoCi4Kxf9g3ier1hYA
        M+IrVtBBExM3mA1q1Hss+7Mfvx4Qz/BXmU5W/jdJKg==
X-Google-Smtp-Source: AK7set+NfcCN0p2R4VGAwkQslapAjE2pMGBNGS8pNJVA2a8RHKTtrDzf5Gw2QuDdNyJHVw7wXKUSxtH4O1c8BSCokKQ=
X-Received: by 2002:a0d:d512:0:b0:506:4b25:8655 with SMTP id
 x18-20020a0dd512000000b005064b258655mr580885ywd.106.1674655491725; Wed, 25
 Jan 2023 06:04:51 -0800 (PST)
MIME-Version: 1.0
References: <20230123151212.269082-1-jagan@amarulasolutions.com>
 <20230123151212.269082-14-jagan@amarulasolutions.com> <43f4a7dc-a4cc-7552-1a6d-a2a49fae6020@denx.de>
 <CAMty3ZBZWERT=HpjSepSaFbpKpwZUvuG82s6+z7EgDRY5D+TFg@mail.gmail.com>
 <fb7dfb89-42d6-139e-7ff1-4985838e222f@denx.de> <CAMty3ZAYz=XEN6s1XhBWg5b77kk+s942qa9Oz4E4oHtSfaVZtA@mail.gmail.com>
 <CAMty3ZB8jAoKzXpPJzrfH6bOGBOpJRuTacgQDSg8kVuhg7p37Q@mail.gmail.com>
 <CAMty3ZDNwJ40pPJFKqwMd13y-rF9ELb5N6JZffea6T4dnD-0nA@mail.gmail.com> <d8e539bd-93db-fb6f-eaec-463f382a1dfb@denx.de>
In-Reply-To: <d8e539bd-93db-fb6f-eaec-463f382a1dfb@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Wed, 25 Jan 2023 19:34:37 +0530
Message-ID: <CAMty3ZBxbwwocAwZ18o8tis54SRC64853b+p8VfzcD=OWrjP6Q@mail.gmail.com>
Subject: Re: [RESEND PATCH v11 13/18] drm: exynos: dsi: Add Exynos based host
 irq hooks
To:     Marek Vasut <marex@denx.de>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Jan 25, 2023 at 7:23 PM Marek Vasut <marex@denx.de> wrote:
>
> On 1/25/23 07:54, Jagan Teki wrote:
> > On Wed, Jan 25, 2023 at 2:54 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >>
> >> On Wed, Jan 25, 2023 at 2:54 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >>>
> >>> On Wed, Jan 25, 2023 at 2:42 AM Marek Vasut <marex@denx.de> wrote:
> >>>>
> >>>> On 1/24/23 22:01, Jagan Teki wrote:
> >>>>> On Wed, Jan 25, 2023 at 2:18 AM Marek Vasut <marex@denx.de> wrote:
> >>>>>>
> >>>>>> On 1/23/23 16:12, Jagan Teki wrote:
> >>>>>>> Enable and disable of te_gpio's are Exynos platform specific
> >>>>>>> irq handling, so add the exynos based irq operations and hook
> >>>>>>> them for exynos plat_data.
> >>>>>>
> >>>>>> If this is just an optional generic GPIO IRQ, why not keep it in the
> >>>>>> core code ? TE (tearing enable?) should be available on MX8M too.
> >>>>>
> >>>>> So far the discussion (since from initial versions) with Marek
> >>>>> Szyprowski, seems to be available in Exynos. So, I keep it separate
> >>>>> from the DSIM core.
> >>>>
> >>>> Isn't TE a generic GPIO IRQ ? If so, it is available also on i.MX8M .
> >>
> >> I will check this.
> >
> > In order to use TE_GPIO we need te handler implementation, right now
> > Exynos CRTC DRM drivers have implementation for this. That is the main
> > reason to keep the TE_GPIO handling in exynos, maybe if we handle that
> > generically then it is a viable option to move TE_GPIO to the DSIM
> > core.
>
> I think you can do this exactly the same way exynos does it -- check
> whether te_handler() callback is implemented by the glue code (the one
> you already have for various exynos and imx8mm/imx8mm SoCs) and if so,
> call it. If it is not implemented, do not call anything in the TE IRQ
> handler.

I need to understand how i.MX8MM handles this on TE IRQ in the DSIM
host side, Can I do this in future patch set as it might involve
bindings changes as well if it's part of DSIM?

Jagan.
