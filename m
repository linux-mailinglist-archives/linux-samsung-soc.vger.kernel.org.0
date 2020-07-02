Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AF55211D53
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  2 Jul 2020 09:48:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728206AbgGBHsb (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 2 Jul 2020 03:48:31 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:34037 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728209AbgGBHs2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jul 2020 03:48:28 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200702074826euoutp0134fc0ea20a692fa7099ffd69e66b74db~d3-mlotJx2649326493euoutp01N
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jul 2020 07:48:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200702074826euoutp0134fc0ea20a692fa7099ffd69e66b74db~d3-mlotJx2649326493euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1593676106;
        bh=7YNN+9wShxeLt7CQ8t/PBpHhBfC5AdB9p0g33Egi1Xw=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=t2jT/Z097GlqnKV2yR8THlY2mbQsRyU/gpdvEaEDNXo8XgDkpLLpkxfnFWgwsO6IL
         rViWvZ6GrFkuZdEPKYnAcesvwq86FmGVkYjVCnwciQLQiB8GqboDwKjH4WfCVs7drL
         sd7/GEnnCbqjjxlAPg5YP5u2V4c67gQs7SeIbMlk=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200702074826eucas1p2bc51d4ea26094f6975b6132be0c06ede~d3-mTmFBh1699716997eucas1p2x;
        Thu,  2 Jul 2020 07:48:26 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id D7.29.06318.A419DFE5; Thu,  2
        Jul 2020 08:48:26 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200702074825eucas1p2791360695d10b4b3bd93046b42a7c0ec~d3-l6TOm11914919149eucas1p2r;
        Thu,  2 Jul 2020 07:48:25 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200702074825eusmtrp2eeb230027eabaa274d49d234abcbf527~d3-l5Y9mI0980709807eusmtrp2H;
        Thu,  2 Jul 2020 07:48:25 +0000 (GMT)
X-AuditID: cbfec7f5-371ff700000018ae-e0-5efd914a9ac5
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 51.1B.06017.9419DFE5; Thu,  2
        Jul 2020 08:48:25 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200702074825eusmtip13d90dba610361392a6aa8d5d1724dae5~d3-lOUFuN1440914409eusmtip1N;
        Thu,  2 Jul 2020 07:48:24 +0000 (GMT)
Subject: Re: [PATCH v2] ARM: dts: exynos: Fix missing empty reg/ranges
 property regulators on Trats
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Pankaj Dubey <pankaj.dubey@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <757ee654-e087-d660-2a9c-801743e83567@samsung.com>
Date:   Thu, 2 Jul 2020 09:48:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200702073913.GA1187@kozik-lap>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPKsWRmVeSWpSXmKPExsWy7djPc7peE//GGTx9zWzxYN42NouNM9az
        Wlz/8pzVYv6Rc6wW/Y+BEufPb2C32PT4GqvF5V1z2CxmnN/HZLFo6xd2i9a9R9gt2p++ZHbg
        8di0qpPNY/OSeo++LasYPT5vkgtgieKySUnNySxLLdK3S+DKmHXpAlPBZt6K9UsfsTYwLuPu
        YuTkkBAwkVi4aDtTFyMXh5DACkaJy0eeM0I4Xxglzp7fxgLhfGaUeHq2kxWupW8uVMtyRonP
        59ezQjjvGSVuHN/JAlIlLJAqca1pLTOILSKgKXH973ewbmaBlcwSr3dagthsAoYSXW+72EBs
        XgE7ib1/DjCC2CwCKhLvm0+BzREViJNY/xLkQJAaQYmTM5+AxTkF9CT6Nr6Amikvsf3tHGYI
        W1zi1pP5YNdJCFxil9jXcYMd4mwXiekTZ7NB2MISr45vgYrLSPzfCdPQzCjx8NxadginBxgc
        TTMYIaqsJe6c+wXUzQG0QlNi/S59iLCjxJ2Jv9hBwhICfBI33gpCHMEnMWnbdGaIMK9ER5sQ
        RLWaxKzj6+DWHrxwiXkCo9IsJK/NQvLOLCTvzELYu4CRZRWjeGppcW56arFxXmq5XnFibnFp
        Xrpecn7uJkZgsjr97/jXHYz7/iQdYhTgYFTi4c2o+BMnxJpYVlyZe4hRgoNZSYTX6ezpOCHe
        lMTKqtSi/Pii0pzU4kOM0hwsSuK8xotexgoJpCeWpGanphakFsFkmTg4pRoYw9Iv6oVUO2py
        8drks1u0yK++yGJYxXhs1fWrS9arfe/eq77thaOZWuWJtPQtlb12+jadBzpURSpnpPfpRJ3d
        6ZJxr2TF92oVFuGKkJkWE777nHJxVzOpXqm0fHvUYTvBxV90e9dKX2jZskF58R1HXXeg495P
        Y0tf18jArll3ZgrXYUXuKCWW4oxEQy3mouJEABzL3vZSAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRmVeSWpSXmKPExsVy+t/xu7qeE//GGfyZpGXxYN42NouNM9az
        Wlz/8pzVYv6Rc6wW/Y9fM1ucP7+B3WLT42usFpd3zWGzmHF+H5PFoq1f2C1a9x5ht2h/+pLZ
        gcdj06pONo/NS+o9+rasYvT4vEkugCVKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng8
        1srIVEnfziYlNSezLLVI3y5BL2PWpQtMBZt5K9YvfcTawLiMu4uRk0NCwERiYd9cpi5GLg4h
        gaWMEsunzGKHSMhInJzWwAphC0v8udbFBlH0llHiw9PXzCAJYYFUiWtNa8FsEQFNiet/v7OC
        FDELrGSWeP2llRGio5lJ4v36y0wgVWwChhJdb0FGcXLwCthJ7P1zgBHEZhFQkXjffIoFxBYV
        iJNYvmU+O0SNoMTJmU/A4pwCehJ9G1+AncQsYCYxb/NDZghbXmL72zlQtrjErSfzmSYwCs1C
        0j4LScssJC2zkLQsYGRZxSiSWlqcm55bbKRXnJhbXJqXrpecn7uJERif24793LKDsetd8CFG
        AQ5GJR7ejIo/cUKsiWXFlbmHGCU4mJVEeJ3Ono4T4k1JrKxKLcqPLyrNSS0+xGgK9NxEZinR
        5Hxg6sgriTc0NTS3sDQ0NzY3NrNQEuftEDgYIySQnliSmp2aWpBaBNPHxMEp1cC4tUNmmd3K
        7Zwf+brYDP9M3mXY/LlJu3iWe2y56fK5mSpbNIufnOLReyHpOO/StGmGc04+PcRw+PiCZe+z
        u4JWPo1TZfr2Na1iWbcK05Q+LRvl4uBK6U/zF5x4c+NWi3lJocw1qxVff5s15n50ZTopt2Hl
        ysa96p9Wd+g6xfk/SfivyCnitX+hEktxRqKhFnNRcSIAeG6IKuUCAAA=
X-CMS-MailID: 20200702074825eucas1p2791360695d10b4b3bd93046b42a7c0ec
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200629210025eucas1p219a52e75ecce9e813aa80f0126780189
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200629210025eucas1p219a52e75ecce9e813aa80f0126780189
References: <CGME20200629210025eucas1p219a52e75ecce9e813aa80f0126780189@eucas1p2.samsung.com>
        <20200629205948.32250-1-krzk@kernel.org>
        <97651868-30f3-6b91-1ea2-551ee1ebad8f@samsung.com>
        <20200702061611.GC4175@kozik-lap> <20200702073913.GA1187@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02.07.2020 09:39, Krzysztof Kozlowski wrote:
> On Thu, Jul 02, 2020 at 08:16:11AM +0200, Krzysztof Kozlowski wrote:
>> On Tue, Jun 30, 2020 at 08:27:01AM +0200, Marek Szyprowski wrote:
>>> On 29.06.2020 22:59, Krzysztof Kozlowski wrote:
>>>> Remove the regulators node entirely because its children do not have any
>>>> unit addresses.  This fixes DTC warning:
>>>>
>>>>       Warning (simple_bus_reg): /regulators/regulator-0: missing or empty reg/ranges property
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>>> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>
>>> What about removing the regulators node from other boards:
>>> exynos4412-origen.dts, exynos5420-smdk5420.dts and exynos5250-arndale.dts?
>>>
>>> On the other hand, maybe it would be really easier to add missing
>>> address/size-cells properties to exynos4210-trats.dts/regulators node?
>> Indeed let's keep it consistent so in such case better to add here
>> proper address/size-cells.
> Actually more of DTSes put fixed regulators directly in root node, not
> under "regulators" node:
> exynos3250-monk.dts
> exynos4210-i9100.dts
> exynos4210-origen.dts
> exynos4210-universal_c210.dts
> exynos4412-galaxy-s3.dtsi
> exynos4412-midas.dtsi
> exynos4412-n710x.dts
> exynos4412-odroidx.dts
> exynos5250-smdk5250.dts
> exynos5250-snow-common.dtsi
> exynos5420-peach-pit.dts
> exynos5800-peach-pi.dts
>
> If we want it to be consistent, it's easier to remove the regulator
> nodes from exynos4412-origen.dts, exynos5420-smdk5420.dts and
> exynos5250-arndale.dts.

Feel free, I'm fine with both approaches.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

