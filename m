Return-Path: <linux-samsung-soc+bounces-1789-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D58C84CA28
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Feb 2024 13:04:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D54AE1F2834F
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Feb 2024 12:04:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 968D459B57;
	Wed,  7 Feb 2024 12:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yq3eLGWP"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E045A0E8
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 12:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707307480; cv=none; b=TlxQ6bynrtvzDJoG4yzzctKxiM/t06/EW8ksDPj4X/NXhgkEcv4nliiGO1T1gMq4VSj45wAhplD3vHGmE/MLsGYf87CnGzDvFu5MZXtcGHjlNfnY8wOHim1139vD2+nQxZcXBI72bYLIzHPoZEcNJNcdIgHfxj2S2oY0AkJBG6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707307480; c=relaxed/simple;
	bh=AnLwycXdBVE0epbdNtCzrwoG32399eRX3Btv9asIRSw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E4En8ljFE5v4h0lduejyrvhZwBRGwtCfuJlj0zcZfVfxfMcxU1mIHfCvLqJjg1ID7rtvsK2wh62DawuCN6IUZp06fqZconz4vHx7AwyTTTG66bbh3iaoGsKcY3N0aGjxUb7P89+5Ag/FscLWQGly7ux5zzps33kt+BXexquSkwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yq3eLGWP; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4101da33362so1378075e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Feb 2024 04:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707307477; x=1707912277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zdo0fmuE55cpgCbqIv6yz5I24yw/ORXoHuxyLqonuwI=;
        b=yq3eLGWP2Ql7ih0E21hImgX4MaGHQ+MIPm3/TtWVbuhq50/SKj6YDBeJa+tdwtVvXd
         Fo+u7Ucw4MyN+HRKVlrhDL6TxB9O4m2D+Y3r67EBt9xbX1JgWBoP/odH5PGEaW7oWGO1
         yVjYGQqGCndi6xDtCuueJSCHnHjRaOiShOIV/70EljuI4FpqZDdgwanzgoUekwuQcWWE
         4GoWDaou+Kyq5tEXkYGc+zmyS9BfmBptw8y+thLRZ5u3yZFCHQ5FT/iTOvVy4BoYgwBo
         fKBkc5iahz5HdUDo7EULMBmYSea/2RX34fvcGdpMTlnHUD4/UWTphK3GEACL8rXTvd44
         3EAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707307477; x=1707912277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zdo0fmuE55cpgCbqIv6yz5I24yw/ORXoHuxyLqonuwI=;
        b=gY+BPOnrlnDbfcgOwiF2XdpVPVgZJV6vRa5BV4nGHE7sTNnrYbFs/es/17IxN60BBZ
         +MLu6Vk87luaBROxvn1/fGt5493m8AMEia7LTQHcnsCE0ANQSD1EvpRBtiB39ccK/iTO
         rZNHLqqhYKCvdzo/b9Cl6PlYJBhCtDzQH4UrkmcrkI6KsQt0LlUr2zEo4E4YxuLuYVt+
         BJRCoKkviyk3TgQA763WKjguggHVvy6M37jswhfol2NuOBRZZjF/VPFDZccZCRq2dLUO
         cL9wY17rIew/XV6nTc+80ItB31W/wtCbZGbEpUE8/2CXKphFgG47Ng3KHiudVR1+91J0
         9EuA==
X-Forwarded-Encrypted: i=1; AJvYcCUMCYNPMKwiKtTUt7Vw0JElNixGkyBmx+EHAcuEj4SgU7QR/r1QSTz0Miwco/lUbYyT7Y51VY9MRFl4ejihqWpj5cRqLl9h+83/6HaL8abaoyk=
X-Gm-Message-State: AOJu0Yw8o4w/c602obq5nYVXvbwwkzLN2MmO1LTnQYC+L71KZ5Sof9im
	qrluWn+NQBvvZiyAN+DUHA2dC8IhtjmXqRyhNnkXLB68cGHiRI6ctWcl7KvZWCc=
