Return-Path: <linux-samsung-soc+bounces-1788-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7BB84C9CF
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Feb 2024 12:43:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E65C1C25E31
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Feb 2024 11:43:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1F41B275;
	Wed,  7 Feb 2024 11:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QOzWSE12"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23928250F2
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 11:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707306138; cv=none; b=kmU77IDcL2BQnZcXpLLZN68G4NA//hw1J9cBtJgR+it8+fIQ9H9z2ULH+yiO8c7ke8YEZ9w91mvS2myCDHUJMP7Ub+vjOWtmdiCXBVmu/F9lLZ/hSJLlU0kHuTSlVQupvFbJDVhtxyYMsUDGpihbucjQjmq+tDXZHNBjWb0VlSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707306138; c=relaxed/simple;
	bh=yXMP0S/lszIS82Cm3HVooHmFHezs5svv3J4mLhiJ6Bk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AiY8fZBVZTv1ySBDlSAoaqMlnr1N9jo5OXfkDTwGtblDYt6igUcwSgeO9i/wu3U9rD+l8D9p1fwMflU4lmx7SKhqdjiV9dvKuQo3k4xUfI2IAAWJBJ7qCwrk4nfaxP1H8p7hMaP+R9IB6dl+mzw6f6FRiGoO0Yr0eaYiH0yXqGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QOzWSE12; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-46d336f8081so94082137.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Feb 2024 03:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707306135; x=1707910935; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mDRI0QBrap0H2clNIo68wfgCeGsVyFFKlUnFyl+O8Oc=;
        b=QOzWSE12voIqeyO/a4pMbo0EmmfnQqAspa+MUnvkSVl+eNCu2cmoD8nK7SmRAOeu5M
         Wd/3Q3bw6x1Xrv3+Bx/Y/vCNzYzY9WmY3PSEMMT5HfAaqZ8/SzNpVIuQn87AgG30jmao
         egXjdJ2khLyXeF1uWiZ7uZ/OG+5Z8wsYHSG7h6IJTPQyHFH+gGKmlCLll+L+s+EUTG/u
         Xw/j0rD8mOY4bedHwxgHChVyHRyyTBrrIKGg5uUyg3ySs1FKHO87H20Lxt/ERqCw/0iR
         F0Flv+syVxiBX57frV5ItsLgcm92k9FvEY2F9wTAebJBGAapg/Krl1PjpiVeTRjlZWnw
         KVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707306135; x=1707910935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mDRI0QBrap0H2clNIo68wfgCeGsVyFFKlUnFyl+O8Oc=;
        b=PeMrBI7ZSHgbXW59Abon45LSNLHr9wg7Y5bpDs9a/OiKHq1rH+3QQHxas369nocCNt
         xhvhNsReaxK3Hjd/Hb7pYsnfjRIwUdwfEhhdPuwfRG2AGAhGjFcjngKzjpnc2z5NFb0m
         S964ipGaevxmS1dbjvzADbvU0L7qYh9Vpo92+X/t6VyIarkB4CapjLYPGiN7YX3/8E3s
         fnBNW5obO3kH2guk9YNHTv32LPcRVs3hHUUOASC8lSWoS42dmXmmAbhd/8ekZvIrTaR/
         Bs7IRfJRakF3roMZXPF88h8E9itGz7qFe/AYLmtC5EEI/X/c81YX80N/bygIzH0zZ9Ty
         hspw==
X-Gm-Message-State: AOJu0YxfunqI/S6q12oEEPQbTemkR5isLlPUFez+RZVGCMKAmlNrVUzI
	peCcPdI5Ws4VGhDZZlpP5W2smdmMuf2rCM73kPtHW0h0IC7UlHw+aOk0FxtjfFb00knLnI/+Iay
	LWp/IGNiPuU+CN0sQg+/pkgVT3PBavFFke/MKXw==
X-Google-Smtp-Source: AGHT+IHoMW8WW+GpljHTnzFyz3kSgmn7XI5t1uaHPVo5k3VCt1621bR0+WnHEryNiztIQSbbTGgK2JIA0gGHVkMneKQ=
X-Received: by 2002:a05:6102:3231:b0:46d:1c65:bc13 with SMTP id
 x17-20020a056102323100b0046d1c65bc13mr2322228vsf.24.1707306134913; Wed, 07
 Feb 2024 03:42:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240129211912.3068411-1-peter.griffin@linaro.org>
 <20240129211912.3068411-2-peter.griffin@linaro.org> <fb530eb8-e32b-4faf-81f3-efc334ebf241@linaro.org>
 <CADrjBPoQmTRsFYRtxBxdvAoKK816O8XN3=hOJ3vBt8wbbbk-=Q@mail.gmail.com> <99828589-c0b5-456d-b250-6ad3e6085a91@linaro.org>
