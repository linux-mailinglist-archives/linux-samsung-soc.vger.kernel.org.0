Return-Path: <linux-samsung-soc+bounces-1954-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE86A85765E
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 16 Feb 2024 08:06:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5CDA81F24F46
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 16 Feb 2024 07:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797B0156C2;
	Fri, 16 Feb 2024 07:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="raa9/M0A"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7B013AC5
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 07:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708067164; cv=none; b=Ew2yr7c6q+c+0yraVkV0A+6R2PX9fTHA8pfOFtI8uLMSBWr8smfWf/V0Am43Yi4Q4PdWBhRFIadubQOqK68Dxgz7+BBFV60dOFejBwGwKsEZ283UhqYvWy28Lbfc8xFLvvoc6p//TqAVU/ONXTyXf06aPthC/QeQU7de+KqSXHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708067164; c=relaxed/simple;
	bh=UumdA+u7mJW1hsa/1bKQOt92hrmkFZLp9HYQzcowhO4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tgKVybOoGBPF+gfEbN66E+U6IflQJIFoaF2QygRz9EhLP/+IO1OFjOVKAU7B5uetUwk0RCKVS2NDjrnzCL7uCYWYHNIyfbbcHHfri0xENS1bRnYfZ2T85uVyVr1PyL3U3jt2XrjLjE+ONeUF34GrwmO59PFHNTNcbb8Qsqn8bfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=raa9/M0A; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3394ca0c874so289614f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 15 Feb 2024 23:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708067159; x=1708671959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uFOh+ffUHbTzqoNg7f3NtavVRglY5kTfBM1QkaehxhQ=;
        b=raa9/M0ADHybg3Km+WVEYYYwBWYohUB0O3J1xjZLFhytcuPrIUNKFpHIyP8HcCfijk
         vv/zWvRRcWacWxBvMMdnWYCfPcHohzwZ6lDHBhaQtnblk+EguFOaAvjctmZrLmjQJ48T
         JCUP6r8nHoqGci6loztw/OeBrJ9h93uHNH9m5tvpbxgUVcMRYoaScOlue5a2w5M2ZCcZ
         L6tvKYisrc2F+cD+OK+1wPGbB8FcIwxU04cutzKQ8ZcgZEuY1ytjoQkriL/FE2pdke7j
         0Z/uDS7PqN6Xj7HnFT/o0D1XNSLZi6PSj08gGB55USt9LQe6jWUApmeGa89PwZzXhb+Z
         XyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708067159; x=1708671959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFOh+ffUHbTzqoNg7f3NtavVRglY5kTfBM1QkaehxhQ=;
        b=c7NJTuXBJdE+eBhRPuqzmXEJyiD0lpEY0VvzOKGx6BzrDWRo+pvYs9dAXoEIVftUat
         onHJdEb6ErsRzUv8ZKJM9nhquC7qzEpMoRnagAkBCStFh+xV4+R/4P1LfPoqZqYXVycV
         ZZM6mTYyA0Vxq6cFjiqPLYSLp7MfDjMHdJWslmH+IZht3n07BOOO4Oh4jwyPrC4gi2x1
         WKXhPI4BowqHHTxMFeac80UWHvWtX8pPwM5Zmbre8Md7ZWjHPFxI3ProY21NY0q0sb5+
         UabzoNhxMk0M25XQHGfFQkW/tPR7XYJHiwCsfgz+qRr2FX9L5WRD/45xhvKTwZKUpLrU
         +OUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMfma29vtvGBGhixSZUp8cYdnTk5jxyRXDv3t0yIy+hjVPBXf34FjhXmiHW8a5OsZ27C8oNTr7O1KeVKsie4RWjL5nXZp0T7IR5d4hDsNaKBc=
X-Gm-Message-State: AOJu0Yysa532RkXAeblWo75uVYE36zL4xMtEawS9uSUeC4khOOXEYKM3
	7f9hZv2XQ0WP6sqsjqwsMdV4NOP73ZSURpTLiWQX1/ZVqKIeAA/tEfxmwfamCd8=
X-Google-Smtp-Source: AGHT+IGy0mnVYtYozVNTM9NIVBhX9/4wYTRqXkWmb8HX1VziUVkIvro8ChPAqsm7xYi9J/dZTIyEkw==
X-Received: by 2002:a5d:4486:0:b0:33d:d32:2a5b with SMTP id j6-20020a5d4486000000b0033d0d322a5bmr2407932wrq.3.1708067159298;
        Thu, 15 Feb 2024 23:05:59 -0800 (PST)
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id k18-20020a5d66d2000000b0033940016d6esm1298839wrw.93.2024.02.15.23.05.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 23:05:58 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: broonie@kernel.org,
	robh@kernel.org,
	andi.shyti@kernel.org,
	krzysztof.kozlowski@linaro.org,
	semen.protsenko@linaro.org,
	conor+dt@kernel.org
Cc: alim.akhtar@samsung.com,
	linux-spi@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 00/12] spi: s3c64xx: remove OF alias ID dependency
Date: Fri, 16 Feb 2024 07:05:43 +0000
Message-ID: <20240216070555.2483977-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver was wrong as it assumed that the alias values in devicetree
have a particular meaning in identifying instances. This immediately
breaks when there is a dtb file that does not use the same alias values,
e.g. because it only needs some of the SPI ports.

Tested gs101 SPI with spi-loopback-test, all went fine. I updated
exynos850 as it uses the same USI.SPI_VERSION as gs101. Maybe Sam can
test exynos850, if not, we can drop that patch (12/12).

v3:
- fix indentation in dt-bindings
- collect Rob's R-b

v2:
- update bindings to consider the asymmetric case where the RX FIFO
  depth can differ from the TX FIFO depth
- update commit message in patch 11/12 to describe the GS101 change
  (I was wrongly mentioning exynos 850). 

Tudor Ambarus (12):
  spi: dt-bindings: introduce FIFO depth properties
  spi: s3c64xx: define a magic value
  spi: s3c64xx: allow full FIFO masks
  spi: s3c64xx: determine the fifo depth only once
  spi: s3c64xx: retrieve the FIFO depth from the device tree
  spi: s3c64xx: allow FIFO depth to be determined from the compatible
  spi: s3c64xx: let the SPI core determine the bus number
  spi: s3c64xx: introduce s3c64xx_spi_set_port_id()
  spi: s3c64xx: get rid of the OF alias ID dependency
  spi: s3c64xx: deprecate fifo_lvl_mask, rx_lvl_offset and port_id
  spi: s3c64xx: switch gs101 to new port config data
  spi: s3c64xx: switch exynos850 to new port config data

 .../bindings/spi/spi-controller.yaml          |  27 ++++
 drivers/spi/spi-s3c64xx.c                     | 142 ++++++++++++++----
 2 files changed, 138 insertions(+), 31 deletions(-)

-- 
2.44.0.rc0.258.g7320e95886-goog


