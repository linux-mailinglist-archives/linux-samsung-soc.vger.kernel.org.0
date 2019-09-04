Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A716A893C
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  4 Sep 2019 21:23:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730266AbfIDPGb (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 4 Sep 2019 11:06:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:44528 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729944AbfIDPGb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Sep 2019 11:06:31 -0400
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 017D222CE3
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Sep 2019 15:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567609590;
        bh=ilO+0qb+kaauepzOxBZBTOGyeIR0uOrokNd1Q+WhDQY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=k4MH//5eFx5GdNzc7NKc4HcT0zIxwx0OgRsML+sax5ntSPi2kTwi1x4MVixYzpcDu
         NvZrnZxoTF/aCLyZM7tqGNDpTvgMBpzqOjA2C+Wa3JZ3BmsomteKmCsWa76f3Dhpef
         TnzPNC0XDZPB7sJyK+qoYakBCWpIz7Fm2x62qqnU=
Received: by mail-lj1-f170.google.com with SMTP id y23so8880052lje.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Sep 2019 08:06:29 -0700 (PDT)
X-Gm-Message-State: APjAAAX0AKpCXGtKxeT4QmLsqwm69paHp7ZiFQXdTWeRidAKh7a97gDB
        Zz8HDhRpXb7PnGyuPZmwFtrqSokSBiTiqWscxmw=
X-Google-Smtp-Source: APXvYqwST/21XIjfdwT5EVCHbyWBE+XS0FvDnvcoKESRx1bsi27H/byZjPbiqueBdnjR5+2tOgUCS7+rL+ZVeR/5E10=
X-Received: by 2002:a2e:b4e3:: with SMTP id s3mr137835ljm.143.1567609588184;
 Wed, 04 Sep 2019 08:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190904084834eucas1p20aff0f98a90b9c6939d9113932919aff@eucas1p2.samsung.com>
 <20190904084829.23944-1-m.szyprowski@samsung.com> <9b603476-ade2-d718-b0ba-ec69303405c1@samsung.com>
 <dd8050e7-1dc4-8fbe-8717-9601740e2f70@samsung.com>
In-Reply-To: <dd8050e7-1dc4-8fbe-8717-9601740e2f70@samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 4 Sep 2019 17:06:16 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdPm1kUSzTKRmEyu1E3oh0ZwJGGH0++wMMeET6V=vv-SQ@mail.gmail.com>
Message-ID: <CAJKOXPdPm1kUSzTKRmEyu1E3oh0ZwJGGH0++wMMeET6V=vv-SQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: exynos: Propagate address/size cell change to
 /memory node
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 4 Sep 2019 at 16:44, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Hi Alim,
>
> On 2019-09-04 16:06, Alim Akhtar wrote:
> > Thanks Marek,
> > This fixes the booting issue on exyno7-espresso board.
> > Probably this should be CCed to -stable.
>
> The patch has 'Fixes' tag, so it will be automatically selected for all
> stable kernels, which includes the mentioned commit.

The autosel will pick it up but AFAIK the general process did not
change - still patch should be Cc-stable tagged. At least this is
still written in Documentation/process/stable-kernel-rules.rst.
I can add the tag while applying so no need to resend.

Best regards,
Krzysztof
