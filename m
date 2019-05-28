Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7B272C52B
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 28 May 2019 13:10:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfE1LK7 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 28 May 2019 07:10:59 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:52487 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbfE1LK7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 May 2019 07:10:59 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190528111057euoutp02ef8585a54095a8bfb2177b74aea5c256~i1E8wT_aZ3250132501euoutp02_
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 May 2019 11:10:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190528111057euoutp02ef8585a54095a8bfb2177b74aea5c256~i1E8wT_aZ3250132501euoutp02_
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1559041857;
        bh=ectZ9356M986bSPtqbDiko47auKUE54KtRLrrao1KyQ=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=cL3eYYscRmWERF4KHzJA49KhAda5b5QTE9nSSqK/rsSxXX66s4KZOBGPBGzbpU4ln
         cQ9WSVG53i90dfwcy2E47LrBWp6GyPlfxTwcQY2VP040JxGXWy+X8qAVEE4J1dYguX
         DFC6EMFiE9TH0bcsg16sOz+5CbCKR1mq2hy0cMok=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190528111057eucas1p24c581eff9b77092ec181f458d03482d8~i1E8akyAG2336023360eucas1p2z;
        Tue, 28 May 2019 11:10:57 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 10.F6.04377.0471DEC5; Tue, 28
        May 2019 12:10:56 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190528111056eucas1p27cbee0b85e06d05b13cf33321b86680a~i1E7rle2r2128221282eucas1p2q;
        Tue, 28 May 2019 11:10:56 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190528111056eusmtrp1c450e76df98e66960d5d2b7449887ab4~i1E7dnC_X2069920699eusmtrp1V;
        Tue, 28 May 2019 11:10:56 +0000 (GMT)
X-AuditID: cbfec7f4-12dff70000001119-b3-5ced1740444a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id C9.5A.04146.0471DEC5; Tue, 28
        May 2019 12:10:56 +0100 (BST)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190528111055eusmtip21c1987512431aa1c745639b734f83649~i1E7KS8gT2199121991eusmtip2Q;
        Tue, 28 May 2019 11:10:55 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: exynos5433: Use of_clk_get_parent_count()
