Return-Path: <linux-samsung-soc+bounces-1329-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F25283CDA6
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Jan 2024 21:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B79F9B249FF
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Jan 2024 20:40:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F61E13A260;
	Thu, 25 Jan 2024 20:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Br6/qOxU"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E421386C4
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 20:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706215171; cv=none; b=TSxZMzsHd3NYPiuKgg3P3IQKvFZq/kFCx9rsvlYs+Gj7jsRQpsGwtMjZ/N2EigHM1drkuh9jyLgdhvouxP524PAcAMsgIqzUmR4Aohr5qQZHCVZ6+8kM+PZME7A5Vuw3qFhPUvTwNgRJTg2PjD3T/347bXDEI0buQaWLitliSjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706215171; c=relaxed/simple;
	bh=s+CNI3JNLu1nvooJuC97JZqUR+3i4Ph90d+KSlvbReM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pg9+8rQojV6KeJ6LBWxRoWVpI2nt9K+V8bNtXdSat0IfyYUiorVCBqhO5ZPNB8g4oNrZXzbRCWUxRRkg/utiVaDb6kglwK/DD3kOQUGdkEbzycAUqf1/FI0lKC5SL9XuuZsuCLKu6TguE6ymKqT4G8qhSty/MeVGEzPJ3ghr2W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Br6/qOxU; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1d750660a0aso26815125ad.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 12:39:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706215168; x=1706819968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pWX0tSnXNQU7YWMSUAdn8nRIoliP+SCtS9aBuv4yuU=;
        b=Br6/qOxUQF68MgLQc8X82Oaru4wWL98zhkLqH8Db5LCtWzjge2qJUyO/WTRcbeMbUs
         MhAjTmCiu0QCvWlYrbV4UjuVbzz4NcOQCncGYGiXg7ZEfCkhvX7Y1ikXItVHOwrSrSjX
         a279+fyyGjGbaplYviAxIgAC6E32nvlJ1JdNicVuwu5WQpPurC/jkfcUnpQTq/kMJcLZ
         1x4icKa5HgsHVcnglWHUGfIrX+4u+/G2tTHhTL8HN/csFGP3DnzrTJYXPXhLrbyCcONU
         HOerzGEHzfeOaiQ1YSSlWvJLdD9FhOInlQKzxHQ4g23zVNO4rhqzzbC5gbS0GA9pQXD/
         RI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706215168; x=1706819968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3pWX0tSnXNQU7YWMSUAdn8nRIoliP+SCtS9aBuv4yuU=;
        b=d6g5iNeIYrk3xbQy3E9no1fdyLCGkZmbWNXn3GNe93UUEaYPvmaWGFrGa/5vWupjyQ
         iq/8v5GIKS/iz186lb32jNxrV0KdrTPd8AdnFaOUc9cr0kC7mKnXI/9O+c7fHgYVel9H
         eZvxE7GRdrxi/9aIaeH6fJlVXNJrTD8CNqQGOica7tr2GlXFEluviFOYCsnQQoAeqVcx
         khuA8LmCBN5bGCcxb1GwB1UlxlqTqFchL6HrrHzRfJCIgzRpxlxYrOChIsBfhFrYm/QR
         CUQlFq2t+REs0OEa1b1scpGDtJM6WXdriO6FiCI3UC1Cde38kVwcOXnsQZEbLPngtzOJ
         nNBg==
X-Gm-Message-State: AOJu0YyYfGiFr6tus2MhYhEs1NDmJblhnzQ305qwRLseVmaTcePcoW6l
	rPaxZaAzP+dKrCLwd1idUknkeB5CwgKpiGwjERXmvnkRLvaCzKUqwSGtgEHOJJwqm4zycjaC2d+
	SoeWjHJ5wnYKti8J3C22+9An6XMvdQ/TnGNs+VA==
X-Google-Smtp-Source: AGHT+IFPK/mTXKZ4TYJQATnWWTb210gdrST8EgunUaaJK06mOLnEAcaZx6WF8FyEJa+mMK8KOk2avzvj3s1vIgtsrfc=
X-Received: by 2002:a17:902:b418:b0:1d7:91:4f9e with SMTP id
 x24-20020a170902b41800b001d700914f9emr316650plr.96.1706215168423; Thu, 25 Jan
 2024 12:39:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125145007.748295-1-tudor.ambarus@linaro.org> <20240125145007.748295-19-tudor.ambarus@linaro.org>
In-Reply-To: <20240125145007.748295-19-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 25 Jan 2024 14:39:17 -0600
Message-ID: <CAPLW+4kGTCt8cHqTzNqGZoUqw68PY3AUeZ7SzTJ6jj2im6DSGg@mail.gmail.com>
Subject: Re: [PATCH v2 18/28] spi: s3c64xx: fix typo, s/configuartion/configuration
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: broonie@kernel.org, andi.shyti@kernel.org, arnd@arndb.de, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, linux-spi@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arch@vger.kernel.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 8:50=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> Fix typo, s/configuartion/configuration.
>
> Fixes: 6b8d1e4739f4 ("spi: spi-s3c64xx: Add missing entries for structs '=
s3c64xx_spi_dma_data' and 's3c64xx_spi_dma_data'")
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/spi/spi-s3c64xx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index bb6d9bf390a8..692ccb7828f8 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -174,7 +174,7 @@ struct s3c64xx_spi_port_config {
>   * @cur_speed: Current clock speed
>   * @rx_dma: Local receive DMA data (e.g. chan and direction)
>   * @tx_dma: Local transmit DMA data (e.g. chan and direction)
> - * @port_conf: Local SPI port configuartion data
> + * @port_conf: Local SPI port configuration data
>   * @port_id: Port identification number
>   */
>  struct s3c64xx_spi_driver_data {
> --
> 2.43.0.429.g432eaa2c6b-goog
>

