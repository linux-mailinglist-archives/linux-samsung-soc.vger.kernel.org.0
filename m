Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C01AC218BCB
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  8 Jul 2020 17:43:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730530AbgGHPlm (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 8 Jul 2020 11:41:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:48556 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730515AbgGHPll (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Jul 2020 11:41:41 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 66D4820874;
        Wed,  8 Jul 2020 15:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594222901;
        bh=B4KbhpoltGExd208/4xHgN1aUeY0aanpA2UIDqaA8Jk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e7hrprns7iZuKnnrVu63EVUGDYiaRWoBbqNZfSCvZSIv1vzbiszw1eOpfcABjipwP
         OiRvTN9b2hb7PkpgN5WDPhELGCFu/CKn7becxuBi5kbLvVuBpSA+ikrc9+U0s/ac6B
         FjL5SRovhG+d12EEaapv1+C7f9fwTjZlCEN/FW+U=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        kbuild test robot <lkp@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Sasha Levin <sashal@kernel.org>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 04/16] drm/exynos: Properly propagate return value in drm_iommu_attach_device()
Date:   Wed,  8 Jul 2020 11:41:23 -0400
Message-Id: <20200708154135.3199907-4-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200708154135.3199907-1-sashal@kernel.org>
References: <20200708154135.3199907-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Marek Szyprowski <m.szyprowski@samsung.com>

[ Upstream commit b9c633882de4601015625f9136f248e9abca8a7a ]

Propagate the proper error codes from the called functions instead of
unconditionally returning 0.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Merge conflict so merged it manually.
Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/exynos/exynos_drm_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
index 619f81435c1b2..58b89ec11b0eb 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
@@ -61,7 +61,7 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
 				struct device *subdrv_dev, void **dma_priv)
 {
 	struct exynos_drm_private *priv = drm_dev->dev_private;
-	int ret;
+	int ret = 0;
 
 	if (get_dma_ops(priv->dma_dev) != get_dma_ops(subdrv_dev)) {
 		DRM_DEV_ERROR(subdrv_dev, "Device %s lacks support for IOMMU\n",
@@ -92,7 +92,7 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
 	if (ret)
 		clear_dma_max_seg_size(subdrv_dev);
 
-	return 0;
+	return ret;
 }
 
 /*
-- 
2.25.1

