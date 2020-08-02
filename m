Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B91CD235A8C
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  2 Aug 2020 22:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726536AbgHBUmj (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 2 Aug 2020 16:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbgHBUmj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 2 Aug 2020 16:42:39 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49377C06174A;
        Sun,  2 Aug 2020 13:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
        Reply-To:Cc:Content-ID:Content-Description;
        bh=v7okBghMo2AteEJTPGTY9KCeJL7oZdpEAZt/o6Oye7g=; b=f9sNyyLwyi6RgjrtzJp6BVKqEA
        3iXhZ65TfR7O/R+/qUO/hgKAflRiLt1Oag5667tH+bPI3thnW0YtVXuVud6Nk++k8fttRSznLSWJ+
        +5VhPUz05rFP6TVL7GZjRyS44Lqg8hEY/Dxf+d6N4bmue5lAUay5fWz/0Lc3+K958AU0Pa5gZs0qO
        2JpAuOkStk3Ci4IL9ePYF1WMJkhSIysGK6FnU0Js6M6jGqyVEq3yoj72r7avOv7F/gmj6RkCFQ6KZ
        Q/aqG12Ka3pD9+dugfb0XJt2ayM85xzONxlIV1ZDz9Nk1hV5FUf8WPGxv4PjLbnQm1iWsATMKCkNs
        S2lg4Xqg==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k2KoW-0001SL-51; Sun, 02 Aug 2020 20:42:36 +0000
Subject: Re: [PATCH] ARM: s3c24xx: demote kerneldoc comment
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200802203605.15125-1-krzk@kernel.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <4c8c1fe5-6212-57eb-7644-174ace5d3622@infradead.org>
Date:   Sun, 2 Aug 2020 13:42:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200802203605.15125-1-krzk@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 8/2/20 1:36 PM, Krzysztof Kozlowski wrote:
> Remove kerneldoc annotation to fix warning:
> 
>     arch/arm/mach-s3c24xx/mach-h1940.c:185: warning:
>         cannot understand function prototype: 'struct s3c2410fb_display h1940_lcd __initdata = '
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/mach-s3c24xx/mach-h1940.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
> index 89528bea89f1..c09f61d35d57 100644
> --- a/arch/arm/mach-s3c24xx/mach-h1940.c
> +++ b/arch/arm/mach-s3c24xx/mach-h1940.c
> @@ -179,9 +179,9 @@ static struct s3c2410_ts_mach_info h1940_ts_cfg __initdata = {
>  		.cfg_gpio = s3c24xx_ts_cfg_gpio,
>  };
>  
> -/**
> +/*
>   * Set lcd on or off
> - **/
> + */

Yes, that's not kernel-doc notation, so demote it.
Acked-by: Randy Dunlap <rdunlap@infradead.org>


OTOH, we could also add "__initdata" to something that can be
handled by scripts/kernel-doc if it's needed, but it doesn't seem to
be needed just yet.

>  static struct s3c2410fb_display h1940_lcd __initdata = {
>  	.lcdcon5=	S3C2410_LCDCON5_FRM565 | \
>  			S3C2410_LCDCON5_INVVLINE | \
> 

thanks.
-- 
~Randy

