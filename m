Return-Path: <linux-samsung-soc+bounces-1515-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E89C08410EA
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 29 Jan 2024 18:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 199401C2334A
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 29 Jan 2024 17:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D62776C9D;
	Mon, 29 Jan 2024 17:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wsX0GFU7"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCB23F9CB
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 17:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706550124; cv=none; b=uSjztE9edBOc7iMvCp/f/DJWwoF54NPNY0LSxZfhEkAz3PRr1e/80wMVd15ExRWFhCU0c76G10FaYhmwTdsehoje7UbCsUZAEGHl6t2PQQsf8DgUm3mU+0lhNBsblHPVw+TMmGHoQDp10rNFQrEkkIgBc7QilpDREkb9xor/ySs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706550124; c=relaxed/simple;
	bh=e3HD2P5fWAqvycMD+wnexkmmBJdjI3Y6WONl8XNBJHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VBALdDaBZl7qR9+SsFukyKKKd68Lwv35TSih6y0vjVfH/JzaBhm6UwMuuRE2KjbSC0RTqKo+pJDr75HmFeB4fmt0A0zJkDX5FrxBrqVqT1FU7vs+UKrETNuWGzJuw4crVdVXwRGCm/Ad0/aTNIy0BfuWPY09MwEhdiQ2XRh4qII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wsX0GFU7; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a350bfcc621so313422066b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 09:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706550120; x=1707154920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xd6jUhze5aGDFeWT/A/kqRzQi3hZkYRFem4Ao6EKi/w=;
        b=wsX0GFU75XsM3CcwhIpZKtVaFjRhqg5/FbufZdyBK8va+qRN8RWk6WC3zfiZ+UMKdi
         QUNblRPXJ+7DgKoRg6S6Fg9GulEjcBrm3roelnr6aBz1q50Dd48DYohWNo7k1O9wjmUH
         rR87DzzhyrEDsk0W+2Efd9uh8Y15d/8kKJns2DeaByvKAa87a2J8P+GQWVYJXCWhZ2OX
         QoMwoFFW0sW6/Q1hB0Xd3cEtXgLO2EfLNLECB3Aui5n6R18ADXWFLPvNuW/oUZ0Nih70
         LfvnDTRA/hLWeLlCBEra6/S+aglVlo31tbZ5lDodiXGDIt6coEp0DmJCjjLs13snwO7X
         81aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706550120; x=1707154920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xd6jUhze5aGDFeWT/A/kqRzQi3hZkYRFem4Ao6EKi/w=;
        b=F6CHdFrlbRxvFafDJMNiLh0gOxfaPo1uyaxjcY9AkM/9C8Zh7DFpSOQ8tP/0HA1Ia/
         UEAnsZKz3stFXaIZMhd8ade7dPECzRr/30+11HhZgjZ/zBQZyU78231kFEjlR+Gk3yEy
         6U5LymhLmD1GPnK592QhwUoJUlkmuYWwIN1PQ9VbB/V8ZdXiP0K6Tb/m/E8MPYf3bWuL
         0R0UZRwhLJQAdku5IDPka4UzQz0QF7XF7KzbpDNOgHWWWoVRDbzdK3hu23uYe54B8GVj
         kNffzTe27gM3j5JmPRU0YmnRueji5bHju3D+ACQYVT8ZNPHXnlnSId6pIy+lE511eLEf
         hx5g==
X-Gm-Message-State: AOJu0YyZJbcaZQcn0pJT5JmdvzCStwRtfG5Mq6Z9g+py8NZ30aCk9bRe
	ArtpFdF+nkIwXzAIJSMCX3rvMc4wI+ilLTLRMRham8WGbDzl6YmcU1ggR+Hh2p4=
X-Google-Smtp-Source: AGHT+IF28v6JkrO6MAr+WluRELHvfJImVr1cr0fXZWMxOv9ATx4iAswz/qrgLQOWapOsXd7nN3h4JA==
X-Received: by 2002:a17:906:bcda:b0:a35:53c8:dbd with SMTP id lw26-20020a170906bcda00b00a3553c80dbdmr4544333ejb.35.1706550120723;
        Mon, 29 Jan 2024 09:42:00 -0800 (PST)
