Return-Path: <linux-samsung-soc+bounces-8530-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEE1ABC787
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 19 May 2025 20:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0845F1B6166B
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 19 May 2025 19:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E04D21147B;
	Mon, 19 May 2025 18:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="N7zmZOKr"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777DB20FA94
	for <linux-samsung-soc@vger.kernel.org>; Mon, 19 May 2025 18:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747681186; cv=none; b=bz/wqFKDmkJmJVVYDrY748BcnrXIB3SWv2y4XOWUNVuhkYtUURhr1DbJpJkz1bAmyXgA/hCY8S3wH2nFaLsV8Gv8jQ3Q8cNCVFQ2wTuMFrC82Ab1DiiLAbO8lwqJSvJhioHY2Q5P58iJrNMI9GdR0+kPgUc+EBqrgMLMoHr9Y8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747681186; c=relaxed/simple;
	bh=fcRR+5EcSH2NnZRiq+ktBDbPi2pbVrwiv1JAzpr30/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qoh2AJtOnSpNXSLK7+2J6JgAJ4O5ZNiMHr0PxEcf61wkTKgxIVEz34yeTK7cpolERspOT58IAi2pV1eQyq9sd675H2XmX5k5TugJbgWmGl10NPCqBnEmUQjQPOl38jKCR3w2tR1AmdfgdB46AmJip4J7KsCSwNvCA/8DV2TKd/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=N7zmZOKr; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=fcRR
	+5EcSH2NnZRiq+ktBDbPi2pbVrwiv1JAzpr30/g=; b=N7zmZOKr6XTLjOmlTya8
	qpS/cZfFj9/bODuxKLEJ0emekgGh3jPw9pOF397y0bUXwKq7buAu1QvQwc0Ye7pj
	8Sg5Ek5BHup+uxJLXeECcFaJ3tBYFXP0Z7U0+WzcV+G45hE8si/ZvSwQzbd8PvXU
	ez0V5Q1qRYZ/6m+t45zGmwhPeFGpKwxSVKGIzpPUQUuB1oYYaHaaHxKoDUFBaRtt
	aUxFSbFudm8BI9U6TNjYQG4xO7UTn4oxHl1H/UQJ7hULuBuFfFdzeTqzDkoQ1j4k
	zr4wKw8rRbwma44sPE0nF+jt3FaAI0IJhr0ezollsXBQEK7JMrLfnwLTzudUTIzg
	hw==
Received: (qmail 2605808 invoked from network); 19 May 2025 20:59:41 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 20:59:41 +0200
X-UD-Smtp-Session: l3s3148p1@gd37u4E1qNdZz6uL
Date: Mon, 19 May 2025 20:59:41 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	loongarch@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>,
	WANG Xuerui <kernel@xen0n.name>
Subject: Re: [PATCH 0/7] archs: use proper node names for GPIO based I2C
 busses
Message-ID: <aCt_nTLapk0XdI4E@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Huacai Chen <chenhuacai@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	loongarch@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>, Samuel Holland <samuel@sholland.org>,
	WANG Xuerui <kernel@xen0n.name>
References: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Miw4moGlT/mH/7E/"
Content-Disposition: inline
In-Reply-To: <20250519121512.5657-1-wsa+renesas@sang-engineering.com>


--Miw4moGlT/mH/7E/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 19, 2025 at 02:15:00PM +0200, Wolfram Sang wrote:
> A lot of boards across various archs have a superfluous '-' in their
> node name for GPIO based I2C busses. 'dtbs_check' complains, so fix
> them.

Please drop this series. We found out that upstream dt-schema is broken
instead. I sent a fix.


--Miw4moGlT/mH/7E/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgrf5wACgkQFA3kzBSg
Kba0/w/8DghRfAlopqU9war5gwpE26Ihxt5Q+oMhY5xMtWaQFNqTEc66w4HdQr3/
29RR7JJnOaX3VKQ/WpSYysrZxG185wIlaNA8jb8NRcvdI5N0p06SVBaJbnFh2e05
q3Y/EL5RCfyagvTQjCtTSZQPW0LjKIFM+EsxgWtZU2GgD8dQJMylLMgkgruViB95
8nFoBB+wxTKUcOixJxztDXAmeGOBh5J7XnpKVU8rH7Uqp4YePBIXDtN761U4Mf5S
PGHndrQ6+96AfztgD+X/jOLw3udkj8jM/PjkXRm00LRqk7bkC9C33WXIC4yk0G/X
KLFBh6KOP8JB0VqUC4v3ijbxaeVnPQIEFbFwGtY/XRBftELqN9vMNIEQixTPciB/
uBMbD2XacAwyCcmeDSEv2nqKm7oSuJ+mN5Zk6k1PnDbRFsrkq+fp+uWEyhoyybLD
1viuWAWh/rzsPwfixjyPKy0zd9aHaV3hNT4sSzrqhCrZikEmcusq1LqLPlGLsYbx
Mm1U9EU/JtSvJwQyUX8ZUWN5w1ndA/fzR9UDSZ9oE+cZCvnfV0PaSfuNZYH/ehVH
UzwSkZrjklNhZ/RQQCZGxce7bCbMUbSg6UdYDn+qW+UHqXyzp7b9Uk6PDWtUtla0
3GHameu2L+C947A6uzLxX0OJWCYJKdRqaghannzZwZibP0E5sxY=
=J0Ho
-----END PGP SIGNATURE-----

--Miw4moGlT/mH/7E/--

