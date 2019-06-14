Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C06746A07
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 14 Jun 2019 22:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727433AbfFNUgl (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 14 Jun 2019 16:36:41 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:40292 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728454AbfFNUgl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 14 Jun 2019 16:36:41 -0400
Received: by mail-ed1-f65.google.com with SMTP id k8so5227244eds.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 Jun 2019 13:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RUJkrBHPGMD0Jak0hv15UuXYYOT/ay4M5iA7uP6K2TM=;
        b=irhEijl3uz1ccHxtPEy4kMwnVw1beSjXcXiHBVt/guTgdFhCDeaSwRU3YaR3aKXJiW
         Jzw8hwyS8SHMCIg/hyvS/d3wjueJ9Xh/vjsOCJWDYo9nOYIWcSD2B/3veRSqrrxBv4WM
         O+FhIWINHJAKp/VJXK60dm32VnYow4ogo0D6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RUJkrBHPGMD0Jak0hv15UuXYYOT/ay4M5iA7uP6K2TM=;
        b=ABacapfziT4TMSskxP5ZKCK8aa32rqWIl0RXc0+ctXTcVHN8Mx3mLrpJj2+/BzYF2i
         FQs6kaxC6gOSmVfS7pmqpau8JLDmHh3PtS8Hoa5KNgVQ6LO76XYJJ0bihiKmH5enKXqH
         D11rj2imaEFDHSuIH406lW2Q1Uqc4ZeidW3f6PBXejVnfr/Nasd2QQGUCO/LCQH7fCJb
         J72kjD/G1EqXfk0BkrOsgbPymJ7ngob9pveSdNuol3MOd6QkJLQg0lm7XO4mv9Sb000p
         DWAX5wOlhgfMuy5n4amz1s/hKHrOKTzQ/DYmpF1ocdw3IpytZAqp9pjiM3htfEnxjEdo
         zJ5w==
X-Gm-Message-State: APjAAAVMnuMcWrhwNtWayL6Up6sSJTxC37z6Li5KU3Ky0U/fYgyMZXe4
        XyNaqOXre/6PtCWff0SOXO6qMQ==
X-Google-Smtp-Source: APXvYqyBmbA9fgjT93k8eJavmdSLhiYk/y6FVvZuoiG7XOai8lro1qS6KycJASXiRs5PrvmL91wkSg==
X-Received: by 2002:a50:8825:: with SMTP id b34mr25674476edb.22.1560544599178;
        Fri, 14 Jun 2019 13:36:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Fri, 14 Jun 2019 13:36:37 -0700 (PDT)
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     DRI Development <dri-devel@lists.freedesktop.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 14/59] drm/exynos: Drop drm_gem_prime_export
Date:   Fri, 14 Jun 2019 22:35:30 +0200
Message-Id: <20190614203615.12639-15-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

They're the default. We can't do the same on the import side, due to
the exynos_drm->dma_dev not necessarily matching the overall drm
device.

Aside: Would be really nice to switch the others over to
drm_gem_object_funcs.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
---
 drivers/gpu/drm/exynos/exynos_drm_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index e43640fc42d3..4d270390eba2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -124,7 +124,6 @@ static struct drm_driver exynos_drm_driver = {
 	.dumb_create		= exynos_drm_gem_dumb_create,
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
-	.gem_prime_export	= drm_gem_prime_export,
 	.gem_prime_import	= exynos_drm_gem_prime_import,
 	.gem_prime_get_sg_table	= exynos_drm_gem_prime_get_sg_table,
 	.gem_prime_import_sg_table	= exynos_drm_gem_prime_import_sg_table,
-- 
2.20.1

