Return-Path: <linux-samsung-soc+bounces-11022-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FD7B56FA8
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 15 Sep 2025 07:11:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E92A167C69
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 15 Sep 2025 05:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 316E8277CB6;
	Mon, 15 Sep 2025 05:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="sTSJagWL"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CAE8274B42
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Sep 2025 05:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757913074; cv=none; b=X3uRaB4lBLCx641hAEOcLkEpgB/YJRGiI8MCAB+CF+9OYZp/HbSCvtVmXNzklOsPWr4hIy1a2yV6ureQazD1JT0WRYdPzBjLA3V1D6QsEll3V2dDsWVVjptvnXf/Eson4r/2egd1equSEcZZ4FFVvxV9GiNRtL9ruvCah63JD7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757913074; c=relaxed/simple;
	bh=gQ4356ubTnt/7Svy5h8IRy0Tzj9khjjlW3Nl+PzwwKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=oRKDzddQptkVUulQAJjzLEAGAR3s5SIPjpTSI/vYEnTZhyG8VduhrfEZypIBKqeELHJRQuQTdgWV2QFPJPQBtQ4uo8w7lKTLEhncKNL0if27NWTpB0tzTV/nslyLXAd5nXdi6skB+NoozX650lqrEr/J6uuVp0q/3RP/rqIgcR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=sTSJagWL; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250915051108epoutp03080e84e310479088244f19c00f6d9360~lXJ8mOOU52594725947epoutp03o
	for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Sep 2025 05:11:08 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250915051108epoutp03080e84e310479088244f19c00f6d9360~lXJ8mOOU52594725947epoutp03o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757913068;
	bh=Qtqck/gpVB4ju4zZiFzaFJ+MV8r04EU/eAiQG9DA2kU=;
	h=From:To:Cc:Subject:Date:References:From;
	b=sTSJagWLuoMvhkRIfGldifYu9jDDkxC1rDeol/b51PkWJSkoL46xYVJH2iiZlDDCp
	 eiGVsulECiPJMRcZ1BkHLDzFR5NHQ74m4+xPJQjWrp43bly0Dulc1HjYMqAaxK2y0y
	 tNxp8g4pQ9gYLaoe8lOjZoO/16QwKLUlqfCaTMeM=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
	20250915051107epcas2p1b2da98d21c1af3159b3be2e7cd1d33ab~lXJ76u2CS3200232002epcas2p1L;
	Mon, 15 Sep 2025 05:11:07 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.102]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cQCmW08qJz2SSKv; Mon, 15 Sep
	2025 05:11:07 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250915051106epcas2p19c54f69c993621430aac622c6865919b~lXJ6xOlrR3117831178epcas2p1e;
	Mon, 15 Sep 2025 05:11:06 +0000 (GMT)
Received: from tayo (unknown [10.229.9.198]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250915051106epsmtip1ea10842bfde3976dc3dc3e1101d27762~lXJ6p1qNv0859208592epsmtip1G;
	Mon, 15 Sep 2025 05:11:06 +0000 (GMT)
From: "myunggeun.ji" <myunggeun.ji@samsung.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev
Cc: Jongho Park <jongho0910.park@samsung.com>, kiisung lee
	<kiisung.lee@samsung.com>, "myunggeun.ji" <myunggeun.ji@samsung.com>
Subject: [PATCH 0/2] update exynos-iommu code and device tree for v9
Date: Mon, 15 Sep 2025 14:13:18 +0900
Message-ID: <20250915051320.3378957-1-myunggeun.ji@samsung.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250915051106epcas2p19c54f69c993621430aac622c6865919b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250915051106epcas2p19c54f69c993621430aac622c6865919b
References: <CGME20250915051106epcas2p19c54f69c993621430aac622c6865919b@epcas2p1.samsung.com>

Series updates exynos-iommu code and device tree to support
for ExynosAuto sysMMU version v9.
It provides initial driver code and register information the sysMMU device.

myunggeun.ji (2):
  iommu/exynos: Implement register set and fault handling on SysMMU v9
  arm64: dts: exynosautov920: Add DT node for sysMMU

 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 21 ++++++
 drivers/iommu/exynos-iommu.c                  | 73 ++++++++++++++++---
 2 files changed, 85 insertions(+), 9 deletions(-)

-- 
2.50.1


