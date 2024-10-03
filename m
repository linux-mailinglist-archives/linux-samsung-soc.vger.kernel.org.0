Return-Path: <linux-samsung-soc+bounces-4831-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E6B98ECCC
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  3 Oct 2024 12:17:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A33F1F25238
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  3 Oct 2024 10:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A472114A084;
	Thu,  3 Oct 2024 10:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Q50PVz69"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAF21B969
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Oct 2024 10:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727950634; cv=none; b=CsfrLxUcGDISMOOAG/vWEhTmD5DV4gW1jksSa6betxnIrx7JyLeIkbH9ff0hf27HZ0noI+zdsbA1GrsAH/njIZvRJa7fYLiWogTIgjM5MHAk9aQKYsU+OB1z+Xszi2uOheH3qyHpaKCTVIFIlffefCs0Y3nr1xSeYHEi8ClrVqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727950634; c=relaxed/simple;
	bh=CPzKZ2SycFDfIAc+AZwrsibUkb6+iznBOHN+1XuIl0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eGEUFvD7tW3CcD++JsQpnBamFOY/mN2g/ojXI/TeqrTtwvWrARer2eHCiUTBfvCg8KMofWqeMGjLz5hntaMCu5w/2n/cHn/qiDgjeHaIjv1HnSFpPQYzKNq/Qe3JpII23vw+E1+aPWmrCOEOxizr1pXivJL7eWGrRaNi3IToQ20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Q50PVz69; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37cc4e718ecso617980f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Oct 2024 03:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727950631; x=1728555431; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X3CFMCkPlNFPBBDKHQENI3Kp3uKPTlcHA9zYpwqdNTo=;
        b=Q50PVz69B+5rhkjteTrE6B+oGb9suKuA/A9w2YvtfqVDS+SEf5zrAe0ePLzw+RsdfP
         xnalfvdJ+bzvH11qDso6leoq6Fx91lughqLGTmIos0+6iLUUgaQzDbOIsffVpWHkA6ui
         5VwTNPKwPOrCvMPEC4nX7h8ZG6QLsf09xRIMDnmkfRKNbCkOwb/b4H2Z9TNb8gGi51V8
         ecVXt61mICLR8lcQngzHiN5ZM9RnVIG275MfbZhU56bq73kLkSAa/cRJwWFJpkfQG5+T
         V6mcNsroTI8XI1TGQiea0hCWDF62AmPfEztWrnkAcyDm48904x54gX2M+U1+1tIw01EB
         ZCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727950631; x=1728555431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3CFMCkPlNFPBBDKHQENI3Kp3uKPTlcHA9zYpwqdNTo=;
        b=oBKWC7elWtvzhuvpxS19hDTzXfEziL6rCm7fd3+Boy5lkfsJ9qtGOOzuUi2SS9xxa+
         LP36F/d8frIac4UQjUw8Y0ltOeZMJ1bcy763BJhakZ7TkPuT3WP5ke+mpREn0MmeDA53
         FpMKWUA6pvhdW18ckr3E/tVAqw9+y7X8JP116WE2XNytKGyo++u8KinzEotPVzh7tB6y
         QJlJHpNyWErnGNz0y9p+0wRp6pJW3e5O+n2Th51OTPoMYqVlo8E8kTu8eiYUpylUMrr7
         Osmcjcr3rKZ5cMgoD0G6vEL6sWcPnVvEzZRXBXo04uP9gNVulc6nSEougnWAbikYXc43
         jX9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqqysvpkjAT9YL7RxvKL5n8GChnyjnk0kx9mcMREWMh0BIAqlBmzOI28NtN5N5eLqm0nJ+LG8Al5wiWV7sM9HtGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YznzN63a1wZl/bJi1ezy1gZHTp9SV8/lUBJt4ESxsf6UNVj9YnE
	OlzADhBGUk7BbFjUsHjSkUnRaGZby3SS6abtxnTD5e78hfvO5kznVxBCJC5vrFg=
X-Google-Smtp-Source: AGHT+IG10io4/2iPPzCSOTsOgTsFJPkNq+meFNwXwQCTWyJqrNQMbEET7n04sD8jVgWyjUBfqMxSVw==
X-Received: by 2002:a5d:5983:0:b0:378:a935:482 with SMTP id ffacd0b85a97d-37cfba1dc43mr5021696f8f.58.1727950630841;
        Thu, 03 Oct 2024 03:17:10 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:36f3:9aff:fec2:7e46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d0822b878sm943889f8f.44.2024.10.03.03.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 03:17:10 -0700 (PDT)
