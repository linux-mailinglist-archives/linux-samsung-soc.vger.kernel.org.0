Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20541179B62
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  4 Mar 2020 23:01:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388410AbgCDWBB (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 4 Mar 2020 17:01:01 -0500
Received: from foss.arm.com ([217.140.110.172]:40268 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388407AbgCDWBB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Mar 2020 17:01:01 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56EA41FB;
        Wed,  4 Mar 2020 14:01:00 -0800 (PST)
Received: from e123648.arm.com (unknown [10.37.12.115])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 20A3E3F6CF;
        Wed,  4 Mar 2020 14:00:54 -0800 (PST)
From:   Lukasz Luba <lukasz.luba@arm.com>
To:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        airlied@linux.ie, daniel@ffwll.ch, kgene@kernel.org,
        krzk@kernel.org, b.zolnierkie@samsung.com, a.hajda@samsung.com,
        Dietmar.Eggemann@arm.com, lukasz.luba@arm.com
Subject: [PATCH] drm/exynos: Fix memory leak and release IOMMU mapping structures
Date:   Wed,  4 Mar 2020 22:00:22 +0000
Message-Id: <20200304220022.8003-1-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

There is a memory leak which left some objects not freed. The reference
counter of mapping: 'mapping->kref' was 2 when calling
arm_iommu_detach_device(), so the release_iommu_mapping() won't be called.
Since the old mapping structure is not going to be used any more (because
it is detached and new one attached), call arm_iommu_release_mapping()
to trigger cleanup.

Found using kmemleak detector, the output:

unreferenced object 0xc2137640 (size 64):
  comm "swapper/0", pid 1, jiffies 4294937900 (age 3127.400s)
  hex dump (first 32 bytes):
    50 a3 14 c2 80 a2 14 c2 01 00 00 00 20 00 00 00  P........... ...
    00 10 00 00 00 80 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<3acd268d>] arch_setup_dma_ops+0x4c/0x104
    [<9f7d2cce>] of_dma_configure+0x19c/0x3a4
    [<ba07704b>] really_probe+0xb0/0x47c
    [<4f510e4f>] driver_probe_device+0x78/0x1c4
    [<7481a0cf>] device_driver_attach+0x58/0x60
    [<0ff8f5c1>] __driver_attach+0xb8/0x158
    [<86006144>] bus_for_each_dev+0x74/0xb4
    [<10159dca>] bus_add_driver+0x1c0/0x200
    [<8a265265>] driver_register+0x74/0x108
    [<e0f3451a>] exynos_drm_init+0xb0/0x134
    [<db3fc7ba>] do_one_initcall+0x90/0x458
    [<6da35917>] kernel_init_freeable+0x188/0x200
    [<db3f74d4>] kernel_init+0x8/0x110
    [<1f3cddf9>] ret_from_fork+0x14/0x20
    [<8cd12507>] 0x0
unreferenced object 0xc214a280 (size 128):
  comm "swapper/0", pid 1, jiffies 4294937900 (age 3127.400s)
  hex dump (first 32 bytes):
    00 a0 ec ed 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<3acd268d>] arch_setup_dma_ops+0x4c/0x104
    [<9f7d2cce>] of_dma_configure+0x19c/0x3a4
    [<ba07704b>] really_probe+0xb0/0x47c
    [<4f510e4f>] driver_probe_device+0x78/0x1c4
    [<7481a0cf>] device_driver_attach+0x58/0x60
    [<0ff8f5c1>] __driver_attach+0xb8/0x158
    [<86006144>] bus_for_each_dev+0x74/0xb4
    [<10159dca>] bus_add_driver+0x1c0/0x200
    [<8a265265>] driver_register+0x74/0x108
    [<e0f3451a>] exynos_drm_init+0xb0/0x134
    [<db3fc7ba>] do_one_initcall+0x90/0x458
    [<6da35917>] kernel_init_freeable+0x188/0x200
    [<db3f74d4>] kernel_init+0x8/0x110
    [<1f3cddf9>] ret_from_fork+0x14/0x20
    [<8cd12507>] 0x0
