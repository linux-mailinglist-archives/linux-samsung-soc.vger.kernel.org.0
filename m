Return-Path: <linux-samsung-soc+bounces-10068-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FF1B296F5
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 18 Aug 2025 04:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B81C3BC94D
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 18 Aug 2025 02:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19B8A254846;
	Mon, 18 Aug 2025 02:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ZOjkk0w3"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438BF253934
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2025 02:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755483880; cv=none; b=n1+7il40rGNjtN0rUIJYNm0kl0xeIXhbjfWKrPLJGQvAbc0SvkYmGiNSYYRFS5H96IBGdBzK5ykI+8c8YrYuKUHpjpPy5JQaIVb5XoyoNSaiPEHvK1+LTbuFFvoXZ45WDGmzbLjEN8L6VhI+8AjOFxgtN30zwNulY6b8b7LcFp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755483880; c=relaxed/simple;
	bh=g/7Fxem5n6BdeQ6ZHtRsjjEQyY3OFey7+zdy4s3fN78=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=Yndtnz4nIEvAOl/lyZECHf+/Zk484U+G6RLIA4btz850az/k1Vqs8CW29gQ/yx7MMxTJ+3JRv5yppz1/Q1Wwy71tcz8Fe63Cj1hUG5wf8BNwtcQm3sm4Rbg/f7XNdJ22Q1XKtIzYq09+IdSsvfV6b7aH6DoChmsVGHmJ28OYBlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ZOjkk0w3; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250818022435epoutp038466382257417db69eb406551b54be25~cu0iZxmWs0944809448epoutp03n
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2025 02:24:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250818022435epoutp038466382257417db69eb406551b54be25~cu0iZxmWs0944809448epoutp03n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755483875;
	bh=aygIjGhtEZCiK0bBdeBSKt8kirdXxHE5geSp6SzHtmY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZOjkk0w3HbH+c8MTa6tTE/u/wLbgConV0/9tiW5BJHP0HpgYD5wVcuHLFWCwQWrZH
	 qED6x68pCsOp9LLW0fKhsm4UirxDPCv5oaHv7c8vOA4h9XVZfpyfUdBkuf3VVT4kxv
	 FPXIwTsI1HEsqxoylbQHB7OKVOBx8EmCOqlIaBoU=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250818022434epcas2p4c0f064bb19c18253efffecba277c43c4~cu0h9Ze-51747217472epcas2p43;
	Mon, 18 Aug 2025 02:24:34 +0000 (GMT)
