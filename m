Return-Path: <linux-samsung-soc+bounces-5543-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 265769E137E
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  3 Dec 2024 07:47:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AA9B16111A
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  3 Dec 2024 06:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA33F13AD1C;
	Tue,  3 Dec 2024 06:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zx4RWlwx"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD7714F104
	for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Dec 2024 06:47:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733208468; cv=none; b=HA4xsd8gWAP7l7ZP7zkqryYs3mkiIYRPDTQHH7VffxGfE5tRNcdmceGUIsQecYr+S+KYIuyRWLXU0vjmW6Ha4zmPo1+cNaSoBGUzTMHzbX2cEgcSl/xh9wknsgI+JPzhA+rxe9rCfurKaD8W0mZhgXX8BGgjyyt7KRYa6l9MZ4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733208468; c=relaxed/simple;
	bh=nwOsh6nyzqZL3o0Ea+HUPnu7JkD/ffwmQ52XqyJkfwY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=msBAPxFajjoZc6NG008aLGq2G9FAmf5zNGa41uru1UJiXc46M6rxYvbCtxycuCfJuylqKT8trGlEktFPGR4uJGQKuOE0FCtE7Qbyii3a568Sc/G2ZOEpqTeq0X1oTQBdkFCF3ZqLnkbiNC8Y7/kGTGzUKXDuYxcZ2lH6+2X1C74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zx4RWlwx; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-434a83c6b01so44818615e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Dec 2024 22:47:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733208463; x=1733813263; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/RobnTVBYLiaDMD8JmMIw8HC0/tWcGzmOm0rswY3UxM=;
        b=zx4RWlwxsbBq8fQh0DA45aPCa09+/abLRkuEvC2uUyd+usDjbgknJkUBRUr4+v1gRW
         iUzIOmPVDEPoKJEHnNQn1yuOWDbMQ6stvdtNf4Rsh9eDNS2V8qPoA01Om3RD+H1mVGkY
         Wp1ATKTiL7EMSwScoRzAqN+PGGj91/1Yin+xVyMnv7+Qna3XtpJO+ORlZWaBiQP5vqZ4
         f47zBH7xywe76Ff73L2+o/caL3qUMWkS/cDe1kiquDONfpxa8m2i9fuY46xMUoks/d/S
         vyrCJBzoWQr/cOR8e8OYE644zsCEFG2gGllbnKEN+m8AqDB/o4gLQZkRbZB1cQz2AJwe
         ie2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733208463; x=1733813263;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/RobnTVBYLiaDMD8JmMIw8HC0/tWcGzmOm0rswY3UxM=;
        b=uS9Gy2bJGawpIqjjmcJWEsR9YGmMXq+h30Q998jnGZMvKFe3k0C3R9mMEEVbInOski
         Qy59XMJirhzJ68IC0WQwgQatHE6vEtsnXyqRse10oVfvZDeyIp99bmWNDyqoTPNqhmyb
         3c1TPE/RbkBdCXjNg000QICuqooSmq9AtRDCa+07Dq3DmGUgXMH3+oV/kdMmgJYkjkyA
         bRtwgkFc2ByTiPWUnkMI8iT0x8J/kA5MBWXO7TfF3HxL8jETbR+Cj1HpAnIfujyzRaev
         la3xirKLoa6OUVdDVEgxnxK+h/BZzRR9hz1Y3xy1m804ChhW4UGbqIuuHQMO7MBJhXMw
         m9pg==
X-Forwarded-Encrypted: i=1; AJvYcCX1H9ON8nMtT4NkQWvQk03/wBzKVv2FNEUWomZpdd+XRQ5Edw7a11B+A/nn+H9oBPQWMmlDM9jk01qOoIjB7H4zrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkhz6jj+m5lmmk1d/3/b4P9sB+Zf6RVLHnf4ppdr9DZdphSMwq
	Ua0IB0F3IOAVZ6qZTwZYd5Pce3eI04Q0e+MvY8wzYr6P/LOjD1h5CPY6nQdmU48=
X-Gm-Gg: ASbGncvL7EHfmQjqYBERielylaLR8CyGfuWthG5sO5um0SZmxatOhgqsclTaUthflSz
	5uQmAcSMfrFEMMSjootOMINjnvFHD7SRa24Xxh/0X1WDT76W8hUnnO+DaV5x34adeXzHEnclWa4
	3ERdp3Jdoqn5d/2cECzY7ypzxq3Nm92r5VlFTMPPKYd03VgM/udFHPHQ6VyifHl3GomNEw2gLVv
	PBU1zu8rfdY0RNzTSWuNcbklB/+emfUDlv9R0/rx6uOgyN0noJXWbA=
X-Google-Smtp-Source: AGHT+IFvIm1Cj+m9L3+8eoO1wguyNHK3N/D+YEl/HgW5fjyufsSwyyXyAHnmtnybYP0D7O4sZNMCrg==
X-Received: by 2002:a05:6000:1acd:b0:385:de67:2297 with SMTP id ffacd0b85a97d-385fd532bdcmr879010f8f.54.1733208463581;
        Mon, 02 Dec 2024 22:47:43 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e391656csm9296916f8f.47.2024.12.02.22.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 22:47:43 -0800 (PST)
