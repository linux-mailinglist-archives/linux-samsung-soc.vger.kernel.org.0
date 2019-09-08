Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64D8DACFFA
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  8 Sep 2019 18:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730201AbfIHQ5J (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 8 Sep 2019 12:57:09 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:35022 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730184AbfIHQ5J (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 8 Sep 2019 12:57:09 -0400
Received: by mail-pl1-f195.google.com with SMTP id s17so552546plp.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 08 Sep 2019 09:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tcd-ie.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fAJIaeMy2eQobkqze5gpyoS/QeZKT96RyPc/Fq8itMQ=;
        b=gIzGX1RTmcudGCJKOn/C+BiFyjNYhfDmzcWXTYF+GB+qYZsgO8XgeYRVyeQwPkY9H9
         wfcau0BPSQZIc6VAMovCcu1x8zDws3CiXhc1r6OYf4EtX2tQYvlMR3BEakgC4F6WP7Op
         79lex3NN6lZ+6TqnODebKT25rPq9q2Ad7p3Ut4sP8GPNT+7DIHZ19pOA0zDuRx4Ve3NY
         wp5WrvVtMXdljRkCSQiTIk2IaQjfmdoveQnUnhEIELuxE8lz6PcBZTU/HM4WKB4UxloM
         qPm0/gAXG7FBDBK6aDWzi9nPMPolJ3ZyPfs2DEfSVL2fVvMhQ8jDgmTtmLFwp7IOmIWY
         n7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fAJIaeMy2eQobkqze5gpyoS/QeZKT96RyPc/Fq8itMQ=;
        b=lJslZeiwnpm8L99DYwmeo9vKVDbJjx5K7YgMsm+MtmIYmGwLthdLcg1WAusjM/DR3n
         BswR2pSguQ7ttlQN0Yj6aFUX0C3zosI7gbSdJJOS5vTO83lytLWgYn6qroiYTpWqeTvJ
         kkJuUzQPpj7jswq972R0CcISbtOeZZMkm3uay3IAYfWJay5qvOyjmzklrG37yesDF0nz
         bl7FijUava64+C7+kFUZqJv/l3GwXJLqMWA+iGzt78KzjETzqScPB5Mel0s1t2t+xKu7
         2m9tFdMD3DmRvOCHU3e90WcieJavJf3HfK20dyw+9cDh7bSHvMleenzO2+Sr6tpHcO0t
         pfKg==
X-Gm-Message-State: APjAAAVr5RgFii2kStNW3fW5dzskpsvi8w03HWhYMW67vg6QVUFVagIc
        1dNPaTFVIGpHg8O7Ul27X7b1PQ==
X-Google-Smtp-Source: APXvYqzPhfrkAZBGVLAMVQJgc4sTyV+jrwe7GCElyOlS0MKLQHm4nHnT+K5O7UwOhB9dVwQiBTXNrw==
X-Received: by 2002:a17:902:8486:: with SMTP id c6mr1779387plo.341.1567961828443;
        Sun, 08 Sep 2019 09:57:08 -0700 (PDT)
Received: from localhost.localdomain ([24.244.23.109])
        by smtp.googlemail.com with ESMTPSA id f188sm13834631pfa.170.2019.09.08.09.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Sep 2019 09:57:07 -0700 (PDT)
From:   Tom Murphy <murphyt7@tcd.ie>
To:     iommu@lists.linux-foundation.org
Cc:     Tom Murphy <murphyt7@tcd.ie>, Robin Murphy <robin.murphy@arm.com>,
        Christoph Hellwig <hch@lst.de>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: [PATCH V6 4/5] iommu/dma-iommu: Use the dev->coherent_dma_mask
Date:   Sun,  8 Sep 2019 09:56:40 -0700
Message-Id: <20190908165642.22253-5-murphyt7@tcd.ie>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190908165642.22253-1-murphyt7@tcd.ie>
References: <20190908165642.22253-1-murphyt7@tcd.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use the dev->coherent_dma_mask when allocating in the dma-iommu ops api.

Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
---
 drivers/iommu/dma-iommu.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index bd09b6b31c4e..0cf52fae1471 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -471,7 +471,7 @@ static void __iommu_dma_unmap(struct device *dev, dma_addr_t dma_addr,
 }
 
 static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
-		size_t size, int prot)
+		size_t size, int prot, dma_addr_t dma_mask)
 {
 	struct iommu_domain *domain = iommu_get_dma_domain(dev);
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
@@ -484,7 +484,7 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
 
 	size = iova_align(iovad, size + iova_off);
 
-	iova = iommu_dma_alloc_iova(domain, size, dma_get_mask(dev), dev);
+	iova = iommu_dma_alloc_iova(domain, size, dma_mask, dev);
 	if (!iova)
 		return DMA_MAPPING_ERROR;
 
@@ -735,7 +735,7 @@ static dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
 	int prot = dma_info_to_prot(dir, coherent, attrs);
 	dma_addr_t dma_handle;
 
-	dma_handle = __iommu_dma_map(dev, phys, size, prot);
+	dma_handle = __iommu_dma_map(dev, phys, size, prot, dma_get_mask(dev));
 	if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
 	    dma_handle != DMA_MAPPING_ERROR)
 		arch_sync_dma_for_device(dev, phys, size, dir);
@@ -938,7 +938,8 @@ static dma_addr_t iommu_dma_map_resource(struct device *dev, phys_addr_t phys,
 		size_t size, enum dma_data_direction dir, unsigned long attrs)
 {
 	return __iommu_dma_map(dev, phys, size,
-			dma_info_to_prot(dir, false, attrs) | IOMMU_MMIO);
+			dma_info_to_prot(dir, false, attrs) | IOMMU_MMIO,
+			dma_get_mask(dev));
 }
 
 static void iommu_dma_unmap_resource(struct device *dev, dma_addr_t handle,
@@ -1041,7 +1042,8 @@ static void *iommu_dma_alloc(struct device *dev, size_t size,
 	if (!cpu_addr)
 		return NULL;
 
-	*handle = __iommu_dma_map(dev, page_to_phys(page), size, ioprot);
+	*handle = __iommu_dma_map(dev, page_to_phys(page), size, ioprot,
+			dev->coherent_dma_mask);
 	if (*handle == DMA_MAPPING_ERROR) {
 		__iommu_dma_free(dev, size, cpu_addr);
 		return NULL;
-- 
2.20.1

