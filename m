Return-Path: <linux-samsung-soc+bounces-5532-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A989E094E
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  2 Dec 2024 18:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAB3FB6443F
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  2 Dec 2024 15:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C30208962;
	Mon,  2 Dec 2024 15:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="tBd9BWrr"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFB1F9DF
	for <linux-samsung-soc@vger.kernel.org>; Mon,  2 Dec 2024 15:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733153512; cv=none; b=pHixTNukohIPwz3N5H0T/LUFFp4seaqACXnGDFfU7n+qRS5CWXtqdalTVhXScyDJNJDWDI8fK+9YoolQs5sahzqx//0FP6e4eHWxXjvVWDZZ8mom3fN9lDQGl7OiGKJNlu4QMcMjKuapLfYNe8xjIbWIloeKfm5zjZ8XrS3zG4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733153512; c=relaxed/simple;
	bh=QJFQOhHvRWMfU0TK3Z+kwO6rmT9pNjzCjW1otfK4k08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbP095J93l0xkoku/GpPy2BvnwhxH4TzTzQsBKNCpYF81eI0kuUUlkCkkuAzgVVpYdSm3BpfvpcHP/BotxkEqEWuYpyFal1+jy+wgsqgxsWAzpJdsvQIZFoYtGY6oLPwfEMJYAn3+zPBQvmP/94mAHgUV8ltcmO3Z421Dr4RITM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=tBd9BWrr; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-434a044dce2so55568665e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Dec 2024 07:31:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1733153507; x=1733758307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QJFQOhHvRWMfU0TK3Z+kwO6rmT9pNjzCjW1otfK4k08=;
        b=tBd9BWrrOCYbG2KkScuJEGKmBM495QVvzh/ZTTnfy+iPKEPocGLy/lx+h0ueIUzRlb
         ARjqd1troIlOPJLORm2KTVSz2lCHRCsv4OYNUm5CIa5mcXMr1WxdD6NuMMkUTLe67Huu
         q6gRAs0X3wZir1URceK33LuewXp8zfwR7m3iZq+27vtJYL+b8L2hae/iUvSO9kIdmq95
         g24oqpd75j08JfwMP7QVTASLTpag95K/2elwaR6velEpuOD3HWNTX/k/8eysSshl3JFW
         AojPX31Y/QbHasc+Vn1pWvigm1yH4J4i0vHUYoxXL14W28FWNBn9KQElzkb4zHAFrfxL
         G3Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733153507; x=1733758307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJFQOhHvRWMfU0TK3Z+kwO6rmT9pNjzCjW1otfK4k08=;
        b=KMmPNcxlvtpgxfblsOX+zZaW+vkno/SMIvHL2hXEbxhi4vidVnzT2+NAk1aVYXPFrP
         QSNA+maNqunb1z4UTcWC9WORkRBcnNNwe43qxCSpfiG2VeSAx2S3I89xp2vcXI7JDgGs
         m0NjVqfo5VFr3rrBAtWLgz2SCYE5jXrcYVZ7YeQxnRHBXlJHMzRNfxypMax6SShyrLjk
         uwGZrFNTYT5YD/rjZBuRkxS7VFxsGJ1Qhi3HID7AqywG6jtPosiQM4JizbmvBKZsY9vm
         ujW4M9BImwnch9OacUwVZorcoP0l9dJbUSIHfMaLChaRlGT2Nj0O9sDgzXqS1UPXnZ6r
         NwuA==
X-Forwarded-Encrypted: i=1; AJvYcCV7ME/HPcR2xF6HLkvYj8CcJuWVyK3iUYfwhS9fjgYhYifDELQ04/XOS+sGTQe0mzo7VVB0wGXRNw9UKccT4nFhkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiD5MRbJoOv2Xb34nShShnzdl07YSV0qDzJUxQcZTPRuchU4UI
	OcINSeWU+I5GcDl6To6SFlXGYTuFpZjyWGGI+hGhxRJ3xzcBkzAhkDpTvHTHnTI=
X-Gm-Gg: ASbGncvKe7A/shWKA8sLzIf2bZVOvWB4eTqE8MLDfK/AaLD5T+Cch6WFjIeUbj44BS+
	S/ywxVra2Zm5eUQCh3PfikXLhtPBUWiye4luqDICzRIaX8S686Edl3dX3XnaYutBIkXNZrkrBCN
	n6XHoqDvo0goFPNptokEBiHd+lt84J16rldlcz8h9Yqp+LfB4okhlm/lVo+W+zKrGaR7nejKXVx
	j+iUSOmYWUeDPKSADlmKRgo1fTiFOnj3jnbx3YEIiaU4sg0W/WPfKg=
X-Google-Smtp-Source: AGHT+IHMBE300Bcm54Mmq/v3tBkO0lxgfJUVqj14Z7wnWfcFOCNvI3wDAreuaFWCRfOaW1RTUGcZhg==
X-Received: by 2002:a05:600c:458b:b0:42f:8229:a09e with SMTP id 5b1f17b1804b1-434a9df7b85mr236310305e9.29.1733153507008;
        Mon, 02 Dec 2024 07:31:47 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:ebc7:b34e:f4a6:7947])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434a5dfc03csm105063765e9.2.2024.12.02.07.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 07:31:46 -0800 (PST)
Date: Mon, 2 Dec 2024 16:31:44 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chanwoo Choi <cw00.choi@samsung.com>, 
	MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] devfreq: Switch back to struct platform_driver::remove()
Message-ID: <ecae7326gzjpwpg4a3ba2dgddh4jg362ybsf64xla4lyff3mk4@x3q6bocz2car>
References: <20241130135813.895628-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="peon3ci7jqimuqo3"
Content-Disposition: inline
In-Reply-To: <20241130135813.895628-2-u.kleine-koenig@baylibre.com>


--peon3ci7jqimuqo3
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] devfreq: Switch back to struct platform_driver::remove()
MIME-Version: 1.0

Hello,

On Sat, Nov 30, 2024 at 02:58:11PM +0100, Uwe Kleine-K=F6nig wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
>=20
> Convert all platform drivers below drivers/devfreq to use .remove(),
> with the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
>=20
> While touching these drivers, make the alignment of the touched
> initializers consistent.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>

Note this patch is obsoleted by
https://git.kernel.org/linus/e70140ba0d2b1a30467d4af6bcfe761327b9ec95
=2E

Best regards
Uwe

--peon3ci7jqimuqo3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmdN0t0ACgkQj4D7WH0S
/k6qNwgAiyaoRUBzt+ES/sXpbjU1ikMyNnk8Olj+yqwh6q3TT7T/cGK/mJZ+n8Jx
Kf/b7GtwcRk3RScaL6SOlRNRgJCTKyfH7s8Ko1mLum0vsaTXMeCq2v3LWmKvMqk8
IKYihoDhPxfvbFrY6VlUixTkGip8fHGONhs/PShKhoM0Q5UeBXRq0jtssisQqaDj
MD4pC+pZn9OtMP1OzIoYDm9txIY+TIQfYil1fC3HJLrS+i19CGizdK1R0gaJPl4t
YRrVt/aAZ09xtLiGt1FM8hS+DbwwIi4/t5eYPFEEzUMxFE1IAMuSkiwcr2GIQ2Wg
9eZ8IqZADcB+nKoGJhVo+lkPfeR5fQ==
=TKo+
-----END PGP SIGNATURE-----

--peon3ci7jqimuqo3--

