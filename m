Return-Path: <linux-samsung-soc+bounces-5176-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA76F9B527A
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 29 Oct 2024 20:11:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9ED48284A68
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 29 Oct 2024 19:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCCAD2071F6;
	Tue, 29 Oct 2024 19:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tSQ4kbZN"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF079206E93
	for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Oct 2024 19:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730229099; cv=none; b=du8UkgellKAPK5A4MWPnR4Ws3N2JrLI8KI+SEKpwWjGZtPS8D8lG272KOP9exx/QdXr3bEJ2N3uwP/BHXLX3viACG4y12Swtz+4qwNGhnarp6KM16E9NwQWCIpeZZ/mxCKm14HjoqndJ56vrziC1mFcHAcmxQ57IofE0kL7zVV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730229099; c=relaxed/simple;
	bh=A3EDvAkBsrD1MH46YizbfS4xXWc+4ZiRgWy4gj950+k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gQhBtoedRT13Ut+UkEOcdITDTMjK4in433AO0E/w+8jdGSyIaTfEuM+9TEwdsMx89PA6eNNmosqHfSUKsRf8zmlLEOOu27OmBufGWmVUq6ClHhG9StFBdJYlTefC+iQWOi0puT4D3XSZhbyMrfmp+zgogMU/WXnw4eh7dZmPO0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tSQ4kbZN; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so56912385e9.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Oct 2024 12:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730229095; x=1730833895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qg+9BLrsm9SBOJJP8ytNsGKOTVgu1Tvrspr3N36bIrM=;
        b=tSQ4kbZN64zIMrB53lopahtZmEGgQ55O7R+aHFCXjsLQOqgyECJafO5evxr7YYoVmI
         2DdK6+gRG6YZ/jJZyqGAem4bgninLqTRRa2Ntp+RPl5a1p1+dYjmrwmyt8R+C+RMIxOi
         dK4wUun6QbDGDDL5iCKZy8lcQrw90XiZVVZ8NAvtR0253Emo0f40SnHMnPLNV7QJ9+D7
         NjC6+kg9PhrZbR2S/9ECUTOJpbhp8wttXEDY100j69i7lViXUu20AM6R0trYu6W3wgQp
         TPYVHP0dlQK8Ic8qC1AVgxCMDwrtsikCYhCRIQ/0y8LbFN+NVcRva+9Yq6LoZ6D08xcl
         z+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730229095; x=1730833895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Qg+9BLrsm9SBOJJP8ytNsGKOTVgu1Tvrspr3N36bIrM=;
        b=iS95YVTp9XEv0QOEqnVUAYLIv4INPqT23Uqne+EDfvjr8Fmkv7zFN3w7mfMjOVCpWm
         2FYHVCkWaiWd0RLKxDWyeEvFOmgRMHTGlpqXl+vng5c/InEiDCyaFKp/qsnQrruaArqI
         EnAgihydfp4CHnKZVT/Lp5w0ikCPTGNk9M2n8VUToKUAAbYAE9jwLk5hNc/MKe7iIMtu
         WYsVbay1AuBL92J4Gu1zFmjvYEt/ID8R3HhT2Ue/X9oTMX61xFgojzUAQLUjc2BZJkri
         lwUNskG6FQTN3gUhkIM5RbdBtda4FVpWAJVKtTQZNXxCrSWCkvshiP2ma75bH00gdo/e
         IyOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgHM13dV59LHDSaBZQGUfb6rHpk1WFK/XI+AgW4p5HoN1g85t2QcYTlfxeUukVIPY1fzdR82SlQXDSCeWyifXl+A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxcWqzk/qpt6y5fv1hQYPTeJNDJHRNHfAB/HNtfTGTRoHeznG/4
	xyeAb2THsX7SzaKcn6db1gOu6Wu/RgBAeE4xpTUO9beAZdnEsSZbFbVOo5RrMI4=
X-Google-Smtp-Source: AGHT+IFp4YehJs7QQecchQgE7zUujr1IPc5oNzBTFVOT84j09Z72l+JK7DtHPQFmUWtHpLEwEKBdQw==
X-Received: by 2002:a05:600c:4f85:b0:42c:de34:34c1 with SMTP id 5b1f17b1804b1-4319ac7408dmr115069765e9.2.1730229094979;
        Tue, 29 Oct 2024 12:11:34 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058bb4724sm13318763f8f.115.2024.10.29.12.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:11:34 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: wim@linux-watchdog.org,
	linux@roeck-us.net,
	krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH] Revert "watchdog: s3c2410_wdt: use exynos_get_pmu_regmap_by_phandle() for PMU regs"
Date: Tue, 29 Oct 2024 19:11:31 +0000
Message-ID: <20241029191131.2329414-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This reverts commit 746f0770f916e6c48e422d6a34e67eae16707f0e.

Now that we can register a SoC specific regmap with syscon using
of_syscon_register_regmap() api we can switch back to using
syscon_regmap_lookup_by_phandle() in the client drivers.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/watchdog/Kconfig       | 1 +
 drivers/watchdog/s3c2410_wdt.c | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index 684b9fe84fff..f3cd402e5795 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -549,6 +549,7 @@ config S3C2410_WATCHDOG
 	tristate "S3C6410/S5Pv210/Exynos Watchdog"
 	depends on ARCH_S3C64XX || ARCH_S5PV210 || ARCH_EXYNOS || COMPILE_TEST
 	select WATCHDOG_CORE
+	select MFD_SYSCON if ARCH_EXYNOS
 	help
 	  Watchdog timer block in the Samsung S3C64xx, S5Pv210 and Exynos
 	  SoCs. This will reboot the system when the timer expires with
diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
index 686cf544d0ae..349d30462c8c 100644
--- a/drivers/watchdog/s3c2410_wdt.c
+++ b/drivers/watchdog/s3c2410_wdt.c
@@ -24,9 +24,9 @@
 #include <linux/slab.h>
 #include <linux/err.h>
 #include <linux/of.h>
+#include <linux/mfd/syscon.h>
 #include <linux/regmap.h>
 #include <linux/delay.h>
-#include <linux/soc/samsung/exynos-pmu.h>
 
 #define S3C2410_WTCON		0x00
 #define S3C2410_WTDAT		0x04
@@ -699,11 +699,11 @@ static int s3c2410wdt_probe(struct platform_device *pdev)
 		return ret;
 
 	if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
-		wdt->pmureg = exynos_get_pmu_regmap_by_phandle(dev->of_node,
-						 "samsung,syscon-phandle");
+		wdt->pmureg = syscon_regmap_lookup_by_phandle(dev->of_node,
+						"samsung,syscon-phandle");
 		if (IS_ERR(wdt->pmureg))
 			return dev_err_probe(dev, PTR_ERR(wdt->pmureg),
-					     "PMU regmap lookup failed.\n");
+					     "syscon regmap lookup failed.\n");
 	}
 
 	wdt_irq = platform_get_irq(pdev, 0);
-- 
2.47.0.163.g1226f6d8fa-goog


