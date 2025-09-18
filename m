Return-Path: <linux-samsung-soc+bounces-10728-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F41CDB43607
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  4 Sep 2025 10:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65C395A1878
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  4 Sep 2025 08:39:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0388E2D47F5;
	Thu,  4 Sep 2025 08:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="jZfw+Xcy"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D1A2D46DA
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Sep 2025 08:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756975087; cv=none; b=pH6Dta3WEiUhOY24VY1+BENE1wR5UTbbGaXeAGMf42jbsRKZuXyWH6FD/KwNFzaTvdpkT1sY3rD8JlqAMqYjkMaC0XCmccPKM/ADm/jyQFqJkAUk7wQ6cgkUwnWC26Y/RCx11sCSknc0cPNkrJLM1tQX3rZAP7EVMQx37oSOuAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756975087; c=relaxed/simple;
	bh=YDbfr7yaSc56Bv7K7wQUh9MIpwkhIpINVDhmf52rvhw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gV2aQqKqDuNTUW1aQv06JFk9RwRpJ/z0FdCLk61YOzgr1f5UarPJqiRrmorYXShNw4qhGciC2TFUX5k7tCe0U45Cu2cR5y928o3tgya67eA3PBYmyre2dRZSoy4/kFOUWSPb3qDEmTBWdAoInz9CtSJgVmsceyBe8YAjuWne/EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=jZfw+Xcy; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Date: Thu, 4 Sep 2025 10:37:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1756975072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZEwYkBxATBfFnEmHwCfGAJRtrHj8HkxkqVpkDpK++KE=;
	b=jZfw+XcyPayo4oQt0R98U7vVc/V6srm5uvAn08jRQL5cd6hqVrDiS8Ovo8Y39MVlj74jev
	kjSc0lT9bTj0OHVicevI0T3vtTvPvr7l3ge41RlPpS7Ipucw8X13Q5MqWAfcAb+gfiN+6z
	RyxL/Z6BPwbx7HbTLd2BG4Awbk1J3J4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Shin Son <shin.son@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] thermal: exynos_tmu: Support new hardware and
 update TMU interface
Message-ID: <20250904083745.GA33254@l14.localdomain>
References: <20250903073634.1898865-1-shin.son@samsung.com>
 <CGME20250903073653epcas2p16e8bf815e604fdb63669271ad3071d96@epcas2p1.samsung.com>
 <20250903073634.1898865-3-shin.son@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250903073634.1898865-3-shin.son@samsung.com>
X-Migadu-Flow: FLOW_OUT

Hi Shin,

On Wed, Sep 03, 2025 at 04:36:33PM +0900, Shin Son wrote:
> The Exynos tmu driver's private data structure has been extended
> to support the exynosautov920 hardware, which requires per-sensor interrupt
> enablement and dual-zone handling:
> 
> - Add 'slope_comp' : compensation parameter below 25 degrees.
> - Add 'calib_temp' : stores the fused calibaration temperature.
> - Add 'tz_count' : reflects the new 1:2 hardware-to-thermal-zone ratio.
> - Add 'valid_sensor_bitmap' : bitmap to enable interrupts
> 			      for each valid sensor.
> - Rename 'tzd' -> 'tzd_array' to register multiple thermal zones.
> 
> Since splitting this patch causes runtime errors during temperature
> emulation or problems where the read temperature feature fails to
> retrieve values, I have submitted it as a single commit. To add support
> for the exynosautov920 to the exisiting TMU interface, the following
> changes are included:
> 
> 1. Branch 'code_to_temp' and 'temp_to_code' for exynosautov920 SoC variant.
> 2. Loop over 'tz_count' in critical-point setup.
> 3. Introduce 'update_con_reg' for exynosautov920 control-register updates.
> 4. Add exynosautov920-specific branch in 'exynos_tmu_update_temp' function.
> 5. Skip high & low temperature threshold setup in exynosautov920.
> 6. Enable interrupts via bitmap in 'exynosautov920_tmu_set_crit_temp'.
> 7. Initialize all new members during 'exynosautov920_tmu_initialize'.
> 8. Clear IRQs by iterating the bitamp in exynosautov920.
> 9. Register each zone with 'devm_thermal_of_zone_register()'
>    based on 'tz_count'.
> 
> Signed-off-by: Shin Son <shin.son@samsung.com>
> ---
>  drivers/thermal/samsung/exynos_tmu.c | 340 ++++++++++++++++++++++++---
>  1 file changed, 303 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
> index 47a99b3c5395..60d5ab33c593 100644
> --- a/drivers/thermal/samsung/exynos_tmu.c
> +++ b/drivers/thermal/samsung/exynos_tmu.c

[ ... ]

