Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84761221BC7
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 16 Jul 2020 07:11:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbgGPFLX (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 16 Jul 2020 01:11:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:56096 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725268AbgGPFLX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Jul 2020 01:11:23 -0400
Received: from localhost (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A226F207BC;
        Thu, 16 Jul 2020 05:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594876282;
        bh=fVIx7exM1IL4il1EvPnQv2j2V1fBwT20/XpSLo7h7UA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FFfk/MgqkxjA56TqPGaFqo3E5C+UKWoOOglSrFeYYnF/KgHxASQLgFomcd5uiZvRb
         KnNUejif5jQf0QE3YNyKokUBewlqLrdf4a21iJIb4jysDeBRgzJAEwe0TvHtfyjslP
         1+XQ67ae0Mr7Gra1wG7mGb56g1/D8m4H820f5Yko=
Date:   Thu, 16 Jul 2020 10:41:18 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Alim Akhtar <alim.akhtar@samsung.com>
Cc:     robh+dt@kernel.org, krzk@kernel.org, kwmad.kim@samsung.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        kishon@ti.com
Subject: Re: [PATCH v12 2/2] phy: samsung-ufs: add UFS PHY driver for samsung
 SoC
Message-ID: <20200716051118.GB55478@vkoul-mobl>
References: <20200703171135.77389-1-alim.akhtar@samsung.com>
 <CGME20200703173144epcas5p1daa9f5c594e7f299638cc75b7425b7c8@epcas5p1.samsung.com>
 <20200703171135.77389-2-alim.akhtar@samsung.com>
 <20200713061737.GD34333@vkoul-mobl>
 <077501d65b0e$e1630100$a4290300$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <077501d65b0e$e1630100$a4290300$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Alim,

On 16-07-20, 06:47, Alim Akhtar wrote:

> > > +static int samsung_ufs_phy_symbol_clk_init(struct samsung_ufs_phy
> > > +*phy) {
> > > +	int ret = 0;
> > 
> > superfluous init, am sure I flagged it before as well
> > 
> Yes, you did, but 0-DAY CI kernel test gave warning [1], so I kept this as
> it is.
> [1] https://lkml.org/lkml/2020/7/3/81

But you moved away from return below to goto, so that is no longer
the case. First use of ret is for clk_prepare_enable() call below which
is not conditional hence this is superfluous. Earlier it was not as it was
conditional so required to be initialized

> 
> > > +
> > > +	phy->tx0_symbol_clk = devm_clk_get(phy->dev, "tx0_symbol_clk");
> > > +	if (IS_ERR(phy->tx0_symbol_clk)) {
> > > +		dev_err(phy->dev, "failed to get tx0_symbol_clk clock\n");
> > > +		goto out;
> > > +	}
> > > +
> > > +	phy->rx0_symbol_clk = devm_clk_get(phy->dev, "rx0_symbol_clk");
> > > +	if (IS_ERR(phy->rx0_symbol_clk)) {
> > > +		dev_err(phy->dev, "failed to get rx0_symbol_clk clock\n");
> > > +		goto out;
> > > +	}
> > > +
> > > +	phy->rx1_symbol_clk = devm_clk_get(phy->dev, "rx1_symbol_clk");
> > > +	if (IS_ERR(phy->rx0_symbol_clk)) {
> > > +		dev_err(phy->dev, "failed to get rx1_symbol_clk clock\n");
> > > +		goto out;
> > > +	}
> > > +
> > > +	ret = clk_prepare_enable(phy->tx0_symbol_clk);
> > > +	if (ret) {
> > > +		dev_err(phy->dev, "%s: tx0_symbol_clk enable failed %d\n",
> > __func__, ret);
> > > +		goto out;
> > > +	}
-- 
~Vinod
