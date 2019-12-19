Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F372C126DD4
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 19 Dec 2019 20:16:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbfLSTQt (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 19 Dec 2019 14:16:49 -0500
Received: from foss.arm.com ([217.140.110.172]:43320 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726907AbfLSTQt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Dec 2019 14:16:49 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 393291FB;
        Thu, 19 Dec 2019 11:16:48 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD5843F67D;
        Thu, 19 Dec 2019 11:16:47 -0800 (PST)
Date:   Thu, 19 Dec 2019 19:16:46 +0000
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
Message-ID: <20191219191646.GH5047@sirena.org.uk>
References: <8aceb9ec-aa6e-1fa4-cee9-e22084c141e8@samsung.com>
 <CA+Px+wXPa_cwdZUQfCx4jAhhj4Q9b7bNABUGazLKOJ7U5ae-mA@mail.gmail.com>
 <20191218132620.GE3219@sirena.org.uk>
 <f6453e48-cd95-6471-8945-4cc0ab3d04d9@samsung.com>
 <20191218162422.GG3219@sirena.org.uk>
 <ef908cb8-875e-4339-33bd-5997b594f022@samsung.com>
 <20191219123709.GB5047@sirena.org.uk>
 <aba9f63c-d993-e54e-4daa-9dbc35d0683b@samsung.com>
 <20191219130559.GE5047@sirena.org.uk>
 <a10269be-8caf-6e07-71c6-582a1d2c1458@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="uJrvpPjGB3z5kYrA"
Content-Disposition: inline
In-Reply-To: <a10269be-8caf-6e07-71c6-582a1d2c1458@samsung.com>
X-Cookie: I smell a RANCID CORN DOG!
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


--uJrvpPjGB3z5kYrA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 19, 2019 at 02:41:17PM +0100, Marek Szyprowski wrote:
> On 19.12.2019 14:05, Mark Brown wrote:

> > You can't trigger this via any other mechanism, all the other controls
> > are fine?  There's *clearly* no issue with what the commit is doing,
> > it's just flagging up that the card is not set.

> I've cherrypicked the $subject commit onto vanilla v5.5-rc1 and the=20
> issue is same.

Yeah, there were a lot of refactorings in the last merge window so that
doesn't entirely surprise me.  The commit should backport futher than
that I think?

--uJrvpPjGB3z5kYrA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl37zJ0ACgkQJNaLcl1U
h9Cctgf/RHHQThaM3HgCq/Tt1yzFqhDhgbtzRGhB3VQUpQ4pH7xPLd9iBKMFJdfn
tnMFXfg2BFIjk/sZ63wBagRh5lhI9r0MZE+GgRiYs5NAXn8L9/IDpe1D4JTvzF2o
QptVlv20UYbmZXfS7CgACTNreMtCO5UWWEmoMj2lLmN6iF4HX6x5XKkAQ6xc4une
9XxgYbfY64gyftKW+woaaOai1GM3Ru60tKnzLy3BTa/MP5tTEhlcLvfEee8ZCy5d
UfXnubSxCYtE0iztv/SCkAIxPRvhMhP96edsub3clpVKPCUXfdeIQprp89OLk/bR
16nounqBx0diZLPVES00DYHD3dZRCg==
=nSB4
-----END PGP SIGNATURE-----

--uJrvpPjGB3z5kYrA--