Received: from puffmais.c.googlers.com.com (94.189.141.34.bc.googleusercontent.com. [34.141.189.94])
        by smtp.gmail.com with ESMTPSA id qx25-20020a170906fcd900b00a311a360433sm4237765ejb.143.2024.01.29.09.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 09:42:00 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: peter.griffin@linaro.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	inux-kernel@vger.kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/7] dt-bindings: clock: google,gs101-clock: add PERIC1 clock management unit
Date: Mon, 29 Jan 2024 17:40:05 +0000
Message-ID: <20240129174151.1174248-3-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240129174151.1174248-1-andre.draszik@linaro.org>
References: <20240129174151.1174248-1-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add dt-schema documentation and clock IDs for the Connectivity
Peripheral 1 (PERIC1) clock management unit.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

---
v2: collect Reviewed-by: tags

Note for future reference: To ensure consistent naming throughout this
file, the IDs have been derived from the data sheet using the
following, with the expectation for all future additions to this file
to use the same:
    sed \
        -e 's|^PLL_LOCKTIME_PLL_\([^_]\+\)|CLK_FOUT_\1_PLL|' \
        \
        -e 's|^PLL_CON0_MUX_CLKCMU_\([^_]\+\)_|CLK_MOUT_\1_|' \
        -e 's|^PLL_CON0_PLL_\(.*\)|CLK_MOUT_PLL_\1|' \
        -e 's|^CLK_CON_MUX_MUX_CLK_\(.*\)|CLK_MOUT_\1|' \
        -e '/^PLL_CON[1-4]_[^_]\+_/d' \
        -e '/^[^_]\+_CMU_[^_]\+_CONTROLLER_OPTION/d' \
        -e '/^CLKOUT_CON_BLK_[^_]\+_CMU_[^_]\+_CLKOUT0/d' \
        \
        -e 's|_IPCLKPORT||' \
        -e 's|_RSTNSYNC||' \
        \
        -e 's|^CLK_CON_DIV_DIV_CLK_\([^_]\+\)_|CLK_DOUT_\1_|' \
        \
        -e 's|^CLK_CON_BUF_CLKBUF_\([^_]\+\)_|CLK_GOUT_\1_|' \
        -e 's|^CLK_CON_GAT_CLK_BLK_\([^_]\+\)_UID_|CLK_GOUT_\1_|' \
        -e 's|^CLK_GOUT_[^_]\+_[^_]\+_CMU_\([^_]\+\)_PCLK$|CLK_GOUT_\1_PCLK|' \
        -e 's|^CLK_CON_GAT_GOUT_BLK_\([^_]\+\)_UID_|CLK_GOUT_\1_|' \
        -e 's|^CLK_CON_GAT_CLK_\([^_]\+\)_\(.*\)|CLK_GOUT_\1_CLK_\1_\2|' \
        \
        -e '/^\(DMYQCH\|PCH\|QCH\|QUEUE\)_/d'
---
 .../bindings/clock/google,gs101-clock.yaml    |  9 ++--
 include/dt-bindings/clock/google,gs101.h      | 48 +++++++++++++++++++
 2 files changed, 54 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
index 03698cdecf7a..1d2bcea41c85 100644
--- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
@@ -31,6 +31,7 @@ properties:
       - google,gs101-cmu-apm
       - google,gs101-cmu-misc
       - google,gs101-cmu-peric0
+      - google,gs101-cmu-peric1
 
   clocks:
     minItems: 1
@@ -93,15 +94,17 @@ allOf:
       properties:
         compatible:
           contains:
-            const: google,gs101-cmu-peric0
+            enum:
+              - google,gs101-cmu-peric0
+              - google,gs101-cmu-peric1
 
     then:
       properties:
         clocks:
           items:
             - description: External reference clock (24.576 MHz)
