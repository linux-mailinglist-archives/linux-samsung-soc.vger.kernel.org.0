Return-Path: <linux-samsung-soc+bounces-3887-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEBC93B9E3
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Jul 2024 02:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F0DC1C21710
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Jul 2024 00:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729934687;
	Thu, 25 Jul 2024 00:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dd5HV44l"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9483D2901
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2024 00:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721868184; cv=none; b=PGsJnMCFFjkeXpGYU86+xhc9BeaMqha+ehMDuOH6ZWPps+EgaJzho12Sf7M0G01tey3p/aKkiyvwXaG5SGf0FqsOXMxX5noO+3KkhVSi3FJwBqnlWC3FZSCFW2ilV4tQqdsUKVVsvVbG6cA00Nvi1RI4B31yOBeLPD+DtFcS4vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721868184; c=relaxed/simple;
	bh=HzbEhyH6CQSKj5F4Dm9OyKDhIk+BLndEJ2P5QSXbuBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zmb2FGmeSlFQbwPjTilZ+vzhYk5fOAkrSAYkBunELgU1/mtjmMbRTzVYcHdBAt/2PUmVp2l7RimWWTrSIjqweki0pKkXivc/JwyFjb0wz5di/zG0UuJZ/WOtbuKKWVY76n+9FHYK9G3R6N1qgpXRxB3XImeWxJQPhJPKwq/1EY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dd5HV44l; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-66498fd4f91so3367237b3.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Jul 2024 17:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721868181; x=1722472981; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B70bSWuCWRs3nWRGRO/RkaDvHlyVjKHulybl7m4sgL4=;
        b=dd5HV44l564U7Hihb1kaYcnLYEHQTqPyb8gZu16LRQ+9n/coOFfdwypTI35FDAzclm
         vtdvjpCWskCvekdhKk6RbEsKJbHD4CVO/EFHdCpDJkea9Qg09tWPD6BqVRsjMxYZY+B9
         05CQ6AJojyJbO8xV/NXtiNOcoqFs3ievtZSUea9DT310aqOePOMowUQWiIy3DgmJlqh6
         kVmNMOKREEVGqLMXtbDZogywiY28kBT6WqoTvaEA4rSQNtF5ZWarJH/P7wEq8yhCUlRa
         5Ou7FFwIAbae5snWpjwVxyz3VVTsl9twTLchTeBhju5s7aJ9eUm+gzoKidvy/Si63K/x
         L2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721868181; x=1722472981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B70bSWuCWRs3nWRGRO/RkaDvHlyVjKHulybl7m4sgL4=;
        b=IlOnIMHZ8sz0+AOsDtkfQHQBHXuUX0I+3XKS/LvmJ9mAbwia/L2TgIGB6k0qtxLO2W
         SGzuInJ6PrZbarFLPxnDeLIPkAZxeJnZn5KXAN18FBavIvw2wbaRw2VpS2nPUAJdfJhF
         Nb4H/hoMtmnb3U41ss5xesonNVXxlq/sSZAD2f5uimZylkoBwiyUXrhr5QQbD3+abv6B
         3rUu2dxoUjV7SQ+4I7Zc4g12/jVSxQS6kQQMOv36FwtJIj4GAxe/I0IdpIoYF0SIp/7u
         cprUHj4C5dxNUUwkYiN/ysfmqoPYCr60RJNkcli5hRTbw3PCbw/gDjc1/ZX75Lun9QNh
         3K9w==
X-Forwarded-Encrypted: i=1; AJvYcCVji3svykV9BxyMDfJB/TgE2TxOMZOXLWlx6UiX6c2EiZc8bkmyqYm0wMQzijgHxAJytlAek+TOmrvgTL+TmjNsHauie96deaOxCVbLXnz0eZo=
X-Gm-Message-State: AOJu0YwY61bdf19BR3JQT1QDKcZd5WDGh+TFI8VbSkAUHjKkuxfIOeZ7
	5As5kf6PqZoYJC4FVAlduBw14QxPjjCg3mCo/WXdMBWpN5YuLbh7ZmMkaPzv51n1iJBGeIHUyVD
	zh+e39nr9iGKm2qPfuXZHCCWVMUVzz6Gvh4eZZA==
X-Google-Smtp-Source: AGHT+IF7TiDuCEDbkwAje2qhS79WnbULiVERVV5UlHJQtoQ73YEMnKzJNC/LRpC29OM5Ud1uZxWCLaC1cLUPPwArDFs=
X-Received: by 2002:a81:7c8a:0:b0:65f:7cee:43b with SMTP id
 00721157ae682-675b4f3e950mr2941187b3.19.1721868181502; Wed, 24 Jul 2024
 17:43:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20240724153056eucas1p193056deacd26701e60519fa0466269f5@eucas1p1.samsung.com>
 <CAPLW+4katjgDUS+e4+iYt+Cz_pKizLFUxqV4KGnbQ5ekAq9Mvw@mail.gmail.com> <20240724153037.914681-1-m.majewski2@samsung.com>
