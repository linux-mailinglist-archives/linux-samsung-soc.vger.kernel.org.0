Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3011C1289E1
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 21 Dec 2019 16:04:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727453AbfLUPEs (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 21 Dec 2019 10:04:48 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:41546 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727443AbfLUPEr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 21 Dec 2019 10:04:47 -0500
Received: by mail-ed1-f66.google.com with SMTP id c26so11386722eds.8
        for <linux-samsung-soc@vger.kernel.org>; Sat, 21 Dec 2019 07:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tcd-ie.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=i4dEmM8P1MkKKnNa6NcbuVyKrLsO9ZvL1WqSkd7MOXA=;
        b=WkrW4Y9gFyG7Qyoell6pvhgdKX7JRReMnuuB9atJoZy04C/ONzngI9MJcZe1C52tLI
         oAbpeUorXN0OuO/Eg0uTEPtK43geQL68lw4o7Ot8H5XsWGNoa1eKf/zWorwqA2LubWhP
         ocpyZSMtNUbr1NWS3tmsbNFojfO0KFn4+WKore4fioT3aEQ4/J+J2uZcNnl0dckx4Wul
         NRwfEfsYHCfN/A/PJf0LwxVas5fBCAxc6UJkeMBPTkWvH4AkfCBijNzpnj6o2cB8Gozf
         5sLHCOhpM/FGuPL/eZWe8ySg2l+HsNgX8TbOePQbTkrzEKNWd/Ih3KEJxTQ88SBthjQ7
         3K5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=i4dEmM8P1MkKKnNa6NcbuVyKrLsO9ZvL1WqSkd7MOXA=;
        b=gxaAxjuWA/Owc/fxXQ9uVx0vj6hYHkUQK02U5vOfUmw8FGWckvO0zlBx0W4VHQlbzu
         qHqZnsWQNkWkDAXbBLFqnpBkkPlgvIfxE02/tEDRjPL/gJ36hOtqYS31FGYDCDtPHOyT
         2Eyr/etDwhD096aUmU3L7F4p0d036fUcLXqCGW3HRiM2lKvpcc8MRTUozcg01B9p8rKN
         feS9LFraZ48p/rkuFUPZNu2S2JRmdlIQFpW389tQaJIawjtBHOoLall7fOXBJ1EQbcb6
         usZ0g1snoNSpJuTxc+u6IjdwS9gK0RWGTeOSHA4M8j14TPfCS6cfD0LybXla0Focn5Xm
         rGvQ==
X-Gm-Message-State: APjAAAVlvRfVnN77PYEYRCSOpDuDFDHsdzklodXXYo5WNYUISDYhv/VQ
        WE2+BcpZ9YkUEwtLNi87jwox4Q==
X-Google-Smtp-Source: APXvYqzXACa8CmCe+lm4PqHAgWDF0JjnrRxrrR2y7kN6n1yqsWvuOaXwCLqKegFsZD4yWY1Pcx2X8g==
X-Received: by 2002:a05:6402:2c3:: with SMTP id b3mr22084523edx.207.1576940686355;
        Sat, 21 Dec 2019 07:04:46 -0800 (PST)
Received: from localhost.localdomain ([80.233.37.20])
        by smtp.googlemail.com with ESMTPSA id u13sm1517639ejz.69.2019.12.21.07.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Dec 2019 07:04:45 -0800 (PST)
From:   Tom Murphy <murphyt7@tcd.ie>
To:     iommu@lists.linux-foundation.org
Cc:     Tom Murphy <murphyt7@tcd.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Eric Auger <eric.auger@redhat.com>,
        Julien Grall <julien.grall@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org, kvm@vger.kernel.org
Subject: [PATCH 5/8] iommu: Add iommu_dma_free_cpu_cached_iovas function
Date:   Sat, 21 Dec 2019 15:03:57 +0000
Message-Id: <20191221150402.13868-6-murphyt7@tcd.ie>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191221150402.13868-1-murphyt7@tcd.ie>
References: <20191221150402.13868-1-murphyt7@tcd.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

to dma-iommu ops

Add a iommu_dma_free_cpu_cached_iovas function to allow drivers which
use the dma-iommu ops to free cached cpu iovas.

Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
---
 drivers/iommu/dma-iommu.c | 9 +++++++++
 include/linux/dma-iommu.h | 3 +++
 2 files changed, 12 insertions(+)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index df28facdfb8b..4eac3cd35443 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -50,6 +50,15 @@ struct iommu_dma_cookie {
 	struct iommu_domain		*fq_domain;
 };
 
+void iommu_dma_free_cpu_cached_iovas(unsigned int cpu,
+		struct iommu_domain *domain)
+{
+	struct iommu_dma_cookie *cookie = domain->iova_cookie;
+	struct iova_domain *iovad = &cookie->iovad;
+
+	free_cpu_cached_iovas(cpu, iovad);
+}
+
 static void iommu_dma_entry_dtor(unsigned long data)
 {
 	struct page *freelist = (struct page *)data;
diff --git a/include/linux/dma-iommu.h b/include/linux/dma-iommu.h
index 2112f21f73d8..316d22a4a860 100644
--- a/include/linux/dma-iommu.h
+++ b/include/linux/dma-iommu.h
@@ -37,6 +37,9 @@ void iommu_dma_compose_msi_msg(struct msi_desc *desc,
 
 void iommu_dma_get_resv_regions(struct device *dev, struct list_head *list);
 
+void iommu_dma_free_cpu_cached_iovas(unsigned int cpu,
+		struct iommu_domain *domain);
+
 #else /* CONFIG_IOMMU_DMA */
 
 struct iommu_domain;
-- 
2.20.1

