Return-Path: <linux-samsung-soc+bounces-1390-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E4383E33A
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 26 Jan 2024 21:18:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 525B7289F31
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 26 Jan 2024 20:18:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A356922EF3;
	Fri, 26 Jan 2024 20:17:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SLiKPXkj"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1526A24203
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 20:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706300278; cv=none; b=r5oDv277S+xT9lK5z5reIp+2PVLHsf7R1rS+YEPYIz0nuRwuJIG9nbfDd/egCGjkXDG0ooIRfvRMaBuKm5bR8TRzI6TBHzLcAWoTyvcy1tFNrCzY2q5PQ0Lj1b3EUb6wqVcbhNW0dRr1uS4XfY+rjJKTDzNYA6CtsgZhZ0BbKxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706300278; c=relaxed/simple;
	bh=rpdW6PURYqzbeQ3X/TN6LDESW+qA+/o5fzR/Z99lIQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J8xHfxEww2Nv7V14SxgNfQCNTV+iOHb/L6a9J7Lw/qFBq166N1liKeUxJl3EWOs3nErvSOrlRgdL24WlNon5+Z2XT0PMljFUgmScKMlRMMnx2V8G1QzaH656n6nfc5jBkIBGDv8CVXu0iI9l6yJXB6mzh3gT4xlzXC0MBKFsE9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SLiKPXkj; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6dddf4fc85dso684153b3a.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 12:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706300276; x=1706905076; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TY8f4fU4xwCCs2Pdc3Pqh77KDrWj9ON9heZB0LQFAlc=;
        b=SLiKPXkjzwrGU69bESZr0W2LNgbdVZqIU1Q5hq0t9Gb4gtuAIXohvs9thHdwpGf2DP
         YTK/P6Zw+dttvCGLzvQS7bKlgaey4sO/Y0QYhEinOvRbZBEwBKgFdCwd1xvia9Z5K+zd
         I8IAnzqAIoFNt/ln10I+thjY0NnK9X0vR3e+DSGy+YreiE1LYQYLpvcVC9y3UKn2beSo
         eXHuALnXb2gYupD0pNc0Kv6xgz2lrQ/e9qisAs6p9VOFGxzNWH1WX5kxyVhtn/SJkn6m
         y8WMF31W4FL6o7u6/xkgql34seVt/erduU+rJpQWq6wWD9MQ6mAJN7YtKgrFAdJaAP48
         Q6FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706300276; x=1706905076;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TY8f4fU4xwCCs2Pdc3Pqh77KDrWj9ON9heZB0LQFAlc=;
        b=SzciKWWbOMYUplc2IBiEc0W1HUZAySqELbRG6BbUi8ywa5/ytGDh6EtwrbEkdizZ2I
         sxhK8OemUe2Kqukbq7xgmsAoVvi2fj4LQIwwSCvbhzbomo2LLE3Nfw+q+yr5aL/2+V9g
         otOykHVNDqLSWzOntWvY8M5MR9UYm4pzxi0AFz8fqdZM/H386siMyCrB3xrzA3KOBslP
         NMYsybIiG0rOXp6LZYRA8a1odUVDA1yqMbMcXW92U5/WA2xU1/eBLcrnMN0Ga8g1eONT
         9F7NB1aeRlZsyESgtaK/pch/clhsYqOwlvoB0rdXSBDDNd8OM6CQNBlVsyJNh8B5Cwla
         125Q==
X-Gm-Message-State: AOJu0YxJIsH/kF/hnUbvBunSozR6BOIHbgDpsITMRv7fznGUrNPt9mAM
	2p1bXI38pTGwiga3M7IBwYuNHHKpogtgHtT+d+y8WS+e173AeFTj8FvRCta3g9LKwbPwJ3SgJ5G
	lR4qZ5yPQ2MIWmDlvvH5TR0n478l9HwFgEqXV6g==
X-Google-Smtp-Source: AGHT+IEVno4GW1APRXy6CPjOmvt3Vs5lrryB091gy4k1flSkZKDEqIxcbmIAdUm7FOOUCra4B7CAVfveGkTLIY2p1hk=
X-Received: by 2002:aa7:8699:0:b0:6da:84ae:c209 with SMTP id
 d25-20020aa78699000000b006da84aec209mr353702pfo.45.1706300276388; Fri, 26 Jan
 2024 12:17:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240126171546.1233172-1-tudor.ambarus@linaro.org> <20240126171546.1233172-7-tudor.ambarus@linaro.org>