In-Reply-To: <20240724153037.914681-1-m.majewski2@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 24 Jul 2024 19:42:50 -0500
Message-ID: <CAPLW+4mEDJy7hXfQEzLdHuRfTAsRVuHqxh7VC_goR90DVXo3Cg@mail.gmail.com>
Subject: Re: [PATCH 5/6] drivers/thermal/exynos: add initial Exynos 850 support
To: Mateusz Majewski <m.majewski2@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2024 at 10:30=E2=80=AFAM Mateusz Majewski
<m.majewski2@samsung.com> wrote:
>
> > It feels like there is an error for Exynos7 case there. Take a look at
> > this commit:
> >
> >     aef27b658b43 ("thermal: exynos: use sanitize_temp_error() in
> > exynos7_tmu_initialize()")
> >
> > I think that commit just forgets to update the shift value for Exynos7
> > properly. This code:
> >
> >     data->temp_error1 =3D trim_info & tmu_temp_mask;
> >     data->temp_error2 =3D ((trim_info >> EXYNOS_TRIMINFO_85_SHIFT) &
> >                 EXYNOS_TMU_TEMP_MASK);
> >
> > in case of Exynos7 becomes:
> >
> >     data->temp_error1 =3D trim_info & 0x1ff;    // mask =3D 9 bits
> >     data->temp_error2 =3D (trim_info >> 8) & 0xff;
> >
> > it contradicts itself, because it takes 9 rightmost bits for error1,
> > and then uses 1 of those bits for error2 too. It's obvious that if 9
> > bits are already used for error1, then for error2 it has to be shifted
> > by 9 bits, not 8.
> >
> > That's why I think your patch 2/6 is legit and useful on its own, and
> > it's actually a good catch on your part! But the shift value has to be
> > fixed as well (for Exynos7). It's not ideal you don't have the
> > hardware to test it, but it just screams *bug* to me :) Also, maybe we
> > can ask someone who has Exynos7 hardware to test it for us?
>
> I thought about it for a bit and finally realized that Exynos7 only
> supports one point trimming. That is why in that commit, the original
> exynos7_tmu_initialize did not do anything with temp_error2. So
> temp_error2 will never be used in Exynos7. The real "fix" I guess is to
> only calculate temp_error2 if two point trimming is used, which is
> possible with a very small reordering of exynos7_tmu_initialize. But
> then the shift value will never be reachable in Exynos7 anyway. What do
> you think about this? I feel like it's worth it to change the shift
> value just because the code is a bit confusing anyway.

Good catch! Yes, makes total sense to me. I think it's like you said,
would be better to do both:

1. For 1-point trimming architectures: don't calculate error2, to
avoid confusion
2. For 9-bit temp length architectures: always set the shift variable
to 9, again, to avoid confusion and possible bugs

As I see it, the actual reason why that confusion happened in the
first place, is that the data is not really separated from the code in
this driver. Right now exynos_tmu_match[] table contains SOC_ARCH_*
constants for each compatible, and actual features for each platform
are devised in run-time (e.g. in exynos_map_data_data() switch, and
all other places where data->soc is checked). Because of all those
"ifs" the code looks very non-linear, hard to read, bug prone, and may
even reduce the performance. A better approach would be to extract all
possible data into some const structure containing all features for
each platform, and assign that const structure to corresponding .data
for each compatible. Maybe also add .temp_length field containing 8 or
9 accordingly. Having all that done, all the platform features will be
known at compile time and collected in one place, simplifying the
actual driver's code (most of all those ifs and switches will go
away). One example of such approach is drivers/watchdog/s3c2410_wdt.c.
This way the sanitize function could look something like this:

8<-------------------------------------------------------------------------=
------>8
static void sanitize_temp_error(struct exynos_tmu_data *data, u32 trim_info=
)
{
    data->temp_error1 =3D trim_info & data->tmu_temp_mask;
    if (!data->temp_error1 ||
         data->temp_error1 < data->min_efuse_value  ||
         data->temp_error1 > data->max_efuse_value)
             data->temp_error1 =3D data->efuse_value & data->tmu_temp_mask;

    if (data->cal_type =3D=3D ONE_POINT_TRIMMING)
        return;

    data->temp_error2 =3D (trim_info >> data->tmu_temp_shift) &
data->tmu_temp_mask;
    if (!data->temp_error2)
        data->temp_error2 =3D (data->efuse_value >>
data->tmu_temp_shift) & data->tmu_temp_mask;
}
8<-------------------------------------------------------------------------=
------>8

So this data driven approach doesn't leave much space for mistakes.
Anyways, I'm not asking you to do such rework, it's just my
understanding on the cause of such issues.

Thanks!

