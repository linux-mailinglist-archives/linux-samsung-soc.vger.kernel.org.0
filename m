Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA5122CDFE4
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  3 Dec 2020 21:47:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbgLCUp0 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 3 Dec 2020 15:45:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:50486 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727450AbgLCUp0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Dec 2020 15:45:26 -0500
From:   Krzysztof Kozlowski <krzk@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     linux-samsung-soc@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lukasz Stelmach <l.stelmach@samsung.com>
Subject: Re: (subset) [PATCH] ARM: dts: exynos: Reduce assigned-clocks entries for SPI0 on Artik5 board
Date:   Thu,  3 Dec 2020 22:44:25 +0200
Message-Id: <160702823134.7041.8716809193308479729.b4-ty@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202122029.22198-1-m.szyprowski@samsung.com>
References: <CGME20201202122035eucas1p175944617fd50292f7dccc775823ed038@eucas1p1.samsung.com> <20201202122029.22198-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 2 Dec 2020 13:20:29 +0100, Marek Szyprowski wrote:
> Commit 2024b130b0c8 ("ARM: dts: exynos: Add Ethernet to Artik 5 board")
> added ethernet chip on SPI0 bus and the whole bunch of assigned clock
> entries to ensure proper clock rates and topology. Limit the assigned
> clock parents only to the direct clocks of the SPI0 device and assume
> that MPLL clock is already properly configured.
> 
> The applied clock topology was incorrect as some clocks between were
> missing, what resulted in the following warning:
> 
> [...]

Applied, thanks!

[1/1] ARM: dts: exynos: Reduce assigned-clocks entries for SPI0 on Artik5 board
      commit: 7995fb896b9637a5f59a56ae0d8f2b7ca71a040d

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
