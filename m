Return-Path: <linux-samsung-soc+bounces-9176-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 64662AFAC30
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  7 Jul 2025 08:53:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6828D7A8687
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  7 Jul 2025 06:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FDDE27F754;
	Mon,  7 Jul 2025 06:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="ikdJAefZ"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6908B27C84B
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Jul 2025 06:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751871170; cv=none; b=NUq1BHtptqXdGC9e2NSYVPnnjRzLMTkKpL0GNZlnTsB6SpGljEd/X636DkOtQ0g5/ejZcyY9fuNl01AGlV2sQhEkoiiLNp0xu19RKyTgzj7f/2ei+fp/9/j1nMQEWX7eJZa2L+tf3zZ9BAa4LPvlaE8d4EyyFnW9YHROwYcaRts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751871170; c=relaxed/simple;
	bh=9cUGLw8eoDTkSdnHpo7uzjDyDXxI3QX782KtYf+IfVo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=SL0zqHgB6D9Gw2bVRT4GmWrGDNvimzvBUPgAMlECSf2jqO1k+UESx/ISdDuMjEcC8gPEJ18OSD8hYf/tBmIRa1j68NUhn1Qr5hsmP/3ZpesxEtbXEhHC4dt4XF0cswBNASiiBQXh4KDhyRFw6N8vdVVfhMH0KxB/zzj7Gsal3As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=ikdJAefZ; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250707065240epoutp034765224b54997a204834c7b2fb7632dc~P5Ynw59Sz1110711107epoutp03Y
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Jul 2025 06:52:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250707065240epoutp034765224b54997a204834c7b2fb7632dc~P5Ynw59Sz1110711107epoutp03Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1751871160;
	bh=z4l+MDSTZ2r2HMz/v67DtIs5pH+NnoP/SjYH2EZLuoY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ikdJAefZsKa3QyGO8HQCLGclGxly3gLXqwztFIkWbiKEGGzSnYTENXx19ETzN/xdI
	 CfXiAsDw7FsqI8c9sNOG0Yr0yegw0GGjSrFWgOFpmcLzYZmXNezQZWd/N6FvA9wf0p
	 sKt75oBi9qPewysyTtGAtxt/bO0FKC/s7UBgk6wk=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250707065239epcas5p3f56ff7abf50100cb9274d1826fc04d91~P5YnEshzF0246902469epcas5p3u;
	Mon,  7 Jul 2025 06:52:39 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.174]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4bbFKx35GFz2SSKd; Mon,  7 Jul
	2025 06:52:37 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250702051530epcas5p12b8c62aba9cc11dc8d13c65fb12b6c3c~OV1WZ6tqS2173121731epcas5p1M;
	Wed,  2 Jul 2025 05:15:30 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250702051528epsmtip236e2b6643211a3bea9388ae1b86b4aed~OV1U7A0Sv2974829748epsmtip2Z;
	Wed,  2 Jul 2025 05:15:28 +0000 (GMT)
From: Devang Tailor <dev.tailor@samsung.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	inux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	faraz.ata@samsung.com
Cc: Devang Tailor <dev.tailor@samsung.com>
Subject: [PATCH 1/3] dt-bindings: rtc: s3c-rtc: add compatible for
 exynosautov9
Date: Wed,  2 Jul 2025 10:54:24 +0530
Message-Id: <20250702052426.2404256-2-dev.tailor@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702052426.2404256-1-dev.tailor@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250702051530epcas5p12b8c62aba9cc11dc8d13c65fb12b6c3c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250702051530epcas5p12b8c62aba9cc11dc8d13c65fb12b6c3c
References: <20250702052426.2404256-1-dev.tailor@samsung.com>
	<CGME20250702051530epcas5p12b8c62aba9cc11dc8d13c65fb12b6c3c@epcas5p1.samsung.com>

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


