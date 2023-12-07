Return-Path: <linux-samsung-soc+bounces-446-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2AE80827C
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  7 Dec 2023 09:03:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 11B79B20B4C
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  7 Dec 2023 08:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44D3D1E4A3;
	Thu,  7 Dec 2023 08:03:49 +0000 (UTC)
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF6A5172D
	for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Dec 2023 00:03:44 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rB9MF-0000KF-1w; Thu, 07 Dec 2023 09:03:43 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rB9MB-00E8hJ-Ag; Thu, 07 Dec 2023 09:03:39 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rB9MB-00Fouy-0g; Thu, 07 Dec 2023 09:03:39 +0100
Date: Thu, 7 Dec 2023 09:03:38 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: =?utf-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?= <inki.dae@samsung.com>
Cc: 'Inki Dae' <daeinki@gmail.com>, linux-samsung-soc@vger.kernel.org,
	kernel@pengutronix.de, 'Jingoo Han' <jingoohan1@gmail.com>,
	'Seung-Woo Kim' <sw0312.kim@samsung.com>,
	'Krzysztof Kozlowski' <krzysztof.kozlowski@linaro.org>,
	'DRI mailing list' <dri-devel@lists.freedesktop.org>,
	'Kyungmin Park' <kyungmin.park@samsung.com>,
	'Daniel Vetter' <daniel@ffwll.ch>,
	'Alim Akhtar' <alim.akhtar@samsung.com>,
	'David Airlie' <airlied@gmail.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 08/16] drm/exynos: Convert to platform remove callback
 returning void
Message-ID: <20231207080338.kcjx7uixxjw2axtc@pengutronix.de>
References: <20231102165640.3307820-18-u.kleine-koenig@pengutronix.de>
 <20231102165640.3307820-26-u.kleine-koenig@pengutronix.de>
 <CAAQKjZOnVSaO6QHpSo_i=WgTaawTq0UFtzwTw8kQ5iHN4qiAtQ@mail.gmail.com>
 <20231108075454.3aivzrbvtr4en22e@pengutronix.de>
 <CGME20231128165521epcas1p4993f7d2fab0723130a4612d810d254f8@epcas1p4.samsung.com>
 <20231128165505.wm4xs4ktycswthkt@pengutronix.de>
 <048901da28b6$5be8e700$13bab500$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yutmrk2hnouit6fr"
Content-Disposition: inline
In-Reply-To: <048901da28b6$5be8e700$13bab500$@samsung.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org


--yutmrk2hnouit6fr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Inki,

On Thu, Dec 07, 2023 at 11:37:44AM +0900, =EB=8C=80=EC=9D=B8=EA=B8=B0/Tizen=
 Platform Lab(SR)/=EC=82=BC=EC=84=B1=EC=A0=84=EC=9E=90 wrote:
> Hello Uwe Kleine-K=C3=B6nig,
>=20
> > -----Original Message-----
> > From: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > Sent: Wednesday, November 29, 2023 1:55 AM
> > To: Inki Dae <daeinki@gmail.com>
> > Cc: linux-samsung-soc@vger.kernel.org; Daniel Vetter <daniel@ffwll.ch>;
> > Jingoo Han <jingoohan1@gmail.com>; Seung-Woo Kim <sw0312.kim@samsung.co=
m>;
> > Kyungmin Park <kyungmin.park@samsung.com>; DRI mailing list <dri-
> > devel@lists.freedesktop.org>; Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org>; kernel@pengutronix.de; Alim Akhtar
> > <alim.akhtar@samsung.com>; David Airlie <airlied@gmail.com>; linux-arm-
> > kernel@lists.infradead.org
> > Subject: Re: [PATCH v3 08/16] drm/exynos: Convert to platform remove
> > callback returning void
> >=20
> > Hello Inki,
> >=20
> > On Wed, Nov 08, 2023 at 08:54:54AM +0100, Uwe Kleine-K=C3=B6nig wrote:
> > > Hello Inki,
> > >
> > > On Wed, Nov 08, 2023 at 01:16:18PM +0900, Inki Dae wrote:
> > > > Sorry for late. There was a merge conflict so I fixed it manually a=
nd
> > > > merged. And seems your patch description is duplicated so dropped
> > > > duplicated one.
> > >
> > > Ah. I have a template that generates one patch per driver. I guess th=
is
> > > is the result of using squash instead of fixup while putting all exyn=
os
> > > changes into a single patch.
> >=20
> > This patch didn't make it into next yet even though it's included in
> > your exynos-drm-next branch at
> > https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git.
> >=20
> > Is this on purpose?
>=20
> drm-exynos tree is not included in the next tree. It was previously
> included, but it has been removed. drm-exynos tree is merged into the
> mainline through the drm-next tree, but when the drm-next is
> synchronized to the next tree, a conflict occurred between the
> exynos-drm tree and the drm-next tree. Therefore, I had requested that
> drm-exynos tree be removed from the next. Perhaps I was inexperienced
> in managing the git tree at that time. :)

That sounds more like a reason to have your tree in next. One of the
core motivations of next is to find inter-tree conflicts early. If such
a conflict occurs and you only notice it when it's time to send your PR
to drm-next (or even later) the pressure to fix the problem is higher.

Also for patch contributors it's nice to have a "complete" next, their
tests are more expressive then.

So I want to encourage you to readd your tree to next.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--yutmrk2hnouit6fr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVxfFoACgkQj4D7WH0S
/k4ZPgf+I3pZTphATBXSUpHIry75pCQtOdLqDhFJBFNsZNkkejAEHnvPvII2IlOh
TH0oGcBe/zqv5u8A+N6qkQeHORERWzfDg5FqNaygNz62zsPXP1i2RC25yGoWq2XK
7G60CenU/bebpHjTzoGU5XwkWa0RvS6l64g4NFtks+IZe2Nct29UMS38F/Vuk9UW
jB7bWf9uzG+IyhunlAWapnm9xKCL6dgrrRPTUSAfilFGV3DgNOmDH20rw79pqUsK
QfGK/Vf68jBngma57A9Pt3I/1XsC48zV0iWKGbQVH3lyjQbekmbwWqUT996p6N2P
jk0Pfpq8+1cyA+2Ca50k89nAXQiuRg==
=SkA1
-----END PGP SIGNATURE-----

--yutmrk2hnouit6fr--

