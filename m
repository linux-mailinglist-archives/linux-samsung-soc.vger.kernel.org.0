Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99F7B716686
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 30 May 2023 17:12:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232310AbjE3PMu (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 30 May 2023 11:12:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233173AbjE3PMi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 30 May 2023 11:12:38 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0AFBC5;
        Tue, 30 May 2023 08:12:36 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 1E42F21AC8;
        Tue, 30 May 2023 15:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1685459555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VrXDZhBF0OA8JM95e+fFIcXMgOAk3LrILwjnydxyums=;
        b=oWSndShoEVnkrn0tl/OEYXldEFwdyGZu3PsYMGu8ro0Lpftokp4ViUUPPyyok4/gIbwIhA
        o+loRfo5V2qeUXxiQHHDI4Ek60SjAn0Aa+QFhI9KVYLiOM1wYlamAgsGLHwGqKv5m+dppx
        +0/r/CP+gmTHOAumnDTjKQD8rRBlOEI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1685459555;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VrXDZhBF0OA8JM95e+fFIcXMgOAk3LrILwjnydxyums=;
        b=T17lhx+9/PUHfy4nnUQwonPVlY7GQ1qv+RWH6tjSrDdSQL4RqtYhiQzN05MqffIXt2FmYE
        7TwaLC/K5hn71UCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BBF8F13478;
        Tue, 30 May 2023 15:12:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id mCwYLWISdmRjAQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 30 May 2023 15:12:34 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com, sam@ravnborg.org, suijingfeng@loongson.cn
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>
Subject: [PATCH v5 13/13] drm/i915: Implement dedicated fbdev I/O helpers
Date:   Tue, 30 May 2023 17:12:28 +0200
Message-Id: <20230530151228.22979-14-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530151228.22979-1-tzimmermann@suse.de>
References: <20230530151228.22979-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Implement dedicated fbdev helpers for framebuffer I/O instead
of using DRM's helpers. Use an fbdev generator macro for
deferred I/O to create the fbdev callbacks. i915 was the only
caller of the DRM helpers, so remove them from the helper module.

i915's fbdev emulation is still incomplete as it doesn't implement
deferred I/O and damage handling for mmaped pages.

v4:
	* generate deferred-I/O helpers
	* use initializer macros for fb_ops
v2:
	* use FB_IO_HELPERS options

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: "Ville Syrjälä" <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/Kconfig                    |   3 -
 drivers/gpu/drm/drm_fb_helper.c            | 107 ---------------------
 drivers/gpu/drm/i915/Kconfig               |   1 +
 drivers/gpu/drm/i915/display/intel_fbdev.c |  14 +--
 include/drm/drm_fb_helper.h                |  39 --------
 5 files changed, 9 insertions(+), 155 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 92a782827b7b..bb2e48cc6cd6 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -133,9 +133,6 @@ config DRM_FBDEV_EMULATION
 	bool "Enable legacy fbdev support for your modesetting driver"
 	depends on DRM_KMS_HELPER
 	depends on FB=y || FB=DRM_KMS_HELPER
-	select FB_CFB_FILLRECT
-	select FB_CFB_COPYAREA
-	select FB_CFB_IMAGEBLIT
 	select FRAMEBUFFER_CONSOLE if !EXPERT
 	select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
 	default y
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 7f6e54967acb..61a5d450cc20 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -736,113 +736,6 @@ void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagerefli
 }
 EXPORT_SYMBOL(drm_fb_helper_deferred_io);
 
