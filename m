Return-Path: <linux-samsung-soc+bounces-7648-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF3DA731CF
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 27 Mar 2025 13:05:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7EF88189A01F
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 27 Mar 2025 12:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2520D2135BC;
	Thu, 27 Mar 2025 12:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fkt0A8JL"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAFD1B960;
	Thu, 27 Mar 2025 12:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743077042; cv=none; b=NuMQtsguYR0wMCpx2QtNiZzN4akbpZKHdf6l7+glozftstjmeICUx1Xd2y5sjWxdXL4rMCR7btQa10y5YftyvF2eudhCaHqWnChawp99g2uN54/sfep9RKh1Gsdp33+LiRHSVt9ZFdcKGlsTkaOeNnEcSZAiUnEM2kpkph1bKbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743077042; c=relaxed/simple;
	bh=dR9v8VrUr+EPw9tGZBr/sISbItZxJjQPBsZM18aQp3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qKC5Td90eEhKtLedTlC0SthoAGowPSWI+10N4x1s84oGINEV7v9WSfXMWC3CULhcN09z5XtdzGmdG4abjUe8KtPQ2dVe7BabVEP08eNubKvnm2VqCy5A3yMofws+WRgVwtFD/gr3BimkZGK+N732kCUM5ySS6d2KYKjI0FopjOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fkt0A8JL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 463D4C4CEDD;
	Thu, 27 Mar 2025 12:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743077042;
	bh=dR9v8VrUr+EPw9tGZBr/sISbItZxJjQPBsZM18aQp3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fkt0A8JLptTh/BzBg4SSzDzHx6tuLXcq8P7hFwuYTWKSYAPacf98ZQ008z1UrgxHI
	 YWicw1PKdayCsQjYK7T46ww1/Ma9m4yJPU08BO6s9bt1CzHhDXxttLngmvzRqaae+J
	 YLt6whjEvCcz1MhIRLNQeSYCvw6z9jrfHnEOrYgU6fQ/S0AltpYi8eblgnB18v4TZo
	 MVO6eogI8Lh2qJX+11R/6l+FYDAEZ2ibGJ8NNw/UShqbI+Ja2ffmIIO5fjX/+Gx2/C
	 ZeT8Xf7bwKyVnb+xUDB/KeCRdNq05OqEG0pCxNW7Jo5R4+HtSPrrVLUJPpIFefHGDp
	 UGtsMy1/LeV+g==
Date: Thu, 27 Mar 2025 12:03:57 +0000
From: Mark Brown <broonie@kernel.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, krzk@kernel.org,
	lgirdwood@gmail.com, andriy.shevchenko@intel.com,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V2 2/2] regulator: s5m8767: Convert to GPIO descriptors
Message-ID: <d0636140-762e-46ae-a09b-91b300e5db3d@sirena.org.uk>
References: <20250327004945.563765-1-peng.fan@oss.nxp.com>
 <20250327004945.563765-2-peng.fan@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VdL5VQWbdmrPGAaQ"
Content-Disposition: inline
In-Reply-To: <20250327004945.563765-2-peng.fan@oss.nxp.com>
X-Cookie: Multics is security spelled sideways.


--VdL5VQWbdmrPGAaQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 08:49:45AM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
>=20
> Update the driver to fetch buck_gpio and buck_ds as GPIO descriptors.
> Then drop the usage of 'of_gpio.h' which should be deprecated.
> Based on commit 84618d5e31cf ("regulator: max8997:
> Convert to GPIO descriptors") as a reference to make the changes.

Acked-by: Mark Brown <broonie@kernel.org>

--VdL5VQWbdmrPGAaQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmflPqwACgkQJNaLcl1U
h9Dpigf7BR9vFOLpaiV+vRbg31pHwF0DXQLLko5+9FyCupbDvhDgOHvaJJGR3+l6
O4jWN/TenkzBYaU8LpqoJ7BnCcnvFTXJ82F8LbU8WPVnLZo6SW4v1D5qeubDfrEJ
vOBtSr07rfZkNjqaBqLW1b4qNXPKUDZiNkKXVSyIJkAhT2HjMPL/WasMOAhHZPL5
2CxCrLlDgGGxWxaH4Nk6PuWkUxO6SqbtY6awr6Ej49KhC7uk6XN6dcEFdHOD2vR9
paQUDHR6N4NujUVntsyNqUqyvSrblYrJzCxbZIxCHTHhG0ZZdptisOZxQ+772Os+
9SwfElxBi1G/Br4kGkWAbG4QV7Y8Dg==
=3pf4
-----END PGP SIGNATURE-----

--VdL5VQWbdmrPGAaQ--

