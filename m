Return-Path: <linux-samsung-soc+bounces-8490-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 42439AB7FA0
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 15 May 2025 10:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B7DE61B68691
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 15 May 2025 08:03:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E68CA288508;
	Thu, 15 May 2025 08:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ktdKdi3I"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CACE128689F
	for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2025 08:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747296194; cv=none; b=Cl9EZrWGyI+poPnoOQ7OHeaRhOSsnFJM5mTYEPVGsgZDxxbuZYyXkkyf6g4ew7rbs3SypvTpd8cP5rEMpfDqdPihWw3LiUOFXlbCZdA/QiuMu1h9akW79NCq/iGt40KtKtHFUAagtWWyU9HpXM/o4nZqPuHEqK+HF8aUXdAdgoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747296194; c=relaxed/simple;
	bh=JgzSBwGJSPNR5u2mFY4Uyiofeb5W9+zY06IMUVvh9VA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Zlm1XgrkdvweAHGGUa6n6u/by9E4t4R0cPhBqX6aPV71r5XRAZLSDgcH67aBvBOjFgnH97QfibwaME278VFmINly2SiIiBlgCuCz5blYYdmk4rwrJHeDaBjWtRgoB08I+bBT8u0x6YCLBQocSXHsgoYvEp2Ulu7z1ZgYvgomrZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ktdKdi3I; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250515080311epoutp02e6c4f6146cd99fd0081c5fd436d89984~-pKDT9Hjh1962819628epoutp02T
	for <linux-samsung-soc@vger.kernel.org>; Thu, 15 May 2025 08:03:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250515080311epoutp02e6c4f6146cd99fd0081c5fd436d89984~-pKDT9Hjh1962819628epoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747296191;
	bh=l1sBe+or20ljTm54YnvzZcJO7su90SPJqDKMD7hCrSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ktdKdi3IFF8vT/w9c4KJnN3SVzLRBJUY7l5uvmhq12xOlGPl37MP/l6Ik3CRhe2tg
	 h+j8RdfL4vP4AGyoOLSICwD0ZUSRSrjXAliQvDbrWwxCwWDyVoy3dezVcyi6f61CYz
	 4rKc5BlPVaWj5lzOB/p0gi4vxeDgcYgNfBy29Qh4=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250515080310epcas2p35f99437ebc36178361227b8bcf938ae0~-pKC4mdky2780027800epcas2p3W;
	Thu, 15 May 2025 08:03:10 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.101]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4ZyjPp1HwNz6B9mK; Thu, 15 May
	2025 08:03:10 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250515080309epcas2p47d07f73de08c7c14b2a60a8d15423954~-pKByYSlY2279222792epcas2p4u;
	Thu, 15 May 2025 08:03:09 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250515080309epsmtrp2082993217c24a68f158fb7dae594dd53~-pKBwKT-I0272802728epsmtrp23;
	Thu, 15 May 2025 08:03:09 +0000 (GMT)
X-AuditID: b6c32a29-566fe7000000223e-c6-68259fbdfec8
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	CB.1E.08766.DBF95286; Thu, 15 May 2025 17:03:09 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250515080309epsmtip2b17d44959dfb46140b6393a8d4c5c14e~-pKBfaH241291312913epsmtip2z;
	Thu, 15 May 2025 08:03:09 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v3 4/5] watchdog: s3c2410_wdt: exynosautov920: Enable
 QUIRK_HAS_32BIT_MAXCNT
Date: Thu, 15 May 2025 16:53:49 +0900
Message-Id: <20250515075350.3368635-5-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250515075350.3368635-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrCLMWRmVeSWpSXmKPExsWy7bCSvO7e+aoZBi1zhSwezNvGZnH+/AZ2
	i02Pr7FaXN41h81ixvl9TBY31u1jt3iy8AyTxYzFJ9ksHr/8x+zA6bFpVSebx8o1a1g9Ni+p
	99j5vYHdo2/LKkaPz5vkAtiiuGxSUnMyy1KL9O0SuDIm9W9mKjjEWdE79xJ7A2MLRxcjJ4eE
	gInEw6PfWLsYuTiEBHYzSsz9uom5i5EDKCEl8e6ZJUSNsMT9liNQNR8YJfbNPsQEkmAT0JGY
	/u82C4gtIhAncax9MzNIEbPATkaJlum/wQYJC8RI9DalgtSwCKhKLPk1jxHE5hWwldi1axcb
	xAJ5iZmXvrOD2JwCdhITL+4CqxECqjm85wkbRL2gxMmZT8B2MQPVN2+dzTyBUWAWktQsJKkF
	jEyrGCVTC4pz03OLDQsM81LL9YoTc4tL89L1kvNzNzGCA15Lcwfj9lUf9A4xMnEwHmKU4GBW
	EuG9nqWcIcSbklhZlVqUH19UmpNafIhRmoNFSZxX/EVvipBAemJJanZqakFqEUyWiYNTqoGp
	c/WlP6XuiVH7zshls7QuT9pSlSVaXjhl9teO0z9/vp9lfDpZQ4ddVt3INZ3pVWLEIaFXf1Rk
	ZuTlGF7ecK0gzOvylc+dlYt+mvY3L1D/zcgdnsf/2mRF9zxe/ZdbHkc47Tl0R/hFVUPDnU/b
	faWa0youN86eKcbe8va10NarSizC6f7zDujqb7Rfwqe6NDV7YdYcv79cv14t3NP981GGRPLN
	qNdhpvd5G04v2hNZ0RzMvSrjmcnWvZvN7Squibg6tBzUurl3w8TjzkJWAbx3IzkK/hwKfDLd
	/du99x6ZEpINGWWZrDJqrH7fDvzK1rAtaV3/NXMSyxQbb6fPPIFRB7PvJJs1TLz65xcrn7US
	S3FGoqEWc1FxIgCXHLHP5wIAAA==
X-CMS-MailID: 20250515080309epcas2p47d07f73de08c7c14b2a60a8d15423954
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250515080309epcas2p47d07f73de08c7c14b2a60a8d15423954
References: <20250515075350.3368635-1-sw617.shin@samsung.com>
	<CGME20250515080309epcas2p47d07f73de08c7c14b2a60a8d15423954@epcas2p4.samsung.com>

Enable QUIRK_HAS_32BIT_MAXCNT to ExynosAutov920 SoC which has 32-bit WTCNT.

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 1c7299deec5d..3c12a3ae50f8 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -326,7 +326,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl0 = {
 	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_DBGACK_BIT,
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
@@ -339,7 +339,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
 	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_DBGACK_BIT,
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct of_device_id s3c2410_wdt_match[] = {
-- 
2.40.1


