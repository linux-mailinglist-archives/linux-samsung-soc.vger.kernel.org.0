Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ADAA517DE19
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  9 Mar 2020 12:02:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726071AbgCILC3 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 9 Mar 2020 07:02:29 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:38217 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbgCILC3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Mar 2020 07:02:29 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200309110225euoutp01af0140800d4f1a705a4a5680647f3cbf~6ndJnWIUK1342913429euoutp01Y
        for <linux-samsung-soc@vger.kernel.org>; Mon,  9 Mar 2020 11:02:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200309110225euoutp01af0140800d4f1a705a4a5680647f3cbf~6ndJnWIUK1342913429euoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1583751746;
        bh=9e/nwuSnZj8iXFSxJvIwzmtv2vGDc8DdXRhPmQreXDM=;
        h=From:To:Cc:Subject:Date:References:From;
        b=mNp8/CPS6UQ370YIyA9NdFq+g5qDPTeEUrBjXHuVevoA5jGIbfZnbTDFNcxLCFmld
         /PCW7qlR87gcxAU9PTxu5ngDbWSQ1iZCKMH80kLHSV1lBlQLRyYbbQ6A0PcNrvrMeh
         RWbwqiPeV28H2/QrTc4Rt+uDyx9SYGUIS+unsBLc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200309110225eucas1p27094955002ef6847e8a1f69d53dedd5e~6ndJbAsNC0714507145eucas1p2w;
        Mon,  9 Mar 2020 11:02:25 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id AD.3A.60698.142266E5; Mon,  9
        Mar 2020 11:02:25 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200309110225eucas1p1d2f008748348b8595fa8a24a787b5bad~6ndI7wQNE0804808048eucas1p1f;
        Mon,  9 Mar 2020 11:02:25 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200309110225eusmtrp25697600508642bbe72087aa6c806840c~6ndI7FFUw2365323653eusmtrp2H;
        Mon,  9 Mar 2020 11:02:25 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-fd-5e6622413764
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 47.61.08375.142266E5; Mon,  9
        Mar 2020 11:02:25 +0000 (GMT)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200309110224eusmtip2c77629a2a86323a0ede88fccba277b06~6ndIbPc0e0493404934eusmtip2U;
        Mon,  9 Mar 2020 11:02:24 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Lukasz Luba <lukasz.luba@arm.com>