Date: Thu, 3 Oct 2024 12:17:08 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-pci@vger.kernel.org, vigneshr@ti.com, s-vadapalli@ti.com, 
	lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org, robh@kernel.org, 
	bhelgaas@google.com, jingoohan1@gmail.com, krzk@kernel.org, alim.akhtar@samsung.com, 
	shawn.guo@linaro.org, songxiaowei@hisilicon.com, marek.vasut+renesas@gmail.com, 
	yoshihiro.shimoda.uh@renesas.com, thierry.reding@gmail.com, jonathanh@nvidia.com, 
	thomas.petazzoni@bootlin.com, pali@kernel.org, florian.fainelli@broadcom.com, 
	angelogioacchino.delregno@collabora.com, ryder.lee@mediatek.com, heiko@sntech.de, 
	kevin.xie@starfivetech.com, kishon@kernel.org, dlemoal@kernel.org, shawn.lin@rock-chips.com, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: controller: Switch back to struct
 platform_driver::remove()
Message-ID: <tdxrmmqyzcufupnwkdbg7lwgadizm7v3lxjirykijbml7x54ze@upbdzycdsilm>
References: <20240923065706.728769-1-sergio.paracuellos@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rjnidy7htz7yht65"
Content-Disposition: inline
In-Reply-To: <20240923065706.728769-1-sergio.paracuellos@gmail.com>


--rjnidy7htz7yht65
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I found this patch in next as 712359cb5e9d9553c1383fc5005593aa1988efc4.

While rebasing my patches with the same purpose I found that this patch
handled the indention differently than I did for two files:

On Mon, Sep 23, 2024 at 08:57:06AM +0200, Sergio Paracuellos wrote:
> diff --git a/drivers/pci/controller/pcie-altera.c b/drivers/pci/controlle=
r/pcie-altera.c
> index ef73baefaeb9..b921bbb4de80 100644
> --- a/drivers/pci/controller/pcie-altera.c
> +++ b/drivers/pci/controller/pcie-altera.c
> @@ -817,7 +817,7 @@ static void altera_pcie_remove(struct platform_device=
 *pdev)
> =20
>  static struct platform_driver altera_pcie_driver =3D {
>  	.probe		=3D altera_pcie_probe,
> -	.remove_new	=3D altera_pcie_remove,
> +	.remove	=3D altera_pcie_remove,
>  	.driver =3D {
>  		.name	=3D "altera-pcie",
>  		.of_match_table =3D altera_pcie_of_match,

here indention is inconsistent already before, I replaced the tabs after
".probe" by a single space (and after .remove, too).

> [...]
> diff --git a/drivers/pci/controller/pcie-hisi-error.c b/drivers/pci/contr=
oller/pcie-hisi-error.c
> index ad9d5ffcd9e3..cb5fcfe032d1 100644
> --- a/drivers/pci/controller/pcie-hisi-error.c
> +++ b/drivers/pci/controller/pcie-hisi-error.c
> @@ -317,7 +317,7 @@ static struct platform_driver hisi_pcie_error_handler=
_driver =3D {
>  		.acpi_match_table =3D hisi_pcie_acpi_match,
>  	},
>  	.probe		=3D hisi_pcie_error_handler_probe,
> -	.remove_new	=3D hisi_pcie_error_handler_remove,
> +	.remove	=3D hisi_pcie_error_handler_remove,
>  };
>  module_platform_driver(hisi_pcie_error_handler_driver);
> =20

Here I added another tab after ".remove".

> [...]

Also the patch missed to adapt drivers/pci/controller/pcie-xilinx-nwl.c.

Best regards
Uwe

--rjnidy7htz7yht65
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmb+byEACgkQj4D7WH0S
/k5tYgf+LuoIx6Lg09wpZPStrA8H7eKEFOTQopqan1vq3Ga6jIP3hndsyTFj6OZf
nc+hpdGX44b/IU4C2JQ4NenmkkC42t67jkR3SW8CQN2RRdHsrnvepXnhMKCiLgn0
SJ+/Bl7eILgeXc1xSnLAkJ2M5NHiOP0UoFS8NjHKT8SNjdB9YYxzCzmY8PWpVRhM
ajzuoLPdluQecLTULOfNeSudy6WYTxUhBHBt09h+f8vnsLLM3H+1MU0EuZc9uWpk
nup/NJchVsDCCB12+SLDlgr18pJQcdcKZc42wafxczvyPoapzW2sHRI+7iwONDdr
ysFzK7ew968tXn9ZM/t00VMx6jmnNw==
=OYC2
-----END PGP SIGNATURE-----

--rjnidy7htz7yht65--

