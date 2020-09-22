Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9CE83274907
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 22 Sep 2020 21:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726682AbgIVTX5 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 22 Sep 2020 15:23:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:34698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726448AbgIVTX5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 22 Sep 2020 15:23:57 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2669A2376F;
        Tue, 22 Sep 2020 19:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600802637;
        bh=HE3FPRd/RHytxOWMqvWVJQBApbrarbBnl7sA2NPA458=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=vBRTd+eD7aMY/3tF3qsYB7xdIKSMn4y6HQjsGwJ9XVyOboxdoL1Wcst0OG3Nl/e6s
         ttpYTIsWDp9bluVo81IXUnG1XYOnS/whlmS0nagPObYmGA6ngk861u2R9CX5wlLiiE
         9ApY54zv8nmixZTwEvnem6NQyt/s8Kj/SrQMcPXk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <f086a2ed-3825-bdb7-1ed6-02f2978713c2@samsung.com>
References: <CGME20200922100235eucas1p29e2d2b543dee8504a69cd059db78a4df@eucas1p2.samsung.com> <f086a2ed-3825-bdb7-1ed6-02f2978713c2@samsung.com>
Subject: Re: [GIT PULL] clk: samsung: Updates for v5.10
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Date:   Tue, 22 Sep 2020 12:23:55 -0700
Message-ID: <160080263573.310579.13874284932570545017@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Sylwester Nawrocki (2020-09-22 03:02:34)
> Hi Stephen, Mike,
>=20
>=20
> The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bb=
f5:
>=20
>   Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)
>=20
> are available in the git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/=
clk-v5.10-samsung
>=20
> for you to fetch changes up to ff8e0ff9b99643a32f7e33a96867e76d0fa10f76:
>=20
>   clk: samsung: Use cached clk_hws instead of __clk_lookup() calls (2020-=
09-17 12:05:18 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
