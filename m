Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A1D3247E33
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 18 Aug 2020 08:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726624AbgHRGEf (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 18 Aug 2020 02:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbgHRGE0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Aug 2020 02:04:26 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56E4BC061348
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Aug 2020 23:04:26 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ep8so8760989pjb.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Aug 2020 23:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tcd-ie.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a6SU4e7qioZa1MSGn21iWR1ma/iTKUTYpUuysCGcy14=;
        b=hxpRljSMtWhlvVTpffp4qhvMX1mdxLX6f0iMxptJuN7hUOC5AHsbLalFs+KtKDLB/V
         YL6y4BRukmSd0p99UL6RuVK4dHIwnPQgujw5EkR0OwSLbuHb6cHKrRpJ9I9XehRsNagY
         rxVhoRNaj3NwPAkQz+yOOdny8t4nvLbSgWrNevsCNIQB2QmDSOJnPiGn8C2yAhJBBcU6
         SA3gEspw8HLI8LBXCjAdHDMxYTIUo9jpwo1cNNTJfUxHkX/I3V3In9OZhaglBBrdlzyT
         s8Fv+oSbk5r/Z+poak4UteeUno8QRtJmD4t+F9iexuoY0lyXqxIis3Td5/onXebHC4tY
         tBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a6SU4e7qioZa1MSGn21iWR1ma/iTKUTYpUuysCGcy14=;
        b=SIiNVefce+QkjtEBPjuZQEvUQseh2DAQkf9QGRvJUGmqoaHpHKGPfwr/7TlIZclPFz
         +T2mAqoQM4NjuHF7qkESboL9/y09oT9sqVzrBp0vRqO9zIGNfjG01zW/8XHGrMpjuX6K
         saqkbcHoc5FBLMn4GIPgjuLxLiMIClMWZKQiCaDgqk6nysF9x1e6n/CbzYldLByOi48V
         uj/o2mJfLaMoJdl0xXnh9I7/EBlf5FUg1YQDSZeYGwMV7XNwyQ9jYQT2KzKTJ0/+C3Zk
         VTWSyq6xM9UuFRvUxt6Xkwf1Pw3aoKhu50wDx9gfoU3bjCbTv0Z0Tr7KsiyNfKF0dq/i
         +mXQ==
X-Gm-Message-State: AOAM531FH6UdozqUHMk3izr4O4JErn4N3KdTzigmYptSaNkSEpRqRxsv
        HnmWOCYNF/thoq6O6iDTFOgfDQ==
X-Google-Smtp-Source: ABdhPJwIgdAjrz0QhHxtqrEjKsSeJiVX/sPlDBbqWWmVnl1cgdOijSjJUBJdGuOHZxzXZMmQ6vRK4Q==
X-Received: by 2002:a17:90a:1682:: with SMTP id o2mr16209039pja.227.1597730665925;
        Mon, 17 Aug 2020 23:04:25 -0700 (PDT)
Received: from tom-ThinkPad-X1-Carbon-5th.teksavvy.com ([69.172.145.184])
        by smtp.googlemail.com with ESMTPSA id v10sm7102985pjy.3.2020.08.17.23.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 23:04:25 -0700 (PDT)
From:   Tom Murphy <murphyt7@tcd.ie>
To:     iommu@lists.linux-foundation.org
Cc:     Tom Murphy <murphyt7@tcd.ie>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
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
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Alex Williamson <alex.williamson@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org, kvm@vger.kernel.org
Subject: [PATCH V2 2/2] Handle init_iova_flush_queue failure in dma-iommu path
Date:   Tue, 18 Aug 2020 07:04:14 +0100
Message-Id: <20200818060415.19522-2-murphyt7@tcd.ie>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200818060415.19522-1-murphyt7@tcd.ie>
References: <20200818060415.19522-1-murphyt7@tcd.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

init_iova_flush_queue can fail if we run out of memory. Fall back to no
flush queue if it fails.

Signed-off-by: Tom Murphy <murphyt7@tcd.ie>
---
 drivers/iommu/dma-iommu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 7433f74d921a..5445e2be08b5 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -356,9 +356,11 @@ static int iommu_dma_init_domain(struct iommu_domain *domain, dma_addr_t base,
 
 	if (!cookie->fq_domain && !iommu_domain_get_attr(domain,
 			DOMAIN_ATTR_DMA_USE_FLUSH_QUEUE, &attr) && attr) {
-		cookie->fq_domain = domain;
-		init_iova_flush_queue(iovad, iommu_dma_flush_iotlb_all,
-				iommu_dma_entry_dtor);
+		if (init_iova_flush_queue(iovad, iommu_dma_flush_iotlb_all,
+				iommu_dma_entry_dtor))
+			pr_warn("iova flush queue initialization failed\n");
+		else
+			cookie->fq_domain = domain;
 	}
 
 	if (!dev)
-- 
2.20.1

