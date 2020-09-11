Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 017042659CF
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 11 Sep 2020 08:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725824AbgIKG70 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 11 Sep 2020 02:59:26 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:59034 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725562AbgIKG7V (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 02:59:21 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1kGd1c-0007y3-53; Fri, 11 Sep 2020 16:59:13 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 11 Sep 2020 16:59:12 +1000
Date:   Fri, 11 Sep 2020 16:59:12 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Vladimir Zapolskiy <vz@mleia.com>,
        Kamil Konieczny <k.konieczny@samsung.com>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>, linux-crypto@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] crypto: s5p-sss - Pass error from clk_get and reduce
 verbosity on deferral
Message-ID: <20200911065912.GJ32150@gondor.apana.org.au>
References: <20200903180400.2865-1-krzk@kernel.org>
 <20200903180400.2865-3-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903180400.2865-3-krzk@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Sep 03, 2020 at 08:04:00PM +0200, Krzysztof Kozlowski wrote:
> Pass the error directly from devm_clk_get() to describe the real reason,
> instead of fixed ENOENT.  Do not print error messages on deferred probe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/crypto/s5p-sss.c | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
