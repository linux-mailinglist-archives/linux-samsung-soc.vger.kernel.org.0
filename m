Return-Path: <linux-samsung-soc+bounces-975-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0B282974C
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 10 Jan 2024 11:21:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44A3828B7D9
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 10 Jan 2024 10:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04EF405D8;
	Wed, 10 Jan 2024 10:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pSSjqrVB"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7DB3FE30
	for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jan 2024 10:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-40e43e48a16so36607435e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jan 2024 02:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704882070; x=1705486870; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rCIwgQ4YttU9lzxXqEJuv2Mwb9Cj5TAyRM4oPuL0tc0=;
        b=pSSjqrVBqeKGCgJvkWJH9XuOMGfkW68S2D7bZohMhksRmmiNkSlE2HOud44/b958JL
         Htt3Ej7Kq1yBERhGXlLeWpyXFMuVliZVQMs9K+RyiB1jSyj4iF3dCKifwFu3rav+BYIJ
         reYHyhySUq39WJcCOSXV7+wrhtmB8wVAyO7nqYPkO2V4IvHBPALPe/CJ1jIM1VffjvQf
         QlJqvY9OYF/hROFY7AAc8Rwo1siz29HAY+KQ2erGH/yf1qjqvzwLjHqW7MQ8r4VZpy5t
         OFnopphX8ZaRAmxwnh44xL/6ZE2FALZ4ReLQpmU+t0nyVbYjSH9eKJtlU99nDnu2cjyT
         MKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704882070; x=1705486870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rCIwgQ4YttU9lzxXqEJuv2Mwb9Cj5TAyRM4oPuL0tc0=;
        b=LpiHPE3XP3howAcu5KmvS5X53SPc0DrCxicIvGW52fd2nkDYZIp8L9djp6+j/gVxIQ
         ODpRFDD790QQ8jJoRFA40fycFXt4/zN038sBrd/XRxMX8A8OrqYsKV1xghBUbdWeIql+
         mrCttduhpH4f4zDbVGQ7mj0bPfzIaLm/iR81BEqm+17teSsAUvahiodh70woeGn4Iju9
         0kE01BuXejaX6ibGkt48Lc0mk0k05tj00irS8hQv7jhqr6qEv4o1AXyxs40edoe4joaP
         8DavaQG+iHBO/ff6LS/LzsHlAK6840Jx7VzwgUJIfZkZtYPUvzbrV6Bt3uy/15FXAYnT
         /mHA==
X-Gm-Message-State: AOJu0YxZtgSXXU+BzJQLku9ofM5ao+R1y20DxOHFhgpLR9tZ4Py4tTKM
	wHGFZd4S/YLrv13G00V6LGqLOajqxzxzig==
X-Google-Smtp-Source: AGHT+IHt/P5/L5xH5AAfveckh63ganb8NEGmYwtf9RT0JC1yoNO6aAavNRUXC/fTYmqSHMRcJOKt7w==
X-Received: by 2002:a05:600c:2143:b0:40e:4156:9059 with SMTP id v3-20020a05600c214300b0040e41569059mr371775wml.177.1704882070457;
        Wed, 10 Jan 2024 02:21:10 -0800 (PST)
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
Subject: [PATCH 04/18] tty: serial: samsung: sort headers alphabetically
Date: Wed, 10 Jan 2024 10:20:48 +0000
Message-ID: <20240110102102.61587-5-tudor.ambarus@linaro.org>
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

Sorting headers alphabetically helps locating duplicates,
and makes it easier to figure out where to insert new headers.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/tty/serial/samsung_tty.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
index 74bc5151dad4..f37d6724bfe5 100644
--- a/drivers/tty/serial/samsung_tty.c
+++ b/drivers/tty/serial/samsung_tty.c
@@ -21,26 +21,27 @@
  * BJD, 04-Nov-2004
  */
 
-#include <linux/dmaengine.h>
+#include <linux/console.h>
+#include <linux/clk.h>
+#include <linux/cpufreq.h>
+#include <linux/delay.h>
 #include <linux/dma-mapping.h>
-#include <linux/slab.h>
+#include <linux/dmaengine.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
 #include <linux/math.h>
 #include <linux/module.h>
-#include <linux/ioport.h>
-#include <linux/io.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/init.h>
+#include <linux/serial.h>
+#include <linux/serial_core.h>
+#include <linux/serial_s3c.h>
+#include <linux/slab.h>
 #include <linux/sysrq.h>
-#include <linux/console.h>
 #include <linux/tty.h>
 #include <linux/tty_flip.h>
-#include <linux/serial_core.h>
-#include <linux/serial.h>
-#include <linux/serial_s3c.h>
-#include <linux/delay.h>
-#include <linux/clk.h>
-#include <linux/cpufreq.h>
-#include <linux/of.h>
+
 #include <asm/irq.h>
 
 /* UART name and device definitions */
-- 
2.43.0.472.g3155946c3a-goog


