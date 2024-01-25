Return-Path: <linux-samsung-soc+bounces-1327-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9CC83CD79
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Jan 2024 21:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1D0EB22490
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Jan 2024 20:31:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61CDA1386B5;
	Thu, 25 Jan 2024 20:30:47 +0000 (UTC)
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC437257A
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 20:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706214647; cv=none; b=HVkX8vISQirwC6ISTO/wQX1zn4qOdvAYVW8637ES08uC6huG1Dtv5qjgXDEiQmw7fmpgb13oFbfa7amm9ulYLak+UD8GWbU9vjyxB+x9tz8/CmEMK1yA5Q1Bc8TFnDvwf4HjNlRsl2L5PneqSzjaeTT9nPYXWQdB++KMc6/AWkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706214647; c=relaxed/simple;
	bh=Ape9Uf1QEOHm9y/s9rG0+A2pBh89SFwW410Y4Nhrnd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q4ZW1h0J/j56FDktD6X/ObUgogHb/ReyOvjYu3x1+GABCOVmrKvfOIZc49LqzvSLoJrEs+ebbDhJAgqtu0GMRWF+S4/xoF+eta/Qbbj64lZSXl4TjY3fshmyOXXtOD5MOjqCymFx00HULzejvLhJgPg0+POL0ThzFPA874NJrT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rT6M4-0007oq-4x; Thu, 25 Jan 2024 21:29:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rT6Ly-002MWh-9O; Thu, 25 Jan 2024 21:29:38 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rT6Ly-0087Xo-0R;
	Thu, 25 Jan 2024 21:29:38 +0100
Date: Thu, 25 Jan 2024 21:29:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-pwm@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Benson Leung <bleung@chromium.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Guenter Roeck <groeck@chromium.org>, linux-riscv@lists.infradead.org, 
	Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, 
	Jerome Brunet <jbrunet@baylibre.com>, chrome-platform@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev, 
	Jonas Karlman <jonas@kwiboo.se>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	greybus-dev@lists.linaro.org, linux-mediatek@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Douglas Anderson <dianders@chromium.org>, kernel@pengutronix.de
Subject: Re: [PATCH v5 003/111] pwm: Provide a macro to get the parent device
 of a given chip
Message-ID: <e3xeos2rtfydqj3hz3ql7xkon3aa3aingww7q5lpb3xa4arqrs@6jgwfrgay4le>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <1cae6f73264ab313205eaa9483251f7aaf259cb4.1706182805.git.u.kleine-koenig@pengutronix.de>
 <c89cbecf-253d-4a2c-8782-304b7b620175@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qxr7wcriw2tz34lp"
Content-Disposition: inline
In-Reply-To: <c89cbecf-253d-4a2c-8782-304b7b620175@broadcom.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org


--qxr7wcriw2tz34lp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 11:32:47AM -0800, Florian Fainelli wrote:
> On 1/25/24 04:08, Uwe Kleine-K=F6nig wrote:
> > Currently a pwm_chip stores in its struct device *dev member a pointer
> > to the parent device. Preparing a change that embeds a full struct
> > device in struct pwm_chip, this accessor macro should be used in all
> > drivers directly accessing chip->dev now. This way struct pwm_chip and
> > this macro can be changed without having to touch all drivers in the
> > same change set.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Nit: this is not a macro but an inline function.

Oh right, it used to be a macro, but I changed that. I made the commit
log read:

    pwm: Provide an inline function to get the parent device of a given chip

    Currently a pwm_chip stores in its struct device *dev member a pointer
    to the parent device. Preparing a change that embeds a full struct
    device in struct pwm_chip, this accessor function should be used in all
    drivers directly accessing chip->dev now. This way struct pwm_chip and
    this new function can be changed without having to touch all drivers in
    the same change set.

Thanks,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qxr7wcriw2tz34lp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWyxLEACgkQj4D7WH0S
/k5nkwf9F+1G1rrz7HMmMk0kkol6Q/0nb8baCUPdKhCcHXWnUrkFf+l8BvLEafhy
6D5c/214tles7OGu5Mgkku0rW4Ae8+sq9Ho2OEJEpVsSuULPwv3+L44VQzZgsjD6
ULcEcc1vul0iOpwJ0bTHeMqX+P3OENhi72tUDh+NQNnml8ZgePsTI2Ef8agexXAb
7GLAE/AnRbi3bqcn5XzmIjskyMJfwOT4AvyHWPzzM1sGWfGPOiDp8e2cQXNsUywY
IZ1X1op4Eax4/Yg/DB2uED0doQLAwJct5JLN/G+Dfx6EReTyA39z64IHPuxNmCXA
REKDvLe8LO4A9v/JIUQuiwXHBcbjLQ==
=k1zn
-----END PGP SIGNATURE-----

--qxr7wcriw2tz34lp--

