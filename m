Return-Path: <linux-samsung-soc+bounces-9478-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BD424B10320
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 24 Jul 2025 10:15:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 59E9A1C258C8
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 24 Jul 2025 08:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B89C127584E;
	Thu, 24 Jul 2025 08:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="tjFHGU7k"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05F3274B5F
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Jul 2025 08:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753344824; cv=none; b=V0cDAGzndddaX4ZZRtmxXX1tgeaY0PD+XiHb7lRDyechO0prEMT2c84eU43Y59t01AQKSZvbLNYgX91KOy/hS2vMdk0fGHbppemCIiTX1w+d1ymcG+FRuwa0JnJgMTV9Tf3IdVwKUL7Ei6MmV+Qn7LsiflTgCFtDJRQWHxJSMHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753344824; c=relaxed/simple;
	bh=ZWAOaUKXYWIvDq+6G8cPvKKClMClTEQPjUFi2Q8Lf8s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=rc34HC/uu5sUVLORI90nr6QZoI/NeNOFWWWasOaqWb2npqi4PaszJJCVVRz6HfgKRyB/0AomxHQzOuo9tu4OYUNJVOZmUYLic58PjXAdNf5OuNBvoA+71HAVfI6FeVwIICvKS0CNhCy7VOZDk9yjD584aXQM0ih89ZcMWk0On1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=tjFHGU7k; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250724081339epoutp01d6821fd76855378f800aed556d213601~VIdLBtakf1462714627epoutp01n
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Jul 2025 08:13:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250724081339epoutp01d6821fd76855378f800aed556d213601~VIdLBtakf1462714627epoutp01n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753344819;
	bh=z8gPAdqSivNJX5FYTy2hqPX+3c1Wy7tfFAMQewiXsxQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tjFHGU7ktg1oQy6J87dXI/DLF7C0QS7LKEkZdw3oNqc/D1KA5k/I0/owk3MfJ/V+T
	 YA/lZ0LYNuBXL9qBQXEyO1RR4ilj0KToztmlh3SLXhs0NRtfXmfMytlsKojP3tgDDM
	 biZg5/SnHa7pf6DvI9+SlS9rxvh9//SorMKJudOs=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250724081338epcas2p2a4d064debb2709b0a9221043a8c93464~VIdKgxGZ90806808068epcas2p2J;
	Thu, 24 Jul 2025 08:13:38 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.36.92]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bnkKY5MnJz6B9m6; Thu, 24 Jul
	2025 08:13:37 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250724081337epcas2p31f594b6e9ab87e24c94f11dea4070956~VIdJOVTH-0887108871epcas2p3J;
	Thu, 24 Jul 2025 08:13:37 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250724081336epsmtip1c4cf361d5b8edd7c5b43dc5ea8a301dd~VIdJIOtO12042020420epsmtip1T;
	Thu, 24 Jul 2025 08:13:36 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net, semen.protsenko@linaro.org, khwan.seo@samsung.com,
	dongil01.park@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v4 3/4] watchdog: s3c2410_wdt: Increase max timeout value of
 watchdog
Date: Thu, 24 Jul 2025 17:08:53 +0900
Message-Id: <20250724080854.3866566-4-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250724080854.3866566-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250724081337epcas2p31f594b6e9ab87e24c94f11dea4070956
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250724081337epcas2p31f594b6e9ab87e24c94f11dea4070956
References: <20250724080854.3866566-1-sw617.shin@samsung.com>
	<CGME20250724081337epcas2p31f594b6e9ab87e24c94f11dea4070956@epcas2p3.samsung.com>

Increase max_timeout value from 55s to 3664647s (1017h 57min 27s) with
38400000 frequency system if the system has 32-bit WTCNT register.

cat /sys/devices/platform/10060000.watchdog_cl0/watchdog/watchdog0/max_timeout
3664647

[    0.302473] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: count=1099394100000, timeout=3664647, freq=300000
[    0.302479] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: timeout=3664647, divisor=256, count=1099394100000 (fff8feac)
[    0.302510] s3c2410-wdt 10060000.watchdog_cl0: starting watchdog timer
[    0.302722] s3c2410-wdt 10060000.watchdog_cl0: watchdog active, reset enabled, irq disabled

If system has 32-bit WTCNT, add QUIRK_HAS_32BIT_MAXCNT to its quirk flags, then
it will operation with 32-bit counter. If not, with 16-bit counter like previous.

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 31f7e1ec779e..184b1ad46ca6 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -34,6 +34,7 @@
 #define S3C2410_WTCLRINT	0x0c
 
 #define S3C2410_WTCNT_MAXCNT	0xffff
