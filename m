Return-Path: <linux-samsung-soc+bounces-11082-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FF3B81B78
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 17 Sep 2025 22:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC14C3AF1B4
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 17 Sep 2025 20:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70CEF27AC4C;
	Wed, 17 Sep 2025 20:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BzJBJu0s"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B0F272803
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2025 20:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758139619; cv=none; b=V9+asyNjv8wVx9bqerxWVdqIara2Re3CJc0lJuCKLPVmvvJXJ+wx3P5iAemXaB85HrylMac+PDmX2aYGAL97K/8CQ0DbQONlZgLxxugKjJcs4h5QJ2Jxpv0ZbMKGGNPMEWpZ8TmZxuTsoWfHkF0gNooYc1va4D420wrUhIzwr00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758139619; c=relaxed/simple;
	bh=uk0f/jb3Tj9XsJt8rx5PWMAF8eB/0DbZGV6iarNBAyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mMRAEAWOz9VVceWPBDheoPt01yVGiSY7IFrGPyCSZWWq1bCHVvEwU28MJPBzy0ttRbAkQUlwBY/uYkG6s7pknhgCSNDcit5v8c/o0s2OOVknSjGMKikDLl2O2UyTNYzf/PSNRUx31yiN9+9e9HAOMYw8FE1vS/P7wOGpabVM9Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BzJBJu0s; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-25669596921so2307105ad.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2025 13:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758139617; x=1758744417; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nAoo4cL1dIYweQDzrk/O9/maigv0J12ua5s1T9IZZIQ=;
        b=BzJBJu0sl7Ot/aa/y4ipoWenR7W1XYwuHfYqZRntlmHYFhwX1d1n5ISbGLOWg6MV9J
         ILKXZL/dPEKBh6CN5osdjky9h7ZpWdH2CPtjJu29hjBfa9FjlFWneM3HN2jGlDB2lwQI
         n6DfCO7u/99Od3MOivDB5HvXA58ZJahlptoVCxXm++yAb0A5jWNiity/l1nqYd+pL0rO
         dhrYmt0yX+s70ypiurlJvni+34oWFTJpXZ16Pv64CMWx5aLkZL434OnfD4Acb/3j+c9+
         RMP1bBIcny77PNWmtMUbinZfpMaU54hdMc7w3Q0dorKq8bLqF3KEVanjvMPRSXPjf/aA
         smwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758139617; x=1758744417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAoo4cL1dIYweQDzrk/O9/maigv0J12ua5s1T9IZZIQ=;
        b=XuJOvIOx5LMQydcJ2UnXOVfmqcKOx3j7StfqUlkB2BkuyCQVcg0D6F5JQFyrfivDaA
         m6hqfMlll/HHHEgRnbh6Mq2ENIezy4z4Gal/2qOqGbP8x5P+DbHDAaX33bQU6FMMV/hq
         l8UmC9EF65rLU05r73qTDDnmxablrWja8/d8Cf0zvlNLMrLMyd0ZykcyYLCPT2tTUvr8
         AtC5MOefoFaGJB6OoT2NEbNTiJ2h0k6W82kNfDlgOE+BmnpJp+WolE7W11M9mMCkg6Um
         ZQ6Km4qFe8heVtv4t1VpYQRAdhod0+4ZoUORd5f5ewB7M6MYCjgJwtZgup7VD68voe6c
         YGCQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5N5YQXcTrWazUJujIVO4Yz1JxObTWZzJGiDWv6b0txIwxeILPtvNvNQIKy1nlOQzNupTzWhz9YiXZW8LRWjD7PA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRv4otDgPlc+7tTf8ZmoGda3T358O9wc2aAEg50iPUsOQ7oDO3
	aEK88JKNsSabJNfh9IXApEEzAumigmuH9aUTgC3e+iXp8JCOI1x9z9ak
X-Gm-Gg: ASbGncuBwAwIjFVQxkRXK5czQymYNyfO3tDTs/YDYj4kPdGffVybrKLqbTM+q8E+jDP
	0O3y7rweuB4hyPQw20d7wNBDXfbfdU5cCFKq/rljgyUhjiPGjoHvfK2RUEOEQson8ZRbl/l2a09
	ZY7KyrCeoHXj2p4cw0Z8JzBFDexLItN5Zf2rXrVYfk7w77pK8STGFi6+t2c7BI0cux6OrijWXQ8
	IP35llr2sdBhYjHp14EWUWIZVeXLeW9nkac4xYCCZdvvE6GoVMF88PVuHApH482BDhZSe/D4kdU
	Pf//xmYVG7SVy2O+isMPApfmMdV63Wkl0qZJjItiFGg7Vypk2NqbMINFJZH9vwtH+h7t+aRoq21
	PfJNr98AQksAzfesYYvWCiqIohlhqULpK9YE8lRJq3A==
