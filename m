Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C48712884C1
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  9 Oct 2020 10:02:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732690AbgJIICM (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 9 Oct 2020 04:02:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732660AbgJIH74 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 9 Oct 2020 03:59:56 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02C28C0613D6
        for <linux-samsung-soc@vger.kernel.org>; Fri,  9 Oct 2020 00:59:56 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id m6so9257150wrn.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Oct 2020 00:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CNwEMjRKpk0SNHMR2BpU3eb5Lf8l12dJx2AoEHa9QRQ=;
        b=PAvIUQEM+RSj/4UjBMWApQJ5nylKvJGTUg+Uh2yOaH8fLVYPb51F1RYcc3SKKbcMgH
         sNy9tR823nuhLT3FMHNBrkfbaR1mpR4LJTMWp7qDAwAkb8Ezuarc2ddb75FNEEnxTKTH
         juj5nI/ojaXlobnL7do1JNcmBlcydYDbNdEWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CNwEMjRKpk0SNHMR2BpU3eb5Lf8l12dJx2AoEHa9QRQ=;
        b=aGaHxZk7CVGR9NthoFTyFCrDmT1DE1it665K38za94TBxso4dk8o5w5X++HeQhNeiH
         KYJ0koqDy3C8vDfLjqiAMtYqzNchujOjd4Fma4W2kTbgdM6wLbyi8/3ZENuMmimuPBT8
         Cn6cqpO5WvkNTddkjwZ85GhOV/4qcWHvxW1FCM1Qy/n3JpJ5jFGZgUCuSOzv2ecEIdLM
         BUjS64oqmrlsL5Q3MME5fpiiGZ5AYEu9C63BYkz2tU4yktRvx81hIjFMP6Q1Mt0zyYz1
         LNNAWFdIZKZ/63z7rkmYrHWPUTk9OYLEFemMEt/G3L+BtXAGoNVqdGCw9Z/+tEDzHMBz
         CMiw==
X-Gm-Message-State: AOAM530/xf5YukaZ36AHiMAjpftqypjf9vkcpXbv3faiFaHo6giNmvFu
        fSumuDK6giFsIAdV0Ec6TP+6Tw==
X-Google-Smtp-Source: ABdhPJyUKAqGcidqsbNLuUZKjhqRIBOtVRIIm3edqNHeTh3Stywq8z0kGb9uG6SgLPE2j0/bA4O3dQ==
X-Received: by 2002:a5d:40c3:: with SMTP id b3mr14820571wrq.157.1602230394741;
        Fri, 09 Oct 2020 00:59:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id u17sm11634118wri.45.2020.10.09.00.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 00:59:54 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     kvm@vger.kernel.org, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        linux-s390@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v2 02/17] drm/exynos: Use FOLL_LONGTERM for g2d cmdlists
Date:   Fri,  9 Oct 2020 09:59:19 +0200
Message-Id: <20201009075934.3509076-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The exynos g2d interface is very unusual, but it looks like the
userptr objects are persistent. Hence they need FOLL_LONGTERM.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>
Cc: Jérôme Glisse <jglisse@redhat.com>
Cc: Jan Kara <jack@suse.cz>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: linux-mm@kvack.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-media@vger.kernel.org
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index ecede41af9b9..1e0c5a7f206e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -475,7 +475,8 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct g2d_data *g2d,
 		goto err_free;
 	}
 
-	ret = pin_user_pages_fast(start, npages, FOLL_FORCE | FOLL_WRITE,
+	ret = pin_user_pages_fast(start, npages,
+				  FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM,
 				  g2d_userptr->pages);
 	if (ret != npages) {
 		DRM_DEV_ERROR(g2d->dev,
-- 
2.28.0

