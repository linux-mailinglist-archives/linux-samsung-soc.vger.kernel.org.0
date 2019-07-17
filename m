Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 759056BA56
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 17 Jul 2019 12:35:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726085AbfGQKfP (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 17 Jul 2019 06:35:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:47938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725890AbfGQKfP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 17 Jul 2019 06:35:15 -0400
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3E7D6217F9;
        Wed, 17 Jul 2019 10:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563359714;
        bh=PAR8mlSeTH/LoKAbJRleg47rsHfD34Q7KbIi612oSMQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VCIOZcy1CV4tWdHH/3BIs9dheZFe8vV0t5YOXrH1sJJnkorvF2MJyjwUEDCL65VE2
         DhIPh1nOMFsig8WauNI8BijQwjQCuc1he9TylXqL1HTJ5xME0oSZTsg7kMUJqivfXr
         ChUGuW616fQwnqzU3MRjdhmALaE36CbMDa03uJYg=
Received: by mail-lj1-f178.google.com with SMTP id p17so23128685ljg.1;
        Wed, 17 Jul 2019 03:35:14 -0700 (PDT)
X-Gm-Message-State: APjAAAXicdhNWbGqqZOlM/hU7NRgZYGTKy42nR8Y1+sOT0ZHbDL/OYec
        9mluM2kpi9ImupCSovc5dJWP7mcSBdS/DdcX1I0=
X-Google-Smtp-Source: APXvYqy8D0RzdrNvLB/ZkY5weYlQZqHp4mf5RPOqEq2VDNgO6QJkju5xmxTPy8R/KFmcpxCPgjfx7det/rdOuHGMZ1M=
X-Received: by 2002:a2e:50e:: with SMTP id 14mr20723271ljf.5.1563359712606;
 Wed, 17 Jul 2019 03:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190715124501eucas1p17382ca9cead8bfe1dc938e6fb583b7c5@eucas1p1.samsung.com>
 <20190715124417.4787-1-l.luba@partner.samsung.com> <20190715124417.4787-34-l.luba@partner.samsung.com>
In-Reply-To: <20190715124417.4787-34-l.luba@partner.samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 17 Jul 2019 12:35:01 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdGnyEayFBuNPgrdB-9oqdvxkRCLm93kDBVfHnmnAgc9g@mail.gmail.com>
Message-ID: <CAJKOXPdGnyEayFBuNPgrdB-9oqdvxkRCLm93kDBVfHnmnAgc9g@mail.gmail.com>
Subject: Re: [PATCH v1 33/50] ARM: dts: exynos: set parent clocks to UARTs in Exynos5420
To:     Lukasz Luba <l.luba@partner.samsung.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= 
        <b.zolnierkie@samsung.com>, kgene@kernel.org, mark.rutland@arm.com,
        robh+dt@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>,
        kyungmin.park@samsung.com, Andrzej Hajda <a.hajda@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        s.nawrocki@samsung.com, myungjoo.ham@samsung.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 15 Jul 2019 at 14:45, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>
> Change the parents of UART clocks to the CPLL which has 666MHz.
> The UARTs' dividers use /10 rate so they would have 66.6MHz.

Write also the state before to show what is being fixed (I assume
previous frequency was not best choice).

BR,
Krzysztof
