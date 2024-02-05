Return-Path: <linux-samsung-soc+bounces-1699-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D74EE849AAA
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  5 Feb 2024 13:45:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1B0BFB25A00
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  5 Feb 2024 12:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F25431CA81;
	Mon,  5 Feb 2024 12:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AfrLPn19"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF50B1BC57
	for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Feb 2024 12:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707137121; cv=none; b=UYs6KF292aV6JSeaH54WCUEU+YuXmaOU3KB+/LuEU+KUlxDGNc/jif3tVH7nCev6yhHMyWhv3HGaUJ6DVycR+K0tWqoLtzV0gEWOlh7E1HjEBnECSFbmXzDp3v/SNL/WmCv4zXC+fDiSJQGCcOP/uAKy6FpokCZMlrB4Mx046Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707137121; c=relaxed/simple;
	bh=w5JFDx3igBQ6hCvWUpDTLodih1IhDobo9CBbUVJNHT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NQQKvogLJM88/XN1e+jr7crNvR5GEw4cc61+kK45epgB6prnd52ewGCIXR+jMo1r12Ifd6DLcyUWGdd5VabDa8HR4qMdRdvlgGb1EB65/I33+SVlvvyWWL9l3OTm6Nm47vxwtbcfyBWUq9tamePUA7axa89nK4QxNanczvaRywE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AfrLPn19; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3392b045e0aso2446861f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Feb 2024 04:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707137118; x=1707741918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G5ZHz3RUkQzpbVKYtYrrDh0U5BmbIjj4KbeJaOU/Fns=;
        b=AfrLPn19rAnlYjgMSt3zmwaoRTjgrHtP6XChKelZ3zrZNcueRhteLqgKypIdnUe972
         cVupn9gFODR5HHxQO7lQFSPHs596k0X1leFfVQ22iy/fQTs6ya2FEbdvEiNh3czJ6hxz
         0UI7L870mEscceHvFVzz0n+7FL6u0pjMcmOfgHHWC2yd5F5NQ/GGJAI0keVdYPGiILN1
         zkntVg/i6E7na+nmjzj2H6F9Lur+T02CEBYYsdwM95GRpJ2TWYVDxwBasKkVBzoC97sO
         DKFOGY/XjcxZ3Bi64TB8lJ0CseIqLbx3zB0K0n3Us1yvyNP2ph/WsOO5Gaio17+r6UPW
         fgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707137118; x=1707741918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G5ZHz3RUkQzpbVKYtYrrDh0U5BmbIjj4KbeJaOU/Fns=;
        b=EU8WJVh+7Kh4vbrC+ijoCygnUVDlWoYkgqF6ojgK6X2Rhg9+FHOxHOoUOADkrXVJAB
         Wd1RGLsJTW7dkpjYGCSDerCpMVnsczZF0fg1rCi6+/ePZ7yBlubJw9AI1sGjUP8Xw64u
         LwFg4yOlUHbMWD5cQYOiQjhFZo5syVjRmEd0Hv+22Q4Qp2T/3fX5V2/cpNPDVDn1nenM
         vcE5+Q+CqMv24zjXbjjUIDkJAotNZuYDW+zSMCvuBCekp4yU16xrvIR+wQl/PXmlb8Mj
         6EOsmDUVO9tKUI5cK9p4pSiW4aCyutMd9jwN+jsdG5kGm5rjyRJmjiCCAYBTMx8jawo9
         WRQQ==
X-Gm-Message-State: AOJu0Yz2hVq5/enPlTsVWF+bN+ENIQphKbq79GTQ+4qoL6dppv9LdNu/
	x5KZuPy3o8Sf499kiR61shtUblgzCuI3K8meWdVjYMzl1/uwA1TJ5TW0Gyx5l1A=
X-Google-Smtp-Source: AGHT+IH2g+aR/d3Fae3kdapdUimxpiado+1l+RHT/8yqZSKFvLAV9z7ZolUfNyqRIwCk2qjcXVUgDw==
X-Received: by 2002:adf:e5cf:0:b0:33b:271c:7816 with SMTP id a15-20020adfe5cf000000b0033b271c7816mr5677447wrn.34.1707137117995;
        Mon, 05 Feb 2024 04:45:17 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXtbBtwOp4puWrLL5c/VhRl/CPpo7l2wIBvMapxm89/G7uxlduwkxRUThQZ0QEbczFrOy48ou7ofI5BCEX40lsslzCFFjvWAjmuzT8DjVAW+riZ9tU5nE//rSfXikq78EmH1ppYoo96wXmU/vYmhOfuAEGjukCYaq+1IxulzaxLMtMl4koGrrABfSCPx1y73OJTy4thv/5CfAlkB6PpHktM7bLpjIcgTC+ms0jQsrpjKsj9eQwKOVq0sm7DJdOMsZb5s0mrIEMDqkFSI4+F7+Q6ZfhXh5Lrvc2+bBv2CzNSlKm8k8btEv14J1iv2H7Vq1pmzW9ipVGP8BFDGuKP8S0GQwg2uVB9LpURT2M7q9iuqF4qkZPx4OlNFnn9kqqrpwFtWe2qqbPhI5ju/hL9LSwSgZFo2z8/D82IwbTrrmKlgcSY9fveajc8V715ICpC2OfquSxvtrDUPp3Tj9qMg4DRZf1JBbDbcYaDoqzWM4SOw2SUaiu5kmkqiu5i1Q==
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id n9-20020adff089000000b0033b35da384fsm3650812wro.33.2024.02.05.04.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 04:45:17 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: broonie@kernel.org,
	andi.shyti@kernel.org,
	semen.protsenko@linaro.org
Cc: krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v4 01/16] spi: s3c64xx: explicitly include <linux/io.h>
Date: Mon,  5 Feb 2024 12:44:58 +0000
Message-ID: <20240205124513.447875-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
In-Reply-To: <20240205124513.447875-1-tudor.ambarus@linaro.org>
References: <20240205124513.447875-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver uses readl() but does not include <linux/io.h>.

It is good practice to directly include all headers used, it avoids
implicit dependencies and spurious breakage if someone rearranges
headers and causes the implicit include to vanish.

Include the missing header.

Fixes: 230d42d422e7 ("spi: Add s3c64xx SPI Controller driver")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/spi/spi-s3c64xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 7f7eb8f742e4..c1cbc4780a3b 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -10,6 +10,7 @@
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
+#include <linux/io.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/spi/spi.h>
-- 
2.43.0.594.gd9cf4e227d-goog


