Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58C91DA7F0
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 17 Oct 2019 11:03:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733180AbfJQJDF (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 17 Oct 2019 05:03:05 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:37494 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729109AbfJQJDF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Oct 2019 05:03:05 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20191017090303euoutp014bc8428d46d07de85900ed86037b3d1e~OY70Sc6yg1965019650euoutp01y
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Oct 2019 09:03:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20191017090303euoutp014bc8428d46d07de85900ed86037b3d1e~OY70Sc6yg1965019650euoutp01y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1571302983;
        bh=3z0Meifbwr5zG+mE7LdzyRuTTfPqBg1Ea+yb3WOdQ6M=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=B6RpQs+3bIbxe5nbrqwo/7TX6yFC91J3iDB/9DHDOMpf5JJlvIHBnKx6UAhVUGJwA
         GQH02JYtVURBOxWSAN+Z1ii0SW/e2PT/PGrVrqQMt9zzd5PGeMdITi47G917JDeUv/
         Nws3WxjY76mtQVJbamXa+GBQRH7gpJalcsCQJlIY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191017090303eucas1p16b2cb435692005c820b1b5d9b745397a~OY7z7wYCy2584825848eucas1p1t;
        Thu, 17 Oct 2019 09:03:03 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 24.13.04374.74E28AD5; Thu, 17
        Oct 2019 10:03:03 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191017090302eucas1p17cbcaea2d7e2479d19a60205fe7ba69f~OY7zh1K0b0112301123eucas1p1p;
        Thu, 17 Oct 2019 09:03:02 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191017090302eusmtrp2a9e9214e2871787b5e86381e36dafc57~OY7zgzBm52488524885eusmtrp2e;
        Thu, 17 Oct 2019 09:03:02 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-65-5da82e475026
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 03.B9.04166.64E28AD5; Thu, 17
        Oct 2019 10:03:02 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20191017090302eusmtip2c6d402ce73ee18fe5039249704c2f539~OY7y-COjD1289712897eusmtip2_;
        Thu, 17 Oct 2019 09:03:02 +0000 (GMT)
Subject: Re: [PATCH v5 2/4] dt-bindings: arm: samsung: Update the CHIPID
 binding for ASV
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     devicetree@vger.kernel.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-pm@vger.kernel.org,
        sboyd@kernel.org, vireshk@kernel.org,
        =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= 
        <b.zolnierkie@samsung.com>, roger.lu@mediatek.com,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <e5f441af-a21c-292b-b6ba-7e1e6550f091@samsung.com>
Date:   Thu, 17 Oct 2019 11:03:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAJKOXPeagcSRUm2Qwwby=NHfWGdQ6KVZ2htb3UmnU2GfX+Ckcg@mail.gmail.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrJKsWRmVeSWpSXmKPExsWy7djPc7rueitiDbZvErLYOGM9q8X8I+dY
        Lc6f38BusenxNVaLz71HGC1mnN/HZLH2yF12i9a9R9gtLj/eyGbx79pGFovND46xOXB7bFrV
        yeaxeUm9R8vJ/SwefVtWMXp83iQXwBrFZZOSmpNZllqkb5fAlTFz1ha2gs/sFd9/ZTcwzmXr
        YuTkkBAwkfj5s52xi5GLQ0hgBaPE3ssfmUASQgJfGCW+/fOEsD8zSrQtz4FpmPe6jQmiYTmj
        xIt7Cxkhit4ySrxuMQGxhQWiJA68W8oCYosIaEpc//udFaSBWaCJWeL0qvVgq9kEDCV6j/aB
        NfMK2Em0n78CZrMIqEpMaP0OZHNwiApESJz+mghRIihxcuYTsJmcAoESN3fOYgWxmQXEJZq+
        rISy5SW2v53DDHHoJXaJiWskQcZICLhI/N1tDxEWlnh1fAs7hC0j8X/nfLBfJASaGSV6dt9m
        h3AmMErcP76AEaLKWuLw8YusIIOYgZ5Zv0sfIuwo8eHrckaI+XwSN94KQpzAJzFp23RmiDCv
        REebEES1isTvVdOZIGwpie4n/1kmMCrNQvLYLCTPzELyzCyEvQsYWVYxiqeWFuempxYb56WW
        6xUn5haX5qXrJefnbmIEJqjT/45/3cG470/SIUYBDkYlHt4Jj5bHCrEmlhVX5h5ilOBgVhLh
        nd+yJFaINyWxsiq1KD++qDQntfgQozQHi5I4bzXDg2ghgfTEktTs1NSC1CKYLBMHpxQwyVxR
        DOdVWvtWibnFamlkh0Dux09eXtOMmEJW/9S9PPFl+numUyF+3oJt+xuPXu5ujy/KmitWv34P
        r5X5ylXVGxIWXmk+3bCJddPTg1o/jlhfuXjUTcnu4POalNZjZyfqC5WtLvleGiOy+GxOQf4q
        /yXyfTMFzTW3/18yh3f5PRG2tW5TrwW9V2Ipzkg01GIuKk4EAEcrwptMAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRmVeSWpSXmKPExsVy+t/xe7pueitiDU680rfYOGM9q8X8I+dY
        Lc6f38BusenxNVaLz71HGC1mnN/HZLH2yF12i9a9R9gtLj/eyGbx79pGFovND46xOXB7bFrV
        yeaxeUm9R8vJ/SwefVtWMXp83iQXwBqlZ1OUX1qSqpCRX1xiqxRtaGGkZ2hpoWdkYqlnaGwe
        a2VkqqRvZ5OSmpNZllqkb5eglzFz1ha2gs/sFd9/ZTcwzmXrYuTkkBAwkZj3uo2pi5GLQ0hg
        KaPEtkO32LsYOYASUhLzW5QgaoQl/lzrYoOoec0oMf9RLytIQlggSuLAu6UsILaIgKbE9b/f
        WUGKmAWamCX+dRxjhujoYJJYvqOFHaSKTcBQovdoHyOIzStgJ9F+/gqYzSKgKjGh9TuYLSoQ
        IfF8+w2oGkGJkzOfgG3gFAiUuLlzFthmZgF1iT/zLjFD2OISTV9WQsXlJba/ncM8gVFoFpL2
        WUhaZiFpmYWkZQEjyypGkdTS4tz03GJDveLE3OLSvHS95PzcTYzA2Nx27OfmHYyXNgYfYhTg
        YFTi4Z3AuDxWiDWxrLgy9xCjBAezkgjv/JYlsUK8KYmVValF+fFFpTmpxYcYTYGem8gsJZqc
        D0wbeSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNITS1KzU1MLUotg+pg4OKUaGKe5rl31wVaC
        M/B6ZqrV8X+xdsKm2pIHmBOatWbtFgh4vMuqodYt/ntHdGy8SkzsgVnqnaun3ls4x32W0g7Z
        1fN/7jUrkjjmvN+N++6ehrtX65orfm/eeT3Ci9NNTG39/IVyv16c/L/ot0jJuvN/l8YdlQwr
        5YxJ5jj/9GfKzCxl0XWntpYZ8SuxFGckGmoxFxUnAgCOd6+r4wIAAA==
X-CMS-MailID: 20191017090302eucas1p17cbcaea2d7e2479d19a60205fe7ba69f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191016145812eucas1p1a3cf3f44a2cff4c32a2270334630c4a2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191016145812eucas1p1a3cf3f44a2cff4c32a2270334630c4a2
References: <CGME20191016145812eucas1p1a3cf3f44a2cff4c32a2270334630c4a2@eucas1p1.samsung.com>
        <20191016145756.16004-1-s.nawrocki@samsung.com>
        <20191016145756.16004-3-s.nawrocki@samsung.com>
        <CAJKOXPeagcSRUm2Qwwby=NHfWGdQ6KVZ2htb3UmnU2GfX+Ckcg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/16/19 18:16, Krzysztof Kozlowski wrote:
>> --- a/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.yaml
>> +++ b/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.yaml
>> @@ -9,17 +9,42 @@ title: Samsung Exynos SoC series Chipid driver

BTW, I think we should rename the above title to talk about IP block/device
rather than driver, e.g.

-SAMSUNG Exynos SoCs Chipid driver.
+SAMSUNG Exynos SoC series CHIPID subsystem

>> +# Custom select to avoid matching all nodes with 'syscon'
>> +select:
>> +  properties:
>> +    compatible:
>> +      contains:
>> +        const: samsung,exynos4210-chipid
>> +  required:
>> +    - compatible
>> +
>>  properties:
>>    compatible:
>> -    items:
>> -      - const: samsung,exynos4210-chipid
>> +    allOf:
>
> I think it was my mistake to use allOf in other Exynos bindings. It
> should not be needed.

Indeed it seems to work well without allOf, I was wondering why we
needed the custom select above AND allOf.
