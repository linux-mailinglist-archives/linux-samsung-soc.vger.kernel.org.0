Return-Path: <linux-samsung-soc+bounces-2950-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C0BBB8B598B
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 29 Apr 2024 15:12:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B6911B2C9FC
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 29 Apr 2024 13:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9EF670CAA;
	Mon, 29 Apr 2024 13:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u9PKNevT"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF46070CCB
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 13:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714395754; cv=none; b=d/mkwtfk0KMdKIRYJYvQE4QZ1oms3s4S+pNtA1dhlq2Li2s2bp7aSyk9B1omvTkq0ifo5kxd3FeuILmfCdWpQmUYyQcM+i4jhG262xLixdOIAa6exJgNQEAB2vqLBALgwzqj/RaWkCwckWiCQ7Xv/NK2VT3m6JoZEi5m3K0vVas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714395754; c=relaxed/simple;
	bh=DZYBaxqwcEmwPs1ZBYEvDr2ZHYw8sszSnlRnhKCuzPw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=btcYh3tIYCRDIqtHeHFXBWxSAcZVtSV8N4n8tRERLburbSZpbQFolA7MUTxbNjACC+eOmBkPg8gPDrbUr9ZZAj/vJy4qTLsEH2eZfdw1bHr6uSXBj2iuw4tCxEhaFvFEu17byCb36UACOfhGbDO1S1CXr9Av7JQCUeuTAXIc2x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u9PKNevT; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a52223e004dso470093466b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 06:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714395751; x=1715000551; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k8m194tVyfvhAHThcWtJ6ol3HDFzRPp7tqEYrp1oAhA=;
        b=u9PKNevTYtP1iz3H6uwBvkc/g9qRiDIPNOx5AV3/az+PjeXqZV+UAptX5A9c00aOVW
         yOtuW9SjsPvXfpqBsj4DfxW0m0mm2cbte+Va8k0UJEyPq50L/t0ghvSRGl8Gf0JNla2q
         xn82j8b5c6WP+OEQRUk1N7TVCuw8H98H2tR2xMaLPujDeDy7NFZCEnTLdOobOm4qZvKm
         6dE9S+KWVAxJN1H/v7Nhj13oAmJ60xlfSIHYqXdT4F+dKmtTxwuhodQml9Idq0nVszjE
         /OlMPwGK/18s6ZLY4kVkw+ARcmcnA43jffM60ZzYnmmo4Ms18Kb7OPvwpnAEtUn2m5yB
         CnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714395751; x=1715000551;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k8m194tVyfvhAHThcWtJ6ol3HDFzRPp7tqEYrp1oAhA=;
        b=I0U4rnZvuzGK024+D0WgbxTiJKqF6gRYiI6aNTrcsI4beDuYGtII321XpcMwHuUI/w
         CzJ0B5zEM/JyyAQOBpwUTmniKnCV+BT24CVuypaMbYPO0MkdsYIfSGr4bdi1Rg21P4t6
         oi2QEkF27/8wGYzuHgQ0vb+zLPZ8eTZsLj7jsRBv5QIfDbh+DYriiCQYwCPmRB9Kggv7
         EstBqy1Xjd/DCZAxeiLUWygfFk5nxf0N0xACD+N/QCA2p4XbiKZP18rD27q2Tqyg71QR
         GolrFJRKZa+OlTZOMth9Dd6QDzKoFG8jizmIq085DKw31NXZ1Mqyp/gLMgo26ROFlQwZ
         5ukQ==
X-Forwarded-Encrypted: i=1; AJvYcCXH/Jz1vbOBsnXQ7Mz3810hoOx5x62jAT1bqrc2k5UugyCBCN1CstVudw9RQXnxSXD9EedXHnIL40+ADM3G1UdlsvGO2YH3CvxEsP6kOMefPYE=
X-Gm-Message-State: AOJu0YxxUenamlJRj0BDEDbMldPOViGWmWGeRe+Vy2/0AFwX65tJj2+E
	Xmdwtl6a7bXSNjsffs5Zctoyqk0iW6RF3RXwvU3gH7iwC2wac7gcx9FdbFk/KdE=
X-Google-Smtp-Source: AGHT+IEVP/ykRvqh2aa90pf7CIFpzyRJ4k2h16bpOnfAW2//12P8BXsotMhLz9PUd8P9wQcJ3jGoBw==
X-Received: by 2002:a17:906:fcc2:b0:a58:e75e:b04c with SMTP id qx2-20020a170906fcc200b00a58e75eb04cmr5392065ejb.0.1714395750950;
        Mon, 29 Apr 2024 06:02:30 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id dk21-20020a170907941500b00a55aee4bf74sm9976074ejc.79.2024.04.29.06.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 06:02:30 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 29 Apr 2024 14:02:18 +0100
Subject: [PATCH v3 2/3] arm64: dts: exynos: gs101: enable cmu-hsi2 clock
 controller
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240429-hsi0-gs101-v3-2-f233be0a2455@linaro.org>
References: <20240429-hsi0-gs101-v3-0-f233be0a2455@linaro.org>
In-Reply-To: <20240429-hsi0-gs101-v3-0-f233be0a2455@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

From: Peter Griffin <peter.griffin@linaro.org>

Enable the cmu_hsi2 clock management unit. It feeds some of
the high speed interfaces such as PCIe and UFS.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
* s/ufs_embd/ufs
* s/mmc_card/mmc
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 9755a0bb70a1..a0305555c4fd 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1267,6 +1267,18 @@ pinctrl_hsi1: pinctrl@11840000 {
 			interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH 0>;
 		};
 
+		cmu_hsi2: clock-controller@14400000 {
+			compatible = "google,gs101-cmu-hsi2";
+			reg = <0x14400000 0x4000>;
+			#clock-cells = <1>;
+			clocks = <&ext_24_5m>,
+				 <&cmu_top CLK_DOUT_CMU_HSI2_BUS>,
+				 <&cmu_top CLK_DOUT_CMU_HSI2_PCIE>,
+				 <&cmu_top CLK_DOUT_CMU_HSI2_UFS_EMBD>,
+				 <&cmu_top CLK_DOUT_CMU_HSI2_MMC_CARD>;
+			clock-names = "oscclk", "bus", "pcie", "ufs", "mmc";
+		};
+
 		pinctrl_hsi2: pinctrl@14440000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x14440000 0x00001000>;

-- 
2.44.0.769.g3c40516874-goog


