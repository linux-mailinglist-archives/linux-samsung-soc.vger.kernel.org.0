Return-Path: <linux-samsung-soc+bounces-1141-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F00F08376F8
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 23 Jan 2024 00:00:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 298B01C221D2
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 22 Jan 2024 23:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0CFA4C3B1;
	Mon, 22 Jan 2024 22:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jKiFJ1GC"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12ED44BA91
	for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 22:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705964264; cv=none; b=Z571LKkdyUg0ZFvoPnWuB/q+dkudAjH3bTDXa3Wr6so2+kt9e9use+8rO5aayz8I9rpWTDTnI55QB741KS1d+je6SMghTkHza6EFLWWI7FbA8p/oMFIrIpIunUQX6NQGoV16Uqsh30fuHT3XrXHMcil9vW4CL7fZ3kr/Z4tBJq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705964264; c=relaxed/simple;
	bh=6Fww45r8KMq9qH9gjFBGszYrLznUeDKKB4S+eDk2dqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bl9M6ghenfw6Ww+Sud7rr+LiXsNvxo5PVDeTBWkyE5viF4UndKhNFoyIqmh/X9nztfASF7Lgr1aXNMjjEsmeKosV+lkBfIMSkUYoRecLvYKOakmprd4ZOS4ZCCtfxTnqZhT9W9JhFq+jA4SL8f6OwXsEQZMeaIAIuLt49/ZXRWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jKiFJ1GC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40e80046264so47533625e9.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jan 2024 14:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705964260; x=1706569060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yR0AO5T3Lm52GetAuhWGDlBbvPmAefipWgZrjsJSJcM=;
        b=jKiFJ1GCKKlFtDaECgZa64YK1ExR9aWypvp9vvl5lhUd3K49tl7R+MojlpME9pL3kq
         kw8ZdngSy98q2b2gXYSYMe8q27mIlvuHx6AuErBItlaEVq7tNhQDYianBmVG3OqxIaBw
         gQ9G1Ls1UhJ0gP25eqJT5lh2JyYYXJTcdb8AC1aIzgfHb78kaIhG4CP+J8lojdYa7hkP
         UhO6PqcWlXyAzRb68oBZfnI5SOC582eMaQ8GRL06xtO7EgB2Urtv70hFKDsAKHnURPM0
         JO2ahBDkOViF8pBzCm0/tBNkketXwBEvDzynQpYUCC3DM+vnmUDQokXnaCUYU8UdLxlv
         CdsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705964260; x=1706569060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yR0AO5T3Lm52GetAuhWGDlBbvPmAefipWgZrjsJSJcM=;
        b=pJpqhtzrIoLhZwRKm7uOBYMmq5a34DNhtLO9EcFJ1WjaMc/qLbpmFhUn0wVaeSmSOm
         qtYbg96bjj39JfJx2WXlednfywVLCkFapXnLlpfNYZrWaeiacSU7sRGw250d980kvpvF
         jSra4gLRQFd3XeAn2f9wXbxJovCA09dRkYAe0zJRkTnzfR3eIIFYDNU13jUtQw1/avVo
         5xdtX2RshTob75IFdTapW85NT5452+lrghGStBn05EA2PNAWhqr0syWpdKnhUuQtYmBe
         8dTeTOwA0sJuYeTy81c8I+nRR0s4Mx/EuHxCT9jH2sH5TL6UCy5Obme8JWaxbXgsUXFW
         cF3w==
X-Gm-Message-State: AOJu0YzrGBYH1kw9v7Fyqpwb5i9BfdEw9+1TUvv45su/79Is3KHdyhK0
	AVU6D/6KysLshqTU8Ve8WRl8cueAOqJh2J68sobpBnjhpZqcuwfbjRgZvGLpgMc=
X-Google-Smtp-Source: AGHT+IE/3oSYmQaHmUVIEZrmPeRaKj7ezaMnrpX2IRhfyS/TY5XiBAOhqPClwNkExF4LwyWJ4DWvjA==
X-Received: by 2002:a05:600c:a43:b0:40e:62aa:fa7b with SMTP id c3-20020a05600c0a4300b0040e62aafa7bmr2887046wmq.111.1705964260529;
        Mon, 22 Jan 2024 14:57:40 -0800 (PST)
Received: from gpeter-l.lan (host-92-18-76-30.as13285.net. [92.18.76.30])
        by smtp.gmail.com with ESMTPSA id fa26-20020a05600c519a00b0040e89ff10f5sm19776847wmb.1.2024.01.22.14.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 14:57:38 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: arnd@arndb.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux@roeck-us.net,
	wim@linux-watchdog.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	jaewon02.kim@samsung.com,
	chanho61.park@samsung.com,
	semen.protsenko@linaro.org
Cc: kernel-team@android.com,
	peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	linux-fsd@tesla.com,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH 9/9] ARM: dts: exynos5250: remove deprecated samsung,syscon-phandle
Date: Mon, 22 Jan 2024 22:57:10 +0000
Message-ID: <20240122225710.1952066-10-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240122225710.1952066-1-peter.griffin@linaro.org>
References: <20240122225710.1952066-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

samsung,syscon-phandle is no longer used by the Samsung watchdog driver
to access PMU registers.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/boot/dts/samsung/exynos5250.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/samsung/exynos5250.dtsi b/arch/arm/boot/dts/samsung/exynos5250.dtsi
index 99c84bebf25a..2bbeb0f0d898 100644
--- a/arch/arm/boot/dts/samsung/exynos5250.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos5250.dtsi
@@ -312,7 +312,6 @@ watchdog@101d0000 {
 			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clock CLK_WDT>;
 			clock-names = "watchdog";
-			samsung,syscon-phandle = <&pmu_system_controller>;
 		};
 
 		mfc: codec@11000000 {
-- 
2.43.0.429.g432eaa2c6b-goog


