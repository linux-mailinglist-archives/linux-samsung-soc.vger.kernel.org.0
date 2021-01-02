Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 056BD2E88C1
	for <lists+linux-samsung-soc@lfdr.de>; Sat,  2 Jan 2021 23:01:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbhABWBV (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 2 Jan 2021 17:01:21 -0500
Received: from helcar.hmeau.com ([216.24.177.18]:37252 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726678AbhABWBU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 2 Jan 2021 17:01:20 -0500
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1kvowk-0000U0-Ie; Sun, 03 Jan 2021 09:00:27 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Sun, 03 Jan 2021 09:00:26 +1100
Date:   Sun, 3 Jan 2021 09:00:26 +1100
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Vladimir Zapolskiy <vz@mleia.com>,
        "David S. Miller" <davem@davemloft.net>,
        linux-crypto@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] MAINTAINERS: crypto: s5p-sss: drop Kamil Konieczny
Message-ID: <20210102220026.GB12767@gondor.apana.org.au>
References: <20201207165521.125129-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201207165521.125129-1-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Dec 07, 2020 at 05:55:20PM +0100, Krzysztof Kozlowski wrote:
> E-mails to Kamil Konieczny to his Samsung address bounce with 550 (User
> unknown).  Kamil no longer takes care about Samsung S5P SSS driver so
> remove the invalid email address from:
>  - mailmap,
>  - bindings maintainer entries,
>  - maintainers entry for S5P Security Subsystem crypto accelerator.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  .mailmap                                                      | 1 -
>  Documentation/devicetree/bindings/crypto/samsung-slimsss.yaml | 1 -
>  Documentation/devicetree/bindings/crypto/samsung-sss.yaml     | 1 -
>  MAINTAINERS                                                   | 1 -
>  4 files changed, 4 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
