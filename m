Return-Path: <linux-samsung-soc+bounces-5691-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BEE29E7017
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  6 Dec 2024 15:35:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63D7428578E
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  6 Dec 2024 14:34:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB0EC1494AB;
	Fri,  6 Dec 2024 14:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WgHxdjMu"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7303D32C8B;
	Fri,  6 Dec 2024 14:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733495695; cv=none; b=aGbt+ngDTAW0xkEeA11TTRy69EmQQKzSscjMV1eMuacL2CMdxXZV71T0RT1sUVaBNrM11Vdydx2b+/aKDmUzvHJG/kLA0+/HIrKf5nvWJl0E45NJt37uScEAs1vl+3wN1EDCABMsBDGxSopHLN2lMacM2EQgFkGoJ2TgGRSOKg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733495695; c=relaxed/simple;
	bh=nF5LxKv8T81leJMO/CuStFlxQDPRXw0NlSd9f5JANYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s32gfombTyxsi+AEsnb+9OU9R4yIcMfNazXDYijIofvMKcCMtrpjm6cQLL6/KJ84THIwNtei7TW0RXrgjCMvHBjpyBVbbiQiDEVYAVvk5foooNyVLGaiY3Q/KiYSh1IX4Q3xEQZUTVU8EUVV4JyzUDoH0jwbUQ6V9q2qs2oyGjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WgHxdjMu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A50DC4CED1;
	Fri,  6 Dec 2024 14:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733495695;
	bh=nF5LxKv8T81leJMO/CuStFlxQDPRXw0NlSd9f5JANYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WgHxdjMuh7TGdSDG78OQk4528JQqnx5KRlevVafqybA+nndhgJb7Q70hQ36QphC7m
	 5J5HKk9E6TZ9duXn4GHfgApO3OHuIlAXffiDZU129EnvSz9FhND87VGhejelBxsIvq
	 sBLNi5O3GT4ArsiTXb+a95mquANa9oVe/eoZ27dirHsZm5LDxjFWrLYgljpvRikiYq
	 MmlKV31TVnfvcurjE5rt1OKQoZIgxIH/EK+7WsaTtS1YWbu9imqs3Y+eKs3FPMTZX8
	 Jx9N7bJkAiOxjE4cCX1Ke6WmOWBeRNiKX9xzpl/XzHbUaojbajwdOG+z2tSb05GFEz
	 EBCHb6D1nP7SA==
Date: Fri, 6 Dec 2024 15:34:52 +0100
From: Maxime Ripard <mripard@kernel.org>
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
Subject: Re: [PATCH v6 09/10] drm/vc4: hdmi: stop rereading EDID in
 get_modes()
Message-ID: <20241206-caped-proficient-rattlesnake-c882f3@houat>
References: <20241206-drm-bridge-hdmi-connector-v6-0-50dc145a9c06@linaro.org>
 <20241206-drm-bridge-hdmi-connector-v6-9-50dc145a9c06@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="6occl6gdwf4rqri7"
Content-Disposition: inline
In-Reply-To: <20241206-drm-bridge-hdmi-connector-v6-9-50dc145a9c06@linaro.org>


--6occl6gdwf4rqri7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 09/10] drm/vc4: hdmi: stop rereading EDID in
 get_modes()
MIME-Version: 1.0

Hi,

On Fri, Dec 06, 2024 at 12:16:03PM +0200, Dmitry Baryshkov wrote:
> The vc4_hdmi_connector_detect_ctx() via vc4_hdmi_handle_hotplug()
> already reads EDID and propagates it to the drm_connector. Stop
> rereading EDID as a part of the .get_modes() callback and just update
> the list of modes. This matches the behaviour of the i915 driver.
>=20
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/vc4/vc4_hdmi.c | 21 ---------------------
>  1 file changed, 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdm=
i.c
> index e5ab42f72f618b90f956482db6c9c8074c1e3bf1..3364ef90968dad3074800f029=
26300ffceb75c69 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -470,31 +470,10 @@ static int vc4_hdmi_connector_detect_ctx(struct drm=
_connector *connector,
> =20
>  static int vc4_hdmi_connector_get_modes(struct drm_connector *connector)
>  {
> -	struct vc4_hdmi *vc4_hdmi =3D connector_to_vc4_hdmi(connector);
>  	struct vc4_dev *vc4 =3D to_vc4_dev(connector->dev);
> -	const struct drm_edid *drm_edid;
>  	int ret =3D 0;
> =20
> -	/*
> -	 * NOTE: This function should really take vc4_hdmi->mutex, but doing so
> -	 * results in reentrancy issues since cec_s_phys_addr() might call
> -	 * .adap_enable, which leads to that funtion being called with our mutex
> -	 * held.
> -	 *
> -	 * Concurrency isn't an issue at the moment since we don't share
> -	 * any state with any of the other frameworks so we can ignore
> -	 * the lock for now.
> -	 */
> -
> -	drm_edid =3D drm_edid_read_ddc(connector, vc4_hdmi->ddc);
> -	drm_edid_connector_update(connector, drm_edid);
> -	cec_s_phys_addr(vc4_hdmi->cec_adap,
> -			connector->display_info.source_physical_address, false);
> -	if (!drm_edid)
> -		return 0;
> -
>  	ret =3D drm_edid_connector_add_modes(connector);
> -	drm_edid_free(drm_edid);

I don't think that works though, for mostly two reasons:

 1) We're not sure we'll even have an hotplug interrupt if the system
    boots with the connector plugged in for example.

 2) afaik, the get_modes ioctl directly calls get_modes too.

Maxime

--6occl6gdwf4rqri7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ1MLiwAKCRAnX84Zoj2+
dtSXAX4hYRG+Z6tKfkagtuQh3eXutsb5V7CXdnzsxAuDpcnlgOGnrNWvE/pOo221
IbNrcU0BgKUK8Zc+sRgjwT4hMHCUzqNxA3vJPT21KIFeOFWVKptImryaMUOS4zgh
qNsNOpDWOQ==
=07j8
-----END PGP SIGNATURE-----

--6occl6gdwf4rqri7--

