Return-Path: <linux-samsung-soc+bounces-8642-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C749FACE8B1
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  5 Jun 2025 05:46:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89BC016E222
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  5 Jun 2025 03:46:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B0D1E5B64;
	Thu,  5 Jun 2025 03:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NrcRNScx"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 242861C5D61
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Jun 2025 03:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749095195; cv=none; b=Q/4nGVnrUjHfG0zwbFZvCTTeXs8YOtwq834x7C+B7MrFy9HByow0OFQ8QoW+I1vD5BewtldcoGSwpuhAAtLvnrkd+3MVUec43tvpb5RnD2uCAqeBBnfebUnIvPH5CvMa0/7SNaBHB2yTqKiZ+QNqPQfgmpZ6/rOKtqtRg8NPfpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749095195; c=relaxed/simple;
	bh=rPF1Y/Lj5T3DhXlPLFMCFyqGLjxlQBeRLLgsB6ClAEU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qoVhe16gJQ7Aqt6lKK79T5JL+swlquuGK1hNEj6MZ15fDRqNTvQFmbyfzaGT3DVreRVMenGBzCJCHgp5Ngnv7g9kI9TnBaqFS5+ytt1a8LXlr5xDzHhgg71r8/u5M+8OamTKqzGHgekCFfCnqQNVqzvIT2sW5+ZO7JcCfOdirZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NrcRNScx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749095193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XXvmdmmn1tFYv0uxxK5u4EJQqXxf5VTQjxQB6qyj6BY=;
	b=NrcRNScxpyPrVmhx0TF1VypAWuv7QtdJNq6YusL6a1Sc7k11tLyGBN+n8nIU2IhGeJD/Ma
	9kqIte2chLfw5VOBgDhm78lbKXDTXx7F30G+YbeLoMOmYUpRN096HbNwT4gWPFnp/VOEWy
	Fg5Hi3jgIaRgNSGwBZ1vBksbUaj19Zw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-32-h8rxEJLaO1qYFezv_spyhw-1; Wed,
 04 Jun 2025 23:46:29 -0400
X-MC-Unique: h8rxEJLaO1qYFezv_spyhw-1
X-Mimecast-MFC-AGG-ID: h8rxEJLaO1qYFezv_spyhw_1749095186
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C9C3118003FD;
	Thu,  5 Jun 2025 03:46:24 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.229])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7EDFA30002C0;
	Thu,  5 Jun 2025 03:46:18 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Subject: [PATCH 0/4] Integrate refcounting across of_drm_find_panel()
 callers
Date: Wed, 04 Jun 2025 22:45:09 -0500
Message-Id: <20250604-of_drm_find_panel_part1-v1-0-c632e12e131d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMUSQWgC/x2MWwqAIBAArxL7nWDag7pKhFiutVAWa0QQ3T3pZ
 2A+Zh6IyIQRuuwBxosi7SFJkWcwLTbMKMglByVVJWtZit0bx5vxFJw5bMA1kc9CaG2Vw7FpVVV
 Dqg9GT/d/7of3/QCEmLcdaQAAAA==
X-Change-ID: 20250604-of_drm_find_panel_part1-33a2deb79256
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749095111; l=1449;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=rPF1Y/Lj5T3DhXlPLFMCFyqGLjxlQBeRLLgsB6ClAEU=;
 b=SeeBSMW5SkSz2m1U56oKwm8PDfWdG4toxWnKciRa8oqK8kQqUV5RtZYYVHAvOk1mvJzF3/GNs
 3m9IvhcutyHAcccJkhr85frr56vbFC+VUXRCu9sj/CoQvwuR6Se3vYX
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

With the panel refcount allocation infrastructure  merged: [1]
and all drivers converted to use the new API: [2],[3] and [4],
the next chunk of work involves integrating refcounting across
different callers across various drivers.

First patch was added to the original series [1] but later
removed. Adding it here with the initial of_drm_find_panel()
callers being updated with refcounting. This is not an exhaustive
list. Remaining drivers to be updated will be sent in next set
of series.

[1] -> https://patchwork.freedesktop.org/series/146750/
[2] -> https://patchwork.freedesktop.org/series/147082/
[3] -> https://patchwork.freedesktop.org/series/147157/
[4] -> https://patchwork.freedesktop.org/series/147246/

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
Anusha Srivatsa (4):
      drm/panel: get/put panel reference in drm_panel_add/remove()
      drm/panel/samsung-dsicm: Keep up with refcounting
      drm/panel/sun4i: Keep up with refcounting
      drm/panel/exynos: Keep up with refcounting

 drivers/gpu/drm/bridge/samsung-dsim.c   | 1 +
 drivers/gpu/drm/drm_panel.c             | 2 ++
 drivers/gpu/drm/exynos/exynos_drm_dpi.c | 1 +
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c  | 2 ++
 4 files changed, 6 insertions(+)
---
base-commit: 685c407f168cb49a12cc703230d1e2d62767bfd2
change-id: 20250604-of_drm_find_panel_part1-33a2deb79256

Best regards,
-- 
Anusha Srivatsa <asrivats@redhat.com>


