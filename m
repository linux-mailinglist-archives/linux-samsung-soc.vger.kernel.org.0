Return-Path: <linux-samsung-soc+bounces-2133-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCD2866860
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 26 Feb 2024 03:55:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BBBF228165C
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 26 Feb 2024 02:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FFB41AACA;
	Mon, 26 Feb 2024 02:55:11 +0000 (UTC)
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D911AAB1;
	Mon, 26 Feb 2024 02:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708916111; cv=none; b=MtdUP33kehb6fs4SRPyAD3mEp2U6yAgzp63ozM6+LdBJuTYtzplPuIdLNiYpb7g8DjAP/kzfXOuFP3DoAnJ1jbfpJobBs5jits7tR25S9dFy2B+aPje+9UnS+IQ4m7TjFSHr5uNGa8NqKMzRHM5rlt48KPQB4w7NIryuMLgmAWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708916111; c=relaxed/simple;
	bh=tbnDJSmrkota+0h34QQWBs6KGLOigNzHb9e9sHBP7nM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A2x1eiuktn/Q0zyALx3Hsl6KOAGPglJIRrGej9c9vumXAoqXey6YGFR8opRaZJbmhtoW1XeTS1KA55W7009nAaLo+dlGASbDjxCPc7ilTi4RWvnpiAG2Peq0D1fIz/rTLZi3y9/Pde1IWIVxOTF0yV7sVja6gVh3oD3pmyH3nzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: cd6f21063eea4d909cd0db4c58a0fafd-20240226
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:af9dbba1-f6a7-4adc-a51c-1807b965315c,IP:10,
	URL:0,TC:0,Content:0,EDM:25,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACT
	ION:release,TS:20
X-CID-INFO: VERSION:1.1.37,REQID:af9dbba1-f6a7-4adc-a51c-1807b965315c,IP:10,UR
	L:0,TC:0,Content:0,EDM:25,RT:0,SF:-15,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:6f543d0,CLOUDID:79f44d84-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:240226102255YBXUWZHW,BulkQuantity:0,Recheck:0,SF:24|17|19|44|66|38|1
	02,TC:nil,Content:0,EDM:5,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:
	nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_FSI
X-UUID: cd6f21063eea4d909cd0db4c58a0fafd-20240226
Received: from mail.kylinos.cn [(39.156.73.10)] by mailgw
	(envelope-from <chentao@kylinos.cn>)
	(Generic MTA)
	with ESMTP id 1075076401; Mon, 26 Feb 2024 10:22:54 +0800
Received: from mail.kylinos.cn (localhost [127.0.0.1])
	by mail.kylinos.cn (NSMail) with SMTP id 0EF0FE000EBC;
	Mon, 26 Feb 2024 10:22:54 +0800 (CST)
X-ns-mid: postfix-65DBF5FD-853442222
Received: from kernel.. (unknown [172.20.15.254])
	by mail.kylinos.cn (NSMail) with ESMTPA id B2D6EE000EBC;
	Mon, 26 Feb 2024 10:22:52 +0800 (CST)
From: Kunwu Chan <chentao@kylinos.cn>
To: inki.dae@samsung.com,
	sw0312.kim@samsung.com,
	kyungmin.park@samsung.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	krzysztof.kozlowski@linaro.org,
	alim.akhtar@samsung.com
Cc: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <chentao@kylinos.cn>
Subject: [PATCH] drm/exynos: use KMEM_CACHE() to create g2d_runqueue_node cache
Date: Mon, 26 Feb 2024 10:22:51 +0800
Message-Id: <20240226022251.1781070-1-chentao@kylinos.cn>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Use the KMEM_CACHE() macro instead of kmem_cache_create() to simplify
the creation of SLAB caches when the default values are used.

Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/ex=
ynos/exynos_drm_g2d.c
index f3138423612e..a5818ed6a6f7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -1456,8 +1456,7 @@ static int g2d_probe(struct platform_device *pdev)
 	if (!g2d)
 		return -ENOMEM;
=20
-	g2d->runqueue_slab =3D kmem_cache_create("g2d_runqueue_slab",
-			sizeof(struct g2d_runqueue_node), 0, 0, NULL);
+	g2d->runqueue_slab =3D KMEM_CACHE(g2d_runqueue_node, 0);
 	if (!g2d->runqueue_slab)
 		return -ENOMEM;
=20
--=20
2.39.2


