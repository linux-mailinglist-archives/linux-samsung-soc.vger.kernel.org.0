Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7C8FB64B7
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 18 Sep 2019 15:37:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbfIRNhB (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 18 Sep 2019 09:37:01 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:37299 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbfIRNhA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Sep 2019 09:37:00 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190918133659euoutp01038229ea26c13577c96bb05788a8ebc9~Fi9tVvXaz1183311833euoutp01j
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Sep 2019 13:36:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190918133659euoutp01038229ea26c13577c96bb05788a8ebc9~Fi9tVvXaz1183311833euoutp01j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1568813819;
        bh=YwlvZ5lX/q4VkLEO16j7x4girsc6K66AK26JC0JlpFo=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=iirerxl9UKrAyOMptZQviuMceGE91F+/gedY9Y38rhd8eisugbHEj4p8nOHvUtcNE
         be3+8T/TPlCHVP4I24DwBe4332H7eZU5jIzAiB0/eR6g/l9k5njQMmq/6j39NifKX/
         bRqTAbvyPBsCWgXVikyASdYLjJyW9PM7lu/BcNgs=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190918133658eucas1p11f720977a321b39d052268296184b6aa~Fi9sethIz1988419884eucas1p1o;
        Wed, 18 Sep 2019 13:36:58 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id D2.8D.04374.AF2328D5; Wed, 18
        Sep 2019 14:36:58 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190918133657eucas1p27e58bdca99c69c824fc04b036300a127~Fi9rsJCbQ2092820928eucas1p2x;
        Wed, 18 Sep 2019 13:36:57 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190918133657eusmtrp2388a1c07e51b9b64131e748bee829b64~Fi9rcDJWk3244532445eusmtrp2T;
        Wed, 18 Sep 2019 13:36:57 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-d8-5d8232fa5c9e
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id C4.4D.04166.9F2328D5; Wed, 18
        Sep 2019 14:36:57 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190918133656eusmtip2d0e86b1d2bce3fc84646bc9522cca37d~Fi9qu70bx2274022740eusmtip2U;
        Wed, 18 Sep 2019 13:36:56 +0000 (GMT)
Subject: Re: [PATCH v1 2/9] mfd: wm8994: Add support for MCLKn clock control
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com, krzk@kernel.org,
        sbkim73@samsung.com, alsa-devel@alsa-project.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com, lee.jones@linaro.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <e9a10b97-4833-782d-2872-0051bed004cc@samsung.com>
Date:   Wed, 18 Sep 2019 15:36:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190918125435.GF10204@ediswmail.ad.cirrus.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRjtvR+7d6vpdSo+mBmMLJKy/IAufUhRP64QFfSnjJUzryap0101
        NUJZVH5rQWrLWpGgDaptzdJKK3UtDVwDsfUhGopIoaXOsqzM7Rr57zznOec9z4GXxhUDZDCd
        mpHNazPUaUqJjHjw4kfvxp9ROtXmqT6K7XN2YKy57h7JXv44ImH7zlkQa+jqJVmHw0SxgzM2
        xH7rK8ZYy3A/ydY52jH2TtcAxU5/eUqy59q6KNbZ5MZ2+nCmaZ2Ea9UPUJzFWCLhPvQ/kXD3
        Gwq52vp5xFVajYibtoQeoONl25P4tNRcXrspNkF2Ys48RWRW4Xk/P1+iilALVoqkNDAxYHY5
        JKVIRiuYJgQNJj0pDm4E1pleShymERgaDeifpbtm1osVTCOCuYfxomgcQcn1OcKz8Gf2wuWi
        PxIPDmCiYNL+DvOIcMaFwQVnqTdcwkRCha3S+5KciYXmRrPXTDBh0HT1Ju7BgcwhmBrqJEWN
        H3RfGfFqpMwO0D23eQNwJgh07tukiFfDw/F63BMGzG8K7t6axMWz98A3m3OxtT98slspEYfA
        fKsBEw1nEZQ/fk+JQzWCQfuNxdLboNPuXIigFyLWw71Hm0R6F/RUujAPDYwPuMb9xCN84NKD
        Wlyk5VB8XiGq18CcsXbxhGAoG5knqpFSv6Safkkd/ZI6+v+5NxBhREF8jpCewgvRGfypCEGd
        LuRkpEQc16Rb0MKne/XHPtOC2n8ldiCGRsoV8tl1OpWCVOcK+ekdCGhcGSA/cKZQpZAnqfML
        eK3mmDYnjRc60EqaUAbJTy8bOqJgUtTZ/Emez+S1/7YYLQ0uQn6qrTVEfM/Fg/Wr9r1NGLWx
        E7LAhisxYVkBY3Wu1kRN+3B5m+Zk6evVjqSjccmV4XlbEqsq9rt93zS/SpX2PLtwKN80xoWO
        3vx92D1qfZncVtA9FLihN1JfFjYUqyQL2qQTWc7vX90hEWsjQ6M5zR1ZRNzsNl9/n2utvmsa
        dhcuVxLCCXVkOK4V1H8BGp1arnADAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrPIsWRmVeSWpSXmKPExsVy+t/xe7o/jZpiDXo38lpcuXiIyWLjjPWs
        FlMfPmGzuNK6idFi/pFzrBbnz29gt7j/9SijxbcrHUwWmx5fY7WYcX4fk8XaI3fZLT6/389q
        0br3CLvFxRVfmBz4PDZ8bmLz2DnrLrvHplWdbB53ru1h89i8pN5j+pz/jB59W1YxenzeJBfA
        EaVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CX8Xvj
        J5aCfuaKX68nsTcw7mDqYuTkkBAwkTg57QdjFyMXh5DAUkaJziNzWbsYOYASUhLzW5QgaoQl
        /lzrYoOoec0o0bV6NiNIQljAR2Jqwz82EFtEwEji4/FbTCBFzAI3mCSmLLsPNXUlk8SstZ1g
        HWwChhK9R/vAbF4BO4mtyzeygNgsAqoSK2YvZAaxRQUiJA7vmAVVIyhxcuYTsBpOAVuJpoNH
        wbYxC6hL/Jl3iRnCFpdo+rKSFcKWl9j+dg7zBEahWUjaZyFpmYWkZRaSlgWMLKsYRVJLi3PT
        c4sN9YoTc4tL89L1kvNzNzECI3vbsZ+bdzBe2hh8iFGAg1GJh/eHelOsEGtiWXFl7iFGCQ5m
        JRHegNr6WCHelMTKqtSi/Pii0pzU4kOMpkDPTWSWEk3OByadvJJ4Q1NDcwtLQ3Njc2MzCyVx
        3g6BgzFCAumJJanZqakFqUUwfUwcnFINjB2OwXu78oTzi/nNhB96VXKLSehfYApgvORpZ7Cz
        4kU8+9uMI7WTb7XG/Qntlsp48KR5m1Pjmu32xdwlaiLuotbTDtq2uukll9voP5w4Oc9R0+yK
        2TExAbY9Zz2Sc4IubLNrjLN+Z9In4maypDGr5+W8fSYsbUIns3Kemj44xBZ0fsNfh3IlluKM
        REMt5qLiRABLjxF4AgMAAA==
X-CMS-MailID: 20190918133657eucas1p27e58bdca99c69c824fc04b036300a127
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
        <CGME20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce@eucas1p1.samsung.com>
        <20190918104634.15216-3-s.nawrocki@samsung.com>
        <49ef7282-3765-9149-285d-a4025417eb58@samsung.com>
        <20190918125435.GF10204@ediswmail.ad.cirrus.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 9/18/19 14:54, Charles Keepax wrote:
>>> +	ret = devm_clk_bulk_get_optional(wm8994->dev, ARRAY_SIZE(wm8994->mclk),
>>> +					 wm8994->mclk);
>>> +	if (ret != 0)
>>> +		return ret;
>
> Would be nice to print a message here as well, make it clear what
> failed in the log. Apart from that minor nit:

Thanks for reviewing, I will add that modification for v2.

-- 
Regards,
Sylwester
