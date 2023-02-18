Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7D1469AA2B
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 17 Feb 2023 12:18:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjBQLSo (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 17 Feb 2023 06:18:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230052AbjBQLSk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 06:18:40 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33DFDC64B
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Feb 2023 03:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676632716; x=1708168716;
  h=message-id:date:mime-version:cc:subject:to:references:
   from:in-reply-to:content-transfer-encoding;
  bh=yrRSVErPU459BxzhezG2FKcPrwrMLF+zESuxtlMeo/A=;
  b=cbfRq/aE1mfY8KbvoASuVYFBy3pMkj17xbG8ENCb23E0uygKeIWV1h7I
   oJxDfVdeMtp4Q4efBoYRqeMbxToG1YqtZNYJniqn/RhTAtNtPMILDuGEV
   yPPrzXEfrVFbUuyXrT5vJl+g+pT9D5owmot1650H1SVSphrPkWDlG7JXU
   Zb3icWGTom+1akwXitn2dKvQTdbTNsfRZxuFNWPpifMi//6U1UkJ2Frm2
   TEbTLOKIlDQDMlmpy/Twgym9JbHRcJ1fIlPSojydCguDIScilEvXv5Y7P
   zIK79JIFYtvromPwQ3nEXVxGB4NrXJ2Rny++Eoxc0CkxxQnD9FzoCLYSB
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="333325012"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="333325012"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 03:18:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="844539389"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="844539389"
Received: from blu2-mobl.ccr.corp.intel.com (HELO [10.255.30.9]) ([10.255.30.9])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 03:18:33 -0800
Message-ID: <d6d3fa24-86f9-f5c4-5292-ccb0db6b986b@linux.intel.com>
Date:   Fri, 17 Feb 2023 19:18:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Cc:     baolu.lu@linux.intel.com, iommu@lists.linux.dev,
        linux-samsung-soc@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        lim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH] iommu/exynos: add missing set_platform_dma_ops callback
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Jason Gunthorpe <jgg@ziepe.ca>
References: <CGME20230123093116eucas1p19b8fe8afc4b631debbdc5321c53009e9@eucas1p1.samsung.com>
 <20230123093102.12392-1-m.szyprowski@samsung.com> <Y871a3elCP1gmPQi@ziepe.ca>
 <e7aa3a5d-c8f9-ad7d-4c5c-08756c1ab2d3@samsung.com>
Content-Language: en-US
From:   Baolu Lu <baolu.lu@linux.intel.com>
In-Reply-To: <e7aa3a5d-c8f9-ad7d-4c5c-08756c1ab2d3@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 2023/2/17 19:08, Marek Szyprowski wrote:
> Hi,
> 
> I'm sorry for a delay in replying, but I was busy with other stuff.
> 
> On 23.01.2023 22:00, Jason Gunthorpe wrote:
>> On Mon, Jan 23, 2023 at 10:31:01AM +0100, Marek Szyprowski wrote:
>>> Add set_platform_dma_ops() required for proper driver operation on ARM
>>> 32bit arch after recent changes in the IOMMU framework (detach ops
>>> removal).
>> Thanks for looking into this!
>>
>> Can you explain more about how this actually solves the problem in the
>> commit message? I don't get it.
> Exynos DRM driver calls arm_iommu_detach_device(), then
> arm_iommu_attach_device() with a difrent 'mapping', see
> drivers/gpu/drm/exynos/exynos_drm_dma.c Lack of set_platform_dma_ops
> leads to a warning in iommu_group_do_set_platform_dma(). The other case
> of calling arm_iommu_detach_device() is after unsuccessful probe of the
> platform device.

Do we really need to call iommu_detach_device() in
arm_iommu_detach_device() for 32-bit ARM? The dma-iommu is disabled for
32-bit ARM, hence calling .set_platform_dma_ops makes no sense.

In below patch,

https://lore.kernel.org/linux-iommu/20230217094736.159005-2-baolu.lu@linux.intel.com/

I removed iommu_detach_device() from arm_iommu_detach_device().

Best regards,
baolu

