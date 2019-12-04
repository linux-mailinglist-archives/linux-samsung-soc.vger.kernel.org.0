Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86AF9112421
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  4 Dec 2019 09:05:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726632AbfLDIFn (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 4 Dec 2019 03:05:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:52874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725951AbfLDIFn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Dec 2019 03:05:43 -0500
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1CB2F20640;
        Wed,  4 Dec 2019 08:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1575446741;
        bh=4Hw9lWp6MYS1roMlvPfnLEYA+bo3DC0x2fFPmKaOglE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uEtCVoaJMD09CukTvWhpr/nzDplQfjsDB5w2UaNVVWgDqza0H6Hj4ABJvg9t8ESLw
         wS0IqF2JWtyueuaBHYQ6v+E9IDoVDHfBlYOva15UOKiltZqM3UDsxN2PJ4FyZiCqlJ
         uHxe4taqacBg7dEZj+qNssQ2EXeHaxU/JRMI+uk8=
Date:   Wed, 4 Dec 2019 09:05:39 +0100
From:   Maxime Ripard <mripard@kernel.org>
To:     Sam Ravnborg <sam@ravnborg.org>
Cc:     dri-devel@lists.freedesktop.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jitao Shi <jitao.shi@mediatek.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Purism Kernel Team <kernel@puri.sm>,
        Sean Paul <sean@poorly.run>, Stefan Agner <stefan@agner.ch>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v1 07/26] drm/panel: remove get_timings
Message-ID: <20191204080539.z2ovccj4kjsrpttm@gilmour.lan>
References: <20191202193230.21310-1-sam@ravnborg.org>
 <20191202193230.21310-8-sam@ravnborg.org>
 <20191203074659.ilsyv4yx7pzw5vax@gilmour.lan>
 <20191203083935.GB30687@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zbo7byqykz6hibco"
Content-Disposition: inline
In-Reply-To: <20191203083935.GB30687@ravnborg.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--zbo7byqykz6hibco
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 03, 2019 at 09:39:36AM +0100, Sam Ravnborg wrote:
> On Tue, Dec 03, 2019 at 08:46:59AM +0100, Maxime Ripard wrote:
> > Hi,
> >
> > On Mon, Dec 02, 2019 at 08:32:11PM +0100, Sam Ravnborg wrote:
> > > There was no users - so remove it.
> > > The callback was implemented in two drivers - deleted.
> > >
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Thierry Reding <thierry.reding@gmail.com>
> > > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > > Cc: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: David Airlie <airlied@linux.ie>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > ---
> > >  drivers/gpu/drm/panel/panel-seiko-43wvf1g.c | 18 ------------------
> > >  drivers/gpu/drm/panel/panel-simple.c        | 18 ------------------
> > >  include/drm/drm_panel.h                     |  9 ---------
> > >  3 files changed, 45 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> > > index b878930b17e4..3bcba64235c4 100644
> > > --- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> > > +++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
> > > @@ -217,30 +217,12 @@ static int seiko_panel_get_modes(struct drm_panel *panel,
> > >  	return seiko_panel_get_fixed_modes(p, connector);
> > >  }
> > >
> > > -static int seiko_panel_get_timings(struct drm_panel *panel,
> > > -				    unsigned int num_timings,
> > > -				    struct display_timing *timings)
> > > -{
> > > -	struct seiko_panel *p = to_seiko_panel(panel);
> > > -	unsigned int i;
> > > -
> > > -	if (p->desc->num_timings < num_timings)
> > > -		num_timings = p->desc->num_timings;
> > > -
> > > -	if (timings)
> > > -		for (i = 0; i < num_timings; i++)
> > > -			timings[i] = p->desc->timings[i];
> > > -
> > > -	return p->desc->num_timings;
> > > -}
> > > -
> > >  static const struct drm_panel_funcs seiko_panel_funcs = {
> > >  	.disable = seiko_panel_disable,
> > >  	.unprepare = seiko_panel_unprepare,
> > >  	.prepare = seiko_panel_prepare,
> > >  	.enable = seiko_panel_enable,
> > >  	.get_modes = seiko_panel_get_modes,
> > > -	.get_timings = seiko_panel_get_timings,
> > >  };
> >
> > If anything, I think we should grow the usage of timings and / or make
> > it usable by everyone.
> >
> > Using only the mode as we do currently has a bunch of shortcomings as
> > almost no encoder will be able to provide the typical pixel clock, and
> > that situation leads to multiple things:
> >
> >   - If someone working on one encoder wants to upstream a panel they
> >     have tested, chances are this will not be the typical pixel clock
> >     / timings being used but rather the one that will match what that
> >     SoC is capable of. Trouble comes when a second user comes in with
> >     a different encoder and different capabilities, and then we have a
> >     maintainance fight over which timing is the true timing (with a
> >     significant chance that none of them are).
> >
> >   - If we can't match the pixel clock, we currently have no easy way
> >     to make the usual measures of reducing / growing the porches and
> >     blankings areas to match the pixel clock we can provide, since we
> >     don't have an easy way to get the tolerance on those timings for a
> >     given panel. There's some ad hoc solutions on some drivers (I
> >     think vc4 has that?) to ignore the panel and just play around with
> >     the timings, but I think this should be generalised.
> >
> > Timings solves the first case since we have the operating range now
> > and not a single set of timings, and it solves the second since we can
> > use that range to take those measures instead of taking a shot in the
> > dark.
> >
> > I appreciate that it's pretty far from where we are today, but
> > removing the get_timings means that all the timings already defined in
> > the panel drivers are becoming useless too, and that eventually it
> > will get removed.
>
> Thanks for this nice explanation. I will drop the patch,
> and add an entry to my TODO list to look closer at this later.
> There are things to improve in this area.
>
> So the conclusion is more work rather than removing code :-)

Yeah, unfortunately.. :)

Maxime

--zbo7byqykz6hibco
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXedo0wAKCRDj7w1vZxhR
xfd0AP9Vt4GkG6OTb63xkfVRNr+vESfQY3qRIc1RQUyo98hYNAD/VlGCgKCQh5F4
erCNwUBYU5DZjrI9H+0p1o4neRRPMQM=
=tp+8
-----END PGP SIGNATURE-----

--zbo7byqykz6hibco--
