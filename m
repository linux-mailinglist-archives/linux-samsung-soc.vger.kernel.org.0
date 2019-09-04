Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C463A88CC
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  4 Sep 2019 21:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730815AbfIDO3B (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 4 Sep 2019 10:29:01 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:50205 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729809AbfIDO3B (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 10:29:01 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
        by mailout1.samsung.com (KnoxPortal) with ESMTP id 20190904142858epoutp01cb90ed8d9f5787d3464e8c808bbfcada~BQpGg9i-R1363513635epoutp01Y
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Sep 2019 14:28:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20190904142858epoutp01cb90ed8d9f5787d3464e8c808bbfcada~BQpGg9i-R1363513635epoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1567607338;
        bh=xRomkaPpUgj5vPwHpPWoO/02FeRcSbAAmlJvtn3noqw=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=avN9qpTbrIQDw0aI0qqrZjhLLx9XUzUntnfxwlkqkpB10MhZsWRKTvutDPXhC7EVd
         2N5PeSCTeUMb1foxkaRoLbtERiQiR8gepDqKoGP3h+VQxl67rx4zpVNsbQ0M7Curiq
         hUHK0LmEEK3mcwCa+aOx7u1o28SeatOF6ShE6hFk=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTP id
        20190904142858epcas5p3e2c360eb63ec0fae72a5ec2e58c016cf~BQpGN95lF1276512765epcas5p3f;
        Wed,  4 Sep 2019 14:28:58 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
        epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        A2.4A.04429.A2ACF6D5; Wed,  4 Sep 2019 23:28:58 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
        20190904142857epcas5p4ae5ed7ccd065d6d72820e7fe9fea4a5b~BQpF4t55F2414524145epcas5p4L;
        Wed,  4 Sep 2019 14:28:57 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190904142857epsmtrp1957f753f987d301e4fdf420e4fb5b8a5~BQpF4Aa8F1926819268epsmtrp1R;
        Wed,  4 Sep 2019 14:28:57 +0000 (GMT)
X-AuditID: b6c32a4a-63dff7000000114d-ab-5d6fca2a4a68
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        1A.77.03706.92ACF6D5; Wed,  4 Sep 2019 23:28:57 +0900 (KST)
Received: from [107.108.73.28] (unknown [107.108.73.28]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190904142857epsmtip2bc61d62a39e37db74740fe885753ba51~BQpFK8sPE2818628186epsmtip2F;
        Wed,  4 Sep 2019 14:28:56 +0000 (GMT)
Subject: Re: [PATCH] arm64: dts: exynos: Propagate address/size cell change
 to /memory node
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Alim Akhtar <alim.akhtar@samsung.com>
Message-ID: <9b603476-ade2-d718-b0ba-ec69303405c1@samsung.com>
Date:   Wed, 4 Sep 2019 19:36:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904084829.23944-1-m.szyprowski@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprMKsWRmVeSWpSXmKPExsWy7bCmuq7WqfxYgzM7OSw2zljPanH+/AZ2
        ixnn9zFZrD1yl92BxWPTqk42j74tqxg9Pm+SC2CO4rJJSc3JLEst0rdL4Mr4dvYhY8FdwYpl
        T5+yNzBe4eti5OSQEDCRuN+6j62LkYtDSGA3o8ScZ+8ZIZxPjBJXv16FynxjlGjcPYEZpqVr
        yismiMReRon3i5ezgiSEBN4ySnQ3lIPYwgKxEld2fWMEsUUEQiTuP30BVsMskCjRtGY6E4jN
        JqAtcXf6FjCbV8BO4mzTejYQm0VAReLf41VgcVGBCIlPDw6zQtQISpyc+YQFxOYEqj/UsJId
        Yqa4xK0n85kgbHmJ7W/nMIMcJyGwh03i5crZTBBXu0jsmTqLEcIWlnh1fAs7hC0l8bK/Dcjm
        ALKzJXp2GUOEaySWzjvGAmHbSxy4MocFpIRZQFNi/S59iFV8Er2/nzBBdPJKdLQJQVSrSjS/
        uwrVKS0xsbubFcL2kGibfxEabBMZJZpOHmOZwKgwC8lns5B8MwvJN7MQNi9gZFnFKJlaUJyb
        nlpsWmCUl1quV5yYW1yal66XnJ+7iRGcVLS8djAuO+dziFGAg1GJh/fB3PxYIdbEsuLK3EOM
        EhzMSiK8oXtyYoV4UxIrq1KL8uOLSnNSiw8xSnOwKInzTmK9GiMkkJ5YkpqdmlqQWgSTZeLg
        lGpgXLZjttt3my0JEc+fzp13vrSXv/zTCb83igWT0/g6Vd98PCpw5Wrxux8fLKbWndzBZTf/
        R9tGU+0kBfPr10/znDd2c2CLVLo04eSrSVvNLxv+fsjCOP0Al+eihMJueUs/nvfs2el/bA53
        3rmZwN/ZNTfHzScx3pC59af3p/XzHFiW9V69rpHPocRSnJFoqMVcVJwIAAnrBvEmAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsWy7bCSvK7mqfxYg3ldhhYbZ6xntTh/fgO7
        xYzz+5gs1h65y+7A4rFpVSebR9+WVYwenzfJBTBHcdmkpOZklqUW6dslcGV8O/uQseCuYMWy
        p0/ZGxiv8HUxcnJICJhIdE15xdTFyMUhJLCbUeLz80XsEAlpiesbJ0DZwhIr/z1nhyh6zShx
        d9VX1i5GDg5hgViJO98NQUwRgRCJhe/1QMqZBRIlbk2YxApRPpFR4takgywgCTYBbYm707cw
        gdi8AnYSZ5vWs4HYLAIqEv8erwKLiwpESBzeMYsRokZQ4uTMJ2C9nED1hxpWskMsMJOYt/kh
        M4QtLnHryXwmCFteYvvbOcwTGIVmIWmfhaRlFpKWWUhaFjCyrGKUTC0ozk3PLTYsMMxLLdcr
        TswtLs1L10vOz93ECI4BLc0djJeXxB9iFOBgVOLhfTA3P1aINbGsuDL3EKMEB7OSCG/onpxY
        Id6UxMqq1KL8+KLSnNTiQ4zSHCxK4rxP845FCgmkJ5akZqemFqQWwWSZODilGhiX3ohiDZIo
        +Za58kSS7LOTuSKX+ucK7iyOct0TcWT2t9IZ8cIuSg8XlTRWv/LYapyx1GehbIHdfa/Ps6pv
        FX8vvc2bdN/gkmfHjUDHQrYHLzV4ZPRvXzj4/VyNa4XQC1GmlIOzXu62eeJiuJf/TMVR9yfV
        X9U8plk/iNi4WKRO/P71SwLRf3yVWIozEg21mIuKEwEpPkBafQIAAA==
X-CMS-MailID: 20190904142857epcas5p4ae5ed7ccd065d6d72820e7fe9fea4a5b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20190904084834eucas1p20aff0f98a90b9c6939d9113932919aff
References: <CGME20190904084834eucas1p20aff0f98a90b9c6939d9113932919aff@eucas1p2.samsung.com>
        <20190904084829.23944-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Thanks Marek,
This fixes the booting issue on exyno7-espresso board.
Probably this should be CCed to -stable.

On 9/4/19 2:18 PM, Marek Szyprowski wrote:
> Commit ef72171b3621 ("arm64: dts: exynos: Remove unneeded address space
> mapping for soc node") changed the address and size cells in root node from
> 2 to 1, but /memory nodes for the affected boards were not updated. This
> went unnoticed on Exynos5433-based TM2(e) boards, because they use u-boot,
> which updates /memory node to the correct values. On the other hand, the
Yes, we don't use u-boot on this board.
> mentioned commit broke boot on Exynos7-based Espresso board, which
> bootloader doesn't touch /memory node at all.
> 
> Reported-by: Alim Akhtar <alim.akhtar@samsung.com>
> Fixes: ef72171b3621 ("arm64: dts: exynos: Remove unneeded address space mapping for soc node")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Feel free to add,
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

This make exynos7 board boot again so,
Tested-by: Alim Akhtar <alim.akhtar@samsung.com>

> ---
>   arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 2 +-
>   arch/arm64/boot/dts/exynos/exynos7-espresso.dts       | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> index db22eb56e968..e6321c8567de 100644
> --- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
> @@ -50,7 +50,7 @@
>   
>   	memory@20000000 {
>   		device_type = "memory";
> -		reg = <0x0 0x20000000 0x0 0xc0000000>;
> +		reg = <0x20000000 0xc0000000>;
>   	};
>   
>   	gpio-keys {
> diff --git a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
> index 080e0f56e108..28b02830225f 100644
> --- a/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
> +++ b/arch/arm64/boot/dts/exynos/exynos7-espresso.dts
> @@ -28,7 +28,7 @@
>   
>   	memory@40000000 {
>   		device_type = "memory";
> -		reg = <0x0 0x40000000 0x0 0xC0000000>;
> +		reg = <0x40000000 0xC0000000>;
>   	};
>   
>   	usb30_vbus_reg: regulator-usb30 {
> 
