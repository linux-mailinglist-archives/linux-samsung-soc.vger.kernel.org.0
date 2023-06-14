Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CEAAD71302A
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 27 May 2023 00:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230414AbjEZWv0 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 26 May 2023 18:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbjEZWv0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 26 May 2023 18:51:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42AC69C
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 May 2023 15:51:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D260461635
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 May 2023 22:51:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C2DC433D2;
        Fri, 26 May 2023 22:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685141484;
        bh=KB1Gh+O8wAuob333ceFy3Z4JXPobhK0qO+StZs+fgG8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qIa14cNrsj+P9SgjGO5qp8hyeooC+OhInHf/6JMRtTvZpf6EIHDfjtr8Jy5daOESJ
         YiK2V5Mhj1evYjLuTgCemLrvq4AqCE74+ojGESHwQBFUhFp+WONlrGt/APKEuScbZD
         J3CI4n3qOLO5cd2xJiJRAC/mFIe3NIl1hZ1hlITsiaB/EZZAm3taYbhoA0YnliOird
         kgZoGXPmDm2ovF8R/KnBMKj4fePA+aLQDiHpeYrFmLkBu7Os6EYTN3boDonw6fF4MG
         8SBLr427Q+49oX2p+9oCqtKt8+/BiUT0z9++VKprtzcpdv6mVfl6tD1/Y5w3UCBwlx
         T1ryd/ElgMuZg==
Date:   Sat, 27 May 2023 00:51:20 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Russell King <linux@armlinux.org.uk>,
        patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] ARM: s3c: Switch i2c drivers back to use .probe()
Message-ID: <20230526225120.rhgjukx5uyqmmj66@intel.intel>
References: <20230526214003.2134595-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230526214003.2134595-1-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Uwe,

On Fri, May 26, 2023 at 11:40:03PM +0200, Uwe Kleine-K�nig wrote:
> After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
> call-back type"), all drivers being converted to .probe_new() and then
> 03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
> convert back to (the new) .probe() to be able to eventually drop
> .probe_new() from struct i2c_driver.
> 
> Signed-off-by: Uwe Kleine-K�nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi

> ---
>  arch/arm/mach-s3c/mach-crag6410-module.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-s3c/mach-crag6410-module.c b/arch/arm/mach-s3c/mach-crag6410-module.c
> index 4edde13b89b5..8fce1e815ee8 100644
> --- a/arch/arm/mach-s3c/mach-crag6410-module.c
> +++ b/arch/arm/mach-s3c/mach-crag6410-module.c
> @@ -418,7 +418,7 @@ static struct i2c_driver wlf_gf_module_driver = {
>  	.driver = {
>  		.name = "wlf-gf-module"
>  	},
> -	.probe_new = wlf_gf_module_probe,
> +	.probe = wlf_gf_module_probe,
>  	.id_table = wlf_gf_module_id,
>  };
>  
> 
> base-commit: ac9a78681b921877518763ba0e89202254349d1b
> -- 
> 2.39.2
> 
