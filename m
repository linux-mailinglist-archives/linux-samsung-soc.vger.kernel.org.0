Return-Path: <linux-samsung-soc+bounces-5690-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B299E6FF7
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  6 Dec 2024 15:23:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A167528690E
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  6 Dec 2024 14:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8A4E2066F0;
	Fri,  6 Dec 2024 14:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i7NRQ6jU"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF621F9AB6;
	Fri,  6 Dec 2024 14:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733494984; cv=none; b=Oyq/nX0Byz2ols+9BUG1BNkVYD3d4Wq1NWNsoco+06V8HbzEFtIemrGdxwFS1IQvXAbC6vn8bp0+ksBmvYT1YoC7NUGVF9j+Gbazz3IGvW/GRhQVd1wjx9xJzZ0TGK7M1nWjxyLpiZm1iHer7Xu3c6fH4Ha37j8hdlo3dihBgVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733494984; c=relaxed/simple;
	bh=KjGZ7RXzGwqZiqmHjguEh0tDh9nP5DfFrBU9SfrU15k=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JjJbQygTZN4zKisA5ELqePgfbLmm76r4E6ERgMUmtunp1cLOjJHGnNbhIJiWijsrlp2E4p0Fyt5ep3n3F2Wj/9Gv6ObnsCP1c/eoYKOEvdkyaCBR/aDlzKgyPL0tBL4ppdJ4i4DxK1Sz5BC6i5MXUhRAXmXZ6pgtR5PPxixoyR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i7NRQ6jU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6CA8C4CED1;
	Fri,  6 Dec 2024 14:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733494984;
	bh=KjGZ7RXzGwqZiqmHjguEh0tDh9nP5DfFrBU9SfrU15k=;
	h=From:Date:To:Cc:Subject:References:In-Reply-To:From;
	b=i7NRQ6jUNAOhb8w7aT8pqsBU9WQagCvkU0JqfRg0P0mqaGYTO0EQmBBoiAvjpgccQ
	 LSlSazpccXfaqiFOsccfqWJpQzhrgjKyCmWiso/EoKZCbnNKFWT2vNFjaSUTbrZ0NV
	 wEF0gdbsmXHAlU6dMNfRBtdodwqxIlCMnsEShU8hn0BF23K1qzYmHmJFG5KgEfh4DO
	 SPdfTFtl3NP5xzTS6Dq3t9R2GJaXe5upAcVClaEQLdi0Y0eLXtodBv7+OCkWCKEMOq
	 GFlgLzCM2OuFqbfzaLgQsxlpcn+ZYBjY63ZN9UmlE/MZ+vcIYWiHGLkkOZ+zuK9rIx
	 PzEhxJg6u+Kiw==
From: mripard@kernel.org
Date: Fri, 6 Dec 2024 15:23:01 +0100
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Phong LE <ple@baylibre.com>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 9/9] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_update_edid()
Message-ID: <20241206-speedy-beaver-from-asgard-dbed9c@houat>
HFrom: Maxime Ripard <mripard@kernel.org>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-9-b5316e82f61a@linaro.org>
 <20241202-married-bald-raven-7acd83@houat>
 <ae24x2bo736jpzi77l34hybejawwe4rp47v2idedga344ye6zr@bxsxz34dwrd2>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="dycgynhhneeoioiz"
Content-Disposition: inline
In-Reply-To: <ae24x2bo736jpzi77l34hybejawwe4rp47v2idedga344ye6zr@bxsxz34dwrd2>


--dycgynhhneeoioiz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 9/9] drm/vc4: hdmi: use
 drm_atomic_helper_connector_hdmi_update_edid()
MIME-Version: 1.0

On Tue, Dec 03, 2024 at 02:27:44PM +0200, Dmitry Baryshkov wrote:
> On Mon, Dec 02, 2024 at 02:27:49PM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > On Sun, Dec 01, 2024 at 02:44:13AM +0200, Dmitry Baryshkov wrote:
> > > Use the helper function to update the connector's information. This
> > > makes sure that HDMI-related events are handled in a generic way.
> > > Currently it is limited to the HDMI state reporting to the sound syst=
em.
> > >=20
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/gpu/drm/vc4/vc4_hdmi.c | 9 +++++++--
> > >  1 file changed, 7 insertions(+), 2 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4=
_hdmi.c
> > > index d0a9aff7ad43016647493263c00d593296a1e3ad..d83f587ab69f4b8f7d5c3=
7a00777f11da8301bc1 100644
> > > --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> > > @@ -401,13 +401,16 @@ static void vc4_hdmi_handle_hotplug(struct vc4_=
hdmi *vc4_hdmi,
> > >  	 */
> > > =20
> > >  	if (status =3D=3D connector_status_disconnected) {
> > > +		drm_atomic_helper_connector_hdmi_update_edid(connector, NULL);
> > >  		cec_phys_addr_invalidate(vc4_hdmi->cec_adap);
> > >  		return;
> > >  	}
> > > =20
> > >  	drm_edid =3D drm_edid_read_ddc(connector, vc4_hdmi->ddc);
> > > =20
> > > -	drm_edid_connector_update(connector, drm_edid);
> > > +	// TODO: use drm_atomic_helper_connector_hdmi_update() once it gains
> > > +	// CEC support
> > > +	drm_atomic_helper_connector_hdmi_update_edid(connector, drm_edid);
> >=20
> > So, it's not just about EDID, and I think we shouldn't really focus on
> > that either.
> >=20
> > As that patch points out, even if we only consider EDID's, we have
> > different path depending on the connector status. It shouldn't be up to
> > the drivers to get this right.
> >=20
> > What I had in mind was something like a
> > drm_atomic_helper_connector_hdmi_hotplug function that would obviously
> > deal with EDID only here, but would expand to CEC, scrambling, etc.
> > later on.
>=20
> I thought about it, after our discussion, but in the end I had to
> implement the EDID-specific function, using edid =3D=3D NULL as
> "disconnected" event. The issue is pretty simple: there is no standard
> way to get EDID from the connector. The devices can call
> drm_edid_read(), drm_edid_read_ddc(connector->ddc) or (especially
> embedded bridges) use drm_edid_read_custom().

And that's fine, it's to be expected.

> Of course we can go with the functional way and add the
> .read_edid(drm_connector) callback to the HDMI funcs. Then the
> drm_atomic_helper_connector_hdmi_hotplug() function can read EDID on its
> own.

Yep, that's definitely what we should do. And then we can make a
get_modes helper too that would also use it.

> Also the function that you proposed perfectly fits the HPD notification
> callbacks, but which function should be called from the .get_modes()?
> The _hdmi_hotplug() doesn't fit there. Do we still end up with both
> drm_atomic_helper_connector_hdmi_hotplug() and
> drm_atomic_helper_connector_hdmi_update_edid()?

I'd say both a get_modes helper and a hotplug helper, both using that
read_edid hook under the hood.

Maxime

--dycgynhhneeoioiz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ1MIxQAKCRAnX84Zoj2+
do5xAX4k6mKW4Bt7ybI5RhlLw9sJEo4pfcA2eh2x5DRMpHOkyzon0k434uDMFRng
2KdcU8gBgK08VG9rHNa3FQR0uOvG+ivNuzpw60Z3iQTfDrl9j6ufNMx2bCeo7pR2
LTKnOXxxkg==
=7iA8
-----END PGP SIGNATURE-----

--dycgynhhneeoioiz--