+#define S3C2410_WTCNT_MAXCNT_32	0xffffffff
 
 #define S3C2410_WTCON_RSTEN		BIT(0)
 #define S3C2410_WTCON_INTEN		BIT(2)
@@ -123,6 +124,10 @@
  * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Setting the
  * DBGACK_MASK bit disables the watchdog outputs when the SoC is in debug mode.
  * Debug mode is determined by the DBGACK CPU signal.
+ *
+ * %QUIRK_HAS_32BIT_MAXCNT: WTDAT and WTCNT are 32-bit registers. With these
+ * 32-bit registers, larger values to be set, which means that larger timeouts
+ * value can be set.
  */
 #define QUIRK_HAS_WTCLRINT_REG			BIT(0)
 #define QUIRK_HAS_PMU_MASK_RESET		BIT(1)
@@ -130,6 +135,7 @@
 #define QUIRK_HAS_PMU_AUTO_DISABLE		BIT(3)
 #define QUIRK_HAS_PMU_CNT_EN			BIT(4)
 #define QUIRK_HAS_DBGACK_BIT			BIT(5)
+#define QUIRK_HAS_32BIT_MAXCNT			BIT(6)
 
 /* These quirks require that we have a PMU register map */
 #define QUIRKS_HAVE_PMUREG \
@@ -198,6 +204,7 @@ struct s3c2410_wdt {
 	struct notifier_block	freq_transition;
 	const struct s3c2410_wdt_variant *drv_data;
 	struct regmap *pmureg;
+	unsigned int		max_cnt;
 };
 
 static const struct s3c2410_wdt_variant drv_data_s3c2410 = {
@@ -349,7 +356,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl0 = {
 	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_DBGACK_BIT,
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
@@ -362,7 +369,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
 	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_DBGACK_BIT,
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct of_device_id s3c2410_wdt_match[] = {
@@ -411,7 +418,7 @@ static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
 {
 	const unsigned long freq = s3c2410wdt_get_freq(wdt);
 
-	return S3C2410_WTCNT_MAXCNT / DIV_ROUND_UP(freq,
+	return wdt->max_cnt / DIV_ROUND_UP(freq,
 		(S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV);
 }
 
@@ -566,7 +573,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 {
 	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
 	unsigned long freq = s3c2410wdt_get_freq(wdt);
-	unsigned int count;
+	unsigned long count;
 	unsigned int divisor = 1;
 	unsigned long wtcon;
 
@@ -576,7 +583,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 	freq = DIV_ROUND_UP(freq, 128);
 	count = timeout * freq;
 
-	dev_dbg(wdt->dev, "Heartbeat: count=%d, timeout=%d, freq=%lu\n",
+	dev_dbg(wdt->dev, "Heartbeat: count=%lu, timeout=%d, freq=%lu\n",
 		count, timeout, freq);
 
 	/* if the count is bigger than the watchdog register,
@@ -584,8 +591,8 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 	   actually make this value
 	*/
 
-	if (count >= 0x10000) {
-		divisor = DIV_ROUND_UP(count, 0xffff);
+	if (count > wdt->max_cnt) {
+		divisor = DIV_ROUND_UP(count, wdt->max_cnt);
 
 		if (divisor > S3C2410_WTCON_PRESCALE_MAX + 1) {
 			dev_err(wdt->dev, "timeout %d too big\n", timeout);
@@ -593,7 +600,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 		}
 	}
 
-	dev_dbg(wdt->dev, "Heartbeat: timeout=%d, divisor=%d, count=%d (%08x)\n",
+	dev_dbg(wdt->dev, "Heartbeat: timeout=%d, divisor=%d, count=%lu (%08lx)\n",
 		timeout, divisor, count, DIV_ROUND_UP(count, divisor));
 
 	count = DIV_ROUND_UP(count, divisor);
@@ -801,6 +808,10 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(wdt->src_clk))
 		return dev_err_probe(dev, PTR_ERR(wdt->src_clk), "failed to get source clock\n");
 
+	wdt->max_cnt = S3C2410_WTCNT_MAXCNT;
+	if ((wdt->drv_data->quirks & QUIRK_HAS_32BIT_MAXCNT))
+		wdt->max_cnt = S3C2410_WTCNT_MAXCNT_32;
+
 	wdt->wdt_device.min_timeout = 1;
 	wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt);
 
-- 
2.25.1


