Return-Path: <linux-samsung-soc+bounces-8859-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4A0ADEAE6
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 18 Jun 2025 13:52:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E533717D6C3
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 18 Jun 2025 11:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC05E29ACEA;
	Wed, 18 Jun 2025 11:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Llo+EfXz"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A654276059
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 11:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750247544; cv=none; b=NXqZuou3pF2C0Q/Jsvyumm1TXqkog5uVXNXPvgdLM3BgM5poy8wcuE9/BIUHiyuWbiDr5Yns8WFsjwFes596jMYhXF1+VzzWPQT4myuTpvJ+76a4kr0cmvbAGhkd1JHtKYvIl4TyacZpIqMJN809Ps8DmNzwGIhn1IW8tnhEhiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750247544; c=relaxed/simple;
	bh=S9pnGPpEopS2ae2vMlJNmzVk/y9G0wooLQGCC/s9bSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=gVYA4lm9MiXIpG5gCzKDngSsgOx9ux0kNEiUWLq3otkuEv2GuetyuW3zzLqXocZHpkBu+Fo9QmCDB1OXYIaW9dgwKoSinJMvjBUbP9ZuUFPitRxCcJgxG+NdgYNWSvmHIoJaoeBDPHq3MhrEh08GdC68ci56qjokORVUmmxkVwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Llo+EfXz; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250618115220euoutp02d9becb2e51379fb06dad6813a2d61594~KIN12zMnf3262532625euoutp02c
	for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Jun 2025 11:52:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250618115220euoutp02d9becb2e51379fb06dad6813a2d61594~KIN12zMnf3262532625euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750247540;
	bh=m79J0HkRILX18o9YHg3zwFo1BQ7buYBrq3hUc2UmA0Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Llo+EfXzP1oOgMXB4bWM18AUmwsFEtwyMYVLGKRTfVpf1E13mpK5MD3seMzN4ImiC
	 3UER7TFNfBcA1ghElrDeQIj5A+udaRkJnHoh1Iys8bco0T0CQ4OBeCmlFB/zjoPcJB
	 dSLPq592DzDWzpMEF5NjhjnIi7MxtFSQJes5gzF4=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250618115220eucas1p2b9d37e8cdd1997fa010f51cecdea5e4f~KIN1bTnxw1996919969eucas1p2k;
	Wed, 18 Jun 2025 11:52:20 +0000 (GMT)
Received: from AMDC4515.digital.local (unknown [106.120.51.28]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250618115219eusmtip18897b4f23ab32963bdf77ba1539d4e47~KIN01wgHH0059000590eusmtip1T;
	Wed, 18 Jun 2025 11:52:19 +0000 (GMT)
From: Mateusz Majewski <m.majewski2@samsung.com>
To: linux.amoon@gmail.com
Cc: alim.akhtar@samsung.com, bzolnier@gmail.com, daniel.lezcano@linaro.org,
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, lukasz.luba@arm.com, rafael@kernel.org,
	rui.zhang@intel.com, Mateusz Majewski <m.majewski2@samsung.com>
Subject: Re: [RRC v1 2/3] thermal/drivers/exynos: Handle temperature
 threshold interrupts and clear corresponding IRQs
Date: Wed, 18 Jun 2025 13:52:11 +0200
Message-ID: <20250618115211.2239335-1-m.majewski2@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250616163831.8138-3-linux.amoon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250618115220eucas1p2b9d37e8cdd1997fa010f51cecdea5e4f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250618115220eucas1p2b9d37e8cdd1997fa010f51cecdea5e4f
X-EPHeader: CA
X-CMS-RootMailID: 20250618115220eucas1p2b9d37e8cdd1997fa010f51cecdea5e4f
References: <20250616163831.8138-3-linux.amoon@gmail.com>
	<CGME20250618115220eucas1p2b9d37e8cdd1997fa010f51cecdea5e4f@eucas1p2.samsung.com>

Hello :)

> +#define INTSTAT_FALL2	BIT(24)
> +#define INTSTAT_FALL1	BIT(20)
> +#define INTSTAT_FALL0	BIT(16)
> +#define INTSTAT_RISE2	BIT(8)
> +#define INTSTAT_RISE1	BIT(4)
> +#define INTSTAT_RISE0	BIT(0)
> +
> +#define INTCLEAR_FALL2	BIT(24)
> +#define INTCLEAR_FALL1	BIT(20)
> +#define INTCLEAR_FALL0	BIT(16)
> +#define INTCLEAR_RISE2	BIT(8)
> +#define INTCLEAR_RISE1	BIT(4)
> +#define INTCLEAR_RISE0	BIT(0)

> +	/* Map INTSTAT bits to INTCLEAR bits */
> +	if (val_irq & INTSTAT_FALL2)
> +		clearirq |= INTCLEAR_FALL2;
> +	else if (val_irq & INTSTAT_FALL1)
> +		clearirq |= INTCLEAR_FALL1;
> +	else if (val_irq & INTSTAT_FALL0)
> +		clearirq |= INTCLEAR_FALL0;
> +	else if (val_irq & INTSTAT_RISE2)
> +		clearirq |= INTCLEAR_RISE2;
> +	else if (val_irq & INTSTAT_RISE1)
> +		clearirq |= INTCLEAR_RISE1;
> +	else if (val_irq & INTSTAT_RISE0)
> +		clearirq |= INTCLEAR_RISE0;

This implies that only these 6 bits are used. Is this true for all SoCs
supported by this driver? My understanding is that Exynos 5433 in particular
uses bits 7:0 for rise interrupts and 23:16 for fall interrupts. When I tested
this patch (both alone and the whole series) on 5433 by running some CPU load,
the interrupt seemed to not fire consistently:
/sys/class/thermal/cooling_device1/cur_state would never go above 1 (which is
consistent with the interrupt firing once, not getting cleared and never firing
again; without this patch, it consistently went up to 6) and I got a quick
reboot every time.

Thank you,
Mateusz Majewski

