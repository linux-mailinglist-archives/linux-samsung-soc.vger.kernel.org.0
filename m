Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D14B71667F
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 30 May 2023 17:12:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232468AbjE3PMt (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 30 May 2023 11:12:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233190AbjE3PMi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 30 May 2023 11:12:38 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 087F5C7;
        Tue, 30 May 2023 08:12:36 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 156E21FDEE;
        Tue, 30 May 2023 15:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1685459554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CmuTI2Pk7IdSxt3df9g4m6DuhVJq3TykrenNqEk2Upc=;
        b=tHR28dLRJ5QyrLtQa5k16FJPRDKAu6ZxUFABqQ/OVXTp4RYH5dyZ2hYAH4bRCPgZcqqh/G
        TVUvZWTp+5q4fqOdXGkqfwcx/r6gXv8VZMR9SyrGrK2iKBoSfx4Lh1vuHUBIzMWTv5x4Jv
        NLpa6t8LxGzUwIhBeSOV2M3UOgSFB8Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1685459554;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CmuTI2Pk7IdSxt3df9g4m6DuhVJq3TykrenNqEk2Upc=;
        b=YL2boWjJ/e4WU3zqWZBaHSAD37nv0zP5QiczyYiPtIN1JNtm0yLx0twVdFZD9F6Ce5AKHA
        VICY4ZjCdYkpwNBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C1AFA13478;
        Tue, 30 May 2023 15:12:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id MJ2GLmESdmRjAQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 30 May 2023 15:12:33 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@gmail.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com, sam@ravnborg.org, suijingfeng@loongson.cn
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 10/13] drm/fb-helper: Export helpers for marking damage areas
Date:   Tue, 30 May 2023 17:12:25 +0200
Message-Id: <20230530151228.22979-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530151228.22979-1-tzimmermann@suse.de>
References: <20230530151228.22979-1-tzimmermann@suse.de>
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

Export drm_fb_helper_damage() and drm_fb_helper_damage_range(), which
handle damage areas for fbdev emulation. This is a temporary export
that allows to move the DRM I/O helpers for fbdev into drivers. Only
fbdev-generic and i915 need them. Both will be updated to implement
damage handling by themselves and the exported functions will be removed.

v4:
	* update interfaces

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/drm_fb_helper.c | 22 ++++++++++++++++++++++
 include/drm/drm_fb_helper.h     |  3 +++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 8dc376b771d2..7071c810ba83 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -670,6 +670,28 @@ static void drm_fb_helper_memory_range_to_clip(struct fb_info *info, off_t off,
 	drm_rect_init(clip, x1, y1, x2 - x1, y2 - y1);
 }
 
+/* Don't use in new code. */
+void drm_fb_helper_damage_range(struct fb_info *info, off_t off, size_t len)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+	struct drm_rect damage_area;
+
+	drm_fb_helper_memory_range_to_clip(info, off, len, &damage_area);
+	drm_fb_helper_damage(fb_helper, damage_area.x1, damage_area.y1,
+			     drm_rect_width(&damage_area),
+			     drm_rect_height(&damage_area));
+}
+EXPORT_SYMBOL(drm_fb_helper_damage_range);
+
+/* Don't use in new code. */
+void drm_fb_helper_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height)
+{
+	struct drm_fb_helper *fb_helper = info->par;
+
+	drm_fb_helper_damage(fb_helper, x, y, width, height);
+}
+EXPORT_SYMBOL(drm_fb_helper_damage_area);
+
 /**
  * drm_fb_helper_deferred_io() - fbdev deferred_io callback function
  * @info: fb_info struct pointer
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 72032c354a30..7d5804882be7 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -253,6 +253,9 @@ void drm_fb_helper_fill_info(struct fb_info *info,
 			     struct drm_fb_helper *fb_helper,
 			     struct drm_fb_helper_surface_size *sizes);
 
+void drm_fb_helper_damage_range(struct fb_info *info, off_t off, size_t len);
+void drm_fb_helper_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height);
+
 void drm_fb_helper_deferred_io(struct fb_info *info, struct list_head *pagereflist);
 
 ssize_t drm_fb_helper_sys_read(struct fb_info *info, char __user *buf,
-- 
2.40.1

