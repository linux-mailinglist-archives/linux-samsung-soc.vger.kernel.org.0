Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB91EBD104
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 24 Sep 2019 19:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730824AbfIXRxo (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 24 Sep 2019 13:53:44 -0400
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:41840 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727969AbfIXRxn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Sep 2019 13:53:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=RfaGhOuuaoUpgOSeA87BArKChGzJFLuolLSxNgY48EI=; b=YUUOdTv/bquXQ2zrHHSKrlSFt
        +w8XjExOCZbO5SK8wfWBtRXPYq6T7syJFvSGsQEM7ab1LTK+o/qaBbvmzSwdUt6X98vFnWQa0CsIX
        UHSrybJfrAwp2JSl2kFMFz4uZJSd8bl0/upAu3p9d8OF1SMLvDbFi2xJnWjXHDICRrRK8=;
Received: from [12.157.10.118] (helo=fitzroy.sirena.org.uk)
        by heliosphere.sirena.org.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <broonie@sirena.org.uk>)
        id 1iCp0I-0002MR-BK; Tue, 24 Sep 2019 17:53:34 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
        id B2EB0D02FC7; Tue, 24 Sep 2019 18:53:32 +0100 (BST)
Date:   Tue, 24 Sep 2019 10:53:32 -0700
From:   Mark Brown <broonie@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Falkowski <m.falkowski@samsung.com>
Subject: Re: [PATCH] ASoC: samsung: i2s: Add clocks' macros descriptions
Message-ID: <20190924175332.GB2036@sirena.org.uk>
References: <CGME20190924114843eucas1p2ea9c36289d3912e022ad7c9070fc00ee@eucas1p2.samsung.com>
 <20190924114838.25482-1-m.szyprowski@samsung.com>
 <20190924115307.GA9188@pi3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="FxQkOwrLuQ+yAGv2"
Content-Disposition: inline
In-Reply-To: <20190924115307.GA9188@pi3>
X-Cookie: Be careful!  UGLY strikes 9 out of 10!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--FxQkOwrLuQ+yAGv2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 24, 2019 at 01:53:07PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Sep 24, 2019 at 01:48:38PM +0200, Marek Szyprowski wrote:

> > +/* the CDCLK (CODECLKO) gate clock */
> > +#define CLK_I2S_CDCLK 0

> I do not find it more readable because of removal of indent
> after define name. Also the description is not accurate - you
> documented, not increased readability.

Yeah, I agree on both points.  How about putting everything on
one line more like:

   #define CLK_I2S_CDCLK	0	/* the CDCLK (CODECLKO) gate clock */

instead?

Please fix your mail client to word wrap within paragraphs at something
substantially less than 80 columns.  Doing this makes your messages much
easier to read and reply to.

--FxQkOwrLuQ+yAGv2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl2KWBsACgkQJNaLcl1U
h9AzoQf/S2ro+Bt+q/pyvdXc6kray/h1w3lBnrewElE9HPb9/fOERfjl4x4RFpXQ
X9F5NDh+4ol8uNUceRObxMYaYARZnLDeK3jG0/33Lu62lc0S7XkC9jMI8JlE//c1
vgIYN/qbJOSc4f7FJtQKrjt5SNVwE6Laeg/xwtobiBBnWc36Ptj8uGmacV5XcTBI
MAQ1DLWYyYdK12Cb1MgLrtgjVMXAPzfqpeXfnv6XrWL+yPfukYuQw9V6fkqjFEwc
qlsWasox6b+8qYO9DPwwaIATWH7rDctNHZPczQ4JQZKKTz/L42BrkwEIpxLgmLg2
3x+yOV+bhiZaX0VZWXOAkuGpR6d9uA==
=zvuY
-----END PGP SIGNATURE-----

--FxQkOwrLuQ+yAGv2--
