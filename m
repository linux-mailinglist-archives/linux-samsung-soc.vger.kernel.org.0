Return-Path: <linux-samsung-soc+bounces-1268-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCE783C553
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Jan 2024 15:51:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85A162963F3
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Jan 2024 14:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5DF56EB4F;
	Thu, 25 Jan 2024 14:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WStO+iGr"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4836EB7B
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 14:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706194217; cv=none; b=rOQkTBPRR+H8Lmf9pa+NIx9nnIOPSxE5uLUMendcI/PXtvyTWjZ7n/vWuudinKkbZDtNh9s0ulQZRuMoS7WMHc3bVEUZLpDHRG0rTYLfh9DVtwn9KQHfqrdYIr8e77yGfZRWLqhnAGSa5iwiA19y8+So2pbfbbC70Jk0dmtgpDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706194217; c=relaxed/simple;
	bh=ESbWEf4Jl9fYqrFI7JEFHOnujDBpgh6Ob+8gu7+WPuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qqb+rSTEx81BAm9p5A6McKxHYyXWGQofCt116AWCm67qdBYh8qB+SNKxoQQJ7T3rRCVJ+OqnVykhQDOwgar6+IA0AUYLfgXjVSqb8VEtiZ16fEgiWZ9GITHAcXxojKUR2yC0eMdH5wGk1i2s0DA5kaCclIJFpW+cKUjkqM65HUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WStO+iGr; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40e80046264so85752735e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 06:50:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706194211; x=1706799011; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=600VwywIwYkKhIBCMOdOgBJMPRHlSjpGBD3EGORG+P4=;
        b=WStO+iGr/5wpfdSt1NLmo9yZqJuzerEHKe3BT1t0HU60Jnb3MwGdoFrVyRFxvyFUWH
         9/hVv4pwCrXXSbjmosye2fC2WQyKkNRLjjNPZpvI78Uq2tBfXVskeNOaLfepRyW/hVka
         JDdTtaSXdD26U6rMMU9djs9U4MSPeNn9rwmWXF52VYZ6nR/4YWl2a1JwOTMvuFTHHHx+
         YEvN11g0bPSZ9pLkIEQh9zc6lmwGSfF2b5iaAhO3CzFbfFMjxCIbZibXYQHip/fN5Nqb
         gyfGh42gauoE5QEq1gVjhKOV0JzfujuuZ/qZW6ZpQJnGARhQA/qxKLRYrXwyKTo0Jndu
         kKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706194211; x=1706799011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=600VwywIwYkKhIBCMOdOgBJMPRHlSjpGBD3EGORG+P4=;
        b=Z2SL59G6xe2W2Kx+ZWe9SpoWM0OymfyncRHGLeIqpOCM/gdD0mB2AxQDJDMMTGETm3
         6w2Dar0qUcLt1dcS4Mr3EgdO5NJ1SF7rV23nRfFfI1Z59LOIasuZ0PS4Ku37O5/Ym/Ha
         ib7rcAypLKM1fKns1HV/tar+ZQVzSK5Y7oyO7JL1Dj7md+yqMpWpz9WYJEE5uNnpvdE1
         E/O+hjVEopTQUq/0KeE7MekycUdp/d/hmXm/KmrCpq+qmt3Gs/rv5G6wYaMt9HAO/CFk
         M8evsHZeLpPid+XA2fAvi9cYFLoatdbGAaqMEycQWAQJeD5lUV6rZEknI5fkzASyYgib
         EScQ==
X-Gm-Message-State: AOJu0YxCmelJ37ZHG7i1+uBl7Qzqo+5TeqeDqOzu516izh0S8XpCHVET
	jAxuw+zZu/zonJUwpVfBCW/nMyL+jDm9KOiOdSfvGzNXFEbe89WxCbXNLyvon6I=
X-Google-Smtp-Source: AGHT+IEaYzPIhvI7nM66SS0HQQAjOEL9yTE6fWlerWtlckq2lzwAF+Fj0dxMxnPO6we+g9RXHphCpQ==
X-Received: by 2002:a05:600c:44c9:b0:40e:50e7:db2c with SMTP id f9-20020a05600c44c900b0040e50e7db2cmr564908wmo.177.1706194211539;
        Thu, 25 Jan 2024 06:50:11 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id v17-20020a05600c471100b0040d91fa270fsm2875875wmo.36.2024.01.25.06.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 06:50:11 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: broonie@kernel.org,
	andi.shyti@kernel.org,
	arnd@arndb.de
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arch@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	semen.protsenko@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 01/28] spi: s3c64xx: explicitly include <linux/io.h>
Date: Thu, 25 Jan 2024 14:49:39 +0000
Message-ID: <20240125145007.748295-2-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240125145007.748295-1-tudor.ambarus@linaro.org>
References: <20240125145007.748295-1-tudor.ambarus@linaro.org>
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
2.43.0.429.g432eaa2c6b-goog


