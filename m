Return-Path: <linux-samsung-soc+bounces-5693-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C559E749C
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  6 Dec 2024 16:42:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1E193188189C
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  6 Dec 2024 15:42:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93C020D51F;
	Fri,  6 Dec 2024 15:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="W/tu/SBl"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 056E220CCEC;
	Fri,  6 Dec 2024 15:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733499731; cv=none; b=Lk+f4KTfzoIXIDoiX6sJbIp5/leuR4rRCnPQBmjrpLV4vJEZkf/YZsYM4HdfhtrALzkobULob69/d38vmTMAsE8RBd0+tebT5lws+/oDQAuOGCIs8z5w3p9LAlJm+/qNlZbhp/0qzlPRBv5tLYr22SjjM+/uqyr7mKINKTCLTX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733499731; c=relaxed/simple;
	bh=bNG16fxeZRe7PkHUfBJcI8c38q4ij6t/20saRuOZksI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PZScQzGqHm+fz/M6kKLPJoBvMTn1f+NWH+ez0/BdbQhsiuo5DPaz9t+BzBuhFQY8HdgtVj0eT1vv62lEoLPGc64bLBZyuPVi+islVTxfSA0g++99C9XxKD9xmMdR9Ce3REIlzqKaXpgRgwZD7qW2Lavlzr0IqeTK2WaNTcArdaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=W/tu/SBl; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y4b9D08PSzGp5w;
	Fri, 06 Dec 2024 15:42:08 +0000 (UTC)
Received: from umer-b550pro4.lan (host-213-78-252-153.as13285.net [213.78.252.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y4b935nmqz2x9V;
	Fri,  6 Dec 2024 15:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733499722;
	bh=bNG16fxeZRe7PkHUfBJcI8c38q4ij6t/20saRuOZksI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W/tu/SBlJVeaT4mkkNWhgF5c/o6VzRuP/s+sDUPj+gON2iQ6m/P72+IGfpfMs24k/
	 Y/OFfvyCD+nvme1cjG3PAILhsoY35LtlKzaA+iDUsGLNwxpd6VMpgjSGy9TKisg8Ue
	 2w/SRa77iflGb8woA2AnDl7CAub+4Eb7leZppH45w7doJFYxtExiYpoCppE5+oxl5x
	 IXg8XMKAzx6TAdXMznus2aL6DGkygcsPmeXhEsnCCzzrqvfLCckn0PCw3oT+8XpzUj
	 dm16NYxyt80TJMAHWqD6W6mD2KkmuwI5EEXFWDU7Ld9UjDkKzBOCdb8ZGZQGiz6urI
	 POE6KD9gQ+WpA==
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	igor.belwon@mentallysanemainliners.org
Subject: [PATCH v5 1/4] dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B and SM-G980F board
Date: Fri,  6 Dec 2024 15:41:46 +0000
Message-ID: <20241206154149.4271-2-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206154149.4271-1-umer.uddin@mentallysanemainliners.org>
References: <20241206154149.4271-1-umer.uddin@mentallysanemainliners.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add devicetree bindings for Samsung Galaxy S20 5G
and Samsung Galaxy S20 board.

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 .../devicetree/bindings/arm/samsung/samsung-boards.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
index 168e77375..fab29f95d 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml
@@ -241,6 +241,8 @@ properties:
           - enum:
               - samsung,c1s                     # Samsung Galaxy Note20 5G (SM-N981B)
               - samsung,r8s                     # Samsung Galaxy S20 FE (SM-G780F)
+              - samsung,x1s                     # Samsung Galaxy S20 5G (SM-G981B)
+              - samsung,x1slte                  # Samsung Galaxy S20 (SM-G980F)
           - const: samsung,exynos990
 
       - description: Exynos Auto v9 based boards
-- 
2.47.1


