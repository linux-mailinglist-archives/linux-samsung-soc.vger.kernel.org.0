Return-Path: <linux-samsung-soc+bounces-296-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D01B97FFC40
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 30 Nov 2023 21:16:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 189A9B21171
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 30 Nov 2023 20:16:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B9D5A10A;
	Thu, 30 Nov 2023 20:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="NWUMOvHf"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C3D1703
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Nov 2023 12:15:14 -0800 (PST)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-67a338dfca7so8174876d6.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Nov 2023 12:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1701375313; x=1701980113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8aM4P70fu6Mpyhz2ZxBL57luN308AqDDoR+bdvrzfCU=;
        b=NWUMOvHfF5rLd3c5ST2+iIXZR5nCsRJ0wYp0dnfs85gdLMbhISzpSivLftTMfyg5/J
         AtFDIDW1AOd0VWmJA866ivlNxLQ38V/wNMZEzVdaDtyjIUVFOEf1gYr5QEYa6bbFQPDG
         Q14+jdqgwlHnkqhc/a4uj2n54iBrf0CWTc4gB2JsPzqn4IuLyJaiQqV+kJT8zTE6NhAI
         enKoM6VYHg6PUUHCGjG3I9gWE/RWacU7uJJi4uxGabqS3yH5f+2GRnMtcsZNKHZmntnB
         /g81BgGLDblriXqtLrbqhc/ygmImT9DMoJ8vUmKeaEpORXcW/o51tMO9EXvDbN1vYy5n
         qKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701375313; x=1701980113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8aM4P70fu6Mpyhz2ZxBL57luN308AqDDoR+bdvrzfCU=;
        b=H4UvnjbI7pHIT20AbeUVEA+UvYcPG+h27ADlbeTNc0YyL7PeghNdLs2oSqeDQxy4rv
         xJsHbMyhT4509sdbB4GSaSUofw5VYrAAiXeBvg01p2QeDFa0VdO6SKQg1DSruQJow5OW
         KVX6ndJ7IGnFsCHBAYHbezY6vJTRN6bGEqCUdADKmtZ1rb76mlMs89Yc/0TjKVX7mw2l
         LPI+cRoOFBvhXaTeqBbB2YPWGB3dg68ikivoEgxikKjXvLdAUqmTxlP5Rfdeem3YOZ1Z
         c4wTgIJSEALgI7IeNJeWZ7+cglq1GD6Wqi/zPxh+zG5dxBaptbMgMDp4LEIPo5RppF8H
         Egsw==
X-Gm-Message-State: AOJu0YzLraYO7eFc3LZwGz4EeAeEMdv5IPLq3jDB5jDaV2HR8NfIRzfI
	7k0ogC0k0csI2qeKtOlaK1oo2w==
X-Google-Smtp-Source: AGHT+IEBs6D/FyJYqfxI4mL3iV1h7OCPfLZXSrKHIqLtLdmOiu4XOIwm8bZeJ7cSdUFCvrQdbklyMg==
X-Received: by 2002:a05:6214:5294:b0:67a:255c:c43f with SMTP id kj20-20020a056214529400b0067a255cc43fmr20595303qvb.18.1701375313540;
        Thu, 30 Nov 2023 12:15:13 -0800 (PST)
Received: from soleen.c.googlers.com.com (55.87.194.35.bc.googleusercontent.com. [35.194.87.55])
        by smtp.gmail.com with ESMTPSA id e1-20020a0cb441000000b0067a35608186sm795252qvf.28.2023.11.30.12.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 12:15:13 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: akpm@linux-foundation.org,
	alim.akhtar@samsung.com,
	alyssa@rosenzweig.io,
	asahi@lists.linux.dev,
	baolu.lu@linux.intel.com,
	bhelgaas@google.com,
	cgroups@vger.kernel.org,
	corbet@lwn.net,
	david@redhat.com,
	dwmw2@infradead.org,
	hannes@cmpxchg.org,
	heiko@sntech.de,
	iommu@lists.linux.dev,
	jernej.skrabec@gmail.com,
	jonathanh@nvidia.com,
	joro@8bytes.org,
	krzysztof.kozlowski@linaro.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	lizefan.x@bytedance.com,
	marcan@marcan.st,
	mhiramat@kernel.org,
	m.szyprowski@samsung.com,
	pasha.tatashin@soleen.com,
	paulmck@kernel.org,
	rdunlap@infradead.org,
	robin.murphy@arm.com,
	samuel@sholland.org,
	suravee.suthikulpanit@amd.com,
	sven@svenpeter.dev,
	thierry.reding@gmail.com,
	tj@kernel.org,
	tomas.mudrunka@gmail.com,
	vdumpa@nvidia.com,
	wens@csie.org,
	will@kernel.org,
	yu-cheng.yu@intel.com
