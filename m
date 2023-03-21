Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 39BBE6C3612
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 21 Mar 2023 16:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbjCUPoT (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 21 Mar 2023 11:44:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbjCUPoI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Mar 2023 11:44:08 -0400
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E167413515
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Mar 2023 08:43:47 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20230321154344euoutp01988d345a2453ce44e2af3ffd17638685~OeZySQrhP2533925339euoutp01i
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Mar 2023 15:43:44 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20230321154344euoutp01988d345a2453ce44e2af3ffd17638685~OeZySQrhP2533925339euoutp01i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1679413424;
        bh=mRZAH6kiX776SYVooL0dn0TvpusqTKx0mKabd1erfKo=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=RZsLwag2tCiZil5CgBasSqhPQIw4HdyLF8EnTjx1z94ST7Ta4BiKGVvjwtqJn+mp2
         4TZFmQEapNE9fal+ugpDaMsksUdqqm91m4RmAkFBVhX44BYf+OBdbe8ez5z7nS1Xa9
         OKt75f+NKBx+dhCtEKa4bTsuZg/XCbmKk0rk+9kY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20230321154344eucas1p28be15207a53cee5cfc59cacf4b4a6094~OeZyCucYr2575225752eucas1p2n;
        Tue, 21 Mar 2023 15:43:44 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id C6.72.10014.0B0D9146; Tue, 21
        Mar 2023 15:43:44 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20230321154343eucas1p1706b0da35c8470e9c76fc1fbd46269ea~OeZxvWN9B2993229932eucas1p1Y;
        Tue, 21 Mar 2023 15:43:43 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20230321154343eusmtrp2d729fedd82d73e5b562d79ba6cbd0b8e~OeZxuyaqx0554005540eusmtrp29;
        Tue, 21 Mar 2023 15:43:43 +0000 (GMT)
X-AuditID: cbfec7f5-b8bff7000000271e-a1-6419d0b0b2c4
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id B8.E1.09583.FA0D9146; Tue, 21
        Mar 2023 15:43:43 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20230321154343eusmtip27e38852b023e06c6282d8b857b6c3f5a~OeZxOkFKt0268602686eusmtip2x;
        Tue, 21 Mar 2023 15:43:43 +0000 (GMT)
Message-ID: <da174ce4-b922-21d0-62da-b69798a51371@samsung.com>
Date:   Tue, 21 Mar 2023 16:43:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
        Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH v2] iommu/exynos: Fix set_platform_dma_ops() callback
