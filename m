Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8456311DCB5
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 13 Dec 2019 05:02:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727299AbfLMECT (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 12 Dec 2019 23:02:19 -0500
Received: from mailout4.samsung.com ([203.254.224.34]:52117 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727778AbfLMECT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 12 Dec 2019 23:02:19 -0500
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20191213040214epoutp04bf6d74235275552928de2f772f34edd6~f0mcf27uU2094720947epoutp04_
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Dec 2019 04:02:14 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20191213040214epoutp04bf6d74235275552928de2f772f34edd6~f0mcf27uU2094720947epoutp04_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1576209735;
        bh=7UMVUdoGIPp8gBj1SDgsQXu9SrgmJhbAAW1hC2py8BA=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=sjGZekK3RPFrekuBlsJnqcIu0EFHZ88yux5J3wvBANCFa7oAuVxCBCyU5pmBhdOPO
         BfWKeWlxb/nvyqi6r90ki8/l+alh5zyb5l0z2DpNqfvgEsnhLPsnAXAht+l4dp+lQQ
         svKZqYkBB1yQjk7yOAns2XyuoWll5+giv2lAGTIs=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20191213040214epcas1p26c39ea301d1ac26ad1abffe8f53f185d~f0mbsmw1u1922319223epcas1p2_;
        Fri, 13 Dec 2019 04:02:14 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.40.156]) by
        epsnrtp3.localdomain (Postfix) with ESMTP id 47YxnZ4HfBzMqYkn; Fri, 13 Dec
        2019 04:02:10 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        BF.E4.48019.14D03FD5; Fri, 13 Dec 2019 13:02:09 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191213040209epcas1p15a54eefe1a8bdf17b73952ef8481fd05~f0mXgP2OW1119611196epcas1p1N;
        Fri, 13 Dec 2019 04:02:09 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20191213040209epsmtrp2eb2509fa3a51cb45c58486d1cff35a6b~f0mXfYxnC1492014920epsmtrp2e;
        Fri, 13 Dec 2019 04:02:09 +0000 (GMT)
X-AuditID: b6c32a38-23fff7000001bb93-9b-5df30d413018
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        64.C8.10238.14D03FD5; Fri, 13 Dec 2019 13:02:09 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191213040209epsmtip16244d9204cf9cedfefbe07528587a150~f0mXRPgqC3061930619epsmtip19;
        Fri, 13 Dec 2019 04:02:09 +0000 (GMT)