> +#define EXYNOSAUTOV920_TMU_REG_THRESHOLD(p)	(((p)) * 0x50 + 0x00D0)
> +#define EXYNOSAUTOV920_TMU_REG_INTEN(p)		(((p)) * 0x50 + 0x00F0)
> +#define EXYNOSAUTOV920_TMU_REG_INT_PEND(p)	(((p)) * 0x50 + 0x00F8)
> +
> +#define EXYNOSAUTOV920_CURRENT_TEMP_P1_P0	0x084
> +#define EXYNOSAUTOV920_TMU_REG_EMUL_CON		0x0B0
> +
> +#define EXYNOSAUTOV920_TMU_REG_CONTROL		0x50
> +#define EXYNOSAUTOV920_TMU_REG_CONTROL1		0x54
> +#define EXYNOSAUTOV920_TMU_REG_AVG_CONTROL	0x58
> +#define EXYNOSAUTOV920_TMU_SAMPLING_INTERVAL	0x70
> +#define EXYNOSAUTOV920_TMU_REG_COUNTER_VALUE0	0x74
> +#define EXYNOSAUTOV920_TMU_REG_COUNTER_VALUE1	0x78
> +
> +#define EXYNOSAUTOV920_TMU_THERM_TRIP_EN_SHIFT	12

There already is a EXYNOS_TMU_THERM_TRIP_EN_SHIFT constant with the
same value. Is there some fundamental difference between
EXYNOSAUTOV920_TMU_THERM_TRIP_EN_SHIFT and
EXYNOS_TMU_THERM_TRIP_EN_SHIFT?

> +#define EXYNOSAUTOV920_TMU_T_BUF_VREF_SEL_SHIFT		8
> +#define EXYNOSAUTOV920_TMU_T_BUF_VREF_SEL_MASK		0x1f
> +#define EXYNOSAUTOV920_TMU_T_BUF_SLOPE_SEL_SHIFT	3
> +#define EXYNOSAUTOV920_TMU_T_BUF_SLOPE_SEL_MASK		0xf
> +#define EXYNOSAUTOV920_TMU_NUM_PROBE_MASK		0xf
> +#define EXYNOSAUTOV920_TMU_NUM_PROBE_SHIFT		16
> +#define EXYNOSAUTOV920_TMU_LPI_MODE_MASK		1
> +#define EXYNOSAUTOV920_TMU_LPI_MODE_SHIFT		10
> +
> +#define EXYNOSAUTOV920_TMU_AVG_CON_UPDATE		0x0008011A
> +#define EXYNOSAUTOV920_TMU_COUNTER_VALUE0_UPDATE	0x030003C0
> +#define EXYNOSAUTOV920_TMU_COUNTER_VALUE1_UPDATE	0x03C0004D

If I am not mistaken lowercase letters is preferred in defines. The
file already has a mix, but let's not make it worse. Please change to
0x03c0004d and so on in constants above.

