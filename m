Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 424D5554761
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 22 Jun 2022 14:12:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231537AbiFVJPI (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 22 Jun 2022 05:15:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352467AbiFVJOx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Jun 2022 05:14:53 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0A0DF101F2;
        Wed, 22 Jun 2022 02:14:17 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C031813D5;
        Wed, 22 Jun 2022 02:14:16 -0700 (PDT)
Received: from [10.57.85.1] (unknown [10.57.85.1])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48B373F66F;
        Wed, 22 Jun 2022 02:14:12 -0700 (PDT)
Message-ID: <47a0abcc-b3d6-a9a3-8d3a-5689bbf8767a@arm.com>
Date:   Wed, 22 Jun 2022 10:14:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC 2/3] iommu/samsung: Introduce Exynos sysmmu-v8 driver
Content-Language: en-GB
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Cho KyongHo <pullip.cho@samsung.com>,
        Hyesoo Yu <hyesoo.yu@samsung.com>,
        Janghyuck Kim <janghyuck.kim@samsung.com>,
        Jinkyu Yang <jinkyu1.yang@samsung.com>,
        Alex <acnwigwe@google.com>, Carlos Llamas <cmllamas@google.com>,
        Daniel Mentz <danielmentz@google.com>,
        Erick Reyes <erickreyes@google.com>,
        "J . Avila" <elavila@google.com>, Jonglin Lee <jonglin@google.com>,
        Mark Salyzyn <salyzyn@google.com>,
        Thierry Strudel <tstrudel@google.com>,
        Will McVicker <willmcvicker@google.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220120201958.2649-1-semen.protsenko@linaro.org>
 <20220120201958.2649-3-semen.protsenko@linaro.org>
 <a111932a-6685-2a9d-abce-87af26b121a4@canonical.com>
 <CGME20220121110911eucas1p28d11e1b04773e8174b9d65f011dc1977@eucas1p2.samsung.com>
 <CAPLW+4kKR+7hM-eZc8-v6Dzeaj+TPBRmCLDSVNEnfx2WmN2TJA@mail.gmail.com>
 <54b76143-dff3-8a19-7ab9-57fb80d59743@samsung.com>
 <CAPLW+4nxSDeGL-1hFzdDr3vYx+9ct8_YrXfVNgzwm1Gq2=Vh7A@mail.gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <CAPLW+4nxSDeGL-1hFzdDr3vYx+9ct8_YrXfVNgzwm1Gq2=Vh7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 2022-06-21 20:57, Sam Protsenko wrote:
> Hi Marek,
> 
> On Fri, 21 Jan 2022 at 14:31, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> 
> [snip]
> 
>>
>> Well, for starting point the existing exynos-iommu driver is really
>> enough. I've played a bit with newer Exyos SoCs some time ago. If I
>> remember right, if you limit the iommu functionality to the essential
>> things like mapping pages to IO-virtual space, the hardware differences
>> between SYSMMU v5 (already supported by the exynos-iommu driver) and v7
>> are just a matter of changing a one register during the initialization
>> and different bits the page fault reason decoding. You must of course
>> rely on the DMA-mapping framework and its implementation based on
>> mainline DMA-IOMMU helpers. All the code for custom iommu group(s)
>> handling or extended fault management are not needed for the initial
>> version.
>>
> 
> Thanks for the advice! Just implemented some testing driver, which
> uses "Emulated Translation" registers available on SysMMU v7. That's
> one way to verify the IOMMU driver with no actual users of it. It
> works fine with vendor SysMMU driver I ported to mainline earlier, and
> now I'm trying to use it with exynos-sysmmu driver (existing
> upstream). If you're curious -- I can share the testing driver
> somewhere on GitHub.
> 
> I believe the register you mentioned is PT_BASE one, so I used
> REG_V7_FLPT_BASE_VM = 0x800C instead of REG_V5_PT_BASE_PFN. But I
> didn't manage to get that far, unfortunately, as
> exynos_iommu_domain_alloc() function fails in my case, with BUG_ON()
> at this line:
> 
>      /* For mapping page table entries we rely on dma == phys */
>      BUG_ON(handle != virt_to_phys(domain->pgtable));
> 
> One possible explanation for this BUG is that "dma-ranges" property is
> not provided in DTS (which seems to be the case right now for all
> users of "samsung,exynos-sysmmu" driver). Because of that the SWIOTLB
> is used for dma_map_single() call (in exynos_iommu_domain_alloc()
> function), which in turn leads to that BUG. At least that's what
> happens in my case. The call chain looks like this:
> 
>      exynos_iommu_domain_alloc()
>          v
>      dma_map_single()
>          v
>      dma_map_single_attrs()
>          v
>      dma_map_page_attrs()
>          v
>      dma_direct_map_page()  // dma_capable() == false
>          v
>      swiotlb_map()
>          v
>      swiotlb_tbl_map_single()
> 
> And the last call of course always returns the address different than
> the address for allocated pgtable. E.g. in my case I see this:
> 
>      handle = 0x00000000fbfff000
>      virt_to_phys(domain->pgtable) = 0x0000000880d0c000
> 
> Do you know what might be the reason for that? I just wonder how the
> SysMMU driver work for all existing Exynos platforms right now. I feel
> I might be missing something, like some DMA option should be enabled
> so that SWIOTLB is not used, or something like that. Please let me
> know if you have any idea on possible cause. The vendor's SysMMU
> driver is kinda different in that regard, as it doesn't use
> dma_map_single(), so I don't see such issue there.

If this SysMMU version is capable of addressing more than 32 bits, then 
exynos_iommu_probe_device() should set its DMA masks appropriately.

(as a side note since I looked, the use of PAGE_SIZE/PAGE_SHIFT in the 
driver looks wrong, since I can't imagine that the hardware knows 
whether Linux is using 4KB, 16KB or 64KB and adjusts itself accordingly...)

Robin.