unreferenced object 0xedeca000 (size 4096):
  comm "swapper/0", pid 1, jiffies 4294937900 (age 3127.400s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<3acd268d>] arch_setup_dma_ops+0x4c/0x104
    [<9f7d2cce>] of_dma_configure+0x19c/0x3a4
    [<ba07704b>] really_probe+0xb0/0x47c
    [<4f510e4f>] driver_probe_device+0x78/0x1c4
    [<7481a0cf>] device_driver_attach+0x58/0x60
    [<0ff8f5c1>] __driver_attach+0xb8/0x158
    [<86006144>] bus_for_each_dev+0x74/0xb4
    [<10159dca>] bus_add_driver+0x1c0/0x200
    [<8a265265>] driver_register+0x74/0x108
    [<e0f3451a>] exynos_drm_init+0xb0/0x134
    [<db3fc7ba>] do_one_initcall+0x90/0x458
    [<6da35917>] kernel_init_freeable+0x188/0x200
    [<db3f74d4>] kernel_init+0x8/0x110
    [<1f3cddf9>] ret_from_fork+0x14/0x20
    [<8cd12507>] 0x0
unreferenced object 0xc214a300 (size 128):
  comm "swapper/0", pid 1, jiffies 4294937900 (age 3127.400s)
  hex dump (first 32 bytes):
    00 a3 14 c2 00 a3 14 c2 00 40 18 c2 00 80 18 c2  .........@......
    02 00 02 00 ad 4e ad de ff ff ff ff ff ff ff ff  .....N..........
  backtrace:
    [<08cbd8bc>] iommu_domain_alloc+0x24/0x50
    [<b835abee>] arm_iommu_create_mapping+0xe4/0x134
    [<3acd268d>] arch_setup_dma_ops+0x4c/0x104
    [<9f7d2cce>] of_dma_configure+0x19c/0x3a4
    [<ba07704b>] really_probe+0xb0/0x47c
    [<4f510e4f>] driver_probe_device+0x78/0x1c4
    [<7481a0cf>] device_driver_attach+0x58/0x60
    [<0ff8f5c1>] __driver_attach+0xb8/0x158
    [<86006144>] bus_for_each_dev+0x74/0xb4
    [<10159dca>] bus_add_driver+0x1c0/0x200
    [<8a265265>] driver_register+0x74/0x108
    [<e0f3451a>] exynos_drm_init+0xb0/0x134
    [<db3fc7ba>] do_one_initcall+0x90/0x458
    [<6da35917>] kernel_init_freeable+0x188/0x200
    [<db3f74d4>] kernel_init+0x8/0x110
    [<1f3cddf9>] ret_from_fork+0x14/0x20

Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---

Hi all,

I have discovered this issue on OdroidXU4 while running some stress tests
for upcoming Energy Model. To reproduce it, kernel must be compiled with
DEBUG_KMEMLEAK. When the boot has finished, type:
# echo scan > /sys/kernel/debug/kmemleak
# cat /sys/kernel/debug/kmemleak
You should expect similar output to the one from the commit message.

I don't know if it should go via stable tree as well. I can resend with CC
stable, if there is a need.

Regards,
Lukasz Luba

 drivers/gpu/drm/exynos/exynos_drm_dma.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
index 9ebc02768847..45f209ec107f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
@@ -74,8 +74,13 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
 		return ret;
 
 	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
-		if (to_dma_iommu_mapping(subdrv_dev))
+		struct dma_iommu_mapping *mapping =
+					to_dma_iommu_mapping(subdrv_dev);
+
+		if (mapping) {
 			arm_iommu_detach_device(subdrv_dev);
+			arm_iommu_release_mapping(mapping);
+		}
 
 		ret = arm_iommu_attach_device(subdrv_dev, priv->mapping);
 	} else if (IS_ENABLED(CONFIG_IOMMU_DMA)) {
-- 
2.17.1

