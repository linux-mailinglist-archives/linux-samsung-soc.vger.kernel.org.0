Return-Path: <linux-samsung-soc+bounces-5179-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA5D9B5312
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 29 Oct 2024 21:07:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 516452844D0
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 29 Oct 2024 20:07:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D85242076CA;
	Tue, 29 Oct 2024 20:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xOv5ykXX"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6932076C2
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Oct 2024 20:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730232456; cv=none; b=DrC26tpwECTEfCEmne1vdO6BkYG4T4W3VI1dMg8C2mIK0pHMJHhftIASPKOhoUNmhEQ1eapsBYJliKX71qJ3p66Y9zpuRZdOzgpC1aNSrYbCDOPnTvYPEyo09QNm8MA3ZbVTRdpuRAwR/CNW92AU/R0bnjyjn03lAWrZZq/WqAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730232456; c=relaxed/simple;
	bh=Lj1XuZ6x9ZfE2p1notsLVNoSBLlatTqF/B6j/Kn7spw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YL1MmPxlmIVuqwp1IdACfx2SWQB3vulWEGtMs5MWiRhJDiBL0xinN602RsaawFDzLYabToayyIH43KK2qKk9YhktLG75Fz5hKCdnZBbX87iG4hU2UWa/xNSTHzBLu97QLHOWhFn2XggSkJr/+zNlQqWqJB1hcks6SJdV9cNdlwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xOv5ykXX; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e290d5f83bcso6077430276.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Oct 2024 13:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730232454; x=1730837254; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02fVgYCHwHYWz9XJLOuShixyFS6jMl+g475mqm/khNw=;
        b=xOv5ykXXazUYxxNGQOHx0raUwqJD2CA+ZWDrpB+CJang3fNIgQZJWi21RLLP4O7CwL
         ooaH8QwLe4/nutWWRvJ0aq5GJRstVUv9H6yUK4OIEDxFvhl/eLlxkaqDNrnrqV5AoIN6
         wlsxcGXLsRfhYmaUU2R85GV1gOutoDFBzdqCJEDTZYZ2OcWFa8IobYPusSUAAujeExvg
         TZDRxnS++PdZ3JRbSIFM+9odxV8NIInVPNDlbLuMn9Wd0fsqkr2PWSCvOugDIrHN6eWm
         rLr3C8b9JskVxJCDxH4mEDIW4KbmxvQp0Qo/nEYCNIlwwuQhk4KMz3W0HRMITdUOUeM9
         apHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730232454; x=1730837254;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=02fVgYCHwHYWz9XJLOuShixyFS6jMl+g475mqm/khNw=;
        b=NFkbNx0MFzz/ldPWodHLMgVtxGTd0uVo5TYQBnk8G0CyuQaOAeX1Z88G/vEW/8oMyp
         f6jB5U9tIHeWQ37sHmyrqYFhftXQuJa0jYBNAF89/ddwqt8Lv4Yg1TOwAvOMKVgi5VUx
         TWYeQ45rnAdNX4NA6ZrORq/XSNrlQG5X+ZwwsDRa7kG1GpwVXPNvyLYI2Ft9FR/pPlaV
         0GMrZZR6c9FZu8UdERifzQq1qK+I0OVTS8nXNtP6aYmlIf/kZp07rjROh9ZbuaBazRQM
         b1b7bDm740vESRywZn4zLjPF/DIwAexvASf8WvF5H6WA04HjXhqFFnwFMpL7zAjAJZ4c
         OgIQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0U9ZK+0fwmn1kwUFLSAOZh9PfiJy6qkCbrZPmOKPkTsxnQ+SvLVwUX1I73ZU38N5inMXJkQnu7A4CjuEYxp+WdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyU4sRwiC03BjHsoo2LfGhPgtY9iIoOLz9ebqbiGyYN8gb2Q14B
	3khT42D7AcjocBmr3OULGnDnXndg/6N5ecMpLVdCW0LCRqz1H5IsUDmSfPtVqBsA9kijOpAdEZx
	kX7c0lST1iDodsXseKVw9ppfceS54S75iwRjZaA==
X-Google-Smtp-Source: AGHT+IE6yjevMKWWK5dEWcL+udZz549JMdzzGNgSsO5RyF7/i8ZbdZi84RS0NDlaugK3ZRmt6j5woCgLHpdcq7icNZM=
X-Received: by 2002:a05:6902:161d:b0:e29:c45:9272 with SMTP id
 3f1490d57ef6-e3087a4ca3fmr11835983276.9.1730232453728; Tue, 29 Oct 2024
 13:07:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241029191131.2329414-1-peter.griffin@linaro.org>
In-Reply-To: <20241029191131.2329414-1-peter.griffin@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Tue, 29 Oct 2024 15:07:23 -0500
Message-ID: <CAPLW+4=jK63MFCRuhDkT2RH-J6dYsd0qHf_f1EeWTdrGqGLn=A@mail.gmail.com>
Subject: Re: [PATCH] Revert "watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle()
 for PMU regs"
To: Peter Griffin <peter.griffin@linaro.org>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, krzk@kernel.org, 
	alim.akhtar@samsung.com, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 29, 2024 at 2:11=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:
>
> This reverts commit 746f0770f916e6c48e422d6a34e67eae16707f0e.
>
> Now that we can register a SoC specific regmap with syscon using
> of_syscon_register_regmap() api we can switch back to using
> syscon_regmap_lookup_by_phandle() in the client drivers.
>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/watchdog/Kconfig       | 1 +
>  drivers/watchdog/s3c2410_wdt.c | 8 ++++----
>  2 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index 684b9fe84fff..f3cd402e5795 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -549,6 +549,7 @@ config S3C2410_WATCHDOG
>         tristate "S3C6410/S5Pv210/Exynos Watchdog"
>         depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE=
_TEST
>         select WATCHDOG_CORE
> +       select MFD_SYSCON if ARCH_EXYNOS
>         help
>           Watchdog timer block in the Samsung S3C64xx, S5Pv210 and Exynos
>           SoCs. This will reboot the system when the timer expires with
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 686cf544d0ae..349d30462c8c 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -24,9 +24,9 @@
>  #include <linux/slab.h>
>  #include <linux/err.h>
>  #include <linux/of.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
>  #include <linux/delay.h>
> -#include <linux/soc/samsung/exynos-pmu.h>
>
>  #define S3C2410_WTCON          0x00
>  #define S3C2410_WTDAT          0x04
> @@ -699,11 +699,11 @@ static int s3c2410wdt_probe(struct platform_device =
*pdev)
>                 return ret;
>
>         if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
> -               wdt->pmureg =3D exynos_get_pmu_regmap_by_phandle(dev->of_=
node,
> -                                                "samsung,syscon-phandle"=
);
> +               wdt->pmureg =3D syscon_regmap_lookup_by_phandle(dev->of_n=
ode,
> +                                               "samsung,syscon-phandle")=
;
>                 if (IS_ERR(wdt->pmureg))
>                         return dev_err_probe(dev, PTR_ERR(wdt->pmureg),
> -                                            "PMU regmap lookup failed.\n=
");
> +                                            "syscon regmap lookup failed=
.\n");
>         }
>
>         wdt_irq =3D platform_get_irq(pdev, 0);
> --
> 2.47.0.163.g1226f6d8fa-goog
>
>

