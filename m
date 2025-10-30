Return-Path: <linux-samsung-soc+bounces-11871-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B5046C1EAFD
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 30 Oct 2025 08:07:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 43B4834B3F9
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 30 Oct 2025 07:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EFD8336EC6;
	Thu, 30 Oct 2025 07:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VzQlsDKT"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9F73358A4
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Oct 2025 07:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761808049; cv=none; b=azgSpw8pIV0VbYGOOeq/u/Vx3OuK25f54Jsskp68bqYMxWpnpRQEgIUStIZYEQGYArRZYNwPLHZgqdDSA+UBiB+r3J5G2LXeA+j9J97ziH55NkdAeSzipDGzras6cjF/UzlFga8NtjGQSF5fV07DYgsb1qJNKOsEq/sEsSv4ayQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761808049; c=relaxed/simple;
	bh=UHWJLuWheeuOfykfnjuhI2yeC9VTO3Hkx5VGd1+/p7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=bmRQ3SuAXiEF5kCg8CDwgI+9ZKBZQKBULIoqWSt/5bqsAP7ZQcmO533Gk8/XAHjEAkRKKF6k4dNwycvxJzUSGVlC6SDJBR0nlJiW7BRKh/DPfwOwJgpf3TUZwrtDvvJc3vnnSK3PONzxuFYQaf99FDg27dhM2xENY8U6bsDeoU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=VzQlsDKT; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20251030070719epoutp043e66deb100c0295fb4498081f62e5c6d~zMxPdQN402443524435epoutp04E
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Oct 2025 07:07:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20251030070719epoutp043e66deb100c0295fb4498081f62e5c6d~zMxPdQN402443524435epoutp04E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1761808039;
	bh=lLbacaR5clbNto/ko7Nx4/YFPvA6DfmhL0b6nWQNI0I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VzQlsDKTzqY0C/jQC6Z3fikekjH/MvBvR1ibkFQdyji8/wC2Dtbg65K2wkM0Qb9DM
	 PPuDUKkU2g2N7pNYphCCX0Q/cCY0QhxP1h9gmKs1E0x6T30FtNWoixFO7p9En76o/J
	 hCbN6qCZEnghWAEcDUuuVLV31pbVRAAZUWseVplk=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20251030070717epcas2p4c6eb0a6eac077409a0141e5f18131f87~zMxNyQvyw2422224222epcas2p4Y;
	Thu, 30 Oct 2025 07:07:17 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.208]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4cxwCn3hWMz2SSKk; Thu, 30 Oct
	2025 07:07:17 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
	20251030070716epcas2p26b0f4b37ae7cbb192aada84a45ce92e9~zMxMxO3lT2275922759epcas2p2_;
	Thu, 30 Oct 2025 07:07:16 +0000 (GMT)
Received: from asswp60 (unknown [10.229.9.60]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20251030070716epsmtip26549293eff895f90ea9b8c420d381fb6~zMxMo0B191278412784epsmtip2b;
	Thu, 30 Oct 2025 07:07:16 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Henrik Grimler
	<henrik@grimler.se>
Cc: Shin Son <shin.son@samsung.com>, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v7 RESEND 1/3] dt-bindings: thermal: samsung: Adjust
 '#thermal-sensor-cells' to 1
Date: Thu, 30 Oct 2025 16:07:10 +0900
Message-ID: <20251030070712.248065-2-shin.son@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251030070712.248065-1-shin.son@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20251030070716epcas2p26b0f4b37ae7cbb192aada84a45ce92e9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251030070716epcas2p26b0f4b37ae7cbb192aada84a45ce92e9
References: <20251030070712.248065-1-shin.son@samsung.com>
	<CGME20251030070716epcas2p26b0f4b37ae7cbb192aada84a45ce92e9@epcas2p2.samsung.com>

The ExynosAuto v920 SoC includes multiple TMU instances; each instance
monitors a subset of the SoC's up to 16 hardware thermal sensors.

Additionally, add myself to the bindings' maintainers list, as I plan
to actively work on the exynosautov920 TMU support and handle further
updates in this area.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Shin Son <shin.son@samsung.com>
---
 .../thermal/samsung,exynos-thermal.yaml       | 33 ++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
index 29a08b0729ee..6b01f508542c 100644
--- a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
@@ -8,6 +8,7 @@ title: Samsung Exynos SoC Thermal Management Unit (TMU)
 
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
+  - Shin Son <shin.son@samsung.com>
 
 description: |
   For multi-instance tmu each instance should have an alias correctly numbered
@@ -27,6 +28,7 @@ properties:
       - samsung,exynos5420-tmu-ext-triminfo
       - samsung,exynos5433-tmu
       - samsung,exynos7-tmu
+      - samsung,exynosautov920-tmu
 
   clocks:
     minItems: 1
@@ -62,11 +64,17 @@ properties:
     minItems: 1
 
   '#thermal-sensor-cells':
-    const: 0
+    enum: [0, 1]
 
   vtmu-supply:
     description: The regulator node supplying voltage to TMU.
 
+  samsung,sensors:
+    description: Number of thermal sensors monitored by this TMU instance.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 15
+
 required:
   - compatible
   - clocks
@@ -97,6 +105,8 @@ allOf:
         reg:
           minItems: 2
           maxItems: 2
+        '#thermal-sensor-cells':
+          const: 0
   - if:
       properties:
         compatible:
@@ -119,6 +129,8 @@ allOf:
         reg:
           minItems: 1
           maxItems: 1
+        '#thermal-sensor-cells':
+          const: 0
 
   - if:
       properties:
@@ -139,6 +151,25 @@ allOf:
         reg:
           minItems: 1
           maxItems: 1
+        '#thermal-sensor-cells':
+          const: 0
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynosautov920-tmu
+    then:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names:
+          items:
+            - const: tmu_apbif
+        reg:
+          maxItems: 1
+        '#thermal-sensor-cells':
+          const: 1
 
 additionalProperties: false
 
-- 
2.50.1