Content-Language: en-US
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     iommu@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Lu Baolu <baolu.lu@linux.intel.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <ZBnCD7Xc9WCM55ub@ziepe.ca>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBKsWRmVeSWpSXmKPExsWy7djP87obLkimGDStZrV4MG8bm8XmiVvZ
        LH59sbCYOeMEo0Xn7A3sFntfb2W3mHF+H5PFwQ9PWC1a7pg6cHo8OTiPyWPNvDWMHptWdbJ5
        3Lm2h81j3slAjxebZzJ69G1ZxejxeZOcx9bPt1kCOKO4bFJSczLLUov07RK4Mtav+sZSMJ2r
        YskE6QbGvRxdjJwcEgImEpvbnrJ2MXJxCAmsYJR4+GchM4TzhVFi94djTCBVQgKfGSVO7q6A
        6Xi9dS5Ux3JGiVNTrrNAOB8ZJSY/7GYGqeIVsJOYsusNWDeLgKrEo9O3GSHighInZz5hAbFF
        BVIkJs7YAFYjLOApsfPYanYQm1lAXOLWk/lgcREBJYl9uyaygyxgFljFJPH3G0QDm4ChRNfb
        LjYQm1NAQ2LR42+sEM3yEtvfzmGGOLWdU+LtTxEI20Xi+IE1jBC2sMSr41vYIWwZif87QZZx
        gdQzSiz4fR/KmcAo0fD8FlSHtcSdc7+AtnEAbdCUWL9LHyLsKHH74XtmkLCEAJ/EjbeCEDfw
        SUzaNh0qzCvR0SYEUa0mMev4Ori1By9cYp7AqDQLKVhmIXl/FpJvZiHsXcDIsopRPLW0ODc9
        tdg4L7Vcrzgxt7g0L10vOT93EyMwcZ3+d/zrDsYVrz7qHWJk4mA8xCjBwawkwuvGLJEixJuS
        WFmVWpQfX1Sak1p8iFGag0VJnFfb9mSykEB6YklqdmpqQWoRTJaJg1OqgalmTpDCjZn2Siy/
        dQ/ulNku3e/7pa0kpPbopt9FPFJMZUbnI/zWF78Rd1g0U/hj4XPDhNjQjQJCtXN22E368Lz3
        IEMZa9t+djaj5+IzF0zZ/PBntaWOZcPNPFefC3ufyf18J3f30imjrdkJbE3qcyo3uRdenFNh
        vfPZ9ix75+IKi/a3V+dMurm9sVpgzdPbysuOL9duZntz/Ipy8eV9cSJnLk2YFN/951Dz0/fJ
        /+suP/Zc+kfw5nvOn2Fd7oz/W7Qfi8TILu/9uOGfQFHEHLbQJb9XPWn99LNLgtFG5E9QfUmO
        ztTlk+9wzfavm6Bs6XTmevnSC9sC7tk+5PV8268X4vZIKp3/UCBDTkHqleVKLMUZiYZazEXF
        iQB/udlZywMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrDIsWRmVeSWpSXmKPExsVy+t/xe7rrL0imGLzaq2fxYN42NovNE7ey
        Wfz6YmExc8YJRovO2RvYLfa+3spuMeP8PiaLgx+esFq03DF14PR4cnAek8eaeWsYPTat6mTz
        uHNtD5vHvJOBHi82z2T06NuyitHj8yY5j62fb7MEcEbp2RTll5akKmTkF5fYKkUbWhjpGVpa
        6BmZWOoZGpvHWhmZKunb2aSk5mSWpRbp2yXoZaxf9Y2lYDpXxZIJ0g2Mezm6GDk5JARMJF5v
        ncvaxcjFISSwlFFi/4+LrBAJGYmT0xqgbGGJP9e62CCK3jNKbDj5ngUkwStgJzFl1xsmEJtF
        QFXi0enbjBBxQYmTM5+A1YgKpEhMXHqZDcQWFvCU2HlsNTuIzSwgLnHryXywXhEBJYl9uyay
        gyxgFljFJDFteyfUto2MEm++zmcGqWITMJToetsFNolTQENi0eNvrBCTzCS6tnYxQtjyEtvf
        zmGewCg0C8khs5AsnIWkZRaSlgWMLKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzECo3XbsZ9b
        djCufPVR7xAjEwfjIUYJDmYlEV43ZokUId6UxMqq1KL8+KLSnNTiQ4ymwNCYyCwlmpwPTBd5
        JfGGZgamhiZmlgamlmbGSuK8ngUdiUIC6YklqdmpqQWpRTB9TBycUg1MoYfMfl5br3d728Ne
        nVe1Cn7b1J1eOkrqx0S66F82M3vLfOSD84RL/4JtgwKiozlDXB8X3r12vD3g4cvCz1+O3pBf
        n6jx+s+Kkh13i4rqU67fV9ynz6+75TlHdFlW2FlNxWMV/r1LmtaITP3t91KjMPK2cM+Fc3kX
        ZyeKq679MPuvdZlncAG7/byy3N8xt744vrFw0pO1NtQLey2mcjV50o2AnttFC13v/s54/edA
        +JXjSg48qRs0rgoEt/CsvNlv1xLKzCZ7zN/L7LGzuKXJjg9P/3Q4luttuKcjqSL0geWB4pS1
        eb87Jly8Pruw76No8TF+5Qvz4nb+c136/JA94yLTySdZqrx+drM/sbmvxFKckWioxVxUnAgA
        4Pb0ql8DAAA=
X-CMS-MailID: 20230321154343eucas1p1706b0da35c8470e9c76fc1fbd46269ea
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230315232523eucas1p2565ef5954e3b5b451803c6200c8bce32
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230315232523eucas1p2565ef5954e3b5b451803c6200c8bce32
References: <CGME20230315232523eucas1p2565ef5954e3b5b451803c6200c8bce32@eucas1p2.samsung.com>
        <20230315232514.1046589-1-m.szyprowski@samsung.com>
        <ZBnCD7Xc9WCM55ub@ziepe.ca>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On 21.03.2023 15:41, Jason Gunthorpe wrote:
> On Thu, Mar 16, 2023 at 12:25:14AM +0100, Marek Szyprowski wrote:
>> There are some subtle differences between release_device() and
>> set_platform_dma_ops() callbacks, so separate those two callbacks. Device
>> links should be removed only in release_device(), because they were
>> created in probe_device() on purpose and they are needed for proper
>> Exynos IOMMU driver operation. While fixing this, remove the conditional
>> code as it is not really needed.
>>
>> Reported-by: Jason Gunthorpe <jgg@ziepe.ca>
>> Fixes: 189d496b48b1 ("iommu/exynos: Add missing set_platform_dma_ops callback")
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>> v2:
>> - keep set_platform_dma_ops only on ARM 32bit
>>
>> Some more background why set_platform_dma_ops is needed on ARM 32bit is
>> available here:
>> https://lore.kernel.org/all/9a12fcac-c347-5d81-acef-1124c50d0c37@arm.com/
>> ---
>>   drivers/iommu/exynos-iommu.c | 17 ++++++++++-------
>>   1 file changed, 10 insertions(+), 7 deletions(-)
> It seems OK, but do you know what state the device is left in after
> exynos_iommu_detach_device ? Ie is it blocking or identity?

identity

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

