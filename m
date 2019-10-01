Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0CCC9C325E
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  1 Oct 2019 13:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731848AbfJALWf (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 1 Oct 2019 07:22:35 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:37536 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731463AbfJALWf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 07:22:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=h0oq3hgGKfDpPykm12Ho/6mx7zx/DDd3ddTmuUJvbLg=; b=UuD2xK4+FD+o6WJLN+Z/Qktx9
        XDiLn0jqNIDd163JcaLJ/MExArYp/HdllmlH9PFpC27RB/XLKqkfDAJwXB7At1ux1xpmBz343DEVl
        4lbddFgH6aPU1e0YyeDXREXxUaBwBsmge0wnxWy1pqyZCWBDG8meMf2b38yWO0kuGR43k=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iFGEe-0004Ox-O5; Tue, 01 Oct 2019 11:22:28 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 2E5FD274299F; Tue,  1 Oct 2019 12:22:28 +0100 (BST)
Date:   Tue, 1 Oct 2019 12:22:28 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     krzk@kernel.org, lgirdwood@gmail.com,
        ckeepax@opensource.cirrus.com, sbkim73@samsung.com,
        alsa-devel@alsa-project.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
Subject: Re: [PATCH v2 08/10] ASoC: samsung: Rename Arndale card driver
Message-ID: <20191001112228.GC5618@sirena.co.uk>
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
 <CGME20190920130323eucas1p218c6822eca3869eb0d3b7380497bbca4@eucas1p2.samsung.com>
 <20190920130218.32690-9-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ghzN8eJ9Qlbqn3iT"
Content-Disposition: inline
In-Reply-To: <20190920130218.32690-9-s.nawrocki@samsung.com>
X-Cookie: Dyslexics have more fnu.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--ghzN8eJ9Qlbqn3iT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 20, 2019 at 03:02:17PM +0200, Sylwester Nawrocki wrote:
> Rename arndale_rt5631.c to just arnddale.c as we support other CODECs
> than RT5631.  While at it replace spaces in Kconfig with tabs.

This doesn't apply against current code, please check and resend.

--ghzN8eJ9Qlbqn3iT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2TNvMACgkQJNaLcl1U
h9B5/Qf/X9rpGHePKhgNMopSnhX5Qe21BJNNbNjUxWxPTwsw2b1QJJ6tvlNU1Plj
JxKTplpI0I8fQNhgBgK1zkc8SECbUDRSwkR/UOBthGp2s7/ZeClSHvyTD6Z2j5IT
OyFKkFi7MLpjK4eBoIlbW5NnfZYKyC7edq5RgFBn1TZsbdaGaDrx9urqoSQwJfTF
APcyzdbqNU0Y1UzyZ8jKGGXOLljoDAHW8gpGnunvRyE3Vaw4KLG6spBkuxIuep0L
hjlRBSmx0lR4UrG7CKYmWK6UmxDIaKIUfbp5nqKOQ8V3x0mHbw4cQxQp3hv7+WYk
R5jy35YHbr0NyF5bGBiPWb8OZxJhxw==
=x8KZ
-----END PGP SIGNATURE-----

--ghzN8eJ9Qlbqn3iT--
