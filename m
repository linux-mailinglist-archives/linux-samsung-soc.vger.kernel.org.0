Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CAE84A93F7
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  4 Sep 2019 22:44:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730197AbfIDUoj (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 4 Sep 2019 16:44:39 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45304 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727544AbfIDUoi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 16:44:38 -0400
Received: by mail-pl1-f196.google.com with SMTP id x3so71964plr.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Sep 2019 13:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vZGgKk8jeW8NM2wT+HTq6+KHx26Kcf2Hd/HdxeR6J0c=;
        b=TzzsMJ3gWG917Iis4NdDhBIHth4GqtK3/sv+X2gQXSJdeB0qEqMFs9o843HMPvOYUn
         vxtcCBUDaWeRrnOi1h22RIfgxWB3iIQod31jZJoOVeGfutT9zeffgawMOBlMyWm9nSwy
         YYRmz4yz3DSBRuxsOrQNDlVkq2BDtx9qG5bw/7teX4Y2Jiv+jUIX5DTvPqMzRVOzI9X5
         4aJ+GjJekgkZ7uptwZX/lTBColHi+7J8HLkvOOdJeAxLEmtHbAncsA81jTFaDEk/tFKN
         czMqG3CwBQQXU35NXerVTyXs4EAwGQjCKS5/StfvvxlCQdQ0G6qjrLlu6glTZVxMY3++
         m0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vZGgKk8jeW8NM2wT+HTq6+KHx26Kcf2Hd/HdxeR6J0c=;
        b=DGDUWqhftpz+AinT7bCfPkd8EFL4vUsKqclolTrFm34f8R/CScr4pbnFJgF8tSiCpG
         Y3VKBaFHunbxFFXYTnuD3/gIyDHcCTzpvyyjMbXOKv+5uknTfi87bi7wd7bCpo94k/NG
         AoROUfvd1z4kbNOgMgSJ6HjcAKz+fRNtvCxDiRfiTu7HREbL5IPzBtxw8qlMPdPKsZ5g
         vGF346wqb3cbseA9XBYgCQ9vdWdSoOwLBqDkQS9aZwgKO4bUwoiSYgX09gBP6tvlQqZt
         M1dKWl/YBwM8zF+MMIetF16KZK2nbDjQp4J9umx3f9WidOlPHiGSsc39OaaTtucN3w8k
         vurg==
X-Gm-Message-State: APjAAAXVOxMJ6yUKNEk6CUWCrveD7Y/EafBueVKHSE9yiLUHEUSmhX5p
        M6bCnFylsEjqTItE8rxtQb57+w==
X-Google-Smtp-Source: APXvYqx4qZrRLrrr0VmXx5Jsx7rH4OjMuKZvmx+AszzG5hedxbJVd30/b6Bg8l9gTJn3rOqOMRdQqA==
X-Received: by 2002:a17:902:7b82:: with SMTP id w2mr41037414pll.250.1567629878103;
        Wed, 04 Sep 2019 13:44:38 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r187sm19257078pfc.105.2019.09.04.13.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2019 13:44:37 -0700 (PDT)
Date:   Wed, 4 Sep 2019 13:44:33 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     broonie@kernel.org, f.fainelli@gmail.com, rjui@broadcom.com,
        sbranden@broadcom.com, eric@anholt.net, wahrenst@gmx.net,
        shc_work@mail.ru, agross@kernel.org, khilman@baylibre.com,
        matthias.bgg@gmail.com, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, avifishman70@gmail.com, tmaimon77@gmail.com,
        tali.perry1@gmail.com, venture@google.com, yuenn@google.com,
        benjaminfair@google.com, kgene@kernel.org, krzk@kernel.org,
        andi@etezian.org, palmer@sifive.com, paul.walmsley@sifive.com,
        baohua@kernel.org, mripard@kernel.org, wens@csie.org,
        ldewangan@nvidia.com, thierry.reding@gmail.com,
        jonathanh@nvidia.com, yamada.masahiro@socionext.com,
        michal.simek@xilinx.com, bcm-kernel-feedback-list@broadcom.com,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
        linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH -next 13/36] spi: spi-geni-qcom: use
 devm_platform_ioremap_resource() to simplify code
Message-ID: <20190904204433.GE580@tuxbook-pro>
References: <20190904135918.25352-1-yuehaibing@huawei.com>
 <20190904135918.25352-14-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904135918.25352-14-yuehaibing@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed 04 Sep 06:58 PDT 2019, YueHaibing wrote:

> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/spi/spi-geni-qcom.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
> index 242b6c8..6f3d64a 100644
> --- a/drivers/spi/spi-geni-qcom.c
> +++ b/drivers/spi/spi-geni-qcom.c
> @@ -534,7 +534,6 @@ static int spi_geni_probe(struct platform_device *pdev)
>  	int ret, irq;
>  	struct spi_master *spi;
>  	struct spi_geni_master *mas;
> -	struct resource *res;
>  	void __iomem *base;
>  	struct clk *clk;
>  
> @@ -542,8 +541,7 @@ static int spi_geni_probe(struct platform_device *pdev)
>  	if (irq < 0)
>  		return irq;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	base = devm_ioremap_resource(&pdev->dev, res);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> -- 
> 2.7.4
> 
> 
