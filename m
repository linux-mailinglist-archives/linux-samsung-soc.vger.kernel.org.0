Return-Path: <linux-samsung-soc+bounces-488-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9296680B7AA
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 10 Dec 2023 00:31:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48F2C1F210C2
	for <lists+linux-samsung-soc@lfdr.de>; Sat,  9 Dec 2023 23:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7CBE20DD3;
	Sat,  9 Dec 2023 23:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xjUEjpM4"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D327C123
	for <linux-samsung-soc@vger.kernel.org>; Sat,  9 Dec 2023 15:31:19 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40c38de1ee4so14483545e9.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 09 Dec 2023 15:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702164678; x=1702769478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AlntL3e7CU21B53Om8w1Bn176sZIdCQXro73e+5XJx4=;
        b=xjUEjpM4QMbR6Dj2dnho8IryKnPKO8VmQXSgOTQhTYse/Xbj1QRIzYgsIdcThjBKsF
         URZoLuORelL1Hxy37YdcuAqo0ulHlhAimI3naWpxE4pVz4cAPckS8B2c4hvEhwMGaODU
         7MfL8Jekh4Z2DT2YoJGb6bbjKmNf4Qy+UFqUhU09AnIGUuBAoq81dfKjlbQt4RRlPGYs
         2qsj3oToXMEPdcFAQ8vENSH0if7yJ6PlQ2PzE5dCAps0pzu3/eKIRocTyb2cvVHEaTxH
         dZiJmoxbnsU9b8VyB6nFUZiowsVgkjO6wReUoq9ffNCgCmXM9OSP75e9ADaOzlSTClbR
         c/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702164678; x=1702769478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AlntL3e7CU21B53Om8w1Bn176sZIdCQXro73e+5XJx4=;
        b=TjYhj4yojdYai8XWnXZJ8D8Epo33wtjpX423oThNVbwD3/wadNJN++S5FBP50AF506
         SDybyqxw9rDd9UUvCKcTys04qHwALVDKV9jFiyyvTvZB/DdVzV/dcST7OPIxGtkaQRLM
         TQU+dzGfa6k/FAHJH23NheoD+glvmWxdDNr6x2dY1Zf+EUpE0775q/8cZuug+OF4K0ZJ
         IrQXJlsNNbjRP+bvIlTWcVIh2Dh/bQJ+ZCnP0h6gh9ctnGWrezlNd8RgtkplPKjO1Sdp
         kiE3rsjVkg7MuG8ZW6eq86BxnDbXZeXRbI0Cd5joqj7CKr9j8CmLxo2ShtMgMYTH61aG
         EOxQ==
X-Gm-Message-State: AOJu0YwJRVcyTmcQ4XgjaKLUgAlerAlI4wQ66bLQN/X9jpdwuNEg/tyy
	J5o3vaX0TnuwCV5ZYm3mijQU7w==
X-Google-Smtp-Source: AGHT+IG7dyYZn24iRWJwzOFDMLdk9RqcmFN/SLEXWuhcY+EiXb6lMZj13Q3ubjvMSQZL/cKAexoxcw==
X-Received: by 2002:a7b:c8c2:0:b0:40c:279d:31a3 with SMTP id f2-20020a7bc8c2000000b0040c279d31a3mr1088695wml.176.1702164678218;
        Sat, 09 Dec 2023 15:31:18 -0800 (PST)
Received: from gpeter-l.lan (host-92-23-61-173.as13285.net. [92.23.61.173])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c4f8900b0040c41846923sm1875277wmq.26.2023.12.09.15.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Dec 2023 15:31:17 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v6 03/20] dt-bindings: soc: google: exynos-sysreg: add dedicated SYSREG compatibles to GS101
Date: Sat,  9 Dec 2023 23:30:49 +0000
Message-ID: <20231209233106.147416-4-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231209233106.147416-1-peter.griffin@linaro.org>
References: <20231209233106.147416-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GS101 has three different SYSREG controllers, add dedicated
compatibles for them to the documentation.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 2de4301a467d..127f4ffde76a 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -22,6 +22,12 @@ properties:
               - tesla,fsd-fsys1-sysreg
               - tesla,fsd-peric-sysreg
           - const: syscon
+      - items:
+          - enum:
+              - google,gs101-apm-sysreg
+              - google,gs101-peric0-sysreg
+              - google,gs101-peric1-sysreg
+          - const: syscon
       - items:
           - enum:
               - samsung,exynos5433-cam0-sysreg
-- 
2.43.0.472.g3155946c3a-goog


