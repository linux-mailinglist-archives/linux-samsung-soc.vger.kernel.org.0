Return-Path: <linux-samsung-soc+bounces-11204-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9B3B9D25E
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Sep 2025 04:29:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4C6722E7B5A
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Sep 2025 02:29:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BCDE2E5B02;
	Thu, 25 Sep 2025 02:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="QrP/QhvB"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout4.samsung.com (mailout4.samsung.com [203.254.224.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2FD62DF149
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2025 02:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758767333; cv=none; b=eiFXVmMG0wApKRwJosfE70jtEwrHi0Hb3Guj7S3h94TUctJivHxDPI00pAuAiWjxj7qLx3mPn5hgwtDCA20z6SflXf1iPkqNSuLW3WsvWX2L3aCKmTNRksk7geUNB6ZNXmMI95YyKSmv47/TeQ4+yg5wQc+IWduysUsZ2WtSJkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758767333; c=relaxed/simple;
	bh=VuVuqNpbYHejbfHFat2sHb+S4jfcHzDjTC7aNwjZWwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:MIME-Version:
	 Content-Type:References; b=lIUQPsPz2LJwdmr7U4QD2KHFPlmUlkYhQZCNx2pXA91ZvxSoz1r2RRLXk3s/o9mLgbHrvvxqDmVzf+/xXYjIAzRksKX+cWlMCceiRSn3Ajq91Aee7PZzp2USmaGCfL4ZHZwAK7YDHaVeMpCQ270c01SwdW7OiuZlpxqDwTtgDmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=QrP/QhvB; arc=none smtp.client-ip=203.254.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250925022847epoutp040e9349cd1b43579ef450cb5abe362651~oZZD_Y2KA1440414404epoutp04l
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Sep 2025 02:28:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250925022847epoutp040e9349cd1b43579ef450cb5abe362651~oZZD_Y2KA1440414404epoutp04l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1758767327;
	bh=A44684+TxPgrnQxxhQZxw9mhm/+rF3+SYnhEcaZDAiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QrP/QhvB9sUkvC5rmQY8EuL8cUpFAbKO5LiRK/aUH4Dq/YpkZHCK2ymIUixv8yj09
	 /Exel3pe+/ADziByS1GIPhFRUD3zxe50YolNjOzf0M46vflaJTRONGAo2JMsqn5sCT
	 XDb9jCVdXXCrkK4Vv1P5EFDiG5SU9iNLk13DkLks=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250925022847epcas2p4d8bb3ff1309bc0a1dd9c08a9b8ed8e29~oZZDaC2T70383003830epcas2p4x;
	Thu, 25 Sep 2025 02:28:47 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.100]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cXHhZ4K0tz6B9mF; Thu, 25 Sep
	2025 02:28:46 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250925022845epcas2p4e5f0c0d095c1c8e2246646aa2d0ec985~oZZCAYflJ3098730987epcas2p4V;
	Thu, 25 Sep 2025 02:28:45 +0000 (GMT)
Received: from asswp60 (unknown [10.229.9.60]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250925022845epsmtip19f89c0689bd83de5e47b7459bba66901~oZZB4Lgdk2361923619epsmtip1i;
	Thu, 25 Sep 2025 02:28:45 +0000 (GMT)
From: Shin Son <shin.son@samsung.com>
To: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski
	<krzk@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
	<lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Henrik Grimler
	<henrik@grimler.se>
Cc: Shin Son <shin.son@samsung.com>, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/3] dt-bindings: thermal: samsung: Adjust
 '#thermal-sensor-cells' to 1
Date: Thu, 25 Sep 2025 11:28:38 +0900
Message-ID: <20250925022841.2813150-2-shin.son@samsung.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250925022841.2813150-1-shin.son@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250925022845epcas2p4e5f0c0d095c1c8e2246646aa2d0ec985
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250925022845epcas2p4e5f0c0d095c1c8e2246646aa2d0ec985
References: <20250925022841.2813150-1-shin.son@samsung.com>
	<CGME20250925022845epcas2p4e5f0c0d095c1c8e2246646aa2d0ec985@epcas2p4.samsung.com>

The ExynosAuto v920 SoC includes multiple TMU instances; each instance
monitors a subset of the SoC's up to 16 hardware thermal sensors.

Additionally, add myself to the bindings' maintainers list, as I plan
to actively work on the exynosautov920 TMU support and handle further
updates in this area.

Signed-off-by: Shin Son <shin.son@samsung.com>
---
 .../thermal/samsung,exynos-thermal.yaml       | 32 ++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml b/Documentation/devicetree/bindings/thermal/samsung,exynos-thermal.yaml
index 29a08b0729ee..f9b399a7b82f 100644
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
@@ -139,6 +151,24 @@ allOf:
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
+          minItems: 1
+          maxItems: 1
+        reg:
+          minItems: 1
+          maxItems: 1
+        '#thermal-sensor-cells':
+          const: 1
 
 additionalProperties: false
 
-- 
2.50.1


