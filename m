Return-Path: <linux-samsung-soc+bounces-990-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB5082977B
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 10 Jan 2024 11:26:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3A9B1C2106D
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 10 Jan 2024 10:26:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 582F0487BD;
	Wed, 10 Jan 2024 10:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CQE4ccSf"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B320D482F3
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jan 2024 10:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e4f692d06so9991325e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jan 2024 02:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704882082; x=1705486882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ummHx1igHBI+mPkPK31ezfxthw+Jgvbj/YdjUw2HyQ4=;
        b=CQE4ccSfqXSc+BhOt4XrXWba/QxpMhZcLYvTEBkWHsowNrLyZafLJZiZjDESoDRhCg
         lJWf127dheRmWez0fjaKfQ5AthFF9NyuDbrWkn3x+c6oz2i3WiJvTrUkVLNjxx5tHE84
         2KQaxpgKa64pgc/et4xsC19sx9A7TalzxcJ7cSx9wjIXyvTf9ANde+uq3dBuoa0fpFJB
         HAHIIt/dGldVMlYQl9qsGnJjG2NZXX2sOKN8leHy8HKyWgD53Q79emymHzQKWpn7IRTv
         gbw54kXDNSnjapn1r8t55M3e6dlSqI9aysM85ZxNaGlzpJijWevQhrC5RUSC46KoI9SK
         nmrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704882082; x=1705486882;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ummHx1igHBI+mPkPK31ezfxthw+Jgvbj/YdjUw2HyQ4=;
        b=XuWXbtZBiVju6/uVh7rlL6sbJx3pM4GV42orMF5VapIBgftrzneP5LHY2nfytRQd/V
         ggWNh9k14OeKEzbhB2J1paSrc8DDAabDyrQL3uCNWsXfIePvK1RHg7ybgt2PmItZ26bE
         G0U2jcrESuXGo5MOQJ1eaVXvnisShr63pCFpoGQQBRsWS90hTulBiVlDPQ2t4zmJoY0z
         1YwvTs3Ak6NdkbDgHU9RJW7QkbWxKj8xjFsahvOi3bBLX/GQhWB1RnLMIVuVg6b/5Siq
         +0s5KdI8J6SIhr+KrkOvYRKCllmIFQc/L9940a34pAZNY3Dw8QKFOr6Vs9qaA16An6dC
         i/mQ==
X-Gm-Message-State: AOJu0YwOTvbKabPtNxLdG3iJDfme0ilx33ZcXV8HV10I2ewEMceQIw2i
	jxK84KZCB+UC7pZAx+AjMCt5VHCSzc1PTA==
X-Google-Smtp-Source: AGHT+IG0xYD6noOiAF06pJmAKPKFGS5k9kf0z5T6NNAMgrhXlZB3r2GVRIKB+IrSXxoBiSdSWW9UzA==
X-Received: by 2002:a7b:ce99:0:b0:40d:88b8:1bd1 with SMTP id q25-20020a7bce99000000b0040d88b81bd1mr525747wmj.185.1704882082174;
        Wed, 10 Jan 2024 02:21:22 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id j7-20020a05600c190700b0040e52cac976sm1625302wmq.29.2024.01.10.02.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 02:21:21 -0800 (PST)
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
Subject: [PATCH 18/18] tty: serial: samsung: shrink memory footprint of ``struct s3c24xx_uart_info``
Date: Wed, 10 Jan 2024 10:21:02 +0000
Message-ID: <20240110102102.61587-19-tudor.ambarus@linaro.org>
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

Use u32 for the members of ``struct s3c24xx_uart_info`` that are used
for register interactions. The purpose of these members becomes clearer.

The greater benefit of this change is that it also reduces the memory
footprint of the struct, allowing 64-bit architectures to use a
single cacheline for the entire struct.

struct s3c24xx_uart_info {
	const char  *              name;                 /*     0     8 */
	enum s3c24xx_port_type     type;                 /*     8     4 */
	unsigned int               port_type;            /*    12     4 */
	unsigned int               fifosize;             /*    16     4 */
	u32                        rx_fifomask;          /*    20     4 */
	u32                        rx_fifoshift;         /*    24     4 */
	u32                        rx_fifofull;          /*    28     4 */
	u32                        tx_fifomask;          /*    32     4 */
	u32                        tx_fifoshift;         /*    36     4 */
	u32                        tx_fifofull;          /*    40     4 */
	u32                        clksel_mask;          /*    44     4 */
	u32                        clksel_shift;         /*    48     4 */
	u32                        ucon_mask;            /*    52     4 */
	u8                         def_clk_sel;          /*    56     1 */
	u8                         num_clks;             /*    57     1 */
	u8                         iotype;               /*    58     1 */
	u8                         has_divslot:1;        /*    59: 0  1 */

	/* size: 64, cachelines: 1, members: 17 */
	/* padding: 4 */
	/* bit_padding: 7 bits */
};

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 598d9fe7a492..40dceb41acb7 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -75,15 +75,15 @@ struct s3c24xx_uart_info {
 	enum s3c24xx_port_type	type;
 	unsigned int		port_type;
 	unsigned int		fifosize;
-	unsigned long		rx_fifomask;
-	unsigned long		rx_fifoshift;
-	unsigned long		rx_fifofull;
-	unsigned long		tx_fifomask;
-	unsigned long		tx_fifoshift;
-	unsigned long		tx_fifofull;
-	unsigned long		clksel_mask;
-	unsigned long		clksel_shift;
-	unsigned long		ucon_mask;
+	u32			rx_fifomask;
+	u32			rx_fifoshift;
+	u32			rx_fifofull;
+	u32			tx_fifomask;
+	u32			tx_fifoshift;
+	u32			tx_fifofull;
+	u32			clksel_mask;
+	u32			clksel_shift;
+	u32			ucon_mask;
 	u8			def_clk_sel;
 	u8			num_clks;
 	u8			iotype;
-- 
2.43.0.472.g3155946c3a-goog


