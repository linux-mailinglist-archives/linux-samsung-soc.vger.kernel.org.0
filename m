Return-Path: <linux-samsung-soc+bounces-10137-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9D9B2C55C
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 19 Aug 2025 15:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A145A727E32
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 19 Aug 2025 13:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B74B4350822;
	Tue, 19 Aug 2025 13:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="aewAol5l"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC15350824
	for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2025 13:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755609462; cv=none; b=TZDmMG7DL69zPM+GCHowhz8Ec1/MMsz4iqVkfFc9q/8n/pKOzCmzSDCBhu0C04Epo0J1x+ffXUsIR4j6ABLOknZD/TGPRcPxFGhZdxK5qktTYRRehP+Hrh/8lsscYyMWkWMNMV91sz60F2U/9n814KSFJ/RxhZiamxs2IEtxUBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755609462; c=relaxed/simple;
	bh=nG0shwu5Af2IAtJwhIwSsyeYiHqDtWvmiFEdtbQHXRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=tKveeic4FdwnyDPB1WxNAWSbhD5ZLlXOP0DdLxRxXtAX+rhYKF6WREbE0Pjyc48i0+h6iwy78d0YDBL962PwCy4Gr3qoxZgkc0o2yej4tcRPPd0QnTwCZtcPIetu5frPy+UMWiY+oRMsPXiXBhBa3Bi2Kz4745UhUbsC8d/1Ugs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=aewAol5l; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250819131732euoutp02c8b0cb758e957f2482ab8e2866089fa6~dLX7hOigj1520415204euoutp025
	for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2025 13:17:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250819131732euoutp02c8b0cb758e957f2482ab8e2866089fa6~dLX7hOigj1520415204euoutp025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755609452;
	bh=CCrSI/5l0BXky7ygaJO0nnEAoj1y+QoRh+iorwK/S9g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aewAol5lYAJ8eG7/zvbkSEFrBbSbgMx3xnQ335/aTnRditX8ZZA+zrbCF6hOnorT8
	 a8LcF/h45ia6VDAlz6KOQDCrhJwuj8hSUUqrM0otLdAppM7fTV6fS6mx9V45NS2JKV
	 +UdoCaiT0ncEBjgP1L5Pt/BMC4SKD9sbGLodbF74=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250819131732eucas1p26bd491e9b6b747a4857905bfd50420a9~dLX63YhkO2802028020eucas1p2H;
	Tue, 19 Aug 2025 13:17:32 +0000 (GMT)
Received: from AMDC4515.digital.local (unknown [106.120.51.28]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250819131730eusmtip128fc54e219f6ff267b532cbfe63a317a~dLX5zXH3-0466004660eusmtip1F;
	Tue, 19 Aug 2025 13:17:30 +0000 (GMT)
From: Mateusz Majewski <m.majewski2@samsung.com>
To: linux.amoon@gmail.com
Cc: alim.akhtar@samsung.com, bzolnier@gmail.com, daniel.lezcano@linaro.org,
	justinstitt@google.com, krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	llvm@lists.linux.dev, lukasz.luba@arm.com, m.majewski2@samsung.com,
	morbo@google.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
	rafael@kernel.org, rui.zhang@intel.com
Subject: Re: [PATCH v7 6/7] thermal/drivers/exynos: Handle temperature
 threshold IRQs with SoC-specific mapping
Date: Tue, 19 Aug 2025 15:17:04 +0200
Message-ID: <20250819131704.19780-1-m.majewski2@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813131007.343402-7-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250819131732eucas1p26bd491e9b6b747a4857905bfd50420a9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250819131732eucas1p26bd491e9b6b747a4857905bfd50420a9
X-EPHeader: CA
X-CMS-RootMailID: 20250819131732eucas1p26bd491e9b6b747a4857905bfd50420a9
References: <20250813131007.343402-7-linux.amoon@gmail.com>
	<CGME20250819131732eucas1p26bd491e9b6b747a4857905bfd50420a9@eucas1p2.samsung.com>

Hello :)

> +/* Map Rise and Falling edges for IRQ Clean */
> +struct tmu_irq_map {
> +	u32 fall[3];
> +	u32 rise[3];
> +};

Hmm, we can probably get away with less interrupts. We actually only
enable one fall interrupt in tmu_set_low_temp and one rise interrupt in
tmu_set_high_temp.

Regarding tmu_set_crit_temp, on SoCs that have hardware thermal tripping
there is nothing to clear. On others we will reboot immediately anyway,
though maybe there is nothing wrong with clearing the interrupt
beforehand? Regardless of this, there is only a rise critical
temperature interrupt, we never set a matching fall interrupt.

Maybe it would also be good to add a bool to this struct containing
information about whether a fall interrupt is in use, and reuse
the same logic for 4210?

(Nitpick: I am not a native speaker of English, but I think "clean" and
"clear" have slightly different meanings, and the rest of the code
consistently uses "clear", so it would be worthwhile to also use "clear"
here.)

> +	/* Set SoC-specific interrupt bit mappings */
> +	switch (data->soc) {
> +	case SOC_ARCH_EXYNOS3250:
> +	case SOC_ARCH_EXYNOS4412:
> +	case SOC_ARCH_EXYNOS5250:
> +	case SOC_ARCH_EXYNOS5260:
> +		irq_map.fall[2] = BIT(20);
> +		irq_map.fall[1] = BIT(16);
> +		irq_map.fall[0] = BIT(12);
> +		irq_map.rise[2] = BIT(8);
> +		irq_map.rise[1] = BIT(4);
> +		irq_map.rise[0] = BIT(0);
> +		break;
> +	case SOC_ARCH_EXYNOS5420:
> +	case SOC_ARCH_EXYNOS5420_TRIMINFO:
> +		irq_map.fall[2] = BIT(24);
> +		irq_map.fall[1] = BIT(20);
> +		irq_map.fall[0] = BIT(16);
> +		irq_map.rise[2] = BIT(8);
> +		irq_map.rise[1] = BIT(4);
> +		irq_map.rise[0] = BIT(0);
> +		break;
> +	case SOC_ARCH_EXYNOS5433:
> +	case SOC_ARCH_EXYNOS7:
> +		irq_map.fall[2] = BIT(23);
> +		irq_map.fall[1] = BIT(17);
> +		irq_map.fall[0] = BIT(16);
> +		irq_map.rise[2] = BIT(7);
> +		irq_map.rise[1] = BIT(1);
> +		irq_map.rise[0] = BIT(0);
> +		break;
> +	default:
> +		pr_warn("exynos-tmu: Unknown SoC type %d, using fallback IRQ mapping\n", soc);
> +		break;

Maybe put irq_map inside exynos_tmu_data? exynos_map_dt_data has a
switch block that is quite similar, in that it also matches on the SoC
type. This way also there is no need to have a fallback.

Kind regards,
Mateusz Majewski

