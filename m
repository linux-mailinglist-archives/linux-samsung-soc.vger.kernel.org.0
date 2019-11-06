Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57F1EF1EC8
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  6 Nov 2019 20:30:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728627AbfKFTa3 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 6 Nov 2019 14:30:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:59354 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726713AbfKFTa3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Nov 2019 14:30:29 -0500
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 503C92178F;
        Wed,  6 Nov 2019 19:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1573068628;
        bh=k1Pgbj2+aYX796HDlV1Ckua3uDnAGzU9BajlcJ7cxs4=;
        h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
        b=NLPMUUonM96fvY57QNjx1nDH2DwgCE06qEKhOnOKD7E+x8UJREHctwdmW04d6AzFD
         gj4XoYhN0JRc/n0WzeQMcW2aOOG0dD2JfSAtW1QXvRp7+ff8IlD9nWiFCOMdH8J8dp
         rsGw122KBNKAudMnVjpMZeVD495NIfmVTbLKwTj0=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <af9676da-d448-50e8-d181-680aba7078db@samsung.com>
References: <7647a10d-8e37-f086-a014-77f8ddcdd006@samsung.com> <CGME20191031150334eucas1p1c72857d23468cd693fee18ff1175b897@eucas1p1.samsung.com> <af9676da-d448-50e8-d181-680aba7078db@samsung.com>
Subject: Re: [GIT PULL] clk/samsung updates for v5.5
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
User-Agent: alot/0.8.1
Date:   Wed, 06 Nov 2019 11:30:27 -0800
Message-Id: <20191106193028.503C92178F@mail.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Sylwester Nawrocki (2019-10-31 08:03:33)
> Hi Stephen, Mike,
> This PR is on top of my previous one (tags/clk-v5.4-samsung-fixes).
>=20
>=20
> The following changes since commit e9323b664ce29547d996195e8a6129a351c391=
08:
>=20
>   clk: samsung: exynos5420: Preserve PLL configuration during suspend/res=
ume (2019-10-25 11:20:00 +0200)
>=20
> are available in the Git repository at:
>=20
>   https://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git clk-v=
5.5-samsung
>=20
> for you to fetch changes up to 45f10dabb56bc5dee52df47dccd3bfab1e58eea1:
>=20
>   clk: samsung: exynos5420: Add SET_RATE_PARENT flag to clocks on G3D pat=
h (2019-10-29 14:57:22 +0100)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

