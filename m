Return-Path: <linux-samsung-soc+bounces-681-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 939F6813031
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 14 Dec 2023 13:32:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17E2C1F21474
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 14 Dec 2023 12:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ACF6335B5;
	Thu, 14 Dec 2023 12:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RqGRfm7E"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFF5225A2
	for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Dec 2023 12:32:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6448C433C7;
	Thu, 14 Dec 2023 12:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702557164;
	bh=9BrA7lyu3u+qJ3w2HS8iC7OSGrx00yqnLUiF+PUY4qY=;
	h=From:To:Cc:Subject:Date:From;
	b=RqGRfm7E4CUqLdMdONsQrsy9g06BSxdAmIdGsOYqJrCdTrL/bTqp2+5cE3ILnPqBQ
	 Y73DCSwKYh6rW6zdpzuMLHGp71tcHlXCqifNHDvgfz5tweMjGoVLm+RpRZa8oEyF7D
	 Cbe7vpzSEGuMSZe3QypQuE4l3oXf18a7bAibAh9n9OeWBirYvU/73yVhGuvAgM80KM
	 BlTw1u3MgLBT3yPwUapWu0rOH5ZvDPFJu8euhxMw8qAhf84lYj7+zFKkiOoNLY9/93
	 +p10vwkcu8ReFAVIKS7Zz+HUMZoBEuFW3CQdl4l7jj6el2sBazdyYtxl7ra3ghzpYW
	 u8F86cB/DgtGA==
From: Arnd Bergmann <arnd@kernel.org>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Christoph Manszewski <c.manszewski@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <treding@nvidia.com>,
	Steven Price <steven.price@arm.com>,
	Rob Herring <robh@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/exynos: fix accidental on-stack copy of exynos_drm_plane
Date: Thu, 14 Dec 2023 13:32:15 +0100
Message-Id: <20231214123237.1727428-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

gcc rightfully complains about excessive stack usage in the fimd_win_set_pixfmt()
function:

drivers/gpu/drm/exynos/exynos_drm_fimd.c: In function 'fimd_win_set_pixfmt':
drivers/gpu/drm/exynos/exynos_drm_fimd.c:750:1: error: the frame size of 1032 bytes is larger than 1024 byte
drivers/gpu/drm/exynos/exynos5433_drm_decon.c: In function 'decon_win_set_pixfmt':
drivers/gpu/drm/exynos/exynos5433_drm_decon.c:381:1: error: the frame size of 1032 bytes is larger than 1024 bytes

There is really no reason to copy the large exynos_drm_plane
structure to the stack before using one of its members, so just
use a pointer instead.

Fixes: 6f8ee5c21722 ("drm/exynos: fimd: Make plane alpha configurable")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 4 ++--
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 4d986077738b..bce027552474 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -319,9 +319,9 @@ static void decon_win_set_bldmod(struct decon_context *ctx, unsigned int win,
 static void decon_win_set_pixfmt(struct decon_context *ctx, unsigned int win,
 				 struct drm_framebuffer *fb)
 {
-	struct exynos_drm_plane plane = ctx->planes[win];
+	struct exynos_drm_plane *plane = &ctx->planes[win];
 	struct exynos_drm_plane_state *state =
-		to_exynos_plane_state(plane.base.state);
+		to_exynos_plane_state(plane->base.state);
 	unsigned int alpha = state->base.alpha;
 	unsigned int pixel_alpha;
 	unsigned long val;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 8dde7b1e9b35..5bdc246f5fad 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -661,9 +661,9 @@ static void fimd_win_set_bldmod(struct fimd_context *ctx, unsigned int win,
 static void fimd_win_set_pixfmt(struct fimd_context *ctx, unsigned int win,
 				struct drm_framebuffer *fb, int width)
 {
-	struct exynos_drm_plane plane = ctx->planes[win];
+	struct exynos_drm_plane *plane = &ctx->planes[win];
 	struct exynos_drm_plane_state *state =
-		to_exynos_plane_state(plane.base.state);
+		to_exynos_plane_state(plane->base.state);
 	uint32_t pixel_format = fb->format->format;
 	unsigned int alpha = state->base.alpha;
 	u32 val = WINCONx_ENWIN;
-- 
2.39.2


