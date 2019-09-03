Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45966A61F9
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  3 Sep 2019 08:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727079AbfICG4P (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 3 Sep 2019 02:56:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:51444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725919AbfICG4P (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Sep 2019 02:56:15 -0400
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id E16F8216C8
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Sep 2019 06:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567493774;
        bh=3sxI0s+oxvZEwmlyZ2oRN49J3nzEeET20gk6oLCudlw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=0UysHmBagUZCB5qKvYXEpMh82epCUGm9Cguvn6/oDoMSH8cPY3yJHDlxR6T1Hxi5l
         NB37aH/YJ0acHluKRkqQjHxGJTL9g2XJ8TL65telEIMm2lOatHodcYQuwi9EQTx8dL
         qvMHh/jbV/UbP7dh5om0BrKag5ph+aRv3kx1AA/s=
Received: by mail-lj1-f175.google.com with SMTP id d5so3897876lja.10
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Sep 2019 23:56:13 -0700 (PDT)
X-Gm-Message-State: APjAAAWetAOirpyW9CITUmyUHyX4jPsFwzTw+BH1Jdm/YdEDNEjtiPVU
        4Q8+oSehOQ2c2EeG5I4BL5Y+Z4F9OIKZVd8ymFw=
X-Google-Smtp-Source: APXvYqz4xMsOKmhyg6cuLervTlR5/XHT78p4RB4Bf27lUDtBIzNf7Ohh70sRweO81HtYk/raa7wtGAApaev31g5N+QM=
X-Received: by 2002:a2e:9b13:: with SMTP id u19mr19115530lji.40.1567493772171;
 Mon, 02 Sep 2019 23:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190725083433.6505-1-guillaume.gardet@arm.com>
 <20190830104502.7128-1-guillaume.gardet@arm.com> <20190830104502.7128-2-guillaume.gardet@arm.com>
 <20190902153146.GB9289@kozik-lap>
In-Reply-To: <20190902153146.GB9289@kozik-lap>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 3 Sep 2019 08:56:01 +0200
X-Gmail-Original-Message-ID: <CAJKOXPe8QDzDoM4sKva0qrVUA7EMTR7FO5jGut+Paw9mAcdfAw@mail.gmail.com>
Message-ID: <CAJKOXPe8QDzDoM4sKva0qrVUA7EMTR7FO5jGut+Paw9mAcdfAw@mail.gmail.com>
Subject: Re: [PATCH V3 1/5] dt-bindings: gpu: mali-midgard: Add samsung
 exynos5250 compatible
To:     Guillaume Gardet <guillaume.gardet@arm.com>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 2 Sep 2019 at 17:31, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Fri, Aug 30, 2019 at 12:44:58PM +0200, Guillaume Gardet wrote:
> > Add "samsung,exynos5250-mali" binding.
> >
> > Signed-off-by: Guillaume Gardet <guillaume.gardet@arm.com>
> >
> > Cc: Kukjin Kim <kgene@kernel.org>
> > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > ---
> > V3 changes:
> >   * add dt-bindings before node in device tree
> > V2 changes:
> >   * new file
> >
> >  Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt | 1 +
>
> Thanks, entire set applied (with re-ordering and minor description
> changes).

Hi Guillaume,

I applied yesterday entire patchset but this dt-bindings patch causes
big merge conflict which will not be reasonable to resolve by Linus.
Can you rebase this patch on top of latest linux-next? Basically you
would need to add respective entries to new YAML file:
Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml

Send it to regular dt-bindings maintainers (scripts/get_maintainers.pl).

Best regards,
Krzysztof