>  #define MCELSIUS	1000
>  
> +#define EXYNOS_DEFAULT_TZ_COUNT		1
> +#define EXYNOS_MAX_TZ_COUNT		2
> +
>  enum soc_type {
>  	SOC_ARCH_EXYNOS3250 = 1,
>  	SOC_ARCH_EXYNOS4210,
> @@ -133,6 +179,7 @@ enum soc_type {
>  	SOC_ARCH_EXYNOS5420_TRIMINFO,
>  	SOC_ARCH_EXYNOS5433,
>  	SOC_ARCH_EXYNOS7,
> +	SOC_ARCH_EXYNOSAUTOV920,
>  };
>  
>  /**
> @@ -150,6 +197,8 @@ enum soc_type {
>   * @efuse_value: SoC defined fuse value
>   * @min_efuse_value: minimum valid trimming data
>   * @max_efuse_value: maximum valid trimming data
> + * @slope_comp: allocated value of the slope compensation.
> + * @calib_temp: calibration temperature of the TMU.
>   * @temp_error1: fused value of the first point trim.
>   * @temp_error2: fused value of the second point trim.
>   * @gain: gain of amplifier in the positive-TC generator block
> @@ -157,7 +206,9 @@ enum soc_type {
>   * @reference_voltage: reference voltage of amplifier
>   *	in the positive-TC generator block
>   *	0 < reference_voltage <= 31
> - * @tzd: pointer to thermal_zone_device structure
> + * @tz_count: The allocated number of the thermal zone
> + * @tzd_array: pointer array of thermal_zone_device structure
> + * @valid_sensor_bitmap: The enabled sensor of the TMU device
>   * @enabled: current status of TMU device
>   * @tmu_set_low_temp: SoC specific method to set trip (falling threshold)
>   * @tmu_set_high_temp: SoC specific method to set trip (rising threshold)
> @@ -181,10 +232,14 @@ struct exynos_tmu_data {
>  	u32 efuse_value;
>  	u32 min_efuse_value;
>  	u32 max_efuse_value;
> +	u16 slope_comp;
> +	u16 calib_temp;
>  	u16 temp_error1, temp_error2;
>  	u8 gain;
>  	u8 reference_voltage;
> -	struct thermal_zone_device *tzd;
> +	u8 tz_count;
> +	unsigned long valid_sensor_bitmap;
> +	struct thermal_zone_device *tzd_array[EXYNOS_MAX_TZ_COUNT];
>  	bool enabled;
>  
>  	void (*tmu_set_low_temp)(struct exynos_tmu_data *data, u8 temp);
> @@ -208,10 +263,25 @@ static int temp_to_code(struct exynos_tmu_data *data, u8 temp)
>  	if (data->cal_type == TYPE_ONE_POINT_TRIMMING)
>  		return temp + data->temp_error1 - EXYNOS_FIRST_POINT_TRIM;
>  
> -	return (temp - EXYNOS_FIRST_POINT_TRIM) *
> -		(data->temp_error2 - data->temp_error1) /
> -		(EXYNOS_SECOND_POINT_TRIM - EXYNOS_FIRST_POINT_TRIM) +
> -		data->temp_error1;
> +	if (data->soc == SOC_ARCH_EXYNOSAUTOV920) {
> +		if ((temp - EXYNOS_FIRST_POINT_TRIM) >= 0) {
> +			return (temp - EXYNOS_FIRST_POINT_TRIM) *
> +				(data->temp_error2 - data->temp_error1) /
> +				(data->calib_temp - EXYNOS_FIRST_POINT_TRIM) +
> +				data->temp_error1;
> +		} else {
> +			return ((temp - EXYNOS_FIRST_POINT_TRIM) *
> +				(data->temp_error2 - data->temp_error1) /
> +				(data->calib_temp - EXYNOS_FIRST_POINT_TRIM) *
> +				((57 + data->slope_comp) * 1000 / 65)) / 1000 +
> +				data->temp_error1;
> +		}
> +	} else {
> +		return (temp - EXYNOS_FIRST_POINT_TRIM) *
> +			(data->temp_error2 - data->temp_error1) /
> +			(EXYNOS_SECOND_POINT_TRIM - EXYNOS_FIRST_POINT_TRIM) +
> +			data->temp_error1;

This is essentially the same as the first return in the
SOC_ARCH_EXYNOSAUTOV920 path. How about putting
EXYNOS_SECOND_POINT_TRIM in the calib_temp field for the non autov920
SoCs, then we can simplify temp_to_code and code_to_temp to something
more readable like:

static int temp_to_code(struct exynos_tmu_data *data, u8 temp)
{
	if (data->cal_type == TYPE_ONE_POINT_TRIMMING)
		return temp + data->temp_error1 - EXYNOS_FIRST_POINT_TRIM;

	int coeff = (data->temp_error2 - data->temp_error1) /
			(data->calib_temp - EXYNOS_FIRST_POINT_TRIM);

	if (data->soc == SOC_ARCH_EXYNOSAUTOV920 &&
	    temp < EXYNOS_FIRST_POINT_TRIM)
		coeff *= (57 + data->slope_comp) * 1000 / 65)) / 1000;

	return (temp - EXYNOS_FIRST_POINT_TRIM) * coeff + data->temp_error1;
}

>  }
>  
>  /*
> @@ -223,10 +293,25 @@ static int code_to_temp(struct exynos_tmu_data *data, u16 temp_code)
>  	if (data->cal_type == TYPE_ONE_POINT_TRIMMING)
>  		return temp_code - data->temp_error1 + EXYNOS_FIRST_POINT_TRIM;
>  
> -	return (temp_code - data->temp_error1) *
> -		(EXYNOS_SECOND_POINT_TRIM - EXYNOS_FIRST_POINT_TRIM) /
> -		(data->temp_error2 - data->temp_error1) +
> -		EXYNOS_FIRST_POINT_TRIM;
> +	if (data->soc == SOC_ARCH_EXYNOSAUTOV920) {
> +		if ((temp_code - data->temp_error1) >= 0) {
> +			return (temp_code - data->temp_error1) *
> +				(data->calib_temp - EXYNOS_FIRST_POINT_TRIM) /
> +				(data->temp_error2 - data->temp_error1) +
> +				EXYNOS_FIRST_POINT_TRIM;
> +		} else {
> +			return ((temp_code - data->temp_error1) *
> +				(data->calib_temp - EXYNOS_FIRST_POINT_TRIM) /
> +				(data->temp_error2 - data->temp_error1) *
> +				(65 * 1000 / (57 + data->slope_comp))) / 1000 +
> +				EXYNOS_FIRST_POINT_TRIM;
> +		}
> +	} else {
> +		return (temp_code - data->temp_error1) *
> +			(EXYNOS_SECOND_POINT_TRIM - EXYNOS_FIRST_POINT_TRIM) /
> +			(data->temp_error2 - data->temp_error1) +
> +			EXYNOS_FIRST_POINT_TRIM;
> +	}

Similar suggestion as for temp_to_code applies here as well.

Best regards,
Henrik Grimler

