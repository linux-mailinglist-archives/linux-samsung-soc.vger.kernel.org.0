Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A67B667CEA9
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 26 Jan 2023 15:47:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229473AbjAZOrj (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 26 Jan 2023 09:47:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbjAZOrf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 09:47:35 -0500
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F4FB40D9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:47:29 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id F162A5C0429;
        Thu, 26 Jan 2023 09:47:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 26 Jan 2023 09:47:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm1; t=1674744446; x=1674830846; bh=50XbxMxXh3
        RnYrbxek0Iuq+3NjnCbFXEdGPqPgrKdjA=; b=oebNCiCB5ZL++pWeYOiWRfEjOk
        uHmb5IIfKWiRvNkKjs+RHnP4GwJujKxyvj51drK1kTub7W0OxVrYB7kgKiqqkVTI
        AIiPDWSgiqg0/8mVkRmTGr2j7EwfMOmLcA8yoF6gMV058n6amhp7gHywvFqiAfJN
        kOPRTB3kjuv6Ze9eSvu952U6sXgdN8qDtGnn5/90fmB37C33jgTRBXNxVP7m61qX
        ddP3DR/N5+2IHjFAv/7OCyQROafh26ID6cU7Lp76LdGhv1UDjiGDlghmDaUbUfH+
        OMZ6N+mEWdPxnD3FfDI4QZ4MqJnmFdrh0wMDbGaAfFDgqaILptqIi28a62Ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; t=1674744446; x=1674830846; bh=50XbxMxXh3RnYrbxek0Iuq+3NjnC
        bFXEdGPqPgrKdjA=; b=s/k4J0wzrUvRpm6ObjjVHdJPJNmniHXDTfpvE1OhWtj8
        ozlnp+9Z9/it24Xev9nG5VmOPDBf8j9tum6ix8FUlhySE/RQAojzXAYdL3jvbJdd
        Zo1QYQDjtdKFGr8RsrSN586D1xQHlLWmqhPpmuAobIfsA5yAeUgfY0F9F/iYACUd
        qBez8qaduGYKZIHAB1dkDh0tu35xrbZtGlH3yoXvn/Y9H72RLu0BJ7j1O57qAMHz
        8yc2IWHsyjs0IlT/fUFwbrerlqfEZSt91ckPGeyOYlbGteeWEuuii9w3OwqbPmUB
        SJmPFbXE1lOX7Jndrot+bHX7/7AgStAxo+Mg+vDlZQ==
X-ME-Sender: <xms:fpLSY7QFvNfg0CTsoTLLz4mQIUK4bERK2m5kys5ZLh9QvQBEXa8AfQ>
    <xme:fpLSY8xBFGpuMJPl_EKz81a308g-xVfOpW3rxUmWe_24wXi64ywX7mN0VmyeDW9kz
    nepSU7227GPy8SnwiM>
X-ME-Received: <xmr:fpLSYw2kLeUzZ_pRNNB_SgWVADdeUJGGXbp1TZtacBT0Ct6L7clGT0i39wcj1xOXWUW45gN5pomRX7gq2VTua696PsDydwPWkGzr9XXxPRPMIQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvgedgieekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fpLSY7DzsVzHIHOOEnyf7iHJ4vfurnf_O1hPCFtLiEaQo_imajd24w>
    <xmx:fpLSY0imONtGciDuliaVUTzB4w04yGsuTH_yAlF2vHTdVMPSVR__zA>
    <xmx:fpLSY_oYyneifSHnLumA-sWEzhiqnRGIzRSjgGUbN9tTwtC2H9uzig>
    <xmx:fpLSYzqf5HoZZ_nguBemXoZVZczS5V029IQa3YCFKhKK0HRUFCFG5Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Jan 2023 09:47:25 -0500 (EST)
Date:   Thu, 26 Jan 2023 15:47:22 +0100
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
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Marek Vasut <marex@denx.de>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v12 02/18] drm: bridge: panel: Add
 devm_drm_of_dsi_get_bridge helper
Message-ID: <20230126144722.ahnfzrl7ohy4lsah@houat>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
 <20230126144427.607098-3-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ctbirwvbqktam5or"
Content-Disposition: inline
In-Reply-To: <20230126144427.607098-3-jagan@amarulasolutions.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--ctbirwvbqktam5or
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 26, 2023 at 08:14:11PM +0530, Jagan Teki wrote:
> Add devm OF helper to return the next DSI bridge in the chain.
>=20
> Unlike general bridge return helper devm_drm_of_get_bridge, this
> helper uses the dsi specific panel_or_bridge helper to find the
> next DSI device in the pipeline.
>=20
> Helper lookup a given child DSI node or a DT node's port and
> endpoint number, find the connected node and return either
> the associated struct drm_panel or drm_bridge device.
>=20
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v12, v11:
> - none
> Changes for v10:
> - new patch

I sent you an email earlier today telling you to change this.

Maxime

--ctbirwvbqktam5or
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY9KSegAKCRDj7w1vZxhR
xQk7APsFDe/QFarTUSJaYAYtwFTlzNBwwdJbq1FxCjhKMEESbQD+LltGByM+Fojq
hUNh+f9wsXS4juUiEHvAOjoRjUQ8CAI=
=pQFN
-----END PGP SIGNATURE-----

--ctbirwvbqktam5or--
