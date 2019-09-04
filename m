Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDDB5A88F7
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  4 Sep 2019 21:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729965AbfIDOol (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 4 Sep 2019 10:44:41 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:46381 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729398AbfIDOok (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 10:44:40 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190904144438euoutp02a0c4b44ca7d2c461b0fa0883d14ec0e7~BQ2x71frz1737417374euoutp02F
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Sep 2019 14:44:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190904144438euoutp02a0c4b44ca7d2c461b0fa0883d14ec0e7~BQ2x71frz1737417374euoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1567608278;
        bh=xFW0pD0IVF1fq32hen30DxPLqT7nHz8ecJLPgc4LyuA=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=bccDhwOZArS8R5NJpgBSpAaxcTibvFEKv/MtTh2CHunTRxLXEBonfb+bK67UNaAe4
         jjxYt1Oz49PtbIrDCcEk1rabLV90qcFI/S8yd9Zc4mr8RD10jb037813Q/C5Is2yvi
         9MyDWQNJGA9+Z4om/Tkz0IzZ4M/3O+7lYnktEt7s=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190904144437eucas1p2ef6b8307af36e1adc58bda35c554b7aa~BQ2xZRmWP1042310423eucas1p2S;
        Wed,  4 Sep 2019 14:44:37 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id FE.90.04469.5DDCF6D5; Wed,  4
        Sep 2019 15:44:37 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190904144437eucas1p2af4bcd05664a4fa03fd6ca9448e07d6d~BQ2wn66ND0683706837eucas1p2p;
        Wed,  4 Sep 2019 14:44:37 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190904144436eusmtrp2f0a3946b53bbad0fcabf5886cad219d1~BQ2wZ7neE2355123551eusmtrp24;
        Wed,  4 Sep 2019 14:44:36 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-b7-5d6fcdd5af31
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id AA.54.04166.4DDCF6D5; Wed,  4
        Sep 2019 15:44:36 +0100 (BST)
Received: from [106.120.50.63] (unknown [106.120.50.63]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190904144436eusmtip15594842e0f974846c332cd3f828383aa~BQ2wDcd381440814408eusmtip1V;
        Wed,  4 Sep 2019 14:44:36 +0000 (GMT)
Subject: Re: [PATCH] arm64: dts: exynos: Propagate address/size cell change
 to /memory node
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <dd8050e7-1dc4-8fbe-8717-9601740e2f70@samsung.com>
Date:   Wed, 4 Sep 2019 16:44:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <9b603476-ade2-d718-b0ba-ec69303405c1@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjleLIzCtJLcpLzFFi42LZduzned2rZ/NjDQ63q1o8mLeNzWLjjPWs
        FufPb2C3mHF+H5MDi8emVZ1sHn1bVjF6fN4kF8AcxWWTkpqTWZZapG+XwJWxfyJXwRqRioO9
        S9kaGK8JdDFycEgImEh83mPdxcjFISSwglFizpMVbBDOF0aJM882sEA4nxklrrxpAcpwgnX8
        XvmYHcQWEljOKLFgpiiE/ZZR4vY/MRBbWCBW4squb4wgtoiAj8Ttg+1MIDazQKJE05rpYDab
        gKFE19susJm8AnYSX95fZwWxWQRUJM71vQLrFRWIkdj5pocZokZQ4uTMJywgV3MK2Esc2ccC
        MVJeYvvbOcwQtrjErSfzmUBulhBoZpfofXwI6mYXid1LP7FD2MISr45vgbJlJP7vhGtglHh4
        bi07hNPDKHG5aQYjRJW1xOHjF1lBNjMLaEqs36UPEXaU+NrwlhUSjHwSN94KQhzBJzFp23Rm
        iDCvREebEES1msSs4+vg1h68cIl5AqPSLCSfzULyziwk78xC2LuAkWUVo3hqaXFuemqxYV5q
        uV5xYm5xaV66XnJ+7iZGYCo5/e/4px2MXy8lHWIU4GBU4uF9MDc/Vog1say4MvcQowQHs5II
        b+ienFgh3pTEyqrUovz4otKc1OJDjNIcLErivNUMD6KFBNITS1KzU1MLUotgskwcnFINjK0T
        pDNLts78qXHfOGPD2w0v18+zbjzduvfc6fTIQ9JPwnv+n4q87+X3835+WNr9uw2Bx+W+Nu3p
        T9Zcxeuso5Dq7l/+7HfDNB1eJVF/pkMX13CllLOkV/uU/Nh/28brV1aMaXHc85PvK86eO8oc
        xXsrrHGOIGNDhxL/2ysTqitYZmdcTJ/3TYmlOCPRUIu5qDgRACiGevshAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPIsWRmVeSWpSXmKPExsVy+t/xu7pXzubHGmy4r2/xYN42NouNM9az
        Wpw/v4HdYsb5fUwOLB6bVnWyefRtWcXo8XmTXABzlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWe
        kYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7G/olcBWtEKg72LmVrYLwm0MXIySEhYCLxe+Vj
        dhBbSGApo8Ti16oQcRmJk9MaWCFsYYk/17rYIGpeM0q8767rYuTgEBaIlbjz3RAkLCLgI3H7
        YDsTiM0skChxa8IkVojyY4wSLb+iQGw2AUOJrrcQY3gF7CS+vL8OVsMioCJxru8VI4gtKhAj
        se/MdnaIGkGJkzOfsICs4hSwlziyjwVivJnEvM0PmSFseYntb+dA2eISt57MZ5rAKDQLSfcs
        JC2zkLTMQtKygJFlFaNIamlxbnpusaFecWJucWleul5yfu4mRmDkbDv2c/MOxksbgw8xCnAw
        KvHwPpibHyvEmlhWXJl7iFGCg1lJhDd0T06sEG9KYmVValF+fFFpTmrxIUZToN8mMkuJJucD
        ozqvJN7Q1NDcwtLQ3Njc2MxCSZy3Q+BgjJBAemJJanZqakFqEUwfEwenVAOjUmzoTv7nwaX7
        En+K3L6Sd+uF2Nx//ItbtC7eXr7i2W8xO1vjic3G4r9DuGR77Kayc4WttVLrXPd+o04Sy825
        +dbZX47NbO57Efacz68rZd0+zrsLHy51DrVTWRLiYNptkef+0r09uHF+o/vLAl6GE+paAcyS
        E5c5x7KFMe9dH31++pkZV1mUWIozEg21mIuKEwFC0JkHsgIAAA==
X-CMS-MailID: 20190904144437eucas1p2af4bcd05664a4fa03fd6ca9448e07d6d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190904084834eucas1p20aff0f98a90b9c6939d9113932919aff
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190904084834eucas1p20aff0f98a90b9c6939d9113932919aff
References: <CGME20190904084834eucas1p20aff0f98a90b9c6939d9113932919aff@eucas1p2.samsung.com>
        <20190904084829.23944-1-m.szyprowski@samsung.com>
        <9b603476-ade2-d718-b0ba-ec69303405c1@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Alim,

On 2019-09-04 16:06, Alim Akhtar wrote:
> Thanks Marek,
> This fixes the booting issue on exyno7-espresso board.
> Probably this should be CCed to -stable.

The patch has 'Fixes' tag, so it will be automatically selected for all 
stable kernels, which includes the mentioned commit.

> On 9/4/19 2:18 PM, Marek Szyprowski wrote:
>> Commit ef72171b3621 ("arm64: dts: exynos: Remove unneeded address space
>> mapping for soc node") changed the address and size cells in root node from
>> 2 to 1, but /memory nodes for the affected boards were not updated. This
>> went unnoticed on Exynos5433-based TM2(e) boards, because they use u-boot,
>> which updates /memory node to the correct values. On the other hand, the
> Yes, we don't use u-boot on this board.
>> mentioned commit broke boot on Exynos7-based Espresso board, which
>> bootloader doesn't touch /memory node at all.
>>
>> Reported-by: Alim Akhtar <alim.akhtar@samsung.com>
>> Fixes: ef72171b3621 ("arm64: dts: exynos: Remove unneeded address space mapping for soc node")
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Feel free to add,
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
>
> This make exynos7 board boot again so,
> Tested-by: Alim Akhtar <alim.akhtar@samsung.com>
>
>> ---
>>    arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 2 +-
>>    arch/arm64/boot/dts/exynos/exynos7-espresso.dts       | 2 +-
>>    2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
>> index db22eb56e968..e6321c8567de 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
>> @@ -50,7 +50,7 @@
>>    
>>    	memory@20000000 {
>>    		device_type = "memory";
>> -		reg = <0x0 0x20000000 0x0 0xc0000000>;
>> +		reg = <0x20000000 0xc0000000>;
>>    	};
>>    
>>    	gpio-keys {
>> diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
>> index 080e0f56e108..28b02830225f 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
>> +++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
>> @@ -28,7 +28,7 @@
>>    
>>    	memory@40000000 {
>>    		device_type = "memory";
>> -		reg = <0x0 0x40000000 0x0 0xC0000000>;
>> +		reg = <0x40000000 0xC0000000>;
>>    	};
>>    
>>    	usb30_vbus_reg: regulator-usb30 {
>>
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