Subject: [PATCH v2] drm/exynos: Fix cleanup of IOMMU related objects
Date:   Mon,  9 Mar 2020 12:02:14 +0100
Message-Id: <20200309110214.2707-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAIsWRmVeSWpSXmKPExsWy7djPc7qOSmlxBmdW6lrcWneO1WLjjPWs
        Fle+vmezmHR/AovFjPP7mCwWNrWwW6w9cpfdYsbkl2wOHB5r5q1h9LjffZzJo2/LKkaPz5vk
        AliiuGxSUnMyy1KL9O0SuDIWf77PXtA4nbFiScMGtgbGR3VdjJwcEgImEnNmnWfvYuTiEBJY
        wSjxbNUddpCEkMAXRolvh9IgEp8ZJa7+PcfWxcgB1rFpYgVEfDmjxIk1R5ghHKCGg+++soB0
        swkYSnS97WIDsUUE3CSaDs9kBSliFvjDKHFj3W6wFcICLhLrL+9iArFZBFQl9uz9BNbMK2Aj
        sW7GAyaI++QlVm84ALZBQuA2m8Tc9fNZIBIuElM3nWKGsIUlXh3fwg5hy0j83zmfCaKhmVHi
        4bm17BBOD6PE5aYZjBBV1hJ3zv0Ce4hZQFNi/S59iLCjxL+Zr1kh/uSTuPFWECTMDGRO2jad
        GSLMK9HRJgRRrSYx6/g6uLUHL1yCOsdDYsf0GUyQYIyVWDhlHvsERrlZCLsWMDKuYhRPLS3O
        TU8tNs5LLdcrTswtLs1L10vOz93ECEwHp/8d/7qDcd+fpEOMAhyMSjy8D+RT44RYE8uKK3MP
        MUpwMCuJ8DZqJccJ8aYkVlalFuXHF5XmpBYfYpTmYFES5zVe9DJWSCA9sSQ1OzW1ILUIJsvE
        wSnVwOhfvmWviBaT/ZZVGx23/p+WP/0D22uRBUfOSNuyHitNPyMd7nxF9nLJherzP2J2v3Fo
        f7Pu7QrfF1E2Lq8O2e2YKZi2jXnD1RUc4ju7rC9NOpi7fzGffhqn34faf0b3Jy/Yvy7g/KJ5
        c1VLvm5d69p4beKPh/F3jvu6nAxirQrrOpi4x7WR/+pxJZbijERDLeai4kQAi/AoCgMDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGLMWRmVeSWpSXmKPExsVy+t/xe7qOSmlxBlM3cVvcWneO1WLjjPWs
        Fle+vmezmHR/AovFjPP7mCwWNrWwW6w9cpfdYsbkl2wOHB5r5q1h9LjffZzJo2/LKkaPz5vk
        Alii9GyK8ktLUhUy8otLbJWiDS2M9AwtLfSMTCz1DI3NY62MTJX07WxSUnMyy1KL9O0S9DIW
        f77PXtA4nbFiScMGtgbGR3VdjBwcEgImEpsmVnQxcnEICSxllGi/1cTcxcgJFJeRODmtgRXC
        Fpb4c62LDaLoE6PE7D8PwBJsAoYSXW9BEpwcIgIeEs3fjrODFDELNDBJLJ50nwkkISzgIrH+
        8i4wm0VAVWLP3k8sIDavgI3EuhkPmCA2yEus3nCAeQIjzwJGhlWMIqmlxbnpucWGesWJucWl
        eel6yfm5mxiBYbjt2M/NOxgvbQw+xCjAwajEw/tAPjVOiDWxrLgy9xCjBAezkghvo1ZynBBv
        SmJlVWpRfnxRaU5q8SFGU6DlE5mlRJPzgTGSVxJvaGpobmFpaG5sbmxmoSTO2yFwMEZIID2x
        JDU7NbUgtQimj4mDU6qBUUDk3+nzXhnnNVJOdPRq152rjkgSYc8573V81w+jeyXR26Ze9T7J
        mjv5e0Haez2zOT+dFoo3ly5pWaTzh+E7X362dsz08y1a165N7Z9SZtD1VplhevUnGy8Vx8YD
        K28y+9S699iveJx7Pva2IU/bhMNHKhWyE4IavQ13530tYezU3r5zP6epEktxRqKhFnNRcSIA
        +5Yam1kCAAA=
