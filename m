Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46F0A32B0BE
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  3 Mar 2021 04:44:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbhCCAzD (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 2 Mar 2021 19:55:03 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:13033 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1445963AbhCBDDH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 1 Mar 2021 22:03:07 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DqMLn4cYNzMgyP;
        Tue,  2 Mar 2021 11:00:17 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Tue, 2 Mar 2021 11:02:23 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <airlied@linux.ie>, <daniel@ffwll.ch>, <krzk@kernel.org>
CC:     <dri-devel@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>
Subject: [PATCH] drm/exynos/decon5433: Clean up GPIO includes
Date:   Tue, 2 Mar 2021 11:03:13 +0800
Message-ID: <1614654193-40203-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

remove the legacy GPIO headers <linux/of_gpio.h> but what it really
uses is <linux/gpio/consumer.h> since only gpio_desc structs are ever
referenced.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 1f79bc2..9fc51a6 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -11,9 +11,9 @@
 #include <linux/component.h>
 #include <linux/iopoll.h>
 #include <linux/irq.h>
+#include <linux/gpio/consumer.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
-- 
2.7.4

