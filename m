Return-Path: <linux-samsung-soc+bounces-955-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CC83F828688
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  9 Jan 2024 14:00:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD37E1C20F0F
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  9 Jan 2024 13:00:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08BC3A1A8;
	Tue,  9 Jan 2024 12:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XmA0cchq"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F19D39FD9
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Jan 2024 12:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3376ead25e1so1433198f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Jan 2024 04:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704805117; x=1705409917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76U22CGER4KqXBDXUKva048KHZBhjzcIPjnq3/iJdsQ=;
        b=XmA0cchqPso2PFLQlH5YpMaKpq58JiSdBnh4J38xOhs6Yte1HG+LPPk/0GfgNa1AKc
         htRSK1DRHfwSP0ZbiAqkM29mMt8cXxQ/hzEac2ThT93kyjbJWtVMtcDmGqDuGu0lYL8C
         N92Q0eVcqF5F84i6nY9giWfg5sOWlLtqe9clSZbMr2vF/AgZbAI1b59YitA/0fNTSd55
         /ErjveA+lOaocoAyPClasFUNGVNSG+vK6ywKTymv0NQsrJfWWlAYAKEabcTov5ICilFR
         VHGMF0BFmX1vkEqTmtVk+I+u3lzhGGk/Jb8DiJtFHNK1BAbpgFb2rLLxWwkQa+AhA288
         EKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704805117; x=1705409917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76U22CGER4KqXBDXUKva048KHZBhjzcIPjnq3/iJdsQ=;
        b=A/wwUmiifVEtL3J14zn7Ic6wsUKh68eFrxN9FAONS6wgTXDkkcXFnwWnWpTkwuxQas
         XS4L1AVxOhUvqsSozAfWC2sRenkzDtpY5t5SPtU0rJzNKAzYSiv5ppjwaEpMdl4FEacz
         GG0zonP8KiMB+eb0YBGHAWgbpgZLiSXodmjzNrZAMEcKDGpCICq0rNrN5vvqNtcAIc0k
         5i6wuMd/cyW5uqup33V1phcI1LTy5OQjd8+de9Oy2HTaFQChXNsBIFr4TXXSMRlu976I
         hSVSMk0joQWMiEZu/uJ8GP9JEFHq08FmT7897S2znFR96JFMIglPphGrnETwyAJYNZq8
         kXGQ==
X-Gm-Message-State: AOJu0YwBT2Vt8hB9POanCUolwNEpa92vCipgRt0WbO3yGEMxhX4f0Du6
	WV+OtLVF72sa+BWNQRAO/4PyVg+Sc2+Qyg==
X-Google-Smtp-Source: AGHT+IGfTVOxZ1Ho2+dMSFGhcbHn85rCRhUsxpYmob34IB77B2T6ZjXcPLNi8PrEkA4cKi8r5HQUrw==
X-Received: by 2002:a5d:614d:0:b0:336:8d4f:6b1b with SMTP id y13-20020a5d614d000000b003368d4f6b1bmr443504wrt.131.1704805117683;
        Tue, 09 Jan 2024 04:58:37 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id cw16-20020a056000091000b0033753a61e96sm2351302wrb.108.2024.01.09.04.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 04:58:36 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	krzysztof.kozlowski+dt@linaro.org,
	gregkh@linuxfoundation.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh+dt@kernel.org,
	conor+dt@kernel.org,
	andi.shyti@kernel.org,
	alim.akhtar@samsung.com,
	jirislaby@kernel.org,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-serial@vger.kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 06/12] tty: serial: samsung: add gs101 earlycon support
Date: Tue,  9 Jan 2024 12:58:08 +0000
Message-ID: <20240109125814.3691033-7-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20240109125814.3691033-1-tudor.ambarus@linaro.org>
References: <20240109125814.3691033-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The entire bus (PERIC) on which the GS101 serial resides only allows
32-bit register accesses. The reg-io-width dt property is disallowed
for the "google,gs101-uart" compatible and instead the iotype is
inferred from the compatible. Always set UPIO_MEM32 iotype for the
gs101 earlycon.

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v3: collect Peter's R-b tag
v2: update commit message

 drivers/tty/serial/samsung_tty.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index a81b61953a28..fed50423b7c1 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2812,6 +2812,17 @@ OF_EARLYCON_DECLARE(exynos4210, "samsung,exynos4210-uart",
 OF_EARLYCON_DECLARE(artpec8, "axis,artpec8-uart",
 			s5pv210_early_console_setup);
 
+static int __init gs101_early_console_setup(struct earlycon_device *device,
+					    const char *opt)
+{
+	/* gs101 always expects MMIO32 register accesses. */
+	device->port.iotype = UPIO_MEM32;
+
+	return s5pv210_early_console_setup(device, opt);
+}
+
+OF_EARLYCON_DECLARE(gs101, "google,gs101-uart", gs101_early_console_setup);
+
 /* Apple S5L */
 static int __init apple_s5l_early_console_setup(struct earlycon_device *device,
 						const char *opt)
-- 
2.43.0.472.g3155946c3a-goog


