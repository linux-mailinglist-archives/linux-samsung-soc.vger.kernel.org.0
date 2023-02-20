Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5439D69CE80
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 20 Feb 2023 14:59:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232719AbjBTN7j (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 20 Feb 2023 08:59:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232717AbjBTN7V (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Feb 2023 08:59:21 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 34014A249
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Feb 2023 05:59:08 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58026FEC;
        Mon, 20 Feb 2023 05:59:28 -0800 (PST)
Received: from [10.57.76.145] (unknown [10.57.76.145])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E73073F881;
        Mon, 20 Feb 2023 05:58:43 -0800 (PST)
Message-ID: <9a12fcac-c347-5d81-acef-1124c50d0c37@arm.com>
Date:   Mon, 20 Feb 2023 13:58:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] iommu/exynos: add missing set_platform_dma_ops callback
Content-Language: en-GB
To:     Jason Gunthorpe <jgg@ziepe.ca>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     iommu@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        lim Akhtar <alim.akhtar@samsung.com>,
        Lu Baolu <baolu.lu@linux.intel.com>
References: <CGME20230123093116eucas1p19b8fe8afc4b631debbdc5321c53009e9@eucas1p1.samsung.com>
 <20230123093102.12392-1-m.szyprowski@samsung.com> <Y871a3elCP1gmPQi@ziepe.ca>
 <e7aa3a5d-c8f9-ad7d-4c5c-08756c1ab2d3@samsung.com>
 <Y+90rkPHe/+eSLs6@ziepe.ca>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <Y+90rkPHe/+eSLs6@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 2023-02-17 12:35, Jason Gunthorpe wrote:
> On Fri, Feb 17, 2023 at 12:08:42PM +0100, Marek Szyprowski wrote:
>> Hi,
>>
>> I'm sorry for a delay in replying, but I was busy with other stuff.
>>
>> On 23.01.2023 22:00, Jason Gunthorpe wrote:
>>> On Mon, Jan 23, 2023 at 10:31:01AM +0100, Marek Szyprowski wrote:
>>>> Add set_platform_dma_ops() required for proper driver operation on ARM
>>>> 32bit arch after recent changes in the IOMMU framework (detach ops
>>>> removal).
>>> Thanks for looking into this!
>>>
>>> Can you explain more about how this actually solves the problem in the
>>> commit message? I don't get it.
>>
>> Exynos DRM driver calls arm_iommu_detach_device(), then
>> arm_iommu_attach_device() with a difrent 'mapping', see
>> drivers/gpu/drm/exynos/exynos_drm_dma.c Lack of set_platform_dma_ops
>> leads to a warning in iommu_group_do_set_platform_dma(). The other case
>> of calling arm_iommu_detach_device() is after unsuccessful probe of the
>> platform device.
> 
> Why can't this just use the normal iommu path in all cases?
> 
> It looks like it is trying to copy the DMA API domain from a parent
> device to a sub device.
> 
> Even when using arm_iommu an iommu_domain is still present, so the
> copy code should work?

The ARM DMA domain is a regular unmanaged domain owned by the ARM DMA 
code - in order to use any *other* domain, a user has to detach from 
that first (wrapped up in arm_iommu_detach_device() which also swizzles 
the DMA ops at the same time). Without set_platform_dma, that detach is 
now impossible (because no IOMMU API default domain exists either).

> Though I'm still not really sure how this arm_iommu stuff works..
> 
> eg if a driver does iommu_device_claim_dma_owner() how does the
> iommu_domain get set back to the arm_iommu's mapping's iommu_domain?

It doesn't. Fact is that VFIO has only ever worked on Arm with arm-smmu 
and its old deprecated DT bindings which don't interact with any of the 
DMA ops stuff. And ownership has always been inherently enforced here 
since the DMA ops are just another external user from the IOMMU API's PoV.

> According to the API that is what set_platform is supposed to do (eg
> it is what s390 does), but I don't see any code like that in any of
> the ARM32 drivers..

As above, it's in the relevant users, not the drivers. For what you're 
thinking of, the "platform" state is only ever transient.

(for the purposes of this discussion, ignore the MTK and Renesas drivers 
bodging around to implement pseudo-default-domain support on *top* of 
the user-centric arm_iommu_* APIs; that's a whole other mess to unravel)

Thanks,
Robin.