In-Reply-To: <99828589-c0b5-456d-b250-6ad3e6085a91@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 7 Feb 2024 11:42:03 +0000
Message-ID: <CADrjBPrWH8uFrFmn_CZpr+fAnPrzbDT4i9XuMXJqKfzeouPpKg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] soc: samsung: exynos-pmu: Add regmap support for
 SoCs that protect PMU regs
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: arnd@arndb.de, linux@roeck-us.net, wim@linux-watchdog.org, 
	alim.akhtar@samsung.com, jaewon02.kim@samsung.com, semen.protsenko@linaro.org, 
	kernel-team@android.com, tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, linux-fsd@tesla.com, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for your review feedback.

On Mon, 5 Feb 2024 at 13:13, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 01/02/2024 13:51, Peter Griffin wrote:
> > Hi Krzysztof,
> >
> > On Tue, 30 Jan 2024 at 16:01, Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 29/01/2024 22:19, Peter Griffin wrote:
> >>> Some Exynos based SoCs like Tensor gs101 protect the PMU registers for
> >>> security hardening reasons so that they are only accessible in el3 via an
> >>> SMC call.
> >>>
> >>> As most Exynos drivers that need to write PMU registers currently obtain a
> >>> regmap via syscon (phys, pinctrl, watchdog). Support for the above usecase
> >>> is implemented in this driver using a custom regmap similar to syscon to
> >>> handle the SMC call. Platforms that don't secure PMU registers, get a mmio
> >>> regmap like before. As regmaps abstract out the underlying register access
> >>> changes to the leaf drivers are minimal.
> >>>
> >>> A new API exynos_get_pmu_regmap_by_phandle() is provided for leaf drivers
> >>> that currently use syscon_regmap_lookup_by_phandle(). This also handles
> >>> deferred probing.
> >>>
> >>> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> >>> ---
> >>>  drivers/soc/samsung/exynos-pmu.c       | 227 ++++++++++++++++++++++++-
> >>>  include/linux/soc/samsung/exynos-pmu.h |  10 ++
> >>>  2 files changed, 236 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
> >>> index 250537d7cfd6..7bcc144e53a2 100644
> >>> --- a/drivers/soc/samsung/exynos-pmu.c
> >>> +++ b/drivers/soc/samsung/exynos-pmu.c
> >>> @@ -5,6 +5,7 @@
> >>>  //
> >>>  // Exynos - CPU PMU(Power Management Unit) support
> >>>
> >>> +#include <linux/arm-smccc.h>
> >>>  #include <linux/of.h>
> >>>  #include <linux/of_address.h>
> >>>  #include <linux/mfd/core.h>
> >>> @@ -12,20 +13,159 @@
> >>>  #include <linux/of_platform.h>
> >>>  #include <linux/platform_device.h>
> >>>  #include <linux/delay.h>
> >>> +#include <linux/regmap.h>
> >>>
> >>>  #include <linux/soc/samsung/exynos-regs-pmu.h>
> >>>  #include <linux/soc/samsung/exynos-pmu.h>
> >>>
> >>>  #include "exynos-pmu.h"
> >>>
> >>> +static struct platform_driver exynos_pmu_driver;
> >>
> >> I don't understand why do you need it. You can have only one
> >> pmu_context. The moment you probe second one, previous becomes invalid.
> >>
> >> I guess you want to parse phandle and check if just in case if it points
> >> to the right device, but still the original code is not ready for two
> >> PMU devices. I say either this problem should be solved entirely,
> >> allowing two devices, or just compare device node from phandle with
> >> device node of exynos_pmu_context->dev and return -EINVAL on mismatches.
> >
> > Apologies I didn't answer your original question. This wasn't about
> > having partial support for multiple pmu devices. It is being used by
> > driver_find_device_by_of_node() in exynos_get_pmu_regmap_by_phandle()
> > to determine that the exynos-pmu device has probed and therefore a
> > pmu_context exists and a regmap has been created and can be returned
> > to the caller (as opposed to doing a -EPROBE_DEFER).
> >
> > Is there some better/other API you recommend for this purpose? Just
> > checking pmu_context directly seems racy, so I don't think we should
> > do that.
>
> Hm, I don't quite get why you cannot use of_find_device_by_node()?

of_find_device_by_node() returns a platform_device, even if the driver
hasn't probed. Whereas driver_find_device_by_of_node() iterates
devices bound to a driver.

If using of_find_device_by_node() API I could check the result of
platform_get_drvdata(), and -EPROBE_DEFER if NULL (that pattern seems
to be used by a few drivers). But that AFAIK only guarantees you
reached the platform_set_drvdata() call in your driver probe()
function, not that it has completed.

IMHO the drivers using driver_find_device_by_of_node() for probe
deferral are doing it more robustly than those using
of_find_device_by_node()  and checking if platform_get_drvdata() is
NULL.

Or is there some other way you had in mind of using
of_find_device_by_node() I've not thought of to implement this?

Thanks,

Peter.

