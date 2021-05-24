Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C39438E642
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 24 May 2021 14:08:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232665AbhEXMJi (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 24 May 2021 08:09:38 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:3981 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232110AbhEXMJi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 May 2021 08:09:38 -0400
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.60])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FpbWs0HgDzmVYP;
        Mon, 24 May 2021 20:05:45 +0800 (CST)
Received: from dggeme759-chm.china.huawei.com (10.3.19.105) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Mon, 24 May 2021 20:08:04 +0800
Received: from localhost.localdomain (10.69.192.56) by
 dggeme759-chm.china.huawei.com (10.3.19.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Mon, 24 May 2021 20:08:04 +0800
From:   Tian Tao <tiantao6@hisilicon.com>
To:     <airlied@linux.ie>, <daniel@ffwll.ch>,
        <krzysztof.kozlowski@canonical.com>
CC:     <dri-devel@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        Tian Tao <tiantao6@hisilicon.com>
Subject: [PATCH v3] drm/exynos: Use pm_runtime_resume_and_get() to replace open coding
Date:   Mon, 24 May 2021 20:07:57 +0800
Message-ID: <1621858077-21674-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggeme759-chm.china.huawei.com (10.3.19.105)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

use pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
pm_runtime_put_noidle to avoid continuing to increase the refcount
when pm_runtime_get_sync fails.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
v2: drop unnecessary change about if condition.
v3: update the commit message.
---
---
 drivers/gpu/drm/exynos/exynos_drm_mic.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
index 3821ea7..32672bf 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
@@ -268,11 +268,9 @@ static void mic_pre_enable(struct drm_bridge *bridge)
 	if (mic->enabled)
 		goto unlock;
 
-	ret = pm_runtime_get_sync(mic->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(mic->dev);
+	ret = pm_runtime_resume_and_get(mic->dev);
+	if (ret < 0)
 		goto unlock;
-	}
 
 	mic_set_path(mic, 1);
 
-- 
2.7.4

