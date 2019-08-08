Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACF5786BF5
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  8 Aug 2019 22:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390186AbfHHUyc (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 8 Aug 2019 16:54:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:47430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732601AbfHHUyc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 8 Aug 2019 16:54:32 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0A5762173C;
        Thu,  8 Aug 2019 20:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565297671;
        bh=RbcGBY8Rckrm2fQnqb86Wd8ep+YZxpahEYQClJ1cns4=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=iS+N5K6W+k2NAMCOroQiYTmg7HnFH3sCVZuj5w1hI3CHnBV4EnwOm0xGL6qdQGC+t
         aBwN3TCs+AG/Yazs2vNyS02nPNI0shECCVG7R/HtRcGsDOsnUCfGuF75HWKz+K/Teo
         oPGSTmpwPrO0dziJ9ZUB3zN3gwmPb5d8PvanM27Q=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190808144929.18685-2-s.nawrocki@samsung.com>
References: <20190808144929.18685-1-s.nawrocki@samsung.com> <CGME20190808144941eucas1p1b6ba7aadd0c31aedf765a0f90ed6213f@eucas1p1.samsung.com> <20190808144929.18685-2-s.nawrocki@samsung.com>
Subject: Re: [PATCH v2 2/2] clk: samsung: exynos5800: Move MAU subsystem clocks to MAU sub-CMU
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux@armlinux.org.uk, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        krzk@kernel.org, cw00.choi@samsung.com, m.szyprowski@samsung.com,
        b.zolnierkie@samsung.com,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        mturquette@baylibre.com
User-Agent: alot/0.8.1
Date:   Thu, 08 Aug 2019 13:54:30 -0700
Message-Id: <20190808205431.0A5762173C@mail.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Sylwester Nawrocki (2019-08-08 07:49:29)
> This patch fixes broken sound on Exynos5422/5800 platforms after
> system/suspend resume cycle in cases where the audio root clock
> is derived from MAU_EPLL_CLK.
>=20
> In order to preserve state of the USER_MUX_MAU_EPLL_CLK clock mux
> during system suspend/resume cycle for Exynos5800 we group the MAU
> block input clocks in "MAU" sub-CMU and add the clock mux control
> bit to .suspend_regs.  This ensures that user configuration of the mux
> is not lost after the PMU block changes the mux setting to OSC_DIV
> when switching off the MAU power domain.
>=20
> Adding the SRC_TOP9 register to exynos5800_clk_regs[] array is not
> sufficient as at the time of the syscore_ops suspend call MAU power
> domain is already turned off and we already save and subsequently
> restore an incorrect register's value.
>=20
> Fixes: b06a532bf1fa ("clk: samsung: Add Exynos5 sub-CMU clock driver")
> Reported-by: Jaafar Ali <jaafarkhalaf@gmail.com>
> Suggested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Jaafar Ali <jaafarkhalaf@gmail.com>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---

Applied to clk-fixes

