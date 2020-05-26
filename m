Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1AE221B8AFD
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 26 Apr 2020 04:12:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbgDZCMQ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 25 Apr 2020 22:12:16 -0400
Received: from mail-m17613.qiye.163.com ([59.111.176.13]:55090 "EHLO
        mail-m17613.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgDZCMQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 25 Apr 2020 22:12:16 -0400
X-Greylist: delayed 400 seconds by postgrey-1.27 at vger.kernel.org; Sat, 25 Apr 2020 22:12:15 EDT
Received: from ubuntu.localdomain (unknown [157.0.31.122])
        by mail-m17613.qiye.163.com (Hmail) with ESMTPA id DB540482428;
        Sun, 26 Apr 2020 10:05:33 +0800 (CST)
From:   Bernard Zhao <bernard@vivo.com>
To:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     opensource.kernel@vivo.com, Bernard Zhao <bernard@vivo.com>
Subject: [PATCH] drm/exynos: remove no need devm_kfree in probe
Date:   Sat, 25 Apr 2020 19:05:26 -0700
Message-Id: <20200426020526.18462-1-bernard@vivo.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZT1VPTkhCQkJCQk1KQ05IWVdZKFlBSE
        83V1ktWUFJV1kJDhceCFlBWTU0KTY6NyQpLjc#WQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PQg6Ijo4DDg*MEoIITceQjUB
        FUkKCTxVSlVKTkNMQ01NTEhPSUxMVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlKTkxV
        S1VISlVKSUlZV1kIAVlBSU5OTzcG
X-HM-Tid: 0a71b43b8e7093bakuwsdb540482428
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Remove no need devm_kfree in probe.
The change is to make the code a bit more readable

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dpi.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 43fa0f26c052..e06f7d7a6695 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -181,10 +181,8 @@ static int exynos_dpi_parse_dt(struct exynos_dpi *ctx)
 			return -ENOMEM;
 
 		ret = of_get_videomode(dn, vm, 0);
-		if (ret < 0) {
-			devm_kfree(dev, vm);
+		if (ret < 0)
 			return ret;
-		}
 
 		ctx->vm = vm;
 
@@ -233,10 +231,8 @@ struct drm_encoder *exynos_dpi_probe(struct device *dev)
 	ctx->dev = dev;
 
 	ret = exynos_dpi_parse_dt(ctx);
-	if (ret < 0) {
-		devm_kfree(dev, ctx);
-		return NULL;
-	}
+	if (ret < 0)
+		return ERR_PTR(ret);
 
 	if (ctx->panel_node) {
 		ctx->panel = of_drm_find_panel(ctx->panel_node);
-- 
2.26.2