X-Google-Smtp-Source: AGHT+IH4ljt2vti7NSBWoLRl1Y3YBR7ak2BF6N3DsrRX2rCMF4AUdMIoGbFRGc1NosrFKmMz+WdEHw==
X-Received: by 2002:a17:903:2c7:b0:264:567b:dd92 with SMTP id d9443c01a7336-26813e02d08mr43177195ad.52.1758139616771;
        Wed, 17 Sep 2025 13:06:56 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:c3d9:b11c:3856:2d3a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2698035cd39sm3762225ad.146.2025.09.17.13.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 13:06:56 -0700 (PDT)
Date: Wed, 17 Sep 2025 13:06:53 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
	linux-samsung-soc@vger.kernel.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] Input: s6sa552 - add a driver for the Samsung
 A552 touchscreen controller
Message-ID: <zh2cvvhvdklwnrnhmzsgajk5ryk7gwd5sayde656ddysi53d7b@frw2ph3opmoe>
References: <20250914134458.2624176-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914134458.2624176-3-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914134458.2624176-3-ivo.ivanov.ivanov1@gmail.com>

Hi Ivaylo,

On Sun, Sep 14, 2025 at 04:44:57PM +0300, Ivaylo Ivanov wrote:
> The S6SA552 touchscreen is a capacitive multi-touch controller for
> mobile use. It connects via i2c at the address 0x48.
> 
> Introduce a basic driver, which can handle initialization, touch events
> and power states.
> 
> At least the firmware for this IC on Galaxy S7 differs from S6SY761
> in register layout and bits, as well as some missing registers/functions,
> for example for retrieving the max X/Y coordinates and the amount
> of TX/RX channels.

I am not sure why you are using runtime PM in the driver, given that you
enable it on probe and disable it in remove and otherwise do not touch.

If you want to use it then you should probably call runtime_pm_get() and
runtime_pm_put() from open()/close() methods instead of toggling power
directly.

[...]

