Return-Path: <linux-samsung-soc+bounces-1227-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA5A83B1DA
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 24 Jan 2024 20:08:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87C0F1F22399
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 24 Jan 2024 19:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A750132C03;
	Wed, 24 Jan 2024 19:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="byT6uExd"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAF6131E53;
	Wed, 24 Jan 2024 19:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706123262; cv=none; b=eN7yf6wWjb2wqQ8B6O8FWbvMMLKqYbOwQCKzliwt6AezSOZ/fZuRGpDH6Ohe+YTllaYmcssgmatzTnNmwMuqus+y9wBnl7GjuP6jdSKgrDIt9hDZiisEFjlMs0PoWCXeOWQJlVUDhGelGrjmzuMqWSdBZqweX4Dx0SE+5K5TdZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706123262; c=relaxed/simple;
	bh=TdxQU3YryQCBnITLJXSQAWFjdGX2PU9YEPKxMGf1UwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q/WklsoHBjXO4vSUWoH34sDwEklUtr6L4lqSida6vMu+JRQSqN2eai5ebm+dfpTKZodFst0edTvj3DnVoX2TGMXZIvwEnIKOPEDOf6KbOZMBY8t8d9UvswxgXeHd+RcBq3wMKdp+UZ/4PoC8aM4sZMXjG71NQBGXTLC1lZs7mXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=byT6uExd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BDE4C433C7;
	Wed, 24 Jan 2024 19:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706123261;
	bh=TdxQU3YryQCBnITLJXSQAWFjdGX2PU9YEPKxMGf1UwY=;
	h=From:To:Cc:Subject:Date:From;
	b=byT6uExdY4Ky84T/iiyve2BeIlakHz3ow2o8xkpoG+PSvoMWDLhDRfls+oerycyLf
	 HeCuBmrwJBFuFlNfJJjFtAo8MXEBpSMrdc41O59Yg4lYB38j22gTKQnBxp+w8T1+YB
	 M/gUXnMfhl0qP2e8KBO6v+/0iscBGncIZxQNvJYO4TTEGHcQTsYdNekrIxN0zeK4ai
	 1xR9sC5mh1op189gi0blfunq1aua40MMSeAWREBi1tEt+h1uMON+Fg8Q1sPn2O5Y05
	 /xolTm5gOk+52tXO4Ujdilt0eyqv+nlyO5HmbP9hlNaMLTv3ufnQmLZwQZO1G/EfK7
	 Yh3bp6lO5RyYA==
From: Rob Herring <robh@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@wdc.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-scsi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: ufs: samsung,exynos-ufs: Add size constraints on "samsung,sysreg"
Date: Wed, 24 Jan 2024 13:07:33 -0600
Message-ID: <20240124190733.1554314-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'phandle-array' type is a bit ambiguous. It can be either just an
array of phandles or an array of phandles plus args. "samsung,sysreg" is
the latter and needs to be constrained to a single entry with a phandle and
offset.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/ufs/samsung,exynos-ufs.yaml      | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
index 88cc1e3a0c88..b2b509b3944d 100644
--- a/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml
@@ -55,9 +55,12 @@ properties:
 
   samsung,sysreg:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-    description: Should be phandle/offset pair. The phandle to the syscon node
-                 which indicates the FSYSx sysreg interface and the offset of
-                 the control register for UFS io coherency setting.
+    items:
+      - items:
+          - description: phandle to FSYSx sysreg node
+          - description: offset of the control register for UFS io coherency setting
+    description:
+      Phandle and offset to the FSYSx sysreg for UFS io coherency setting.
 
   dma-coherent: true
 
-- 
2.43.0