Message-ID: <c377f3302c6c282ad826211c859e2b65bb1222cb.camel@linaro.org>
Subject: Re: [PATCH 1/4] power: supply: add support for max77759 fuel gauge
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: t.antoine@uclouvain.be, Sebastian Reichel <sre@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Peter
 Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Tue, 03 Dec 2024 06:47:41 +0000
In-Reply-To: <20241202-b4-gs101_max77759_fg-v1-1-98d2fa7bfe30@uclouvain.be>
References: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
	 <20241202-b4-gs101_max77759_fg-v1-1-98d2fa7bfe30@uclouvain.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Thomas,

Thanks for looking into this!

> From: Thomas Antoine <t.antoine@uclouvain.be>
>=20
> The Maxim max77759 fuel gauge has the same interface as the Maxim max1720=
x
> except for the non-volatile memory slave address which is not available.

It is not fully compatible, and it also has a lot more registers.

For example, the voltage now is not in register 0xda as this driver assumes=
.
With these changes, POWER_SUPPLY_PROP_VOLTAGE_NOW just reads as 0. 0xda
doesn't exist in max77759

I haven't compared in depth yet, though.

> No slave is available at address 0xb of the i2c bus, which is coherent
> with the following driver from google: line 5836 disables non-volatile
> memory for m5 gauge.
>=20
> Link:
> https://android.googlesource.com/kernel/google-modules/bms/+/1a68c36bef47=
4573cc8629cc1d121eb6a81ab68c/max1720x_battery.c
>=20
> Add support for the max77759 by allowing to use the non-volatile
> memory or not based on the chip. Value for RSense comes from the followin=
g
> stock devicetree:
>=20
> Link:
> https://android.googlesource.com/kernel/devices/google/gs101/+/33eca36d43=
da6c2b6a546806eb3e7411bbe6d60d/dts/gs101-raviole-battery.dtsi
>=20
> Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
> ---
> =C2=A0drivers/power/supply/max1720x_battery.c | 71 ++++++++++++++++++++++=
+++++-
> -----
> =C2=A01 file changed, 59 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/power/supply/max1720x_battery.c
> b/drivers/power/supply/max1720x_battery.c
> index
> 33105419e2427bb37963bda9948b647c239f8faa..faf336938dd4306dd2ceeb0a84b90ca=
8
> 0ad41a9f 100644
> --- a/drivers/power/supply/max1720x_battery.c
> +++ b/drivers/power/supply/max1720x_battery.c
> @@ -13,6 +13,7 @@
> =C2=A0#include <linux/nvmem-provider.h>
> =C2=A0#include <linux/power_supply.h>
> =C2=A0#include <linux/regmap.h>
> +#include <linux/types.h>

Please keep file names in alphabetical order.