X-CMS-MailID: 20200309110225eucas1p1d2f008748348b8595fa8a24a787b5bad
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200309110225eucas1p1d2f008748348b8595fa8a24a787b5bad
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200309110225eucas1p1d2f008748348b8595fa8a24a787b5bad
References: <CGME20200309110225eucas1p1d2f008748348b8595fa8a24a787b5bad@eucas1p1.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Store the IOMMU mapping created by the device core of each Exynos DRM
sub-device and restore it when the Exynos DRM driver is unbound. This
fixes IOMMU initialization failure for the second time when a deferred
probe is triggered from the bind() callback of master's compound DRM
driver. This also fixes the following issue found using kmemleak
detector:

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

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>
---
v2:
- added kmemlead detector log from Lukasz Luba
- added comment in the code as requested by Inki Dae
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  5 ++--
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  5 ++--
 drivers/gpu/drm/exynos/exynos_drm_dma.c       | 28 +++++++++++++------
 drivers/gpu/drm/exynos/exynos_drm_drv.h       |  6 ++--
 drivers/gpu/drm/exynos/exynos_drm_fimc.c      |  5 ++--
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      |  5 ++--
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       |  5 ++--
 drivers/gpu/drm/exynos/exynos_drm_gsc.c       |  5 ++--
 drivers/gpu/drm/exynos/exynos_drm_rotator.c   |  5 ++--
 drivers/gpu/drm/exynos/exynos_drm_scaler.c    |  6 ++--
 drivers/gpu/drm/exynos/exynos_mixer.c         |  7 +++--
 11 files changed, 53 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 8428ae12dfa5..1f79bc2a881e 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -55,6 +55,7 @@ static const char * const decon_clks_name[] = {
 struct decon_context {
 	struct device			*dev;
 	struct drm_device		*drm_dev;
+	void				*dma_priv;
 	struct exynos_drm_crtc		*crtc;
 	struct exynos_drm_plane		planes[WINDOWS_NR];
 	struct exynos_drm_plane_config	configs[WINDOWS_NR];
@@ -644,7 +645,7 @@ static int decon_bind(struct device *dev, struct device *master, void *data)
 
 	decon_clear_channels(ctx->crtc);
 
-	return exynos_drm_register_dma(drm_dev, dev);
+	return exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
 }
 
 static void decon_unbind(struct device *dev, struct device *master, void *data)
@@ -654,7 +655,7 @@ static void decon_unbind(struct device *dev, struct device *master, void *data)
 	decon_atomic_disable(ctx->crtc);
 
 	/* detach this sub driver from iommu mapping if supported. */
-	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev);
+	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev, &ctx->dma_priv);
 }
 
 static const struct component_ops decon_component_ops = {
diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index ff59c641fa80..1eed3327999f 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -40,6 +40,7 @@
 struct decon_context {
 	struct device			*dev;
 	struct drm_device		*drm_dev;
+	void				*dma_priv;
 	struct exynos_drm_crtc		*crtc;
 	struct exynos_drm_plane		planes[WINDOWS_NR];
 	struct exynos_drm_plane_config	configs[WINDOWS_NR];
@@ -127,13 +128,13 @@ static int decon_ctx_initialize(struct decon_context *ctx,
 
 	decon_clear_channels(ctx->crtc);
 
-	return exynos_drm_register_dma(drm_dev, ctx->dev);
+	return exynos_drm_register_dma(drm_dev, ctx->dev, &ctx->dma_priv);
 }
 
 static void decon_ctx_remove(struct decon_context *ctx)
 {
 	/* detach this sub driver from iommu mapping if supported. */
-	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev);
+	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev, &ctx->dma_priv);
 }
 
 static u32 decon_calc_clkdiv(struct decon_context *ctx,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
index 9ebc02768847..619f81435c1b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
@@ -58,7 +58,7 @@ static inline void clear_dma_max_seg_size(struct device *dev)
  * mapping.
  */
 static int drm_iommu_attach_device(struct drm_device *drm_dev,
-				struct device *subdrv_dev)
+				struct device *subdrv_dev, void **dma_priv)
 {
 	struct exynos_drm_private *priv = drm_dev->dev_private;
 	int ret;
@@ -74,7 +74,14 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
 		return ret;
 
 	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
-		if (to_dma_iommu_mapping(subdrv_dev))
+		/*
+		 * Keep the original DMA mapping of the sub-device and
+		 * restore it on Exynos DRM detach, otherwise the DMA
+		 * framework considers it as IOMMU-less during the next
+		 * probe (in case of deferred probe or modular build)
+		 */
+		*dma_priv = to_dma_iommu_mapping(subdrv_dev);
+		if (*dma_priv)
 			arm_iommu_detach_device(subdrv_dev);
 
 		ret = arm_iommu_attach_device(subdrv_dev, priv->mapping);
@@ -98,19 +105,21 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
  * mapping
  */
 static void drm_iommu_detach_device(struct drm_device *drm_dev,
-				struct device *subdrv_dev)
+				    struct device *subdrv_dev, void **dma_priv)
 {
 	struct exynos_drm_private *priv = drm_dev->dev_private;
 
-	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU))
+	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)) {
 		arm_iommu_detach_device(subdrv_dev);
-	else if (IS_ENABLED(CONFIG_IOMMU_DMA))
+		arm_iommu_attach_device(subdrv_dev, *dma_priv);
+	} else if (IS_ENABLED(CONFIG_IOMMU_DMA))
 		iommu_detach_device(priv->mapping, subdrv_dev);
 
 	clear_dma_max_seg_size(subdrv_dev);
 }
 
