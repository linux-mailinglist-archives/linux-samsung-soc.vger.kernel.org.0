Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC978AB001
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  6 Sep 2019 03:06:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403853AbfIFBGm (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 5 Sep 2019 21:06:42 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:37950 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731344AbfIFBGl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Sep 2019 21:06:41 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20190906010638epoutp0434d9001842aa2006c3148c61057ceb18~Bs-JhI_IV0911409114epoutp04L
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Sep 2019 01:06:38 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20190906010638epoutp0434d9001842aa2006c3148c61057ceb18~Bs-JhI_IV0911409114epoutp04L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1567731998;
        bh=zuqhj21YLwUOhSeDZ220Srd0Xcb66OLWNXrDTjNiHss=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=EOS/0AKeqroYNexlaLnwnGNthBKyZNn4ReOxWejJsb3CU0bEbSne9bV//pRQS31Vu
         2gaedf9YwKgxHl4PnHRr3Q2+i7aQfrP/IF3sSQVGtLUiH06sSbxqEhP5nYH0u5BksQ
         0x2OEismq6EvXTk5MJ8kD1Lomj5tHKBoUx3kh1t0=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20190906010638epcas1p3542009440ef239ab8bfbc7d3bd34f32d~Bs-I-w22k2945529455epcas1p3N;
        Fri,  6 Sep 2019 01:06:38 +0000 (GMT)
Received: from epsmges1p5.samsung.com (unknown [182.195.40.152]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 46PfXB4jHCzMqYkc; Fri,  6 Sep
        2019 01:06:34 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p5.samsung.com (Symantec Messaging Gateway) with SMTP id
        84.3F.04085.A11B17D5; Fri,  6 Sep 2019 10:06:34 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190906010633epcas1p1a4c677f5c78377674c83f404a80076eb~Bs-E1NtM_0904609046epcas1p1J;
        Fri,  6 Sep 2019 01:06:33 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190906010633epsmtrp14cad7057212e6288d16c817a36b00523~Bs-E0grel2861228612epsmtrp1V;
        Fri,  6 Sep 2019 01:06:33 +0000 (GMT)
X-AuditID: b6c32a39-d03ff70000000ff5-5b-5d71b11a402a
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        E7.5E.03638.911B17D5; Fri,  6 Sep 2019 10:06:33 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190906010633epsmtip1e0a7f2ad301ad6db990f26db9a762290~Bs-ErLoBx3003430034epsmtip1G;
        Fri,  6 Sep 2019 01:06:33 +0000 (GMT)
Subject: Re: [PATCH v3 2/2] ARM: exynos: Enable support for ARM architected
 timers
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marc Zyngier <maz@kernel.org>
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <ee7945aa-d668-6017-8aec-7f377f3951fb@samsung.com>
Date:   Fri, 6 Sep 2019 10:10:42 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190828121005.29368-3-m.szyprowski@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf0yMYRz33N373ltzPK7St5sf581smqt75XgzGdO4YWpkqLW8q3dX6368
        7r0zMpNlUSyOzXLIb02WlDQhRxFlExEWVsRWGJOQGN67N/Tf5/v9fj7fz/N5nodSag+SOirb
        7uKdds5Kk8Gq2sapBoOual2acU97GFtVUkmwra3n1Wx192OCLWm9pmArbr5Qs3WHmol5pLm6
        vJA0Xzi5xVxcU47Mn6snJKlScuZk8Vwm79Tz9gxHZrbdEk8vWZG+IN0008gYmDh2Fq23czY+
        nk5YmmRYmG2VvGn9es7qllpJnCjSMXPnOB1uF6/PcoiueJoXMq1CnBAtcjbRbbdEZzhssxmj
        cbpJIq7Nyerd/10p7KU27HtZochDHWQRCqIAz4DKPI+qCAVTWnwJwbtiLyEXfQjyS7ep5eIr
        grNt/f8kZQd2KeRBPYK7hbcU/oEWf0QwcCXRj0NwMlztH1T7cSjOheLrg0q/QInzEJTtvEb4
        BySOAl/P08DW0XgStA90Iz/W4Lnw6mVFQKzCkyF/4HzAIAyvhr6uRkLmjIHmA69Vfhwk8fs8
        nYE9ShwOHa+PKGQ8EfIvHgwYA+4kwXOnVCFHSIBv7wcJGYfA29s1ahnroHd3wRDeBGeab5Ky
        eAeCGt/9IUEs+E7tkxZRksNUqLwcI7cnQd2Pw0g2HgUfvuwi/BTAGthRoJUpkfCw68XQESLg
        xPZCcg+ivcPieIdF8A6L4P1vdhSpytFYXhBtFl5kBNPw565GgY8ZFXcJNd1b2oAwheiRGtwv
        pGkJbr240daAgFLSoZrKKqmlyeQ25vJOR7rTbeXFBmSSbtuj1IVlOKRvbnelM6bpsbGx7Axm
        polh6HDNsQE2TYstnIvP4XmBd/7VKaggXR7K74loJPsiUlua9j8xd9O/5ieWtG2vq73hsQlb
        W5pvLaqvorN9fHHrg+T2zbXjPo18Pq00uMe12OdesyUhd+LPO5tWjl8VU/ZJUBWsnWLMYQ3L
        jdHQkhuMIj1vmPfhPzrbHoWesf6enJJccfxZxwiLuvFBb9Gyw132uJrU0+ea9Bm0SszimCil
        U+T+APD5R6GuAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjkeLIzCtJLcpLzFFi42LZdlhJTldyY2GsweZ3+hYbZ6xntTh/fgO7
        xabH11gtZpzfx2Sx9shddoudc06yOrB5bFrVyeaxeUm9R9+WVYwenzfJBbBEcdmkpOZklqUW
        6dslcGW8nPaTuWASR8Xkh2uZGhhvsXUxcnJICJhILJ/Zw9TFyMUhJLCbUWLNtY/sEAlJiWkX
        jzJ3MXIA2cIShw8XQ9S8ZZT4++UgE0iNsECIxJ4vv8DqRQSqgGq2soEUMQs0MUrsOvQRaupR
        RompB+aAVbEJaEnsf3EDbDW/gKLE1R+PGUFsXgE7iUcP14LVsAioSDT/2AC2QVQgQuLwjllQ
        NYISJ2c+YQGxOYHqP028DzaHWUBd4s+8S8wQtrjErSfzmSBseYnmrbOZJzAKz0LSPgtJyywk
        LbOQtCxgZFnFKJlaUJybnltsWGCUl1quV5yYW1yal66XnJ+7iREcO1paOxhPnIg/xCjAwajE
        wyvwpSBWiDWxrLgy9xCjBAezkgjv+o1AId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rzy+ccihQTS
        E0tSs1NTC1KLYLJMHJxSDYyzpiqLOL25+z/w7ZR5XqHzKx7O7Vv/MTpu1anrt0OWXt3xsVXQ
        RPpwIwdb9qIJKz7G3lIWvyfbn7HFeOq9b/sf3LmxskrCv7x5CuOk1ifPcrYa7xG+o3xyZ/3D
        nBRfDec9/VvSlD+4Kq5REzzCtMaDq2jiStOMk8Kz78Ru16uL1roymXkCW1W0EktxRqKhFnNR
        cSIAq3bH4JkCAAA=
X-CMS-MailID: 20190906010633epcas1p1a4c677f5c78377674c83f404a80076eb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190828121012eucas1p2fb78bfebe16d744dc28194bb224650e2
References: <20190828121005.29368-1-m.szyprowski@samsung.com>
        <CGME20190828121012eucas1p2fb78bfebe16d744dc28194bb224650e2@eucas1p2.samsung.com>
        <20190828121005.29368-3-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Dear Marek,

On 19. 8. 28. 오후 9:10, Marek Szyprowski wrote:
> ARM architected timer can be used together with Exynos MultiCore Timer
> driver, so enable support for it. Support for ARM architected timers is
> essential for enabling proper KVM support.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index f83786640f94..9dab1f50a02f 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -19,6 +19,7 @@ menuconfig ARCH_EXYNOS
>  	select EXYNOS_SROM
>  	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
>  	select GPIOLIB
> +	select HAVE_ARM_ARCH_TIMER if ARCH_EXYNOS5 && VIRTUALIZATION
>  	select HAVE_ARM_SCU if SMP
>  	select HAVE_S3C2410_I2C if I2C
>  	select HAVE_S3C2410_WATCHDOG if WATCHDOG
> 

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
