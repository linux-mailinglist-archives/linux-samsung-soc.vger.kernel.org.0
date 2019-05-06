Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D1A7153F8
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  6 May 2019 20:53:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726924AbfEFSxX (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 6 May 2019 14:53:23 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:41880 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbfEFSxF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 May 2019 14:53:05 -0400
Received: by mail-ed1-f66.google.com with SMTP id m4so16333218edd.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 May 2019 11:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=/hTYvyPXHYQkQCzQru2covdVf7EDKqdAg5C6++p9hp0=;
        b=TXXO0sUa5j2S+jQ2V/DuEJrsKRb3HDirT68HeTl/j87oqJltVn4/AzBIpIAnNJ/FTH
         BXD7hqCTZ8mP2/lkvt1YSXSIXRnKzl+SJT6TihX5StIqNa/rsvmRT+SjQwhDfAJ6UJET
         MZ/njB9sHEoNIOd472p2eie0qVRix++XVw2puekuSuQtcs+wwcmPBTEbt7Pxw00WiIiH
         oJTpiQqm5ABDoXPS9p4VISTAAHXo9UWBrxWMGYQV4yMOP0ulAbVr0v4NsXjkGngspKYl
         WpzS32AYszwzwhILjzd9G0P62O4tCUfchiMuwAKSQ28IXVLOhuSTSSGSUosTjNhFTnnK
         vs1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=/hTYvyPXHYQkQCzQru2covdVf7EDKqdAg5C6++p9hp0=;
        b=t6Bpu/kDayZxZZm7UorkpF3NZn7D8ffqGpT7NVNhU9wELlE5u4tlj3eq2f6vcDgm6Q
         6cQF212sLj1k69DidNCR6cFZfAt+Z1AKd9X6Ryd586PnBz55rN/knTmG5WlVbe0tQyR2
         VlmhnqhGiNFR2goPIrkv37srUyv5m6jn06vXBdHM4YaYCtxw6IWoJS8gt6v2S62BoEaV
         VrJbbI88r+wWeijlaDA9s6F0Dw1cN565mS358vuGv8HOjUr7HaipP5wwVu/mQUcWM2pw
         rT6SX+fdWQJ1dTnU4jtzxLWQyj7k9nfeMSRxnPx71+g91yNoMWD35mzthHKtc8enTg2X
         lfNA==
X-Gm-Message-State: APjAAAUa9WYVehbcOmorqgn//l+WAMwOHpXpdfJbBxfYwcPOmDDiLJgY
        Zyxcf7zwUOarLO1pfCuK6skP3Q==
X-Google-Smtp-Source: APXvYqx6gw3vWSp/t+3S0SAtNJ94zSpQdEJDOcQR4soMcEGxTBfWu3kSLkCmkGga0x9j1A01hmIVvQ==
X-Received: by 2002:a17:906:e241:: with SMTP id gq1mr20832987ejb.5.1557168784042;
        Mon, 06 May 2019 11:53:04 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:a0:bc00:d9d9:922a:828d:a50e])
        by smtp.gmail.com with ESMTPSA id e35sm3361412eda.2.2019.05.06.11.53.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 11:53:03 -0700 (PDT)
From:   Tom Murphy <tmurphy@arista.com>
To:     iommu@lists.linux-foundation.org
Cc:     murphyt7@tcd.ie, Tom Murphy <tmurphy@arista.com>,
        Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will.deacon@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v3 3/4] iommu/dma-iommu: Use the dev->coherent_dma_mask
Date:   Mon,  6 May 2019 19:52:05 +0100
Message-Id: <20190506185207.31069-4-tmurphy@arista.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190506185207.31069-1-tmurphy@arista.com>
References: <20190506185207.31069-1-tmurphy@arista.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use the dev->coherent_dma_mask when allocating in the dma-iommu ops api.

Signed-off-by: Tom Murphy <tmurphy@arista.com>
---
 drivers/iommu/dma-iommu.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index b383498e2dc3..2a968afdab10 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -442,7 +442,8 @@ static void __iommu_dma_unmap(struct iommu_domain *domain, dma_addr_t dma_addr,
 }
 
 static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
-		size_t size, int prot, struct iommu_domain *domain)
+		size_t size, int prot, struct iommu_domain *domain,
+		dma_addr_t dma_mask)
 {
 	struct iommu_dma_cookie *cookie = domain->iova_cookie;
 	size_t iova_off = 0;
@@ -453,7 +454,7 @@ static dma_addr_t __iommu_dma_map(struct device *dev, phys_addr_t phys,
 		size = iova_align(&cookie->iovad, size + iova_off);
 	}
 
-	iova = iommu_dma_alloc_iova(domain, size, dma_get_mask(dev), dev);
+	iova = iommu_dma_alloc_iova(domain, size, dma_mask, dev);
 	if (!iova)
 		return DMA_MAPPING_ERROR;
 
@@ -496,7 +497,7 @@ static void *iommu_dma_alloc_contiguous(struct device *dev, size_t size,
 		return NULL;
 
 	*dma_handle = __iommu_dma_map(dev, page_to_phys(page), size, ioprot,
-			iommu_get_dma_domain(dev));
+			iommu_get_dma_domain(dev), dev->coherent_dma_mask);
 	if (*dma_handle == DMA_MAPPING_ERROR) {
 		if (!dma_release_from_contiguous(dev, page, count))
 			__free_pages(page, page_order);
@@ -766,7 +767,7 @@ static void *iommu_dma_alloc_pool(struct device *dev, size_t size,
 
 	*dma_handle = __iommu_dma_map(dev, page_to_phys(page), size,
 			dma_info_to_prot(DMA_BIDIRECTIONAL, coherent, attrs),
-			iommu_get_domain_for_dev(dev));
+			iommu_get_domain_for_dev(dev), dev->coherent_dma_mask);
 	if (*dma_handle == DMA_MAPPING_ERROR) {
 		dma_free_from_pool(vaddr, PAGE_ALIGN(size));
 		return NULL;
@@ -857,7 +858,7 @@ static dma_addr_t iommu_dma_map_page(struct device *dev, struct page *page,
 
 	dma_handle = __iommu_dma_map(dev, phys, size,
 			dma_info_to_prot(dir, coherent, attrs),
-			iommu_get_dma_domain(dev));
+			iommu_get_dma_domain(dev), dma_get_mask(dev));
 	if (!coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC) &&
 	    dma_handle != DMA_MAPPING_ERROR)
 		arch_sync_dma_for_device(dev, phys, size, dir);
@@ -1067,7 +1068,7 @@ static dma_addr_t iommu_dma_map_resource(struct device *dev, phys_addr_t phys,
 {
 	return __iommu_dma_map(dev, phys, size,
 			dma_info_to_prot(dir, false, attrs) | IOMMU_MMIO,
-			iommu_get_dma_domain(dev));
+			iommu_get_dma_domain(dev), dma_get_mask(dev));
 }
 
 static void iommu_dma_unmap_resource(struct device *dev, dma_addr_t handle,
@@ -1246,7 +1247,8 @@ static struct iommu_dma_msi_page *iommu_dma_get_msi_page(struct device *dev,
 	if (!msi_page)
 		return NULL;
 
-	iova = __iommu_dma_map(dev, msi_addr, size, prot, domain);
+	iova = __iommu_dma_map(dev, msi_addr, size, prot, domain,
+			dma_get_mask(dev));
 	if (iova == DMA_MAPPING_ERROR)
 		goto out_free_page;
 
-- 
2.17.1

