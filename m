Return-Path: <linux-samsung-soc+bounces-2976-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA04E8B6EC2
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 30 Apr 2024 11:50:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AF8A283EF0
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 30 Apr 2024 09:50:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1601272AB;
	Tue, 30 Apr 2024 09:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ltkFyhT9"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943301292D8
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Apr 2024 09:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714470591; cv=none; b=Rv/Z+T3U+N1eFTvXty/R3kRzWD5CCTazFQKY9oUOjDpw+EkT91mSas374Vj/aCFECUcKnjTR0BNIZvdeHk+7de3vZdQOVPUKVr8Ij+YTeAQn2rxL725A8LYr7m8yN+KMBJ2wtMu0E85aysZiX9ae19M6SsiMor4AwsPxvgH/Ae4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714470591; c=relaxed/simple;
	bh=OHbOYwGssa/uRbe/4TDCDGAgML0a+7L1EyAmdQh+g64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k0ICnyuOVdADuhlZlPUGnNN8nClcho/xUOQghB3SdeSNiU65WqnRBFk0BB/CvJdpyNSjrmRz8z/jEhau3sIZsZb74hliuXeYPxKXL4xsDtTDtoQCc6xIMB/ovv2dJ2bqjQvUMbpxsajlYRyyOTy5xcO4Q+4kIafpg9AizE+Keiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ltkFyhT9; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5708d8beec6so6809708a12.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Apr 2024 02:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714470588; x=1715075388; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RQWtsOUn4uiQZnL3yK4nvk33ev/xiP7OrIVV8S/1ztQ=;
        b=ltkFyhT95nj8pO9wThMZEQvHEmTz3RyQLK5nrn8dRt+SS0gP1UgWc6gpxKkinKY+nA
         lWH1Z39yFULrLtpP0Xb1/+bQRByATFr1b8MM4LftuP2BLHsAS70fGHYcVlL1cyoq3slE
         ffNE+twrLNx8FzBvmwY0D1KSh/THkKklprWHWMzdShLLGMl/cODIsBxXUsMShOSs7OOa
         MEYPMSxM5UV4L2JyJA6CYDFNgEduw0YVDm4XJhYxdIF7kSyBUIQG1OqHgeojYbDuRUHR
         1GOv96Hm4iBqnMpTzkEdBE+uaRhd0XXl86j8KGW588HccyAAPaDsj5W4ks32pNytxA7Q
         gbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714470588; x=1715075388;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RQWtsOUn4uiQZnL3yK4nvk33ev/xiP7OrIVV8S/1ztQ=;
        b=m36xMJ7d3lcDDT0713i1yWIYCqBwJKVtnFUfXXRVxl4pypxADM6u1X8ODSR67sAiBL
         YW40TNwkzEWhl6nmKwFgqik9gJWWTt4ajvnD7AwbIv1w3gaqQc2iSE8deHr48FayXIS7
         F6V3GlCzxVe7+hDZFLjxKzcUJE7syzvawjukItXOdC0yrXZsz6wRutrQzaNHQ17OAIQ/
         7CKiN0VSwa9uPjEJnDpF8VCrU9geqQAj1Mujp/kJK9gHWfBi3vSTSI7G3/QbDmgoJZDa
         o1D6o2X3yRKAU8li+km/C9YztJdJLllOAr7SIg/7WfGiBS46Ob5JL3/p4Se6xUyTFD4T
         bjSA==
X-Forwarded-Encrypted: i=1; AJvYcCU9PO/njrLPFKcRkOLB7xzdldMv6o4mZleoFuoZp1LgbapJ17saBH1MhUnCxj0FjqIyaQ6msU15XEUmoqpcP+wH2JcQ2TIKuaIN3DhVRW89a98=
X-Gm-Message-State: AOJu0YzvuCjeCeVIvfs6Ifq5/GpXlC4kBLFxDOYJ4RFx36Kbt6KClILG
	qPAWjLPgG6L8wt31NuvqXlCUPHYJTYYBesg9rHs2z/Z+SFHo31WlbkWo788/9WBJo5MQrqYlty2
	oVxc=
X-Google-Smtp-Source: AGHT+IEoom4Vqr7lbv//R3RxM/1laAb6TlYrC1ySF0XtZVJmwN8LfDJIm9U7jADH3cDQk5w64A0ZoQ==
X-Received: by 2002:a17:906:1416:b0:a58:7304:9cd6 with SMTP id p22-20020a170906141600b00a5873049cd6mr11074938ejc.24.1714470588009;
        Tue, 30 Apr 2024 02:49:48 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id dk21-20020a170907941500b00a55aee4bf74sm10981024ejc.79.2024.04.30.02.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 02:49:47 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 30 Apr 2024 10:49:46 +0100
Subject: [PATCH v2 1/4] arm64: dts: exynos: gs101: specify bus clock for
 pinctrl (far) alive
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240430-samsung-pinctrl-busclock-dts-v2-1-14fc988139dd@linaro.org>
References: <20240430-samsung-pinctrl-busclock-dts-v2-0-14fc988139dd@linaro.org>
In-Reply-To: <20240430-samsung-pinctrl-busclock-dts-v2-0-14fc988139dd@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

This bus clock is needed for pinctrl register access to work. Add it.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index e3b068c1a2c1..f2c7c2a4ce1c 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1348,6 +1348,8 @@ pmu_system_controller: system-controller@17460000 {
 		pinctrl_gpio_alive: pinctrl@174d0000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x174d0000 0x00001000>;
+			clocks = <&cmu_apm CLK_GOUT_APM_APBIF_GPIO_ALIVE_PCLK>;
+			clock-names = "pclk";
 
 			wakeup-interrupt-controller {
 				compatible = "google,gs101-wakeup-eint",
@@ -1359,6 +1361,8 @@ wakeup-interrupt-controller {
 		pinctrl_far_alive: pinctrl@174e0000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x174e0000 0x00001000>;
+			clocks = <&cmu_apm CLK_GOUT_APM_APBIF_GPIO_FAR_ALIVE_PCLK>;
+			clock-names = "pclk";
 
 			wakeup-interrupt-controller {
 				compatible = "google,gs101-wakeup-eint",

-- 
2.44.0.769.g3c40516874-goog


