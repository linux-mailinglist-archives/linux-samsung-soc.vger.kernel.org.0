Return-Path: <linux-samsung-soc+bounces-11452-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7E0BC9484
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 09 Oct 2025 15:23:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0B4074E54E1
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  9 Oct 2025 13:23:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 886AD2E7BD2;
	Thu,  9 Oct 2025 13:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="awaNgI7/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cwrjkfKR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="awaNgI7/";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="cwrjkfKR"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAB353363
	for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Oct 2025 13:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760016178; cv=none; b=SgtNL4VO+ORIeeh+SzixfDJE3GXDBHS2THFD+dO/Y1TD32jDK28LT8Szcl4jKytaedUpLuCG76jVZhuuSN5vUhaZAP+5Gg95X+kBj79ihLKwHBByuUmTOyqdg/dThsyLQpThER8tYPlTY51F0qIbQpP42JXPILE5393SkX8ENJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760016178; c=relaxed/simple;
	bh=9v7TGhLPRB7Hg6j0h7NT3Zr8ZuDwvfM8Ys5cFzGUZzk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TfakDew2fxYcNXnW/NAC3YBgC81JinaxYnOvIQkRIM3eO2nTEIYn0bXiFWpuVbPLhFxC9QBMdUPRL9+2g3jJ7OCW1ZxTPm8G4Kpwj/YrGwrTRgdvEsiPFnQNhvkpkXJaB5OzLBFSLj6vpEy1416HEpMQvEaifguJmK8V6UutxvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=awaNgI7/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cwrjkfKR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=awaNgI7/; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=cwrjkfKR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AAC411F74A;
	Thu,  9 Oct 2025 13:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760016174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nxbzPBH17ar9K23CahzAe5b30MTmOO7lOdw/AEZcP0U=;
	b=awaNgI7/B8kYXqIFwTWq0bTxrrbbQgWzmYQL40a/KGIHLfrwsJezjNSwwQ5oBaRko8yH3L
	zJnopVUZRPGe8w1zUAsf23kKmnS2KVtb0P/nZd+/paWDRlBXL6/LUOufHd7EJ3p5of4rMm
	knVtAwJkGpGdK5RPUY0VgX03PRAagL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760016174;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nxbzPBH17ar9K23CahzAe5b30MTmOO7lOdw/AEZcP0U=;
	b=cwrjkfKRUzslGnFAMfnZN+BbuuRHgp8fiGPsw7EQNL51euzvgDiBbRojNyLdDUzWltIC1j
	NbG6hac4zQvJojCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1760016174; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nxbzPBH17ar9K23CahzAe5b30MTmOO7lOdw/AEZcP0U=;
	b=awaNgI7/B8kYXqIFwTWq0bTxrrbbQgWzmYQL40a/KGIHLfrwsJezjNSwwQ5oBaRko8yH3L
	zJnopVUZRPGe8w1zUAsf23kKmnS2KVtb0P/nZd+/paWDRlBXL6/LUOufHd7EJ3p5of4rMm
	knVtAwJkGpGdK5RPUY0VgX03PRAagL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1760016174;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=nxbzPBH17ar9K23CahzAe5b30MTmOO7lOdw/AEZcP0U=;
	b=cwrjkfKRUzslGnFAMfnZN+BbuuRHgp8fiGPsw7EQNL51euzvgDiBbRojNyLdDUzWltIC1j
	NbG6hac4zQvJojCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5308A13A61;
	Thu,  9 Oct 2025 13:22:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 0EDeEi6352iECAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 09 Oct 2025 13:22:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	mripard@kernel.org,
	maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-tegra@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/4] drm/client: Implement free callback for fbdev and log
Date: Thu,  9 Oct 2025 15:16:27 +0200
Message-ID: <20251009132006.45834-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Level: 
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[]
X-Spam-Flag: NO
X-Spam-Score: -2.80

Add struct drm_client_funcs.free and release the memory fbdev and
log clients from its implementations. Also fix the locking in the
log's unregister code.

Resolves several corner cases in the current clients and avoids
duplicated code.

Thomas Zimmermann (4):
  drm/client: Add client free callback to unprepare fb_helper
  drm/log: Do not hold lock across drm_client_release()
  drm/log: Add free callback
  drm/client: Do not free client memory by default

 drivers/gpu/drm/armada/armada_fbdev.c      |  2 --
 drivers/gpu/drm/clients/drm_fbdev_client.c | 17 +++++++++++++++--
 drivers/gpu/drm/clients/drm_log.c          | 16 ++++++++++++----
 drivers/gpu/drm/drm_client.c               |  4 ++++
 drivers/gpu/drm/drm_client_event.c         |  9 +++++----
 drivers/gpu/drm/drm_fbdev_dma.c            |  4 ----
 drivers/gpu/drm/drm_fbdev_shmem.c          |  2 --
 drivers/gpu/drm/drm_fbdev_ttm.c            |  2 --
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c  |  2 --
 drivers/gpu/drm/gma500/fbdev.c             |  3 ---
 drivers/gpu/drm/i915/display/intel_fbdev.c |  2 --
 drivers/gpu/drm/msm/msm_fbdev.c            |  2 --
 drivers/gpu/drm/omapdrm/omap_fbdev.c       |  2 --
 drivers/gpu/drm/radeon/radeon_fbdev.c      |  2 --
 drivers/gpu/drm/tegra/fbdev.c              |  2 --
 include/drm/drm_client.h                   | 10 ++++++++++
 16 files changed, 46 insertions(+), 35 deletions(-)

-- 
2.51.0


