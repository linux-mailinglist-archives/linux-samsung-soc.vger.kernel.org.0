Return-Path: <linux-samsung-soc+bounces-11205-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE61FB9D261
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Sep 2025 04:29:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7E9353ACD88
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Sep 2025 02:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A13732E5B09;
	Thu, 25 Sep 2025 02:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="PuwQHNZN"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700A32727E7
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2025 02:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758767333; cv=none; b=jEmInb65w4qrT/HVINZtWHH7Q9OquAM2z3vosgVxvjSZH88khPgWySNbU0TZc1YVPuYVxc+I0BUAymv8oQo36sJgDr3CQQbuhhUXVC8enR6Qk/LCe3xeo+ZgZRDi692wl4+Vp5Qj5o7vmz5KKD5UKln9VrTbe6dHSxO4PU443p0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758767333; c=relaxed/simple;
	bh=eB2QG+C+P97c/tSoxst9JkcyqcgdRgAYbiUw12PYgLA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=j4ZE17Al3ErdGe/TsPz7TBJp8U23ETtgEBwrl7c19YgjL/9Ecz3S1wD6CoF1XVIPsJTjFc4Ls5U418gFTsXC4F5b9CZ1/4Ah6ZXT6HK+cvONt2OceDkaO+lVxdFchbajuThPzYFAyWUI5wc5/sjLQI3rZ2Y75Sq5yHy7F6qHVIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=PuwQHNZN; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250925022847epoutp03dafd1ed15bee917febfad43e448b3875~oZZDhwGx91661316613epoutp03f
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2025 02:28:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250925022847epoutp03dafd1ed15bee917febfad43e448b3875~oZZDhwGx91661316613epoutp03f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758767327;
	bh=5U4ssfLObfMrsZsYwgUd8+iN9wTGTk9ZQLRuKX7hC5I=;
	h=From:To:Cc:Subject:Date:References:From;
	b=PuwQHNZNmwXlqhTtc6OpmWFWSN7s3bljFkDGZfqLb4HHU/fjKQevLgqPcgweI7d0r
	 9e5wg8xJ0SLIorxEPBdWzuRQIKGKsBN0zoiE6znfKpd5zEPX41PCqi1FdL5DMsngrf
	 ZbcvAqUlf2e6A0P69mavgbeLvHzl7XK2Q8vm0s6U=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250925022846epcas2p4aff00abcd39f8d88bd05747e85d55a84~oZZDFPiWe1518815188epcas2p4O;
	Thu, 25 Sep 2025 02:28:46 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cXHhZ2VBzz6B9mG; Thu, 25 Sep
	2025 02:28:46 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20250925022845epcas2p2b0e2bbe2e7674f408ae6404ac66a8627~oZZB3Wd0F2876028760epcas2p2u;
	Thu, 25 Sep 2025 02:28:45 +0000 (GMT)
Received: from asswp60 (unknown [10.229.9.60]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250925022845epsmtip1f371dfbcfc01419492d52c76434048cf~oZZBxRpD-2348123481epsmtip1K;
	Thu, 25 Sep 2025 02:28:45 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Henrik Grimler
	<henrik@grimler.se>
Cc: Shin Son <shin.son@samsung.com>, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 0/3] Add exynosautov920 thermal support
Date: Thu, 25 Sep 2025 11:28:37 +0900
Message-ID: <20250925022841.2813150-1-shin.son@samsung.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250925022845epcas2p2b0e2bbe2e7674f408ae6404ac66a8627
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250925022845epcas2p2b0e2bbe2e7674f408ae6404ac66a8627
References: <CGME20250925022845epcas2p2b0e2bbe2e7674f408ae6404ac66a8627@epcas2p2.samsung.com>

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

Changes in v5:
- Changed the maximum number of thermal sensors to 15.

Changes in v4:
- Kept 'addtionalProperties: false'.
- Removed the 'samsung,hw-sensor-indices' property in the binding.
- Added the 'samsung,sensors' property in the binding.
- Dropped code-like formatting and rewrote the description in plain,
  hardware-focused language in the commit message.
- Removed the bitmap and replaced the tz_count to sensor_count.

Changes in v3:
- Removed redundant commit message.
- Rephrased the sentences to describe the hardware clearly.
- Restricted sensor indices to V920.
- Set #thermal-sensor-cells per variant.
- Replaced 'additionalProperties' with 'unevaluatedProperties'.
- Removed the duplicate #define and use the original.
- Used lowercase hex in #define.
- Simplified 'temp_to_code' and 'code_to_temp' to one computation
  path by normalizing calib_temp.

Changes in v2:
- Replace the generic property with a vendor-specific one.
- Added an indices property instead of ranges.
- Shortened thermal node name and made them more generic.
- Updated the indices logic accordingly after removing the ranges property.

Shin Son (3):
  dt-bindings: thermal: samsung: Adjust '#thermal-sensor-cells' to 1
  thermal: exynos_tmu: Support new hardware and update TMU interface
  arm64: dts: exynosautov920: Add multiple sensors

 .../thermal/samsung,exynos-thermal.yaml       |  32 +-
 .../boot/dts/exynos/exynosautov920-tmu.dtsi   | 377 ++++++++++++++++++
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |  31 ++
 drivers/thermal/samsung/exynos_tmu.c          | 322 +++++++++++++--
 4 files changed, 724 insertions(+), 38 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov920-tmu.dtsi

-- 
2.50.1