-            - description: Connectivity Peripheral 0 bus clock (from CMU_TOP)
-            - description: Connectivity Peripheral 0 IP clock (from CMU_TOP)
+            - description: Connectivity Peripheral 0/1 bus clock (from CMU_TOP)
+            - description: Connectivity Peripheral 0/1 IP clock (from CMU_TOP)
 
         clock-names:
           items:
diff --git a/include/dt-bindings/clock/google,gs101.h b/include/dt-bindings/clock/google,gs101.h
index 64e6bdc6359c..3dac3577788a 100644
--- a/include/dt-bindings/clock/google,gs101.h
+++ b/include/dt-bindings/clock/google,gs101.h
@@ -470,4 +470,52 @@
 #define CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK		78
 #define CLK_GOUT_PERIC0_SYSREG_PERIC0_PCLK		79
 
+/* CMU_PERIC1 */
+#define CLK_MOUT_PERIC1_BUS_USER			1
+#define CLK_MOUT_PERIC1_I3C_USER			2
+#define CLK_MOUT_PERIC1_USI0_USI_USER			3
+#define CLK_MOUT_PERIC1_USI10_USI_USER			4
+#define CLK_MOUT_PERIC1_USI11_USI_USER			5
+#define CLK_MOUT_PERIC1_USI12_USI_USER			6
+#define CLK_MOUT_PERIC1_USI13_USI_USER			7
+#define CLK_MOUT_PERIC1_USI9_USI_USER			8
+#define CLK_DOUT_PERIC1_I3C				9
+#define CLK_DOUT_PERIC1_USI0_USI			10
+#define CLK_DOUT_PERIC1_USI10_USI			11
+#define CLK_DOUT_PERIC1_USI11_USI			12
+#define CLK_DOUT_PERIC1_USI12_USI			13
+#define CLK_DOUT_PERIC1_USI13_USI			14
+#define CLK_DOUT_PERIC1_USI9_USI			15
+#define CLK_GOUT_PERIC1_IP				16
+#define CLK_GOUT_PERIC1_PCLK				17
+#define CLK_GOUT_PERIC1_CLK_PERIC1_I3C_CLK		18
+#define CLK_GOUT_PERIC1_CLK_PERIC1_OSCCLK_CLK		19
+#define CLK_GOUT_PERIC1_D_TZPC_PERIC1_PCLK		20
+#define CLK_GOUT_PERIC1_GPC_PERIC1_PCLK			21
+#define CLK_GOUT_PERIC1_GPIO_PERIC1_PCLK		22
+#define CLK_GOUT_PERIC1_LHM_AXI_P_PERIC1_I_CLK		23
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_1		24
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_2		25
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_3		26
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_4		27
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_5		28
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_6		29
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_IPCLK_8		30
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_1		31
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_15		32
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_2		33
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_3		34
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_4		35
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_5		36
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_6		37
+#define CLK_GOUT_PERIC1_PERIC1_TOP0_PCLK_8		38
+#define CLK_GOUT_PERIC1_CLK_PERIC1_BUSP_CLK		39
+#define CLK_GOUT_PERIC1_CLK_PERIC1_USI0_USI_CLK		40
+#define CLK_GOUT_PERIC1_CLK_PERIC1_USI10_USI_CLK	41
+#define CLK_GOUT_PERIC1_CLK_PERIC1_USI11_USI_CLK	42
+#define CLK_GOUT_PERIC1_CLK_PERIC1_USI12_USI_CLK	43
+#define CLK_GOUT_PERIC1_CLK_PERIC1_USI13_USI_CLK	44
+#define CLK_GOUT_PERIC1_CLK_PERIC1_USI9_USI_CLK		45
+#define CLK_GOUT_PERIC1_SYSREG_PERIC1_PCLK		46
+
 #endif /* _DT_BINDINGS_CLOCK_GOOGLE_GS101_H */
-- 
2.43.0.429.g432eaa2c6b-goog


