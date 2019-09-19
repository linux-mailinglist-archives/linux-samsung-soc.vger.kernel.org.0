Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA5FDB79BB
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 19 Sep 2019 14:49:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389589AbfISMt4 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 19 Sep 2019 08:49:56 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44518 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387520AbfISMtz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 08:49:55 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190919124953euoutp02a3d7c2d5bf9af0cb344d80dc981a6aab~F194Q8dbu2727627276euoutp02S
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Sep 2019 12:49:53 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190919124953euoutp02a3d7c2d5bf9af0cb344d80dc981a6aab~F194Q8dbu2727627276euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1568897394;
        bh=sbmvg1Ra4kPeyA4lEdy07dbJP9Cknvyi7VQZy0GRotg=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=pvQNGPCOzcE/aa2CClnu48GIBXcISyMlbvTZxAVzQhK+DbzHDi6qg5GjY4BlnLGD1
         254yPkYN4kRFTeQip4ITw0rc0kWV4uBRj+7QTzqJ+s4PXVwnnZSEIf4+35y5OGtZ1r
         /Zge2uNIfGoWtWqy+72r6nBckNv6gs9mmK7y5jZ8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190919124953eucas1p2c3b7ba12e7047787051999d4e6211862~F193keRe23170331703eucas1p2-;
        Thu, 19 Sep 2019 12:49:53 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id E8.9D.04469.079738D5; Thu, 19
        Sep 2019 13:49:52 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190919124952eucas1p29de8004517cbf8d453f7559822f44e88~F19213SSt1424714247eucas1p2Q;
        Thu, 19 Sep 2019 12:49:52 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190919124952eusmtrp29d4b73e2bf3b7efb887e09a1abeadfbe~F192nnyzd0767907679eusmtrp2T;
        Thu, 19 Sep 2019 12:49:52 +0000 (GMT)
X-AuditID: cbfec7f2-54fff70000001175-ed-5d837970b1df
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 50.31.04166.079738D5; Thu, 19
        Sep 2019 13:49:52 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190919124951eusmtip18d29027b98da48e960a1e2a4311542e7~F1919rEHn0687006870eusmtip1S;
        Thu, 19 Sep 2019 12:49:51 +0000 (GMT)
Subject: Re: [PATCH v1 8/9] ASoC: samsung: arndale: Add missing OF node
 dereferencing
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     broonie@kernel.org, lgirdwood@gmail.com,
        ckeepax@opensource.cirrus.com, sbkim73@samsung.com,
        alsa-devel@alsa-project.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <a0072745-f7c1-86ad-2344-d73dd210e1ad@samsung.com>
