Return-Path: <linux-samsung-soc+bounces-10139-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFF6B2C63D
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 19 Aug 2025 15:54:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D8A8560C58
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 19 Aug 2025 13:48:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 655F7341ACD;
	Tue, 19 Aug 2025 13:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="iDuI4579"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C180341AB3
	for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2025 13:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755611288; cv=none; b=e9hf6mau4G2K5aPd3WEcz95ii79QhMRjbJddQoxToN6Tcaq8oGmcR+WjdTkCqlu++sKQ7SL49/xpgD1Idw6Hh7nd0p4pEairGtBO2mHPZjh3sfBN6VmDxeap4tSKaFJA1q1iELCxdgU6xA/y4gr7b8BIy2vfSBSL0YfZX5Wuiqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755611288; c=relaxed/simple;
	bh=WgxoQGTefGQy6krhXNt6jyY6Ogd2/MoAfO4+6xkHD0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=bFk2mUr0ei1ip5Q/RTgUJTSaMnw1O3zlcUOelHDvjVAsVhetMyzVcbVoN9EJGs5GxsDAVnTHWBGdnOSVOgQsq9MhPr072NTh2PZsgQB4NeXwuolyTWWpam88MdLO6L7c+EjTAher1bBkaCsKsvfsdhQALY3DrAWcxW7K1/CfNJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=iDuI4579; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250819134805euoutp019976ca5a2f89a1d478dcda935fcd8d7a~dLyl_arGx2265022650euoutp01z
	for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Aug 2025 13:48:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250819134805euoutp019976ca5a2f89a1d478dcda935fcd8d7a~dLyl_arGx2265022650euoutp01z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755611285;
	bh=rNNRF4Z64xSeC0TtYIjoq13C5zAXQshZP/bVM+z+NiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iDuI4579/yT2PSmol4tFFkDPplMZDmKc2g2rMu5dRM4X5bFq8Mp9N9d8ms5MibZt7
	 368lvC9S/XM+zfdLWHKDyLl7aVWbm3yIS0yqTu3B0yEvgwuioypHKq/KuZhwAp+6ps
	 UvZGL7usRQvkKiZq+w9jzFcXFra/MftkQdpbXkm8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250819134804eucas1p1ed14f9680e66327a86af4e98319eed11~dLylHjeKm2798127981eucas1p1o;
	Tue, 19 Aug 2025 13:48:04 +0000 (GMT)
Received: from AMDC4515.digital.local (unknown [106.120.51.28]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250819134803eusmtip14d110ea7c0e1c86224f6c2ecf32b88ba~dLykUPeUf2742627426eusmtip1o;
	Tue, 19 Aug 2025 13:48:03 +0000 (GMT)
From: Mateusz Majewski <m.majewski2@samsung.com>
To: m.majewski2@samsung.com
Cc: alim.akhtar@samsung.com, bzolnier@gmail.com, daniel.lezcano@linaro.org,
	justinstitt@google.com, krzk@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	linux.amoon@gmail.com, llvm@lists.linux.dev, lukasz.luba@arm.com,
	morbo@google.com, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
	rafael@kernel.org, rui.zhang@intel.com
Subject: Re: [PATCH v7 6/7] thermal/drivers/exynos: Handle temperature
 threshold IRQs with SoC-specific mapping
Date: Tue, 19 Aug 2025 15:47:55 +0200
Message-ID: <20250819134755.92187-1-m.majewski2@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250819131704.19780-1-m.majewski2@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250819134804eucas1p1ed14f9680e66327a86af4e98319eed11
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250819134804eucas1p1ed14f9680e66327a86af4e98319eed11
X-EPHeader: CA
X-CMS-RootMailID: 20250819134804eucas1p1ed14f9680e66327a86af4e98319eed11
References: <20250819131704.19780-1-m.majewski2@samsung.com>
	<CGME20250819134804eucas1p1ed14f9680e66327a86af4e98319eed11@eucas1p1.samsung.com>

> +		pr_warn("exynos-tmu: Unknown SoC type %d, using fallback IRQ mapping\n", soc);

I missed this when writing the previous reply, but this doesn't build:
"soc" should be "data->soc". This line disappears in 7/7 though, so 7/7
builds just fine for me.

Kind regards,
Mateusz Majewski

