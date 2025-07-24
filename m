Return-Path: <linux-samsung-soc+bounces-9506-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 443C1B1112B
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 24 Jul 2025 20:51:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 70F3D5A0F02
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 24 Jul 2025 18:51:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33BB02EACE9;
	Thu, 24 Jul 2025 18:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="d+4z05Es"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32033207A2A
	for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Jul 2025 18:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753383095; cv=none; b=fOR8OHTVfLEl79ok8Nq+HAFgfSQ5lJ19wbLRS1wfNMsRHrJeuTTlsi4NfVsy0qUGeGWmPjrT4h9fPuppXEnihyjm1Bc6PUdhs1WkwBaIY31LPQ4GqR8Elj/nRILeBuMCmGPCE+DTJ6G2d3irFv8bq5Gg0R/aBzYGG9+CsBpcwyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753383095; c=relaxed/simple;
	bh=ZZmsQxNSXVSlKbD4hblSWDN+9ZTkdbUjQl3Id3eEgog=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SYiv8+UPJzdcBdFSud2Wvc/cAqM52T84fwTpoj4CX+jOM6cQih0QVuaX0yc2e1XMHMHSVumxa9J/dFVuksIPzxRP07ORlpJuiOGjo2hWR0yQnis6u1bn/1nydNEQSuoNAu2m55xhGIZzh/3tRYkRbyNacX496WD0tJIM8zw1a6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=d+4z05Es; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1753383091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8FW//f7wNjk6myGF7GHWZ1mveETa44O0KLrX1cwlSIQ=;
	b=d+4z05EsoHp3A9zKEA1xISr3Uhg6aDfhZ3gujhjXQgDbBUeb6Mh065VqRc0TmQF4uvJ2Bd
	O8R45M1hOq5nx8TIRubv26yf9GVIjFGKsMqJyvPNHZnoasS3lEtMHIKvCztrrc3nbYBoEU
	XRIMVtivAOpQd5yPxGuGyp9za7m9yAc=
From: Henrik Grimler <henrik@grimler.se>
Date: Thu, 24 Jul 2025 20:50:52 +0200
Subject: [PATCH v2 2/3] drm/bridge: sii9234: use dev_err_probe where
 applicable
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-exynos4-sii9234-driver-v2-2-faee244f1d40@grimler.se>
References: <20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se>
In-Reply-To: <20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org, 
 linux-kernel@vger.kernel.org, Henrik Grimler <henrik@grimler.se>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2016; i=henrik@grimler.se;
 h=from:subject:message-id; bh=ZZmsQxNSXVSlKbD4hblSWDN+9ZTkdbUjQl3Id3eEgog=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBogoCmRmfOnqSJs0gNwRXGMh1B9WLaJnlt4ZUHi
 gR22U6FtyuJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCaIKApgAKCRCwB25JC3Fh
 a+t1B/wNatsEVxbiPHGP5Kd8Ya1L8+tIjsXa6O0VnAUFeTgnSgjKrEA10zxUtQjOwU2riHYfF7/
 iPV1voGFqnfSasDLb+PBd/5EoymKF1tszPsh1qdSykbk80Z/4/ghjHO5BDU3gk6f9YHzRbwOOca
 dvKknWOS0fLRTByvXAlo1cHdWVxAE/3eOyOZb5HWy40YHgUTHdPFkZ6KiIK3EZRTK2vjZF/rYdQ
 b0zW+tf9Ff1lic1GKwJyb8tJGvKkBFDppHQTybUH4XvlpIOow/zZStTpMKVKyGp7+d8IRcOVZGO
 UYrbv6REXX15BtEsBP946uEMiCRWiDMEqh05PrdLKLuRZ94y
X-Developer-Key: i=henrik@grimler.se; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-Migadu-Flow: FLOW_OUT

In case of error during resource acquisition the driver should print
an error message only if it is not deferred probe. Use dev_err_probe
helper to handle this, which will also record defer probe reason for
debugging.

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
v2: no changes
---
 drivers/gpu/drm/bridge/sii9234.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index 930117bbba87285e62107389606897740516eb0a..0e0bb1bf71fdcef788715cfd6fa158a6992def33 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -825,10 +825,9 @@ static int sii9234_init_resources(struct sii9234 *ctx,
 	}
 
 	ctx->gpio_reset = devm_gpiod_get(ctx->dev, "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(ctx->gpio_reset)) {
-		dev_err(ctx->dev, "failed to get reset gpio from DT\n");
-		return PTR_ERR(ctx->gpio_reset);
-	}
+	if (IS_ERR(ctx->gpio_reset))
+		return dev_err_probe(ctx->dev, PTR_ERR(ctx->gpio_reset),
+				     "failed to get reset gpio from DT\n");
 
 	ctx->supplies[0].supply = "avcc12";
 	ctx->supplies[1].supply = "avcc33";
@@ -836,9 +835,7 @@ static int sii9234_init_resources(struct sii9234 *ctx,
 	ctx->supplies[3].supply = "cvcc12";
 	ret = devm_regulator_bulk_get(ctx->dev, 4, ctx->supplies);
 	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(ctx->dev, "regulator_bulk failed\n");
-		return ret;
+		dev_err_probe(ctx->dev, ret, "regulator_bulk failed\n");
 	}
 
 	ctx->client[I2C_MHL] = client;
@@ -911,10 +908,9 @@ static int sii9234_probe(struct i2c_client *client)
 					sii9234_irq_thread,
 					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
 					"sii9234", ctx);
-	if (ret < 0) {
-		dev_err(dev, "failed to install IRQ handler\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "failed to install IRQ handler\n");
 
 	ret = sii9234_init_resources(ctx, client);
 	if (ret < 0)

-- 
2.50.1