In-Reply-To: <20240126171546.1233172-7-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 26 Jan 2024 14:17:45 -0600
Message-ID: <CAPLW+4n3U99cm0Bv5XhceXyEtp4pTh1TWjtB1ci+f2fO+i1_ag@mail.gmail.com>
Subject: Re: [PATCH v3 06/17] spi: s3c64xx: remove unneeded (void *) casts in of_match_table
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: broonie@kernel.org, andi.shyti@kernel.org, krzysztof.kozlowski@linaro.org, 
	alim.akhtar@samsung.com, jassi.brar@samsung.com, linux-spi@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 11:15=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linar=
o.org> wrote:
>
> of_device_id::data is an opaque pointer. No explicit cast is needed.
> Remove unneeded (void *) casts in of_match_table. While here align the
> compatible and data members.
>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/spi/spi-s3c64xx.c | 45 +++++++++++++++++++++++----------------
>  1 file changed, 27 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index ccb700312d64..9bf54c1044b3 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -1511,32 +1511,41 @@ static const struct platform_device_id s3c64xx_sp=
i_driver_ids[] =3D {
>  };
>
>  static const struct of_device_id s3c64xx_spi_dt_match[] =3D {
> -       { .compatible =3D "samsung,s3c2443-spi",
> -                       .data =3D (void *)&s3c2443_spi_port_config,
> +       {
> +               .compatible =3D "samsung,s3c2443-spi",
> +               .data =3D &s3c2443_spi_port_config,
>         },
> -       { .compatible =3D "samsung,s3c6410-spi",
> -                       .data =3D (void *)&s3c6410_spi_port_config,
> +       {

The braces style is not fixed. Yet that's a style patch, which on one
hand fixes the issue (unnecessary void * cast), but OTOH brings
another issue (non-canonical braces placement). Please see my comments
for your previous submission.

> +               .compatible =3D "samsung,s3c6410-spi",
> +               .data =3D &s3c6410_spi_port_config,
>         },
> -       { .compatible =3D "samsung,s5pv210-spi",
> -                       .data =3D (void *)&s5pv210_spi_port_config,
> +       {
> +               .compatible =3D "samsung,s5pv210-spi",
> +               .data =3D &s5pv210_spi_port_config,
>         },
> -       { .compatible =3D "samsung,exynos4210-spi",
> -                       .data =3D (void *)&exynos4_spi_port_config,
> +       {
> +               .compatible =3D "samsung,exynos4210-spi",
> +               .data =3D &exynos4_spi_port_config,
>         },
> -       { .compatible =3D "samsung,exynos7-spi",
> -                       .data =3D (void *)&exynos7_spi_port_config,
> +       {
> +               .compatible =3D "samsung,exynos7-spi",
> +               .data =3D &exynos7_spi_port_config,
>         },
> -       { .compatible =3D "samsung,exynos5433-spi",
> -                       .data =3D (void *)&exynos5433_spi_port_config,
> +       {
> +               .compatible =3D "samsung,exynos5433-spi",
> +               .data =3D &exynos5433_spi_port_config,
>         },
> -       { .compatible =3D "samsung,exynos850-spi",
> -                       .data =3D (void *)&exynos850_spi_port_config,
> +       {
> +               .compatible =3D "samsung,exynos850-spi",
> +               .data =3D &exynos850_spi_port_config,
>         },
> -       { .compatible =3D "samsung,exynosautov9-spi",
> -                       .data =3D (void *)&exynosautov9_spi_port_config,
> +       {
> +               .compatible =3D "samsung,exynosautov9-spi",
> +               .data =3D &exynosautov9_spi_port_config,
>         },
> -       { .compatible =3D "tesla,fsd-spi",
> -                       .data =3D (void *)&fsd_spi_port_config,
> +       {
> +               .compatible =3D "tesla,fsd-spi",
> +               .data =3D &fsd_spi_port_config,
>         },
>         { },
>  };
> --
> 2.43.0.429.g432eaa2c6b-goog
>