X-Google-Smtp-Source: AGHT+IEypKdykDzu/tKaqOqmwHNG7/BNsMvzV8sXO62jO+/BOvGfaYqhdbWbxaM7efCR8TPr5Xfrwg==
X-Received: by 2002:adf:ff8e:0:b0:33b:176a:a4aa with SMTP id j14-20020adfff8e000000b0033b176aa4aamr3468479wrr.50.1707307476847;
        Wed, 07 Feb 2024 04:04:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUi2uDHW12fd8bTBIEJb33lrqpGayokIIXFLsLlG4r31z2Abk2VXTjCZh6AZbxwINjKdN+U8UWML48RlXFfUh+xfMJjnCMGsD+TtJIY97VMu4MeAKHIlZ880aFiTGVfPjDIzmGRSK7fOTylpW7NT/USYnG5b0Lqk/9xD4d8gqeeRPFXuGLFYIiAvn0qcBDPapyxdnWcFdKbZZvP0ahJkoAy/WqlzboD0NNRRo7d6MhHjUOKdAUCHgGj04RzkFeAk9udjMKNFdYFAu3LkHyMIy7G80HUqPwDfRAshV99Ig+oCtAurlTPBS1up1BzgFHxpysC+oMvlY2N4xSAaP4jE10NemPNnNV1v0h1wAnmfoL82Hwg6iEFq/QSupL3YmyiSQVTa0DMHHdEAbCTw5wxnZ8E+PLwp3zCjFzaHLFou0W9uKUOyZfMlMnwnBdmi/Jw9YQobdGck1EaIy0ZOjcmAdBagVcD3ZUgdbkg6/AUbkcjRdglsasRXcghrzwDcA==
Received: from ta2.c.googlers.com.com (105.168.195.35.bc.googleusercontent.com. [35.195.168.105])
        by smtp.gmail.com with ESMTPSA id d15-20020a5d644f000000b0033b44a349e1sm1349967wrw.38.2024.02.07.04.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 04:04:36 -0800 (PST)
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
Subject: [PATCH v5 00/17] spi: s3c64xx: straightforward cleanup
Date: Wed,  7 Feb 2024 12:04:14 +0000
Message-ID: <20240207120431.2766269-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch set has no dependency although Sam prefers to have this simple
cleanup queued after the gs101 patches from:
https://lore.kernel.org/linux-spi/20240207111516.2563218-1-tudor.ambarus@linaro.org/

Tested with gs101-spi.

Changes in v5:
- don't abuse the Fixes tag, it was wrongly used for:
    - explicit header inclusions
    - possible negative array index fix, which is just a posibility,
      it never happened
    - typo fix
- reorder patches, sort headers then explicitly include the missing ones
- new patch: "spi: s3c64xx: explicitly include <linux/types.h>"
- collect R-b tags

v4:
- drop "spi: s3c64xx: use bitfield access macros" patch as there was
  no agreement on how the reg fields should be handled.
- don't change the style in s3c64xx_spi_dt_match(), drop just the
  unneeded casts
- collect Sam's R-b  tags

v3:
- reworked the bitfied access macros patch so that the bit operations
  are the same as before the patch. Fix S3C64XX_SPI_PSR_MASK value,
  drop S3C64XX_SPI_CS_NSC_CNT_MASK.
- add a new patches to explicitly remove a duplicated definition and to
  drop a superfluous bitwise NOT operation.
- collect R-b tags

v2:
https://lore.kernel.org/linux-arm-kernel/36a664b1-666d-4fc4-90d9-35b42e56973d@linaro.org/

Tudor Ambarus (17):
  spi: s3c64xx: sort headers alphabetically
  spi: s3c64xx: explicitly include <linux/io.h>
  spi: s3c64xx: explicitly include <linux/bits.h>
  spi: s3c64xx: explicitly include <linux/types.h>
  spi: s3c64xx: avoid possible negative array index
  spi: s3c64xx: fix typo, s/configuartion/configuration
  spi: s3c64xx: remove unneeded (void *) casts in of_match_table
  spi: s3c64xx: remove else after return
  spi: s3c64xx: move common code outside if else
  spi: s3c64xx: check return code of dmaengine_slave_config()
  spi: s3c64xx: propagate the dma_submit_error() error code
  spi: s3c64xx: rename prepare_dma() to s3c64xx_prepare_dma()
  spi: s3c64xx: return ETIMEDOUT for wait_for_completion_timeout()
  spi: s3c64xx: drop blank line between declarations
  spi: s3c64xx: downgrade dev_warn to dev_dbg for optional dt props
  spi: s3c64xx: remove duplicated definition
  spi: s3c64xx: drop a superfluous bitwise NOT operation

 drivers/spi/spi-s3c64xx.c | 81 ++++++++++++++++++++-------------------
 1 file changed, 41 insertions(+), 40 deletions(-)

-- 
2.43.0.687.g38aa6559b0-goog


