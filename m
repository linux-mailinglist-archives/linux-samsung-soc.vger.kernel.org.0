Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96D846B888
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 17 Jul 2019 10:49:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729442AbfGQIsY (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 17 Jul 2019 04:48:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:52382 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727005AbfGQIsY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 17 Jul 2019 04:48:24 -0400
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D5DB52182B;
        Wed, 17 Jul 2019 08:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563353303;
        bh=/NRR6ZVfH/r+x8OphvuI+fLrW6gXRTqze46/dbMGmOI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tA5kUXM3g/1ITmUwtPKsFJorXYYsWdZPHAI65v2pUAzTk0G5/mXlmAZqiLe87cBVD
         /sQ70iUvSiRZ/W+QQu6S+F5ksO6lCrzb3eKHLMB1FQ+oSm56MGSh+k147/dEnsqsPE
         gmGQ6cLFuCsF+OJfdHUaTux6Z4yf/vaDW0bFDT8s=
Received: by mail-lj1-f170.google.com with SMTP id 16so22768465ljv.10;
        Wed, 17 Jul 2019 01:48:22 -0700 (PDT)
X-Gm-Message-State: APjAAAVz8vBVbhqqhisGUxSXt74Ld+AhEtJx3LiuQJs51yVv0cnZloEZ
        I/4+JXEeik/lomEPtE74VDlvJomXOhohsRv+nHQ=
X-Google-Smtp-Source: APXvYqwGbnK8q2TQAV3pBRB1WO6v0CtEUty37EkyvFjQViT6TKr312fFJIuwughcF6XBbdD2YqagKHof7D4Ib2xJ1sQ=
X-Received: by 2002:a2e:8155:: with SMTP id t21mr20046257ljg.80.1563353301198;
 Wed, 17 Jul 2019 01:48:21 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190715124451eucas1p2904b49f59cca0cbbc22381f168affbb5@eucas1p2.samsung.com>
 <20190715124417.4787-1-l.luba@partner.samsung.com> <20190715124417.4787-22-l.luba@partner.samsung.com>
In-Reply-To: <20190715124417.4787-22-l.luba@partner.samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 17 Jul 2019 10:48:10 +0200
X-Gmail-Original-Message-ID: <CAJKOXPd0kzwZ9_eCK9r04Qj0Rf5SSSnMmwDj11cZozmu0gqsgw@mail.gmail.com>
Message-ID: <CAJKOXPd0kzwZ9_eCK9r04Qj0Rf5SSSnMmwDj11cZozmu0gqsgw@mail.gmail.com>
Subject: Re: [PATCH v1 21/50] ARM: dts: exynos: add OPP into FSYS APB bus in Exynos5420
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

On Mon, 15 Jul 2019 at 14:44, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>
> Add an OPP for FSYS APB which reflects the real possible frequency.
> The bus will have a new parent clock which speed has 600MHz, thus
> a new possible frequency provided by the clock divider is 150MHz.
> According to the documentation max possible frequency for this bus is
> 200MHz.

Commit msg is good but title could be improved. Focus in the title
what problem/issue you are solving - add intermediate step in scaling
of FSYS APB?

Best regards,
Krzysztof
