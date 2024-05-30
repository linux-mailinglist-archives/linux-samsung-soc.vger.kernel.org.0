Return-Path: <linux-samsung-soc+bounces-3241-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE1B8D4800
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 30 May 2024 11:04:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0EEF288466
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 30 May 2024 09:04:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00A126F2F4;
	Thu, 30 May 2024 09:02:26 +0000 (UTC)
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from fgw21-7.mail.saunalahti.fi (fgw21-7.mail.saunalahti.fi [62.142.5.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6713813B290
	for <linux-samsung-soc@vger.kernel.org>; Thu, 30 May 2024 09:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717059745; cv=none; b=qB57SAh8U3n3UxGR6H7UfoALHWaqPKvVFLuPXOsxuhYVBtvKd8MZWQh+NF/+A/IMgswG4ykwc2zeN6ANPUpSCDVKW5XFFxpIi92H4g9mtm7XQedJPKGwHS7czbOHQhOefE5Nxiy4cxIV+uqAGVwgDT2ZTK9FiY4Q+lP0FCuQc60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717059745; c=relaxed/simple;
	bh=F2UL5a5lNnRgjZ1mIiR2YUOReGq+mkXTrOgzg/TJ45E=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kW87BLlnz+h6Qb4ceq9qbQWWbLZrm/H9/URklSpV9VHb3Fc9agSzjKpAErxpTSF6+aSpU6YBIauUNhzr1JfxoIypMnz+aCzjnX2s2rOhmUKOjU9aHncofwCZgbCrWFtSqLG8RDafjOq7YpbCbyvcH1qV0FeLlV65FHaujVweLgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-230.elisa-laajakaista.fi [88.113.26.230])
	by fgw23.mail.saunalahti.fi (Halon) with ESMTP
	id 51e6d162-1e63-11ef-80c8-005056bdfda7;
	Thu, 30 May 2024 12:02:22 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 30 May 2024 12:02:19 +0300
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Damien Le Moal <dlemoal@kernel.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Tony Lindgren <tony@atomide.com>,
	Stephen Warren <swarren@wwwdotorg.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-samsung-soc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put()
 cleanups
Message-ID: <ZlhAm-giX6jNaUKr@surfacebook.localdomain>
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com>
 <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>

Mon, May 13, 2024 at 01:59:03PM +0200, Geert Uytterhoeven kirjoitti:
> On Sat, May 4, 2024 at 3:14 PM Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:

...

> You missed one trivial conversion, presumably because no error handling
> and thus no of_node_put() is involved?

Nothing is missed. The below is a redundant change.

...

> -       for_each_child_of_node(np, child) {
> +       for_each_child_of_node_scoped(np, child) {
>                 if (of_property_count_u32_elems(child, RZN1_PINS_PROP) > 0)
>                         count++;
>         }
> 
> If you prefer not to include this

I prefer this not to be included as it will give a misleading signals to the
use of the original API(s).

-- 
With Best Regards,
Andy Shevchenko



