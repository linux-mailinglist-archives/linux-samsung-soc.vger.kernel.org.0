Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 720164BE622
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 21 Feb 2022 19:01:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355195AbiBUKir (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 21 Feb 2022 05:38:47 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:35290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354936AbiBUKie (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 05:38:34 -0500
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D54B46163
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Feb 2022 02:00:21 -0800 (PST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 8F94658025F;
        Mon, 21 Feb 2022 04:59:45 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Mon, 21 Feb 2022 04:59:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=SBKxndqRJqKTGvR4OSR8aSqZ+CMFFL
        Md5Wo8SczSeY0=; b=U8DTRtD3oTrkbtNcH2d7Uus7uiq3VRFP+rZ1I/Cjo9/xDW
        NNVc0iT5az6Us1qjD9S4tQLzz5248KEyehA70OwSTXyennyBjXwK0bn1AQHQ1U0w
        m31a3Ii0iwAyuKgoQX6d2/WHsdLfj2OI5KsilA1abC8SUdjCJxu89Wu38o9H9YWV
        FmWvg75598w09E5n9kSZkwzX/jqbA4gCuTB+TGBLv5FPt6JCF+3pYFC1YjWtqRfz
        OMGLuzKRH+iFDK+xYS2cjAcDI2EBaA6yUMs1h0PwyPzDcVNDt2asJcf5qITG8SRe
        5+RL1EU1Uhlymo/S+iVRwDiNkwKVhL+rA0l1+FNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=SBKxnd
        qRJqKTGvR4OSR8aSqZ+CMFFLMd5Wo8SczSeY0=; b=BjitJw1W4NWeRT6fQXc3aj
        /YILW97eHipeUKO2Qz5qbxwI+ekmL69kv8AugrLf7BB8TM1fzNyqLU0iuxfW4bTx
        0c3SuUXTnypNcYY3Pn4CjmjAqztO3xIhKXeLJfom8sYtQXCBVsbcyO1HQJrBwBCK
        PgrmFE790755IAR7ummwU9Paqf4GNQuAlHE3fG6qJ9yAkSb98u7peF1JUeb1K0Hg
        qB/1e4x2n0Hk7ik/KkW8jEAUIukeDKSbImMl1gwmrV7kPndBtpyN4yxU9pDhj0G3
        eheVhZa/tLQyicAodHR4/A/jcZfL7XKywW0gryd6Obd4mQnG30h6YPA+QwHGm3pQ
        ==
X-ME-Sender: <xms:kGITYm_wlzsytVmGHAtA0R6UHxTeYVXhyHPCVRLlRboyVpgmgacTWA>
    <xme:kGITYms1_xEH9_VrkSvrl7eurBeEhZhIxZavJuTMkP0sbI5LNtsIq2kgtYPBhs5IG
    AzByfnPtIzhxNC4i-s>
X-ME-Received: <xmr:kGITYsA4rPMsGUqXIHlR13RoZPqJYgGWReX35feizWZ1FS9ETiegOdG6UvBf-6O8nv-NfXO8BYiryH2l1gUKqH-iVty6qzePyIvtxZo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrkeeigddtlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kGITYucVNJFjL_G5PW_fsEszhp0kKJa7129jNpXP8WWSHSSKIR1dHQ>
    <xmx:kGITYrOhEl5o04cTmbSZuaXRO8zJvbFbkOkQZfcT2x8b_Xlfi8Nd7Q>
    <xmx:kGITYolHIJeO5AbMZuVNQEfTHutEILejRdvZKdC_NTRl3hF7GsaLwg>
    <xmx:kWITYoccPyLGgGGPlEC_NM9YMAzMyppgUQ-xMWtBq4xhu9w1Giw6xw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 21 Feb 2022 04:59:43 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Maxime Ripard <maxime@cerno.tech>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>
Subject: [PATCH v2 10/22] drm/exynos: plane: Remove redundant zpos initialisation
Date:   Mon, 21 Feb 2022 10:59:06 +0100
Message-Id: <20220221095918.18763-11-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221095918.18763-1-maxime@cerno.tech>
References: <20220221095918.18763-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The exynos KMS driver will call drm_plane_create_zpos_property() with an
init value depending on the plane purpose.

Since the initial value wasn't carried over in the state, the driver had
to set it again in exynos_drm_plane_reset(). However, the helpers have
been adjusted to set it properly at reset, so this is not needed
anymore.

Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/exynos/exynos_drm_plane.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_plane.c b/drivers/gpu/drm/exynos/exynos_drm_plane.c
index df76bdee7dca..3615cf329e32 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_plane.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_plane.c
@@ -122,7 +122,6 @@ static void exynos_plane_mode_set(struct exynos_drm_plane_state *exynos_state)
 
 static void exynos_drm_plane_reset(struct drm_plane *plane)
 {
-	struct exynos_drm_plane *exynos_plane = to_exynos_plane(plane);
 	struct exynos_drm_plane_state *exynos_state;
 
 	if (plane->state) {
@@ -133,10 +132,8 @@ static void exynos_drm_plane_reset(struct drm_plane *plane)
 	}
 
 	exynos_state = kzalloc(sizeof(*exynos_state), GFP_KERNEL);
-	if (exynos_state) {
+	if (exynos_state)
 		__drm_atomic_helper_plane_reset(plane, &exynos_state->base);
-		plane->state->zpos = exynos_plane->config->zpos;
-	}
 }
 
 static struct drm_plane_state *
-- 
2.35.1