-/**
- * drm_fb_helper_cfb_read - Implements struct &fb_ops.fb_read for I/O memory
- * @info: fb_info struct pointer
- * @buf: userspace buffer to read from framebuffer memory
- * @count: number of bytes to read from framebuffer memory
- * @ppos: read offset within framebuffer memory
- *
- * Returns:
- * The number of bytes read on success, or an error code otherwise.
- */
-ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
-			       size_t count, loff_t *ppos)
-{
-	return fb_io_read(info, buf, count, ppos);
-}
-EXPORT_SYMBOL(drm_fb_helper_cfb_read);
-
-/**
- * drm_fb_helper_cfb_write - Implements struct &fb_ops.fb_write for I/O memory
- * @info: fb_info struct pointer
- * @buf: userspace buffer to write to framebuffer memory
- * @count: number of bytes to write to framebuffer memory
- * @ppos: write offset within framebuffer memory
- *
- * Returns:
- * The number of bytes written on success, or an error code otherwise.
- */
-ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
-				size_t count, loff_t *ppos)
-{
-	struct drm_fb_helper *helper = info->par;
-	loff_t pos = *ppos;
-	ssize_t ret;
-	struct drm_rect damage_area;
-
-	ret = fb_io_write(info, buf, count, ppos);
-	if (ret <= 0)
-		return ret;
-
-	if (helper->funcs->fb_dirty) {
-		drm_fb_helper_memory_range_to_clip(info, pos, ret, &damage_area);
-		drm_fb_helper_damage(helper, damage_area.x1, damage_area.y1,
-				     drm_rect_width(&damage_area),
-				     drm_rect_height(&damage_area));
-	}
-
-	return ret;
-}
-EXPORT_SYMBOL(drm_fb_helper_cfb_write);
-
-/**
- * drm_fb_helper_cfb_fillrect - wrapper around cfb_fillrect
- * @info: fbdev registered by the helper
- * @rect: info about rectangle to fill
- *
- * A wrapper around cfb_fillrect implemented by fbdev core
- */
-void drm_fb_helper_cfb_fillrect(struct fb_info *info,
-				const struct fb_fillrect *rect)
-{
-	struct drm_fb_helper *helper = info->par;
-
-	cfb_fillrect(info, rect);
-
-	if (helper->funcs->fb_dirty)
-		drm_fb_helper_damage(helper, rect->dx, rect->dy, rect->width, rect->height);
-}
-EXPORT_SYMBOL(drm_fb_helper_cfb_fillrect);
-
-/**
- * drm_fb_helper_cfb_copyarea - wrapper around cfb_copyarea
- * @info: fbdev registered by the helper
- * @area: info about area to copy
- *
- * A wrapper around cfb_copyarea implemented by fbdev core
- */
-void drm_fb_helper_cfb_copyarea(struct fb_info *info,
-				const struct fb_copyarea *area)
-{
-	struct drm_fb_helper *helper = info->par;
-
-	cfb_copyarea(info, area);
-
-	if (helper->funcs->fb_dirty)
-		drm_fb_helper_damage(helper, area->dx, area->dy, area->width, area->height);
-}
-EXPORT_SYMBOL(drm_fb_helper_cfb_copyarea);
-
-/**
- * drm_fb_helper_cfb_imageblit - wrapper around cfb_imageblit
- * @info: fbdev registered by the helper
- * @image: info about image to blit
- *
- * A wrapper around cfb_imageblit implemented by fbdev core
- */
-void drm_fb_helper_cfb_imageblit(struct fb_info *info,
-				 const struct fb_image *image)
-{
-	struct drm_fb_helper *helper = info->par;
-
-	cfb_imageblit(info, image);
-
-	if (helper->funcs->fb_dirty)
-		drm_fb_helper_damage(helper, image->dx, image->dy, image->width, image->height);
-}
-EXPORT_SYMBOL(drm_fb_helper_cfb_imageblit);
-
 /**
  * drm_fb_helper_set_suspend - wrapper around fb_set_suspend
  * @fb_helper: driver-allocated fbdev helper, can be NULL
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index e4f4d2e3fdfe..01b5a8272a27 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -17,6 +17,7 @@ config DRM_I915
 	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select DRM_MIPI_DSI
+	select FB_IO_HELPERS if DRM_FBDEV_EMULATION
 	select RELAY
 	select I2C
 	select I2C_ALGOBIT
diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index aab1ae74a8f7..eccaceaf8b9d 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -28,6 +28,7 @@
 #include <linux/console.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
+#include <linux/fb.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
@@ -84,6 +85,10 @@ static void intel_fbdev_invalidate(struct intel_fbdev *ifbdev)
 	intel_frontbuffer_invalidate(to_frontbuffer(ifbdev), ORIGIN_CPU);
 }
 
+FB_GEN_DEFAULT_DEFERRED_IO_OPS(intel_fbdev,
+			       drm_fb_helper_damage_range,
+			       drm_fb_helper_damage_area)
+
 static int intel_fbdev_set_par(struct fb_info *info)
 {
 	struct intel_fbdev *ifbdev = to_intel_fbdev(info->par);
@@ -132,15 +137,12 @@ static int intel_fbdev_mmap(struct fb_info *info, struct vm_area_struct *vma)
 
 static const struct fb_ops intelfb_ops = {
 	.owner = THIS_MODULE,
+	__FB_DEFAULT_DEFERRED_OPS_RDWR(intel_fbdev),
 	DRM_FB_HELPER_DEFAULT_OPS,
 	.fb_set_par = intel_fbdev_set_par,
-	.fb_read = drm_fb_helper_cfb_read,
-	.fb_write = drm_fb_helper_cfb_write,
-	.fb_fillrect = drm_fb_helper_cfb_fillrect,
-	.fb_copyarea = drm_fb_helper_cfb_copyarea,
-	.fb_imageblit = drm_fb_helper_cfb_imageblit,
-	.fb_pan_display = intel_fbdev_pan_display,
 	.fb_blank = intel_fbdev_blank,
+	.fb_pan_display = intel_fbdev_pan_display,
+	__FB_DEFAULT_DEFERRED_OPS_DRAW(intel_fbdev),
 	.fb_mmap = intel_fbdev_mmap,
 };
 
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index b50fd0c0b713..4863b0f8299e 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -258,18 +258,6 @@ void drm_fb_helper_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u3
 
 void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagereflist);
 
-ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
-			       size_t count, loff_t *ppos);
-ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
-				size_t count, loff_t *ppos);
-
-void drm_fb_helper_cfb_fillrect(struct fb_info *info,
-				const struct fb_fillrect *rect);
-void drm_fb_helper_cfb_copyarea(struct fb_info *info,
-				const struct fb_copyarea *area);
-void drm_fb_helper_cfb_imageblit(struct fb_info *info,
-				 const struct fb_image *image);
-
 void drm_fb_helper_set_suspend(struct drm_fb_helper *fb_helper, bool suspend);
 void drm_fb_helper_set_suspend_unlocked(struct drm_fb_helper *fb_helper,
 					bool suspend);
@@ -385,33 +373,6 @@ static inline int drm_fb_helper_defio_init(struct drm_fb_helper *fb_helper)
 	return -ENODEV;
 }
 
-static inline ssize_t drm_fb_helper_cfb_read(struct fb_info *info, char __user *buf,
-					     size_t count, loff_t *ppos)
-{
-	return -ENODEV;
-}
-
-static inline ssize_t drm_fb_helper_cfb_write(struct fb_info *info, const char __user *buf,
-					      size_t count, loff_t *ppos)
-{
-	return -ENODEV;
-}
-
-static inline void drm_fb_helper_cfb_fillrect(struct fb_info *info,
-					      const struct fb_fillrect *rect)
-{
-}
-
-static inline void drm_fb_helper_cfb_copyarea(struct fb_info *info,
-					      const struct fb_copyarea *area)
-{
-}
-
-static inline void drm_fb_helper_cfb_imageblit(struct fb_info *info,
-					       const struct fb_image *image)
-{
-}
-
 static inline void drm_fb_helper_set_suspend(struct drm_fb_helper *fb_helper,
 					     bool suspend)
 {
-- 
2.40.1

