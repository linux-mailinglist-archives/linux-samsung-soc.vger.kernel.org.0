Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED49B61EE
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 18 Sep 2019 12:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbfIRK7e (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 18 Sep 2019 06:59:34 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:60879 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbfIRK7d (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 18 Sep 2019 06:59:33 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190918105931euoutp015e49b53dc4e4d7ab1cdb86c35d4f28cf~Fg0OgMPWG2150121501euoutp01t
        for <linux-samsung-soc@vger.kernel.org>; Wed, 18 Sep 2019 10:59:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190918105931euoutp015e49b53dc4e4d7ab1cdb86c35d4f28cf~Fg0OgMPWG2150121501euoutp01t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1568804371;
        bh=2jEDKj5MAFz6XTPKSrPwEfw2rGM2tsF45iQeb5MLdts=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Qs5rX89+tABge3oooYdo+0uepfFED1PdWTNBRCe/GvGjjfzh7HHo0iz36iRNbsthN
         5GNy3yS1+O9vM5cSC50foHGMsK4YB/A6YYQCfDQu8PpsknKwbBcGMHxge9Bvtt64uJ
         TFoyAnSIFs5pOPJUCmGlcB0yKg+he4CqZP9d+VWU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190918105930eucas1p2946de83232f86640cf525db00739041a~Fg0NvRw3Y1803818038eucas1p2j;
        Wed, 18 Sep 2019 10:59:30 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id E8.85.04374.21E028D5; Wed, 18
        Sep 2019 11:59:30 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190918105930eucas1p267a84aa997cabf559ecdba8a948f698c~Fg0NAiiCd1803118031eucas1p2g;
        Wed, 18 Sep 2019 10:59:30 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190918105929eusmtrp1d840941e062720d7d2e8ed8a09a31c36~Fg0MwRTue0218202182eusmtrp1w;
        Wed, 18 Sep 2019 10:59:29 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-a9-5d820e128b2b
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id BB.CD.04117.11E028D5; Wed, 18
        Sep 2019 11:59:29 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190918105929eusmtip11765f3282342cbbe84a55797020dad3f~Fg0MHSMz_1131611316eusmtip1Y;
        Wed, 18 Sep 2019 10:59:29 +0000 (GMT)
Subject: Re: [PATCH v1 2/9] mfd: wm8994: Add support for MCLKn clock control
To:     broonie@kernel.org
Cc:     lgirdwood@gmail.com, ckeepax@opensource.cirrus.com,
        krzk@kernel.org, sbkim73@samsung.com, alsa-devel@alsa-project.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com, lee.jones@linaro.org
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <49ef7282-3765-9149-285d-a4025417eb58@samsung.com>
Date:   Wed, 18 Sep 2019 12:59:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190918104634.15216-3-s.nawrocki@samsung.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUhTYRTGe+/H7nW4eV0fHkwMpkEFaZLFpcwUKi4RZX9EUVnNvFikM3bT
        0grnwrLlF9WYTaHI0BrUapllH0ZrusxUNBuFmporsJLSzaIv17ab5H+/c97nvM95Xl4aV/SR
        4fR+9SFeo1ZlKiVSoqHlR8dihVyXusT7LYrt6bJh7K1KC8kahlwStqfIitiL9g6S7ey8SbED
        E82I/dZTjLHWYSfJVnY2Yex1ez/Fur88JtmiR3aK7brqwZLk3E23TsI1mvopzmo+LeH6nA8l
        3O0rBZyx2ou4snoz4tzWyBR6uzQhnc/cn8trYhP3SPf9vsMfbFYc+XDmB6VFbrkeBdHAxMP5
        hmuknxXMVQSGwgN6JPWxB8EnWzkpFm4E+sIn2NTE2IsGQjyoQ1BiMlJiMepTuYoIv2omswEM
        2kmJn2cxc6C3+jTuF+HMMAZVJ1wBQwkTB6XNZcjPMiYRGrurAkww86HmlSEwPJvZBuODT0lR
        EwqtF1wBgyAmAe7YmnA/40wY6DxiCJyZB3dHqwNmwPyh4GK3jhT3XgPFQ624yDPho6OeEjkC
        2s6VEOLACV+eB72UWFQgGHBcQqJqJTx1dPluon0WC8FyP1ZsJ8PzsteYvw2MHF6PhopLyOFs
        gxEX2zIoPqkQ1dHwy2z894zhcMblJSqQ0jQtmmlaHNO0OKb/vpcQYUZhfI6QlcELS9X84RhB
        lSXkqDNi9mZnWZHvz7VNOibuoabfaTbE0EgZLIN2baqCVOUKeVk2BDSunCVLOV6QqpClq/Ly
        eU32bk1OJi/Y0FyaUIbJjs4Y3KFgMlSH+AM8f5DXTJ1idFC4Ft1Y9qpgdflZU/vY18rJ6AXr
        Vxl3syO9QVTEOIoPUaprU97eevkgun8FtJi3b9Vt2vL9TWnxkGUkofxZbUnNC9ZZvTaqblft
        cLBtVdvz0Pc7RwZC7Pf0p94sT6pKrDq/rmPzZbmz09tXf6yrhYuMyDdOaJItnjQgPuuljT/f
        DW0klISwTxW3CNcIqr+Vs423bwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLIsWRmVeSWpSXmKPExsVy+t/xu7qCfE2xBge3allcuXiIyWLjjPWs
        FlMfPmGzuNK6idFi/pFzrBbnz29gt7j/9SijxbcrHUwWmx5fY7WYcX4fk8XaI3fZLT6/389q
        0br3CLvFxRVfmBz4PDZ8bmLz2DnrLrvHplWdbB53ru1h89i8pN5j+pz/jB59W1YxenzeJBfA
        EaVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9nk5Kak1mWWqRvl6CX8Wdr
        asFRoYpn3T/ZGxg/83UxcnJICJhIfDyzjQXEFhJYyihxY45QFyMHUFxKYn6LEkSJsMSfa11s
        XYxcQCWvGSWabk1nB0kIC/hITG34xwZiiwiISdye08kMUsQs8JhJouPRGUaIjoOMEpN/vWMG
        qWITMJToPdrHCGLzCthJ7Lw0G8xmEVCVWHx1KtgkUYEIicM7ZkHVCEqcnPkE7DpOARuJrYf2
        gc1hFlCX+DPvEpQtLtH0ZSUrhC0vsf3tHOYJjEKzkLTPQtIyC0nLLCQtCxhZVjGKpJYW56bn
        FhvpFSfmFpfmpesl5+duYgRG9bZjP7fsYOx6F3yIUYCDUYmHV+JsQ6wQa2JZcWXuIUYJDmYl
        Ed6A2vpYId6UxMqq1KL8+KLSnNTiQ4ymQM9NZJYSTc4HJpy8knhDU0NzC0tDc2NzYzMLJXHe
        DoGDMUIC6YklqdmpqQWpRTB9TBycUg2ME8VeRrE6H4sV38d5Vc1P1U8prSprzoeQMxvb8iu1
        3YKOiPSE68YpLfzkdJ/r8vS8g7d904uM5h9Z+HdZ0JGQeZdz9Cp+O2yuOTT1+L48k8qLhdrR
        rxwm3vA5F7sq6Iy5yq27TDOM2Da/Dud811P9P8DSrqt56y4tpshnR9qczzzkCf2QerFXiaU4
        I9FQi7moOBEA69LGWgADAAA=
X-CMS-MailID: 20190918105930eucas1p267a84aa997cabf559ecdba8a948f698c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
        <CGME20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce@eucas1p1.samsung.com>
        <20190918104634.15216-3-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Cc: lee.jones@linaro.org

Excuse me Lee, I forgot to Cc entire series to you, will do it in case
of posting v2.

On 9/18/19 12:46, Sylwester Nawrocki wrote:
> The WM1811/WM8994/WM8958 audio CODEC DT bindings specify two optional
> clocks: "MCLK1", "MCLK2". Add code for getting those clocks in the MFD
> part of the wm8994 driver so they can be further handled in the audio
> CODEC part.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  drivers/mfd/wm8994-core.c       | 9 +++++++++
>  include/linux/mfd/wm8994/core.h | 9 +++++++++
>  2 files changed, 18 insertions(+)
> 
> diff --git a/drivers/mfd/wm8994-core.c b/drivers/mfd/wm8994-core.c
> index 1e9fe7d92597..02c19a0bdeb0 100644
> --- a/drivers/mfd/wm8994-core.c
> +++ b/drivers/mfd/wm8994-core.c
> @@ -7,6 +7,7 @@
>   * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
>   */
>  
> +#include <linux/clk.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/slab.h>
> @@ -333,6 +334,14 @@ static int wm8994_device_init(struct wm8994 *wm8994, int irq)
>  
>  	dev_set_drvdata(wm8994->dev, wm8994);
>  
> +	wm8994->mclk[WM8994_MCLK1].id = "MCLK1";
> +	wm8994->mclk[WM8994_MCLK2].id = "MCLK2";
> +
> +	ret = devm_clk_bulk_get_optional(wm8994->dev, ARRAY_SIZE(wm8994->mclk),
> +					 wm8994->mclk);
> +	if (ret != 0)
> +		return ret;
> +
>  	/* Add the on-chip regulators first for bootstrapping */
>  	ret = mfd_add_devices(wm8994->dev, 0,
>  			      wm8994_regulator_devs,
> diff --git a/include/linux/mfd/wm8994/core.h b/include/linux/mfd/wm8994/core.h
> index e8b093522ffd..320297a1b70c 100644
> --- a/include/linux/mfd/wm8994/core.h
> +++ b/include/linux/mfd/wm8994/core.h
> @@ -10,12 +10,19 @@
>  #ifndef __MFD_WM8994_CORE_H__
>  #define __MFD_WM8994_CORE_H__
>  
> +#include <linux/clk.h>
>  #include <linux/mutex.h>
>  #include <linux/interrupt.h>
>  #include <linux/regmap.h>
>  
>  #include <linux/mfd/wm8994/pdata.h>
>  
> +enum {
> +	WM8994_MCLK1,
> +	WM8994_MCLK2,
> +	WM8994_NUM_MCLK
> +};
> +
>  enum wm8994_type {
>  	WM8994 = 0,
>  	WM8958 = 1,
> @@ -60,6 +67,8 @@ struct wm8994 {
>  	struct device *dev;
>  	struct regmap *regmap;
>  
> +	struct clk_bulk_data mclk[WM8994_NUM_MCLK];
> +
>  	bool ldo_ena_always_driven;
>  
>  	int gpio_base;
 -- 
Regards,
Sylwester
