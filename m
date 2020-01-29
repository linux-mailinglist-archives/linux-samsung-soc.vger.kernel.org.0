Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 094DF14CE02
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 29 Jan 2020 17:11:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgA2QLT (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 29 Jan 2020 11:11:19 -0500
Received: from foss.arm.com ([217.140.110.172]:43040 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726564AbgA2QLT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Jan 2020 11:11:19 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9897A328;
        Wed, 29 Jan 2020 08:11:18 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 171023F52E;
        Wed, 29 Jan 2020 08:11:17 -0800 (PST)
Date:   Wed, 29 Jan 2020 16:11:13 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sangbeom Kim <sbkim73@samsung.com>
Cc:     kernel-build-reports@lists.linaro.org,
        linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: next/master boot: 148 boots: 10 failed, 136 passed with 2
 untried/unknown (next-20200129)
Message-ID: <20200129161113.GE3928@sirena.org.uk>
References: <5e31aaaa.1c69fb81.a7667.f187@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qFgkTsE6LiHkLPZw"
Content-Disposition: inline
In-Reply-To: <5e31aaaa.1c69fb81.a7667.f187@mx.google.com>
X-Cookie: Chocolate chip.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--qFgkTsE6LiHkLPZw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 29, 2020 at 07:54:18AM -0800, kernelci.org bot wrote:

Today's -next fails to boot on Odroid X2 and XU3 with exynos_defconfig
or multi_v7_defconfig with SMP=n.  It appears to get stuck in a loop
probing the I2S secondary DAI for some reason:

12:07:05.997409  <6>[    6.421596] exynos-bus: new bus device registered: soc:bus_mscl ( 84000 KHz ~ 666000 KHz)
12:07:05.997653  <4>[    6.429763] samsung-i2s 3830000.i2s-sec: DMA channels sourced from device 3830000.i2s
12:07:06.006838  <4>[    6.439652] samsung-i2s 3830000.i2s-sec: DMA channels sourced from device 3830000.i2s
12:07:06.015764  <4>[    6.448666] samsung-i2s 3830000.i2s-sec: DMA channels sourced from device 3830000.i2s

and so on ad infinitum.  Vanilla multi_v7_defconfig is fine and just
displays a saingle copy of that log message.  Full logs and other
details here:

	https://kernelci.org/boot/id/5e3176467f121dbdef2824fc/
	https://kernelci.org/boot/id/5e317b7322dcdaa3e5282500/
	https://kernelci.org/boot/id/5e317c0f6bfd765fb42824f1/
	https://kernelci.org/boot/id/5e317517be8559c7542824f1/

I don't *think* it's an audio issue as mainline seems fine and all the
ASoC changes have already landed in mainline for this merge window.

--qFgkTsE6LiHkLPZw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl4xrqAACgkQJNaLcl1U
h9ATugf/ZQktKxJUE958PkbhFp8L06jo/MfX8fgEE6ntse19PBpXeuilaGQUAPJ7
JMfQp+W9juAvCnOSh9WFvc1jzs+gVNS8KgxuPNVwNsFf2IrRRegGtC/WnnadBjJ1
Ud/4su9USIquKP1QAI/6J/PayS06xyzkwWIiO9F7YqWHUQlS3sijE3rR2ik3NqRU
Xelgon/8TonC//tBv6OSP3aX2y1US/l1P8fqtZBpQL/wz7ZBxuaWaK5Mk46ppSmk
O2X9aooL11ie3Bo2erGOQomMcy8/i70DqCzGwCXdoay1BPENPNZ9mMTmCBrEvHfL
amhYBa+Zwl2H9Gl09SNTzgjQY7b/Ow==
=2GQU
-----END PGP SIGNATURE-----

--qFgkTsE6LiHkLPZw--
