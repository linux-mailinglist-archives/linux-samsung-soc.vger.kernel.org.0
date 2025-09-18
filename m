Return-Path: <linux-samsung-soc+bounces-10691-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 100FCB416C9
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  3 Sep 2025 09:37:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C42313AE8CE
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  3 Sep 2025 07:37:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDCA72DCF56;
	Wed,  3 Sep 2025 07:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="c7/JdKyn"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF452D97AC
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Sep 2025 07:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756885019; cv=none; b=A2Qf7n91G1elYBxc9G2VmFh+66ar8ri26x1A9VZew2UYuO2t3hdORH5H7zPzoBnWsRELXFe1OYKz9OT0/WamIzxg1c0Z6sDzUp5JFl8B8SWJbQEkrb4i29Z7MSH+Qpk4dLFhpl5um93LC6mbOVvq3wIxS6z3X/7Fy8rQ/e8lEsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756885019; c=relaxed/simple;
	bh=oI9ruJXE3Tfc8ztXuSdTu88fF7VUxQLNLARHE417v/w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=Uu3m3tq5J5daKvWQyXjs4EzxxxOI1eS4qA6ja2lU0B41SFmG92LvCE2SGNQbVQdwwp77qpc/y4Z+Ns6swaEoQ1mGzeS20cyBEwL25MS9ih8F0xxRnXfwfqvH+xoWdZYp+/iSl/PEACXVVHpHsVu1pYdBT+xBU0534Q24x7DASXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=c7/JdKyn; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250903073655epoutp042910ab87df6eecff60c3c44777676304~htZzuLrfF0892308923epoutp04-
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Sep 2025 07:36:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250903073655epoutp042910ab87df6eecff60c3c44777676304~htZzuLrfF0892308923epoutp04-
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756885015;
	bh=C12f3ohxzfB7ELhKTKFriefQ22srh7Dm7SaUfSw9ItU=;
	h=From:To:Cc:Subject:Date:References:From;
	b=c7/JdKyn/F49h+qTEcpbCur/8gcRIn6vSjY5zLeR+CxRp+/zMwcPToPlAv7kKfXv5
	 /kSXJz8riaYpfO/GsDBr6dZ2chwTdTaYLWgC+lXQGZkmqCe8VgZ3h7VYH8x79B74rv
	 mw5ruNare//yysMwFJvmTeew2LWX1QYstdoJmtAQ=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250903073654epcas2p2fc7ce62b8c242ddfec893d303b523a5e~htZzMZIvH0888008880epcas2p2L;
	Wed,  3 Sep 2025 07:36:54 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.99]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cGvZG0kxsz2SSKn; Wed,  3 Sep
	2025 07:36:54 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250903073653epcas2p49e89e5face6059bc8a58f212faa835d1~htZx8PTcr0925409254epcas2p4v;
	Wed,  3 Sep 2025 07:36:53 +0000 (GMT)
Received: from asswp60 (unknown [10.229.9.60]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250903073653epsmtip27f0a34b766443223f32830a2ec8775eb~htZx3tggi2959129591epsmtip2E;
	Wed,  3 Sep 2025 07:36:53 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Shin Son <shin.son@samsung.com>, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Add exynosautov920 thermal support
Date: Wed,  3 Sep 2025 16:36:31 +0900
Message-ID: <20250903073634.1898865-1-shin.son@samsung.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250903073653epcas2p49e89e5face6059bc8a58f212faa835d1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250903073653epcas2p49e89e5face6059bc8a58f212faa835d1
References: <CGME20250903073653epcas2p49e89e5face6059bc8a58f212faa835d1@epcas2p4.samsung.com>

This patch series adds support for exynosautov920, automotive-grade
processor. Although the exynosautov920's TMU hardware differs slightly
from exisiting platform, its read and calibration logic closely follow
our legacy TMU interface. To prevent runtime and build time errors,
it is kept as a single change rather than being split.

This change merges the new exynosautov920-specific register definitions and
timing parameters into the exynos-tmu driver, ensuring consistent behavior
across all Exynos series. All new code paths have been tested on a
exynosautov920 board and verified to correctly read temperatures and
emulate behavior.

Changes in v2:
- Replace the generic property with a vendor-specific one.
- Added an indices property instead of ranges.
- Shortened thermal node name and made them more generic.
- Updated the indices logic accordingly after removing the ranges property.

Shin Son (3):
  dt-bindings: thermal: samsung: Add tmu-name and sensor-index-ranges
    properties
  thermal: exynos_tmu: Support new hardware and update TMU interface
  arm64: dts: exynosautov920: Add tmu hardware binding

 .../thermal/samsung,exynos-thermal.yaml       |  16 +-
 .../boot/dts/exynos/exynosautov920-tmu.dtsi   |  97 +++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  31 ++
 drivers/thermal/samsung/exynos_tmu.c          | 340 ++++++++++++++++--
 4 files changed, 446 insertions(+), 38 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov920-tmu.dtsi

-- 
2.50.1


