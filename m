Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E462BBDE32
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 25 Sep 2019 14:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732221AbfIYMlr (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 25 Sep 2019 08:41:47 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:48345 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726369AbfIYMlq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Sep 2019 08:41:46 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190925124143euoutp0270c667e7fba789f868f343595d325e10~HrudgASZR2732327323euoutp02A
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Sep 2019 12:41:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190925124143euoutp0270c667e7fba789f868f343595d325e10~HrudgASZR2732327323euoutp02A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1569415303;
        bh=4U78RD50QZEeG1MMLbxGJQNX4+k9PVtfzy/6bph6Xd8=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Li58G7uvP4YmGXv9zcCQ4UO+a1u9iO/Fbaec007THoSt7QO41zB+ea8Ra3xyVFXRT
         e8tPBo/Mya163FsDqqWt/bYG6MQ/AnhAzvnxSCDv1Kt7L3aYR590FlDqw5eSUX1VdX
         tFessYSxqOJZzM5qZ0bcqDXWsbSWjbM3KvlnweDY=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190925124143eucas1p223f7e6d383a9dda0d97306ce8f4bf247~HrudF3Be-2057720577eucas1p2v;
        Wed, 25 Sep 2019 12:41:43 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 17.1F.04469.7806B8D5; Wed, 25
        Sep 2019 13:41:43 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190925124142eucas1p2b20967424f725e0c3fc950b71b7965ff~HrucmdJyR1857318573eucas1p21;
        Wed, 25 Sep 2019 12:41:42 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190925124142eusmtrp1c68c5a82f5e0b268e2a6190a6187e45a~Hrucltq4z0900609006eusmtrp1n;
        Wed, 25 Sep 2019 12:41:42 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-83-5d8b6087c74e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 17.9E.04117.6806B8D5; Wed, 25
        Sep 2019 13:41:42 +0100 (BST)
Received: from [106.120.51.95] (unknown [106.120.51.95]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190925124142eusmtip27dd1f813b1166fba8847b600f0396a65~HrucVxsY41315313153eusmtip2N;
        Wed, 25 Sep 2019 12:41:42 +0000 (GMT)
Subject: Re: [PATCH] ARM: dts: exynos: Add missing clock-cells property to
 Exynos3250 i2s node
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
From:   Maciej Falkowski <m.falkowski@samsung.com>
Message-ID: <0f9576d4-3cfd-2154-e5f3-5046d09283a2@samsung.com>
Date:   Wed, 25 Sep 2019 14:41:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924115810.GA9218@pi3>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphleLIzCtJLcpLzFFi42LZduznOd32hO5Yg10fxS3On9/AbjHj/D4m
        i7VH7rJbHH7TzurA4rFpVSebR9+WVYwenzfJBTBHcdmkpOZklqUW6dslcGXsPv+DqWARb8W0
        q+uZGhjvcHUxcnJICJhITHy0gL2LkYtDSGAFo8SU6RNZIZwvjBJP381ggXA+M0rcP/+RBaal
        6ctyqMRyRomOB/+g+t8yShw4/w6sSlggQWL20ddAszg4RAQiJLavZAcxmQVCJB58DACpYBMw
        kOh/sxesmlfATuL+9g8sICUsAqoSjbMMQcKiQI2fHhxmhSgRlDg58wlYOaeAhsS1czuZQGxm
        AXmJ7W/nMEPY4hK3nsxngjiznV1i37d8CNtF4tDcT1DnC0u8Or6FHcKWkTg9uQdsrYRAtcS1
        b7Igj0gItDBKXJ/2lg2ixlriz6qJbBDXa0qs36UPEXaUuHDmEhNEK5/EjbeCEBfwSUzaNp0Z
        Iswr0dEmBGGqSryZEAvRKC3RumY/4wRGpVlI3pqF5JVZSF6ZhbB2ASPLKkbx1NLi3PTUYsO8
        1HK94sTc4tK8dL3k/NxNjMA0cvrf8U87GL9eSjrEKMDBqMTDeyCsO1aINbGsuDL3EKMEB7OS
        CO8sma5YId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzVDA+ihQTSE0tSs1NTC1KLYLJMHJxSDYxF
        h35tefvtLf9png6J3SdlE67HVTud33T+05uIBYZRtp0+N5ZWv1SIbd9y6tO8hFAltySXvQ/k
        gpdsz7nW6CUXY+m9aeuxhfHrbvspHPUvSs3et0Bvk+G+gEvv1Xd6m6syJ8+5+6WeZfll07sx
        3VzsfayHq3TrrhxM7hepN/Mz4XgzxX2S9xslluKMREMt5qLiRAAr3/qlHwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRmVeSWpSXmKPExsVy+t/xe7ptCd2xBm0bLS3On9/AbjHj/D4m
        i7VH7rJbHH7TzurA4rFpVSebR9+WVYwenzfJBTBH6dkU5ZeWpCpk5BeX2CpFG1oY6RlaWugZ
        mVjqGRqbx1oZmSrp29mkpOZklqUW6dsl6GXsPv+DqWARb8W0q+uZGhjvcHUxcnJICJhINH1Z
        ztLFyMUhJLCUUeL/61WsEAlpif3XPrJD2MISf651sUEUvWaUmLLuBRNIQlggQWL20ddgDSIC
        ERKv79xjAbGZBUIknv94ywTRsJZR4t/mt2CT2AQMJPrf7AUr4hWwk7i//QOQzcHBIqAq0TjL
        ECQsCjTn8I5ZjBAlghInZz4BK+cU0JC4dm4nE8R8M4l5mx8yQ9jyEtvfzoGyxSVuPZnPNIFR
        aBaS9llIWmYhaZmFpGUBI8sqRpHU0uLc9NxiI73ixNzi0rx0veT83E2MwBjaduznlh2MXe+C
        DzEKcDAq8fBKRHbHCrEmlhVX5h5ilOBgVhLhnSXTFSvEm5JYWZValB9fVJqTWnyI0RTot4nM
        UqLJ+cD4ziuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fEwSnVwKgcEKYW
        e2CHnOxnNcfllguyzro6Zp8uEfBTLTykeijHZ9q7peE3C5dqf9sqL9a7MDmmkS2lzCEtwnG/
        hf2EWVrO/TkvAzbKGsVdfLB6W9FE1S/ZzDUXFgkZdDr2L51caq91+FeczC5etQNln/Ym7m5f
        41viPWOW3I+sEm8P4edLnlbKzVtxSomlOCPRUIu5qDgRAMW/feO3AgAA
X-CMS-MailID: 20190925124142eucas1p2b20967424f725e0c3fc950b71b7965ff
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190924115258eucas1p2d7dbc9fbfbcd5809a74ffeb71a703a8f
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190924115258eucas1p2d7dbc9fbfbcd5809a74ffeb71a703a8f
References: <CGME20190924115258eucas1p2d7dbc9fbfbcd5809a74ffeb71a703a8f@eucas1p2.samsung.com>
        <20190924115243.25702-1-m.szyprowski@samsung.com>
        <20190924115810.GA9218@pi3>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On 9/24/19 1:58 PM, Krzysztof Kozlowski wrote:
> On Tue, Sep 24, 2019 at 01:52:43PM +0200, Marek Szyprowski wrote:
>> From: Maciej Falkowski <m.falkowski@samsung.com>
>>
>> '#clock-cells' is a required property for clocks provider, missing
>> may cause compilation errors.
> This needs to be explained better. What compilation errors did you see
> (or expect)? As of now, there is no clock consumer for i2s clocks.
>
> After adding clock-cells, the driver will register/provide its clocks,
> so you add quite visible change without mentioning the effects in change
> log.
>
> Best regards,
> Krzysztof

Hi Krzysztof,

I wrongly interpreted that #clock-cells property is required and in
result it may cause schema compilation errors if this property would be 
required there.
As it is optional and here unintended, the patch does not make any sense.

Best regards,
Maciej Falkowski

>> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos3250.dtsi | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
>> index 190d9160a5d1..bf32e00334ce 100644
>> --- a/arch/arm/boot/dts/exynos3250.dtsi
>> +++ b/arch/arm/boot/dts/exynos3250.dtsi
>> @@ -687,6 +687,7 @@
>>   			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
>>   			clocks = <&cmu CLK_I2S>, <&cmu CLK_SCLK_I2S>;
>>   			clock-names = "iis", "i2s_opclk0";
>> +			#clock-cells = <1>;
>>   			dmas = <&pdma0 14>, <&pdma0 13>;
>>   			dma-names = "tx", "rx";
>>   			pinctrl-0 = <&i2s2_bus>;
>> -- 
>> 2.17.1
>>
>>
>>
>
