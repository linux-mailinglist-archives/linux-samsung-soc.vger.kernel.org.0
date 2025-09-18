Return-Path: <linux-samsung-soc+bounces-9568-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDCCB14924
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 29 Jul 2025 09:30:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F6053AEE84
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 29 Jul 2025 07:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ACC622ACF3;
	Tue, 29 Jul 2025 07:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hn+DvuJy"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D7A2248BF;
	Tue, 29 Jul 2025 07:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753774245; cv=none; b=dLCxBopneP8a9m34g/CIFLurIv479Mp2cLY2aBa1Qhkrg3yGBnSBBFFphRxc6RmBCxXspDUc7HTCKWzGuPfEY17woxHsdpItB4v2+90SYIykGnO+RcfIj8UnY9ZnNAUzSc7w6YHctL5ZlPmfpnDEJO1gEBWcbvoa8FAPRHdw9JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753774245; c=relaxed/simple;
	bh=coKTsMLVDBf6r0VF8A4W9McCs0iZm5oFPtW97NBjROg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oyfJugyXsoCCxgWLiQv3oZzbYDNU0CFtAWu27OYqiIs5c+N1kuj6oCCvuJW1/3aw5p3/RGwg0w+hzJUpih0UW34mZt/cExIwB8voMgSp9ABOmwb5VPDErUYtqrNcfUftypKfJda5Vw/6phtR/rODEL7OZJmdTZvxe8xFOPVP+o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hn+DvuJy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F4FEC4CEF5;
	Tue, 29 Jul 2025 07:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753774244;
	bh=coKTsMLVDBf6r0VF8A4W9McCs0iZm5oFPtW97NBjROg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hn+DvuJy941T5WWhLwdlgRzqUOzSLP9y1hoWzClJzJ5vVihcN4mAJ/fDyXYHjI/EM
	 ht9c+CGHWAofkr9umRMI3SCH5yrzYfr3SU5OTs1MZLiNkFu3gLShgdDjHKBohYn3X3
	 1brGoebiG7IwHSs1sCsh0KjiPQ/4q8cTf6bjbvK6gQUiVx1C0zw7tXMKJVyc/FtYCd
	 bS4XOIOpcq2rVSvaWSYwA13aZnPRnxrKCPwvN2ta1SbuAaDubmbDMtvSogLtT4e+w/
	 zjaLgc6oMH6pwaCByx64pQrnRVGEBkRh+AcvIR7Q9iHvpu4ZoQUWp+OmtsjYB3MnO5
	 aT0k8AE/UEYkA==
Date: Tue, 29 Jul 2025 09:30:42 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
	jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com, 
	kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com, hjc@rock-chips.com, 
	heiko@sntech.de, andy.yan@rock-chips.com, dmitry.baryshkov@oss.qualcomm.com, 
	l.stach@pengutronix.de, dianders@chromium.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 04/14] drm/bridge: analogix_dp: Add
 &analogix_dp_plat_data.bridge
Message-ID: <20250729-wooden-opalescent-baboon-f24fa2@houat>
References: <20250724080304.3572457-1-damon.ding@rock-chips.com>
 <20250724080304.3572457-5-damon.ding@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="oafxeh4vinfkct5o"
Content-Disposition: inline
In-Reply-To: <20250724080304.3572457-5-damon.ding@rock-chips.com>


--oafxeh4vinfkct5o
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 04/14] drm/bridge: analogix_dp: Add
 &analogix_dp_plat_data.bridge
MIME-Version: 1.0

Hi,

On Thu, Jul 24, 2025 at 04:02:54PM +0800, Damon Ding wrote:
> In order to move the parnel/bridge parsing and attachmenet to the
> Analogix side, add component struct drm_bridge *bridge to platform
> data struct analogix_dp_plat_data.
>=20
> The movemenet makes sense because the panel/bridge should logically
> be positioned behind the Analogix bridge in the display pipeline.
>=20
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> ---
>  include/drm/bridge/analogix_dp.h | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/include/drm/bridge/analogix_dp.h b/include/drm/bridge/analog=
ix_dp.h
> index cf17646c1310..15cb6b706e9f 100644
> --- a/include/drm/bridge/analogix_dp.h
> +++ b/include/drm/bridge/analogix_dp.h
> @@ -27,6 +27,7 @@ static inline bool is_rockchip(enum analogix_dp_devtype=
 type)
>  struct analogix_dp_plat_data {
>  	enum analogix_dp_devtype dev_type;
>  	struct drm_panel *panel;
> +	struct drm_bridge *bridge;
>  	struct drm_encoder *encoder;
>  	struct drm_connector *connector;
>  	bool skip_connector;

So it's not the analogix_dp bridge, but the bridge after that if any?

You should probably change it to next_bridge to avoid any confusion.

Maxime

--oafxeh4vinfkct5o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaIh4oQAKCRAnX84Zoj2+
dny6AX4lOggIEb8lQNPrxNej+S0dVv7qskx+vSl0C36fU5HUiF0+6CBKZiz3el7U
6s5d/OkBfjGyQ7uwq5vKT0ASCi71FHRzNGynDjVQB1ShScAr+kp4qhm/0+swkWfl
/Qwui0BIPw==
=5MI3
-----END PGP SIGNATURE-----

--oafxeh4vinfkct5o--

