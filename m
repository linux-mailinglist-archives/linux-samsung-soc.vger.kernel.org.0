Return-Path: <linux-samsung-soc+bounces-10072-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EEEB29701
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 18 Aug 2025 04:25:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 39DDD3BBFE2
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 18 Aug 2025 02:25:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 723D5257832;
	Mon, 18 Aug 2025 02:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="RBpmN7hq"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797BE2571B0
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2025 02:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755483884; cv=none; b=IUvx1P7Hm0Y6WRilblXt2409LZGltJAoeCTRXPX+Q9CjLyeAKDShUKMF7VlurXlUIwKEymV4+VIXI0UpGM+g1Ut61CHOQjUB8aPY/2xGD0qOymtc/5fPlQcEU5X1s1XWmRPQD8jPzG0LMSquolUP01RV+oKidMot+0EJceVYj+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755483884; c=relaxed/simple;
	bh=Op33w8YuHOk5KNvv44z7ZR6AF5ZiD7W37/xDv7sY3H4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=jvgdRFP4smjvtzxMaTrq9m+Q2vIUgQYTzv+ADBEnayHl5tdHPXnlt5uUdvJEYZpG3SbKXeDfHMXQdSjUS4xYCOKZ18ui/kA8cMU27HksN+wREyS6JbBWatAoqB0BnVIrLOMI5KMLXQseugRBSNHhjdW4ZCtt8yw9A0FRiJC7JpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=RBpmN7hq; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250818022435epoutp029035108fcba8206b569b0cb144e47a42~cu0iiGfvp1744917449epoutp02O
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2025 02:24:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250818022435epoutp029035108fcba8206b569b0cb144e47a42~cu0iiGfvp1744917449epoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755483875;
	bh=PEDfE/cZXX2izbtPhVO3xIr/ycqFTEjTVg1EKyWi0Nw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RBpmN7hqf3udV1mdb+I6iTo/k45zKhBKMeyAe3oschja9I0NcTvacI//+K77tqglA
	 qourToFXGqTHY11hhLH2OmFlOXg8f8atq16KUDwxTxUIRwVVBMtV7l01WGTAS0RzuE
	 3zXfc5TBa1YEKk0G803sBat5CNdgEC+c4zyefBEo=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250818022434epcas2p440e93fce21adb4db3786fad8d74e4a5f~cu0iELH4Y1747217472epcas2p45;
	Mon, 18 Aug 2025 02:24:34 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.68]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4c4xPG250vz6B9mG; Mon, 18 Aug
	2025 02:24:34 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250818022433epcas2p4fec1cccd280fc73dccc5b00e2236f836~cu0g9KQ3e2945329453epcas2p4O;
	Mon, 18 Aug 2025 02:24:33 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250818022433epsmtip1332c50c1db103d4bbdcee250138ca793~cu0g22E_C2171021710epsmtip1K;
	Mon, 18 Aug 2025 02:24:33 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net, semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v6 4/5] watchdog: s3c2410_wdt: exynosautov920: Enable
 QUIRK_HAS_32BIT_CNT
Date: Mon, 18 Aug 2025 11:18:25 +0900
Message-Id: <20250818021826.623830-5-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250818021826.623830-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250818022433epcas2p4fec1cccd280fc73dccc5b00e2236f836
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250818022433epcas2p4fec1cccd280fc73dccc5b00e2236f836
References: <20250818021826.623830-1-sw617.shin@samsung.com>
	<CGME20250818022433epcas2p4fec1cccd280fc73dccc5b00e2236f836@epcas2p4.samsung.com>

Enable QUIRK_HAS_32BIT_CNT to ExynosAutov920 SoC which has 32-bit WTCNT.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index d983cbcb975c..915d3c88565a 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -357,7 +357,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl0 = {
 	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_DBGACK_BIT,
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_CNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
@@ -370,7 +370,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
 	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_DBGACK_BIT,
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_CNT,
 };
 
 static const struct of_device_id s3c2410_wdt_match[] = {
-- 
2.25.1


