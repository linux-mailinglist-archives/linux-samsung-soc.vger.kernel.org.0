Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BDA5173F33
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 28 Feb 2020 19:09:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725769AbgB1SJH (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 28 Feb 2020 13:09:07 -0500
Received: from foss.arm.com ([217.140.110.172]:42344 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725730AbgB1SJH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Feb 2020 13:09:07 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E21831B;
        Fri, 28 Feb 2020 10:09:06 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4B933F7B4;
        Fri, 28 Feb 2020 10:09:05 -0800 (PST)
Date:   Fri, 28 Feb 2020 18:09:04 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        alsa-devel@alsa-project.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Sangbeom Kim <sbkim73@samsung.com>
Subject: Re: [PATCH v2] ASoC: samsung: Silence warnings during deferred probe
Message-ID: <20200228180904.GD4956@sirena.org.uk>
References: <CGME20200228101124eucas1p1f6ab761a38f4a953a4eeed89859fcf4a@eucas1p1.samsung.com>
 <20200228101120.28819-1-m.szyprowski@samsung.com>
 <20200228161220.GB4956@sirena.org.uk>
 <CAJKOXPdVRCtJcUS-jkAGoeOB5C8mBWPoZxmFNmg2On0STd6mkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="C1iGAkRnbeBonpVg"
Content-Disposition: inline
In-Reply-To: <CAJKOXPdVRCtJcUS-jkAGoeOB5C8mBWPoZxmFNmg2On0STd6mkg@mail.gmail.com>
X-Cookie: There Is No Cabal.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--C1iGAkRnbeBonpVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 28, 2020 at 06:45:33PM +0100, Krzysztof Kozlowski wrote:
> On Fri, 28 Feb 2020 at 17:12, Mark Brown <broonie@kernel.org> wrote:

> > This is completely removing the diagnostics so if things do get stuck
> > the user will generally not have any hint as to what's going wrong -
> > it's better with this sort of change to lower to dev_dbg() for deferral
> > rather than completely removing the error message so the user has some
> > ability to figure out what was missing.  However in this case it's also
> > the case that snd_soc_register_card() is fairly noisy.

> This dev_dbg could be achieved with ftrace for probe() as well. I
> think it is quite common to skip all messages for deferred probes.

Yes...  and having had the pleasure of debugging problems with things
not instantiating I'm not a fan of this trend.

--C1iGAkRnbeBonpVg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5ZVz8ACgkQJNaLcl1U
h9C6Nwf+KLjN/KSJFzMCTGSDZ5SJw9Fpqa/Ntspc24Sh8wDwW3HJuAbJRVrTxhmv
OKUJrpYv9DXLhuavDyMVqT4t5aGFI0DegRLDEgJgMnsrRYfQ6L0Qh0RlVc4QxoaK
9k0PAZIQVoDS/JMICY6EV2O2teqj89gRUgvrUCpBFVvvnymAbOLsXn35CT37ccnS
JeeTiKEZJWbV+ypFY4hiAlamYcfyTpwznXd3qBW33mCP4sQ9OHBDfBe7jI1j78R6
Hyui5A8nJGYiNnHMgy3ZjMrF/NolpvdlvJ4laYvT9pY8wBHC0HqyoI6ez1TZBMHO
yoAcXxrmlD2Pu6rtxWzrdeLbI5lGsA==
=mAzg
-----END PGP SIGNATURE-----

--C1iGAkRnbeBonpVg--
