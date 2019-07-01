Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AD058520EB
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 25 Jun 2019 05:08:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726823AbfFYDIl (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 24 Jun 2019 23:08:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:42758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726610AbfFYDIl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Jun 2019 23:08:41 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E330720665;
        Tue, 25 Jun 2019 03:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561432121;
        bh=2AAlXeHQFiaSyHHShAEEksMvCaeH6R7/qEi8rX3OpHM=;
        h=In-Reply-To:References:To:From:Subject:Cc:Date:From;
        b=yUkKlFESrBUv+xObEW/XfZpr7zyXmP0AZjc+w6UoikI6MgdMJs5khUvpnYRHe+gQJ
         2lpa6SeDy8ywJg/HrhzpCEAzRb25I2R3OxzDquU9USHzWGQzWme47U1RnijzopFebt
         ImM6quVlZ3qSM0ZtQqv7/zliPkCK2CYjpH38DNEg=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <dce2e440-130f-3d71-e518-b251cb0cc61e@samsung.com>
References: <CGME20190621141726eucas1p2ed6b0c1468f67ab32bd4b1e67d0b3424@eucas1p2.samsung.com> <dce2e440-130f-3d71-e518-b251cb0cc61e@samsung.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [GIT PULL] clk/samsung updates for 5.3
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
User-Agent: alot/0.8.1
Date:   Mon, 24 Jun 2019 20:08:40 -0700
Message-Id: <20190625030840.E330720665@mail.kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Quoting Sylwester Nawrocki (2019-06-21 07:17:25)
> Hi Stephen, Mike,
>=20
> The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0eb=
d9:
>=20
>   Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/cl=
k-v5.3-samsung
>=20
> for you to fetch changes up to 7ef91224c4864202958b018cd5612db5cc9dc67d:
>=20
>   clk: samsung: Add bus clock for GPU/G3D on Exynos4412 (2019-06-19 10:50=
:51 +0200)
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next

