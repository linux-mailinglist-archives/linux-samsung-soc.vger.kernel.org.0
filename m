Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30D3A124859
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 18 Dec 2019 14:26:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbfLRN0X (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 18 Dec 2019 08:26:23 -0500
Received: from foss.arm.com ([217.140.110.172]:46372 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726749AbfLRN0X (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Dec 2019 08:26:23 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA4BF30E;
        Wed, 18 Dec 2019 05:26:22 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 686583F718;
        Wed, 18 Dec 2019 05:26:22 -0800 (PST)
Date:   Wed, 18 Dec 2019 13:26:20 +0000
From:   Mark Brown <broonie@kernel.org>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        ALSA development <alsa-devel@alsa-project.org>,
        Dylan Reid <dgreid@google.com>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Takashi Iwai <tiwai@suse.de>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: max98090: save and restore SHDN
 when changing sensitive registers
Message-ID: <20191218132620.GE3219@sirena.org.uk>
References: <CGME20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c@epcas3p2.samsung.com>
 <20191128151908.180871-1-tzungbi@google.com>
 <8aceb9ec-aa6e-1fa4-cee9-e22084c141e8@samsung.com>
 <CA+Px+wXPa_cwdZUQfCx4jAhhj4Q9b7bNABUGazLKOJ7U5ae-mA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="19uQFt6ulqmgNgg1"
Content-Disposition: inline
In-Reply-To: <CA+Px+wXPa_cwdZUQfCx4jAhhj4Q9b7bNABUGazLKOJ7U5ae-mA@mail.gmail.com>
X-Cookie: Power is poison.
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--19uQFt6ulqmgNgg1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 13, 2019 at 02:05:32AM +0800, Tzung-Bi Shih wrote:

> I have no enough resources to test and trace the code temporarily.
> But is it possible:
> - snd_card_new( ) succeed in snd_soc_bind_card( ), so that userspace
> can see the control

This feels like snd_card_new() is being overly enthusiastic here, I'd
expect that we might have other problems elsewhere with that.  I'd not
expect userspace to see things until snd_card_register() since between
_new() and that we're in the process of building the card up.  Given
this we *will* need to handle partially constructed cards after all,
unless we change the ALSA core.  Takashi?

> - code in later snd_soc_bind_card( ) decided to defer the probe
> - soc_cleanup_card_resources( ) may forget to clean the control?  (not
> sure about this)

There's going to be a race condition where userspace can see the control
on the partially built card regardless of if it gets cleaned up or not.

--19uQFt6ulqmgNgg1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl36KPwACgkQJNaLcl1U
h9B1FAf/cs3ZrczpxiE1GFa6hVrnrhHMslFp8vgCJtcL9LHgABdrhfm04brDk4PJ
dx9OKHFPDmverQZCGNx6jGoeWcCwoUukplE3VO+EJG6yVIzwEhhZMPjdHhbnn3aI
rcZP/MDL70bOuxcLCxSzUtZE/0c0da09vqZblmyPKKRMYfIz3LsIDdkNFsIOnmhk
99U0K0WSEOCdZ9A/bcqPR2qm02Yf3Ng+v6KMMOAuIeGrnIugbLJY+yPuKPqCPykl
3XzWVWaJGchqzwpMT33HK146N1lJpdddY2BztM56J1+isrYkZ0qcY8b24HlGKFiB
0gK4QJHf6RYxKdMfiq0ofn6ARX3Cyw==
=pw2R
-----END PGP SIGNATURE-----

--19uQFt6ulqmgNgg1--
