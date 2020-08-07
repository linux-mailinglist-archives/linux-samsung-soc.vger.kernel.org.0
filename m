Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DBCE23E874
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  7 Aug 2020 10:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgHGIBI (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 7 Aug 2020 04:01:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:53846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725805AbgHGIBG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 7 Aug 2020 04:01:06 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8A25C20866;
        Fri,  7 Aug 2020 08:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596787265;
        bh=xUgnM0/zA2UWr+I99OfNrHfnZYFJtBUMEUvz2VyQjUY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=J0N3GNdGbqKbNGf7d1vTseLpvgl8Bw+85/lL4NHPbp+Aqw7bcaIYnkzLTGDbgFoCK
         yej6ElsbfSHdTCIC2sWmalZH8PJifSbKWW5xVlUdSfMf8WHXeU3BWxEDjrvmAAGzo1
         3Z6DITpk1GAAiyzLdUJwNMXnXyTE8aXS9LdgBRw8=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1k3xJI-000SA0-37; Fri, 07 Aug 2020 09:01:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 07 Aug 2020 09:01:03 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 21/41] ARM: s3c24xx: move irqchip driver back into
 platform
In-Reply-To: <20200806182059.2431-21-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org>
 <20200806182059.2431-21-krzk@kernel.org>
User-Agent: Roundcube Webmail/1.4.5
Message-ID: <35c4ebb133e6b885abe1a0c07988599f@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: krzk@kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de, linux@armlinux.org.uk, tglx@linutronix.de, jason@lakedaemon.net, kgene@kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 2020-08-06 19:20, Krzysztof Kozlowski wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> It was a good idea to move it out at first, but the irqchip code
> is still tightly connected to the s3c24xx platform code and uses
> multiple internal header files, so just move it back for the
> time being to avoid those dependencies.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/mach-s3c24xx/Makefile                           | 1 +
>  {drivers/irqchip => arch/arm/mach-s3c24xx}/irq-s3c24xx.c | 0
>  drivers/irqchip/Makefile                                 | 1 -
>  3 files changed, 1 insertion(+), 1 deletion(-)
>  rename {drivers/irqchip => arch/arm/mach-s3c24xx}/irq-s3c24xx.c (100%)
> 
> diff --git a/arch/arm/mach-s3c24xx/Makefile 
> b/arch/arm/mach-s3c24xx/Makefile
> index 6692f2de71b2..8c31f84f8c97 100644
> --- a/arch/arm/mach-s3c24xx/Makefile
> +++ b/arch/arm/mach-s3c24xx/Makefile
> @@ -8,6 +8,7 @@
>  # core
> 
>  obj-y				+= common.o
> +obj-y				+= irq-s3c24xx.o
> 
>  obj-$(CONFIG_CPU_S3C2410)	+= s3c2410.o
>  obj-$(CONFIG_S3C2410_PLL)	+= pll-s3c2410.o
> diff --git a/drivers/irqchip/irq-s3c24xx.c 
> b/arch/arm/mach-s3c24xx/irq-s3c24xx.c
> similarity index 100%
> rename from drivers/irqchip/irq-s3c24xx.c
> rename to arch/arm/mach-s3c24xx/irq-s3c24xx.c
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index 133f9c45744a..8c983ad774f6 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -16,7 +16,6 @@ obj-$(CONFIG_ARCH_LPC32XX)		+= irq-lpc32xx.o
>  obj-$(CONFIG_ARCH_MMP)			+= irq-mmp.o
>  obj-$(CONFIG_IRQ_MXS)			+= irq-mxs.o
>  obj-$(CONFIG_ARCH_TEGRA)		+= irq-tegra.o
> -obj-$(CONFIG_ARCH_S3C24XX)		+= irq-s3c24xx.o
>  obj-$(CONFIG_DW_APB_ICTL)		+= irq-dw-apb-ictl.o
>  obj-$(CONFIG_CLPS711X_IRQCHIP)		+= irq-clps711x.o
>  obj-$(CONFIG_OMPIC)			+= irq-ompic.o

Acked-by: Marc Zyngier <maz@kernel.org>

          M.
-- 
Jazz is not dead. It just smells funny...
