Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC11A636A90
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 23 Nov 2022 21:10:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234468AbiKWUJk (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 23 Nov 2022 15:09:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230195AbiKWUJj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Nov 2022 15:09:39 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 871317C464
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Nov 2022 12:09:38 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id d123so13963139iof.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Nov 2022 12:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+NmSKYTm+4EXQGx4rpOu3VMvA2Vnb2EyVYmIAKmYijI=;
        b=qG9uq1dHY6C4KsDJDBhv+jT482M2w4vT9U73QerpU0Vkz0g0q6FQVi738XhydqowE5
         tD0Q+mn/Q8kPUoWMVZPN0+Bfep94lTkT5s2PAaiRcwhpGs6XrfQLpU7JNcWJIp5DSPDl
         gAFDS9Aq36461s5l87lEDes0XOKsI7PZDqCx8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NmSKYTm+4EXQGx4rpOu3VMvA2Vnb2EyVYmIAKmYijI=;
        b=bwh6fEHlAPN9UR1UQuqV03FyCd1s0JHI8CpiWqKbqWbozJvNURDCGMKFM0D5YvgWc4
         pw7UPbHutFWTy5uCr5nu2HFzyF3+9C5uvy6J5ArDKgujgDte7Fs7HNymAso26x8sDCMR
         wDM3ZeDCjw2DJoj/eqshgQ1Jfl5aNM9topbSBa6H+fUxzw5DX+8M74f0OHrSyqLD0DAC
         Crnq/s43tJ3q/WcqN6DgZM3oFJ56t+DnjiOcJV8Cmajw6Xoi9RSGZevAX15LpwBuyF63
         HYPAoY/fO11SAwtUZ2RPFpANHWJC2R50NhvXhxQjLwzPZiUIZ+OJEyAf1OLSZVE6jFE/
         GTvQ==
X-Gm-Message-State: ANoB5pmLxgg6Xr2oUXbmTd09UFdqc4Qawo/UBeXfGzVDrCBGGG3nFFj/
        DbjQxs+HYAZb6pPUaRqDYWB9HWuJwvm3tMuKilorPA==
X-Google-Smtp-Source: AA0mqf7DmEM1Zp1a+678ACxDv6NMQTQuOR0LAfjZVPBj20palYUDVyDIB3pTU+suIuwtvZuc/4a8hjUP9vrNekqc7vw=
X-Received: by 2002:a05:6638:1a98:b0:375:61b2:825a with SMTP id
 ce24-20020a0566381a9800b0037561b2825amr14188511jab.147.1669234177851; Wed, 23
 Nov 2022 12:09:37 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-7-jagan@amarulasolutions.com> <CGME20221117045817eucas1p1778503aa62ef18ef5ee0502d2189cd15@eucas1p1.samsung.com>
 <04fb17e2-1b55-fbd9-d846-da3e3da4edb8@denx.de> <f33142de-862e-9775-b1c9-b871bb9a243c@samsung.com>
 <b66b44fc-5d4c-d3a8-8538-79003b14691e@denx.de>
In-Reply-To: <b66b44fc-5d4c-d3a8-8538-79003b14691e@denx.de>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 24 Nov 2022 01:39:26 +0530
Message-ID: <CAMty3ZBfAY86fp7XxS9frrBiT9FRkJaNSRY-4CVpqGOvdpn1fw@mail.gmail.com>
Subject: Re: [PATCH v8 06/14] drm: bridge: samsung-dsim: Handle proper DSI
 host initialization
To:     Marek Vasut <marex@denx.de>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
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

On Sat, Nov 19, 2022 at 7:45 PM Marek Vasut <marex@denx.de> wrote:
>
> On 11/17/22 14:04, Marek Szyprowski wrote:
> > On 17.11.2022 05:58, Marek Vasut wrote:
> >> On 11/10/22 19:38, Jagan Teki wrote:
> >>> DSI host initialization handling in previous exynos dsi driver has
> >>> some pitfalls. It initializes the host during host transfer() hook
> >>> that is indeed not the desired call flow for I2C and any other DSI
> >>> configured downstream bridges.
> >>>
> >>> Host transfer() is usually triggered for downstream DSI panels or
> >>> bridges and I2C-configured-DSI bridges miss these host initialization
> >>> as these downstream bridges use bridge operations hooks like pre_enable,
> >>> and enable in order to initialize or set up the host.
> >>>
> >>> This patch is trying to handle the host init handler to satisfy all
> >>> downstream panels and bridges. Added the DSIM_STATE_REINITIALIZED state
> >>> flag to ensure that host init is also done on first cmd transfer, this
> >>> helps existing DSI panels work on exynos platform (form Marek
> >>> Szyprowski).
> >>>
> >>> v8, v7, v6, v5:
> >>> * none
> >>>
> >>> v4:
> >>> * update init handling to ensure host init done on first cmd transfer
> >>>
> >>> v3:
> >>> * none
> >>>
> >>> v2:
> >>> * check initialized state in samsung_dsim_init
> >>>
> >>> v1:
> >>> * keep DSI init in host transfer
> >>>
> >>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >>> ---
> >>>    drivers/gpu/drm/bridge/samsung-dsim.c | 25 +++++++++++++++++--------
> >>>    include/drm/bridge/samsung-dsim.h     |  5 +++--
> >>>    2 files changed, 20 insertions(+), 10 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> >>> b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>> index bb1f45fd5a88..ec7e01ae02ea 100644
> >>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> >>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>> @@ -1234,12 +1234,17 @@ static void samsung_dsim_disable_irq(struct
> >>> samsung_dsim *dsi)
> >>>        disable_irq(dsi->irq);
> >>>    }
> >>>    -static int samsung_dsim_init(struct samsung_dsim *dsi)
> >>> +static int samsung_dsim_init(struct samsung_dsim *dsi, unsigned int
> >>> flag)
> >>>    {
> >>>        const struct samsung_dsim_driver_data *driver_data =
> >>> dsi->driver_data;
> >>>    +    if (dsi->state & flag)
> >>> +        return 0;
> >>> +
> >>>        samsung_dsim_reset(dsi);
> >>> -    samsung_dsim_enable_irq(dsi);
> >>> +
> >>> +    if (!(dsi->state & DSIM_STATE_INITIALIZED))
> >>> +        samsung_dsim_enable_irq(dsi);
> >>>          if (driver_data->reg_values[RESET_TYPE] == DSIM_FUNCRST)
> >>>            samsung_dsim_enable_lane(dsi, BIT(dsi->lanes) - 1);
> >>> @@ -1250,6 +1255,8 @@ static int samsung_dsim_init(struct
> >>> samsung_dsim *dsi)
> >>>        samsung_dsim_set_phy_ctrl(dsi);
> >>>        samsung_dsim_init_link(dsi);
> >>>    +    dsi->state |= flag;
> >>> +
> >>>        return 0;
> >>>    }
> >>>    @@ -1269,6 +1276,10 @@ static void
> >>> samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
> >>>        }
> >>>          dsi->state |= DSIM_STATE_ENABLED;
> >>> +
> >>> +    ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
> >>> +    if (ret)
> >>> +        return;
> >>>    }
> >>>      static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
> >>> @@ -1458,12 +1469,9 @@ static ssize_t
> >>> samsung_dsim_host_transfer(struct mipi_dsi_host *host,
> >>>        if (!(dsi->state & DSIM_STATE_ENABLED))
> >>>            return -EINVAL;
> >>>    -    if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
> >>> -        ret = samsung_dsim_init(dsi);
> >>> -        if (ret)
> >>> -            return ret;
> >>> -        dsi->state |= DSIM_STATE_INITIALIZED;
> >>> -    }
> >>> +    ret = samsung_dsim_init(dsi, DSIM_STATE_REINITIALIZED);
> >>
> >> This triggers full controller reset and reprogramming upon first
> >> command transfer, is such heavy handed reload really necessary ?
> >
> > Yes it is, otherwise the proper DSI panels doesn't work with Exynos DRM
> > DSI. If this is a real issue for you, then maybe the driver could do the
> > initialization conditionally, in prepare() callback in case of IMX and
> > on the first transfer in case of Exynos?
>
> That's odd , it does actually break panel support for me, without this
> double reset the panel works again. But I have to wonder, why would such
> a full reset be necessary at all , even on the exynos ?

Is it breaking samsung_dsim_reset from host_transfer? maybe checking
whether a reset is required before calling it might fix the issue.  I
agree with double initialization is odd but it seems it is required on
some panels in Exynos, I think tweaking them and adjusting the panel
code might resolve this discrepancy.

Jagan.
