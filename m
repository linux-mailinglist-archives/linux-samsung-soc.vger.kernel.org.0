Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B89B36A58DF
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 28 Feb 2023 13:10:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231429AbjB1MKx (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 28 Feb 2023 07:10:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbjB1MKx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Feb 2023 07:10:53 -0500
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF77C2311C
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Feb 2023 04:10:50 -0800 (PST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 2693D5C00F4;
        Tue, 28 Feb 2023 07:10:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 28 Feb 2023 07:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1677586250; x=1677672650; bh=Z7ucCTHwQI
        HzqIstQ2gzGQMNmawMsBWCMAjlvVznLbo=; b=lkNoW6iv9NW2SpxGJ0QmIjBlCo
        nBe8y6pQlbO9UUGCV23gGFzy6v+pbhbqt8ufG+bSvTrI2C2OEchKJdQrSyY9V060
        uJ4/uYOuhJdkxdoUr7znAhkNPzJYtRn23+jriwa/KdCy58kUYvS3nBP7r3SAex94
        f2t4bKL08T+aAO/fPOWnkWZATUvd/FWv6lUfy6iQPTkrQZKyUlC0XS2MUtL2WAdE
        xI8yTJ5e26yb0R8+K2E5TcmTy0r/Mf7cEUYTskwBA9L52FAHkfHdtT+Qyub/1xv2
        QcbBXn1qyelnlfsNEnXdbp/cmI26I6+G77Z+vovGtGzmv2on4dtew2lAngFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to
        :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm1; t=1677586250; x=1677672650; bh=Z7ucCTHwQIHzqIstQ2gzGQMNmawM
        sBWCMAjlvVznLbo=; b=FZpCu269xWwuEyCAL3hTp03bwJVvlkOSiqC0x8ItEXnx
        13ZWKJoYUmw16O4v+uupYhpqaZxa0E+tgjXxe5kUCsug//NsxLzIYepWiO2fDqq3
        11/gUVN8IYGhKyaR/wtrgI0rKjI3RRLuTS3rWHNilquem6WfkFEcNoFnaMFAVoph
        cA87jZz24RPMPWgrlsONRrLYE69+0XXHAMT20NIiB4F38nVh8n0Kb2M8svcjIAAl
        Sw7HJBvU9ICG1GsZXPo3Mc37tVts8glIGZ33yPlep0Wh7WacU0FDGaqZdkuCldeJ
        f7W8imlFO/EFyRNbcVYONuKk3nxXKLE8teDGnFrVqA==
X-ME-Sender: <xms:Se_9Y8aLDSfPza7zWj2KvjJMAnIEAuE5JIE-8ba_TZ4DzJ3UkB4Qrw>
    <xme:Se_9Y3aD1qLT-_GjE7-aJ1XxgnIdg6JfOWkaX8bvfEXYoG60dPzD4lvrF6ZfFAv8d
    WsfhvOMV8o2U-lum40>
X-ME-Received: <xmr:Se_9Y29Vmov-i00rjSoLtDT8kXkVW6xwzB-5qoSS9fd8SgSe25wRNz0WYjrt1541_0Or3rSrccEoVa39HZjSwIosxyT5K1Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelvddgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
    hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:Se_9Y2qGr2JHAu-taCTvs30vttZ9R3b8iM_kUMOeiNJdwtNG5qtv9Q>
    <xmx:Se_9Y3o7e8n16ec5sWN0hCEQpE_GJXwEt4q_wsab35NmwOxoBI0TQQ>
    <xmx:Se_9Y0SLRqIWvHdT8IA56dH24k7xIojsj558tkkP5ryk65sY7fJclQ>
    <xmx:Su_9YzB5A1u75vvRJNHpQi7wcTdGKWERLN8AOcfzXGrV6g_bDBQhnQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Feb 2023 07:10:48 -0500 (EST)
Date:   Tue, 28 Feb 2023 13:10:46 +0100
From:   Maxime Ripard <maxime@cerno.tech>
To:     Marek Vasut <marex@denx.de>
Cc:     Jagan Teki <jagan@amarulasolutions.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Subject: Re: [PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or
 bridge find helper
Message-ID: <20230228121046.jfq6dqyuphfmqemi@houat>
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
 <20230227113925.875425-5-jagan@amarulasolutions.com>
 <3c2f91d3-0406-7730-d4e4-c94868f23c91@denx.de>
 <CAMty3ZA6_pKiOK6gWq4iQFtKsoxfUgnSFBqkgDBzEp1DcBEt3A@mail.gmail.com>
 <7b59aaf9-1f72-fd9f-29ac-1857ec3f91f3@denx.de>
 <CAMty3ZC6vqpFfdh2F=KUsAgm_KCksVXBV9ON1csjJd1m+gJpVQ@mail.gmail.com>
 <6066dff9-5a66-0da5-14d9-66162a2fbb39@denx.de>
 <CAMty3ZDjwD+3SKJiOgZLbYYTtq=udWkXbqnsyYaM73rsYxDumQ@mail.gmail.com>
 <47b8ad7d-cfc1-112c-2117-cb3612c1bba5@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5pk3o2razmrniyzv"
Content-Disposition: inline
In-Reply-To: <47b8ad7d-cfc1-112c-2117-cb3612c1bba5@denx.de>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--5pk3o2razmrniyzv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 08:41:22PM +0100, Marek Vasut wrote:
> > If we go ahead with no need for DRM-managed helper at the moment, then
> > find the panel hook in host.attach and then drop 2/18.
>=20
> The panel lookup must happen in .bind/.probe for exynos/imx respectively ,
> that's really all that is required here. Then you can drop 1,2,3/18 and g=
et
> this series applied (I hope) .
>=20
> Can you implement just this one change ?
>=20
> There is no need to use drmm_* helper for now, that can be improved later=
 if
> possible.

Yeah... The drmm helper isn't needed per se, but not using it will
create a use-after-free pattern that is very easy to miss.

I'd really prefer not to add a new helper that favors an unsafe pattern,
but the driver seems to have a whole bunch of them anyway so it's not
really a big deal.

Which also raises another question: if it's code that is only really
relevant in the context of that driver, why are you creating a helper
for it in the first place?

It would be much easier to just have that code in your driver: there's
no need to consider all cases, document it properly, you can have as
many workarounds as possible, etc.

Maxime

--5pk3o2razmrniyzv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY/3vPgAKCRDj7w1vZxhR
xSecAQCQSdv6915pV/9Tq+U4CMPfZishqVE+S4sm3cIcR3TpjAEA6fnN483U6sOm
Ht2YWI5xUVWSpUUApqCuC+VtfD3uEwQ=
=IAGr
-----END PGP SIGNATURE-----

--5pk3o2razmrniyzv--
