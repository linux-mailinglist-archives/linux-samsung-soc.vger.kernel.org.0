Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99B786E01A5
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 13 Apr 2023 00:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbjDLWED (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 12 Apr 2023 18:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjDLWEB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 12 Apr 2023 18:04:01 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DACD08684
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Apr 2023 15:03:58 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20230412220357euoutp010567e7b48a7e7c89281adf9e567b9e7f~VTyCIWMR03254532545euoutp01M
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Apr 2023 22:03:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20230412220357euoutp010567e7b48a7e7c89281adf9e567b9e7f~VTyCIWMR03254532545euoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1681337037;
        bh=alQWLMtd05xPovG/c6xudTcnHzpj2y5yWcpEWSzmcTA=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=hGfWj0+Y4lirqHzxGVPcWe8ioLLQxRf+upz0jtZA9ohU6bY+RVQF00OnDHCG9Oej/
         Sac2NSj9sYEaN4QvCV+iy4Q5CSjGI1eLOSuBVRtPcVEsGk75qZ7DKBeLfUJyRydEMH
         7oRJyPESkPwlol3X5rAKgJuOz8gxpruB46fFjSWI=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20230412220356eucas1p1940d7a0dacee877ac53188dcaadf9a05~VTyBYkLGc1434414344eucas1p1f;
        Wed, 12 Apr 2023 22:03:56 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 99.AE.10014.CCA27346; Wed, 12
        Apr 2023 23:03:56 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20230412220355eucas1p27263ef49fae0547e6c61db3a41c14227~VTyApzmtp2589025890eucas1p2v;
        Wed, 12 Apr 2023 22:03:55 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20230412220355eusmtrp18a97954b609ee37fcfb859ffd181fa5c~VTyApH-Lu1316813168eusmtrp19;
        Wed, 12 Apr 2023 22:03:55 +0000 (GMT)
X-AuditID: cbfec7f5-b8bff7000000271e-ea-64372accad5d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 8E.06.34412.BCA27346; Wed, 12
        Apr 2023 23:03:55 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20230412220354eusmtip160a6f44737b4d4f710976bfc57b00ea8~VTyADrnzH2277422774eusmtip1j;
        Wed, 12 Apr 2023 22:03:54 +0000 (GMT)
Message-ID: <4fc0adda-2468-1db6-4ff3-1a48d8637615@samsung.com>
Date:   Thu, 13 Apr 2023 00:03:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
        Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] iommu/exynos: add missing set_platform_dma_ops callback
