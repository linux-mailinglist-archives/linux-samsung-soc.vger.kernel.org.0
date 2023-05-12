Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 557197002AA
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 12 May 2023 10:42:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240239AbjELImE (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 12 May 2023 04:42:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240212AbjELImA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 12 May 2023 04:42:00 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73F144682;
        Fri, 12 May 2023 01:41:58 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 0C8202043A;
        Fri, 12 May 2023 08:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1683880917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aDapZGq3snIdNViE9zp5XIjmGvfoCzJuG8gNtaD7oZ0=;
        b=c1YePbQL6JnHEDj2KjK7YJco5DUwpIxOK5+DePlL8YZzzru7SeijpQAdU4Ql7ZrfNtLw6S
        OKFP373wjNIoZMWgzHaYWNTMv96pPko5Pmw++laTm56nxPbgjaD003DUcj7J6+n34Ty7Mz
        a88fg1iuN3ISvEKKg3OuWv5CwCmyE4I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1683880917;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aDapZGq3snIdNViE9zp5XIjmGvfoCzJuG8gNtaD7oZ0=;
        b=QvPsrF7e3YQDOeqg+LLHX0sk8fcAfGA4j2MmE28pPSZ2jccf4nmOnwDkuzsAxbvtR3cf1W
        U7YY4veYenYuQUDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B8F7E13466;
        Fri, 12 May 2023 08:41:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id iPZeLNT7XWQZKQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Fri, 12 May 2023 08:41:56 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 08/11] drm/tegra: Use regular fbdev I/O helpers
Date:   Fri, 12 May 2023 10:41:49 +0200
Message-Id: <20230512084152.31233-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512084152.31233-1-tzimmermann@suse.de>
References: <20230512084152.31233-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use the regular fbdev helpers for framebuffer I/O instead of DRM's
helpers. Tegra does not use damage handling, so DRM's fbdev helpers
are mere wrappers around the fbdev code.

Add CONFIG_DRM_TEGRA_FBDEV_EMULATION to select the necessary
Kconfig options automatically. Make fbdev emulation depend on
the new config option.

By using fbdev helpers directly within each DRM fbdev emulation,
we can eventually remove DRM's wrapper functions entirely.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
---
 drivers/gpu/drm/tegra/Kconfig  |  9 +++++++++
 drivers/gpu/drm/tegra/Makefile |  2 +-
 drivers/gpu/drm/tegra/drm.h    |  2 +-
 drivers/gpu/drm/tegra/fbdev.c  | 11 ++++++-----
 4 files changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index 56453ca277c2..8d04549ad671 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -12,6 +12,7 @@ config DRM_TEGRA
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL
+	select DRM_TEGRA_FBDEV_EMULATION if DRM_FBDEV_EMULATION
 	select TEGRA_HOST1X
 	select INTERCONNECT
 	select IOMMU_IOVA
@@ -41,3 +42,11 @@ config DRM_TEGRA_STAGING
 	  If unsure, choose N.
 
 endif
+
+config DRM_TEGRA_FBDEV_EMULATION
+	bool
+	depends on DRM_TEGRA
+	select FB_SYS_COPYAREA
+	select FB_SYS_FILLRECT
+	select FB_SYS_FOPS
+	select FB_SYS_IMAGEBLIT
diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
index 6fc4b504e786..2ae9fb5d9213 100644
--- a/drivers/gpu/drm/tegra/Makefile
+++ b/drivers/gpu/drm/tegra/Makefile
@@ -29,6 +29,6 @@ tegra-drm-y := \
 
 tegra-drm-y += trace.o
 
-tegra-drm-$(CONFIG_DRM_FBDEV_EMULATION) += fbdev.o
+tegra-drm-$(CONFIG_DRM_TEGRA_FBDEV_EMULATION) += fbdev.o
 
 obj-$(CONFIG_DRM_TEGRA) += tegra-drm.o
diff --git a/drivers/gpu/drm/tegra/drm.h b/drivers/gpu/drm/tegra/drm.h
index f9d18e8cf6ab..874e93ef4e47 100644
--- a/drivers/gpu/drm/tegra/drm.h
+++ b/drivers/gpu/drm/tegra/drm.h
@@ -192,7 +192,7 @@ struct drm_framebuffer *tegra_fb_create(struct drm_device *drm,
 					struct drm_file *file,
 					const struct drm_mode_fb_cmd2 *cmd);
 
-#ifdef CONFIG_DRM_FBDEV_EMULATION
+#if defined(CONFIG_DRM_TEGRA_FBDEV_EMULATION)
 void tegra_fbdev_setup(struct drm_device *drm);
 #else
 static inline void tegra_fbdev_setup(struct drm_device *drm)
diff --git a/drivers/gpu/drm/tegra/fbdev.c b/drivers/gpu/drm/tegra/fbdev.c
index dca9eccae466..144d851e566f 100644
--- a/drivers/gpu/drm/tegra/fbdev.c
+++ b/drivers/gpu/drm/tegra/fbdev.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/console.h>
+#include <linux/fb.h>
 #include <linux/vmalloc.h>
 
 #include <drm/drm_drv.h>
@@ -59,11 +60,11 @@ static void tegra_fbdev_fb_destroy(struct fb_info *info)
 static const struct fb_ops tegra_fb_ops = {
 	.owner = THIS_MODULE,
 	DRM_FB_HELPER_DEFAULT_OPS,
-	.fb_read = drm_fb_helper_sys_read,
-	.fb_write = drm_fb_helper_sys_write,
-	.fb_fillrect = drm_fb_helper_sys_fillrect,
-	.fb_copyarea = drm_fb_helper_sys_copyarea,
-	.fb_imageblit = drm_fb_helper_sys_imageblit,
+	.fb_read = fb_sys_read,
+	.fb_write = fb_sys_write,
+	.fb_fillrect = sys_fillrect,
+	.fb_copyarea = sys_copyarea,
+	.fb_imageblit = sys_imageblit,
 	.fb_mmap = tegra_fb_mmap,
 	.fb_destroy = tegra_fbdev_fb_destroy,
 };
-- 
2.40.1

