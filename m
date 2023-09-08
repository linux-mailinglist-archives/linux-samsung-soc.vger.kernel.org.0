Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A580079907A
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  8 Sep 2023 21:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240647AbjIHTr5 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 8 Sep 2023 15:47:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241668AbjIHTr4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Sep 2023 15:47:56 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55D20B4;
        Fri,  8 Sep 2023 12:47:25 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1446CC433BF;
        Fri,  8 Sep 2023 19:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694201721;
        bh=QPi7U8LFYJTn90nKMCS6rP5mjt7sQN4sOXteL2xyPXs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qfBXAdK66kfxTcJW/owp3bOEyFhujYNy/cqpRds78zCBejMlsOCRJcCV9T9wwMQNK
         x43Bcj9PfDOi6CukoV+Pn3F2Gd8+PXK/1j33rWhsKEpxTqxIytW1fWHhuClMuS1RkN
         sYQmX61zkO8rVh5dBF1MeZSx6vu00Lv13SN6O366qwLlwHD7/Sc2hvjqm3JCwlEZ8c
         kVg+k6FFbUKFB+DkiUwPM94nguwX1lLv71QwEdznKUNW61a2/pbOXysTRkjTPtZXbQ
         vR5+h8bsfdDxJjS+OAGEyQFsh7kQe9r8KZ9jPmxJkW3AkqlXeGNyv/S6xIE3lN3MpB
         SvaIhFhQ8zqOA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Tuo Li <islituo@gmail.com>, BassCheck <bass@buaa.edu.cn>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Inki Dae <inki.dae@samsung.com>,
        Sasha Levin <sashal@kernel.org>, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, airlied@gmail.com, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 17/22] drm/exynos: fix a possible null-pointer dereference due to data race in exynos_drm_crtc_atomic_disable()
Date:   Fri,  8 Sep 2023 15:34:01 -0400
Message-Id: <20230908193407.3463368-17-sashal@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230908193407.3463368-1-sashal@kernel.org>
References: <20230908193407.3463368-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.52
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Tuo Li <islituo@gmail.com>

[ Upstream commit 2e63972a2de14482d0eae1a03a73e379f1c3f44c ]

The variable crtc->state->event is often protected by the lock
crtc->dev->event_lock when is accessed. However, it is accessed as a
condition of an if statement in exynos_drm_crtc_atomic_disable() without
holding the lock:

  if (crtc->state->event && !crtc->state->active)

However, if crtc->state->event is changed to NULL by another thread right
after the conditions of the if statement is checked to be true, a
null-pointer dereference can occur in drm_crtc_send_vblank_event():

  e->pipe = pipe;

To fix this possible null-pointer dereference caused by data race, the
spin lock coverage is extended to protect the if statement as well as the
function call to drm_crtc_send_vblank_event().

Reported-by: BassCheck <bass@buaa.edu.cn>
Link: https://sites.google.com/view/basscheck/home
Signed-off-by: Tuo Li <islituo@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Added relevant link.
Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/exynos/exynos_drm_crtc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_crtc.c b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
index 4153f302de7c4..d19e796c20613 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_crtc.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_crtc.c
@@ -39,13 +39,12 @@ static void exynos_drm_crtc_atomic_disable(struct drm_crtc *crtc,
 	if (exynos_crtc->ops->atomic_disable)
 		exynos_crtc->ops->atomic_disable(exynos_crtc);
 
+	spin_lock_irq(&crtc->dev->event_lock);
 	if (crtc->state->event && !crtc->state->active) {
-		spin_lock_irq(&crtc->dev->event_lock);
 		drm_crtc_send_vblank_event(crtc, crtc->state->event);
-		spin_unlock_irq(&crtc->dev->event_lock);
-
 		crtc->state->event = NULL;
 	}
+	spin_unlock_irq(&crtc->dev->event_lock);
 }
 
 static int exynos_crtc_atomic_check(struct drm_crtc *crtc,
-- 
2.40.1

