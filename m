Return-Path: <linux-samsung-soc+bounces-2584-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6AD898787
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  4 Apr 2024 14:29:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BA6C5284CAA
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  4 Apr 2024 12:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EDE985925;
	Thu,  4 Apr 2024 12:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E6mZwP8E"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C87129A99
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Apr 2024 12:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233594; cv=none; b=LkjQjPVYh3Fdj11X9TKfPinJ04w7ycinYlsht3gRln4V5PRauWdKc+/3DTWd++BMZXqTY1OeZNPbPmDDTWPBTwfS+/iuz95T3R2OjVolXFmaGMlyyzuQqg0TWbR/JW0B/TmI/CUNTIHFoJDPM8YK8fDDIZMj7VbnwMdPcGhb7tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233594; c=relaxed/simple;
	bh=dIzQHmAv92VoLaXzce50bxfh8q9y2wyI7VpgA6yEI/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K05GvXjkpSKxBQlJ2+epuk3nSWtUL+5SD/9FzuaqoLVfeBTwtMyE6MUYLlWLn8H8BqkiznIlxg/Raat8edC6kbPmekPfEdERbd35pQgtph/58wkfrQ+QZP8j3Q9obr1v9lEguGTsMhK4Wr0yHXlVvUf7p9ShL9WKZnYxe0LkPBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E6mZwP8E; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4162b74f29fso3012535e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Apr 2024 05:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712233591; x=1712838391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rpr5fIy7/+AgecNd2HAhXB49zsFIL2WrvHb8ogKvFrI=;
        b=E6mZwP8EQtRZDPg5sSR2xwkc1fvziS2CrbdcOhSnWX1YtKUpKglDpQa2WVLjzstEoo
         fPmr/ZY2dBeIgj9Q7KepSuc73FEBasSMmZm1zfv++veuaxcBRQwEqdysbr78KvrkWcPz
         O+WkGf9Kv9mjnopN2G+spv0bLzmBw8lQn9vhEZiWwFk6jrVRo9mGnRYZyBkuS9SJP5mN
         oVXAF/P33A6TuD8DhsaKjNfqqhl9qu0kIXbi5g0AT4p4TitJ8VSryw7gi5iirSdLvbCU
         5n5KEa6V87qDjJ76Jp2hJZXT6ux0eoWfC5fV3nX0oQuVLrSPpV4qo316wmnzt2NkgXim
         q1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712233591; x=1712838391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rpr5fIy7/+AgecNd2HAhXB49zsFIL2WrvHb8ogKvFrI=;
        b=DKNkM8WeGXVQlGK6Ii+THLAsAU3wfDzbQYtZ9ZBBU9uwonEqikkX6jz1T1RWxTBiBU
         xJTlM86zzfQmuxJa2Ydm1r28Wwg64eb73rBil0o+Ns8lI5Tx9cNYh7YycxdgK1mjFg0l
         MTpXLMnSoSyx/spvb3+qo2JHF829mD25b6X5xdZ6kx7CUEXvba4fZlQ/LnLTyA7glwHO
         QT3EHq9GX/EPqVIJbhXLB0NY6aCbCupg+Y17MdAxevU2YMLtJ4gD8LH/QZF9PitLwc0L
         CkcuSZmtFNAvtxeaTNjOjrJ8EXA2eI9eMmdrYx+UbL7lZYESFjJINwXnCk3nFCxbUQSb
         k7iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVozuHSZ2FA8BWawjHXtVBnQyd83M9EZy6QGjyG7FS2hr61twJjo6/YW1xRqWGchaftl1F1aaWYfynX9I65rc2aiE3wZTo5iEm1/75f6mXU4LQ=
X-Gm-Message-State: AOJu0YyqZt7FaPBKXg+7YXbGMqjbQNiNOM0T2sFNV7hCX2g6WGcEXScq
	GaVGoR4zhWIs0H39OuP+VsFfx5411X5QZNrt1wm9dk7JIxaRzbMnCHKlkYvCe/A=
X-Google-Smtp-Source: AGHT+IFOW2d5Hgxn6C1COoMc+9kLYdSgseWR2Irqv7clovzwdGD/0iiv1jH47LxU9xQ839LZEWufjg==
X-Received: by 2002:a05:600c:358b:b0:414:8a28:6c82 with SMTP id p11-20020a05600c358b00b004148a286c82mr1880403wmq.2.1712233590958;
        Thu, 04 Apr 2024 05:26:30 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([148.252.128.204])
        by smtp.gmail.com with ESMTPSA id bu14-20020a056000078e00b003434b41c83fsm12106303wrb.81.2024.04.04.05.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 05:26:30 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	chanho61.park@samsung.com,
	ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 03/17] dt-bindings: ufs: exynos-ufs: Add gs101 compatible
Date: Thu,  4 Apr 2024 13:25:45 +0100
Message-ID: <20240404122559.898930-4-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
In-Reply-To: <20240404122559.898930-1-peter.griffin@linaro.org>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add dedicated google,gs101-ufs compatible for Google Tensor gs101
SoC.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/ufs/samsung,exynos-ufs.yaml      | 51 +++++++++++++++----
 1 file changed, 42 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
index b2b509b3944d..898da6c0e94f 100644
--- a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
@@ -12,12 +12,10 @@ maintainers:
 description: |
   Each Samsung UFS host controller instance should have its own node.
 
-allOf:
-  - $ref: ufs-common.yaml
-
 properties:
   compatible:
     enum:
+      - google,gs101-ufs
       - samsung,exynos7-ufs
       - samsung,exynosautov9-ufs
       - samsung,exynosautov9-ufs-vh
@@ -38,14 +36,12 @@ properties:
       - const: ufsp
 
   clocks:
-    items:
-      - description: ufs link core clock
-      - description: unipro main clock
+    minItems: 2
+    maxItems: 5
 
   clock-names:
-    items:
-      - const: core_clk
-      - const: sclk_unipro_main
+    minItems: 2
+    maxItems: 5
 
   phys:
     maxItems: 1
@@ -72,6 +68,43 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - $ref: ufs-common.yaml
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: google,gs101-ufs
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: ufs link core clock
+            - description: unipro main clock
+            - description: fmp clock
+            - description: ufs aclk clock
+            - description: ufs pclk clock
+
+        clock-names:
+          items:
+            - const: core_clk
+            - const: sclk_unipro_main
+            - const: fmp
+            - const: ufs_aclk
+            - const: ufs_pclk
+    else:
+      properties:
+        clocks:
+          items:
+            - description: ufs link core clock
+            - description: unipro main clock
+
+        clock-names:
+          items:
+            - const: core_clk
+            - const: sclk_unipro_main
+
 unevaluatedProperties: false
 
 examples:
-- 
2.44.0.478.gd926399ef9-goog


