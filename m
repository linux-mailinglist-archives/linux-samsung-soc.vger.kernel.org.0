Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C55A6A5B64
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 28 Feb 2023 16:10:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbjB1PKL (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 28 Feb 2023 10:10:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjB1PKK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Feb 2023 10:10:10 -0500
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92C6E1C7EF
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Feb 2023 07:10:08 -0800 (PST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-536c02c9dfbso280527827b3.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Feb 2023 07:10:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ul8Ozd8UFTebNc6cj/DNYpyGqRAWtFXadOEA1glf6w8=;
        b=IsxOC/IxpilBfzVS0mILeYiAp5NRIfhPpwWtK2A88xcbe5ZMVaVrbKWjE15iDDsSxJ
         nP/0BfuUhiFpyoe4ut8Tiwd2P5wuHV5N6NlxYY5aZtAqbIZ7Q4PR8XoVzMF/qx4ZSjdV
         r59DedOoGqQGWyr3TN9h6qxn4EtlZkTm20mzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ul8Ozd8UFTebNc6cj/DNYpyGqRAWtFXadOEA1glf6w8=;
        b=EbS3tLJ69tm2RKgPUo8r0seSEzcfmb3AKJc7D4CK7dohXO/mW0neLrVKWlfYd84m4U
         p8u79AJ1kd4Rd9qShsBuQy49XbE/PNq7rED7HvoQzGCqLvSTq0yU3dhK6wEo/eTlWJrI
         TpPlO8mOtnLoUjjJWZDC0WR0k+70vLA/5Kvl6oNoldJzsRqx87r+k1fOr4jS/O1ldACv
         OvwuDrY9SEzuNle8/aTe6Da+02GUggqAH+XxOfK64HQ0TLxAh++qVUfwjUPrEH8aQQ4W
         WESsxYS1sQ5L7+8rU4E0Gv/mTu5Z/Hk7Vjqq/BRUArfT06Bvznh4iyUZ8LTfKj4IuTck
         990g==
X-Gm-Message-State: AO0yUKUpTfP675V6L/sQgQ88JXCvbfVQbQCqLwuiqEPfn0GyXnc/i6hH
        eEh/kLI3sQgaYVZT0Nb3lTXhLDoFJ1DRt93jSmgWAg==
X-Google-Smtp-Source: AK7set+CcGU79o8oyPBRmTOSY6bh4PMWBO83d0ITuE9LZBiFgdsZ3StCl7ZhKmcAnACLpdb24Tqa2V4MDqndjgnurNQ=
X-Received: by 2002:a81:b664:0:b0:52e:bb2d:2841 with SMTP id
 h36-20020a81b664000000b0052ebb2d2841mr1825981ywk.10.1677597006510; Tue, 28
 Feb 2023 07:10:06 -0800 (PST)
MIME-Version: 1.0
References: <7b59aaf9-1f72-fd9f-29ac-1857ec3f91f3@denx.de> <CAMty3ZC6vqpFfdh2F=KUsAgm_KCksVXBV9ON1csjJd1m+gJpVQ@mail.gmail.com>
 <6066dff9-5a66-0da5-14d9-66162a2fbb39@denx.de> <CAMty3ZDjwD+3SKJiOgZLbYYTtq=udWkXbqnsyYaM73rsYxDumQ@mail.gmail.com>
 <47b8ad7d-cfc1-112c-2117-cb3612c1bba5@denx.de> <CAMty3ZDMJFW36g5=A1=_08VT1dZUMemEg3YcQMh08iZNRa+cTw@mail.gmail.com>
 <5c10d1e6-75ce-d926-fba9-a9bf5e240895@denx.de> <CAMty3ZBpWd817b5Ye_AQse1zruUtWOm2E4WUz0b7a4k9mVEzEQ@mail.gmail.com>
 <20230228120447.q7k5xup6hbvagg33@houat> <CAMty3ZAG_zONg181mmEzx=7y7kk=kX1pObQ379d3m8_TsPzHaA@mail.gmail.com>
 <20230228145643.b537y4uuc4ep3epc@houat>
In-Reply-To: <20230228145643.b537y4uuc4ep3epc@houat>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Tue, 28 Feb 2023 20:39:54 +0530
Message-ID: <CAMty3ZC-YfNLCy-Sx9UdG6W=cHzoEid-NdRFZqGxRgtLeMDy+A@mail.gmail.com>
Subject: Re: [PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or bridge
 find helper
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Marek Vasut <marex@denx.de>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Feb 28, 2023 at 8:26 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Tue, Feb 28, 2023 at 08:09:26PM +0530, Jagan Teki wrote:
> > On Tue, Feb 28, 2023 at 5:34 PM Maxime Ripard <maxime@cerno.tech> wrote=
:
> > >
> > > On Tue, Feb 28, 2023 at 02:08:53AM +0530, Jagan Teki wrote:
> > > > On Tue, Feb 28, 2023 at 1:40 AM Marek Vasut <marex@denx.de> wrote:
> > > > >
> > > > > On 2/27/23 20:49, Jagan Teki wrote:
> > > > > > On Tue, Feb 28, 2023 at 1:11 AM Marek Vasut <marex@denx.de> wro=
te:
> > > > > >>
> > > > > >> On 2/27/23 20:34, Jagan Teki wrote:
> > > > > >>> On Tue, Feb 28, 2023 at 12:54 AM Marek Vasut <marex@denx.de> =
wrote:
> > > > > >>>>
> > > > > >>>> On 2/27/23 20:15, Jagan Teki wrote:
> > > > > >>>>> On Tue, Feb 28, 2023 at 12:38 AM Marek Vasut <marex@denx.de=
> wrote:
> > > > > >>>>>>
> > > > > >>>>>> On 2/27/23 20:01, Jagan Teki wrote:
> > > > > >>>>>>> On Tue, Feb 28, 2023 at 12:25 AM Marek Vasut <marex@denx.=
de> wrote:
> > > > > >>>>>>>>
> > > > > >>>>>>>> On 2/27/23 12:39, Jagan Teki wrote:
> > > > > >>>>>>>>> drm_of_dsi_find_panel_or_bridge is capable of looking u=
p the
> > > > > >>>>>>>>> downstream DSI bridge and panel and trying to add a pan=
el bridge
> > > > > >>>>>>>>> if the panel is found.
> > > > > >>>>>>>>>
> > > > > >>>>>>>>> Replace explicit finding calls with drm_of_dsi_find_pan=
el_or_bridge
> > > > > >>>>>>>>> followed with drmm_panel_bridge_add.
> > > > > >>>>>>>>>
> > > > > >>>>>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > > >>>>>>>>> ---
> > > > > >>>>>>>>> Changes for v13, v12, v11:
> > > > > >>>>>>>>> - none
> > > > > >>>>>>>>> Changes for v10:
> > > > > >>>>>>>>> - new patch
> > > > > >>>>>>>>>
> > > > > >>>>>>>>>       drivers/gpu/drm/exynos/exynos_drm_dsi.c | 25 ++++=
+++++++++------------
> > > > > >>>>>>>>>       1 file changed, 13 insertions(+), 12 deletions(-)
> > > > > >>>>>>>>>
> > > > > >>>>>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/=
drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > > > >>>>>>>>> index df15501b1075..12a6dd987e8f 100644
> > > > > >>>>>>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > > > >>>>>>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > > > > >>>>>>>>> @@ -25,6 +25,7 @@
> > > > > >>>>>>>>>       #include <drm/drm_atomic_helper.h>
> > > > > >>>>>>>>>       #include <drm/drm_bridge.h>
> > > > > >>>>>>>>>       #include <drm/drm_mipi_dsi.h>
> > > > > >>>>>>>>> +#include <drm/drm_of.h>
> > > > > >>>>>>>>>       #include <drm/drm_panel.h>
> > > > > >>>>>>>>>       #include <drm/drm_print.h>
> > > > > >>>>>>>>>       #include <drm/drm_probe_helper.h>
> > > > > >>>>>>>>> @@ -1470,24 +1471,26 @@ static int exynos_dsi_host_atta=
ch(struct mipi_dsi_host *host,
> > > > > >>>>>>>>>           struct device *dev =3D dsi->dev;
> > > > > >>>>>>>>>           struct drm_encoder *encoder =3D &dsi->encoder=
;
> > > > > >>>>>>>>>           struct drm_device *drm =3D encoder->dev;
> > > > > >>>>>>>>> +     struct drm_bridge *bridge;
> > > > > >>>>>>>>>           struct drm_panel *panel;
> > > > > >>>>>>>>>           int ret;
> > > > > >>>>>>>>>
> > > > > >>>>>>>>> -     panel =3D of_drm_find_panel(device->dev.of_node);
> > > > > >>>>>>>>> -     if (!IS_ERR(panel)) {
> > > > > >>>>>>>>> -             dsi->out_bridge =3D devm_drm_panel_bridge=
_add(dev, panel);
> > > > > >>>>>>>>> -     } else {
> > > > > >>>>>>>>> -             dsi->out_bridge =3D of_drm_find_bridge(de=
vice->dev.of_node);
> > > > > >>>>>>>>> -             if (!dsi->out_bridge)
> > > > > >>>>>>>>> -                     dsi->out_bridge =3D ERR_PTR(-EINV=
AL);
> > > > > >>>>>>>>> -     }
> > > > > >>>>>>>>
> > > > > >>>>>>>> As far as I understand this from my conversation with Ma=
xime (please put
> > > > > >>>>>>>> him on CC of V15), the change here should instead perfor=
m the panel look
> > > > > >>>>>>>> up NOT in exynos_dsi_host_attach() , but in exynos_dsi_b=
ind() , i.e. in
> > > > > >>>>>>>> the component_ops .bind callback . Here is an example of=
 correct
> > > > > >>>>>>>> implementation:
> > > > > >>>>>>>>
> > > > > >>>>>>>> https://cgit.freedesktop.org/drm-misc/tree/drivers/gpu/d=
rm/vc4/vc4_dsi.c#n1805
> > > > > >>>>>>>
> > > > > >>>>>>> But, we don't have component_ops.bind for imx8m case, so =
where do we
> > > > > >>>>>>> want to place the panel hook?
> > > > > >>>>>>>
> > > > > >>>>>>> Exynos drm drivers are component-based but, imx8mm is not=
.
> > > > > >>>>>>
> > > > > >>>>>> In 14/18 patch, the same should be added to generic_dsim_r=
egister_host()
> > > > > >>>>>> , which is called from the driver .probe() callback, but t=
hat is OK.
> > > > > >>>>>>
> > > > > >>>>>> That's ^ is the iMX part.
> > > > > >>>>>
> > > > > >>>>> Ohh. You mean, we need to find the panel hook separately in=
 two places like
> > > > > >>>>> - bind for exynos
> > > > > >>>>> - probe for imx8mm
> > > > > >>>>
> > > > > >>>> Yes
> > > > > >>>>
> > > > > >>>>> If so? how can I find the drm_device pointer in the probe?
> > > > > >>>>
> > > > > >>>> What for ? The panel lookup uses OF graph . Where do you nee=
d the
> > > > > >>>> drm_device in it ?
> > > > > >>>
> > > > > >>> May I can summarize the whole setback here so that everybody =
is on the
> > > > > >>> same page and find the proper solution?
> > > > > >>>
> > > > > >>> The key blocker is accessing the DRM pointer in order to use =
the
> > > > > >>> DRM-managed action helper.
> > > > > >>>
> > > > > >>> 1. If we find the panel hook in Exynos component_ops.bind the=
n we can
> > > > > >>> use the DRM pointer directly as VC4 does.
> > > > > >>> 2. if we find the panel hook in Samsung drm_bridge_funcs.atta=
ch (for
> > > > > >>> imx8mm) then we can use the DRM pointer directly via bridge->=
dev.
> > > > > >>>
> > > > > >>> If we make 2) has common across like finding the panel hook i=
n
> > > > > >>> drm_bridge_funcs.attach the Exynos drm pipeline cannot find t=
he
> > > > > >>> panels.
> > > > > >>>
> > > > > >>> The common solution for both exynos and imx8m is host.attach =
but if we
> > > > > >>> do so we cannot get find the DRM pointer.
> > > > > >>
> > > > > >> There isn't going to be common solution, you would really have=
 to do the
> > > > > >> look up in component_ops .bind callback for exynos , and
> > > > > >> generic_dsim_register_host() for i.MX .
> > > > > >>
> > > > > >>> If we go ahead with no need for DRM-managed helper at the mom=
ent, then
> > > > > >>> find the panel hook in host.attach and then drop 2/18.
> > > > > >>
> > > > > >> The panel lookup must happen in .bind/.probe for exynos/imx re=
spectively
> > > > > >> , that's really all that is required here. Then you can drop 1=
,2,3/18
> > > > > >> and get this series applied (I hope) .
> > > > > >
> > > > > > I'm not quite sure, if the panel hook in .bind work for exynos =
or not?
> > > > >
> > > > > Marek should be able to test exynos for you one more time I hope.
> > > > >
> > > > > > the host. attach has KMS hotplug code after the panel hook and
> > > > > > bridge_attach as before. I believe that is a working scenario f=
or
> > > > > > Exynos to be the panel hook in the host. attach.
> > > > >
> > > > > As far as I understand it, the look up has to be in .bind callbac=
k (and
> > > > > generic_dsim_register_host() for imx). Can you try if/how that wo=
rks ?
> > > > >
> > > > > >> Can you implement just this one change ?
> > > > > >>
> > > > > >> There is no need to use drmm_* helper for now, that can be imp=
roved
> > > > > >> later if possible.
> > > > > >
> > > > > > If this is the case then 1/18 will need otherwise
> > > > >
> > > > > Ah yes, 1/18 will be needed indeed. It should just be called from=
 .bind
> > > > > callback or generic_dsim_register_host() (i.e. probe callback).
> > > >
> > > > panel hook at the probe call would be wrong.
> > >
> > > Why?
> > >
> > > > the downstream bridge will call mipi_dsi_attach for finding the
> > > > connected upstream, so it indeed calls host.attach. If we move the
> > > > panel hook at the probe, then probing will defer.
> > > >
> > > > [   12.046862] platform 32e10000.dsi: deferred probe pending
> > > > [   12.052309] platform 32e00000.lcdif: deferred probe pending
> > >
> > > What is the dependency chain there, and why doesn't it probe?
> >
> > Let me answer here for the above 2 queries.
> >
> > This is clearly a point 2 scenario from the documentation.
> >
> > "
> > The upstream driver doesn=E2=80=99t use the component framework, but is=
 a
> > MIPI-DSI host. The bridge device uses the MIPI-DCS commands to be
> > controlled. In this case, the bridge device is a child of the display
> > device and when it will probe it=E2=80=99s assured that the display dev=
ice
> > (and MIPI-DSI host) is present. The upstream driver will be assured
> > that the bridge driver is connected between the
> > mipi_dsi_host_ops.attach and mipi_dsi_host_ops.detach operations.
> > Therefore, it must run mipi_dsi_host_register() in its probe function,
> > and then run drm_bridge_attach() in its mipi_dsi_host_ops.attach hook.
> > "
> >
> > So, the samsung-dsim follows the same rule, mipi_dsi_host_register()
> > in the probe and drm_bridge_attach() in mipi_dsi_host_ops.attach hook.
>
> But samsung-dsim is used together with the component framework, so this
> doesn't work.
>
> Seriously, I've been telling you that it doesn't work. We spent an hour
> discussing this with Marek yesterday who also explained this to you.
> Stop trying to make that happen, it just doesn't work.
>
> Can we leave that solution behind and move forward?

I have given the logs of why it's not working. I did my best to
explain. Samsung-dsim is not component-based it is a non-component DSI
host bridge exclusively for imx8mm and Exynos DSI is component-based.
Samsung-dsim we have a platform calls to call Exynos which will
operate component binding. This means that imx8mm stuff cannot use the
component framework at all.

This is all I can explain. and adding panel or bridge finding code in
the probe simply not working on imx8mm as it is non-component based.

Thanks for your patience in answering queries.

Jagan.
