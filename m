Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D57B6A4179
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 27 Feb 2023 13:12:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbjB0ML6 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 27 Feb 2023 07:11:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjB0ML6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 07:11:58 -0500
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3F7F1F5DA
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 04:11:56 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 828285C0062;
        Mon, 27 Feb 2023 07:11:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 27 Feb 2023 07:11:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1677499913; x=1677586313; bh=p4dKxgXD9a
        z25l8x9BnyJkoKpJl5puXIKepVLfJGKGY=; b=sgODnMnrjGbSdSkkdQixXMTtxS
        1offZ+r8DRw6rn2YGEqK8RYe2YJkdTSaM7atXfQ2KtdnLCBUXuxDxQTUbA/Jmfsr
        aCUOCIw1lF8mq3f8elAEqg6LvqpWWyK42rlfdnXn+cHgLJMblhk1GI6fweIk0Orm
        JPjGn79dCnxsJjnPK1Qb1vyjK3NBVHiIjbL+WbI/uUD4+zC8QY6gjoL7KH52e9r8
        rh2jOIyld/y59L6ekCPa6+5vuHHjxRzh2JTST8hRIdHCZc6ZwY+pL5ceXfIy+kp1
        r53AbI7X4VqY9VWF6z5sqaa6i2wcZl1zYD2KeNTwVguzLvzFGjLXICpuGVGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1677499913; x=1677586313; bh=p4dKxgXD9az25l8x9BnyJkoKpJl5
        puXIKepVLfJGKGY=; b=F+n3ziSSpm+7P2AJGwBWGnoG9jF+sodTHR7P++L3q3Om
        0yYa93pd6Vve5a0XZSXtOdfRWBU8ugB198hawjNHRZ4hBGli6V0yYo6JBcWQlQGL
        Acf7udgyIT9RJnfzS+3g7ac0wiH9dnd3xQWHazc6ooaYJtIea01uzPYTvHEdkBQW
        nW/gcFaSv4Vf5feHSGLFqpqXULO55eLlBh3toAPxCGZ09c5GlM/9FBrZTbKT3JR+
        RQhww4d0aj+bYu7sgfs++OfRJNG91+Vl+IHkNPzq3NXUwup/vMsNhRUc5h0s8edL
        fjYzLn/pGt3VSSBSWg89uMlydLofrTkDIofX7aHGXg==
X-ME-Sender: <xms:CJ78Y265SawPnopayCLd-sl3M5d_gzeQO7hbml3R9Qlfwf-_9J7CtQ>
    <xme:CJ78Y_7jWjXUjiMxWlQlMVe_QxoCNb-8zUxfWNgep4Rg-_6tQVmdGq1qOaf5UjXt8
    vX2C2oT3poQ_GKwaVw>
X-ME-Received: <xmr:CJ78Y1efEcoKI0CYGRGtm5d1mOSB18gA9HBo23m2yTFkR9itGpdF2GAtGbIYWdkVodqa4ZLUvaQoO4uBYlBaO0uat6a7Jto>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeltddgfeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeejveefheefkeeiffegveelveetgffffeektdefuefhtedtgeejhefggedu
    ffffudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:CJ78YzJuwHmQbjSEbVVXqsaOAVA_CHwfIahZoJoMwA94DWXZZEAp_Q>
    <xmx:CJ78Y6KbS-heC-ccw-hmY7KT7bTnJVv6KdHqN0vOtgy4mbysJ1hnpA>
    <xmx:CJ78Y0xsQ0z5T1peUz9QSIy6RMgFzV9J5iY2mAU2qh2EIXbtZCvAjA>
    <xmx:CZ78YxrnaJNQWoG0HtDqFau7iyNkG8wGLqfRTkql3kI9LD6FnCPyjg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Feb 2023 07:11:51 -0500 (EST)
Date:   Mon, 27 Feb 2023 13:11:49 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Marek Vasut <marex@denx.de>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v13 02/18] drm: bridge: panel: Support nodrm case for
 drmm_panel_bridge_add
Message-ID: <20230227121149.c3ibajgog3i2s2ek@houat>
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
 <20230227113925.875425-3-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="57cleiwqo4cuwpi6"
Content-Disposition: inline
In-Reply-To: <20230227113925.875425-3-jagan@amarulasolutions.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--57cleiwqo4cuwpi6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 05:09:09PM +0530, Jagan Teki wrote:
> drmm_panel_bridge_add DRM-managed action helper is useful for the bridge
> which automatically removes the bridge when drm pointer is cleaned.
>=20
> Supporting the same on non-component bridges like host DSI bridge requires
> a drm pointer which is indeed available only when a=A0panel-bridge is fou=
nd.
>=20
> For these use cases, the caller would call the drmm_panel_bridge_add by
> passing NULL to drm pointer.
>=20
> So, assign the bridge->dev to drm pointer for those cases.
>=20
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v13:
> - new patch
>=20
> Note: use case on=20
> "[PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or bridge find h=
elper"
>=20
>  drivers/gpu/drm/bridge/panel.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/pane=
l.c
> index d4b112911a99..45a0c6671000 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -402,6 +402,13 @@ struct drm_bridge *drmm_panel_bridge_add(struct drm_=
device *drm,
>  	if (IS_ERR(bridge))
>  		return bridge;
> =20
> +	/*
> +	 * For non-component bridges, like host DSI bridge the DRM pointer
> +	 * can be available only when a panel-bridge is found.
> +	 */
> +	if (!drm)
> +		drm =3D bridge->dev;
> +

Why can't the caller use bridge->dev?

Also, where did the devm_drm_of_dsi_get_bridge go? I thought you were
going to convert it to a drm-managed version?

Maxime

--57cleiwqo4cuwpi6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY/yeBQAKCRDj7w1vZxhR
xUqCAP9CCAOgIorqAmGMZe9rVDg4/Sb49NR/hR/ajVjwfLJDXAD3VAPHQ5pJt+Nw
bvu2RnyrkN/NtW+g7i0y9cmRWCBQCw==
=M4Xm
-----END PGP SIGNATURE-----

--57cleiwqo4cuwpi6--
