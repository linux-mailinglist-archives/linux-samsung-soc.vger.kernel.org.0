Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D8391DFCBC
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 24 May 2020 05:46:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728720AbgEXDq0 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 23 May 2020 23:46:26 -0400
Received: from mta-p8.oit.umn.edu ([134.84.196.208]:51286 "EHLO
        mta-p8.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728716AbgEXDqZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 23 May 2020 23:46:25 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p8.oit.umn.edu (Postfix) with ESMTP id 49V5k75r01z9vYVk
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 May 2020 03:46:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Rk81rbsCvfTI for <linux-samsung-soc@vger.kernel.org>;
        Sat, 23 May 2020 22:46:23 -0500 (CDT)
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 49V5k746Lcz9vYVK
        for <linux-samsung-soc@vger.kernel.org>; Sat, 23 May 2020 22:46:23 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 49V5k746Lcz9vYVK
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 49V5k746Lcz9vYVK
Received: by mail-il1-f200.google.com with SMTP id m7so12347594ill.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 23 May 2020 20:46:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C2t9s0DwevmWJTHcbCKM1B0BY0FZ9/xbKiwLnDDABmQ=;
        b=HYBVSsZzTUiOAKEBXh4AEyJQML8TgLiJb9gqAWCrDSXfFtOW/q43Mtbi5IjQ14Pk/i
         L4T+ww0XRpfoU/gY+WudDS4BftM8K0WMe/0krvj+yu8cumuFDl5b9GhvvY2F6Q/jc7zu
         BImcpoPVI4MH64fOmcq+L1gyWY3u2qjcAB6JPMw7vfQ4rAd03gkonh919/0DUhcWBHPU
         ot1d711bIuAeEydfN6XWj6hzbuGSqtTx/nm8N71kvYmryyLkZYPEakoBKS1AgYo5BnDS
         MtDF2QRLJGav9t3JiMleQ2vQ6FZmh4FJoY3+lPheGKDybUudeWHeVYOd5L/9K4+q73Zl
         mvsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=C2t9s0DwevmWJTHcbCKM1B0BY0FZ9/xbKiwLnDDABmQ=;
        b=Ubor8rDcglxgg75S+MLjWTie/k/zh3TjLYge56GTVi+b4YbkVLjXkfGOJ8nEKF9qjo
         k4jOCPhDHbGQnYUyTtkzgOiPEo5fMkQz0HMe5hrPG+kHpAb4w6Xhmc2PABbPifNoObJ/
         s9VwbcGWZdZ7tr1QzT79kcDyNwSywpzXV+oNJA64LvUDZzLrOBGPoh1+DceRiuOhvBhq
         JNcA3KWINAdK22sA6GBrDfLEfWWwm1gJj9eryja+GyqovmHjYKGqWvjQfEiaWr4vvHTU
         0J6J/F/q0oT3TgePXW5BtLezLsarBGKnKmbRkMfKSpcHH8NRPDHxiF7b4YV7us2RdYuy
         z+yw==
X-Gm-Message-State: AOAM5308WGYuFCBF3jNNex1gJcynI/7QgiUPZceNH9ObeEuCoAB9Jmce
        A8/68j+/icvrvRAe5CI8I8/2oPfFaZaOaHt37t8Cb5rnHV0OK1ACbzz/aEhf4cEQYgNaXl+WEpz
        9o3LlYvTkIAUQibx/Rys5qRy0xaACwCWUGWQ=
X-Received: by 2002:a05:6e02:686:: with SMTP id o6mr19039609ils.280.1590291983126;
        Sat, 23 May 2020 20:46:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfyg+Rnu6GlHWCG/+kmbS/tsUTytjIAPq63m/9v6dt18hUHnlXMuVCjoAfpRscXHhLXbpoZw==
X-Received: by 2002:a05:6e02:686:: with SMTP id o6mr19039595ils.280.1590291982781;
        Sat, 23 May 2020 20:46:22 -0700 (PDT)
Received: from qiushi.dtc.umn.edu (cs-kh5248-02-umh.cs.umn.edu. [128.101.106.4])
        by smtp.gmail.com with ESMTPSA id j14sm5752392ioj.26.2020.05.23.20.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2020 20:46:21 -0700 (PDT)
From:   wu000273@umn.edu
To:     sylvester.nawrocki@gmail.com
Cc:     mchehab@kernel.org, linux-media@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kjlu@umn.edu, wu000273@umn.edu
Subject: [PATCH V2] media: s3c-camif: fix missing disable in tegra_adma_probe().
Date:   Sat, 23 May 2020 22:46:16 -0500
Message-Id: <20200524034616.31625-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

"pm_runtime_enable()" was not handled by "pm_runtime_disable()"
after a call of the function “pm_runtime_get_sync()” failed.
Thus move the jump target “err_pm” before calling function 
"calling pm_runtime_disable()".

Fixes: babde1c243b2 ("[media] V4L: Add driver for S3C24XX/S3C64XX SoC series camera interface")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---

V2: improving commit messages.

---
 drivers/media/platform/s3c-camif/camif-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/s3c-camif/camif-core.c b/drivers/media/platform/s3c-camif/camif-core.c
index c6fbcd7036d6..12ee49638f44 100644
--- a/drivers/media/platform/s3c-camif/camif-core.c
+++ b/drivers/media/platform/s3c-camif/camif-core.c
@@ -500,8 +500,8 @@ static int s3c_camif_probe(struct platform_device *pdev)
 	camif_unregister_media_entities(camif);
 err_alloc:
 	pm_runtime_put(dev);
-	pm_runtime_disable(dev);
 err_pm:
+	pm_runtime_disable(dev);
 	camif_clk_put(camif);
 err_clk:
 	s3c_camif_unregister_subdev(camif);
-- 
2.17.1