To:     Kefeng Wang <wangkefeng.wang@huawei.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
From:   Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <2a0147a3-2371-7f78-b756-09923b5f6cb2@samsung.com>
Date:   Tue, 28 May 2019 13:10:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190525115542.107929-1-wangkefeng.wang@huawei.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprNKsWRmVeSWpSXmKPExsWy7djP87oO4m9jDD6/sbTof/ya2eL8+Q3s
        FpseX2O1mHF+H5NF4+f7jA6sHi1H3rJ6bFrVyeaxeUm9x+dNcgEsUVw2Kak5mWWpRfp2CVwZ
        p/c8Yyq4zVFx+MIDxgbG1exdjJwcEgImEuufvGPuYuTiEBJYwSgxY9lHKOcLo0TvxLVsEM5n
        Rok3U3cxwbR07TjDCpFYziix43ETVNVbRonfLU1gg4UFfCS2nnrDDGKLCJRIPDt6DKybWcBb
        Ys+tTYwgNpuApsTfzTfZQGxeATuJ7v1rweIsAqoS/3evB4uLCkRI3D+2gRWiRlDi5MwnLCA2
        p4CjxLEbF5khZspLNG+dDWWLS9x6Mp8J5CAJgcnsEg9bVzJDnO0icWV3E9QLwhKvjm+BhoCM
        xOnJPSwQdr3E/RUtzBDNHYwSWzfshGq2ljh8/CLQFRxAGzQl1u/Shwg7Sry59oEdJCwhwCdx
        460gxA18EpO2TWeGCPNKdLQJQVQrStw/uxVqoLjE0gtf2SYwKs1C8tksJN/MQvLNLIS9CxhZ
        VjGKp5YW56anFhvlpZbrFSfmFpfmpesl5+duYgQmmdP/jn/ZwbjrT9IhRgEORiUe3gfHX8cI
        sSaWFVfmHmKU4GBWEuG1nfImRog3JbGyKrUoP76oNCe1+BCjNAeLkjhvNcODaCGB9MSS1OzU
        1ILUIpgsEwenVAOj2r/ICKV3IUnXu2Lr/ReFSlYY11e41bNVR//x62jo0bi15GzYMQ3RcG3D
        wrSQ3Uk/lVb3TG/R22U+32Tpi/7ecxoVX/7MKuiRyn17Sbkzz+Tjihkdgfp2Bl6mwZ+SttyT
        zKhMi/YzXsKy/pL4G8OUXwV9xotmivSrfNm4Tv0L288DxyYcn6/EUpyRaKjFXFScCABE6lYw
        LgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRmVeSWpSXmKPExsVy+t/xe7oO4m9jDG62c1r0P37NbHH+/AZ2
        i02Pr7FazDi/j8mi8fN9RgdWj5Yjb1k9Nq3qZPPYvKTe4/MmuQCWKD2bovzSklSFjPziElul
        aEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2M03ueMRXc5qg4fOEBYwPjavYu
        Rk4OCQETia4dZ1i7GLk4hASWMko83fyGESIhLrF7/ltmCFtY4s+1LjaIoteMEksmXWcFSQgL
        +EhsPfUGrEhEoETi4MGPYFOZBbwl9tzaBDZISGAKo8SbLiMQm01AU+Lv5ptsIDavgJ1E9/61
        YDUsAqoS/3evB4uLCkRInHm/ggWiRlDi5MwnYDangKPEsRsXmSHmq0v8mXcJypaXaN46G8oW
        l7j1ZD7TBEahWUjaZyFpmYWkZRaSlgWMLKsYRVJLi3PTc4sN9YoTc4tL89L1kvNzNzECo2rb
        sZ+bdzBe2hh8iFGAg1GJh/fB8dcxQqyJZcWVuYcYJTiYlUR4bae8iRHiTUmsrEotyo8vKs1J
        LT7EaAr03ERmKdHkfGDE55XEG5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi
        4JRqYMw17F/Pr3rfY5tiWaxjreiSaoONFRwnjzh9mddntz/oOXc5Q2dH095UWwaBwzOtM+qv
        hHAmM5Xfr0vd/XfhOS7BWnul4zeenv+VU67nqzpvUmXC7puv+NecXy8s7D6n5dwpdZd5Py9M
        k23+EXfjmOyuo6GipU2td9ztXignLWiydF+jFfpivhJLcUaioRZzUXEiAJ8jKGvAAgAA
X-CMS-MailID: 20190528111056eucas1p27cbee0b85e06d05b13cf33321b86680a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190525114732epcas1p3ac5c2205bf004893dc002fe05c3adf7b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190525114732epcas1p3ac5c2205bf004893dc002fe05c3adf7b
References: <CGME20190525114732epcas1p3ac5c2205bf004893dc002fe05c3adf7b@epcas1p3.samsung.com>
        <20190525115542.107929-1-wangkefeng.wang@huawei.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 25.05.2019 13:55, Kefeng Wang wrote:
> Use of_clk_get_parent_count() instead of open coding.
>
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  drivers/clk/samsung/clk-exynos5433.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
> index dae1c96de933..14e253915ca4 100644
> --- a/drivers/clk/samsung/clk-exynos5433.c
> +++ b/drivers/clk/samsung/clk-exynos5433.c
> @@ -5590,8 +5590,8 @@ static int __init exynos5433_cmu_probe(struct platform_device *pdev)
>  	data->nr_clk_save = info->nr_clk_regs;
>  	data->clk_suspend = info->suspend_regs;
>  	data->nr_clk_suspend = info->nr_suspend_regs;
> -	data->nr_pclks = of_count_phandle_with_args(dev->of_node, "clocks",
> -						    "#clock-cells");
> +	data->nr_pclks = of_clk_get_parent_count(dev->of_node);
> +
>  	if (data->nr_pclks > 0) {
>  		data->pclks = devm_kcalloc(dev, sizeof(struct clk *),
>  					   data->nr_pclks, GFP_KERNEL);

Reviewed-by: Andrzej Hajda <a.hajda@samsung.com>

 --
Regards
Andrzej

