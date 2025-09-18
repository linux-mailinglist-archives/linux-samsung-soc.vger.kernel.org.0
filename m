Return-Path: <linux-samsung-soc+bounces-10777-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E58B4556D
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  5 Sep 2025 12:57:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5A5516B539
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  5 Sep 2025 10:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7BB30E0DB;
	Fri,  5 Sep 2025 10:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="C3Cy+9n/"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64E12E2DFC
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Sep 2025 10:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757069836; cv=none; b=o9lNaH3ej2cxKxo8NGxN9jNqeMl+A2+9OadTdP+0qRKWadXH/NiKDMsiOWBC4FPobWsdBwN1i4dU0oZj/ziG+y8RUE6xBKPd+o5xb9+eS9B5EvLxVKn2MB2DrexJFRNjWY/RbvP0MAdqlKjqoTRsLCRvWWU3AdruJGSKww4cnso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757069836; c=relaxed/simple;
	bh=RSJzYZlDxkL2Zy3UrARBJp312LIvbf6NXFLstWjbGVA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:MIME-Version:
	 Content-Type:References; b=cR3+PAzb6CWuzezxgiWpk+FGRj6kPcRNcSYjz5g/5SLikvSjOSJs+vkM6RuI3zNN6Wk/YrdejL3hYZCDJQu5CNE6HlhKutWqmVC9wxo2ZLbkfKO+R9PXJSkYvqDwF2Yhlzul1XebJBkrxL+EXBfm8sHCwB076A5FRZF56bG0p/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=C3Cy+9n/; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250905105712epoutp02ee36770d7d170c99fe180edf28c2ba39~iXbQL_OOv2619326193epoutp02E
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Sep 2025 10:57:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250905105712epoutp02ee36770d7d170c99fe180edf28c2ba39~iXbQL_OOv2619326193epoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757069832;
	bh=qJD/glqqVPAbqFKdjl/N/YrzUzP6uBCpQtLsG4jXb+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C3Cy+9n/uklU9Di4eZN5DibPU851q1xpx8CoAzByIZTyXsCQBaP0DcN4HU2MmWfpd
	 ssAxJgNyjhKD5AjLeBVLecHIPB7s1lkio9kcJ4dqt29LA34EWXtZXTGD93gCDIfudR
	 tCn+u8KF/WU4qMxxZAFZQLDmk4W9EiOXS6Hy81/A=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250905105711epcas5p4a6a8fa6a9a2ecf20b1b1cf1ce26e905d~iXbPjhsFA2254422544epcas5p4y;
	Fri,  5 Sep 2025 10:57:11 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.95]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cJCwQ65Myz6B9m6; Fri,  5 Sep
	2025 10:57:10 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250905105710epcas5p10516745944f09e262f41a5e5dcfce5f8~iXbOCGQz32174421744epcas5p1c;
	Fri,  5 Sep 2025 10:57:10 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250905105708epsmtip243c001c810412d90b37b72a2aca06f3f~iXbMURmgC0714207142epsmtip2A;
	Fri,  5 Sep 2025 10:57:08 +0000 (GMT)
From: Devang Tailor <dev.tailor@samsung.com>
To: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	henrik@grimler.se, faraz.ata@samsung.com
Cc: Devang Tailor <dev.tailor@samsung.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: rtc: s3c-rtc: add compatible for
 exynosautov9
Date: Fri,  5 Sep 2025 16:35:52 +0530
Message-Id: <20250905110554.2212304-2-dev.tailor@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905110554.2212304-1-dev.tailor@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250905105710epcas5p10516745944f09e262f41a5e5dcfce5f8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250905105710epcas5p10516745944f09e262f41a5e5dcfce5f8
References: <20250905110554.2212304-1-dev.tailor@samsung.com>
	<CGME20250905105710epcas5p10516745944f09e262f41a5e5dcfce5f8@epcas5p1.samsung.com>

Add "samsung,exynosautov9-rtc" dedicated compatible for
on-chip RTC found in ExynosAutov9 SoC.

Signed-off-by: Devang Tailor <dev.tailor@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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


