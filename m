Return-Path: <linux-samsung-soc+bounces-8960-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC8DAE86AC
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 25 Jun 2025 16:38:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 147B8170B4A
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 25 Jun 2025 14:38:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C50267F58;
	Wed, 25 Jun 2025 14:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="pFfPPfbC"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96989267F4C
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2025 14:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750862309; cv=none; b=csJMxo1Vij2hD9DJOvvT7TkrCx18SkgUK8tYP+VGl9IGSAvHT7J0GLPQ4oUqvfUklKpS4qrTVZHPx9n9V3IPuTBxCVjQuxZxi6JUujWIp2MdejaFP4JkC3jUfCyjThTaqrgxSerU8bn3qpdLBUWOHSyNhcEaybYaSVyhZD9BOSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750862309; c=relaxed/simple;
	bh=8XoLBFN4X2J53c6WkchgBiFl2rLtXlJ2Jsji10lKYfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=ZN1iNZChFeaJcwpQ9yvlseg7emoUBu3jns1+SnBiZdckUUKwVlB69CZBQP5Ge66lXNBnmC+grn1Hj45yIM8Skmqx6mYW6DghAcxS1njz7n8KvkoKrIXPtylmXBUGy28kYHxhyK5vUoqiQQiJlZ5YDFYAxfYUTS3T05X+iKMOk40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=pFfPPfbC; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250625143825euoutp011bceac2e5a1ac3e91518668c937bebb8~MT-2knFzZ1464714647euoutp01F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2025 14:38:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250625143825euoutp011bceac2e5a1ac3e91518668c937bebb8~MT-2knFzZ1464714647euoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750862305;
	bh=8dqgP4LV8c4NLpBPDYGi8Zm3iZeMy9dNLyMC8hkw3Mc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pFfPPfbCvaLUthbd5ueG3UuOnIkNWM5+nnYQbrgJy/zkV7x6wH018ApoC5WRPVXVk
	 DNqXV4XI3CTYG+bVZ6qbnlZv6X+lp5OeMpEOXB3KglVE0okmNNYHB7rZpHqlY1ijEy
	 yKimBKL8bgumawwX1dKSSa4STJzAtrApaZ8K0Eek=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250625143825eucas1p2e95ba80552cd289b6e05db33f32ec14a~MT-2K9-ln3066230662eucas1p23;
	Wed, 25 Jun 2025 14:38:25 +0000 (GMT)
Received: from AMDC4515.digital.local (unknown [106.120.51.28]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250625143824eusmtip2d3f64e540b8e66266a364f9237f7259e~MT-1hnkPv1779917799eusmtip2T;
	Wed, 25 Jun 2025 14:38:24 +0000 (GMT)
From: Mateusz Majewski <m.majewski2@samsung.com>
To: linux.amoon@gmail.com
Cc: alim.akhtar@samsung.com, bzolnier@gmail.com, daniel.lezcano@linaro.org,
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, lukasz.luba@arm.com,
	m.majewski2@samsung.com, rafael@kernel.org, rui.zhang@intel.com
Subject: Re: [RRC v1 1/3] thermal/drivers/exynos: Remove unused base_second
 mapping and references
Date: Wed, 25 Jun 2025 16:38:16 +0200
Message-ID: <20250625143816.1146123-1-m.majewski2@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <CANAwSgTBzpL+XMJGhG=38A7GOzeayZaG_2LTvsaE2=mF-pn5mg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250625143825eucas1p2e95ba80552cd289b6e05db33f32ec14a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250625143825eucas1p2e95ba80552cd289b6e05db33f32ec14a
X-EPHeader: CA
X-CMS-RootMailID: 20250625143825eucas1p2e95ba80552cd289b6e05db33f32ec14a
References: <CANAwSgTBzpL+XMJGhG=38A7GOzeayZaG_2LTvsaE2=mF-pn5mg@mail.gmail.com>
	<CGME20250625143825eucas1p2e95ba80552cd289b6e05db33f32ec14a@eucas1p2.samsung.com>

> Can you check with with following changes
> 
> diff --git a/drivers/thermal/samsung/exynos_tmu.c
> b/drivers/thermal/samsung/exynos_tmu.c
> index 9fc085f4ea1a..0776801fafea 100644
> --- a/drivers/thermal/samsung/exynos_tmu.c
> +++ b/drivers/thermal/samsung/exynos_tmu.c
> @@ -469,14 +469,11 @@ static void exynos4412_tmu_initialize(struct
> platform_device *pdev)
>         ctrl = readl(data->base + EXYNOS_TMU_TRIMINFO_CON2);
>         ctrl = EXYNOS_TRIMINFO_RELOAD_ENABLE;
>         writel(ctrl, data->base + EXYNOS_TMU_TRIMINFO_CON2);
> +       return;
>     }
> 
> -   /* On exynos5420 the triminfo register is in the shared space */
> -   if (data->soc == SOC_ARCH_EXYNOS5420
> -           data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO) {
> -       trim_info = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
> -       sanitize_temp_error(data, trim_info);
> -   }
> +   trim_info = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
> +   sanitize_temp_error(data, trim_info);
> }

This does seem to work (tested on 3250 and on 5420) in the sense that I
can read the temperatures, when they increase the state of the cooling
device gets increased, and the values look reasonable and stay in a
reasonable range. Hard to say if the trim and the temperature values are
correct, though.

(FYI I will probably have a harder time regarding the drivers from
GitHub you linked in 2/3, so no promises on testing them.)

> As per my Exynos5422 user manual and DTS mapping
> thermal-sensor tmu@10060000 is mapped to CPU0 with tmu_apbif clock
> thermal-sensor tmu@10064000 is mapped to CPU1 with tmu_apbif clock
> thermal-sensor tmu@10068000 is mapped to CPU2 with tmu_apbif clock
> thermal-sensor tmu@1006c000 is mapped to CPU3 with tmu_apbif clock
> thermal-sensor tmu@100a0000 is mapped to GPU with tmu_triminfo_apbif clock.

Hmm, I might be missing something, but I think the DTS does link to two
adresses and two clocks, for instance for GPU (in
arch/arm/boot/dts/samsung/exynos5420.dtsi):

		tmu_gpu: tmu@100a0000 {
			compatible = "samsung,exynos5420-tmu-ext-triminfo";
			reg = <0x100a0000 0x100>, <0x10068000 0x4>;
			interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
			clocks = <&clock CLK_TMU_GPU>, <&clock CLK_TMU>;
			clock-names = "tmu_apbif", "tmu_triminfo_apbif";
			#thermal-sensor-cells = <0>;
		};

The manual does indeed not say anything about this, but I feel like the
current code in essence states that the manual is not correct. We
probably should have some evidence that the current code is wrong and
the manual was correct all along?

Thank you,
Mateusz Majewski

