Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47F61B7CDF
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 19 Sep 2019 16:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732040AbfISOdZ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 19 Sep 2019 10:33:25 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:54812 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727273AbfISOdZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 10:33:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=1sx8mKM+Bqm7cSb1Up4PL3u1Qlhzk3VQwMObKwWPKAQ=; b=jghkJ8niX5s9SkPtmb5Vk052N
        dGOo/9p/fCMyxtvd6uQK5Tdxl4yN7ZOW7+pTUoKfrX0Ro4pQVYHWsxaVvpNiRJb9xy9LfsKKCv+Yk
        /goRd7N7GK1W3tQ+/YU9X9qIXsDBB7xX5yezln/lW84i3v8o46OqS69TYlkrkiElff3Eo=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net ([82.37.168.47] helo=ypsilon.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.co.uk>)
        id 1iAxUh-00042Q-4N; Thu, 19 Sep 2019 14:33:15 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
        id 89B272742939; Thu, 19 Sep 2019 15:33:14 +0100 (BST)
Date:   Thu, 19 Sep 2019 15:33:14 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        lgirdwood@gmail.com, sbkim73@samsung.com,
        alsa-devel@alsa-project.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
Subject: Re: [PATCH v1 2/9] mfd: wm8994: Add support for MCLKn clock control
Message-ID: <20190919143314.GM3642@sirena.co.uk>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce@eucas1p1.samsung.com>
 <20190918104634.15216-3-s.nawrocki@samsung.com>
 <20190919075924.GB13195@pi3>
 <20190919125020.GJ3642@sirena.co.uk>
 <20190919143116.GL10204@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yr/DzoowOgTDcSCF"
Content-Disposition: inline
In-Reply-To: <20190919143116.GL10204@ediswmail.ad.cirrus.com>
X-Cookie: I'll be Grateful when they're Dead.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--yr/DzoowOgTDcSCF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 19, 2019 at 02:31:16PM +0000, Charles Keepax wrote:
> On Thu, Sep 19, 2019 at 01:50:20PM +0100, Mark Brown wrote:

> > Yeah.  IIRC when these were added a machine driver was grabbing them.  I
> > don't think that machine driver ever made it's way upstream though.

> If you mean for the Arizona stuff, the machine driver using that
> was sound/soc/samsung/tm2_wm5110.c. Sylwester upstreamed it along
> with the patches.

No, there was a WM8994 thing before that.

> I think on wm8994 the clocks probably are only needed by the
> audio part of the driver, so probably can be moved in there,
> although as a disclaimer I have done a lot less with parts
> of that era. However on Arizona the clocking is needed from
> various parts of the driver so couldn't be moved exclusively
> to the codec driver.

Yes, they're only needed by the audio part of the driver.

--yr/DzoowOgTDcSCF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2DkakACgkQJNaLcl1U
h9CyCQf+MMpoS4FlVQq+9Xt+0Uket4UES+rOnjdNVAtME5x6rwp/rW3bJeTlegL3
qviOHfnz9mgXwuCeR5RxotyqaZ6WB0ihYC/Y1TXFxaM5mN8Xqg4s3tWs0roBVc5q
wFKYpZr1heeoP8/2Meitj68poZHiUIGcU5E8Lgs9qDDJK5hwzVZ/1hJTvY4Dx5GN
ZuWslKMKAitY8sH2wV2+kDB1JY0poPsScarR/z3MozVoEIg6ABbc/EwX8MObf4a5
0QiV/9mSwrQ2Ctjd1nnr8/a8wOMkKdqiHYbCRYB5dy432Dh3oWZ5eRqUodDDR9eK
uLi3a+I6dtNmKmWHdMYaoRG//ylGlA==
=ebz9
-----END PGP SIGNATURE-----

--yr/DzoowOgTDcSCF--
