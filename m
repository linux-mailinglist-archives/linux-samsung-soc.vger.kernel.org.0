Return-Path: <linux-samsung-soc+bounces-1541-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9544184159A
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 29 Jan 2024 23:25:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CB9F282631
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 29 Jan 2024 22:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89D52159599;
	Mon, 29 Jan 2024 22:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SSbb6sj/"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D3D159589
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 22:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706567142; cv=none; b=lkDzjaKsyZkjwREE7C59B0oQ6+qw/C+TJPQPhXC8YGHUQc7daznCyqwigsxM+iqJLaD7zyg7THtQGMzU13mLHV8zxInWIME5cZxg9ut7b9saL6mtq5hijmqRK2dsWsH3pWtVqhzwvQJVm8vBAwyk8oKQYLPr8uijXjABMI1NxMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706567142; c=relaxed/simple;
	bh=9WFxEDtj6oqii1H2ZC+yUNwxmBiIaPxWMCAeynATpXo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sqxr0PTNthFchrYkkyRHX++n0fNMXxAmLppihd/kME4ZP2lu15e8s7kZyD1EH40TFD+h2H1aMZpV2D4Xie/KroM7W8V5xOpHXs+cqycOt2VrI7DC02r86H0L2Q/EFHuy0MBUls9Cv+FBJSyjNwXXemSed+z3d9gm/3kZOj3qH8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SSbb6sj/; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-42a88ad0813so87871cf.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 14:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706567139; x=1707171939; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mdCPUKoIVhBRVBAt+UHLaSJZg2VQOPHD/VbN5Tg7Oc=;
        b=SSbb6sj/sNzQYrd4jl/5aK7V/5YJD0d3HzDooAVqfMbYWfBtRkmxexSVu0IiiA0RoU
         851Gws+eFc/GjQQ4ueSKacGs53mQtUsnj3RZDzi/7pyeJKopRfTbX2FvQjMyzLj8L/HB
         KScw0OsB/I9T5ZQukQyuN4HTVH0ZEySVagWLg8m5Sma8xvNACoGnFoyJ+F7DJeqRNADA
         t+MB9MOWePHJHFaSw2Y0RQdmjyjO19Iv12FcHn0duWXc1glht8EEIio8pyJwvP9vd4hO
         g4kSpkKZqEVCYZkKF0rOG9oLmOGO601aLgwgOS3tJcH/FoE8Qmz2eoHEzBU6VZFowc6U
         2FzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706567139; x=1707171939;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4mdCPUKoIVhBRVBAt+UHLaSJZg2VQOPHD/VbN5Tg7Oc=;
        b=oFGDPFBVpZnWF/QN5LTF8M1xXAeRtGK/1GbMbI6jbIiA/GBbFy+CRT7uMYWMEoP5vi
         LsHvghLRbV8AWVZW1WCZEHr5P8qd1vw9Zp7SQ916jKhB70wqPPeoxih4egbv4C69jbtc
         byIJiud50BdYOSy5kbKIpwkuvo30mNc7WYp6fZtFUzxEnFr0cWQX1c6zOeJsYa2tXOCJ
         Ux9g8fOdorL4WK8oMS9DJzEJp7jMQsASNJLM0sRCeOwGl01+zMS0HYTmbmfrgX08ZQzH
         cDEN7+kO6REf1oJ7xJlGU0QpYxXp1SE/5wDB3uortmSKMq9brnWjZi7JSYWamGTnTwWH
         t3Sw==
X-Gm-Message-State: AOJu0YwH5qHL0yoQ2bsCazbL1vALGVwT2DqMqpcSTillEenpujieLBG/
	SFqmFSkrr02L2cRbFtfMCjyBW4B9KvoPu9uhRkOgfMtulMQM8hh8zvcslibj4ghKisjpp36keEs
	w3y6+rOOeBoNw5GXzH695r73zcVvY4h41MI0a
X-Google-Smtp-Source: AGHT+IEKPLC8FP3KN5kmdAvJzmMvRg7tW3fa6XSk1BQM5ezj9Lc933d0Ukw4+BUisvUPJGQh3OC952raVMhPdnBJjxs=
X-Received: by 2002:ac8:5c43:0:b0:42a:a9c7:271f with SMTP id
 j3-20020ac85c43000000b0042aa9c7271fmr25035qtj.11.1706567139419; Mon, 29 Jan
 2024 14:25:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129211912.3068411-1-peter.griffin@linaro.org> <20240129211912.3068411-3-peter.griffin@linaro.org>
In-Reply-To: <20240129211912.3068411-3-peter.griffin@linaro.org>
From: Saravana Kannan <saravanak@google.com>
Date: Mon, 29 Jan 2024 14:25:03 -0800
Message-ID: <CAGETcx8UsseQAHc76QaMxgMUe7cwajZVdYLA2uwpZxF90RLjJQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle()
 for PMU regs
To: Peter Griffin <peter.griffin@linaro.org>
Cc: arnd@arndb.de, krzysztof.kozlowski@linaro.org, linux@roeck-us.net, 
	wim@linux-watchdog.org, alim.akhtar@samsung.com, jaewon02.kim@samsung.com, 
	semen.protsenko@linaro.org, kernel-team@android.com, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, willmcvicker@google.com, linux-fsd@tesla.com, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 1:19=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> Obtain the PMU regmap using the new API added to exynos-pmu driver rather
> than syscon_regmap_lookup_by_phandle(). As this driver no longer depends
> on mfd syscon remove that header and Kconfig dependency.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  drivers/watchdog/Kconfig       | 1 -
>  drivers/watchdog/s3c2410_wdt.c | 9 +++++----
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 7d22051b15a2..d78fe7137799 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -512,7 +512,6 @@ config S3C2410_WATCHDOG
>         tristate "S3C6410/S5Pv210/Exynos Watchdog"
>         depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE=
_TEST
>         select WATCHDOG_CORE
> -       select MFD_SYSCON if ARCH_EXYNOS
>         help
>           Watchdog timer block in the Samsung S3C64xx, S5Pv210 and Exynos
>           SoCs. This will reboot the system when the timer expires with
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 349d30462c8c..a1e2682c7e57 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -24,9 +24,9 @@
>  #include <linux/slab.h>
>  #include <linux/err.h>
>  #include <linux/of.h>
> -#include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
>  #include <linux/delay.h>
> +#include <linux/soc/samsung/exynos-pmu.h>
>
>  #define S3C2410_WTCON          0x00
>  #define S3C2410_WTDAT          0x04
> @@ -699,11 +699,12 @@ static int s3c2410wdt_probe(struct platform_device =
*pdev)
>                 return ret;
>
>         if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
> -               wdt->pmureg =3D syscon_regmap_lookup_by_phandle(dev->of_n=
ode,
> -                                               "samsung,syscon-phandle")=
;
> +
> +               wdt->pmureg =3D exynos_get_pmu_regmap_by_phandle(dev->of_=
node,
> +                                                "samsung,syscon-phandle"=
);

IIUC, the exynos PMU driver is registering a regmap interface with
regmap framework. So, can't we get the remap from the framework
instead of directly talking to the PMU driver?

-Saravana

>                 if (IS_ERR(wdt->pmureg))
>                         return dev_err_probe(dev, PTR_ERR(wdt->pmureg),
> -                                            "syscon regmap lookup failed=
.\n");
> +                                            "PMU regmap lookup failed.\n=
");
>         }
>
>         wdt_irq =3D platform_get_irq(pdev, 0);
> --
> 2.43.0.429.g432eaa2c6b-goog
>

