Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85C5769AAD6
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 17 Feb 2023 12:55:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229800AbjBQLzI (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 17 Feb 2023 06:55:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjBQLzI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 06:55:08 -0500
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8464362FF7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Feb 2023 03:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676634907; x=1708170907;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+3ZcUtit/3uVD0eeixju/VUDfax2Cl0zCUwn1Ui9mCk=;
  b=hGeVguTsp0kS/1kunBTuZGo+ZQZMGS8j3jgSpY8hmzh5/Im7hiBXUPL3
   acOvk+sYq3nr+kwXWoCLZeQsT6w/JQFs+FiRLA1JHo00XZXYH4oK5js87
   ySp/iEILyXdrYRF5dYTGOoMrLpsjMKzS9/UZDvVfO6c6GwOAGrRjEi0SO
   55UcPrYl3nwBGdTIRCNPgQqUpTcy5mbV1EHjy8I4A9fQtZtkwjQvIx2bp
   0EnE8nj4OckZSduAlq5+vdu02+UPnL1i1BMDMk1kKekS7Y0gJ625a4gnv
   mmvhCsJkC5AvKnZU9KTS16l2M5aP79l/7Ci/akevIr8bIVwCJW2odsqmE
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="330632236"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="330632236"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 03:55:07 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="759349050"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="759349050"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.255.30.9]) ([10.255.30.9])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 03:55:03 -0800
Message-ID: <68a4f742-fbeb-5a7b-79ca-0ca8b68d2208@linux.intel.com>
Date:   Fri, 17 Feb 2023 19:55:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Cc:     baolu.lu@linux.intel.com, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        lim Akhtar <alim.akhtar@samsung.com>,
        Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] iommu/exynos: Fix set_platform_dma_ops() callback
Content-Language: en-US
To:     Marek Szyprowski <m.szyprowski@samsung.com>, iommu@lists.linux.dev,
        linux-samsung-soc@vger.kernel.org
References: <CGME20230217112140eucas1p1703b82cfcdb933f07baa154183845986@eucas1p1.samsung.com>
 <20230217112129.18879-1-m.szyprowski@samsung.com>
From:   Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <20230217112129.18879-1-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 2023/2/17 19:21, Marek Szyprowski wrote:
> There are some subtle differences between release_device() and
> set_platform_dma_ops() callbacks, so separate those two callbacks. Device
> links should be removed only in release_device(), because they were
> created in probe_device(). While fixing this, remove the conditional code
> as it is not really needed.
> 
> Reported-by: Jason Gunthorpe<jgg@ziepe.ca>
> Fixes: 189d496b48b1 ("iommu/exynos: Add missing set_platform_dma_ops callback")

The exynos iommu driver actually supports default domain. Why need to
add the set_platform_dma_ops?

  897 static struct iommu_domain *exynos_iommu_domain_alloc(unsigned type)
  898 {
  899         struct exynos_iommu_domain *domain;
  900         dma_addr_t handle;
  901         int i;
  902
  903         /* Check if correct PTE offsets are initialized */
  904         BUG_ON(PG_ENT_SHIFT < 0 || !dma_dev);
  905
  906         if (type != IOMMU_DOMAIN_DMA && type != 
IOMMU_DOMAIN_UNMANAGED)
  907                 return NULL;

It actually doesn't support identity default domain. But the iommu core
allows this and roll back to DMA domain instead.

1686 static int iommu_group_alloc_default_domain(struct iommu_group *group,
1687                                             struct device *dev,
1688                                             unsigned int type)
1689 {
1690         struct iommu_domain *dom;
1691
1692         dom = __iommu_domain_alloc(dev, type);
1693         if (!dom && type != IOMMU_DOMAIN_DMA) {
1694                 dom = __iommu_domain_alloc(dev, IOMMU_DOMAIN_DMA);
1695                 if (dom)
1696                         pr_warn("Failed to allocate default IOMMU 
domain of type %u for group %s - Falling back to IOMMU_DOMAIN_D     MA", 

1697                                 type, group->name);
1698         }

I have a feeling, set_platform_dma_ops was mistakenly added to fix other
problems instead of missing a callback.

Best regards,
baolu
