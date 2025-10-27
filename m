Return-Path: <linux-samsung-soc+bounces-11832-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B1CEFC0CE3E
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 27 Oct 2025 11:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A3B2D4EF4CC
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 27 Oct 2025 10:10:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D10F27467E;
	Mon, 27 Oct 2025 10:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="axWEOmC7"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31882C0F69
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Oct 2025 10:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761559843; cv=none; b=gwqq1EXmz0R5cSWRB73UHo83OUdkc36KtfpM3DlJTty6jbnvFcITzMdzByBJNXhhQbofeO58LiAuDcHl9lFItuYycH9e/9Nm5DMgsD6tkqMMpcBih/df6JUPrg1L0DyCZqtHilg4roIQytqnJOpkaaUjKrw4pfZqKvjpVv4+RQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761559843; c=relaxed/simple;
	bh=hiJDwH+LPatRk7Ku+OO2NdwWiJWDonBHOwfSJZDm210=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=Ru+c+hckmDfBQ7L+9gNVXhnZgJX96FN9VItqZNzaE0IFyZh3W0lbAZ7RhTI3GtFxwxARl70ehVv4fWy0pu1UbXAwBxgsUlxf/oY4/K9VEe7ss6zWMm9CIbG5xOHC8XMkS9fgd/ALqTOPYqThzMSrHHMOt2TiRewUpl9gzDf8Po4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=axWEOmC7; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251027101037euoutp0187aee13783e6eb4d4e3829cb048ffb16~yUVbgeEA21692316923euoutp01P
	for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Oct 2025 10:10:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251027101037euoutp0187aee13783e6eb4d4e3829cb048ffb16~yUVbgeEA21692316923euoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761559837;
	bh=kjtZ46mKxcAZEjgPl9ePNwMP7oO67THVIgGEnXxmoM0=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=axWEOmC70gHOm39hC8GP/zReg8axV9+eFQ3HLmdgPYoPsiA40d+0NIlGnp4QKJblz
	 WGYHy07IL7qlunLGseqzDclzoTe02QvUhIjrs8R2qg39b1S3YjoN5KAltZ9p2U83GX
	 Hu7QSQZ8cGtu/bBHGyWBZ5r49lU2x2EjKGK6SQ6U=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251027101037eucas1p2dedce2e04e84192fc3dacdcbb40b3f66~yUVa488jc3237932379eucas1p2O;
	Mon, 27 Oct 2025 10:10:37 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251027101036eusmtip2de8b59ef890511949d68a84de3fee204~yUVaWyEkV2011620116eusmtip2h;
	Mon, 27 Oct 2025 10:10:36 +0000 (GMT)
Message-ID: <deeeba6b-af85-44ad-ad78-efa7e923621a@samsung.com>
Date: Mon, 27 Oct 2025 11:10:36 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] pmdomain: samsung: Rework legacy splash-screen handover
 workaround
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
	<andre.draszik@linaro.org>, Peter Griffin <peter.griffin@linaro.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <cf9bc771-78a0-4439-a913-dfb8bd62c46c@kernel.org>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251027101037eucas1p2dedce2e04e84192fc3dacdcbb40b3f66
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251024093617eucas1p2a84deaa88e39692fd4933d14684aaeb9
X-EPHeader: CA
X-CMS-RootMailID: 20251024093617eucas1p2a84deaa88e39692fd4933d14684aaeb9
References: <CGME20251024093617eucas1p2a84deaa88e39692fd4933d14684aaeb9@eucas1p2.samsung.com>
	<20251024093603.3484783-1-m.szyprowski@samsung.com>
	<cf9bc771-78a0-4439-a913-dfb8bd62c46c@kernel.org>

On 24.10.2025 13:21, Krzysztof Kozlowski wrote:
> On 24/10/2025 11:36, Marek Szyprowski wrote:
>> Limit the workaround for splash-screen handover handling to the affected
>> power domains in legacy ARM 32bit systems and replace forcing a
>> sync_state by explicite power domain shutdown. This approach lets
>> compiler to optimize it out on newer ARM 64bit systems.
>>
>> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
>> Fixes: 0745658aebbe ("pmdomain: samsung: Fix splash-screen handover by enforcing a sync_state")
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/pmdomain/samsung/exynos-pm-domains.c | 19 ++++++++++---------
>>   1 file changed, 10 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
>> index f53e1bd24798..8e7ac1ab0780 100644
>> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
>> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
>> @@ -128,6 +128,16 @@ static int exynos_pd_probe(struct platform_device *pdev)
>>   	pd->pd.power_on = exynos_pd_power_on;
>>   	pd->local_pwr_cfg = pm_domain_cfg->local_pwr_cfg;
>>   
>> +	/*
>> +	 * Some Samsung platforms with bootloaders turning on the splash-screen
>> +	 * and handing it over to the kernel, requires the power-domains to be
>> +	 * reset during boot.
>> +	 */
>> +	if (IS_ENABLED(CONFIG_ARM) &&
>> +	    of_device_is_compatible(np, "samsung,exynos4210-pd") &&
>> +	    (strstr(pd->pd.name, "LCD") || strstr(pd->pd.name, "DISP")))
>
> I thought you folks speak theoretically to point which power domains are
> relevant here, not for real relying on labels. Labels are not an ABI,
> these are user informative strings. If you wanted them to be ABI, then
> the values would have to be documented.... and then they wouldn't be
> user informative strings :/

Frankly speaking... we can drop label checks and simply always turn off 
all the 'exynos4210-pd'-style domains and it will just work. I've just 
tested that to be sure.

If this sounds like a bit rude hack, then we can use 
GENPD_FLAG_NO_STAY_ON workaround (like Rockchip and Renesas).

> If these were different devices, we would need front compatibles, but
> since this is purely a bootloader stage, then we need a property for
> that. Something like regulator-boot-on.

Just to clarify - this splash screen issue has not much with power 
domain driver itself, but a side-effect of old genpd behavior has hidden 
this issue deep enough that it was ignored for years.

I think that it is now too late to add anything to the protocol between 
the bootloader and kernel to pass the information about splash-screen, 
so easiest way is to stick to old approach.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