Subject: Re: [PATCH resend] drm/exynos: gsc: add missed component_del
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Inki Dae <inki.dae@samsung.com>
Message-ID: <9d8db84b-db75-10e4-81b5-c0c02cb8ce81@samsung.com>
Date:   Fri, 13 Dec 2019 13:05:37 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191205160520.31955-1-hslester96@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJJsWRmVeSWpSXmKPExsWy7bCmvq4j7+dYgyWXzSx6z51ksvi/bSKz
        xZWv79ksZh96yWzx4t5FFov+x6+ZLc6f38BucbbpDbvFpsfXWC0u75rDZjHj/D4mixmTX7I5
        8Hjs/baAxWPnrLvsHptWdbJ5bP/2gNXjfvdxJo/NS+o9+rasYvT4vEkugCMq2yYjNTEltUgh
        NS85PyUzL91WyTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMH6FolhbLEnFKgUEBicbGS
        vp1NUX5pSapCRn5xia1SakFKToFlgV5xYm5xaV66XnJ+rpWhgYGRKVBhQnbGsd5JbAXL2Su+
        7GxmamDsYOti5OSQEDCRuN5zjr2LkYtDSGAHo8SBtT9ZIJxPjBLrlkxkgnC+MUqc2LSMEaZl
        x5YNUC17GSWm/J/DCuG8Z5T4t+IQC0iVsICrxMWtT8BsEQF1ic+7doJ1MAvMZJb4uHgqM0iC
        TUBVYuKK+2CX8ArYSfx7fAusgQUovuzrP6B1HByiAhESp78mQpQISpycCTGTU8BKomHBY3YQ
        m1lAXOLWk/lMELa8RPPW2cwQl05ml1h6nBfCdpF4+3wl1NPCEq+Ob2GHsKUkPr/bCxUvl3j2
        7hkLyFoJgRqJb3MrIExjiYsrUkBMZgFNifW79CGKFSV2/p7LCLGUT+Ld1x5WiGpeiY42IYgS
        JYljF29AQ01C4sKSiVB7PCRaJ51nmsCoOAvJW7OQvDILySuzEBYvYGRZxSiWWlCcm55abFhg
        ghzVmxjByVjLYgfjnnM+hxgFOBiVeHgZUj7FCrEmlhVX5h5ilOBgVhLhta8BCvGmJFZWpRbl
        xxeV5qQWH2I0BQb6RGYp0eR8YKbIK4k3NDUyNja2MDE0MzU0VBLn5fhxMVZIID2xJDU7NbUg
        tQimj4mDU6qBkXXn7Pyapg8vjuY4KakdN/WvPB52K2Nj/2Mh3tfL9xh/NO4TaG7JXXdvKo/r
        JxV+hmSm9OaiNw9sHfwPsG7VE9s8YW9l4uQlZoo/JWtefWCedvO/qMPcuRvvGSwzPZ/QPPuC
        t0//C5uQlfOnbNp1imlXE/ds6T31rvwGV/rW3TRiK5LcWuyZqMRSnJFoqMVcVJwIAA/4zq3c
        AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNIsWRmVeSWpSXmKPExsWy7bCSnK4j7+dYg81tCha9504yWfzfNpHZ
        4srX92wWsw+9ZLZ4ce8ii0X/49fMFufPb2C3ONv0ht1i0+NrrBaXd81hs5hxfh+TxYzJL9kc
        eDz2flvA4rFz1l12j02rOtk8tn97wOpxv/s4k8fmJfUefVtWMXp83iQXwBHFZZOSmpNZllqk
        b5fAlXGsdxJbwXL2ii87m5kaGDvYuhg5OSQETCR2bNnA3sXIxSEksJtRortjLXMXIwdQQkJi
        y1YOCFNY4vDhYoiSt4wSHYf+soD0Cgu4Slzc+gTMFhFQl/i8ayfYHGaB2cwSxze3MEJ09DJK
        nL92gRWkik1AVWLiivtgm3kF7CT+Pb4F1s0CFF/29R8jiC0qECHxfPsNRogaQYmTMyE2cApY
        STQseMwOYjMDbfsz7xIzhC0ucevJfCYIW16ieets5gmMQrOQtM9C0jILScssJC0LGFlWMUqm
        FhTnpucWGxYY5qWW6xUn5haX5qXrJefnbmIER6GW5g7Gy0viDzEKcDAq8fAypHyKFWJNLCuu
        zD3EKMHBrCTCa18DFOJNSaysSi3Kjy8qzUktPsQozcGiJM77NO9YpJBAemJJanZqakFqEUyW
        iYNTqoGxVOzHOwUVRnFbPd/OWquQpNbsd+pZd/3Yih1mnfWpu6EYUJ44m9NLkrPmloGn/w3+
        M308obZ8YmrpoT0nNDMVAuTNDrzLe/A3982kCoUN7388YI/zXBKWKHjUbUPvHEcGy5Kb902y
        o7yLxRR/HtaqCr+a8XHF60s7nAqkP139G3Vy+3bbJiWW4oxEQy3mouJEAFJ9h/m+AgAA
X-CMS-MailID: 20191213040209epcas1p15a54eefe1a8bdf17b73952ef8481fd05
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20191205160538epcas1p4575fbc2874d04486bc38cae3472f4b5a
References: <CGME20191205160538epcas1p4575fbc2874d04486bc38cae3472f4b5a@epcas1p4.samsung.com>
        <20191205160520.31955-1-hslester96@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

You don't need to resend this. Already merged to exynos-drm-fixes three weeks ago.

Thanks,
Inki Dae

19. 12. 6. 오전 1:05에 Chuhong Yuan 이(가) 쓴 글:
> The driver forgets to call component_del in remove to match component_add
> in probe.
> Add the missed call to fix it.
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gsc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gsc.c b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> index 7ae087b0504d..88b6fcaa20be 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gsc.c
> @@ -1313,6 +1313,7 @@ static int gsc_remove(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  
> +	component_del(dev, &gsc_component_ops);
>  	pm_runtime_dont_use_autosuspend(dev);
>  	pm_runtime_disable(dev);
>  
> 
