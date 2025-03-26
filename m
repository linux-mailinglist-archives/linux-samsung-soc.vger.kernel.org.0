Return-Path: <linux-samsung-soc+bounces-7636-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FD5A713C2
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 26 Mar 2025 10:34:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48B943B398F
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 26 Mar 2025 09:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6072318C034;
	Wed, 26 Mar 2025 09:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IpBxcm5r"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8160D15381A
	for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Mar 2025 09:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742981643; cv=none; b=UAxzyeXC1OiB9np+B7jcxNySY1QyU/sXtt0/QTHnavD78k0r7PD5QOEesM+BfSqqWyUEqECrvy0r3O1BRlFpeAHTh5QkJzCebXCa9T8dPD7LlxdVlLELqb7F1nrBEzcz17mTXtM9CWFS0szusq7OZchQGJHPWmE9r9tbKdwEa4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742981643; c=relaxed/simple;
	bh=+rNeWmw7vmA6LcgFocZpKgq8cJ35o8dhhjBTgNOoZXg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FfKEr/8yMczpIxMTlIW8L/sgFz4f7Oo8Q/q7gQI8kKg0TPSJ6Q+yCJ4ETc3/qlBGHfXikc9dB+0fbAnI0bA2KEgurHXBs9vQo3sjf0UKivqDgzvN89k/pvqxeC025WDMvxF5QtniyPE2fMkQEgTcQCrUYIMwDy4nWngx3oWCUwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IpBxcm5r; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-399744f74e9so4166965f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Mar 2025 02:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742981639; x=1743586439; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ubB85xiyakrTzqYeahwIzAhiIGVtm8XPMhOV+rPyXOM=;
        b=IpBxcm5r8rxGgbx4m6Md9/j3T0KqC/2ed/U8C333waGng46CmGWncKAftMKJAUTixe
         a+07QN7TeIuG3+gHBi0IB4azLiSz06Zau61WILq83gyPXZMEy99FROICw3zw6BgfFaoY
         dk0hNtYwhG1ovOcIOnGGgMy/Xvc0F3GIVum6CGOg2PJDzFunrd3h5tfMhysWNJSFkeKJ
         wqUSFuH0P5gMkaAsiKzA9SZ96+BFCo2j6yXgkgfDtf4G5CZV5A5sgemy5cfGyB3iZxkC
         pF+hPgalKl5XeHhBx7jgpNBUmYA1BdLHJIlocVrClHaaOV+Wgbehnb7HiWqMNZLs8Yr6
         01IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742981639; x=1743586439;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ubB85xiyakrTzqYeahwIzAhiIGVtm8XPMhOV+rPyXOM=;
        b=dB/ipMRtViWHbJEZjEYxkE/Cx9GUP5XzCTvSNadeVnKpNClS6LoUakz5Rv78vijlBT
         bw6WD1Qx7UhwJ9EU7WpTH9AxzV5BRJPbytjM4d5K2CWEBzjExtsOiVi5h9lS/F69Ut5Y
         efgY3+LwPaV9U7/ZCsSJqjreEVzr15DDXeVJBeSrtC4bnutpW5xwGtQEJVextOa6HTYx
         dQnwJNUQ0dOxOvGWzvgiwcWTqH8Sy45SuNnLfieF5EO8AMCI5YEKJum0Vk6ZxZfKwqQJ
         8fhXRCrpBsCm6dWgqE7ac4IqbrvNKOowUaeEjnpz4Jxd5U2NhzUblQeTFuooyHi8FHyL
         yR+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMB0Qhy6Semr0yTna7pWY3+9OZUdDnajto5QbGtotEEQEJmyXvcUOGWdu17Sy3xCIZmjfyoXSAcUMMn3xjbsAyIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfgThpiCOX/VWIFQWLYtAXQcFqiBckxVRVCA+xphQtZcHt6JQY
	2y7chdVQ7+90eTs0TETeoiZlFKc5tBJjvgkSSSfO7AUXarb4trf24cGjMsdPqFE=
X-Gm-Gg: ASbGncvEmvjByFFtw3mHaSO79cYR3ZCrJk5tzn+SgClhyLh1q8v9IjZLR4RcVaTnonu
	KGCQG2JUHDKNUG84Hg42coiO3246g4lNmGEGHPU20RvaU4glVnjYFe8mq2ACZHk/17zncp94f9c
	n0KiT5RosNRMcy9tEqV4egPr3Ahsd5vJlNPxCOeMxidW2O79wS+fllUBeTpuXTCiywOMZv1M8Qz
	Eb6y534VJx4lFGYVUHE5BVE7D4lWBBVvVOy8lfFduR3ORQzMu6EtJfkpxSSVzGF1bOP/9Ci1LHT
	BeR/znCYEChj17+Ul/KN+JxHV/D93T1L5a+SqwYLeuBHwf8g/MJ9fzc1kUgS
