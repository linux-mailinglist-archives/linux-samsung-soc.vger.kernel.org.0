Return-Path: <linux-samsung-soc+bounces-6269-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 154F5A07A86
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  9 Jan 2025 16:03:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A7C3188BCC9
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  9 Jan 2025 15:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D4B721D00A;
	Thu,  9 Jan 2025 15:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gQ/TUkb3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IwfDQX8E";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="gQ/TUkb3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="IwfDQX8E"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5904E21C184;
	Thu,  9 Jan 2025 15:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736435001; cv=none; b=GFYLtM4RFbUu6hILhxUhbGQC8GueQ+FXFogAeKtaQ3+zw+UScUcp/zubCBQ4l1wFtQSrI/rqw1dAi6glRnrFJswLxz+QkvZ2ZqKn8WDTNb8bB+po5A24CYPSSM4QZZsexaNZALIszQUebmiJDBzsWn037ouuQW0zFCNKHNQzm2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736435001; c=relaxed/simple;
	bh=UVuKAIiV4cxsEChAyuAjbk4vhNww9bI6iKopjSg3HKo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jxbNrtCnLAf+Ut2pot27Doq6famrQ24SZhBnOU4oNXc4cQXLz2MGSA6s3H2/UfDrzII6rCH2A8x+9olkd6f6iXJy3+3ceisO4LVbqtdhw4/9jA+EIGGqhrL17o8Oyt0QuwVqZ7ccY4dOqB+BrR8ALXK15Kb0axIqYCb4S5G+s/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gQ/TUkb3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IwfDQX8E; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=gQ/TUkb3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=IwfDQX8E; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8F29B21157;
	Thu,  9 Jan 2025 15:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736434996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A7GD9WsopwPDpvGUQ4ur1Gqo7EpIaoXPPE9kLZRcatM=;
	b=gQ/TUkb3JF+iVClMXZW4QjoXF3b8H+STvr0K0fNCZSJG5Xo9Jf0CgvbttC36vFrPipix1h
	+n7PomChSisdgdBhmPB1Ayed9lB4l4rMbF8jgWhbzEdZxTGeyHKQZkornMm0raJVcLdRBj
	kRk2AI+FpkP1Rk011NDyjvFhBCoIeos=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736434996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A7GD9WsopwPDpvGUQ4ur1Gqo7EpIaoXPPE9kLZRcatM=;
	b=IwfDQX8EUhtOLkRMtcz5O1jJTDLKNZSxfz4DsXkapVfCzoifCXtiOEN+IPYwXJTvFj7PUW
	gI6iw1/l5HOFtDBQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="gQ/TUkb3";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=IwfDQX8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736434996; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A7GD9WsopwPDpvGUQ4ur1Gqo7EpIaoXPPE9kLZRcatM=;
	b=gQ/TUkb3JF+iVClMXZW4QjoXF3b8H+STvr0K0fNCZSJG5Xo9Jf0CgvbttC36vFrPipix1h
	+n7PomChSisdgdBhmPB1Ayed9lB4l4rMbF8jgWhbzEdZxTGeyHKQZkornMm0raJVcLdRBj
	kRk2AI+FpkP1Rk011NDyjvFhBCoIeos=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736434996;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A7GD9WsopwPDpvGUQ4ur1Gqo7EpIaoXPPE9kLZRcatM=;
	b=IwfDQX8EUhtOLkRMtcz5O1jJTDLKNZSxfz4DsXkapVfCzoifCXtiOEN+IPYwXJTvFj7PUW
	gI6iw1/l5HOFtDBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1BCA913A8B;
	Thu,  9 Jan 2025 15:03:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id KPh6BTTlf2c1awAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 09 Jan 2025 15:03:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-samsung-soc@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	spice-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	intel-xe@lists.freedesktop.org,
	xen-devel@lists.xenproject.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 03/25] drm/gem-dma: Compute dumb-buffer sizes with drm_mode_size_dumb()
Date: Thu,  9 Jan 2025 15:56:57 +0100
Message-ID: <20250109150310.219442-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250109150310.219442-1-tzimmermann@suse.de>
References: <20250109150310.219442-1-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 8F29B21157
X-Spam-Score: -1.51
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,suse.de:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[19];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:25478, ipnet:::/0, country:RU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	R_RATELIMIT(0.00)[to_ip_from(RLqtkr6cif1ebgurukgmwdm7xc)];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Flag: NO
X-Spam-Level: 

Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
buffer size. Align the pitch to a multiple of 8.

Push the current calculation into the only direct caller imx. Imx's
hardware requires the framebuffer width to be aligned to 8. The
driver's current approach is actually incorrect, as it only guarantees
this implicitly and requires bpp to be a multiple of 8 already. A
later commit will fix this problem by aligning the scanline pitch
such that an aligned width still fits into each scanline's memory.

A number of other drivers are build on top of gem-dma helpers and
implement their own dumb-buffer allocation. These drivers invoke
drm_gem_dma_dumb_create_internal(), which is not affected by this
commit.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_dma_helper.c     | 7 +++++--
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c | 2 ++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 16988d316a6d..5bca7ce3683f 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -20,6 +20,7 @@
 #include <drm/drm.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
+#include <drm/drm_dumb_buffers.h>
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_vma_manager.h>
 
@@ -304,9 +305,11 @@ int drm_gem_dma_dumb_create(struct drm_file *file_priv,
 			    struct drm_mode_create_dumb *args)
 {
 	struct drm_gem_dma_object *dma_obj;
+	int ret;
 
-	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-	args->size = args->pitch * args->height;
+	ret = drm_mode_size_dumb(drm, args, SZ_8, 0);
+	if (ret)
+		return ret;
 
 	dma_obj = drm_gem_dma_create_with_handle(file_priv, drm, args->size,
 						 &args->handle);
diff --git a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
index ec5fd9a01f1e..e7025df7b978 100644
--- a/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/ipuv3/imx-drm-core.c
@@ -145,6 +145,8 @@ static int imx_drm_dumb_create(struct drm_file *file_priv,
 	int ret;
 
 	args->width = ALIGN(width, 8);
+	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
+	args->size = args->pitch * args->height;
 
 	ret = drm_gem_dma_dumb_create(file_priv, drm, args);
 	if (ret)
-- 
2.47.1


