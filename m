Return-Path: <linux-samsung-soc+bounces-9355-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8D3B0366B
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 14 Jul 2025 08:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB4F6189B4D3
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 14 Jul 2025 06:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 108D72264D6;
	Mon, 14 Jul 2025 05:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="TxYw3JIN"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 234B122257B
	for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Jul 2025 05:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752472748; cv=none; b=AL8Lp7dTLZ2bEByCSgVtN0EGbmKmmJv+UTBXFtfPXYcbKdihq3VOkBCV2yolfge2XcpvM0UmKHqGhE9CLb64QzH2EdHyvj+xpDH8nRg6pdDf5+PqypS6puGbOzWUcusJawAPsr6I+P4NFUNpfK63ZM3rJ1J7N7fGNLEOb1lYpvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752472748; c=relaxed/simple;
	bh=BuK9AgGz3K1/91ucm58BdOscU11kgcU6T0WLXn9wyWw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=CswVDgrJKaKLnkR+MXLhJWpnltUxWYqtCYGzxg2gKHzBggfPKuAn8Lt2cEzzD3WQr/tA05kJthlo4D/vGS4VrJj7CsnkflN8Xn7twdr/CY59De0Ffdvk4jO6eYJX5u+ty8Xgc+IrIx1ujZ9aIgmPkt34GfRz69mtYyaj7AF24ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=TxYw3JIN; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250714055902epoutp0117d8fd36fb8dfe64562b1e6f494f8d6c~SCKyfm36a0863208632epoutp01z
	for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Jul 2025 05:59:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250714055902epoutp0117d8fd36fb8dfe64562b1e6f494f8d6c~SCKyfm36a0863208632epoutp01z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752472742;
	bh=wLWqbeQHERoMsuo11ugHMN7yWlMf/OrKcNa6r4ulJTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TxYw3JINzCEcGDrPM2LVvPpZwTuIpiiGmw0set2CopSyVAldNOSHixGtw53GEEuxV
	 so/GOgpciH8eBFnGOahoF1CAAGFVVDjRnwAEXbqvQ7av6broBtOfoqZQmWuut1R47p
	 0v2Hf3pHCMjll5KN5Cfn8e1DqXxorZFF7rTNDp9M=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250714055901epcas2p21ffc6309e8371432412bc29fa5966fe2~SCKx7OdBU1842718427epcas2p2N;
	Mon, 14 Jul 2025 05:59:01 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.68]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4bgWps212Qz3hhTD; Mon, 14 Jul
	2025 05:59:01 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250714055900epcas2p1f082e73f1f30f7b3ec8e38c6f6501d61~SCKw32m5B1936819368epcas2p1d;
	Mon, 14 Jul 2025 05:59:00 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250714055900epsmtip107e682ee25a4c2ff4ca80ff03fe1ce7a~SCKw0lmzG0355503555epsmtip1g;
	Mon, 14 Jul 2025 05:59:00 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v3 RESEND 5/5] watchdog: s3c2410_wdt: exynosautov9: Enable
 supported features
Date: Mon, 14 Jul 2025 14:54:40 +0900
Message-Id: <20250714055440.3138135-6-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250714055440.3138135-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250714055900epcas2p1f082e73f1f30f7b3ec8e38c6f6501d61
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250714055900epcas2p1f082e73f1f30f7b3ec8e38c6f6501d61
References: <20250714055440.3138135-1-sw617.shin@samsung.com>
	<CGME20250714055900epcas2p1f082e73f1f30f7b3ec8e38c6f6501d61@epcas2p1.samsung.com>

Enable supported features for ExynosAutov9 SoC.
- QUIRK_HAS_DBGACK_BIT
- QUIRK_HAS_32BIT_MAXCNT

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 184b1ad46ca6..16a845f41e74 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -305,7 +305,8 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl0 = {
 	.cnt_en_reg = EXYNOS850_CLUSTER0_NONCPU_OUT,
 	.cnt_en_bit = 7,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
-		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
@@ -317,7 +318,8 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
 	.cnt_en_reg = EXYNOSAUTOV9_CLUSTER1_NONCPU_OUT,
 	.cnt_en_bit = 7,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
-		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
+		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_gs101_cl0 = {
-- 
2.25.1


