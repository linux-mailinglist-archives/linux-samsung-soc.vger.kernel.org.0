Return-Path: <linux-samsung-soc+bounces-1070-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D986832815
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 19 Jan 2024 11:50:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E1662847A4
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 19 Jan 2024 10:50:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD185524B1;
	Fri, 19 Jan 2024 10:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U1SbTumB"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C705101E
	for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 10:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705661150; cv=none; b=W34ofqBlEzUlsJLSx2kKpQjjVfcC9YGdKPF0pFWZ7ivaCyL/Xwy3pXkKS9etvkEwnHr4jMBbxCwfHZPBK7YjwENhxfJL4s1GVLQ+K5azL+08Yf8MeOAj5UTonyto9NF7OhDIaBC+e6d/xzMByHIVqrSeLXh+ly5dOYf15kIQy60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705661150; c=relaxed/simple;
	bh=YE3UMIIxQ6MMF0Ha1oOA8mHquJPAns0Jxr3xCN4fzZE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CrxYZbpIQsnuWX/t5yhnn0SFms97md/DFIa1mLBEc3pAK16UNt5Nu7L9A0NTfcBhbPIthAY2Djqy/JoMNPKQo+ZF6zk7AaOinP8RIwI/7gqsvC8Os7WM5dvkA3txo0wczv7cJ/4mZ+FyqyUzjdHBh+xmS7341xHBxyMDZuflhgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U1SbTumB; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cd853c159eso7786751fa.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Jan 2024 02:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705661147; x=1706265947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dam+ysOKHmekRdWT+0A8uvWFAbklzxZhnxZqNV/mEds=;
        b=U1SbTumBsQaZprp5gtw2jAVt25pZXzWQkZhBYeAiFS9Y/hVHuZ8ttXt+Z+meR+woTb
         tOWgh1MuYenKQOXbNDD8uRId6Is7GAj58i+p213rVhqgsYUmnbtm9+fvAp4UsrKnFMPK
         PJrHHdE4u04OInVtpu3T4Pb8T6z3lfiQXDPKLk9UkA+mv4agyWNIyci8LFHeBsHZAXvk
         Pk5Rs9GTwIqyqAd2FmgokeGLUpqm48R6oRma1IBODWvdsEbczcxGTwxz6JjBJuWUyI/H
         YTPMiJG3dP0cBGtP/OBtGTD62ghlpJtfnHkmdmNcwEZvJrNiIWADnPQBB9zIf6y/t/qZ
         i3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705661147; x=1706265947;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dam+ysOKHmekRdWT+0A8uvWFAbklzxZhnxZqNV/mEds=;
        b=nUax8EBG+/CDgL3ltdttbLced0QzM6iL3agNKhKIEBWWii7/K9wsUnuK9h3QUU77sh
         tMjZK6MC1xX6ZCLOGjsCYe2N2uyVM23CRWmTc0B1fsFK+dlBHgG98YkKkn82N2XqPFm6
         +NP4YL+cGpTX6QzTP1RaWqcVXt1EgTxda22Nhh5jpUl+VuCC1LLwGIsrmYP0XG8AaW7E
         cozvCwUTbA6rk8yiBYCnB0bbpbPlGfuV96mLS1RtluBoHuwv6GrSfTR18qOZfPCfIMKN
         +GuPR7c5ISR31kNHsJv1ymGKLGSuv0L02orOKg91/d5Q0szcfaFsC7PJ+ZRaKTA6h0CP
         ae4Q==
X-Gm-Message-State: AOJu0Yw9y0+8vN0/BbESmfFqASATU35W1us5w9wAueofvfjBDbhwyuPJ
	bV2J2qZJ2zFF0gyJ78yUuYTzbAziNztHKRY+UTBkReVb2EVpKmAClmEK0NW7qak=
X-Google-Smtp-Source: AGHT+IGXPpDJDvPliaArYGtaldjiGJwnoOPpIjme4o/zZGILHZV61MCszFmCgh4t0thzE2a5w6utjg==
X-Received: by 2002:a05:6512:ac2:b0:50e:7b0d:5b66 with SMTP id n2-20020a0565120ac200b0050e7b0d5b66mr742328lfu.73.1705661147229;
        Fri, 19 Jan 2024 02:45:47 -0800 (PST)
Received: from ta2.c.googlers.com.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id fm16-20020a05600c0c1000b0040ea10178f3sm77470wmb.21.2024.01.19.02.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 02:45:46 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: alim.akhtar@samsung.com,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	peter.griffin@linaro.org,
	semen.protsenko@linaro.org,
	willmcvicker@google.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v2 19/19] tty: serial: samsung: shrink memory footprint of ``struct s3c24xx_uart_info``
Date: Fri, 19 Jan 2024 10:45:26 +0000
Message-ID: <20240119104526.1221243-20-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
In-Reply-To: <20240119104526.1221243-1-tudor.ambarus@linaro.org>
References: <20240119104526.1221243-1-tudor.ambarus@linaro.org>
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
	bool                       has_divslot;          /*    59     1 */

	/* size: 64, cachelines: 1, members: 17 */
	/* padding: 4 */
};

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 0a03df44211d..fcc675603b14 100644
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
2.43.0.429.g432eaa2c6b-goog


