Return-Path: <linux-samsung-soc+bounces-11732-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F14ABF5C94
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 21 Oct 2025 12:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 12F66481E9D
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 21 Oct 2025 10:32:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720202F0C67;
	Tue, 21 Oct 2025 10:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UAKVwMh6"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE382E6CAB
	for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Oct 2025 10:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761042724; cv=none; b=UgT/281cWPPqBajE+06LQ+vXcgFNQpJDzT8uwdfEjn3HkcXDFRTz3elI4ACPWHEhc+20YS17T3WNhOf58eeU/3U7iezOaXs0JBG8yPRnPpvxXyuIACKj1rfKtjs0Bg5zMG3GBjRtWv4DFcM/4tCCXGJUzGlSD/3ZGJII9gDLN8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761042724; c=relaxed/simple;
	bh=Rv6B8AtJGjKvNQJhTVSXBcpvGM+PYPF74L5rDuuA9O0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=IT6MLfakconNUwEn+uwbdAQTIokRDA8DoUXuVkEAMc7iNAn9KwJYnwi7OjH7aOi4/lAU+owHbtJ/Dt3xWg69mMMj/e4yzgqzu3ZUr2IzkkPRaUZQSA5IrMbUEgRTuou0GyDBbnUqD1TyA15QOgvBrKwNZ1Yjm54zzU0ZkPa4+7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UAKVwMh6; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DBB56C0B88C;
	Tue, 21 Oct 2025 10:31:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FBD860680;
	Tue, 21 Oct 2025 10:31:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 050A6102F238A;
	Tue, 21 Oct 2025 12:31:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761042712; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YuVVLdxM0un/2EVnLCzvPprS2wmsm9jt4ri10VpX44E=;
	b=UAKVwMh67iPoBl4NTClw0ksLV00XODy/DIHEJ+Abr2eO5IqpQcehz/93nuSEIk1KNn1Bmg
	alRZgs0hHh6R//b9Djv11rXnVg0M3E+zSIsxC47sYWAJyGtBqcFsIVJo+s20tNSMGbhOor
	eyrx4hjsFi7ZY638H2w5XkfJ2MlT/Z227QFyUd5rEkIdAeesvlToC3vmxcoH4ehhF9PII8
	zbM6HzvGFQmw1YC877GgY3McN5LwDhQmATKGTMlq8UENwmFokLOU0KtyQWXnW3mlO7fJAu
	j9PCgp7hTfzSMz4K/v7Wh0IGkXn6qFI19aHgSoubt+UeSXbN8tO7oymiMdGsUQ==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Oct 2025 12:31:11 +0200
Message-Id: <DDNXIYL494D2.2N8L1J7XTBT4S@bootlin.com>
Cc: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <festevam@gmail.com>, <inki.dae@samsung.com>,
 <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>, <krzk@kernel.org>,
 <alim.akhtar@samsung.com>, <jingoohan1@gmail.com>,
 <p.zabel@pengutronix.de>, <hjc@rock-chips.com>, <heiko@sntech.de>,
 <andy.yan@rock-chips.com>, <dmitry.baryshkov@oss.qualcomm.com>,
 <dianders@chromium.org>, <m.szyprowski@samsung.com>,
 <jani.nikula@intel.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH v7 01/18] drm/display: bridge_connector: Ensure last
 bridge determines EDID/modes detection capabilities
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
To: "Damon Ding" <damon.ding@rock-chips.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>
X-Mailer: aerc 0.20.1
References: <20251021023130.1523707-1-damon.ding@rock-chips.com>
 <20251021023130.1523707-2-damon.ding@rock-chips.com>
In-Reply-To: <20251021023130.1523707-2-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Damon,

On Tue Oct 21, 2025 at 4:31 AM CEST, Damon Ding wrote:
> When multiple bridges are present, EDID detection capability
> (DRM_BRIDGE_OP_EDID) takes precedence over modes detection
> (DRM_BRIDGE_OP_MODES). To ensure the above two capabilities are
> determined by the last bridge in the chain, we handle three cases:
>
> Case 1: The later bridge declares only DRM_BRIDGE_OP_MODES
>  - If the previous bridge declares DRM_BRIDGE_OP_EDID, set
>    &drm_bridge_connector.bridge_edid to NULL and set
>    &drm_bridge_connector.bridge_modes to the later bridge.
>  - Ensure modes detection capability of the later bridge will not
>    be ignored.
>
> Case 2: The later bridge declares only DRM_BRIDGE_OP_EDID
>  - If the previous bridge declares DRM_BRIDGE_OP_MODES, set
>    &drm_bridge_connector.bridge_modes to NULL and set
>    &drm_bridge_connector.bridge_edid to the later bridge.
>  - Although EDID detection capability has higher priority, this
>    operation is for balance and makes sense.
>
> Case 3: the later bridge declares both of them
>  - Assign later bridge as &drm_bridge_connector.bridge_edid and
>    and &drm_bridge_connector.bridge_modes to this bridge.
>  - Just leave transfer of these two capabilities as before.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
> ---
>
> Changes in v7:
> - As Luca suggested, simplify the code and related comment.
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu=
/drm/display/drm_bridge_connector.c
> index baacd21e7341..7c2936d59517 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -673,14 +673,22 @@ struct drm_connector *drm_bridge_connector_init(str=
uct drm_device *drm,
>  		if (!bridge->ycbcr_420_allowed)
>  			connector->ycbcr_420_allowed =3D false;
>
> -		if (bridge->ops & DRM_BRIDGE_OP_EDID)
> -			bridge_connector->bridge_edid =3D bridge;
> +		/*
> +		 * Ensure the last bridge declares OP_EDID or OP_MODES or both.
> +		 */
> +		if (bridge->ops & DRM_BRIDGE_OP_EDID || bridge->ops & DRM_BRIDGE_OP_MO=
DES) {
> +			bridge_connector->bridge_edid =3D NULL;
> +			bridge_connector->bridge_modes =3D NULL;
> +			if (bridge->ops & DRM_BRIDGE_OP_EDID)
> +				bridge_connector->bridge_edid =3D bridge;
> +			if (bridge->ops & DRM_BRIDGE_OP_MODES)
> +				bridge_connector->bridge_modes =3D bridge;
> +		}
>  		if (bridge->ops & DRM_BRIDGE_OP_HPD)
>  			bridge_connector->bridge_hpd =3D bridge;
>  		if (bridge->ops & DRM_BRIDGE_OP_DETECT)
>  			bridge_connector->bridge_detect =3D bridge;
> -		if (bridge->ops & DRM_BRIDGE_OP_MODES)
> -			bridge_connector->bridge_modes =3D bridge;
> +

This does not apply on current drm-misc-next, due to the patch I mentioned
in a previous iteration, now applied as commit 2be300f9a0b6 ("drm/display:
bridge_connector: get/put the stored bridges").

However I'm sorry I have to mention that patch turned out being buggy, so
I've sent a series to apply a corrected version [0]. I suggest watching the
disucssion about the fix series, and if that gets approved rebase on top of
that and adapt your changes.

Sorry about the mess. :(

[0] https://lore.kernel.org/r/20251017-drm-bridge-alloc-getput-bridge-conne=
ctor-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

