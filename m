Return-Path: <linux-samsung-soc+bounces-7557-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC0AA6D195
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 23 Mar 2025 23:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 915C53AA635
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 23 Mar 2025 22:39:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A83E1D90DF;
	Sun, 23 Mar 2025 22:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CYMGyJ2q"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FE81C6FFE
	for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 22:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742769570; cv=none; b=f/+repEMOZ+T03Ypf5ie2osa027dQfnuIDfMjIaYwCKXOf2V8VkTQUC5UonDangyGLQR0Jza8OV+gyTv1oP1lQ/hgO2zsEhtW1O3LA8X3bKarpMsR0rzCLYaeQkh3le6pR4ppc91irWXsuSzpqHrN4N/PgclK/xlqfvw9C7XUno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742769570; c=relaxed/simple;
	bh=yWyEsUV61SIUGSRUBs0R2s8QMDXNnM8dfUs8hI7iDhI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HseLUnH383IxPq6j49VvGhFwvZRuEth5K3RTdkAlBTF8aaLepJiJc8IkIqFlPajEjioocpvY739txNMhS4nMqyujNIJUqxgbH7n32DOmhMtbM02DI7joZXKgVeQI2xR6z7dqHYYgRESFsEBLWLbUCY7WivatCEHkse7BRVCQTWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CYMGyJ2q; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac289147833so457736866b.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Mar 2025 15:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742769565; x=1743374365; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9y2iwGfLCsw/LkK7ASOWMxlU+K/ybzYKfyvSxQC13dg=;
        b=CYMGyJ2qx/SSOxrxrYL05VEaM9hVN5UqiThK8rKWJri6u4f4SD6LRLAdiOFpf+c6Kw
         uYrw8msKNc6pSP0ZygXin8UgmGTqB0i+zAi7hsixnyQF4XpgDtxPngX1gyUCEs9uz1Xb
         B8YL/RT8A2KGqoU/a/9BBhvu/+1oR59eR8+iYzPPlCI+Ku5cLxCmP9qk8ItlVSf94Hk1
         164BzjnVaBuV0X9BwoDg+N/HUrmQWvuP4GtTnl6DbyXEk0OoqcWJO9cYJcjVS+LHL1Gx
         BlXxVIjNMeF0hTMd6Uxk997Ahc2z1kmk6+F663qfSoCkgG0wY5GEQjOr4m7stKAWpSfr
         yoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742769565; x=1743374365;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9y2iwGfLCsw/LkK7ASOWMxlU+K/ybzYKfyvSxQC13dg=;
        b=ttOxanfKJybVGkGS4iWgGfXSmcPYkmZ0pjqrui5Q2DJDKDLNtGznNJjPStTYg2WyUE
         rTu75WBlbAsQechw1KZJwy9VAsZqfnno0WB4vxtEVR4b2PC7H+8XhdVSBhMEmhAeHNYH
         M3Z2CNJpCefJGrDv85xmErM+6DaNx8iyxok++T801rxGJDNUNCBfq01cDzyYa3A9NNPO
         xO+AKjeg+fji1YJqpFYj4FaerIiscgIYBzStLCcYjVqw74Y1jzTlmwGGJlcVYSd7pObP
         o2hWDb2y/D7d2Elz4wy6hY96WG105LomU+O3igAX0KmuhXwrfeC7Oft28Z047XVEycPt
         eiXA==
X-Forwarded-Encrypted: i=1; AJvYcCX0LETQ0lH+GpZXGRDP/vCxrdYEqnuiPmDMx9rcdgJOzMuPRGMBkK0xbKuDbqOvHNyGd+dIo0+DuwIoSIrVDqOYJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwA1npgXZMjmU5SXKq+fm7atcy5uRtfezLVTAD/yJXXXT3sIecj
	CbqvL/+tR+fP7XPVIRiU5X+3y0CdvVj/Na3dpmvJ4V4hujUq+U6X3na9n0rEfWQ=
X-Gm-Gg: ASbGncvaL3v0q36Ulo3+CrDPzLPyTwJzt813GFc+3h1JqzmgZc1wHopu+fctBFaJxwx
	vihAC/Xpc/RVzQRdnac9b3U3PRuOODD9qVMmMUpY5Xeg4PHyx4Ge80yUFoyHPonol6UoYBbKC/q
	3cM8YuTKyyoj6KESXMWR8nY2cs2CDcn4UONMgs0h4yWIs2G2OFdvU/AF3swNxpwIgfP+wgLLXvU
	d2v5CudESkpcT0IdqXhjLoHyZa54xyIv7T9QmBbIweYClei6K48cko0z0bauTC/N62iBwcZoPVZ
	yARPp3jNUXARCtlejjJZU7c7Zoa5hBTVWl5xkHUYihSMgoBp+Z7eHobTgeo/Rp32gwdkOidHQR/
	1l6v08TDMeCqMosdR+J6/U/ofQq94
X-Google-Smtp-Source: AGHT+IGsAC+lKGhqNteT46jfSAPWq5SZvMmaurRX3KpVQHgnAMqrYltc7UBx62PPecd7JPcN0qJQgA==
X-Received: by 2002:a17:907:9805:b0:abf:4c82:22b1 with SMTP id a640c23a62f3a-ac3f2297ac8mr1130529166b.32.1742769565476;
        Sun, 23 Mar 2025 15:39:25 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3ef86e44dsm559686666b.31.2025.03.23.15.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 15:39:25 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Sun, 23 Mar 2025 22:39:19 +0000
Subject: [PATCH 03/34] firmware: exynos-acpm: export
 devm_acpm_get_by_phandle()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-s2mpg10-v1-3-d08943702707@linaro.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
In-Reply-To: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The upcoming Samsung S2MPG10 PMIC driver will need this symbol to
communicate with the IC.

Export it.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/firmware/samsung/exynos-acpm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/samsung/exynos-acpm.c b/drivers/firmware/samsung/exynos-acpm.c
index a85b2dbdd9f0d7b1f327f54a0a283e4f32587a98..7525bee4c6715edb964fc770ac9d8b3dd2be2172 100644
--- a/drivers/firmware/samsung/exynos-acpm.c
+++ b/drivers/firmware/samsung/exynos-acpm.c
@@ -741,6 +741,7 @@ const struct acpm_handle *devm_acpm_get_by_phandle(struct device *dev,
 
 	return handle;
 }
+EXPORT_SYMBOL_GPL(devm_acpm_get_by_phandle);
 
 static const struct acpm_match_data acpm_gs101 = {
 	.initdata_base = ACPM_GS101_INITDATA_BASE,

-- 
2.49.0.395.g12beb8f557-goog