Date:   Thu, 19 Sep 2019 14:49:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919082211.GF13195@pi3>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sa0hTYRjuO3elyWkae9OoGEWYpYlWpwtS1I9DQfWrpFy19OQlnbbjbfWj
        0i7m5liSTNe8BJk6DHWFtyhxmmJWNpXKTPIWxFAsL0VFmdsp8t/zvO/7vM/7fHwMLneS/ky8
        JlXQatSJSsqbqO/4/nJTii5btbnj+Tau3+nAuLrCGpIrGBmnuP6rdsSVtr8kuZ6eWpr72p+D
        cfax1yRX2PME4+63D9HczFQLyV193E5zzspZbLeMr53JovgmyxDN2203KP7B3Yu82TqPeOND
        G+Jn7KsO08e8d8UIifHpgjYk4pR3nOteJZbSiGV2ffyJXUJfUS7yYoANB+fnG1gu8mbkbCWC
        gbEvuERmEbzTd1MSmUHQ7LpD5iLGI8nt2SjVKxDcNo8giUwiMI6NYu69vuxReF9t9GA/NhDe
        /PpGuodw9hUGz9oMhLtBsaGQ99ToOUTGRkBhq55wOxDsOujK8WiXs5EwPdxGSiPLoKto3CP1
        WtjpvJJHuTHOKiBrtoqU8GpomLTiUrZJGlyuRAnvg5bRlr+ZfcHV+ZCW8EqYbyr15Ac2G4Hh
        0SAtEROCD51lfxU7oa3T6YmPLzjXNIdI5T1Qd6WIll7FB95OLpNu8IH8ejMulWWQc00uTa+F
        nzYzJmF/0I/PEyaktCxKZlmUxrIojeW/bxkibEghpIlJsYIYqhEygkV1kpimiQ2OTk6yo4WP
        1v27c7oRzfWediCWQcqlsjUZ2So5qU4XdUkOBAyu9JNZt2Sp5LIYte68oE0+qU1LFEQHCmAI
        pUJ2YcnwcTkbq04VzgpCiqD918UYL/9LCEO7A/ZX7Eqb0J/oK7ceWpF5a6mjz7QnPFwRZBte
        j6uIMB1lOFg8EKUyTSQU9TJVF3hD4+XqTyEvfvwqb4DYA2ER96K3U5qtikZzSQXsLWgqmc5X
        BbUGXi8tmytWBvTlXDt0vjXoHIqyvqkNjNxxcvtmRfXUzdcJusG5M0fCzEpCjFOHbsC1ovoP
        xF2yR2QDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xu7oFlc2xBpdfsFlcuXiIyWLjjPWs
        FlMfPgFyWzcxWsw/co7V4vz5DewW3650MFlsenyN1WLG+X1MFmuP3GW3+Px+P6tF694j7BYX
        V3xhcuD12PC5ic1j56y77B6bVnWyeWxeUu8xfc5/Ro++LasYPT5vkgtgj9KzKcovLUlVyMgv
        LrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3S9DLeLVsBVPBDqaKk09/MzUw
        fmPsYuTgkBAwkeg6r9PFyMUhJLCUUeLVtZ+sEHEpifktSl2MnECmsMSfa11sEDWvGSWenJnO
        DJIQFgiXuLOmjwnEFhHQlLj+9zsrSBGzwAUmie9tIEUgHfcYJR4f2QpWxSZgKNF7tI8RxOYV
        sJOYcbCbBWQbi4CqxMkOsBJRgQiJwztmQZUISpyc+YQFxOYEWnCxpZcNxGYWUJf4M+8SM4Qt
        LtH0ZSUrhC0vsf3tHOYJjEKzkLTPQtIyC0nLLCQtCxhZVjGKpJYW56bnFhvqFSfmFpfmpesl
        5+duYgRG8LZjPzfvYLy0MfgQowAHoxIPr0J5c6wQa2JZcWXuIUYJDmYlEd45pk2xQrwpiZVV
        qUX58UWlOanFhxhNgX6byCwlmpwPTC55JfGGpobmFpaG5sbmxmYWSuK8HQIHY4QE0hNLUrNT
        UwtSi2D6mDg4pRoYWbhztrtec3qldu54QcOJaxa+6Wt23cwQvhtS1PbEQ3wRl9fn9znba7UO
        TGe26/zYeDRJRsbE/YbBrnW7Trbs73ojcKHd9uxK74zfvnxrtgkq17Ds/y9Xemf396vTn5mm
        /S3TbZ9pkGNqMuVxmsnBHZ+WF7YUNIlr+hpu0w+cKRF3xPw88/EcJZbijERDLeai4kQAZ+/k
        dvYCAAA=
X-CMS-MailID: 20190919124952eucas1p29de8004517cbf8d453f7559822f44e88
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190918104713eucas1p2ccfa8e9dff2cda9e8f88ac42dda2b680
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190918104713eucas1p2ccfa8e9dff2cda9e8f88ac42dda2b680
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
        <CGME20190918104713eucas1p2ccfa8e9dff2cda9e8f88ac42dda2b680@eucas1p2.samsung.com>
        <20190918104634.15216-9-s.nawrocki@samsung.com> <20190919082211.GF13195@pi3>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 9/19/19 10:22, Krzysztof Kozlowski wrote:
> Wasn't this issue introduced in 5/9? It looks weird to fix it here...

It has not been introduced by 5/9, the issue was there already before 
my patch, there was even no remove() callback where OF node references 
could be dropped.

-- 
Thanks,
Sylwester
