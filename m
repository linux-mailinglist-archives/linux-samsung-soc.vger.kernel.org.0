Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C2A12D515
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 29 May 2019 07:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbfE2Fa7 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 29 May 2019 01:30:59 -0400
Received: from mailout4.samsung.com ([203.254.224.34]:63992 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725888AbfE2Fa7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 May 2019 01:30:59 -0400
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout4.samsung.com (KnoxPortal) with ESMTP id 20190529053056epoutp043a372ab280527010d7e56bb81385ad79~jEFXaNDPf1742217422epoutp04c
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 May 2019 05:30:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20190529053056epoutp043a372ab280527010d7e56bb81385ad79~jEFXaNDPf1742217422epoutp04c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1559107856;
        bh=lhXRTVWS6DWGaq4uP/utrGfqkFZLh3nlIdqmxmiwbKI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Vu39N45Ojv1FEg8PBF5E/d50agi2r7pIQric2q1tbcSonqOHYyaNZJtHjYmiOVF9V
         dWnR/n+jmhDS5rggknGcxoqTVtoX/WtWWnja1ydpzESH4WNY6ziqCxKZiNNKj5SiiT
         8cAPHFSkKKyNehvkNwnkNrpTfsYaR5d8FYK6QsEM=
Received: from epsmges1p1.samsung.com (unknown [182.195.40.157]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190529053053epcas1p22496fa0618ec2905e4dbc6dc546410bd~jEFUhVD-S3111431114epcas1p2a;
        Wed, 29 May 2019 05:30:53 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        7A.AB.04139.A091EEC5; Wed, 29 May 2019 14:30:50 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTPA id
        20190529053049epcas1p4a6f751b8c1411cd4190f712b3415d433~jEFQzQM0_2274122741epcas1p4B;
        Wed, 29 May 2019 05:30:49 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190529053049epsmtrp21c1dc2b7c31f797dbba5e0c006ed1f9b~jEFQyfBGY1033110331epsmtrp2a;
        Wed, 29 May 2019 05:30:49 +0000 (GMT)
X-AuditID: b6c32a35-973ff7000000102b-f6-5cee190a7426
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        92.28.03662.9091EEC5; Wed, 29 May 2019 14:30:49 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190529053049epsmtip2ee1ffbf70803ebb405a308146a8684bc~jEFQr2_Tc2672926729epsmtip2Y;
        Wed, 29 May 2019 05:30:49 +0000 (GMT)
Subject: Re: [PATCH] clk: samsung: exynos5433: Use of_clk_get_parent_count()
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
From:   Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <2a68376b-32a4-a016-124f-c7fa3b8579bd@samsung.com>
Date:   Wed, 29 May 2019 14:32:46 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190525115542.107929-1-wangkefeng.wang@huawei.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRTmt7tdr4/VbWkeR9m8EZTh4zZXMzSsRIQkpAgkBvOilynuxe4m
        +YBGYeUMzFRYk0q0oITSloZFpagp9jLRHo60fBRmPkpJxNLadhf533e+853fOd/5HQKTlOFS
        IldvZk16RkvhAcL7nTtjogLCZlWxtrrNyvLxb5iyr6/JT+kcfytS2vueCJKEqc6GUjz13vVT
        qQvO8HTsRF5CDstksyYZq88yZOfqNYnU4WPqQ2rFnlg6io5X7qVkekbHJlLJaelRKbladzNK
        ls9oLW4qneE4KmZ/gslgMbOyHANnTqRYY7bWGG+M5hgdZ9FrorMMun10bOxuhVuYmZez3P5V
        aOzyP/nDtoSsaNHPhvwJIOOgt/wnZkMBhIRsRWAvGxfywTyChsE5ER8sIphccgn/lbRP3/Op
        HiMYsz7zqeYQ1FbWiTyqjWQatDybxjw4mEyFsfl3yIMx8jA8cjm9GCcjoW3yPe7B68kIeLM0
        7uXF5H54OfhQYEMEISS3w8yCykOHkBnwsbtJxEs2QO/lCe9A/uQB6H7fj/HPh4Jr4pqAx1vh
        TEuN1xuQL3B4ap/BeAfJ8Ge13+dmI0z1NPuWIYWF2cc4j4vgVm8XzhefR9Dc9lrEJ+TQdqPS
        OxxG7oTGhzE8HQEPfl3xeVwHsz8viDwSIMVw/qyEl2yDgU/DAh6HQf25Uvwiohxr7DjWWHCs
        seD436wWCRvQJtbI6TQsRxvptb/tRN5DjFS0oqpXaR2IJBAVJM4Mm1FJREw+V6DrQEBgVLA4
        sWpaJRFnMwWFrMmgNlm0LNeBFO5lV2DSkCyD+6z1ZjWt2C2Xy5Vx9B4FTVOhYnXgkEpCahgz
        m8eyRtb0r05A+EutqKg68vvxT3duTz1KyBhYKXaUOFK6vkQcsDpijk6tL+nRLTVYDmoKj7ha
        BZNDPbLw58Vm7dRyTdWb37LV+oqB3qRd9lsjJrW181JgZnH1rh1a6QuH8+uI6/ToytCifTTj
        XBDTGKps/3B1x+LdpPzlQgF2c/PoiaPT5VuGq0c/ynWfKSGXw9CRmIlj/gKdt4KLngMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrCLMWRmVeSWpSXmKPExsWy7bCSvC6n5LsYg2/39C36H79mtjh/fgO7
        xabH11gtZpzfx+TA4rFpVSebx+Yl9R6fN8kFMEdx2aSk5mSWpRbp2yVwZfw68JKl4Ahnxceu
        H4wNjN/Yuxg5OSQETCQOvNnM0sXIxSEksJtRom3eBCaIhKTEtItHmbsYOYBsYYnDh4tBwkIC
        bxklzp4MBLGFBXwktp56wwxiiwh4SDz6dJ0RxGYW8JbYc2sTI8TMKYwSu69fZwFJsAloSex/
        cYMNxOYXUJS4+uMxWAOvgJ3E2Su7mEB2sQioSrz9HAMSFhWIkDjzfgULRImgxMmZT8BsTgFH
        iWM3LjJD7FKX+DPvEpQtLnHryXwmCFteonnrbOYJjMKzkLTPQtIyC0nLLCQtCxhZVjFKphYU
        56bnFhsWGOWllusVJ+YWl+al6yXn525iBMeFltYOxhMn4g8xCnAwKvHwJki+jRFiTSwrrsw9
        xCjBwawkwms75U2MEG9KYmVValF+fFFpTmrxIUZpDhYlcV75/GORQgLpiSWp2ampBalFMFkm
        Dk6pBsa1mosCF91V2/6jfal/BOfVZ1bn/Pb8domY+ZLzS4m49oLzm0rcn8cvtnybKC95vjPi
        i9vqW7s2mS9/fojltEzUS323yxuks/7PWzh/5r69NmJR0mZvflp1antdcb32ReCYgRPLErut
        e+LvHTKXObD0tVOZbdCt2De7BZfdfh7pVh5sOfW45TsGJZbijERDLeai4kQA22Br4IcCAAA=
X-CMS-MailID: 20190529053049epcas1p4a6f751b8c1411cd4190f712b3415d433
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190525114732epcas5p3f9d8aec51fb32c7e2ca80f0a45afe8a8
References: <CGME20190525114732epcas5p3f9d8aec51fb32c7e2ca80f0a45afe8a8@epcas5p3.samsung.com>
        <20190525115542.107929-1-wangkefeng.wang@huawei.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On 19. 5. 25. 오후 8:55, Kefeng Wang wrote:
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
> 

It uses the helper function from CCF. Looks good to me.

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
