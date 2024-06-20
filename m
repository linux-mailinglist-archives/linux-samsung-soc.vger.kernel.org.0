Return-Path: <linux-samsung-soc+bounces-3514-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B989D910B87
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 20 Jun 2024 18:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35CEB1F22CF6
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 20 Jun 2024 16:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E4F1B29B1;
	Thu, 20 Jun 2024 16:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fgmb//Gr"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9717C1B3F26;
	Thu, 20 Jun 2024 16:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718899909; cv=none; b=UdPFX/VL+GE75bafqZj5AXhMK8UoB93nZlmPME60/rjFfkdVkOk/P0XW7CYC1rnguNosDFgIikD0yhVQB5TZXt1PJgU4AskFUz+ktFgy0OJzX3lix2MjuFbHLmKaiKYdkT7lg7cFUusQviXe36D4eMfV2HC9IiePbkNZWFarc5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718899909; c=relaxed/simple;
	bh=WeTUKEDtm6DluJNLL2ts96rpxWNm5O31C45eYJesU7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KXkUL3wE6n6n5WiyyuWttE2f3Hq9c7QB7d+njKi+rc49y6WgjTxicMhRGd8RyuPSl0Lfdc6OAjDU3qPpg3kLUSNuuy8qLwjaVBH439GaaerjpKEytOmI0klYiRcAeHPzI2d3Wy9j9u4w38U6LQj9Gf7Q2PQrCfsliDpTH/LCvOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fgmb//Gr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62875C4AF07;
	Thu, 20 Jun 2024 16:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718899909;
	bh=WeTUKEDtm6DluJNLL2ts96rpxWNm5O31C45eYJesU7A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Fgmb//GrOgY8zUVSZnyWqvMcmAIj7N4HyKCz95jVlI4QOBXogKvvbELBgqtQyAdft
	 oonRlboGw8KZoUCr6sRoaghD58IHy26JPSBk/6h33UuMIoSK8Ca0Cpou46d3ikh7s5
	 DfBoTrijAzXOp9pa7MTObGTbjhVPcFE9IJDKPCYmVW6aedBLfbazoGmsWcDN7P9fLF
	 kpHg9mfLLiP17e4gvHuq7d7xER4C002Lf14GKu2m8U3bb7q+mw59t2oK5HXLGCClou
	 MqlsbiEGssS8T9a5OGD7jpdOHVoL4QmHNNfVBZOJ3y0VjMKLU1765XSZDp2MIhJA8D
	 AZaJ9TAegRtxQ==
Message-ID: <1e7bc737-af3b-4b10-9f15-a40da97803f0@kernel.org>
Date: Thu, 20 Jun 2024 18:11:37 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/23] power: supply: s2dos05: Add fuel gauge driver
 for s2dos05
To: Dzmitry Sankouski <dsankouski@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, phone-devel@vger.kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-19-e3f6662017ac@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-19-e3f6662017ac@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/06/2024 15:59, Dzmitry Sankouski wrote:
> Add fuel gauge driver for s2dos05 PMIC. It uses adc to measure power
> on each power output s2dos05 provides, including regulator outputs
> and AVDD, ELVSS, ELVDD lines. Driver registers power supply for each
> corresponding power line.
> 
> Adc can be disabled and enabled via sysfs.
> 


> +
> +static const struct power_supply_desc s2dos05_avdd_fg_desc = {
> +	.name		= "s2dos05_avdd",
> +	.type		= POWER_SUPPLY_TYPE_UNKNOWN,
> +	.get_property	= s2dos05_fg_get_property_avdd,
> +	.properties	= s2dos05_fg_properties,
> +	.num_properties	= ARRAY_SIZE(s2dos05_fg_properties),
> +};
> +
> +static const struct power_supply_desc s2dos05_buck_fg_desc = {
> +	.name		= "s2dos05_buck",
> +	.type		= POWER_SUPPLY_TYPE_UNKNOWN,
> +	.get_property	= s2dos05_fg_get_property_buck,
> +	.properties	= s2dos05_fg_properties,
> +	.num_properties	= ARRAY_SIZE(s2dos05_fg_properties),
> +};

Buck is a regulator. Not power supply.

Entire driver is something odd. NAK.

> +static int s2dos05_fuelgauge_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct s2dos_core *iodev = dev_get_drvdata(dev->parent);
> +	struct s2dos05_fg	*drv_data;

Drop redundant spaces.

> +	struct power_supply_config pscfg = {};
> +	int ret;
> +
> +	drv_data = devm_kzalloc(dev, sizeof(struct s2dos05_fg),

Drop 2015 code. Use new drivers as template.

> +							GFP_KERNEL);
> +	if (!drv_data)
> +		ret = -ENOMEM;


> +
> +MODULE_DESCRIPTION("s2dos05 power meter");
> +MODULE_AUTHOR("Dzmitry Sankouski <dsankouski@gmail.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/include/linux/mfd/s2dos05.h b/include/linux/mfd/s2dos05.h
> new file mode 100644
> index 000000000000..8d216064bc78
> --- /dev/null
> +++ b/include/linux/mfd/s2dos05.h

Why this is MFD? Squash the header into C code.

> @@ -0,0 +1,123 @@
> +/* SPDX-License-Identifier: GPL-2.0+
> + * s2dos05.h

Drop

> + *
> + * Copyright (c) 2016 Samsung Electronics Co., Ltd
> + *              http://www.samsung.com
> + *
> + */
> +
> +#ifndef __LINUX_MFD_S2DOS05_H
> +#define __LINUX_MFD_S2DOS05_H
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#define MFD_DEV_NAME "s2dos05"

Drop

> +
> +struct s2dos05_dev {
> +	struct device *dev;
> +	struct regmap *regmap;
> +};
> +
> +/* S2DOS05 registers */
> +/* Slave Addr : 0xC0 */
> +enum S2DOS05_reg {
> +	S2DOS05_REG_DEV_ID,
> +	S2DOS05_REG_TOPSYS_STAT,
> +	S2DOS05_REG_STAT,
> +	S2DOS05_REG_EN,
> +	S2DOS05_REG_LDO1_CFG,
> +	S2DOS05_REG_LDO2_CFG,
> +	S2DOS05_REG_LDO3_CFG,
> +	S2DOS05_REG_LDO4_CFG,
> +	S2DOS05_REG_BUCK_CFG,
> +	S2DOS05_REG_BUCK_VOUT,
> +	S2DOS05_REG_IRQ_MASK = 0x0D,
> +	S2DOS05_REG_SSD_TSD = 0x0E,
> +	S2DOS05_REG_OCL = 0x10,
> +	S2DOS05_REG_IRQ = 0x11
> +};
> +
> +/* S2DOS05 regulator ids */
> +enum S2DOS05_regulators {

What does it have to do with power supply / fuel gauge?

> +	S2DOS05_LDO1,
> +	S2DOS05_LDO2,
> +	S2DOS05_LDO3,
> +	S2DOS05_LDO4,
> +	S2DOS05_BUCK1,
> +	S2DOS05_REG_MAX,
> +};



Best regards,
Krzysztof


