Return-Path: <linux-samsung-soc+bounces-8646-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A89F9ACE8BE
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  5 Jun 2025 05:47:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 749A7188E71C
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  5 Jun 2025 03:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97AB72036FE;
	Thu,  5 Jun 2025 03:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KFwPncdM"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6DE202C46
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Jun 2025 03:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749095217; cv=none; b=gQWji8/ahkx8sEgFP1MOeM2l4htS23SWK/jhcUw0lysD5KaTsbxNGO6MLu008fLkHUk6bIPxHnE8pwWYKMNb/h3CUXKvn9L4zKH2AXrlsWBjEQqZXEuFcXGUSJ5LirHyhGiH3y5uTPIUwmh2l9rPSLNAeKOichTetGjrFq1zQlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749095217; c=relaxed/simple;
	bh=oUAUULa8xvF5LlZB5tbq87rz3uMzHi3pU21DzZn+Vdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e5MF22GindLGcyGnsr5M12qq4RcHI5iRiGrMevaHKahEhjyxfLtIVE73XOQkyWEZKDLi53IWkmFgwxLjEqJoWKULFDdk33EO7mv9XsP9tvWM1AI4voxxHUx6W2UgX1GpYH4JkJfRRKAVAZYtAo4PNZexZxoeK3v1mkBtE41nDUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KFwPncdM; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749095215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G9BkRZbsm8aRk3aSpv0SfOyGwsJsIoOb67KS8j+iekY=;
	b=KFwPncdM5swwgLfjb8c8ntfOPobCwqyLTwhQNukrSJ7tZ3c1e8ICnlzhbjVHq1bQ+8HaQw
	LYyReCn1xhqCveJ03KBzfDWdFGP0KJnBNJHHr+FHiU7EcRwtrTqp3amPpAT7BBm7Jymyip
	c8/aEeTVZ99PkAmVm8vPo9b98rtcSEU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-79-lSpiVRelPRG-Fwu687-Qdg-1; Wed,
 04 Jun 2025 23:46:50 -0400
X-MC-Unique: lSpiVRelPRG-Fwu687-Qdg-1
X-Mimecast-MFC-AGG-ID: lSpiVRelPRG-Fwu687-Qdg_1749095208
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BC6811956094;
	Thu,  5 Jun 2025 03:46:47 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.229])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B91BE30002C0;
	Thu,  5 Jun 2025 03:46:42 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 04 Jun 2025 22:45:13 -0500
Subject: [PATCH 4/4] drm/panel/exynos: Keep up with refcounting
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250604-of_drm_find_panel_part1-v1-4-c632e12e131d@redhat.com>
References: <20250604-of_drm_find_panel_part1-v1-0-c632e12e131d@redhat.com>
In-Reply-To: <20250604-of_drm_find_panel_part1-v1-0-c632e12e131d@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749095111; l=790;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=oUAUULa8xvF5LlZB5tbq87rz3uMzHi3pU21DzZn+Vdo=;
 b=m9T9DvEk7AHTO8PjuGGuJd4n+/GgbhkJzocE3hfstzW9Lp1snMcHMfDrBcDrOYExSB1as9ZkZ
 QwCScTfjRI8C8A/wkHRdNaRhHj92TooFMlpXTThKTAStQzd5NoFTYBl
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Put the panel reference back when driver is no
longer using it.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 0dc36df6ada34cd0d4544f14e616fe3c52dafc73..7b82ff7f2d2761a679fe3b319a73f7d1d4c87033 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -138,6 +138,7 @@ static void exynos_dpi_disable(struct drm_encoder *encoder)
 		drm_panel_disable(ctx->panel);
 		drm_panel_unprepare(ctx->panel);
 	}
+	drm_panel_put(ctx->panel);
 }
 
 static const struct drm_encoder_helper_funcs exynos_dpi_encoder_helper_funcs = {

-- 
2.48.1


