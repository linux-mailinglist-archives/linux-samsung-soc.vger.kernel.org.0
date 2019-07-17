Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42AD36B9C7
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 17 Jul 2019 12:10:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbfGQKK3 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 17 Jul 2019 06:10:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:59192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725948AbfGQKK2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 17 Jul 2019 06:10:28 -0400
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5F9FF217F9;
        Wed, 17 Jul 2019 10:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563358227;
        bh=B0vq7TI9wkTFGGzN7Fq0OAUyk2GFb1jaW2T4WnkVxnQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tp7xDM+4dkXRzBqwbE1lKYdrAdg5NwLhC8eFDtVrZvxXTDyL5dwf6v6gjNQxhDB0L
         qRNRjh47HKL0vo/a/EUMT6J5yKajlEm5DvlZqm+AhrabbsKft7mjMXYziTteokCttO
         rB0ATQ4npW3uhufNJFEKmz9CTP2zwVCOUG9wZzRg=
Received: by mail-lj1-f180.google.com with SMTP id d24so23033423ljg.8;
        Wed, 17 Jul 2019 03:10:27 -0700 (PDT)
X-Gm-Message-State: APjAAAUtUU+tqLdYmEAZVc/i8CB+qWuva48PryOQHWKKFt/dkDaSOBsn
        5fjg0CI5awQ/XzJwyBSFuxn8plh/imWjnvlrUgY=
X-Google-Smtp-Source: APXvYqzIxuLAR32Jvbkflkn1R9vuEUkDOd5VMPMZ6u/awTTp1I0u14ioknFtuK1fwk0oxvu4ENFvuA7wgfhcvBVlZh4=
X-Received: by 2002:a2e:50e:: with SMTP id 14mr20662249ljf.5.1563358225560;
 Wed, 17 Jul 2019 03:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190715124455eucas1p13bfc0c1d113225db9607e4c0dbac353c@eucas1p1.samsung.com>
 <20190715124417.4787-1-l.luba@partner.samsung.com> <20190715124417.4787-27-l.luba@partner.samsung.com>
In-Reply-To: <20190715124417.4787-27-l.luba@partner.samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 17 Jul 2019 12:10:13 +0200
X-Gmail-Original-Message-ID: <CAJKOXPc3qsM5Xe5JViDZXYfes+_veb-KX3fnZjpkUCrphBcu-Q@mail.gmail.com>
Message-ID: <CAJKOXPc3qsM5Xe5JViDZXYfes+_veb-KX3fnZjpkUCrphBcu-Q@mail.gmail.com>
Subject: Re: [PATCH v1 26/50] ARM: dts: exynos: align NOC100 bus OPPs in Exynos5420
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
> The NOC100 has a parent which clock rate is set tot 400MHz. The OPPs which
> are not possible to set are removed and new one is added.

I think it is just NOC bus... or are there more of such and this is 100 MHz one?

Best regards,
Krzysztof
