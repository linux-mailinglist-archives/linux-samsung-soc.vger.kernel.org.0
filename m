Return-Path: <linux-samsung-soc+bounces-9318-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5BDB013A5
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 11 Jul 2025 08:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0A16B40398
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 11 Jul 2025 06:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C0351DF98F;
	Fri, 11 Jul 2025 06:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="rrFWc25G"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D623A1D7E41
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jul 2025 06:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752215756; cv=none; b=lidV7TCB96lrv+Q+6g3N3hx7DmLOg/hYZl4m5QZwFnXuIRWBKyOiDH+10+9tS4RwiUIIIowc1V/rdB4OM/w6L0IHWrsKcCLbez2/U8asjav5WIGFqLUJucgzXsI95V/bIh0mTTrYNn0tEewMgO/YerZ1eqPLg94N7yXE8h16Cnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752215756; c=relaxed/simple;
	bh=9cUGLw8eoDTkSdnHpo7uzjDyDXxI3QX782KtYf+IfVo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=lghkjElKiV4M59NfrQjxJB8/M+CmdJ+JRM014JD57EczScNxuGLvOouLOM1MCQ7hIIC0uDNtED7gU/QQ65oMu/jsUEh2asok3aq2iYKgucIpbpouVSCis10PiRGMpunnlcMsTBLFvQTFg7IVyC9Ly1nl3Pz1bZDzXA4NRKjBACo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=rrFWc25G; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250711063551epoutp039c7a5c2726a30bfb7904ec02a473e002~RHvFPg-EZ3188431884epoutp03E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Jul 2025 06:35:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250711063551epoutp039c7a5c2726a30bfb7904ec02a473e002~RHvFPg-EZ3188431884epoutp03E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1752215751;
	bh=z4l+MDSTZ2r2HMz/v67DtIs5pH+NnoP/SjYH2EZLuoY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rrFWc25Gnv/aHcMO8P2jNKyT9abbDHxg5+Kgm1MnN3XfxbtloZWfnvABqg/7grriv
	 s7SUT6P12iaj8bTJC9M+wcuejOpVCwuQMglzgI4jtrLZ/E1p2DR/Jpap/mGedF1/Uo
	 swn3Ok4aBh4Ckv7UlU2MiQGaKUkQRMlvi0pRT1Ts=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250711063551epcas5p298c51dca665271d9789048adfd7f6fd6~RHvEpdVV73228232282epcas5p2Z;
	Fri, 11 Jul 2025 06:35:51 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.176]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bdhmj1dqXz6B9mT; Fri, 11 Jul
	2025 06:35:49 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250710082534epcas5p40b49f5662ff36306349e6721fa9811fe~Q1ll7N7pz0133701337epcas5p4n;
	Thu, 10 Jul 2025 08:25:34 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250710082533epsmtip13f65bde4bd8338ecd91d21a7064e403c~Q1lkcI3pM0630306303epsmtip1V;
	Thu, 10 Jul 2025 08:25:33 +0000 (GMT)
From: Devang Tailor <dev.tailor@samsung.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com, alexandre.belloni@bootlin.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, faraz.ata@samsung.com
Cc: Devang Tailor <dev.tailor@samsung.com>
Subject: [PATCH v2 1/3] dt-bindings: rtc: s3c-rtc: add compatible for
 exynosautov9
Date: Thu, 10 Jul 2025 14:04:32 +0530
Message-Id: <20250710083434.1821671-2-dev.tailor@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250710083434.1821671-1-dev.tailor@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250710082534epcas5p40b49f5662ff36306349e6721fa9811fe
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250710082534epcas5p40b49f5662ff36306349e6721fa9811fe
References: <20250710083434.1821671-1-dev.tailor@samsung.com>
	<CGME20250710082534epcas5p40b49f5662ff36306349e6721fa9811fe@epcas5p4.samsung.com>

Add "samsung,exynosautov9-rtc" dedicated compatible for
on-chip RTC found in ExynosAutov9 SoC.

Signed-off-by: Devang Tailor <dev.tailor@samsung.com>
---
 Documentation/devicetree/bindings/rtc/s3c-rtc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/rtc/s3c-rtc.yaml b/Documentation/devicetree/bindings/rtc/s3c-rtc.yaml
index bf4e11d6dffb..5daee2a5f866 100644
--- a/Documentation/devicetree/bindings/rtc/s3c-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/s3c-rtc.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - samsung,exynosautov9-rtc
           - samsung,s3c2410-rtc
           - samsung,s3c2416-rtc
           - samsung,s3c2443-rtc
-- 
2.34.1


