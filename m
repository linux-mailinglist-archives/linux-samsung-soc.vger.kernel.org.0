Return-Path: <linux-samsung-soc+bounces-84-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6837F5128
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 22 Nov 2023 21:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A93F22815B8
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 22 Nov 2023 20:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E405D8E3;
	Wed, 22 Nov 2023 20:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H5sORdv/"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0629D47
	for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Nov 2023 12:06:10 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40b30308c67so971195e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Nov 2023 12:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700683569; x=1701288369; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3EOznFpP5Wm2+kn1uG/Do2cPlHmY6zYZfJbOPAYwR3c=;
        b=H5sORdv/9BystWaiQuivjt+vLaUn7y6XsfLSe3qrr/nPUTEptZYy2bOoyXJWkzqaMH
         gBlXUt3Zwa0DDDP1cfbUiaDvY0a4Af2F8DSWdQvn6u2G6jOEr4jiOt910q35cvd9TgF6
         tnb3RIUMR/tUxV4NtOc/SnW9oVMrxJ+ocMf0rD9osS+lr6MpS2iC+nvh1xyuPTLLybI9
         9s3B/nKvV59Vu1LN5MNxZ0yNFuFxJ2g0mwxL0SZBOuCYBfm6Qpkfv3ZbiCyErHlBx94g
         RbJrLwOkE1mjiTVzR6hI13YawQncBv6iKbkv92mFN+RlezKVTvPULpTk4MpUfqgwBA1Z
         gmlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700683569; x=1701288369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3EOznFpP5Wm2+kn1uG/Do2cPlHmY6zYZfJbOPAYwR3c=;
        b=taJng69Y5YED9jXpHpsif8dhchR2SapD0NJZ5DByjZQ6DMGknL/ivkxiS0dbwtUe9o
         VxyAyBiGyRzK2U20+flhWxFoAGdwPBku+5mQRNIsbDm/SRuts7sYGZzzXXJWNehJK50p
         24XJ1eVx6m13eFw8GiRLKVMQW4tdDaaFJxcXonxxvtNONb4IumZ1YYJtC5s7/o7VafN7
         hvOPrmUhKIeCHdn0kDluyC5jGdJ5Lb/w9h8VFTxISmCWR6f8/+4qSM7MnoNFd+b6K+QD
         L2S77xI1iouWNbhFmwrefKPTPhMdb/pKNPNyyJtXPh7GyyhzkHvPKMrb4x7gaW0rrlC8
         1Rpw==
X-Gm-Message-State: AOJu0Yxeu24MmEsTxkbfmexVAneXk9H115+hm7UscdDufBF0vXGWXTnp
	sbOnjEdthQ2X9cpahCV8R8fFxQ==
X-Google-Smtp-Source: AGHT+IGCVfLzK8Oe+0XBpSNMCveU4O6Qvzpw6gxialiMohgi0yDnSXJlz9A+pgM+VMFdYfI+HDlEDg==
X-Received: by 2002:a05:600c:138c:b0:408:4cf7:4f91 with SMTP id u12-20020a05600c138c00b004084cf74f91mr2636634wmf.16.1700683569119;
        Wed, 22 Nov 2023 12:06:09 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.100])
        by smtp.gmail.com with ESMTPSA id l17-20020a05600c4f1100b004063c9f68f2sm394665wmq.26.2023.11.22.12.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 12:06:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tomasz Figa <tomasz.figa@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Peter Griffin <peter.griffin@linaro.org>,
	semen.protsenko@linaro.org,
	Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH 3/3] arm64: dts: exynosautov9: use Exynos7 fallbacks for pin wake-up controllers
Date: Wed, 22 Nov 2023 21:04:07 +0100
Message-Id: <20231122200407.423264-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231122200407.423264-1-krzysztof.kozlowski@linaro.org>
References: <20231122200407.423264-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ExynosAutov9 pin controller capable of wake-ups is still compatible with
Exynos7, however it does not mux interrupts. Add Exynos7 compatible
fallback to annotate that compatibility and match the bindings.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Peter Griffin <peter.griffin@linaro.org>
Cc: semen.protsenko@linaro.org
Cc: Jaewon Kim <jaewon02.kim@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
index 417aa56a81f6..c871a2f49fda 100644
--- a/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynosautov9.dtsi
@@ -310,7 +310,9 @@ pinctrl_alive: pinctrl@10450000 {
 			reg = <0x10450000 0x1000>;
 
 			wakeup-interrupt-controller {
-				compatible = "samsung,exynosautov9-wakeup-eint";
+				compatible = "samsung,exynosautov9-wakeup-eint",
+					     "samsung,exynos850-wakeup-eint",
+					     "samsung,exynos7-wakeup-eint";
 			};
 		};
 
-- 
2.34.1


