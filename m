Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD217D8A7
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  1 Aug 2019 11:35:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730124AbfHAJfb (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 1 Aug 2019 05:35:31 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44577 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731108AbfHAJfa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Aug 2019 05:35:30 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190801093528euoutp0246b23d45b99674cfc638ed2351600afe~2wtIV6-362503025030euoutp02j
        for <linux-samsung-soc@vger.kernel.org>; Thu,  1 Aug 2019 09:35:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190801093528euoutp0246b23d45b99674cfc638ed2351600afe~2wtIV6-362503025030euoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1564652128;
        bh=RKunZW1C5654FgdB6b1mF8dzk3TsRTEctDE71V+AoJ8=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=VztD+DFX9bhabWe64vokAoNcxm2wja3rtEqzvGAMZlMZdX66+myJpkeY4x0Dwcmoh
         Elj8aU4XLiXwZD4Ca/6ByIJcUigjTbjkcWRVcj82rbFabwwrJecIv8hBQjm5kl0xvo
         yU4UPMJg+BBOfxX9ZqRcRPwOWpIAV6mzRocoZKt0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190801093527eucas1p29d749aa6f0cdec657f54f74bbc552a2e~2wtH9FzOt2370023700eucas1p2r;
        Thu,  1 Aug 2019 09:35:27 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id A4.3F.04325.F52B24D5; Thu,  1
        Aug 2019 10:35:27 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190801093526eucas1p15f66af6e216dadfc81bf72c2a1711435~2wtG_fMDl1260012600eucas1p1N;
        Thu,  1 Aug 2019 09:35:26 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190801093526eusmtrp115fdc41dfec4a020448c94f873654ae0~2wtGwWmOt1951119511eusmtrp12;
        Thu,  1 Aug 2019 09:35:26 +0000 (GMT)
X-AuditID: cbfec7f5-b8fff700000010e5-35-5d42b25f6563
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 06.08.04146.E52B24D5; Thu,  1
        Aug 2019 10:35:26 +0100 (BST)
Received: from [106.120.50.63] (unknown [106.120.50.63]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190801093526eusmtip2504fbe53fbb76231ced6133f10866950~2wtGa3CFx1153011530eusmtip2j;
        Thu,  1 Aug 2019 09:35:26 +0000 (GMT)
Subject: Re: [PATCH V2 1/2] arm: dts: exynos: Add GPU/Mali T604 node to
 exynos5250
To:     Guillaume Gardet <Guillaume.Gardet@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <79a50bdd-17ba-4e2f-5389-4b39ed440685@samsung.com>
Date:   Thu, 1 Aug 2019 11:35:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <DBBPR08MB4678D2A9A042269A8934E84183DF0@DBBPR08MB4678.eurprd08.prod.outlook.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBKsWRmVeSWpSXmKPExsWy7djPc7rxm5xiDbofillsPLSP3aL/8Wtm
        i/PnN7BbbHp8jdVixvl9TA6sHmvmrWH02LSqk81j85J6j8+b5AJYorhsUlJzMstSi/TtErgy
        Vj26xlawi7/iW/t+5gbGx9xdjJwcEgImEtee3GTsYuTiEBJYwSjR0POTFSQhJPCFUWL7mhSI
        xGdGiba9fUwwHXu725khEssZJX4d2MsG4bxllJh0dz1LFyMHh7BAiMTE1zIgpohAhERTuz1I
        CbPAXkaJ3m9zGEEGsQkYSnS97WIDsXkF7CRWvb0CFmcRUJHo37YO7ApRgRiJnW96mCFqBCVO
        znzCAmJzCsRKPFxzDsxmFpCX2P52DjOELS5x68l8qEPnsUt8WVsGYbtINPYcZIewhSVeHd8C
        ZctInJ7cwwJynIRAM6PEw3Nr2SGcHkaJy00zGCGqrCUOH7/ICvINs4CmxPpd+iCmhICjxPr5
        iRAmn8SNt4IQJ/BJTNo2nRkizCvR0SYEMUNNYtbxdXBbD164xDyBUWkWksdmIXlmFpJnZiGs
        XcDIsopRPLW0ODc9tdg4L7Vcrzgxt7g0L10vOT93EyMwvZz+d/zrDsZ9f5IOMQpwMCrx8J7o
        dIwVYk0sK67MPcQowcGsJMK7WNw+Vog3JbGyKrUoP76oNCe1+BCjNAeLkjhvNcODaCGB9MSS
        1OzU1ILUIpgsEwenVAOjwdrpfHb3HH2uf7T1O+gRUNXawHFceJma7+uEeQJbtfu2BId2vTx1
        ct/8vo2sUszTGXxE1e119DT78uQ3GS7r8TtqNoU37nq6rutWhzPT7+xvOb/qWRSXv63MvTdl
        n/709N6z3GUfuvr2zS8NnVvYp7rlFf4z8EjWj1PPepmmusTmf+oj3c9KLMUZiYZazEXFiQBR
        nxylKwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRmVeSWpSXmKPExsVy+t/xe7pxm5xiDTq2iVpsPLSP3aL/8Wtm
        i/PnN7BbbHp8jdVixvl9TA6sHmvmrWH02LSqk81j85J6j8+b5AJYovRsivJLS1IVMvKLS2yV
        og0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyVj26xlawi7/iW/t+5gbGx9xd
        jJwcEgImEnu725m7GLk4hASWMkr03VvADJGQkTg5rYEVwhaW+HOtiw2i6DWjxJcNb4EcDg5h
        gRCJia9lQGpEBCIkTi5uZQWpYRbYyyhxZNJTRoiGiawSE99tZgSpYhMwlOh6CzKJk4NXwE5i
        1dsrYHEWARWJ/m3rwLaJCsRI7DuznR2iRlDi5MwnLCA2p0CsxMM158BsZgEziXmbHzJD2PIS
        29/OgbLFJW49mc80gVFoFpL2WUhaZiFpmYWkZQEjyypGkdTS4tz03GJDveLE3OLSvHS95Pzc
        TYzAuNp27OfmHYyXNgYfYhTgYFTi4T3R6RgrxJpYVlyZe4hRgoNZSYR3sbh9rBBvSmJlVWpR
        fnxRaU5q8SFGU6DnJjJLiSbnA2M+ryTe0NTQ3MLS0NzY3NjMQkmct0PgYIyQQHpiSWp2ampB
        ahFMHxMHp1QD46R7xvvLft8/avHgT+XdF0eUiuN3RbvlpnX+VZNfkKa2cv8Wz7cR3bWSHpv/
        8rx0a6jp+D2PS0wq9ZLFGl2XKYzzN/58kujqfivu1IbNa78nd5SrvhONm7BT2tc9ue31IguJ
        c1qKfnU/nqoZnPts7yEnGvco4urMzB/OXZU3D98o3PXMsY33qBJLcUaioRZzUXEiAKtKmvrB
        AgAA
X-CMS-MailID: 20190801093526eucas1p15f66af6e216dadfc81bf72c2a1711435
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190731143753epcas2p1345484f3308512832701ef0ba495810e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190731143753epcas2p1345484f3308512832701ef0ba495810e
References: <20190724072008.6272-1-guillaume.gardet@free.fr>
        <20190725083433.6505-1-guillaume.gardet@arm.com>
        <CAJKOXPejSxxH5DJPyEHTt=VEOdVgiXOm1c3MKKir-qRxtDcLLA@mail.gmail.com>
        <DBBPR08MB4678546DF9EE76EE6427DBB783C10@DBBPR08MB4678.eurprd08.prod.outlook.com>
        <CAJKOXPdLd5C0FPwijGwTWW9t46exysdqgeb07txPhp-f_b5DFA@mail.gmail.com>
        <DBBPR08MB46788EBBB3BF3BB8C54FAD1283C10@DBBPR08MB4678.eurprd08.prod.outlook.com>
        <CAJKOXPevC8GN=te7ub5Voq=dfn2HgJBbb=niVdD-gtWDUsq3Ow@mail.gmail.com>
        <CGME20190731143753epcas2p1345484f3308512832701ef0ba495810e@epcas2p1.samsung.com>
        <DBBPR08MB4678D2A9A042269A8934E84183DF0@DBBPR08MB4678.eurprd08.prod.outlook.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Guillaume,

On 2019-07-31 16:37, Guillaume Gardet wrote:
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: 26 July 2019 12:40
>> To: Guillaume Gardet <Guillaume.Gardet@arm.com>
>> Cc: linux-samsung-soc@vger.kernel.org; Kukjin Kim <kgene@kernel.org>;
>> linux-arm-kernel@lists.infradead.org
>> Subject: Re: [PATCH V2 1/2] arm: dts: exynos: Add GPU/Mali T604 node to
>> exynos5250
>>
>> On Thu, 25 Jul 2019 at 14:37, Guillaume Gardet <Guillaume.Gardet@arm.com>
>> wrote:
>>>> No, regulator is not provided. On all Exynos boards Mali uses its
>>>> own dedicated regulator (and sometimes additional one). It worked in
>>>> your case because the regulator was set as always-on but this is a
>> workaround for lack of consumers.
>>>> Once there is a consumer, the regulator should not be always-on to
>>>> save the energy when not used.
>>> I do not have the required info here. Do you have it, or could I skip the
>> mali-supply for now?
>>
>> You can guess from regulator name :)
>> For the Arndale, the schematics are saying it is buck4.
> Thanks. This is buck4 as well for snow.
>
> On Arndale board, buck4 has a fixed voltage of 1V contrary to snow, which leads to the following error:
> [   21.131930] panfrost 11800000.gpu: Cannot set voltage 925000 uV
>
> The following change fixes the previous error:
> -                               regulator-min-microvolt = <1000000>;
> -                               regulator-max-microvolt = <1000000>;
> +                               regulator-min-microvolt = <850000>;
> +                               regulator-max-microvolt = <1300000>;
>
> Should I remove arndale enablement for now until this is fixed separately, or could I add this fixup in this patch serie, as it is related?

It is okay to add this fixup to the patch, which sets mali regulator on 
arndale board.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

