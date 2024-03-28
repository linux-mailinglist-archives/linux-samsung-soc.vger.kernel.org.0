Return-Path: <linux-samsung-soc+bounces-2414-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0217788CDF9
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 26 Mar 2024 21:13:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 70694B24BEB
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 26 Mar 2024 20:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D4513D50C;
	Tue, 26 Mar 2024 20:13:07 +0000 (UTC)
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E15F52AD2C;
	Tue, 26 Mar 2024 20:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711483987; cv=none; b=PkxhFweHqwerDMIEI4e23/lIe8ll35uzpMLDvg54lLBtcTC8XLmZqMVutzXjzITJAFzLvp7Zss5rO1FTEaxaSbtFlNyWhJWz9Vyc2R26CG7VbpPHy+MFaKBLb3PgR6ziHxyWfQg2+2tG03Hb6Vfer3ZGtnFB/cLfdRamqDlTGEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711483987; c=relaxed/simple;
	bh=ONqS7vCsZDHAZUJpV/vbCQilzEFVRm30lbCcXCOG7dk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ai19z0nusk4Eex1ZGmcUuJ7gNCZ1DYke5VMxCm5iq7vKCPsg+AyiT/9/FKasZerCjUPMJZwsKmd6BEYR9tgkzsyF3jwMLlyHAJn5qSXVrG3jgNBzmgZrraaQI18Mc8pbgBpyiOwWU6Y6OdKiENQI7W7wZUEAnEWyo6WQNzh2uY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E7C52F4;
	Tue, 26 Mar 2024 13:13:36 -0700 (PDT)
Received: from [10.57.71.219] (unknown [10.57.71.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99A983F64C;
	Tue, 26 Mar 2024 13:13:00 -0700 (PDT)
Message-ID: <d5d6ae17-3ba1-4cb8-909f-865e47bfa45b@arm.com>
Date: Tue, 26 Mar 2024 20:12:59 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND][PATCH v2 4/4] soc: samsung: exynos-asv: Update Energy
 Model after adjusting voltage
Content-Language: en-US
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, sboyd@kernel.org, nm@ti.com,
 linux-samsung-soc@vger.kernel.org, daniel.lezcano@linaro.org,
 rafael@kernel.org, viresh.kumar@linaro.org, krzysztof.kozlowski@linaro.org,
 alim.akhtar@samsung.com, m.szyprowski@samsung.com, mhiramat@kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20240322110850.77086-1-lukasz.luba@arm.com>
 <20240322110850.77086-5-lukasz.luba@arm.com>
 <59d37960-cf19-4b10-802f-59d42496c133@arm.com>
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <59d37960-cf19-4b10-802f-59d42496c133@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dietmar,

On 3/26/24 11:20, Dietmar Eggemann wrote:
> On 22/03/2024 12:08, Lukasz Luba wrote:
> 
> [...]
> 
>> @@ -97,9 +98,17 @@ static int exynos_asv_update_opps(struct exynos_asv *asv)
>>   			last_opp_table = opp_table;
>>   
>>   			ret = exynos_asv_update_cpu_opps(asv, cpu);
>> -			if (ret < 0)
>> +			if (!ret) {
>> +				/*
>> +				 * When the voltage for OPPs successfully
>> +				 * changed, update the EM power values to
>> +				 * reflect the reality and not use stale data
> 
> At this point, can we really say that the voltage has changed?
> 
>    exynos_asv_update_cpu_opps()
> 
>      ...
>      ret = dev_pm_opp_adjust_voltage()
>      if (!ret)
>        em_dev_update_chip_binning()
>      ...
> 
> dev_pm_opp_adjust_voltage() also returns 0 when the voltage value stays
> the same?
> 
> [...]

The comment for the dev_pm_opp_adjust_voltage() says that it
returns 0 if no modification was done or modification was
successful. So I cannot distinguish in that driver code, but
also there is no additional need to do it IMO (even framework
doesn't do this).

Regards,
Lukasz

[1] 
https://elixir.bootlin.com/linux/v6.9-rc1/source/drivers/opp/core.c#L2950

