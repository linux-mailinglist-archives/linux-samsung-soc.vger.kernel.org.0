Return-Path: <linux-samsung-soc+bounces-8699-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3791AD3DCE
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 10 Jun 2025 17:47:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83DBA3A2208
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 10 Jun 2025 15:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7206B2376EF;
	Tue, 10 Jun 2025 15:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qpKPn/hX"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467FA2367D0;
	Tue, 10 Jun 2025 15:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749570122; cv=none; b=DahubWOUuOvxZ/mWB9vm++bIcbIPjDP0Esw3z7kZNMIqVYUtclp5Z9BurZ/4YSuMAg6OsXBePZm0w/0GPlKGOjuCvuRNx+6LRIViEAPb/iZA22G7godoKt1X99WgzG1fjrCdn1kkJK91Wg/tmXGqkzigjsrVCLI41po8rNk5J1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749570122; c=relaxed/simple;
	bh=OCX+PMXOnofivFIKf5B4TrKIDiVPaorIpAV/YEeu6NA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwujv+nL4YRZxc3PZpHl+2m2gkHi2gDgRXapcNVrZv7iI18Mu++wuONbqaLuLx1ILqqYJRky9rCavCoqyMrfQ/OSj5VzcL1Lrx5UmnPxGDnTPZUZFByAqglFDpdz1j855oAZxY5YGdPsfk1trAnpb5EXBpI0pbMuwtWx/fzqFYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qpKPn/hX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98718C4CEF0;
	Tue, 10 Jun 2025 15:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749570122;
	bh=OCX+PMXOnofivFIKf5B4TrKIDiVPaorIpAV/YEeu6NA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qpKPn/hXTpMKHurpAOYuvdyFWF2RKykP22wfL62XAqvyfVhTvhhhMjdqLh86MKBzM
	 JtDc746E9N3lbyUvO5In6rn6/5TGFozVl7pVSYHRPsJwz43uiPjAF3JUndZjDUveFS
	 z8hqpNCY9qB2XTPAjvralMFelri/ZJ8VgM/WYYhXSxmSPMUVYRetzMTsT7s74pcmYt
	 Eq/3qMMYZCHJw6AZtA0XRU4yPu0mItmnCjO8oM4aAwKcRnOH2xitVfbWl+khIC03wH
	 WQvj/oWSLTyBY3dOQmsnDZNAdVDUQAGcSSzjtWkOsAicYMlI82HyyDlE3nioLc068R
	 W4Flwz4eYubFw==
Date: Tue, 10 Jun 2025 17:41:59 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] drm/panel/samsung-dsicm: Keep up with refcounting
Message-ID: <20250610-wildcat-of-marvelous-modernism-e4ce27@houat>
References: <20250604-of_drm_find_panel_part1-v1-0-c632e12e131d@redhat.com>
 <20250604-of_drm_find_panel_part1-v1-2-c632e12e131d@redhat.com>
 <20250606-radical-rigorous-buzzard-ca09cd@houat>
 <CAN9Xe3Si6XwsGOesNKOx9M8PjBkMG2paWXV5gvAnujWih6sqtA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="zwi57rvdrnu4faa3"
Content-Disposition: inline
In-Reply-To: <CAN9Xe3Si6XwsGOesNKOx9M8PjBkMG2paWXV5gvAnujWih6sqtA@mail.gmail.com>


--zwi57rvdrnu4faa3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/4] drm/panel/samsung-dsicm: Keep up with refcounting
MIME-Version: 1.0

On Mon, Jun 09, 2025 at 10:45:35AM -0500, Anusha Srivatsa wrote:
> On Fri, Jun 6, 2025 at 7:03=E2=80=AFAM Maxime Ripard <mripard@kernel.org>=
 wrote:
>=20
> > On Wed, Jun 04, 2025 at 10:45:11PM -0500, Anusha Srivatsa wrote:
> > > Put the panel reference back when driver is no
> > > longer using it.
> > >
> > > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> > > ---
> > >  drivers/gpu/drm/bridge/samsung-dsim.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> > b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > index
> > 0014c497e3fe7d8349a119dbdda30d65d816cccf..3667855ff0d6d1b608c579573de65=
7af7fd14388
> > 100644
> > > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > @@ -1748,6 +1748,7 @@ static int samsung_dsim_host_attach(struct
> > mipi_dsi_host *host,
> > >                       dsi->out_bridge =3D ERR_PTR(-EINVAL);
> > >       }
> > >
> > > +     drm_panel_put(panel);
> > >       of_node_put(remote);
> > >
> > >       if (IS_ERR(dsi->out_bridge)) {
> >
> > Explaining in your commit log why you think it's a good idea to put it
> > there would be really nice. In particular, it looks super odd to me that
> > you would put the panel reference in attach.
> >
> > Also, your patch doesn't work, and you have a reference inbalance. You
> > have one taken by the panel driver, put in remove. You have one in
> > drm_panel_add, put in drm_panel_remove. Which reference do you put here?
> >
> > This applies to your other patches too.
>
> Yes, I should get the ref in of_drm_find_panel() to put it here. With
> that said, all callers of of_drm_find_panel() should be converted
> instead of the small batch that this series addresses.

Then do the of_drm_find_panel() conversion before, because here you will
free up the structure despite some callers still having a reference on
it.

Maxime

--zwi57rvdrnu4faa3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJQEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaEhSRwAKCRAnX84Zoj2+
dhb2AXd6k/XL3u9/OK5zj97VWmDQziONGHEsb3bDL6hJZj6l6EtMtZ9IDIPocg8T
0UuXCwGA01sHkSg3AqDJPDYt8mzstpL8wcd8zKh9oy1niBidaedsQ6I+2mKYzaTS
VdThoLbe
=nzew
-----END PGP SIGNATURE-----

--zwi57rvdrnu4faa3--