Subject: [PATCH v2 06/10] iommu/rockchip: use page allocation function provided by iommu-pages.h
Date: Thu, 30 Nov 2023 20:15:00 +0000
Message-ID: <20231130201504.2322355-7-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231130201504.2322355-1-pasha.tatashin@soleen.com>
References: <20231130201504.2322355-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert iommu/rockchip-iommu.c to use the new page allocation functions
provided in iommu-pages.h.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 drivers/iommu/rockchip-iommu.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 2685861c0a12..e04f22d481d0 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -26,6 +26,8 @@
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
+#include "iommu-pages.h"
+
 /** MMU register offsets */
 #define RK_MMU_DTE_ADDR		0x00	/* Directory table address */
 #define RK_MMU_STATUS		0x04
@@ -727,14 +729,14 @@ static u32 *rk_dte_get_page_table(struct rk_iommu_domain *rk_domain,
 	if (rk_dte_is_pt_valid(dte))
 		goto done;
 
-	page_table = (u32 *)get_zeroed_page(GFP_ATOMIC | rk_ops->gfp_flags);
+	page_table = iommu_alloc_page(GFP_ATOMIC | rk_ops->gfp_flags);
 	if (!page_table)
 		return ERR_PTR(-ENOMEM);
 
 	pt_dma = dma_map_single(dma_dev, page_table, SPAGE_SIZE, DMA_TO_DEVICE);
 	if (dma_mapping_error(dma_dev, pt_dma)) {
 		dev_err(dma_dev, "DMA mapping error while allocating page table\n");
-		free_page((unsigned long)page_table);
+		iommu_free_page(page_table);
 		return ERR_PTR(-ENOMEM);
 	}
 
@@ -1061,7 +1063,7 @@ static struct iommu_domain *rk_iommu_domain_alloc_paging(struct device *dev)
 	 * Each level1 (dt) and level2 (pt) table has 1024 4-byte entries.
 	 * Allocate one 4 KiB page for each table.
 	 */
-	rk_domain->dt = (u32 *)get_zeroed_page(GFP_KERNEL | rk_ops->gfp_flags);
+	rk_domain->dt = iommu_alloc_page(GFP_KERNEL | rk_ops->gfp_flags);
 	if (!rk_domain->dt)
 		goto err_free_domain;
 
@@ -1083,7 +1085,7 @@ static struct iommu_domain *rk_iommu_domain_alloc_paging(struct device *dev)
 	return &rk_domain->domain;
 
 err_free_dt:
-	free_page((unsigned long)rk_domain->dt);
+	iommu_free_page(rk_domain->dt);
 err_free_domain:
 	kfree(rk_domain);
 
@@ -1104,13 +1106,13 @@ static void rk_iommu_domain_free(struct iommu_domain *domain)
 			u32 *page_table = phys_to_virt(pt_phys);
 			dma_unmap_single(dma_dev, pt_phys,
 					 SPAGE_SIZE, DMA_TO_DEVICE);
-			free_page((unsigned long)page_table);
+			iommu_free_page(page_table);
 		}
 	}
 
 	dma_unmap_single(dma_dev, rk_domain->dt_dma,
 			 SPAGE_SIZE, DMA_TO_DEVICE);
-	free_page((unsigned long)rk_domain->dt);
+	iommu_free_page(rk_domain->dt);
 
 	kfree(rk_domain);
 }
-- 
2.43.0.rc2.451.g8631bc7472-goog