Received: from epcas2p1.samsung.com (unknown [182.195.36.100]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c4xPG1YXwz3hhTT; Mon, 18 Aug
	2025 02:24:34 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250818022433epcas2p1bf8e6a335be945822721b8db1e9571e9~cu0g2a5Wc1646716467epcas2p1t;
	Mon, 18 Aug 2025 02:24:33 +0000 (GMT)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250818022433epsmtip1dfa1e198042f5aa086b3a7b743b126e2~cu0gx84n_2171921719epsmtip1O;
	Mon, 18 Aug 2025 02:24:33 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net, semen.protsenko@linaro.org, dongil01.park@samsung.com,
	khwan.seo@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>
Subject: [PATCH v6 3/5] watchdog: s3c2410_wdt: Increase max timeout value of
 watchdog
Date: Mon, 18 Aug 2025 11:18:24 +0900
Message-Id: <20250818021826.623830-4-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250818021826.623830-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250818022433epcas2p1bf8e6a335be945822721b8db1e9571e9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250818022433epcas2p1bf8e6a335be945822721b8db1e9571e9
References: <20250818021826.623830-1-sw617.shin@samsung.com>
	<CGME20250818022433epcas2p1bf8e6a335be945822721b8db1e9571e9@epcas2p1.samsung.com>

Increase max_timeout value from 55s to 3665038s (1018h 3min 58s) with
38400000 frequency system if the system has 32-bit WTCNT register.

cat /sys/class/watchdog/watchdog0/max_timeout
3665038

[    0.330082] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: count=1099511400000, timeout=3665038, freq=300000
[    0.330087] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: timeout=3665038, divisor=256, count=1099511400000 (fffffc87)
[    0.330127] s3c2410-wdt 10060000.watchdog_cl0: starting watchdog timer
[    0.330134] s3c2410-wdt 10060000.watchdog_cl0: Starting watchdog: count=0xfffffc87, wtcon=0001ff39
[    0.330319] s3c2410-wdt 10060000.watchdog_cl0: watchdog active, reset enabled, irq disabled

If the system has a 32-bit WTCNT, add QUIRK_HAS_32BIT_CNT to its quirk flags,
and it will operate with a 32-bit counter. If not, it will operate with a 16-bit
counter like in the previous version.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 1e8cf0299713..d983cbcb975c 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -34,7 +34,8 @@
 #define S3C2410_WTCNT		0x08
 #define S3C2410_WTCLRINT	0x0c
 
-#define S3C2410_WTCNT_MAXCNT	0xffff
+#define S3C2410_WTCNT_MAXCNT_16	0xffff
+#define S3C2410_WTCNT_MAXCNT_32	0xffffffff
 
 #define S3C2410_WTCON_RSTEN		BIT(0)
 #define S3C2410_WTCON_INTEN		BIT(2)
@@ -124,6 +125,10 @@
  * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Setting the
  * DBGACK_MASK bit disables the watchdog outputs when the SoC is in debug mode.
  * Debug mode is determined by the DBGACK CPU signal.
+ *
+ * %QUIRK_HAS_32BIT_CNT: WTDAT and WTCNT are 32-bit registers. With these
+ * 32-bit registers, larger values will be set, which means that larger timeouts
+ * value can be set.
  */
 #define QUIRK_HAS_WTCLRINT_REG			BIT(0)
 #define QUIRK_HAS_PMU_MASK_RESET		BIT(1)
@@ -131,6 +136,7 @@
 #define QUIRK_HAS_PMU_AUTO_DISABLE		BIT(3)
 #define QUIRK_HAS_PMU_CNT_EN			BIT(4)
 #define QUIRK_HAS_DBGACK_BIT			BIT(5)
+#define QUIRK_HAS_32BIT_CNT			BIT(6)
 
 /* These quirks require that we have a PMU register map */
 #define QUIRKS_HAVE_PMUREG \
@@ -199,6 +205,7 @@ struct s3c2410_wdt {
 	struct notifier_block	freq_transition;
 	const struct s3c2410_wdt_variant *drv_data;
 	struct regmap *pmureg;
+	u32 max_cnt;
 };
 
 static const struct s3c2410_wdt_variant drv_data_s3c2410 = {
@@ -412,7 +419,7 @@ static inline unsigned int s3c2410wdt_max_timeout(struct s3c2410_wdt *wdt)
 {
 	const unsigned long freq = s3c2410wdt_get_freq(wdt);
 	const u64 n_max = (u64)(S3C2410_WTCON_PRESCALE_MAX + 1) *
-			S3C2410_WTCON_MAXDIV * S3C2410_WTCNT_MAXCNT;
+			S3C2410_WTCON_MAXDIV * wdt->max_cnt;
 	u64 t_max = div64_ul(n_max, freq);
 
 	if (t_max > UINT_MAX)
@@ -572,7 +579,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 {
 	struct s3c2410_wdt *wdt = watchdog_get_drvdata(wdd);
 	unsigned long freq = s3c2410wdt_get_freq(wdt);
-	unsigned int count;
+	unsigned long count;
 	unsigned int divisor = 1;
 	unsigned long wtcon;
 
@@ -582,7 +589,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 	freq = DIV_ROUND_UP(freq, 128);
 	count = timeout * freq;
 
-	dev_dbg(wdt->dev, "Heartbeat: count=%d, timeout=%d, freq=%lu\n",
+	dev_dbg(wdt->dev, "Heartbeat: count=%lu, timeout=%d, freq=%lu\n",
 		count, timeout, freq);
 
 	/* if the count is bigger than the watchdog register,
@@ -590,8 +597,8 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 	   actually make this value
 	*/
 
-	if (count >= 0x10000) {
-		divisor = DIV_ROUND_UP(count, 0xffff);
+	if (count > wdt->max_cnt) {
+		divisor = DIV_ROUND_UP(count, wdt->max_cnt);
 
 		if (divisor > S3C2410_WTCON_PRESCALE_MAX + 1) {
 			dev_err(wdt->dev, "timeout %d too big\n", timeout);
@@ -599,7 +606,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_device *wdd,
 		}
 	}
 
-	dev_dbg(wdt->dev, "Heartbeat: timeout=%d, divisor=%d, count=%d (%08x)\n",
+	dev_dbg(wdt->dev, "Heartbeat: timeout=%d, divisor=%d, count=%lu (%08lx)\n",
 		timeout, divisor, count, DIV_ROUND_UP(count, divisor));
 
 	count = DIV_ROUND_UP(count, divisor);
@@ -807,6 +814,11 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(wdt->src_clk))
 		return dev_err_probe(dev, PTR_ERR(wdt->src_clk), "failed to get source clock\n");
 
+	if (wdt->drv_data->quirks & QUIRK_HAS_32BIT_CNT)
+		wdt->max_cnt = S3C2410_WTCNT_MAXCNT_32;
+	else
+		wdt->max_cnt = S3C2410_WTCNT_MAXCNT_16;
+
 	wdt->wdt_device.min_timeout = 1;
 	wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt);
 
-- 
2.25.1