Content-Language: en-US
To:     Jason Gunthorpe <jgg@nvidia.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Steven Price <steven.price@arm.com>
Cc:     iommu@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        lim Akhtar <alim.akhtar@samsung.com>,
        Lu Baolu <baolu.lu@linux.intel.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <ZC9Xzvakhepn0liX@nvidia.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAKsWRmVeSWpSXmKPExsWy7djPc7pntMxTDD4d4LR4MG8bm8XmiVvZ
        LH59sbC48m8Po0Xn7A3sFntfb2W3mHF+H5PFwQ9PWC0aj7xns2i5Y+rA5fHk4DwmjzXz1jB6
        bFrVyeZx59oeNo95JwM9XmyeyejR2/yOzaNvyypGj8+b5AI4o7hsUlJzMstSi/TtErgyXp56
        x1ywTbziQfsP1gbGCcJdjJwcEgImEguvH2bqYuTiEBJYwSixfNo9ZgjnC6NE56cNLBDOZ0aJ
        g0vWssK0fFv5FapqOaPE1tVzGCGcj4wSs5YvZAap4hWwk/h0/CpYB4uAqsS+XYvZIOKCEidn
        PmEBsUUFUiR2n3zKDmILC/hIvLz8gQnEZhYQl7j1ZD6YLSJQIHHp9xOwM5gFmpgkblxoBBvE
        JmAo0fW2C8zmFNCSaN+0mB2iWV5i+9s5YOdJCPRzSjSdf8MOcbeLxPFDX5ghbGGJV8e3QMVl
        JE5P7mGBaGhnlFjw+z4ThDOBUaLh+S1GiCpriTvnfgGt4wBaoSmxfpc+RNhRYt/ZFnaQsIQA
        n8SNt4IQR/BJTNo2nRkizCvR0SYEUa0mMev4Ori1By9cYp7AqDQLKVxmIfl/FpJ3ZiHsXcDI
        sopRPLW0ODc9tdg4L7Vcrzgxt7g0L10vOT93EyMwkZ3+d/zrDsYVrz7qHWJk4mA8xCjBwawk
        wvvDxTRFiDclsbIqtSg/vqg0J7X4EKM0B4uSOK+27clkIYH0xJLU7NTUgtQimCwTB6dUA1OT
        3pKTQU92Hnp8uuLSFp+F+/Q+P7TpkmHRiK9c0rf6EYekbN+Tp4wf/TvvneA/s7Rrr6G76zUF
        Oe8Wu14Bpd7T3dcdV5j2F23nrp2kvOVErDrb+uiJuy40+hqaKC/68yg2cTG3kNi2qG0sLLyl
        v18pxn5m572oZ/aALXvzm12n+C6EvmzUfbM7xpqptkdxhsQSO1mBZLWy5buWp937dmnpxYAN
        TDNyZVYzKKzxF5xzJfL7AWbp+BcfPxvzuPop3JmcuMTs8Zp+Nocc+289WlvuXqufn/jJ89uh
        isfCrZ9Py6o+ULz79laWs9xJ7pcx8vxLvL2i1yc0/vMyZX2TolX5tGLF6f67TuE7Pnz9ulGJ
        pTgj0VCLuag4EQB14hVw0wMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRmVeSWpSXmKPExsVy+t/xu7qntcxTDM5tErJ4MG8bm8XmiVvZ
        LH59sbC48m8Po0Xn7A3sFntfb2W3mHF+H5PFwQ9PWC0aj7xns2i5Y+rA5fHk4DwmjzXz1jB6
        bFrVyeZx59oeNo95JwM9XmyeyejR2/yOzaNvyypGj8+b5AI4o/RsivJLS1IVMvKLS2yVog0t
        jPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyXp56x1ywTbziQfsP1gbGCcJdjJwc
        EgImEt9WfmXuYuTiEBJYyijxafE5RoiEjMTJaQ2sELawxJ9rXWwQRe8ZJTb/msMEkuAVsJP4
        dPwqWBGLgKrEvl2L2SDighInZz5hAbFFBVIkdk1YClYvLOAj8fLyBzCbWUBc4taT+WC2iECB
        xJ2v3xhBFjALNDFJfF0+B+wKIYHzTBJHPiaB2GwChhJdb7vAFnAKaEm0b1rMDjHITKJraxcj
        hC0vsf3tHOYJjEKzkNwxC8m+WUhaZiFpWcDIsopRJLW0ODc9t9hIrzgxt7g0L10vOT93EyMw
        brcd+7llB+PKVx/1DjEycTAeYpTgYFYS4f3hYpoixJuSWFmVWpQfX1Sak1p8iNEUGBgTmaVE
        k/OBiSOvJN7QzMDU0MTM0sDU0sxYSZzXs6AjUUggPbEkNTs1tSC1CKaPiYNTqoFp46YrCQ0s
        /3eGLtQus0uxK6l4wZhcbtF4+eLO7hBfjzrvqtOZDbMnH57E9z3g1o3q/39nzPXbdldz6/9Q
        ibAV//yjZ3WI6r83eFq6NmgBT2OXptJ0eRUrvwotBvZ3l+v8md9Yfs+eNbu1ziLpjuKKhzN9
        jVeubprZLlMd6Kkcte+ry/6WuS661Q/dTF+euC61rOzMmtz55bc+qNxNKEzXvHGptmBfWEXc
        ZYPwvmkRq3alsfhXlOQc/H9y5u6d364Fpxz6Hfz+xqxt/4unL3K7a+r8p+uYzY5Wt6Ofsou9
        eYs2Pg1qk7Cf+THF8+mzdulJj1X81ri/PflaJ/v+zdvXz6xMPHyTU3Opxu7c55HiSizFGYmG
        WsxFxYkAGoivzmQDAAA=
