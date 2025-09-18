Return-Path: <linux-samsung-soc+bounces-10098-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 65456B29E07
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 18 Aug 2025 11:35:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 62111189CDD5
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 18 Aug 2025 09:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D462430E833;
	Mon, 18 Aug 2025 09:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WEvCwHrt"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3473B27A477;
	Mon, 18 Aug 2025 09:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755509457; cv=none; b=KRYGbxOwqnWvwz5ucan5hH/1kDFunZny6qQIEIdreCn+zqMC7B8ZdjEABPKBIJS/5JITHuL8vNMoGR0o+IgmFxBtIJ++iJeZg9IoxPn178JF2Wab5mylEGNSVBhS9dFBN4Aff8iWDSGJ6eQNu8nOEOSR3oUglyAy5W5oSKP1Ico=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755509457; c=relaxed/simple;
	bh=H/RXtCGHHBQ1De/TaksVJ3qWD5+W1hECG5Q6BNf8hho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kD/BnymMtDxQudn6FXKj0Kr99LOa1scjkxzQRUeFHDoQpgWYzwgS4P8bVmWAhu/QXArkxgW/Z7fGAJ87Sfor9yVu3T2dq4u+LXnyP+YWT7eBhKJqOHaRFn3NGRYqR3nFg7fmSeTIGYYrqUfQI6R7yEzEdR7mjnYNrwyk5j9ck04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WEvCwHrt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A84E817D1;
	Mon, 18 Aug 2025 11:29:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755509395;
	bh=H/RXtCGHHBQ1De/TaksVJ3qWD5+W1hECG5Q6BNf8hho=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WEvCwHrtO2zW5f35Nzm4LD1pik4x3m01g/rzVvq5amdOzMDfxcHEbM1SBjhuZlUbn
	 cdHrFSzhbRD36iU9dU+fKvvVVshrRm+mbJ8cLFex0lqSZnIQV0Ha12azlU7PpeCFla
	 GIGsF+cQc6JPBw8OXJRgPKDt1IUfesZndTSM1xpY=
Date: Mon, 18 Aug 2025 12:30:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Inbaraj E <inbaraj.e@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
	cw00.choi@samsung.com, rmfrfs@gmail.com, martink@posteo.de,
	mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org,
	catalin.marinas@arm.com, pankaj.dubey@samsung.com,
	shradha.t@samsung.com, ravi.patel@samsung.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org, kernel@puri.sm,
	kernel@pengutronix.de, festevam@gmail.com,
	linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 08/12] media: imx-mipi-csis: Add support to dump all
 vc regs
Message-ID: <20250818093030.GB5862@pendragon.ideasonboard.com>
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
 <CGME20250814141041epcas5p2b281659391a8e45c95e8db21d9867f98@epcas5p2.samsung.com>
 <20250814140943.22531-9-inbaraj.e@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250814140943.22531-9-inbaraj.e@samsung.com>

Hi Inbaraj,

Please see [1] and in particular [2]. I would like to get that series
merged for v6.18, but it's missing reviews. If you want to speed it up,
you can review the patches :-)

[1] https://lore.kernel.org/linux-media/20250608235840.23871-1-laurent.pinchart@ideasonboard.com
[2] https://lore.kernel.org/linux-media/20250608235840.23871-9-laurent.pinchart@ideasonboard.com/

On Thu, Aug 14, 2025 at 07:39:39PM +0530, Inbaraj E wrote:
> Extend support to dump all 4 virtual channel register.
> 
> Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 4f6c417fdf58..c1653a738854 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -876,11 +876,26 @@ static int mipi_csis_dump_regs(struct mipi_csis_device *csis)
>  		{ MIPI_CSIS_DPHY_SCTRL_L, "DPHY_SCTRL_L" },
>  		{ MIPI_CSIS_DPHY_SCTRL_H, "DPHY_SCTRL_H" },
>  		{ MIPI_CSIS_ISP_CONFIG_CH(0), "ISP_CONFIG_CH0" },
> +		{ MIPI_CSIS_ISP_CONFIG_CH(1), "ISP_CONFIG_CH1" },
> +		{ MIPI_CSIS_ISP_CONFIG_CH(2), "ISP_CONFIG_CH2" },
> +		{ MIPI_CSIS_ISP_CONFIG_CH(3), "ISP_CONFIG_CH3" },
>  		{ MIPI_CSIS_ISP_RESOL_CH(0), "ISP_RESOL_CH0" },
> +		{ MIPI_CSIS_ISP_RESOL_CH(1), "ISP_RESOL_CH1" },
> +		{ MIPI_CSIS_ISP_RESOL_CH(2), "ISP_RESOL_CH2" },
> +		{ MIPI_CSIS_ISP_RESOL_CH(3), "ISP_RESOL_CH3" },
>  		{ MIPI_CSIS_SDW_CONFIG_CH(0), "SDW_CONFIG_CH0" },
> +		{ MIPI_CSIS_SDW_CONFIG_CH(1), "SDW_CONFIG_CH1" },
> +		{ MIPI_CSIS_SDW_CONFIG_CH(2), "SDW_CONFIG_CH2" },
> +		{ MIPI_CSIS_SDW_CONFIG_CH(3), "SDW_CONFIG_CH3" },
>  		{ MIPI_CSIS_SDW_RESOL_CH(0), "SDW_RESOL_CH0" },
> +		{ MIPI_CSIS_SDW_RESOL_CH(1), "SDW_RESOL_CH1" },
> +		{ MIPI_CSIS_SDW_RESOL_CH(2), "SDW_RESOL_CH2" },
> +		{ MIPI_CSIS_SDW_RESOL_CH(3), "SDW_RESOL_CH3" },
>  		{ MIPI_CSIS_DBG_CTRL, "DBG_CTRL" },
>  		{ MIPI_CSIS_FRAME_COUNTER_CH(0), "FRAME_COUNTER_CH0" },
> +		{ MIPI_CSIS_FRAME_COUNTER_CH(1), "FRAME_COUNTER_CH1" },
> +		{ MIPI_CSIS_FRAME_COUNTER_CH(2), "FRAME_COUNTER_CH2" },
> +		{ MIPI_CSIS_FRAME_COUNTER_CH(3), "FRAME_COUNTER_CH3" },
>  	};
>  
>  	unsigned int i;

-- 
Regards,

Laurent Pinchart

