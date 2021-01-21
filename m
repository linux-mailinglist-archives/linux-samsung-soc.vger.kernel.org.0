Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CEFBB2FE109
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 21 Jan 2021 05:47:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731575AbhAUEqG (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 20 Jan 2021 23:46:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726157AbhAUEpZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Jan 2021 23:45:25 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D2F7C0613D6;
        Wed, 20 Jan 2021 20:44:24 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id kx7so808095pjb.2;
        Wed, 20 Jan 2021 20:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YEPwpL8tIwFQ2pgUdTDSsmDRSKgoB9OQrqIbywK9g6k=;
        b=dU9WU1E48oj1RRxS0YgvTzPsbpnhRc/jNgYXGzORXZK2kmMTbQmjpzN1uNz+lKkiNU
         TOaLwOEAb4HlD3elA0CfbOZHOh+b4SKjf3/GELVuSnpAbZ9Y2PkjdN26sSERD6ONqgfM
         FLZd77ZV9iyiG8iRIWR+DzFJQjg3BlPmsjRbU+d45KuBV/dnWMeZVA5cX0g7GhT5QoX/
         Dj6KU3poUouCZqom9b7QhEh8xnGdXPOyBp4QlFHXgTlE7yvoyoEKa2amj7F8wyTgsFvD
         KQuM21l9P5n+zlHdJqhWTFYCUsvpn2ac53gsWGoY0//kn3tKW0q/ddvcrB0QBDV7AdQR
         t8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YEPwpL8tIwFQ2pgUdTDSsmDRSKgoB9OQrqIbywK9g6k=;
        b=Xs2G4r4cHXgPd7K4A6F/Mpq+KK2qo0s/FaFQ9Z9nDQ5N2fVMiWw8PBo+qXU8/2RFWa
         1DWSTn1hMjEuu8NLFV4E49ZsOg4varv5hNA7ZREdFOx0zZgdPwC5A6lhNYRubhnswMsr
         Sr9CrmSaFgGXyz/4KcfbzJbK5yigF7p1bAh/0NwGiO0Z5khg6EK0Atad0lVWmMscPI4F
         silgeSivhM5xWkMfjqTIBeC64MPz11S4iXp1wUMwZsBz27J957DSD/rvZkoHdW6aHUOK
         kXoiBcM54SN/IT1dcEsMSqGgSOirNL2D4Br45xYxfaobGpnoPTGqH4nCIARgwuKUP8N1
         fLIA==
X-Gm-Message-State: AOAM530ZjSZvpIS+nkJdgBZfI8snWAri+65nLZXY0J+5JqfCADpuTKN3
        Qo+yG8fXo6n21dysu4ROkis=
X-Google-Smtp-Source: ABdhPJwJ9hGf8pbMPGeEG6z5iRCJqmXre9McNlr8vNJHe99q8dg0/KYxRa6Y2rusHu50LojxQn4eEw==
X-Received: by 2002:a17:90a:1913:: with SMTP id 19mr4557392pjg.183.1611204263868;
        Wed, 20 Jan 2021 20:44:23 -0800 (PST)
Received: from localhost.localdomain ([49.207.210.174])
        by smtp.gmail.com with ESMTPSA id jx15sm3916014pjb.17.2021.01.20.20.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 20:44:23 -0800 (PST)
From:   Allen Pais <allen.lkml@gmail.com>
To:     herbert@gondor.apana.org.au
Cc:     davem@davemloft.net, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
        jesper.nilsson@axis.com, lars.persson@axis.com,
        horia.geanta@nxp.com, aymen.sghaier@nxp.com, gcherian@marvell.com,
        thomas.lendacky@amd.com, john.allen@amd.com, gilad@benyossef.com,
        bbrezillon@kernel.org, arno@natisbad.org, schalla@marvell.com,
        matthias.bgg@gmail.com, jamie@jamieiles.com,
        giovanni.cabiddu@intel.com, heiko@sntech.de, krzk@kernel.org,
        vz@mleia.com, k.konieczny@samsung.com,
        linux-crypto@vger.kernel.org, linux-mediatek@lists.infradead.org,
        qat-linux@intel.com, linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Allen Pais <apais@linux.microsoft.com>,
        Romain Perier <romain.perier@gmail.com>
Subject: [PATCH v4 16/19] crypto: rockchip: convert tasklets to use new tasklet_setup() API
Date:   Thu, 21 Jan 2021 10:11:23 +0530
Message-Id: <20210121044126.152274-17-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210121044126.152274-1-allen.lkml@gmail.com>
References: <20210121044126.152274-1-allen.lkml@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Allen Pais <apais@linux.microsoft.com>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <apais@linux.microsoft.com>
---
 drivers/crypto/rockchip/rk3288_crypto.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/crypto/rockchip/rk3288_crypto.c b/drivers/crypto/rockchip/rk3288_crypto.c
index 35d73061d156..85f314c79734 100644
--- a/drivers/crypto/rockchip/rk3288_crypto.c
+++ b/drivers/crypto/rockchip/rk3288_crypto.c
@@ -201,9 +201,9 @@ static int rk_crypto_enqueue(struct rk_crypto_info *dev,
 	return ret;
 }
 
-static void rk_crypto_queue_task_cb(unsigned long data)
+static void rk_crypto_queue_task_cb(struct tasklet_struct *t)
 {
-	struct rk_crypto_info *dev = (struct rk_crypto_info *)data;
+	struct rk_crypto_info *dev = from_tasklet(dev, t, queue_task);
 	struct crypto_async_request *async_req, *backlog;
 	unsigned long flags;
 	int err = 0;
@@ -231,9 +231,9 @@ static void rk_crypto_queue_task_cb(unsigned long data)
 		dev->complete(dev->async_req, err);
 }
 
-static void rk_crypto_done_task_cb(unsigned long data)
+static void rk_crypto_done_task_cb(struct tasklet_struct *t)
 {
-	struct rk_crypto_info *dev = (struct rk_crypto_info *)data;
+	struct rk_crypto_info *dev = from_tasklet(dev, t, done_task);
 
 	if (dev->err) {
 		dev->complete(dev->async_req, dev->err);
@@ -389,10 +389,8 @@ static int rk_crypto_probe(struct platform_device *pdev)
 	crypto_info->dev = &pdev->dev;
 	platform_set_drvdata(pdev, crypto_info);
 
-	tasklet_init(&crypto_info->queue_task,
-		     rk_crypto_queue_task_cb, (unsigned long)crypto_info);
-	tasklet_init(&crypto_info->done_task,
-		     rk_crypto_done_task_cb, (unsigned long)crypto_info);
+	tasklet_setup(&crypto_info->queue_task, rk_crypto_queue_task_cb);
+	tasklet_setup(&crypto_info->done_task, rk_crypto_done_task_cb);
 	crypto_init_queue(&crypto_info->queue, 50);
 
 	crypto_info->enable_clk = rk_crypto_enable_clk;
-- 
2.25.1