X-CMS-MailID: 20230412220355eucas1p27263ef49fae0547e6c61db3a41c14227
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230123093116eucas1p19b8fe8afc4b631debbdc5321c53009e9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230123093116eucas1p19b8fe8afc4b631debbdc5321c53009e9
References: <CGME20230123093116eucas1p19b8fe8afc4b631debbdc5321c53009e9@eucas1p1.samsung.com>
        <20230123093102.12392-1-m.szyprowski@samsung.com>
        <Y871a3elCP1gmPQi@ziepe.ca>
        <e7aa3a5d-c8f9-ad7d-4c5c-08756c1ab2d3@samsung.com>
        <Y+90rkPHe/+eSLs6@ziepe.ca> <9a12fcac-c347-5d81-acef-1124c50d0c37@arm.com>
        <ZC9Xzvakhepn0liX@nvidia.com>
X-Spam-Status: No, score=-8.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07.04.2023 01:37, Jason Gunthorpe wrote:
> On Mon, Feb 20, 2023 at 01:58:40PM +0000, Robin Murphy wrote:
>> On 2023-02-17 12:35, Jason Gunthorpe wrote:
>>> On Fri, Feb 17, 2023 at 12:08:42PM +0100, Marek Szyprowski wrote:
>>>> I'm sorry for a delay in replying, but I was busy with other stuff.
>>>>
>>>> On 23.01.2023 22:00, Jason Gunthorpe wrote:
>>>>> On Mon, Jan 23, 2023 at 10:31:01AM +0100, Marek Szyprowski wrote:
>>>>>> Add set_platform_dma_ops() required for proper driver operation on ARM
>>>>>> 32bit arch after recent changes in the IOMMU framework (detach ops
>>>>>> removal).
>>>>> Thanks for looking into this!
>>>>>
>>>>> Can you explain more about how this actually solves the problem in the
>>>>> commit message? I don't get it.
>>>> Exynos DRM driver calls arm_iommu_detach_device(), then
>>>> arm_iommu_attach_device() with a difrent 'mapping', see
>>>> drivers/gpu/drm/exynos/exynos_drm_dma.c Lack of set_platform_dma_ops
>>>> leads to a warning in iommu_group_do_set_platform_dma(). The other case
>>>> of calling arm_iommu_detach_device() is after unsuccessful probe of the
>>>> platform device.
>>> Why can't this just use the normal iommu path in all cases?
>>>
>>> It looks like it is trying to copy the DMA API domain from a parent
>>> device to a sub device.
>>>
>>> Even when using arm_iommu an iommu_domain is still present, so the
>>> copy code should work?
>> The ARM DMA domain is a regular unmanaged domain owned by the ARM DMA code -
>> in order to use any *other* domain, a user has to detach from that first
>> (wrapped up in arm_iommu_detach_device() which also swizzles the DMA ops at
>> the same time). Without set_platform_dma, that detach is now impossible
>> (because no IOMMU API default domain exists either).
> I was looking at this again, and for completeness, the reason it
> doesn't have a default_domain is a bit subtle.
>
> The driver does support IOMMU_DOMAIN_DMA, and it will go through all
> the iommu_group_alloc_default_domain() stuff with that..
>
> But... __iommu_domain_alloc() calls iommu_get_dma_cookie() which will
> be wired to fail on ARM32, so the core code nixes the IOMMU_DOMAIN_DMA
> after the driver successfully created it.
>
> I wonder if that is actually what we want? As it seems like it would
> be OK for ARM32 to have, effectively, a permanently empty unmanaged
> domain as the default_domain?
>
> If instead of failing due to iommu_get_dma_cookie() we set the type to
> UNMANAGED and make that the default domain it could fix all of this,
> even for all the other ARM32 drivers that haven't reported this yet?
>
> Alternatively since we taught these drivers to support IDENTITY, we
> should be able to remove the set_platform_dma_ops and instead
> implement for ARM32 def_domain_type fixed to return IDENTITY?

Maybe it would be easier to simply switch ARM32 to generic IOMMU-DMA layer?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

