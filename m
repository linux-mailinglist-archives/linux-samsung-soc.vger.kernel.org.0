Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B16EE629F2
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  8 Jul 2019 21:56:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404527AbfGHT4V (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 8 Jul 2019 15:56:21 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:33296 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727163AbfGHT4U (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 Jul 2019 15:56:20 -0400
Received: by mail-pf1-f195.google.com with SMTP id g2so3317698pfq.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Jul 2019 12:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WObWYhhWlfWVBGeUnBqR5A/L2O8ETbPGrJcR8O8Db+c=;
        b=gNmioWhmY2wZycPdn5yPVxFNf4/YAXjwTI9s4RDYwu2xnnlj/3goSphgltDej0PS17
         DC+0ihNLMIIzIMopYL+xn0JNO/PA4Fw9/bp2vL0D8nElqL5DNQ4TfWHa5xnu700NLV10
         gKr3iSyypDw7cCTFJSCs7W4lZhzX8ls4q4IUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WObWYhhWlfWVBGeUnBqR5A/L2O8ETbPGrJcR8O8Db+c=;
        b=lb51eKV9VKK9JJvTW3EUk0bDs2Ep2I8ryehWBqG0J3QIHpqO33144A8L3f1+/cWxfB
         iWyXkTNZt1P74184Nb/Blna6SMMGJaUiOQVFtt4WwWAPpeOJG/7G8PFj5/WjL+irhJJ5
         VuwrEm/e7miiaDdDWbBm5kALL2Nwdd6nJCmlXXadUaYnzrRHR2p8sl0LecV63yIiNRHl
         qjU9X24XPXeuXMoOTKNaqIQR459OQRPbU3nqPqeECsu0SNsWsnQMbxMhlBxoE3MyUYWn
         SSIYVR6/Qtf7YqwCKeKLt6dnhbBVKTrV67ecm9SvUqQbuSjmkr6eKARBQOdXGtp+tM9W
         3DFQ==
X-Gm-Message-State: APjAAAWXGmkORxtkjiu43kMs/R0ilJCDNHTf03qwrNpSTpxa0EvC2WjS
        k8tbPEOFI/4kvZB1+RMpIKDd9w==
X-Google-Smtp-Source: APXvYqx0vPrcrmzmPc2DLYJb81E8l+aNgHwjY9pCxax4+LIpY8c/9QsUPLKt9oRE2ZQV2Jvf9k9JCA==
X-Received: by 2002:a17:90a:bd8c:: with SMTP id z12mr28068802pjr.60.1562615780074;
        Mon, 08 Jul 2019 12:56:20 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id v185sm23322644pfb.14.2019.07.08.12.56.19
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 08 Jul 2019 12:56:19 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Jaehoon Chung <jh80.chung@samsung.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Cc:     linux-samsung-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, briannorris@chromium.org,
        mka@chromium.org, groeck@chromium.org, sonnyrao@chromium.org,
        Douglas Anderson <dianders@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mmc: dw_mmc: Fix occasional hang after tuning on eMMC
Date:   Mon,  8 Jul 2019 12:56:13 -0700
Message-Id: <20190708195613.205729-1-dianders@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

In commit 46d179525a1f ("mmc: dw_mmc: Wait for data transfer after
response errors.") we fixed a tuning-induced hang that I saw when
stress testing tuning on certain SD cards.  I won't re-hash that whole
commit, but the summary is that as a normal part of tuning you need to
deal with transfer errors and there were cases where these transfer
errors was putting my system into a bad state causing all future
transfers to fail.  That commit fixed handling of the transfer errors
for me.

In downstream Chrome OS my fix landed and had the same behavior for
all SD/MMC commands.  However, it looks like when the commit landed
upstream we limited it to only SD tuning commands.  Presumably this
was to try to get around problems that Alim Akhtar reported on exynos
[1].

Unfortunately while stress testing reboots (and suspend/resume) on
some rk3288-based Chromebooks I found the same problem on the eMMC on
some of my Chromebooks (the ones with Hynix eMMC).  Since the eMMC
tuning command is different (MMC_SEND_TUNING_BLOCK_HS200
vs. MMC_SEND_TUNING_BLOCK) we were basically getting back into the
same situation.

I'm hoping that whatever problems exynos was having in the past are
somehow magically fixed now and we can make the behavior the same for
all commands.

[1] https://lkml.kernel.org/r/CAGOxZ53WfNbaMe0_AM0qBqU47kAfgmPBVZC8K8Y-_J3mDMqW4A@mail.gmail.com

Fixes: 46d179525a1f ("mmc: dw_mmc: Wait for data transfer after response errors.")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Alim Akhtar <alim.akhtar@gmail.com>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
Marek (or anyone else using exynos): is it easy for you to test this
and check if things are still broken when we land this patch?  If so,
I guess we could have a quirk to have different behavior for just
Rockchip SoCs but I'd rather avoid that if possible.

NOTE: I'm not hoping totally in vain here.  It is possible that some
of the CTO/DTO timers that landed could be the magic that would get
exynos unstuck.

 drivers/mmc/host/dw_mmc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
index b53b6b7d4dd4..60c3a06e3469 100644
--- a/drivers/mmc/host/dw_mmc.c
+++ b/drivers/mmc/host/dw_mmc.c
@@ -2034,8 +2034,7 @@ static void dw_mci_tasklet_func(unsigned long priv)
 				 * delayed. Allowing the transfer to take place
 				 * avoids races and keeps things simple.
 				 */
-				if ((err != -ETIMEDOUT) &&
-				    (cmd->opcode == MMC_SEND_TUNING_BLOCK)) {
+				if (err != -ETIMEDOUT) {
 					state = STATE_SENDING_DATA;
 					continue;
 				}
-- 
2.22.0.410.gd8fdbe21b5-goog

