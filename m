Return-Path: <linux-samsung-soc+bounces-1765-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D2984BD75
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  6 Feb 2024 19:53:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C80B41C256B6
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  6 Feb 2024 18:53:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F013214AA8;
	Tue,  6 Feb 2024 18:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PPhZ9cdf"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A98317582
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Feb 2024 18:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707245514; cv=none; b=t3TzeyuRBOiubPwipcRNFjMo3uTcH6iqnf1rmOXhd/Xua9A1tsS06R3ZMrAqNgJnsLMz41hFTj0644r5yQfgDKTBa1u0pXTA+4AURQo7LaTqu736jGLFpoD9UiahnOIpTra2kepPi2YfoizN2rw02l+nIIWh0aXA2j/DCAJ9+TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707245514; c=relaxed/simple;
	bh=JKedNxLYUPeuV6d6N4Ss0vZSRqH99w4k2vQHFMt2hIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aBCsAYH1XXxMtDpnmH5u2I08gDSkW1ERddq3w5p6G0khJroLcJqWXPG7qrbi06JwLndp2pZ/bA1zJn3gkb/ilVCKBTyh+sV212G0TR7PQw+7NlFRhVRj/AD1flqopl9qwyA98pk46GdUl9Hs6nqKip+TvGNmW8fc+ulX6eh6zjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PPhZ9cdf; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d944e8f367so47478825ad.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Feb 2024 10:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707245512; x=1707850312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=upVAhSxCpuLV4q4nB8XKEdYeSCkCi/yVGBy6wKv6sKE=;
        b=PPhZ9cdfhwT2Y+oW8oTgCIc+HET0iatPXZgqaMgceDKyePQvp3XgCjSZpzYBBSZltn
         1Bc4YZ06Dt5rqRuT7wePdc2/tEfx/SKVOZBWgHE0iXyi03uXrIwauOjQpoWOST7lgrV4
         hymXtuOhIwqrhcazDrEzUGRd6zaUNSCwmZlZWO+GbaVn4hGg9DySxO7Asywp6NtTwzSM
         hlU6s378bo0hQfAFJio/VtCoqZI/AeEJARq6xjSzdwQbrp+aqwXS7Q7xWDBIY1ajj+XW
         26rgaSu6SOO5IzCqa86RC5gnsuvRBG1oUEvVYRvrg6ZLxPt49bPjYhb8N1Lr6p46Gw/T
         kvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707245512; x=1707850312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=upVAhSxCpuLV4q4nB8XKEdYeSCkCi/yVGBy6wKv6sKE=;
        b=tBf6Zx628xdJDp2U0kff1M9MOH30aszO04EFDv8xLg3q7jwWphTo5P7Ze6Ezqe/TlA
         FSuVTHKGN8hfTH6Jx2yymuPMWNJIDUfZjCVxi5UTQCDSQHiELJ1IpcO4iwHCjL73SpaZ
         VLtnQbFhjBn7M9gzjAY9gKtHLgRxHljTv9zCnk1sreBQXzqmmxMoJ0sRy9cJw8QbIVfz
         pHfuTCIiINkdvi4YYvaFl3q/z+5/b4is5+fF64BSOcePgIeO+jgzaHHNBzkrwgdyAGGJ
         WkfeVpj8/A4VOFcqwpzTbP/+yVTSaJLjNhcBDKPHatWsvcDlANftR/Ikt8gDx8bAs0zP
         jIQA==
X-Gm-Message-State: AOJu0YzH48YskvyM+PkTFTthc/pmwUpbKVS9XDbuV9GpB73GeYv6FY3S
	FY3BnhN5F+w3WxhhwqXZu3easaiMCIDHMWmc3ghkgRN4lApvRilWbB+1XDaYFC2+uFIPPxT46EO
	UVS/cRRXxTDtPvFGRmOq3uFNxiZGkP0ZcbRm75bNR2huOKMbf
X-Google-Smtp-Source: AGHT+IHLQyz9IUZupWGJFMJcHq3CqerZoN5I3UqV6C7l7Xn6TPhgD35kWtOrF84c+FloROk7xIRd36OqR22RqgWfRcE=
X-Received: by 2002:a17:902:780e:b0:1d9:8770:a359 with SMTP id
 p14-20020a170902780e00b001d98770a359mr2038623pll.40.1707245512419; Tue, 06
 Feb 2024 10:51:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206085238.1208256-1-tudor.ambarus@linaro.org> <20240206085238.1208256-5-tudor.ambarus@linaro.org>
In-Reply-To: <20240206085238.1208256-5-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 6 Feb 2024 12:51:41 -0600
Message-ID: <CAPLW+4m2qhayzzWBSc-Qq2zuYZCp6N30UfkBM9Cf7sip36KrYQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] spi: s3c64xx: add support for google,gs101-spi
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: broonie@kernel.org, andi.shyti@kernel.org, krzysztof.kozlowski@linaro.org, 
	alim.akhtar@samsung.com, linux-spi@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	robh+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 2:52=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro.=
org> wrote:
>
> Add support for GS101 SPI. GS101 integrates 16 SPI nodes, all with 64
> bytes FIFOs. GS101 allows just 32 bit register accesses, otherwise a
> Serror Interrupt is raised. Do the write reg accesses in 32 bits.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/spi/spi-s3c64xx.c | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index cb45ad615f3d..9ad0d513fb30 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -19,7 +19,7 @@
>  #include <linux/spi/spi.h>
>  #include <linux/types.h>
>
> -#define MAX_SPI_PORTS          12
> +#define MAX_SPI_PORTS          16
>  #define S3C64XX_SPI_QUIRK_CS_AUTO      (1 << 1)
>  #define AUTOSUSPEND_TIMEOUT    2000
>
> @@ -1538,6 +1538,19 @@ static const struct s3c64xx_spi_port_config fsd_sp=
i_port_config =3D {
>         .quirks         =3D S3C64XX_SPI_QUIRK_CS_AUTO,
>  };
>
> +static const struct s3c64xx_spi_port_config gs101_spi_port_config =3D {
> +       .fifo_lvl_mask  =3D { 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0=
x7f,
> +                           0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7f, 0x7=
f},
> +       .rx_lvl_offset  =3D 15,
> +       .tx_st_done     =3D 25,
> +       .clk_div        =3D 4,
> +       .high_speed     =3D true,
> +       .clk_from_cmu   =3D true,
> +       .has_loopback   =3D true,
> +       .use_32bit_io   =3D true,
> +       .quirks         =3D S3C64XX_SPI_QUIRK_CS_AUTO,
> +};
> +
>  static const struct platform_device_id s3c64xx_spi_driver_ids[] =3D {
>         {
>                 .name           =3D "s3c2443-spi",
> @@ -1550,6 +1563,9 @@ static const struct platform_device_id s3c64xx_spi_=
driver_ids[] =3D {
>  };
>
>  static const struct of_device_id s3c64xx_spi_dt_match[] =3D {
> +       { .compatible =3D "google,gs101-spi",
> +                       .data =3D &gs101_spi_port_config,
> +       },
>         { .compatible =3D "samsung,s3c2443-spi",
>                         .data =3D &s3c2443_spi_port_config,
>         },
> --
> 2.43.0.594.gd9cf4e227d-goog
>

