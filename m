Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AACDD230A90
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 28 Jul 2020 14:47:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729806AbgG1MrP (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 28 Jul 2020 08:47:15 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:36743 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729576AbgG1MrL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Jul 2020 08:47:11 -0400
Received: by mail-ed1-f68.google.com with SMTP id c15so5056458edj.3;
        Tue, 28 Jul 2020 05:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=T/pqmbhLh7sKGJACzLPiIlQzkqQ8XjFefTZhyBvXBXA=;
        b=P1tumZy99UaJrzhb/iV9NVe/+Oc6ycDDWE3D04ml/nkJcVroeiQyMJkmp2XKChbqpZ
         F/KC4mn9Et9TiYX0ld0Hhp0M5ZDmdsge8ux/Ckfni3iDBDYPoSk5RMKp5aOxg/gXNA2D
         Mu1bTkGy9s/KARPwzmV+8oZ4uOOZtuBTgcos/FShLRjLwRXA2EBES68gvfrefcsmosj7
         PIIUqnq4q2HUkBRR0XiWoGhJjGkIRCMcgpXmOJQQK1PChwU8QiBK3ij4kOutIUiX52aU
         57h2FnfopyFaojmjaCWHz2A4zdpSn4KhiDca3UUMTGzV2imdU9FUZXLvV4lN+iOhxi4q
         R8mA==
X-Gm-Message-State: AOAM533d7VAwGC2ReB4JLNKvwLV1fWn+Y11nP0avvQXrKoR07+hbwLXW
        66eD2p8U34Lejr5dOJRk4UY=
X-Google-Smtp-Source: ABdhPJxqpRPRTtJr4gwvC8HABlrPkJOd0W1I02Qx/TUd4FrazEXvNoO6XEeihc+npOZ43QoBZUN7zw==
X-Received: by 2002:a05:6402:1a54:: with SMTP id bf20mr14060285edb.217.1595940429122;
        Tue, 28 Jul 2020 05:47:09 -0700 (PDT)
Received: from kozik-lap ([194.230.155.213])
        by smtp.googlemail.com with ESMTPSA id c7sm8221178ejr.77.2020.07.28.05.47.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 05:47:08 -0700 (PDT)
Date:   Tue, 28 Jul 2020 14:47:06 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Qinglang Miao <miaoqinglang@huawei.com>
Cc:     Kukjin Kim <kgene@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] ARM: s3c: fix return value check in
 s3c_usb_otgphy_init()
Message-ID: <20200728124706.GA32233@kozik-lap>
References: <20200728022756.87687-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200728022756.87687-1-miaoqinglang@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Jul 28, 2020 at 10:27:56AM +0800, Qinglang Miao wrote:
> the function clk_get() returns ERR_PTR() in case of error and
> never returns NULL. So there's no need to test whether xusbxti
> is NULL, just remove the redundant part in the return value check.
> 
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>  arch/arm/mach-s3c64xx/setup-usb-phy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Looks good, thanks. I don't plan to take anything before merge window
(it is quite late in the cycle) so I will apply it after the window.

Best regards,
Krzysztof

> diff --git a/arch/arm/mach-s3c64xx/setup-usb-phy.c b/arch/arm/mach-s3c64xx/setup-usb-phy.c
> index d6b0e3b26..99d743884 100644
> --- a/arch/arm/mach-s3c64xx/setup-usb-phy.c
> +++ b/arch/arm/mach-s3c64xx/setup-usb-phy.c
> @@ -31,7 +31,7 @@ static int s3c_usb_otgphy_init(struct platform_device *pdev)
>  	phyclk = readl(S3C_PHYCLK) & ~S3C_PHYCLK_CLKSEL_MASK;
>  
>  	xusbxti = clk_get(&pdev->dev, "xusbxti");
> -	if (xusbxti && !IS_ERR(xusbxti)) {
> +	if (!IS_ERR(xusbxti)) {
>  		switch (clk_get_rate(xusbxti)) {
>  		case 12 * MHZ:
>  			phyclk |= S3C_PHYCLK_CLKSEL_12M;
> -- 
> 2.25.1
> 
