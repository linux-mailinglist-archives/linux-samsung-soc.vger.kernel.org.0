Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6CF679973
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 24 Jan 2023 14:40:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234231AbjAXNkT (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 24 Jan 2023 08:40:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234230AbjAXNkP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Jan 2023 08:40:15 -0500
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A7B237B48;
        Tue, 24 Jan 2023 05:40:14 -0800 (PST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 2CB131FDED;
        Tue, 24 Jan 2023 13:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1674567613; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mHNXQj920Mp49rolvcUr11B4LETXxMqwdnjXrBs6lqg=;
        b=16xnC3qEktqsq+aRntrn/d1ScKqaWYQZMtxTPtm/S6BMfzYXt+lSkx2W81aYhaKELLA9Fh
        x7N9nMwkbh08rJIKECG9/oMe6fSi6zkam9vMkwOLiKODnbIO0v83OUCAi9Dm96YOZw/vHA
        pHmrXCw0PQpREDrtV6Ksg23l8zXDRLk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1674567613;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mHNXQj920Mp49rolvcUr11B4LETXxMqwdnjXrBs6lqg=;
        b=2t5VyELYo2xzGMStdJCIQmdZSY3K46QbD0wREcAD7flf6K5R2dMyhssq5uu8qvm2s6Tbz5
        akV5cOY54bNrZbAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DB31D13487;
        Tue, 24 Jan 2023 13:40:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id aApyNLzfz2PWZgAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 24 Jan 2023 13:40:12 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@gmail.com, daniel@ffwll.ch,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        javierm@redhat.com
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        amd-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 05/10] drm/fb-helper: Remove preferred_bpp parameter from fbdev internals
Date:   Tue, 24 Jan 2023 14:40:05 +0100
Message-Id: <20230124134010.30263-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124134010.30263-1-tzimmermann@suse.de>
References: <20230124134010.30263-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Store the console's preferred BPP value in struct drm_fb_helper
and remove the respective function parameters from the internal
fbdev code.

The BPP value is only required as a fallback and will now always
be available in the fb-helper instance.

No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_fb_helper.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 4379bcd7718b..258103d317ac 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1786,7 +1786,7 @@ static uint32_t drm_fb_helper_find_color_mode_format(struct drm_fb_helper *fb_he
 	return drm_fb_helper_find_format(fb_helper, formats, format_count, bpp, depth);
 }
 
-static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper, int preferred_bpp,
+static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper,
 				      struct drm_fb_helper_surface_size *sizes)
 {
 	struct drm_client_dev *client = &fb_helper->client;
@@ -1831,7 +1831,7 @@ static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper, int prefe
 		surface_format = drm_fb_helper_find_color_mode_format(fb_helper,
 								      plane->format_types,
 								      plane->format_count,
-								      preferred_bpp);
+								      fb_helper->preferred_bpp);
 		if (surface_format != DRM_FORMAT_INVALID)
 			break; /* found supported format */
 	}
@@ -1903,7 +1903,7 @@ static int __drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper, int prefe
 	return 0;
 }
 
-static int drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper, int preferred_bpp,
+static int drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper,
 				    struct drm_fb_helper_surface_size *sizes)
 {
 	struct drm_client_dev *client = &fb_helper->client;
@@ -1912,7 +1912,7 @@ static int drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper, int preferr
 	int ret;
 
 	mutex_lock(&client->modeset_mutex);
-	ret = __drm_fb_helper_find_sizes(fb_helper, preferred_bpp, sizes);
+	ret = __drm_fb_helper_find_sizes(fb_helper, sizes);
 	mutex_unlock(&client->modeset_mutex);
 
 	if (ret)
@@ -1934,15 +1934,14 @@ static int drm_fb_helper_find_sizes(struct drm_fb_helper *fb_helper, int preferr
  * Allocates the backing storage and sets up the fbdev info structure through
  * the ->fb_probe callback.
  */
-static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper,
-					 int preferred_bpp)
+static int drm_fb_helper_single_fb_probe(struct drm_fb_helper *fb_helper)
 {
 	struct drm_client_dev *client = &fb_helper->client;
 	struct drm_device *dev = fb_helper->dev;
 	struct drm_fb_helper_surface_size sizes;
 	int ret;
 
-	ret = drm_fb_helper_find_sizes(fb_helper, preferred_bpp, &sizes);
+	ret = drm_fb_helper_find_sizes(fb_helper, &sizes);
 	if (ret) {
 		/* First time: disable all crtc's.. */
 		if (!fb_helper->deferred_setup)
@@ -2125,8 +2124,7 @@ static void drm_setup_crtcs_fb(struct drm_fb_helper *fb_helper)
 
 /* Note: Drops fb_helper->lock before returning. */
 static int
-__drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper,
-					  int bpp_sel)
+__drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper)
 {
 	struct drm_device *dev = fb_helper->dev;
 	struct fb_info *info;
@@ -2137,10 +2135,9 @@ __drm_fb_helper_initial_config_and_unlock(struct drm_fb_helper *fb_helper,
 	height = dev->mode_config.max_height;
 
 	drm_client_modeset_probe(&fb_helper->client, width, height);
-	ret = drm_fb_helper_single_fb_probe(fb_helper, bpp_sel);
+	ret = drm_fb_helper_single_fb_probe(fb_helper);
 	if (ret < 0) {
 		if (ret == -EAGAIN) {
-			fb_helper->preferred_bpp = bpp_sel;
 			fb_helper->deferred_setup = true;
 			ret = 0;
 		}
@@ -2231,8 +2228,10 @@ int drm_fb_helper_initial_config(struct drm_fb_helper *fb_helper, int bpp_sel)
 	if (!drm_fbdev_emulation)
 		return 0;
 
+	fb_helper->preferred_bpp = bpp_sel;
+
 	mutex_lock(&fb_helper->lock);
-	ret = __drm_fb_helper_initial_config_and_unlock(fb_helper, bpp_sel);
+	ret = __drm_fb_helper_initial_config_and_unlock(fb_helper);
 
 	return ret;
 }
@@ -2268,8 +2267,7 @@ int drm_fb_helper_hotplug_event(struct drm_fb_helper *fb_helper)
 
 	mutex_lock(&fb_helper->lock);
 	if (fb_helper->deferred_setup) {
-		err = __drm_fb_helper_initial_config_and_unlock(fb_helper,
-				fb_helper->preferred_bpp);
+		err = __drm_fb_helper_initial_config_and_unlock(fb_helper);
 		return err;
 	}
 
-- 
2.39.0

