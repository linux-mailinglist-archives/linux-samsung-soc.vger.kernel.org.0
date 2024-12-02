Return-Path: <linux-samsung-soc+bounces-5518-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CE09E0369
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  2 Dec 2024 14:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D4755165610
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  2 Dec 2024 13:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 868D21FF61E;
	Mon,  2 Dec 2024 13:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bHgcUypC"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398A66AAD;
	Mon,  2 Dec 2024 13:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733146198; cv=none; b=SVF3i5HfC5+YxijTIUeBlCl8qQohvSJ5qqg9SALZUOKVvEK2Nji07hk0j4EgP2u2kYgJtLDcA8aHZSMsM/8U38+z9J0fesedok2BRxFPbCJXMcpyoqNZtGt5gZ0ZIiSURDmCGglfXt0krHrd1PMcwl2qBs557sCuLMVwvVvypHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733146198; c=relaxed/simple;
	bh=IFuzJvH4PIMX+deaMZ+guaAibbzaO5zIO5oFh6tcLBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPIECVFVuF7oTdADYMd+rZOqLrSiN55ZOqNPCfRbYjjTyf60DUnnre2kmA6Om1TZ8+Eint5ouLU6z9qkVCawzUSBUVj8n+5VoxU9YSrMaJiJFhVDOitPgNkY11CweEBAloMoaZuQLnC7egZSYP2a1UYKH2CY/PgPEs27/C/yRyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bHgcUypC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51F02C4CED1;
	Mon,  2 Dec 2024 13:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733146197;
	bh=IFuzJvH4PIMX+deaMZ+guaAibbzaO5zIO5oFh6tcLBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bHgcUypCfrdNLakH2bqYiW0ildDMpheWqzKCa+y62SAz4AghZVigt18hhtFsQ4rR2
	 dLHI7FjFrIohgxcVHpVpkwFHVEvr6CIZUG+Qj/ECiB5UA7vh4EMWRLdZwoyZ3PRQZF
	 RLv2DUenJd6vBudiuowwN2jD+rK0uQX/vei8CE430FvFyPVtnqBQd4mKDlp0MdwRw5
	 o4IBdH3iDdrPdMg/3VGnYmxUxvTnii8HUwfTX6IkiQ8QGAm2vGrnbVTCE98pSSXp94
	 WM3XTFca56jw5Ji5mKYDEApBEBGSVNLhYPf7dj0ynfoMMI80Twh9Sxc9J+uNl+nieP
	 hdPQIWBZESVZQ==
Date: Mon, 2 Dec 2024 14:29:55 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Russell King <linux@armlinux.org.uk>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v5 2/9] ASoC: hdmi-codec: move no_capture_mute to struct
 hdmi_codec_pdata
Message-ID: <20241202-daft-fervent-grouse-2c0cf7@houat>
References: <20241201-drm-bridge-hdmi-connector-v5-0-b5316e82f61a@linaro.org>
 <20241201-drm-bridge-hdmi-connector-v5-2-b5316e82f61a@linaro.org>
 <20241202-bald-just-guan-c5d41b@houat>
 <0d4dfb60-e2e6-484a-993a-41d1229c62fb@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="it6ftflrlpkoff2s"
Content-Disposition: inline
In-Reply-To: <0d4dfb60-e2e6-484a-993a-41d1229c62fb@sirena.org.uk>


--it6ftflrlpkoff2s
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/9] ASoC: hdmi-codec: move no_capture_mute to struct
 hdmi_codec_pdata
MIME-Version: 1.0

On Mon, Dec 02, 2024 at 12:59:22PM +0000, Mark Brown wrote:
> On Mon, Dec 02, 2024 at 01:06:09PM +0100, Maxime Ripard wrote:
> > On Sun, Dec 01, 2024 at 02:44:06AM +0200, Dmitry Baryshkov wrote:
>=20
> > > The no_capture_mute flag might differ from platform to platform,
> > > especially in the case of the wrapping implementations, like the
>=20
> > I appreciate it might be a dumb question, but I never really understood
> > what no_capture_mute was all about. And in that context, why some
> > drivers would need / use it, and some won't.
>=20
> It's just what it says, it's a flag saying the device doesn't support
> muting the capture side.

Right, but then HDMI is output only, so it still doesn't really make
sense to me why we'd want to mute the capture side?

Maxime

--it6ftflrlpkoff2s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ022UgAKCRAnX84Zoj2+
dqo4AYD2N8isoa7QGodj2IWhhurOmFyzUFECqoeZtskkYpcwNSXcD3Ao0MXvyu7A
r4DsjfcBf3I/z2HcpsZ3eAjHa8zXr+DoWRZcMXUqApl0GPwHPDRNUD7vsFt6ewd3
Szeh1zbX8Q==
=Nd/9
-----END PGP SIGNATURE-----

--it6ftflrlpkoff2s--

