Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36C4FB7485
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 19 Sep 2019 09:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731281AbfISH7a (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 19 Sep 2019 03:59:30 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50591 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731156AbfISH73 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 03:59:29 -0400
Received: by mail-wm1-f65.google.com with SMTP id 5so3197630wmg.0;
        Thu, 19 Sep 2019 00:59:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=yy/C8I+qsXanLkKnOE9DEzrTwx4wGS6sU0a5cnC4r3Y=;
        b=Uq2amqzSBa5AiEgRoJuzjZimVzoctiCVQvxWXNBSK3ewRM8TAz43RLt1pZh4Gh5nId
         TDe/VSXMwdFK9ANuBhVjL/uMwiRmIIjPb0iQFJ7fc3j/kzT+WThc2Doa7LCLo3Jrm/YF
         V4KLDUvQDoDXXD510rkOUOCMaxbkRcfitCNC11vgmq1xAKhnKCJstTbyVpd3xCiQmNQF
         C0EJ0vZhwHyUMj9WDVQ4JLkzktrzV/cbW6LAdm/NQmPWdZRovgsmjUFk038wYP5BydBN
         R9ijuAE+c0X4cdfP2QL/3nC5t4NSkAeHU9MS0AUmrk+7pU0tlGk22RzfIGcQRV7TzQG5
         2otw==
X-Gm-Message-State: APjAAAU8Jve7jZjbRJDcbuvV8SBfDD59tfdlV7mRkUq6mg9UPa6TrafK
        p/nqr79SNs4VG1/XNojVuHA=
X-Google-Smtp-Source: APXvYqy2o5grp6Rt7mjN78sEBbbA8GDZ94gEvftdESomIA11VKGYguGkQaar5ppls9OkNxJQa4i9kg==
X-Received: by 2002:a1c:8097:: with SMTP id b145mr1641289wmd.29.1568879967329;
        Thu, 19 Sep 2019 00:59:27 -0700 (PDT)
Received: from pi3 ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id q22sm3339362wmj.5.2019.09.19.00.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2019 00:59:26 -0700 (PDT)
Date:   Thu, 19 Sep 2019 09:59:24 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     broonie@kernel.org, lgirdwood@gmail.com,
        ckeepax@opensource.cirrus.com, sbkim73@samsung.com,
        alsa-devel@alsa-project.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
Subject: Re: [PATCH v1 2/9] mfd: wm8994: Add support for MCLKn clock control
Message-ID: <20190919075924.GB13195@pi3>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce@eucas1p1.samsung.com>
 <20190918104634.15216-3-s.nawrocki@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190918104634.15216-3-s.nawrocki@samsung.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Sep 18, 2019 at 12:46:27PM +0200, Sylwester Nawrocki wrote:
> The WM1811/WM8994/WM8958 audio CODEC DT bindings specify two optional
> clocks: "MCLK1", "MCLK2". Add code for getting those clocks in the MFD
> part of the wm8994 driver so they can be further handled in the audio
> CODEC part.

I think these are needed only for the codec so how about getting them in
codec's probe?

Best regards,
Krzysztof


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
> -- 
> 2.17.1
> 