-int exynos_drm_register_dma(struct drm_device *drm, struct device *dev)
+int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
+			    void **dma_priv)
 {
 	struct exynos_drm_private *priv = drm->dev_private;
 
@@ -137,13 +146,14 @@ int exynos_drm_register_dma(struct drm_device *drm, struct device *dev)
 		priv->mapping = mapping;
 	}
 
-	return drm_iommu_attach_device(drm, dev);
+	return drm_iommu_attach_device(drm, dev, dma_priv);
 }
 
-void exynos_drm_unregister_dma(struct drm_device *drm, struct device *dev)
+void exynos_drm_unregister_dma(struct drm_device *drm, struct device *dev,
+			       void **dma_priv)
 {
 	if (IS_ENABLED(CONFIG_EXYNOS_IOMMU))
-		drm_iommu_detach_device(drm, dev);
+		drm_iommu_detach_device(drm, dev, dma_priv);
 }
 
 void exynos_drm_cleanup_dma(struct drm_device *drm)
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/drm/exynos/exynos_drm_drv.h
index d4d21d8cfb90..6ae9056e7a18 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -223,8 +223,10 @@ static inline bool is_drm_iommu_supported(struct drm_device *drm_dev)
 	return priv->mapping ? true : false;
 }
 
-int exynos_drm_register_dma(struct drm_device *drm, struct device *dev);
-void exynos_drm_unregister_dma(struct drm_device *drm, struct device *dev);
+int exynos_drm_register_dma(struct drm_device *drm, struct device *dev,
+			    void **dma_priv);
+void exynos_drm_unregister_dma(struct drm_device *drm, struct device *dev,
+			       void **dma_priv);
 void exynos_drm_cleanup_dma(struct drm_device *drm);
 
 #ifdef CONFIG_DRM_EXYNOS_DPI
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimc.c b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
index 8ea2e1d77802..29ab8be8604c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimc.c
@@ -97,6 +97,7 @@ struct fimc_scaler {
 struct fimc_context {
 	struct exynos_drm_ipp ipp;
 	struct drm_device *drm_dev;
+	void		*dma_priv;
 	struct device	*dev;
 	struct exynos_drm_ipp_task	*task;
 	struct exynos_drm_ipp_formats	*formats;
@@ -1133,7 +1134,7 @@ static int fimc_bind(struct device *dev, struct device *master, void *data)
 
 	ctx->drm_dev = drm_dev;
 	ipp->drm_dev = drm_dev;
-	exynos_drm_register_dma(drm_dev, dev);
+	exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
 
 	exynos_drm_ipp_register(dev, ipp, &ipp_funcs,
 			DRM_EXYNOS_IPP_CAP_CROP | DRM_EXYNOS_IPP_CAP_ROTATE |
@@ -1153,7 +1154,7 @@ static void fimc_unbind(struct device *dev, struct device *master,
 	struct exynos_drm_ipp *ipp = &ctx->ipp;
 
 	exynos_drm_ipp_unregister(dev, ipp);
-	exynos_drm_unregister_dma(drm_dev, dev);
+	exynos_drm_unregister_dma(drm_dev, dev, &ctx->dma_priv);
 }
 
 static const struct component_ops fimc_component_ops = {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 21aec38702fc..bb67cad8371f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -167,6 +167,7 @@ static struct fimd_driver_data exynos5420_fimd_driver_data = {
 struct fimd_context {
 	struct device			*dev;
 	struct drm_device		*drm_dev;
+	void				*dma_priv;
 	struct exynos_drm_crtc		*crtc;
 	struct exynos_drm_plane		planes[WINDOWS_NR];
 	struct exynos_drm_plane_config	configs[WINDOWS_NR];
@@ -1090,7 +1091,7 @@ static int fimd_bind(struct device *dev, struct device *master, void *data)
 	if (is_drm_iommu_supported(drm_dev))
 		fimd_clear_channels(ctx->crtc);
 
-	return exynos_drm_register_dma(drm_dev, dev);
+	return exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
 }
 
 static void fimd_unbind(struct device *dev, struct device *master,
@@ -1100,7 +1101,7 @@ static void fimd_unbind(struct device *dev, struct device *master,
 
 	fimd_atomic_disable(ctx->crtc);
 
-	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev);
+	exynos_drm_unregister_dma(ctx->drm_dev, ctx->dev, &ctx->dma_priv);
 
 	if (ctx->encoder)
 		exynos_dpi_remove(ctx->encoder);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 2a3382d43bc9..fcee33a43aca 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -232,6 +232,7 @@ struct g2d_runqueue_node {
 
 struct g2d_data {
 	struct device			*dev;
+	void				*dma_priv;
 	struct clk			*gate_clk;
 	void __iomem			*regs;
 	int				irq;
@@ -1409,7 +1410,7 @@ static int g2d_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 	}
 
-	ret = exynos_drm_register_dma(drm_dev, dev);
+	ret = exynos_drm_register_dma(drm_dev, dev, &g2d->dma_priv);
 	if (ret < 0) {
 		dev_err(dev, "failed to enable iommu.\n");
 		g2d_fini_cmdlist(g2d);
@@ -1434,7 +1435,7 @@ static void g2d_unbind(struct device *dev, struct device *master, void *data)
 	priv->g2d_dev = NULL;
 
 	cancel_work_sync(&g2d->runqueue_work);
-	exynos_drm_unregister_dma(g2d->drm_dev, dev);
+	exynos_drm_unregister_dma(g2d->drm_dev, dev, &g2d->dma_priv);
 }
 
 static const struct component_ops g2d_component_ops = {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
index 88b6fcaa20be..45e9aee8366a 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
@@ -97,6 +97,7 @@ struct gsc_scaler {
 struct gsc_context {
 	struct exynos_drm_ipp ipp;
 	struct drm_device *drm_dev;
+	void		*dma_priv;
 	struct device	*dev;
 	struct exynos_drm_ipp_task	*task;
 	struct exynos_drm_ipp_formats	*formats;
@@ -1169,7 +1170,7 @@ static int gsc_bind(struct device *dev, struct device *master, void *data)
 
 	ctx->drm_dev = drm_dev;
 	ctx->drm_dev = drm_dev;
-	exynos_drm_register_dma(drm_dev, dev);
+	exynos_drm_register_dma(drm_dev, dev, &ctx->dma_priv);
 
 	exynos_drm_ipp_register(dev, ipp, &ipp_funcs,
 			DRM_EXYNOS_IPP_CAP_CROP | DRM_EXYNOS_IPP_CAP_ROTATE |
@@ -1189,7 +1190,7 @@ static void gsc_unbind(struct device *dev, struct device *master,
 	struct exynos_drm_ipp *ipp = &ctx->ipp;
 
 	exynos_drm_ipp_unregister(dev, ipp);
-	exynos_drm_unregister_dma(drm_dev, dev);
+	exynos_drm_unregister_dma(drm_dev, dev, &ctx->dma_priv);
 }
 
 static const struct component_ops gsc_component_ops = {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
index b98482990d1a..dafa87b82052 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
@@ -56,6 +56,7 @@ struct rot_variant {
 struct rot_context {
 	struct exynos_drm_ipp ipp;
 	struct drm_device *drm_dev;
+	void		*dma_priv;
 	struct device	*dev;
 	void __iomem	*regs;
 	struct clk	*clock;
@@ -243,7 +244,7 @@ static int rotator_bind(struct device *dev, struct device *master, void *data)
 
 	rot->drm_dev = drm_dev;
 	ipp->drm_dev = drm_dev;
-	exynos_drm_register_dma(drm_dev, dev);
+	exynos_drm_register_dma(drm_dev, dev, &rot->dma_priv);
 
 	exynos_drm_ipp_register(dev, ipp, &ipp_funcs,
 			   DRM_EXYNOS_IPP_CAP_CROP | DRM_EXYNOS_IPP_CAP_ROTATE,
@@ -261,7 +262,7 @@ static void rotator_unbind(struct device *dev, struct device *master,
 	struct exynos_drm_ipp *ipp = &rot->ipp;
 
 	exynos_drm_ipp_unregister(dev, ipp);
-	exynos_drm_unregister_dma(rot->drm_dev, rot->dev);
+	exynos_drm_unregister_dma(rot->drm_dev, rot->dev, &rot->dma_priv);
 }
 
 static const struct component_ops rotator_component_ops = {
diff --git a/drivers/gpu/drm/exynos/exynos_drm_scaler.c b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
index 497973e9b2c5..93c43c8d914e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_scaler.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_scaler.c
@@ -39,6 +39,7 @@ struct scaler_data {
 struct scaler_context {
 	struct exynos_drm_ipp		ipp;
 	struct drm_device		*drm_dev;
+	void				*dma_priv;
 	struct device			*dev;
 	void __iomem			*regs;
 	struct clk			*clock[SCALER_MAX_CLK];
@@ -450,7 +451,7 @@ static int scaler_bind(struct device *dev, struct device *master, void *data)
 
 	scaler->drm_dev = drm_dev;
 	ipp->drm_dev = drm_dev;
-	exynos_drm_register_dma(drm_dev, dev);
+	exynos_drm_register_dma(drm_dev, dev, &scaler->dma_priv);
 
 	exynos_drm_ipp_register(dev, ipp, &ipp_funcs,
 			DRM_EXYNOS_IPP_CAP_CROP | DRM_EXYNOS_IPP_CAP_ROTATE |
@@ -470,7 +471,8 @@ static void scaler_unbind(struct device *dev, struct device *master,
 	struct exynos_drm_ipp *ipp = &scaler->ipp;
 
 	exynos_drm_ipp_unregister(dev, ipp);
-	exynos_drm_unregister_dma(scaler->drm_dev, scaler->dev);
+	exynos_drm_unregister_dma(scaler->drm_dev, scaler->dev,
+				  &scaler->dma_priv);
 }
 
 static const struct component_ops scaler_component_ops = {
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 38ae9c32feef..21b726baedea 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -94,6 +94,7 @@ struct mixer_context {
 	struct platform_device *pdev;
 	struct device		*dev;
 	struct drm_device	*drm_dev;
+	void			*dma_priv;
 	struct exynos_drm_crtc	*crtc;
 	struct exynos_drm_plane	planes[MIXER_WIN_NR];
 	unsigned long		flags;
@@ -894,12 +895,14 @@ static int mixer_initialize(struct mixer_context *mixer_ctx,
 		}
 	}
 
-	return exynos_drm_register_dma(drm_dev, mixer_ctx->dev);
+	return exynos_drm_register_dma(drm_dev, mixer_ctx->dev,
+				       &mixer_ctx->dma_priv);
 }
 
 static void mixer_ctx_remove(struct mixer_context *mixer_ctx)
 {
-	exynos_drm_unregister_dma(mixer_ctx->drm_dev, mixer_ctx->dev);
+	exynos_drm_unregister_dma(mixer_ctx->drm_dev, mixer_ctx->dev,
+				  &mixer_ctx->dma_priv);
 }
 
 static int mixer_enable_vblank(struct exynos_drm_crtc *crtc)
-- 
2.17.1

