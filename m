Return-Path: <linux-samsung-soc+bounces-1384-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E4783E2F6
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 26 Jan 2024 20:55:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2FB42870CA
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 26 Jan 2024 19:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B147B2263A;
	Fri, 26 Jan 2024 19:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ul4jqA5V"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0F51DA24
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 19:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706298930; cv=none; b=Vhx8tMhcZbIZlFI2T7LENGEIYj1OA0JYUcyJABADPxwZydwn16PtTbjDtT7gPmdXG7i3CIjxN2nsAuhVUf6YL1ZwBCqDxP1CcR2JxJQUzeozPJVc9aCMVtS+VblZqZ71yEDgKqpsGECfXyW+Jy1+4Y0K5erBjOaTsH6xiOKcVuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706298930; c=relaxed/simple;
	bh=2+Mnpq5M1TmHpvvq2JcoFPCJIYA7dRmmpp/zPWcspWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fCFwByPIkNI/kElmErPXIKepKUkXL2DXzrVByrYT6WuuddMd8AA3/0WVd9HVD93oydImS/tolHTrDHhJqFSOlHFFjlNZ5ZGHcfuBEmZY9k5UvKhzNqoGI9hMLk8T3X8tX9U4goG54g35Y+Pto5JqaEFz3qJD46/sF/RUtqGCgSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ul4jqA5V; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6de0ba30994so266908b3a.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 11:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706298927; x=1706903727; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgVLV7ILUXV6plhvsfHg8kvJr4geR1tUsOVTbhlRqhA=;
        b=ul4jqA5VKXVzz3OqTLPrOeH7mrci/D2KSN8egU6d/xxxlSDYcQyz+ifj9kjnPxPNq+
         UcQQzEIGrYQnYuV0McIaSvysZ05Qp3vSLqM9y2LKQJP/QLkF1hGW8qeWofHihBIpPPcz
         gCQb2Z2QLQ+UMUCcaD3UCfneB7VNSbZBBUaezcMCMFsaMDB46sJuo9Y/NAckMosbe39t
         fXl4u3aqv+svlYaE2atw4XSo1cpGfQDKTx9u8rbDaOFinaujEj9SbXds6MlQC1NLnhKD
         WeuEHWGDKAIFvr4F81zX/SY0jtODhfJA0tzCtTHj0pZZZyaLJnftpV+PZwFiGNy2bYVA
         Un7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706298927; x=1706903727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgVLV7ILUXV6plhvsfHg8kvJr4geR1tUsOVTbhlRqhA=;
        b=NdgAD9E5ksElS+eyFPzwxK5hrMjthpjf7W8dpBHyCj1l1XQeO8Drz7wKoUbuEPOHUE
         jSNcHIAG2Q3wSFc9s372ZT2mXtXWVpkEh9oi25+2iBOcj7/bDOfl7jFUAkr4oxfRcokK
         Cks0qWMCNAWOVxV22xcrDCpi/1rFCHw/4yjazLOS0wElnhkDwznahrfx1iKAaO+FgePj
         wK2XSRMlg3YdqZ+RkV57VhLxXSaaV+b+jO/KxThb1r9wAl+3NSCjSC/xK0N0upRYv02r
         lDA7smtie0SQwoHVeBE7MYSpLWpOKZzQbpKAwdP0frWTLir+AUJWcIxVlC9Nfna6G8S4
         OMiQ==
X-Gm-Message-State: AOJu0YxOVYEv3TezhM7mpW7XIEg209Gn0PpW4eP+kOLcJ9OinAPt7dn3
	RylOuN+sLdeMy5s22/g5jUyfB/+Zn2yk+ksNBynyrxsm01RkFGDdp7TAay3+IRu+2/zhi2F4v8g
	biRUxQMpbgQaxnp7P8F0H8rttmAyrJ2iKMEBijg==
X-Google-Smtp-Source: AGHT+IF4iydsZkMvpCgm0ty66tZIGvdesf18VuJVzD0djZrB1NCToxAc0H5npBMQOmf+WXehhv2hYW+e9IaFx1r7kjM=
X-Received: by 2002:a05:6a00:1d8e:b0:6db:c5fe:df39 with SMTP id
 z14-20020a056a001d8e00b006dbc5fedf39mr443978pfw.31.1706298927034; Fri, 26 Jan
 2024 11:55:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125145007.748295-1-tudor.ambarus@linaro.org>
 <20240125145007.748295-10-tudor.ambarus@linaro.org> <CAPLW+4mDM2aJdPwPRKt9yLtwx5zEHwBr6OSyYbGgZU7w9OiYkg@mail.gmail.com>
 <ee4107c3-1141-45ab-874c-03474d8ec18d@linaro.org>
