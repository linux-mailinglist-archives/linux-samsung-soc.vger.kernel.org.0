Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07A2833ABB7
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 15 Mar 2021 07:41:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229679AbhCOGlV (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 15 Mar 2021 02:41:21 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:13604 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbhCOGku (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 02:40:50 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DzRb53VyRz17L66;
        Mon, 15 Mar 2021 14:38:57 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Mon, 15 Mar 2021 14:40:45 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <inki.dae@samsung.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
        <krzk@kernel.org>
CC:     <dri-devel@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>
Subject: [PATCH] drm/exynos/decon5433: Remove the unused include statements
Date:   Mon, 15 Mar 2021 14:41:26 +0800
Message-ID: <1615790486-54440-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This driver doesn't reference of_gpio.h, so drop it.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 1f79bc2..1510e4e 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -13,7 +13,6 @@
 #include <linux/irq.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
-- 
2.7.4

