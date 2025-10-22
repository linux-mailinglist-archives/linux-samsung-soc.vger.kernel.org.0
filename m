Return-Path: <linux-samsung-soc+bounces-11767-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F19DBFDE2D
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 22 Oct 2025 20:40:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD7721A07421
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 22 Oct 2025 18:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9350034E774;
	Wed, 22 Oct 2025 18:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tNOgdzIW"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17AA434DCEC
	for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Oct 2025 18:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761158401; cv=none; b=hFO0UYKJhdfz3qUGIyOaqnXayUvEdcKqjzZpDnVGZOk0kzWSMZsBzv5SbeXqkMNelfqbEtShZjYIWgPWVoNC2SUy2vPaMDmRPWZNi4E0w+peDkqty4ioujxB9qBJOXpxKBN7OqWk8rHnmOh1KurGMM4rQPfawtE1zawKPMc0k5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761158401; c=relaxed/simple;
	bh=e80XxCGjZ6AfVrLJhtuJErL90MhPg1iUfpNnujKXdwY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=rQHu5EMesUqkxYfNW+hIbkm2mvWQ0SI0oWy7LmzyODFuS3iWJYe/f0SWWEVLP7PgP/IhFdjmKTwPBgnObzS9IHlN2d5RcwiaNcECV3fq3BcB7bKDzvUjXKIts4dGdaTuvYIQAhmhkKwvutQ07sArbYy2eG99cqG2kkx9drcpMIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=tNOgdzIW; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251022183956euoutp015be1e65d3468f61bd365cb2371945202~w5Dr3cIWE1234312343euoutp01u
	for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Oct 2025 18:39:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251022183956euoutp015be1e65d3468f61bd365cb2371945202~w5Dr3cIWE1234312343euoutp01u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761158396;
	bh=Wp7PQxwpEUaf4NDF7jDHZA4RAc1DRUXdHx0e2Vlvfqo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=tNOgdzIWZtXNOZ/Hu/grKRy1A+gwmxnM47VoFiQiKQNuR9W0LmUvunUkvu9FtCdH3
	 gnDY6SgHxgHT8ebCxqR8dvZpfTxBGDc67utnUy3I3tECih9j19xdbSF9Ec/8Yq1yAp
	 l4ZiujU90fMBy4EJAgaVTe59N+5VAbU1bLmxYNEQ=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251022183955eucas1p23819de66a835c57747daa0136753c808~w5DrCgZAS0057800578eucas1p2Z;
	Wed, 22 Oct 2025 18:39:55 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251022183953eusmtip131c046506281f6642166831a3fe9c211~w5DpcncR60141601416eusmtip1Y;
	Wed, 22 Oct 2025 18:39:53 +0000 (GMT)
Message-ID: <57bacc06-8a5e-4284-a520-c5d2a56545e9@samsung.com>
Date: Wed, 22 Oct 2025 20:39:53 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v3 08/10] pmdomain: samsung: selectively handle enforced
 sync_state
To: Ulf Hansson <ulf.hansson@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
	<andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Peter
	Griffin <peter.griffin@linaro.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>,
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAPDyKFq2esPos=D-eVz6w1VXq=4LYi6fx54K4TvsUi4JqUJOaQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251022183955eucas1p23819de66a835c57747daa0136753c808
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251022110738eucas1p2cee28096ca5c9c6a802e2190d88ccf21
X-EPHeader: CA
X-CMS-RootMailID: 20251022110738eucas1p2cee28096ca5c9c6a802e2190d88ccf21
References: <20251016-gs101-pd-v3-0-7b30797396e7@linaro.org>
	<20251016-gs101-pd-v3-8-7b30797396e7@linaro.org>
	<CGME20251022110738eucas1p2cee28096ca5c9c6a802e2190d88ccf21@eucas1p2.samsung.com>
	<CAPDyKFq2esPos=D-eVz6w1VXq=4LYi6fx54K4TvsUi4JqUJOaQ@mail.gmail.com>

On 22.10.2025 13:06, Ulf Hansson wrote:
> On Thu, 16 Oct 2025 at 17:58, André Draszik <andre.draszik@linaro.org> wrote:
>> Unconditionally calling of_genpd_sync_state() causes issues on
>> platforms with child domains as the parent domain will be turned off
>> before the child domain was even registered during boot.
>>
>> This in particular is an issue for the upcoming Google gs101 support -
>> all operations on child domains registered after the parent domain
>> misbehave.
>>
>> Add a flag to the probe data to be able to sync_state conditionally
>> only, and enable that flag on the two platforms currently supported by
>> this driver.
>>
>> Signed-off-by: André Draszik <andre.draszik@linaro.org>
>>
>> ---
>> v2:
>> * use bool for need_early_sync_state (Krzysztof)
>> ---
>>   drivers/pmdomain/samsung/exynos-pm-domains.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
>> index 638d286b57f716140b2401092415644a6805870e..15a1582aa92103a07335eb681600d9415369fefd 100644
>> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
>> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
>> @@ -20,6 +20,7 @@
>>   struct exynos_pm_domain_config {
>>          /* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
>>          u32 local_pwr_cfg;
>> +       bool need_early_sync_state;
>>   };
>>
>>   /*
>> @@ -69,10 +70,12 @@ static int exynos_pd_power_off(struct generic_pm_domain *domain)
>>
>>   static const struct exynos_pm_domain_config exynos4210_cfg = {
>>          .local_pwr_cfg          = 0x7,
>> +       .need_early_sync_state  = true,
>>   };
>>
>>   static const struct exynos_pm_domain_config exynos5433_cfg = {
>>          .local_pwr_cfg          = 0xf,
>> +       .need_early_sync_state  = true,
>>   };
>>
>>   static const struct of_device_id exynos_pm_domain_of_match[] = {
>> @@ -179,7 +182,7 @@ static int exynos_pd_probe(struct platform_device *pdev)
>>           * reset during boot. As a temporary hack to manage this, let's enforce
>>           * a sync_state.
>>           */
>> -       if (!ret)
>> +       if (pm_domain_cfg->need_early_sync_state && !ret)
>>                  of_genpd_sync_state(np);
> The call to of_genpd_sync_state() was intended as a temporary solution here.
>
> Potentially, if we would be able to distinguish what PM domain that is
> causing the problem on the Exynos platforms, we could set
> GENPD_FLAG_NO_STAY_ON for that genpd instead.

Well, this of_genpd_sync_state() "workaround" has to be applied only to 
the power domain of the display controller device. It can be replaced by 
the following check on the legacy Exynos systems:

if (IS_ENABLED(CONFIG_ARM) &&
of_device_is_compatible(np, "samsung,exynos4210-pd") && 
(strstr(pd->pd.name, "LCD") || strstr(pd->pd.name, "DISP"))) 
pd->pd.flags = GENPD_FLAG_NO_STAY_ON;

I assume that this information cannot be coded in device tree to make it 
somehow generic...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