> =C2=A0
> =C2=A0#include <linux/unaligned.h>
> =C2=A0
> @@ -39,6 +40,7 @@
> =C2=A0#define MAX172XX_DEV_NAME_TYPE_MASK	GENMASK(3, 0)
> =C2=A0#define MAX172XX_DEV_NAME_TYPE_MAX17201	BIT(0)
> =C2=A0#define MAX172XX_DEV_NAME_TYPE_MAX17205	(BIT(0) | BIT(2))
> +#define MAX172XX_DEV_NAME_TYPE_MAX77759	0
> =C2=A0#define MAX172XX_QR_TABLE10		0x22
> =C2=A0#define MAX172XX_BATT			0xDA	/* Battery voltage */
> =C2=A0#define MAX172XX_ATAVCAP		0xDF
> @@ -46,6 +48,7 @@
> =C2=A0static const char *const max1720x_manufacturer =3D "Maxim Integrate=
d";
> =C2=A0static const char *const max17201_model =3D "MAX17201";
> =C2=A0static const char *const max17205_model =3D "MAX17205";
> +static const char *const max77759_model =3D "MAX77759";
> =C2=A0
> =C2=A0struct max1720x_device_info {
> =C2=A0	struct regmap *regmap;
> @@ -54,6 +57,21 @@ struct max1720x_device_info {
> =C2=A0	int rsense;
> =C2=A0};
> =C2=A0
> +struct chip_data {
> +	u16 default_nrsense; /* in regs in 10^-5 */
> +	u8 has_nvmem;
> +};
> +
> +static const struct chip_data max1720x_data=C2=A0 =3D {
> +	.default_nrsense =3D 1000,
> +	.has_nvmem =3D 1,
> +};
> +
> +static const struct chip_data max77759_data =3D {
> +	.default_nrsense =3D 500,
> +	.has_nvmem =3D 0,
> +};

This should be made a required devicetree property instead, at least for
max77759, as it's completely board dependent, 'shunt-resistor-micro-ohms'
is widely used.

I also don't think there should be a default. The driver should just fail
to probe if not specified in DT (for max77759).

> +
> =C2=A0/*
> =C2=A0 * Model Gauge M5 Algorithm output register
> =C2=A0 * Volatile data (must not be cached)
> @@ -369,6 +387,8 @@ static int max1720x_battery_get_property(struct
> power_supply *psy,
> =C2=A0			val->strval =3D max17201_model;
> =C2=A0		else if (reg_val =3D=3D MAX172XX_DEV_NAME_TYPE_MAX17205)
> =C2=A0			val->strval =3D max17205_model;
> +		else if (reg_val =3D=3D MAX172XX_DEV_NAME_TYPE_MAX77759)
> +			val->strval =3D max77759_model;
> =C2=A0		else

This is a 16 bit register, and while yes, MAX172XX_DEV_NAME_TYPE_MASK only
cares about the bottom 4 bits, the register is described as 'Firmware
Version Information'.

But maybe it's ok to do it like that, at least for now.

> =C2=A0			return -ENODEV;
> =C2=A0		break;
> @@ -416,7 +436,6 @@ static int max1720x_probe_nvmem(struct i2c_client
> *client,
> =C2=A0		.priv =3D info,
> =C2=A0	};
> =C2=A0	struct nvmem_device *nvmem;
> -	unsigned int val;
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	info->ancillary =3D i2c_new_ancillary_device(client, "nvmem", 0xb)=
;
> @@ -438,6 +457,27 @@ static int max1720x_probe_nvmem(struct i2c_client
> *client,
> =C2=A0		return PTR_ERR(info->regmap_nv);
> =C2=A0	}
> =C2=A0
> +	nvmem =3D devm_nvmem_register(dev, &nvmem_config);
> +	if (IS_ERR(nvmem)) {
> +		dev_err(dev, "Could not register nvmem!");
> +		return PTR_ERR(nvmem);
> +	}
> +
> +	return 0;
> +}
> +
> +static int max1720x_get_rsense(struct device *dev,
> +					 struct max1720x_device_info
> *info,
> +					 const struct chip_data *data)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	if (!data->has_nvmem) {
> +		info->rsense =3D data->default_nrsense;
> +		return 0;
> +	}
> +
> =C2=A0	ret =3D regmap_read(info->regmap_nv, MAX1720X_NRSENSE, &val);
> =C2=A0	if (ret < 0) {
> =C2=A0		dev_err(dev, "Failed to read sense resistor value\n");
> @@ -446,14 +486,9 @@ static int max1720x_probe_nvmem(struct i2c_client
> *client,
> =C2=A0
> =C2=A0	info->rsense =3D val;
> =C2=A0	if (!info->rsense) {
> -		dev_warn(dev, "RSense not calibrated, set 10 mOhms!\n");
> -		info->rsense =3D 1000; /* in regs in 10^-5 */
> -	}
> -
> -	nvmem =3D devm_nvmem_register(dev, &nvmem_config);
> -	if (IS_ERR(nvmem)) {
> -		dev_err(dev, "Could not register nvmem!");
> -		return PTR_ERR(nvmem);
> +		dev_warn(dev, "RSense not calibrated, set %d mOhms!\n",
> +						data-
> >default_nrsense/100);
> +		info->rsense =3D data->default_nrsense;
> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;
> @@ -474,6 +509,7 @@ static int max1720x_probe(struct i2c_client *client)
> =C2=A0	struct device *dev =3D &client->dev;
> =C2=A0	struct max1720x_device_info *info;
> =C2=A0	struct power_supply *bat;
> +	const struct chip_data *data;
> =C2=A0	int ret;
> =C2=A0
> =C2=A0	info =3D devm_kzalloc(dev, sizeof(*info), GFP_KERNEL);
> @@ -488,9 +524,19 @@ static int max1720x_probe(struct i2c_client *client)
> =C2=A0		return dev_err_probe(dev, PTR_ERR(info->regmap),
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "regmap initialization failed\n");
> =C2=A0
> -	ret =3D max1720x_probe_nvmem(client, info);
> +	data =3D device_get_match_data(dev);
> +	if (!data)
> +		return dev_err_probe(dev, ret, "Failed to get chip
> data\n");
> +
> +	if (data->has_nvmem) {
> +		ret =3D max1720x_probe_nvmem(client, info);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Failed to probe
> nvmem\n");
> +	}
> +
> +	ret =3D max1720x_get_rsense(dev, info, data);
> =C2=A0	if (ret)
> -		return dev_err_probe(dev, ret, "Failed to probe
> nvmem\n");
> +		return dev_err_probe(dev, ret, "Failed to get RSense");
> =C2=A0
> =C2=A0	bat =3D devm_power_supply_register(dev, &max1720x_bat_desc,
> &psy_cfg);
> =C2=A0	if (IS_ERR(bat))
> @@ -501,7 +547,8 @@ static int max1720x_probe(struct i2c_client *client)
> =C2=A0}
> =C2=A0
> =C2=A0static const struct of_device_id max1720x_of_match[] =3D {
> -	{ .compatible =3D "maxim,max17201" },
> +	{ .compatible =3D "maxim,max17201", .data =3D (void *) &max1720x_data
> },
> +	{ .compatible =3D "maxim,max77759-fg", .data =3D (void *)
> &max77759_data},

missing space before }

Cheers,
Andre'

> =C2=A0	{}
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(of, max1720x_of_match);
>=20