In-Reply-To: <ee4107c3-1141-45ab-874c-03474d8ec18d@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Fri, 26 Jan 2024 13:55:15 -0600
Message-ID: <CAPLW+4=pM=gY1bypGNhKmcftLFHWBMUZ7=JitMj_3TaxLF672A@mail.gmail.com>
Subject: Re: [PATCH v2 09/28] spi: s3c64xx: use bitfield access macros
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, andi.shyti@kernel.org, arnd@arndb.de, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, linux-spi@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arch@vger.kernel.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 2:49=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
>
>
> On 1/25/24 19:50, Sam Protsenko wrote:
> > On Thu, Jan 25, 2024 at 8:50=E2=80=AFAM Tudor Ambarus <tudor.ambarus@li=
naro.org> wrote:
> >>
> >> Use the bitfield access macros in order to clean and to make the drive=
r
> >> easier to read.
> >>
> >> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> >> ---
> >>  drivers/spi/spi-s3c64xx.c | 196 +++++++++++++++++++------------------=
-
> >>  1 file changed, 99 insertions(+), 97 deletions(-)
> >>
> >> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> >> index 1e44b24f6401..d046810da51f 100644
> >> --- a/drivers/spi/spi-s3c64xx.c
> >> +++ b/drivers/spi/spi-s3c64xx.c
> >> @@ -4,6 +4,7 @@
>
> cut
>
> >> +#define S3C64XX_SPI_PSR_MASK                   GENMASK(15, 0)
> >
> > But it was 0xff (7:0) originally, and here you extend it up to 15:0.
>
> this is a bug from my side, I'll fix it, thanks!
>
> cut
>
> >>         default:
> >> -               val |=3D S3C64XX_SPI_MODE_BUS_TSZ_BYTE;
> >> -               val |=3D S3C64XX_SPI_MODE_CH_TSZ_BYTE;
> >> +               val |=3D FIELD_PREP(S3C64XX_SPI_MODE_BUS_TSZ_MASK,
> >> +                                 S3C64XX_SPI_MODE_BUS_TSZ_BYTE) |
> >> +                      FIELD_PREP(S3C64XX_SPI_MODE_CH_TSZ_MASK,
> >> +                                 S3C64XX_SPI_MODE_CH_TSZ_BYTE);
> >
> > I don't know. Maybe it's me, but using this FIELD_PREP() macro seems
> > to only making the code harder to read. At least in cases like this. I
> > would vote against its usage, to keep the code compact and easy to
> > read.
>
> I saw Andi complained about this too, maybe Mark can chime in.
>
> To me this is not a matter of taste, it's how it should be done. In this

Sure. But if you think it has to be done, I suggest it's done taking
next things into the account:
  1. It shouldn't make code harder to read
  2. Preferably stick to canonical ways of doing things
  3. IMHO patches like this *must* be tested thoroughly on different
boards with different test-cases, to make sure there are no
regressions. Because the benefits of cleanups are not that great, as I
see it, but we are risking to break some hardware/software combination
unintentionally while doing those cleanups. It's a good idea to
describe how it was tested in commit message or PATCH #0. Just my
$.02.

For (1) and (2): I noticed a lot of drivers are carrying additional
helper functions for read/write operations, to keep things tidy and
functional at the same time. Another mechanism that comes into mind is
regmap, though I'm not sure if it's needed for such low-level entities
as bus drivers. Also I think Andi has a point about FIELD_PREP and how
that can be handled.

> particular case you have more lines when using FIELD_PREP because the
> mask starts from bit 0. If the mask ever changes for new IPs then you'd
> have to hack the code, whereas if using FIELD_PREP you just have to
> update the mask field, something like:
>
>         FIELD_PREP(drv_prv_data->whatever_reg.field_mask,
>                    S3C64XX_SPI_MODE_CH_TSZ_BYTE);
>
> Thus it makes the code generic and more friendly for new IP additions.
> And I have to admit I like it better too. I know from the start that
> we're dealing with register fields and not some internal driver mask.