> +
> +static void s6sa552_input_close(struct input_dev *dev)
> +{
> +	struct s6sa552_data *sdata = input_get_drvdata(dev);
> +	int ret;

	int error;

> +
> +	ret = i2c_smbus_write_byte(sdata->client, S6SA552_SENSE_OFF);
> +	if (ret)
> +		dev_err(&sdata->client->dev, "failed to turn off sensing\n");
> +}
> +
> +static ssize_t s6sa552_sysfs_devid(struct device *dev,
> +				   struct device_attribute *attr, char *buf)
> +{
> +	struct s6sa552_data *sdata = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%#x\n", sdata->devid);
> +}
> +
> +static DEVICE_ATTR(devid, 0444, s6sa552_sysfs_devid, NULL);
> +
> +static struct attribute *s6sa552_sysfs_attrs[] = {
> +	&dev_attr_devid.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(s6sa552_sysfs);
> +
> +static int s6sa552_power_on(struct s6sa552_data *sdata)
> +{
> +	u8 buffer[S6SA552_EVENT_SIZE];
> +	int ret;

	int error;

Use "error" for storing error values from APIs that return negative or
0. For APIs that also return real values "ret" is fine.

> +
> +	ret = regulator_bulk_enable(ARRAY_SIZE(sdata->regulators),
> +				    sdata->regulators);
> +	if (ret)
> +		return ret;
> +
> +	msleep(140);
> +
> +	/* double check whether the touch is functional */
> +	ret = i2c_smbus_read_i2c_block_data(sdata->client,
> +					    S6SA552_READ_ONE_EVENT,
> +					    S6SA552_EVENT_SIZE,
> +					    buffer);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (buffer[0] != S6SA552_EVENT_TYPE_ACK ||
> +	    buffer[1] != S6SA552_EVENT_ACK_BOOT) {
> +		return -ENODEV;
> +	}
> +
> +	ret = i2c_smbus_read_byte_data(sdata->client, S6SA552_BOOT_STATUS);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* for some reasons the device might be stuck in the bootloader */
> +	if (ret != S6SA552_BS_APPLICATION)
> +		return -ENODEV;
> +
> +	/* enable touch functionality */
> +	ret = i2c_smbus_write_byte_data(sdata->client,
> +					S6SA552_TOUCH_FUNCTION, 0x01);
> +	if (ret)
> +		return ret;
> +
> +	mdelay(20); /* make sure everything is up */
> +
> +	return 0;
> +}
> +
> +static int s6sa552_hw_init(struct s6sa552_data *sdata)
> +{
> +	u8 buffer[S6SA552_DEVID_SIZE];
> +	int ret;
> +
> +	ret = s6sa552_power_on(sdata);
> +	if (ret)
> +		return ret;
> +
> +	ret = i2c_smbus_read_i2c_block_data(sdata->client,
> +					    S6SA552_DEVICE_ID,
> +					    S6SA552_DEVID_SIZE,
> +					    buffer);
> +	if (ret < 0)
> +		return ret;
> +
> +	sdata->devid = get_unaligned_be16(buffer + 1);
> +
> +	return 0;
> +}
> +
> +static void s6sa552_power_off(void *data)
> +{
> +	struct s6sa552_data *sdata = data;
> +
> +	disable_irq(sdata->client->irq);
> +	regulator_bulk_disable(ARRAY_SIZE(sdata->regulators),
> +			       sdata->regulators);
> +}
> +
> +static int s6sa552_probe(struct i2c_client *client)
> +{
> +	struct s6sa552_data *sdata;
> +	int err;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C |
> +						I2C_FUNC_SMBUS_BYTE_DATA |
> +						I2C_FUNC_SMBUS_I2C_BLOCK))
> +		return -ENODEV;
> +
> +	sdata = devm_kzalloc(&client->dev, sizeof(*sdata), GFP_KERNEL);
> +	if (!sdata)
> +		return -ENOMEM;
> +
> +	i2c_set_clientdata(client, sdata);
> +	sdata->client = client;
> +
> +	sdata->regulators[S6SA552_REGULATOR_VDD].supply = "vdd";
> +	sdata->regulators[S6SA552_REGULATOR_AVDD].supply = "avdd";
> +	err = devm_regulator_bulk_get(&client->dev,
> +				      ARRAY_SIZE(sdata->regulators),
> +				      sdata->regulators);
> +	if (err)
> +		return err;
> +
> +	err = devm_add_action_or_reset(&client->dev, s6sa552_power_off, sdata);
> +	if (err)
> +		return err;
> +
> +	err = s6sa552_hw_init(sdata);
> +	if (err)
> +		return err;
> +
> +	sdata->input = devm_input_allocate_device(&client->dev);
> +	if (!sdata->input)
> +		return -ENOMEM;
> +
> +	sdata->input->name = S6SA552_DEV_NAME;
> +	sdata->input->id.bustype = BUS_I2C;
> +	sdata->input->open = s6sa552_input_open;
> +	sdata->input->close = s6sa552_input_close;
> +
> +	input_set_abs_params(sdata->input, ABS_MT_POSITION_X, 0, S6SA552_MAX_X,
> +			     0, 0);
> +	input_set_abs_params(sdata->input, ABS_MT_POSITION_Y, 0, S6SA552_MAX_Y,
> +			     0, 0);
> +	input_set_abs_params(sdata->input, ABS_MT_TOUCH_MAJOR, 0, 255, 0, 0);
> +	input_set_abs_params(sdata->input, ABS_MT_TOUCH_MINOR, 0, 255, 0, 0);
> +	input_set_abs_params(sdata->input, ABS_MT_PRESSURE, 0, 255, 0, 0);
> +
> +	touchscreen_parse_properties(sdata->input, true, &sdata->prop);
> +
> +	if (!input_abs_get_max(sdata->input, ABS_X) ||
> +	    !input_abs_get_max(sdata->input, ABS_Y)) {
> +		dev_warn(&client->dev, "the axis have not been set\n");
> +	}
> +
> +	err = input_mt_init_slots(sdata->input, S6SA552_TX_CHANNELS,
> +				  INPUT_MT_DIRECT);
> +	if (err)
> +		return err;
> +
> +	input_set_drvdata(sdata->input, sdata);
> +
> +	err = input_register_device(sdata->input);
> +	if (err)
> +		return err;
> +
> +	err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
> +					s6sa552_irq_handler,
> +					IRQF_TRIGGER_LOW | IRQF_ONESHOT,

Do not hardcode trigger type, just use IRQF_ONESHOT.

> +					"s6sa552_irq", sdata);
> +	if (err)
> +		return err;
> +
> +	pm_runtime_enable(&client->dev);
> +
> +	return 0;
> +}

Thanks.

-- 
Dmitry

