Return-Path: <linux-samsung-soc+bounces-8448-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F64AB5084
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 13 May 2025 11:57:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9709D4A2194
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 13 May 2025 09:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC9323ED69;
	Tue, 13 May 2025 09:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="NhJOvmP/"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411B923A9A7
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2025 09:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747130225; cv=none; b=rOp6RU2TcJ9KdgeFMZbXdjguDsO9Wl+aUQI9Cd2J4xdb140N7nCCbU7c+ZWrSaxAgSwzQVsN6kW9BPho3WQjdsGPv7LatBoRfDx492qZQT8Md7PpU9A836SCqQRtUba18icpGfJR8ujJtolOjafj+T+pkIPJZH5Ix8othkXgqx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747130225; c=relaxed/simple;
	bh=TaLIUJc/V+C5sRUB1ksCO/Gjwye8b4qIJIIxhJaFHu0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=qzZLPVJW4ex5VWYnB1LWFRVoR3IzKtRFF7uLTlMsxgxpsX8kuz2B/V/jAPyW8ZJSUBKaf2gIAQdzFqjjwRf1UGJt59QvrNF8i5qK9s4s6VNi1NkREATDaokUbT9txDuXlBGUCAQCdc4q14mO0MadZhzY8ph5921E7OowipxtMSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=NhJOvmP/; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250513095700epoutp02c3b544559c505f6b19b00b23bf6feab7~-Da285qpM2649826498epoutp02l
	for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2025 09:57:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250513095700epoutp02c3b544559c505f6b19b00b23bf6feab7~-Da285qpM2649826498epoutp02l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747130220;
	bh=Njp3v0VwqR8TQR2XZwY23w/e/d6JfQiVfEi+wjHazR0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NhJOvmP/hrf4W7XFVWgrL8fikHEEBr2i1QYIU6v+pFfXeh9eTmgi+mHIwJlBgZpOU
	 X8y0wtmMAM7bt5lQxujFktCzZpj/JdbuNu42EMSRW08KayxDZMhbeMSgM345R1m93W
	 oT8NkAF9Du6FXguKHfIp5COA2L6z84XxG5wjCXf8=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250513095659epcas2p39e5e57064499989652855bd563dec51c~-Da2eytN_0169201692epcas2p3l;
	Tue, 13 May 2025 09:56:59 +0000 (GMT)
Received: from epcas2p3.samsung.com (unknown [182.195.36.70]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZxX232XVpz3hhTB; Tue, 13 May
	2025 09:56:59 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250513095658epcas2p1d35060645d06e67687ff743a330027e3~-Da1jqqxH3111131111epcas2p1H;
	Tue, 13 May 2025 09:56:58 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250513095658epsmtrp22439b394d5444b3b813b911fee7e4a0e~-Da1i-hIK3179731797epsmtrp2P;
	Tue, 13 May 2025 09:56:58 +0000 (GMT)
X-AuditID: b6c32a28-46cef70000001e8a-0a-6823176aad69
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	25.78.07818.A6713286; Tue, 13 May 2025 18:56:58 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.126]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250513095658epsmtip23565f355bbae5c2f2e339f59a8f7bc79~-Da1RaFGv2395923959epsmtip2D;
	Tue, 13 May 2025 09:56:58 +0000 (GMT)
From: Sangwook Shin <sw617.shin@samsung.com>
To: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org,
	linux@roeck-us.net
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, Sangwook Shin
	<sw617.shin@samsung.com>, Kyunghwan Seo <khwan.seo@samsung.com>
Subject: [PATCH 2/3] watchdog: s3c2410_wdt: exynosautov920: Enable
 QUIRK_HAS_32BIT_MAXCNT
Date: Tue, 13 May 2025 18:47:10 +0900
Message-Id: <20250513094711.2691059-3-sw617.shin@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250513094711.2691059-1-sw617.shin@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrJLMWRmVeSWpSXmKPExsWy7bCSvG6WuHKGwZR/ahYP5m1js5jffonR
	4vz5DewWmx5fY7W4vGsOm8WM8/uYLG6s28du8WThGSaLGYtPslk8fvmP2YHLY9OqTjaPlWvW
	sHpsXlLvsfN7A7tH35ZVjB6fN8kFsEVx2aSk5mSWpRbp2yVwZbS+fc5Y8IOzYvX3fawNjFs5
	uhg5OSQETCSuN91l7GLk4hAS2M0o8ePAbZYuRg6ghJTEu2eWEDXCEvdbjrBC1HxglJiyoo0V
	JMEmoCMx/R9IPSeHiECcxLH2zcwgRcwCjxglrszrYQJJCAtESlxd9YQZxGYRUJX48fQVI4jN
	K2Ar0XHhCyPEBnmJmZe+s4Ms5hSwk/jaogwSFgIqeTdnCxNEuaDEyZlPwHYxA5U3b53NPIFR
	YBaS1CwkqQWMTKsYJVMLinPTc5MNCwzzUsv1ihNzi0vz0vWS83M3MYJDX0tjB+O7b036hxiZ
	OBgPMUpwMCuJ8DZuV8wQ4k1JrKxKLcqPLyrNSS0+xCjNwaIkzrvSMCJdSCA9sSQ1OzW1ILUI
	JsvEwSnVwMR8wknEQO/K8cpr9+6a5fVvfXqgqFRx74SA1fv9D+6Ja5ys+ohZZ07/3F1Pb+ax
	V3oLz9WW2fbp0OTMyc4zxR67zJQU2GJ73O5cRvGndQ4f3+7b98BPsXv76mU22ryXU1vPXrg0
	SUFRRHpz8yrlinhbkc01Vy6v//qm6nVemNvhVXKmZwsaNqg8vvZ//o55VhMfX39ZvKrI5jlb
	3boT+5aX9yjtlyjwninkne/4T+7p9KVnyox929QXa7N6X5aX+vts5SaB8/x3Knc2nt76Taxr
	d2O/3W6vPwybrTx5HQ8prVjJYry/dd/q0/cC529ke7/hKsNF0fTtDxduF7dbuv3YEZbpl0Mc
	V7lfL9PjndjJqMRSnJFoqMVcVJwIAOsy18PsAgAA
X-CMS-MailID: 20250513095658epcas2p1d35060645d06e67687ff743a330027e3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,N
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250513095658epcas2p1d35060645d06e67687ff743a330027e3
References: <20250513094711.2691059-1-sw617.shin@samsung.com>
	<CGME20250513095658epcas2p1d35060645d06e67687ff743a330027e3@epcas2p1.samsung.com>

Enable QUIRK_HAS_32BIT_MAXCNT to ExynosAutov920 SoC which has 32-bit WTCNT.

Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
Signed-off-by: Kyunghwan Seo <khwan.seo@samsung.com>
---
 drivers/watchdog/s3c2410_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index a13768a11f20..48819246f1ac 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -325,7 +325,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl0 = {
 	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_DBGACK_BIT,
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
@@ -338,7 +338,7 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov920_cl1 = {
 	.cnt_en_bit = 8,
 	.quirks = QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_PMU_MASK_RESET |
 		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN |
-		  QUIRK_HAS_DBGACK_BIT,
+		  QUIRK_HAS_DBGACK_BIT | QUIRK_HAS_32BIT_MAXCNT,
 };
 
 static const struct of_device_id s3c2410_wdt_match[] = {
-- 
2.40.1


