Return-Path: <linux-samsung-soc+bounces-8944-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08616AE7002
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 24 Jun 2025 21:45:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 34AD117C2B7
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 24 Jun 2025 19:45:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 732A72E92C1;
	Tue, 24 Jun 2025 19:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YuweBf/D"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3514B2E88B6
	for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2025 19:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794245; cv=none; b=Je+6Cf57jxJ3Zpmm+14R1CtHyZfwRGkJEm+9pO8j4COohAeVBmRWON61ZdxtaluXfehdOZkrONwpLljxQc9Yo0DefDY/QLGIFIGY7kY+CgegXT1niQFkhcIfhXV5IWgDmSfj6du+d4MFjlbAnJCH/+vd6w6+j6mznC3jWozIpx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794245; c=relaxed/simple;
	bh=mEEqXQPzSi/2DYZkyERnStSQgx8nwqj2N53hxm8wTV8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gRUw/2B0S8jo1B/sVarvXmxRJQYigmgKVzG2fCPwhTKKlIATlbMnOxPZ4zXz8wkv7XGOXIfhFfqvSZ+EoWJNaBoHjfIU1czhpwPD8gxJVSuHb/NHDteoUbrlvYuR7EvYW2yPiWEFhnP/B7yK7LCaMLL8ExGsDjnfOuMBg6dgj3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YuweBf/D; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-32b43846e8cso7812411fa.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Jun 2025 12:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750794241; x=1751399041; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEEqXQPzSi/2DYZkyERnStSQgx8nwqj2N53hxm8wTV8=;
        b=YuweBf/Dx6SZV/ES4ka0J24b0HGZJ6DKvelBic6v7vtEMuXQYaq7y7u8fsIdzd53Ug
         T/izPE21Rs6qf2tq2ef9l32nn0rshjyM12/1vAQggoOJJNZ+5wT/XSzDBfIGyU45+pia
         cYKgK6nMTDq0Omn85/YCoHk2NHXo9ucAb/YO1ZbukPV5STuI5bhPdPmENeK1rLamBTpU
         Lxq+9DTSuLoIkURW1yLjC8gwIkTVtGsvZDCKcFYHVXC8rnHKsHN4/g1sN+0kkFLLWwe3
         0LHCplcJ5T9Sktq0SRwZpWO48uR+08HPj/Uah0eoRSDuRFQB3t9jRBa4iYSnuhXlQyVn
         apyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750794241; x=1751399041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mEEqXQPzSi/2DYZkyERnStSQgx8nwqj2N53hxm8wTV8=;
        b=Cc28GYBhhCyILq7LYCD0swq7nS/fKyvzAkRMoXK4BHhh9ngCbv6s4iRCaLAYS5Tnus
         eyhKMDPD4C6xSHvDMvqv73c93c5232yXAKov15WbP0naZqb/MJik+ofIP8QbrW2Oxpqy
         TmeBbRb53MSb6dytGqLvWL+yjZxJ8AiarJJyhouZ94a15SqOyWsCJbxZZ3xwaz0bS/ND
         Zr757o2VjsdKDmcNHTZ9gDhmFPYJDdv9HMY4vEmUhlGaHAvv5hGHLoxUqtAhiuFvJSsk
         dgcPYi3Hpj4Ogl1MD63ejHNLrRheFma8ZWGEERtO8yqUEiE29/t54qIWcS9OvAwooos4
         uZbA==
X-Forwarded-Encrypted: i=1; AJvYcCUKT5F1fAylnr4kUD3vorsFStVt/88ZaetdLJMyH2dMVkQ3pzteWju0G2rfm9WAL+8onI2e3fPhf6veMp77zzd5tA==@vger.kernel.org
X-Gm-Message-State: AOJu0YykWr7uxu4bfrUfNVzu/yokShTtaA0XDpVDPksROEaVOXPuy1S2
	+58eOltDHqBm3eeR1oeJlrBkzAdqC7fL0rVvDZhCf6nBgQaNwm8I5QcbpvPWPtJDv+PsL4s0cQP
	DBUb3bMCy5v75W6eYqpaeU/suvXAFXfyRDFgYRnUUzg==
X-Gm-Gg: ASbGnctyxb8080PJkfWloL4KND16fBjOkXnQA8DpEqGsKmHMRC3IV+JSiuXLVgKcSpE
	ZKfbF2bk6PkPkhkQEFq8sT4XIEq/dzARaz/Jib/wBZCM+ltiDbfFJzaBT7xs8LeXh4K3FOTHlov
	S65nKVphMhm9X3o69dBH8i/VUc8mj4dL55MhAsHOoZ8lM=
X-Google-Smtp-Source: AGHT+IF2ZsZmunuKbQXBbvrJ/CF+mo6d+N7b7ivEICTBxI/GH/HmsLM4r9Hm61QzUCqDuwsN/lGUxeELXR1RoBAx8E4=
X-Received: by 2002:a2e:9e4c:0:b0:32b:7cdb:aa4d with SMTP id
 38308e7fff4ca-32cc657b90dmr64541fa.31.1750794241285; Tue, 24 Jun 2025
 12:44:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250624-gpio-mmio-pdata-v1-0-a58c72eb556a@linaro.org> <20250624-gpio-mmio-pdata-v1-2-a58c72eb556a@linaro.org>
In-Reply-To: <20250624-gpio-mmio-pdata-v1-2-a58c72eb556a@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:43:50 +0200
X-Gm-Features: AX0GCFvZTjr80iDIOZKB_55ymASKXhThtYvBCFl997kaJ5_-KuT-0OBBGsj3psE
Message-ID: <CACRpkdavsQJTfiwn-F+ML5MK6ADtr-31bBxLA4gV7MTAYR0YGQ@mail.gmail.com>
Subject: Re: [PATCH RFT 2/6] gpio: mmio: get chip label and GPIO base from
 device properties
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Lee Jones <lee@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-omap@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-samsung-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 24, 2025 at 3:19=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Ahead of removing struct bgpio_pdata support from the gpio-mmio generic
> module, let's add support for getting the relevant values from generic
> device properties. "label" is a semi-standardized property in some GPIO
> drivers so let's go with it. There's no standard "base" property, so
> let's use the name "gpio-mmio,base" to tie it to this driver
> specifically. The number of GPIOs will be retrieved using
> gpiochip_get_ngpios() so there's no need to look it up in the software
> node.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This works for me.
I wouldn't be stoked to see device trees abusing the "gpio-mmio,base"
property all of a sudden just because it now exists as a device
property though... I kind of wish we had a way to opt out of exposing
this to all the sub-property paths. But it seems tiresome, so:

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

