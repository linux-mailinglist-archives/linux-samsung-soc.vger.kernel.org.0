Return-Path: <linux-samsung-soc+bounces-946-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 373F0828570
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  9 Jan 2024 12:49:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 31D1F1C23B17
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  9 Jan 2024 11:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A74E381A4;
	Tue,  9 Jan 2024 11:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a+sjo/sI"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBE137179
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Jan 2024 11:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40e4f1f519aso5555635e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Jan 2024 03:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704800952; x=1705405752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5nr7Rmvu09+Hcflla+PbyH0bXs0avlsmc8OnLSB4Wc=;
        b=a+sjo/sIuOiOOBlgcTWUs+bgze96dyPSyBfxP9qyaw++Dn+xOCKcdIYAxUtXW81hr/
         zl/1jDgYmlJ9j0Fesfn8tjxCNcW2RLKaF669qA8JSQ7TcjW2cAw0vitQQUS5XUcT8ikI
         zGKBokF+7yZiT2dSlEfatoQwmnYoTc5IPAaarB7INWh/n3TTgS/6srxEL4K4eJH58Hrt
         frMgJkAnSclHk7oUu4GeUFiSMZGQiN+XJqb5/MozPvs/OmuwaZTWTXKjXBtvJeV6cIoX
         xK/PjAx7jHSR5qvi8A5+OmktGGxXW9aKdcMNesnkJH0Y5d7EYlQAPfwmAsux73rNz9lg
         pFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704800952; x=1705405752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d5nr7Rmvu09+Hcflla+PbyH0bXs0avlsmc8OnLSB4Wc=;
        b=pPew8kzK6jF8hg6mvm5eP/XBAS8hutaAABthKc3ZFqF/d+OmBOLGyoF5xZwoOk2TuM
         WJWTj/dPos1/JUiW0Zc8WUtDXIZ3q2/+DvleqhqGzy4s9UpByg/vpnrBJDOa9hwXsULe
         vQ9jDLQOqJ77EovGS4MKTvCvle/JzqS1zLmTweEc3En6SEeWVfL8bdpnKP6K4cN+AOo8
         nILecXm6IjgdfroJlwN6DTw3mpeQYoIswqCGVxHgA9FlVdUnJw8pUP1UrebD0hCTi2D+
         rl35DPT3VD3j0QDEBO1PaH4gcB0SLCC6Q36W4R/r701vNeMfgKhbxTo/YBlrwxIp9oBV
         B/VA==
X-Gm-Message-State: AOJu0Yxz83prLjNAAnhkB1Aqquy4OBV1cj8nwYUpL3tIudagDaFm65kl
	CnCsTl49phosZyMXdL7bTYbqD1EGA6swkA==
X-Google-Smtp-Source: AGHT+IHXILMnUuCaDOBUpiqCNwP4WdpWBGC0wQ5io82WWALXxNWlKdN+hMGNe79EE+zmkVJmQ8K46Q==
X-Received: by 2002:a05:600c:4d1f:b0:40e:4893:9239 with SMTP id u31-20020a05600c4d1f00b0040e48939239mr1176815wmp.89.1704800952514;
        Tue, 09 Jan 2024 03:49:12 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id bg30-20020a05600c3c9e00b0040d62f89381sm3335699wmb.35.2024.01.09.03.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 03:49:11 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	peter.griffin@linaro.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	semen.protsenko@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/3] arm64: dts: exynos: gs101: comply with the new cmu_misc clock names
Date: Tue,  9 Jan 2024 11:49:07 +0000
Message-ID: <20240109114908.3623645-3-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20240109114908.3623645-1-tudor.ambarus@linaro.org>
References: <20240109114908.3623645-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The cmu_misc clock-names were renamed to just "bus" and "sss" because
naming is local to the module, so cmu_misc is implied. As the bindings
and the device tree have not made a release yet, comply with the
renamed clocks.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 9747cb3fa03a..d838e3a7af6e 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -289,7 +289,7 @@ cmu_misc: clock-controller@10010000 {
 			#clock-cells = <1>;
 			clocks = <&cmu_top CLK_DOUT_CMU_MISC_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_MISC_SSS>;
-			clock-names = "dout_cmu_misc_bus", "dout_cmu_misc_sss";
+			clock-names = "bus", "sss";
 		};
 
 		watchdog_cl0: watchdog@10060000 {
-- 
2.43.0.472.g3155946c3a-goog