X-Google-Smtp-Source: AGHT+IE7bscgKy9rGjJGpIo6TFDhfB/8EvvbOpctc3LTRLmGBdFDt6WU6FZmKes+uCyDc1Z9qfNxWg==
X-Received: by 2002:a05:6000:18a2:b0:391:3028:c779 with SMTP id ffacd0b85a97d-3997f95956cmr18702675f8f.45.1742981638712;
        Wed, 26 Mar 2025 02:33:58 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d7ae65761sm11733465e9.0.2025.03.26.02.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 02:33:58 -0700 (PDT)
Message-ID: <18b43ec2e9f6edd5597de0023c30e7c949416ac2.camel@linaro.org>
Subject: Re: [PATCH 10/34] mfd: sec: split into core and transport (i2c)
 drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Rob
 Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylwester
 Nawrocki	 <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar	 <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas	 <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Alexandre Belloni	 <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	 <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org
Date: Wed, 26 Mar 2025 09:33:55 +0000
In-Reply-To: <79a2bdd7-af66-4876-9553-bb2223760880@kernel.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
	 <20250323-s2mpg10-v1-10-d08943702707@linaro.org>
	 <79a2bdd7-af66-4876-9553-bb2223760880@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.53.2-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

Thanks for your review.

On Wed, 2025-03-26 at 08:14 +0100, Krzysztof Kozlowski wrote:
> On 23/03/2025 23:39, Andr=C3=A9 Draszik wrote:
> > -
> > -	sec_pmic->regmap_pmic =3D devm_regmap_init_i2c(i2c, regmap);
> > -	if (IS_ERR(sec_pmic->regmap_pmic)) {
> > -		ret =3D PTR_ERR(sec_pmic->regmap_pmic);
> > -		dev_err(&i2c->dev, "Failed to allocate register map: %d\n",
> > -			ret);
> > -		return ret;
> > +	if (probedata) {
>=20
> I don't get why this is conditional. New transport will also provide
> probedata or at least it should.

The original thinking was that I'll need very different OF parsing for
ACPM and I2C transports, but after reconsidering, I'll keep the OF parsing
in the core instead (to truly have common OF parsing), and then this
becomes unnecessary.

[...]

> > diff --git a/drivers/mfd/sec-i2c.c b/drivers/mfd/sec-i2c.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..803a46e657a5a1a639014d4=
42941c0cdc60556a5
> > --- /dev/null
> > +++ b/drivers/mfd/sec-i2c.c
> > @@ -0,0 +1,252 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright 2012 Samsung Electronics Co., Ltd
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 http://www.samsung.com
> > + * Copyright 2025 Linaro Ltd.
> > + *
> > + * Samsung SxM I2C driver
> > + */
> > +
> > +#include <linux/dev_printk.h>
> > +#include <linux/err.h>
> > +#include <linux/i2c.h>
> > +#include <linux/mfd/samsung/core.h>
> > +#include <linux/mfd/samsung/s2mpa01.h>
> > +#include <linux/mfd/samsung/s2mps11.h>
> > +#include <linux/mfd/samsung/s2mps13.h>
> > +#include <linux/mfd/samsung/s2mps14.h>
> > +#include <linux/mfd/samsung/s2mps15.h>
> > +#include <linux/mfd/samsung/s2mpu02.h>
> > +#include <linux/mfd/samsung/s5m8767.h>
> > +#include <linux/mod_devicetable.h>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/pm.h>
> > +#include <linux/regmap.h>
> > +#include "sec-core.h"
> > +
> > +static bool s2mpa01_volatile(struct device *dev, unsigned int reg)
> > +{
> > +	switch (reg) {
> > +	case S2MPA01_REG_INT1M:
> > +	case S2MPA01_REG_INT2M:
> > +	case S2MPA01_REG_INT3M:
> > +		return false;
> > +	default:
> > +		return true;
> > +	}
> > +}
> > +
> > +static bool s2mps11_volatile(struct device *dev, unsigned int reg)
> > +{
> > +	switch (reg) {
> > +	case S2MPS11_REG_INT1M:
> > +	case S2MPS11_REG_INT2M:
> > +	case S2MPS11_REG_INT3M:
> > +		return false;
> > +	default:
> > +		return true;
> > +	}
> > +}
> > +
> > +static bool s2mpu02_volatile(struct device *dev, unsigned int reg)
> > +{
> > +	switch (reg) {
> > +	case S2MPU02_REG_INT1M:
> > +	case S2MPU02_REG_INT2M:
> > +	case S2MPU02_REG_INT3M:
> > +		return false;
> > +	default:
> > +		return true;
> > +	}
> > +}
> > +
> > +static const struct regmap_config sec_regmap_config =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +};
> > +
> > +static const struct regmap_config s2mpa01_regmap_config =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +
> > +	.max_register =3D S2MPA01_REG_LDO_OVCB4,
> > +	.volatile_reg =3D s2mpa01_volatile,
> > +	.cache_type =3D REGCACHE_FLAT,
> > +};
> > +
> > +static const struct regmap_config s2mps11_regmap_config =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +
> > +	.max_register =3D S2MPS11_REG_L38CTRL,
> > +	.volatile_reg =3D s2mps11_volatile,
> > +	.cache_type =3D REGCACHE_FLAT,
> > +};
> > +
> > +static const struct regmap_config s2mps13_regmap_config =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +
> > +	.max_register =3D S2MPS13_REG_LDODSCH5,
> > +	.volatile_reg =3D s2mps11_volatile,
> > +	.cache_type =3D REGCACHE_FLAT,
> > +};
> > +
> > +static const struct regmap_config s2mps14_regmap_config =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +
> > +	.max_register =3D S2MPS14_REG_LDODSCH3,
> > +	.volatile_reg =3D s2mps11_volatile,
> > +	.cache_type =3D REGCACHE_FLAT,
> > +};
> > +
> > +static const struct regmap_config s2mps15_regmap_config =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +
> > +	.max_register =3D S2MPS15_REG_LDODSCH4,
> > +	.volatile_reg =3D s2mps11_volatile,
> > +	.cache_type =3D REGCACHE_FLAT,
> > +};
> > +
> > +static const struct regmap_config s2mpu02_regmap_config =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +
> > +	.max_register =3D S2MPU02_REG_DVSDATA,
> > +	.volatile_reg =3D s2mpu02_volatile,
> > +	.cache_type =3D REGCACHE_FLAT,
> > +};
> > +
> > +static const struct regmap_config s5m8767_regmap_config =3D {
> > +	.reg_bits =3D 8,
> > +	.val_bits =3D 8,
> > +
> > +	.max_register =3D S5M8767_REG_LDO28CTRL,
> > +	.volatile_reg =3D s2mps11_volatile,
> > +	.cache_type =3D REGCACHE_FLAT,
> > +};
> > +
> > +/*
> > + * Only the common platform data elements for s5m8767 are parsed here =
from the
> > + * device tree. Other sub-modules of s5m8767 such as pmic, rtc , charg=
er and
> > + * others have to parse their own platform data elements from device t=
ree.
> > + */
> > +static void
> > +sec_pmic_i2c_parse_dt_pdata(struct device *dev,
> > +			=C2=A0=C2=A0=C2=A0 struct sec_pmic_probe_data *pd)
> > +{
> > +	pd->manual_poweroff =3D
> > +		of_property_read_bool(dev->of_node,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "samsung,s2mps11-acokb-ground");
> > +	pd->disable_wrstbi =3D
> > +		of_property_read_bool(dev->of_node,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "samsung,s2mps11-wrstbi-ground");
> > +}
> > +
> > +static int sec_pmic_i2c_probe(struct i2c_client *client)
> > +{
> > +	struct sec_pmic_probe_data probedata;
> > +	const struct regmap_config *regmap;
> > +	unsigned long device_type;
> > +	struct regmap *regmap_pmic;
> > +	int ret;
> > +
> > +	sec_pmic_i2c_parse_dt_pdata(&client->dev, &probedata);
>=20
> This wasn't tested and it makes no sense. You pass random stack values.
> And what is the point of:
> "pdata =3D devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);"
> in sec_pmic_probe()?

Here, the 'struct sec_pmic_probe_data probedata' is on-stack,
and populated by sec_pmic_i2c_parse_dt_pdata(), to become non-random.
This is then passed into the core's sec_pmic_probe(), which kzalloc()s
pdata, and populates pdata using probedata. i2c's probedata is not
used past .probe(), and the pdata from the core is kzalloc()d, so it's
safe to keep using past .probe().

But I'll change this anyway, to keep it all in the core in the first
place, to have truly common i2c and acpm parsing of DT.

>=20
>=20
> ...
>=20
> > +	{ },
> > +};
> > +MODULE_DEVICE_TABLE(of, sec_pmic_i2c_of_match);
> > +
> > +static struct i2c_driver sec_pmic_i2c_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "sec-pmic-i2c",
> > +		.pm =3D pm_sleep_ptr(&sec_pmic_pm_ops),
> > +		.of_match_table =3D sec_pmic_i2c_of_match,
> > +	},
> > +	.probe =3D sec_pmic_i2c_probe,
> > +	.shutdown =3D sec_pmic_i2c_shutdown,
> > +};
> > +module_i2c_driver(sec_pmic_i2c_driver);
> > +
> > +MODULE_AUTHOR("Andr=C3=A9 Draszik <andre.draszik@linaro.org>");
>=20
> This belongs to the patch adding actual features. Moving existing code
> or splitting it is not really reason to became the author of the code.
> The code was there.

OK.

Cheers,
Andre'


