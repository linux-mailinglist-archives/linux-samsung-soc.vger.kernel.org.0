Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB318609D1
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  5 Jul 2019 17:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727620AbfGEPz5 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 5 Jul 2019 11:55:57 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:37061 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725813AbfGEPz5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 5 Jul 2019 11:55:57 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
        by youngberry.canonical.com with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
        (Exim 4.76)
        (envelope-from <colin.king@canonical.com>)
        id 1hjQYw-0003VR-28; Fri, 05 Jul 2019 15:55:50 +0000
From:   Colin King <colin.king@canonical.com>
To:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/exynos: remove redundant assignment to pointer 'node'
Date:   Fri,  5 Jul 2019 16:55:49 +0100
Message-Id: <20190705155549.15836-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer 'node' is being assigned with a value that is never
read and is re-assigned later. The assignment is redundant and
can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 50904eee96f7..2a3382d43bc9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -267,7 +267,7 @@ static inline void g2d_hw_reset(struct g2d_data *g2d)
 static int g2d_init_cmdlist(struct g2d_data *g2d)
 {
 	struct device *dev = g2d->dev;
-	struct g2d_cmdlist_node *node = g2d->cmdlist_node;
+	struct g2d_cmdlist_node *node;
 	int nr;
 	int ret;
 	struct g2d_buf_info *buf_info;
-- 
2.20.1

