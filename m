Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13C2D6A4BB1
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 27 Feb 2023 20:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbjB0TxY (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 27 Feb 2023 14:53:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230443AbjB0TxL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 14:53:11 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 024DF25BA6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 11:52:46 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-536bbef1c5eso207333597b3.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 11:52:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CT7ohCLhQI8YxO1y3KzHttgGtHM7ULCiROgCgh3EQXg=;
        b=kR5uGOizjE5KTXighrdevfDic7QUNfc2w8GpXfsnY0sOZXZD77R1YyWKEUULwJv6Ag
         zCwBBePEnbF5YaBSKgAn15VwugJ7OcrENTEazcNfaTcP+fC0C/X7yw8uMn3tf2uQbP4o
         29/JCXIIIH0SceMli55vr07cpNqN7LTNiASlI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CT7ohCLhQI8YxO1y3KzHttgGtHM7ULCiROgCgh3EQXg=;
        b=Jha1/Q5XIUyG+RusRj+5bYqVzILO8ICipsrNWckEIyfCxkbntoTF5fSxs5Db5Skx+e
         HkJzyhpLHB+qIdTTWo0pwejqE55NSx+Q16fh+ri8GtUrAoaixqfHHGCeuCSrdKGLLx5t
         My6hn6wuoEdE21unhNvy1w1q1wlvM8lAXbVTnh2jQ+F+WbbmXv9D3NPP39DByjlL2NOU
         gVcXvnE/T6SzLp2F7HG8ixsuIlecq9cjOnDYzKt0qx7/yLu/6RtAoh794FHjCXIyOey2
         B+A8FSMsMgTJ+ffMtudPpVwEzoZt7mXrxEVJUiAapbR2FIl/B9gt8UDeNjy0TALwUvoL
         xx1A==
X-Gm-Message-State: AO0yUKX2TAxPyVEzgrxiHdaCXSl8HONO4OgGvfNznrnFdYeipiUAk/mh
        ZQNC7fed4ZVsyAxajWkrMEzOCh0Pe/UQBiT68jiWNg==
X-Google-Smtp-Source: AK7set8tNC5nbX1IiIap9wyqguWSZXo5zA6EGbRFpDX8WjZn6SVa0PJkoMvV26K7krF9G+epQu8/G1mhtQoBiMwy2ME=
X-Received: by 2002:a25:9c02:0:b0:a6a:3356:6561 with SMTP id
 c2-20020a259c02000000b00a6a33566561mr1204ybo.1.1677527565919; Mon, 27 Feb
 2023 11:52:45 -0800 (PST)
MIME-Version: 1.0
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
 <20230227113925.875425-5-jagan@amarulasolutions.com> <3c2f91d3-0406-7730-d4e4-c94868f23c91@denx.de>
 <CAMty3ZA6_pKiOK6gWq4iQFtKsoxfUgnSFBqkgDBzEp1DcBEt3A@mail.gmail.com>
 <7b59aaf9-1f72-fd9f-29ac-1857ec3f91f3@denx.de> <CAMty3ZC6vqpFfdh2F=KUsAgm_KCksVXBV9ON1csjJd1m+gJpVQ@mail.gmail.com>
 <6066dff9-5a66-0da5-14d9-66162a2fbb39@denx.de> <CAMty3ZDjwD+3SKJiOgZLbYYTtq=udWkXbqnsyYaM73rsYxDumQ@mail.gmail.com>
 <47b8ad7d-cfc1-112c-2117-cb3612c1bba5@denx.de> <CAMty3ZDMJFW36g5=A1=_08VT1dZUMemEg3YcQMh08iZNRa+cTw@mail.gmail.com>
In-Reply-To: <CAMty3ZDMJFW36g5=A1=_08VT1dZUMemEg3YcQMh08iZNRa+cTw@mail.gmail.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Tue, 28 Feb 2023 01:22:34 +0530
Message-ID: <CAMty3ZAfZ36kCqs4Yv3ZKhQJa584zRugR80iBggDER=9j79aFw@mail.gmail.com>
Subject: Re: [PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or bridge
 find helper
To:     Marek Vasut <marex@denx.de>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <maxime@cerno.tech>,
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

On Tue, Feb 28, 2023 at 1:19 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>
> On Tue, Feb 28, 2023 at 1:11 AM Marek Vasut <marex@denx.de> wrote:
> >
> > On 2/27/23 20:34, Jagan Teki wrote:
> > > On Tue, Feb 28, 2023 at 12:54 AM Marek Vasut <marex@denx.de> wrote:
> > >>
> > >> On 2/27/23 20:15, Jagan Teki wrote:
> > >>> On Tue, Feb 28, 2023 at 12:38 AM Marek Vasut <marex@denx.de> wrote:
> > >>>>
> > >>>> On 2/27/23 20:01, Jagan Teki wrote:
> > >>>>> On Tue, Feb 28, 2023 at 12:25 AM Marek Vasut <marex@denx.de> wrote:
> > >>>>>>
> > >>>>>> On 2/27/23 12:39, Jagan Teki wrote:
> > >>>>>>> drm_of_dsi_find_panel_or_bridge is capable of looking up the
> > >>>>>>> downstream DSI bridge and panel and trying to add a panel bridge
> > >>>>>>> if the panel is found.
> > >>>>>>>
> > >>>>>>> Replace explicit finding calls with drm_of_dsi_find_panel_or_bridge
> > >>>>>>> followed with drmm_panel_bridge_add.
> > >>>>>>>
> > >>>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > >>>>>>> ---
> > >>>>>>> Changes for v13, v12, v11:
> > >>>>>>> - none
> > >>>>>>> Changes for v10:
> > >>>>>>> - new patch
> > >>>>>>>
> > >>>>>>>      drivers/gpu/drm/exynos/exynos_drm_dsi.c | 25 +++++++++++++------------
> > >>>>>>>      1 file changed, 13 insertions(+), 12 deletions(-)
> > >>>>>>>
> > >>>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > >>>>>>> index df15501b1075..12a6dd987e8f 100644
> > >>>>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > >>>>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > >>>>>>> @@ -25,6 +25,7 @@
> > >>>>>>>      #include <drm/drm_atomic_helper.h>
> > >>>>>>>      #include <drm/drm_bridge.h>
> > >>>>>>>      #include <drm/drm_mipi_dsi.h>
> > >>>>>>> +#include <drm/drm_of.h>
> > >>>>>>>      #include <drm/drm_panel.h>
> > >>>>>>>      #include <drm/drm_print.h>
> > >>>>>>>      #include <drm/drm_probe_helper.h>
> > >>>>>>> @@ -1470,24 +1471,26 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
> > >>>>>>>          struct device *dev = dsi->dev;
> > >>>>>>>          struct drm_encoder *encoder = &dsi->encoder;
> > >>>>>>>          struct drm_device *drm = encoder->dev;
> > >>>>>>> +     struct drm_bridge *bridge;
> > >>>>>>>          struct drm_panel *panel;
> > >>>>>>>          int ret;
> > >>>>>>>
> > >>>>>>> -     panel = of_drm_find_panel(device->dev.of_node);
> > >>>>>>> -     if (!IS_ERR(panel)) {
> > >>>>>>> -             dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> > >>>>>>> -     } else {
> > >>>>>>> -             dsi->out_bridge = of_drm_find_bridge(device->dev.of_node);
> > >>>>>>> -             if (!dsi->out_bridge)
> > >>>>>>> -                     dsi->out_bridge = ERR_PTR(-EINVAL);
> > >>>>>>> -     }
> > >>>>>>
> > >>>>>> As far as I understand this from my conversation with Maxime (please put
> > >>>>>> him on CC of V15), the change here should instead perform the panel look
> > >>>>>> up NOT in exynos_dsi_host_attach() , but in exynos_dsi_bind() , i.e. in
> > >>>>>> the component_ops .bind callback . Here is an example of correct
> > >>>>>> implementation:
> > >>>>>>
> > >>>>>> https://cgit.freedesktop.org/drm-misc/tree/drivers/gpu/drm/vc4/vc4_dsi.c#n1805
> > >>>>>
> > >>>>> But, we don't have component_ops.bind for imx8m case, so where do we
> > >>>>> want to place the panel hook?
> > >>>>>
> > >>>>> Exynos drm drivers are component-based but, imx8mm is not.
> > >>>>
> > >>>> In 14/18 patch, the same should be added to generic_dsim_register_host()
> > >>>> , which is called from the driver .probe() callback, but that is OK.
> > >>>>
> > >>>> That's ^ is the iMX part.
> > >>>
> > >>> Ohh. You mean, we need to find the panel hook separately in two places like
> > >>> - bind for exynos
> > >>> - probe for imx8mm
> > >>
> > >> Yes
> > >>
> > >>> If so? how can I find the drm_device pointer in the probe?
> > >>
> > >> What for ? The panel lookup uses OF graph . Where do you need the
> > >> drm_device in it ?
> > >
> > > May I can summarize the whole setback here so that everybody is on the
> > > same page and find the proper solution?
> > >
> > > The key blocker is accessing the DRM pointer in order to use the
> > > DRM-managed action helper.
> > >
> > > 1. If we find the panel hook in Exynos component_ops.bind then we can
> > > use the DRM pointer directly as VC4 does.
> > > 2. if we find the panel hook in Samsung drm_bridge_funcs.attach (for
> > > imx8mm) then we can use the DRM pointer directly via bridge->dev.
> > >
> > > If we make 2) has common across like finding the panel hook in
> > > drm_bridge_funcs.attach the Exynos drm pipeline cannot find the
> > > panels.
> > >
> > > The common solution for both exynos and imx8m is host.attach but if we
> > > do so we cannot get find the DRM pointer.
> >
> > There isn't going to be common solution, you would really have to do the
> > look up in component_ops .bind callback for exynos , and
> > generic_dsim_register_host() for i.MX .
> >
> > > If we go ahead with no need for DRM-managed helper at the moment, then
> > > find the panel hook in host.attach and then drop 2/18.
> >
> > The panel lookup must happen in .bind/.probe for exynos/imx respectively
> > , that's really all that is required here. Then you can drop 1,2,3/18
> > and get this series applied (I hope) .
>
> I'm not quite sure, if the panel hook in .bind work for exynos or not?
> the host. attach has KMS hotplug code after the panel hook and
> bridge_attach as before. I believe that is a working scenario for
> Exynos to be the panel hook in the host. attach.
>
> >
> > Can you implement just this one change ?
> >
> > There is no need to use drmm_* helper for now, that can be improved
> > later if possible.
>
> If this is the case then 1/18 will need otherwise we can drop 1,2,3/18
> by doing the panel hook we did in v7
> https://patchwork.kernel.org/project/dri-devel/patch/20221005151309.7278-3-jagan@amarulasolutions.com/

This makes panel hook common a cross bridge by handling in the host.attach

Jagan.
