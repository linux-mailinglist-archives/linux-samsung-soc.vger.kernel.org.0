Return-Path: <linux-samsung-soc+bounces-9332-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 904D1B01CDC
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 11 Jul 2025 15:06:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8853B43BC7
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 11 Jul 2025 13:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3C1D2D23B8;
	Fri, 11 Jul 2025 12:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="sJIjFK2h"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489072D23BA
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jul 2025 12:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752238752; cv=none; b=Zj/wAvq2MBJcgJiX1Lmagd8K/ZS51UthBncC9m+AXHSr6UPyKkZt2PSf/hI6PF9lYyYEhWn1nEtnsxL6YOnpvZIuhtruHcHkSDPgIU+X189OfRZq/qCgB8slVI/iIr4SDxFTi7km6Ab5y4D9ZVmfYkDyZCIUjxfjuCNlzlMp3vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752238752; c=relaxed/simple;
	bh=4M9ldy+V4oLhPUak4VZMhJhEiovbN8RCnFKfpUi5kl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=ghDOp2jX8GWjfEmU1gALgbYq02oTBBo4tRo07XmcylZsCxgsAjoHawy1Y33rff8yUI1yBKZyteUSgK3ezDoj+TeR6Xjp3VIDZk6OUUKzstLTFXVvgjdrwVexOuGG8RVPFEdaE7Bo+unwf5OdzgnqHYKlMwgQuIkC47l/yHJevHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=sJIjFK2h; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250711125907euoutp014dffae945ed597cb45603402f13a6c9c~RM9t4Wn7F3150331503euoutp01X
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jul 2025 12:59:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250711125907euoutp014dffae945ed597cb45603402f13a6c9c~RM9t4Wn7F3150331503euoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752238747;
	bh=3kDealCV6zffo4RuWYcZVJvSwU3t4q0xUuFSOKLwc8Q=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=sJIjFK2hjreora6isCVF4sSwqZooR1YZAfTELwJUidrX9mSB+CTKpaGsUaO80uubv
	 L1R7wxFaNIcD/bGKEGPmwl17W6BB26vIBjVCBSJufCtaLiw11GRKlqUzegaaZtpWLk
	 vmvRRgAvTAQIkL7Oet0Qxrt9jxXynaxQKN4XuPsc=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250711125906eucas1p1bdd63ed78efdc9e1ed419e3765f939c2~RM9tLOVmS2722427224eucas1p1u;
	Fri, 11 Jul 2025 12:59:06 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250711125906eusmtip1d00d7a0a16b6f50ed698eeeab2ff3a30~RM9saRIS00427404274eusmtip1O;
	Fri, 11 Jul 2025 12:59:06 +0000 (GMT)
Message-ID: <751b912d-48a5-416d-aa83-8947b952dd5e@samsung.com>
Date: Fri, 11 Jul 2025 14:59:05 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: samsung: Fix splash-screen handover by
 enforcing a sync_state
To: Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250711114719.189441-1-ulf.hansson@linaro.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250711125906eucas1p1bdd63ed78efdc9e1ed419e3765f939c2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250711114739eucas1p2e3b4b266d24dc239b8ef4f75da06e40b
X-EPHeader: CA
X-CMS-RootMailID: 20250711114739eucas1p2e3b4b266d24dc239b8ef4f75da06e40b
References: <CGME20250711114739eucas1p2e3b4b266d24dc239b8ef4f75da06e40b@eucas1p2.samsung.com>
	<20250711114719.189441-1-ulf.hansson@linaro.org>

On 11.07.2025 13:47, Ulf Hansson wrote:
> It's has been reported that some Samsung platforms fails to boot with
> genpd's new sync_state support.
>
> Typically the problem exists for platforms where bootloaders are turning on
> the splash-screen and handing it over to be managed by the kernel. However,
> at this point, it's not clear how to correctly solve the problem.
>
> Although, to make the platforms boot again, let's add a temporary hack in
> the samsung power-domain provider driver, which enforces a sync_state that
> allows the power-domains to be reset before consumer devices starts to be
> attached.
>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Link: https://lore.kernel.org/all/212a1a56-08a5-48a5-9e98-23de632168d0@samsung.com
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

This fixes the issue and seems to be a good workaround for now. Thanks!

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

I will work on the proper fix in 2 weeks after getting back from holidays.


> ---
>   drivers/pmdomain/samsung/exynos-pm-domains.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/drivers/pmdomain/samsung/exynos-pm-domains.c b/drivers/pmdomain/samsung/exynos-pm-domains.c
> index 9b502e8751d1..5d478bb37ad6 100644
> --- a/drivers/pmdomain/samsung/exynos-pm-domains.c
> +++ b/drivers/pmdomain/samsung/exynos-pm-domains.c
> @@ -147,6 +147,15 @@ static int exynos_pd_probe(struct platform_device *pdev)
>   				parent.np, child.np);
>   	}
>   
> +	/*
> +	 * Some Samsung platforms with bootloaders turning on the splash-screen
> +	 * and handing it over to the kernel, requires the power-domains to be
> +	 * reset during boot. As a temporary hack to manage this, let's enforce
> +	 * a sync_state.
> +	 */
> +	if (!ret)
> +		of_genpd_sync_state(np);
> +
>   	pm_runtime_enable(dev);
>   	return ret;
>   }

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


