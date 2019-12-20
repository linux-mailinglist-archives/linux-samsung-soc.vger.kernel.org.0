Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3AD7127A8B
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 20 Dec 2019 13:02:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727511AbfLTMCA (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 20 Dec 2019 07:02:00 -0500
Received: from foss.arm.com ([217.140.110.172]:50074 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727473AbfLTMB7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Dec 2019 07:01:59 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 057D430E;
        Fri, 20 Dec 2019 04:01:59 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B3D843F719;
        Fri, 20 Dec 2019 04:01:57 -0800 (PST)
Date:   Fri, 20 Dec 2019 12:01:54 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Tzung-Bi Shih <tzungbi@google.com>,
        ALSA development <alsa-devel@alsa-project.org>,
        Dylan Reid <dgreid@google.com>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Takashi Iwai <tiwai@suse.de>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: max98090: save and restore SHDN
 when changing sensitive registers
Message-ID: <20191220120154.GB4790@sirena.org.uk>
References: <20191218162422.GG3219@sirena.org.uk>
 <ef908cb8-875e-4339-33bd-5997b594f022@samsung.com>
 <20191219123709.GB5047@sirena.org.uk>
 <aba9f63c-d993-e54e-4daa-9dbc35d0683b@samsung.com>
 <20191219130559.GE5047@sirena.org.uk>
 <a10269be-8caf-6e07-71c6-582a1d2c1458@samsung.com>
 <CGME20191219191651epcas5p2ab8031875093df401d9182e7c491eb3d@epcas5p2.samsung.com>
 <20191219191646.GH5047@sirena.org.uk>
 <b0e57646-8a14-e6c0-9daa-28c353dcb77a@samsung.com>
 <31bde14e-1fef-264a-ba1e-fc3051506bf3@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline
In-Reply-To: <31bde14e-1fef-264a-ba1e-fc3051506bf3@samsung.com>
X-Cookie: I think we're in trouble.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2019 at 10:05:52AM +0100, Marek Szyprowski wrote:
> On 20.12.2019 09:28, Marek Szyprowski wrote:

> > I've tried initially to cherry-pick it to v5.4, but the the code=20
> > didn't compile due to lack of some macros, so I've gave up trying. I=20
> > will check that now and backport needed macros too if you think this=20
> > would help.

> Same issue. I've tried backporting it to each kernel release: 5.4, 5.3,=
=20
> 5.2, 5.1 and 5.0 (with additional backporting "ASoC: core: add=20
> SND_SOC_BYTES_E" and "ASoC: Define a set of DAPM pre/post-up events").=20
> In all cases the lockdep warning and oops is the same. Backporting to=20
> v4.9 requires more changes to get it even compiled, so I gave up.

OK, thanks - that's definitely not the recent refactorings then but
something that's been a problem for a long time.  I'm surprised nobody
else ran into anything if that's the case...

--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl38uDIACgkQJNaLcl1U
h9DDwQf/RpDA3CXzUmuNP7lNm2NA589ZoMyxBTqzZ5LEEXZlnhOgrjiX5aYJg8Py
4+/lSkFqCbyXPZ8v09HkgVYeSX7uk35axOOxaNwcLI5s+/APia7vEx+ni91mierJ
rOoOBaKJ+uFhtZ2Zjxr2icu6HsjVbd7uUb5MIQDHjtdZuQ5Q++2E/jlixv/pd2LP
r27kWtDldOALwJbG0eZk5in2q2PdRsA8ZdlQjt7hFlXF9NaqTn4sQ+6DwscmS0uZ
0SUvLEu1OOzOdqq0nrr/GaEwmxsq68S/ZRDoz60LAKDmsO4ByoWdM+7NgT9UrCu7
9C4jPeUPe1CtO/aFXlo3tq/+FgqLlw==
=3XTz
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
