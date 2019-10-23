Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 017AFE148A
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 23 Oct 2019 10:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390353AbfJWIoX (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 23 Oct 2019 04:44:23 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:58222 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390343AbfJWIoX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Oct 2019 04:44:23 -0400
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
        id 1iNCFc-0004MA-Ja; Wed, 23 Oct 2019 16:44:16 +0800
Received: from herbert by gondobar with local (Exim 4.89)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1iNCFY-0003xp-75; Wed, 23 Oct 2019 16:44:12 +0800
Date:   Wed, 23 Oct 2019 16:44:12 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
        Joe Perches <joe@perches.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, devicetree@vger.kernel.org,
        Otto Sabart <ottosabart@seberm.com>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5.1 RESEND] dt-bindings: hwrng: Add Samsung Exynos 5250+
 True RNG bindings
Message-ID: <20191023084412.va5gswstckblm5a4@gondor.apana.org.au>
References: <CGME20190111132222eucas1p1d80caf8ba30422bc5fe1a1fac4cf48e8@eucas1p1.samsung.com>
 <CAL_JsqKt-ujsB-t9A=4dEAjqrvcquUG+qF3tFg1YCqmup_5wcw@mail.gmail.com>
 <20190111132139.12333-1-l.stelmach@samsung.com>
 <CAJKOXPfM+EUzBBBhrtSFw5-e7hiimsFT8okcd8J9gGyFdzd2+w@mail.gmail.com>
 <58f7d127-b798-04b8-1bc6-d37a8af273f7@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58f7d127-b798-04b8-1bc6-d37a8af273f7@suse.de>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Oct 23, 2019 at 10:16:48AM +0200, Andreas F�rber wrote:
>
> For some reason this text file in linux-next is lonely in devicetree/...
> rather than living in Documentation/devicetree/... - please fix that.
> The patch here looks correct, so not sure what went wrong:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/devicetree/bindings/rng/samsung,exynos5250-trng.txt?h=next-20191023&id=85552c22f03c9066c33f26f34538b67fee6a91a8

It's because the patch

	https://patchwork.kernel.org/patch/11181265/

was generated at the wrong level (p0 instead of p1).

I'll fix this up in my tree.  Thanks for the heads up.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
