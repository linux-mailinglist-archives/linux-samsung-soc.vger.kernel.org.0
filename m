Return-Path: <linux-samsung-soc+bounces-10780-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A977B45A02
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  5 Sep 2025 16:03:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B482F189008A
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  5 Sep 2025 14:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0EFC21A94F;
	Fri,  5 Sep 2025 14:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="Y7XQg9kd"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4C41B6CE9
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Sep 2025 14:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757081018; cv=none; b=tyf8MeHd0tKNAEBdI3LFTuzv/mKUzm5wAyWogX8CKfxkv4G0YW+ycU5+ydiT5q91o6Cv6EpgC/nZkwp2Ra5wNlXB2bEuk/TUdMCarUTezEqG9eW3TT7jcIg/rU8YupB52AJZndEMxD9avqEPAWL46qf0HJu5KwlFPur17etEHgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757081018; c=relaxed/simple;
	bh=4VunLHBUSPg3OMPYQMbCn3DpKDzlN27XaQpTrbxFlNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRT6d2Hv1zjh+/7rz//dNOkdX5ceCcLze7oLxjkxg/0XZ5O/apd12C4sKPy3P4lAgskGLEwMsExVg0EIv20VuO32v98tCxcVHi7l405nLRB4iXqGz9gXMSIlbxEy1QJmEMxClLkf5OqPzjzS+kVhRA5gvG//iq77AVHwMXvxhIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=Y7XQg9kd; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Date: Fri, 5 Sep 2025 16:03:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1757081012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pHrbfJsFTJtcfhWQl6NCYp9f9xBnKlKEDQu9bt20xOk=;
	b=Y7XQg9kdnXVjuWUHRzKxV63SoEx/duSSyJs0vjanJAObcAX0hS9bYMSlhZVt7oXu4aV2Hk
	rKgxeHzndAoiDqJb4/+tFqgS/CpqoWL42h8ep36RUHPJiOJqhtIYrNoQwGLnarzARSmao5
	0hPAmCX41cnODwZl5tuYAFh+1VtiWIQ=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Devang Tailor <dev.tailor@samsung.com>
Cc: alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, alim.akhtar@samsung.com,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	faraz.ata@samsung.com
Subject: Re: [PATCH v3 2/3] rtc: s3c: support for exynosautov9 on-chip RTC
Message-ID: <20250905140318.GA14745@grimfrac.localdomain>
References: <20250905110554.2212304-1-dev.tailor@samsung.com>
 <CGME20250905105712epcas5p35b5f24b8570c050b7ee675cb26f8ce43@epcas5p3.samsung.com>
 <20250905110554.2212304-3-dev.tailor@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250905110554.2212304-3-dev.tailor@samsung.com>
X-Migadu-Flow: FLOW_OUT

Hi Devang,

On Fri, Sep 05, 2025 at 04:35:53PM +0530, Devang Tailor wrote:
> The on-chip RTC of this SoC is almost similar to the previous version of
> SoCs except for S3C2410_TICNT tick time counter, which is used in this
> driver but not applicable for exynosautov9. So re-use the existing driver
> skipping disablement of S3C2410_TICNT in s3c24xx_rtc_disable() callback
> via a new boolean member of s3c_rtc_data.
> 
> This has been tested with 'hwclock' & 'date' utilities
> 
> Suggested-by: Henrik Grimler <henrik@grimler.se>
> Signed-off-by: Devang Tailor <dev.tailor@samsung.com>

Reviewed-by: Henrik Grimler <henrik@grimler.se>

Thank you, looks good!

Best regards,
Henrik Grimler

> ---
>  drivers/rtc/rtc-s3c.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index 79b2a16f15ad..8fc5b4582b6d 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -48,6 +48,7 @@ struct s3c_rtc {
>  
>  struct s3c_rtc_data {
>  	bool needs_src_clk;
> +	bool use_s3c2410_ticnt;
>  
>  	void (*irq_handler) (struct s3c_rtc *info, int mask);
>  	void (*enable) (struct s3c_rtc *info);
> @@ -369,9 +370,11 @@ static void s3c24xx_rtc_disable(struct s3c_rtc *info)
>  	con &= ~S3C2410_RTCCON_RTCEN;
>  	writew(con, info->base + S3C2410_RTCCON);
>  
> -	con = readb(info->base + S3C2410_TICNT);
> -	con &= ~S3C2410_TICNT_ENABLE;
> -	writeb(con, info->base + S3C2410_TICNT);
> +	if (info->data->use_s3c2410_ticnt) {
> +		con = readb(info->base + S3C2410_TICNT);
> +		con &= ~S3C2410_TICNT_ENABLE;
> +		writeb(con, info->base + S3C2410_TICNT);
> +	}
>  }
>  
>  static void s3c6410_rtc_disable(struct s3c_rtc *info)
> @@ -550,18 +553,21 @@ static void s3c6410_rtc_irq(struct s3c_rtc *info, int mask)
>  }
>  
>  static const struct s3c_rtc_data s3c2410_rtc_data = {
> +	.use_s3c2410_ticnt	= true,
>  	.irq_handler		= s3c24xx_rtc_irq,
>  	.enable			= s3c24xx_rtc_enable,
>  	.disable		= s3c24xx_rtc_disable,
>  };
>  
>  static const struct s3c_rtc_data s3c2416_rtc_data = {
> +	.use_s3c2410_ticnt	= true,
>  	.irq_handler		= s3c24xx_rtc_irq,
>  	.enable			= s3c24xx_rtc_enable,
>  	.disable		= s3c24xx_rtc_disable,
>  };
>  
>  static const struct s3c_rtc_data s3c2443_rtc_data = {
> +	.use_s3c2410_ticnt	= true,
>  	.irq_handler		= s3c24xx_rtc_irq,
>  	.enable			= s3c24xx_rtc_enable,
>  	.disable		= s3c24xx_rtc_disable,
> @@ -574,6 +580,12 @@ static const struct s3c_rtc_data s3c6410_rtc_data = {
>  	.disable		= s3c6410_rtc_disable,
>  };
>  
> +static const struct s3c_rtc_data exynosautov9_rtc_data = {
> +	.irq_handler		= s3c6410_rtc_irq,
> +	.enable			= s3c24xx_rtc_enable,
> +	.disable		= s3c24xx_rtc_disable,
> +};
> +
>  static const __maybe_unused struct of_device_id s3c_rtc_dt_match[] = {
>  	{
>  		.compatible = "samsung,s3c2410-rtc",
> @@ -590,6 +602,9 @@ static const __maybe_unused struct of_device_id s3c_rtc_dt_match[] = {
>  	}, {
>  		.compatible = "samsung,exynos3250-rtc",
>  		.data = &s3c6410_rtc_data,
> +	}, {
> +		.compatible = "samsung,exynosautov9-rtc",
> +		.data = &exynosautov9_rtc_data,
>  	},
>  	{ /* sentinel */ },
>  };
> -- 
> 2.34.1
> 

