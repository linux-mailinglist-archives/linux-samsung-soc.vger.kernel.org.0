Return-Path: <linux-samsung-soc+bounces-976-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A8B82974E
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 10 Jan 2024 11:21:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 97D311C26537
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 10 Jan 2024 10:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234D6405F5;
	Wed, 10 Jan 2024 10:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HtIJ7gBc"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BCA3FE2B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jan 2024 10:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40e461c1f5cso35229905e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jan 2024 02:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704882069; x=1705486869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fsnoBIJqRKL8fx5Abgy7bxSlqGNMKE0Lqg/re65WEDg=;
        b=HtIJ7gBc23zKjcHLhsbCZg17sUrDa44EqsX0I/awb6sLxYcg6lndV0wMehxwk3oZNB
         iXTb8fT3lWmwOE0ZyU7bq8gy6xd2UicGnwRKgaKdAOmpkyniPY+9fmjScptcBF4lsZK4
         TSbtS7IYNAVfQNpP9g0TWGzsDmLhp2JUYNFiZ6iMVYcJkwr0Ji89sxZwXQqwd2ijmOuX
         lOwPWo6o5KmWsiA7lZXd/h5MNBKRSXpgxBBWxj4+oFWIonhRV/k0mf9XVf7/vr5gG+Ay
         pFO4DPWJCtvw1YZiLFW0AS4Uge14PUNcfYuDyYaX2S30+gK2FrqRbHspQkUqjOSFGPuD
         1cKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704882069; x=1705486869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fsnoBIJqRKL8fx5Abgy7bxSlqGNMKE0Lqg/re65WEDg=;
        b=Yl6yhGw8GRxbgtxj9eh4Lsuhl7ek5sHgARYSUhozmDKT9LskFemwxwezt5CeXB2JmL
         qK7TWguq3Mih8TCqlO725lG3sE0KGkqqnaKXB+uwHli9owXiWhar/AoTHv8oz0BIzCPb
         bLlqOjU0x+Bvii5pBnPs854UO/Qfs6qaUo7k6zuP+gGAkgneMub5D81Vhng/eft8cGqq
         Ox15drqpSt8Tc3m0F4CgEpP0IWT7CbQjNHIPFxRJSy0g1O+h97WtREIprfHHA0rj84M0
         3wqth4h51VKhSAYw1jO8gC3jaUTGZiF0wJLeAGSWxRKIKYJH6sJOTONWQv2vG0LB+MjM
         JiPQ==
X-Gm-Message-State: AOJu0YzCCz8fIOtf1m2lv9OXdVUxSuIFwgABYn3USKr2Qzn3c/4Mp8XB
	/uBnF3h5xGe48apQBNNKVHHXMd/D/uUsBQ==
X-Google-Smtp-Source: AGHT+IFyetyaA6/1wjXTRap8gF7AQlclivTZB7k1d1dyppWTKQU0nJEVHPWzIx2rYQXgLUJlRHX0RA==
X-Received: by 2002:a05:600c:32a7:b0:40e:44eb:c40 with SMTP id t39-20020a05600c32a700b0040e44eb0c40mr312383wmp.30.1704882069641;
        Wed, 10 Jan 2024 02:21:09 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b0040e52cac976sm1625302wmq.29.2024.01.10.02.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 02:21:09 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	andre.draszik@linaro.org,
	peter.griffin@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH 03/18] tty: serial: samsung: add gs101 earlycon support
Date: Wed, 10 Jan 2024 10:20:47 +0000
Message-ID: <20240110102102.61587-4-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20240110102102.61587-1-tudor.ambarus@linaro.org>
References: <20240110102102.61587-1-tudor.ambarus@linaro.org>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 20ec6ef1a52f..74bc5151dad4 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -2810,6 +2810,17 @@ OF_EARLYCON_DECLARE(exynos4210, "samsung,exynos4210-uart",
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


