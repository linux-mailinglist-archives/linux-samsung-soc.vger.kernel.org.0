Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7709A3204
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 30 Aug 2019 10:19:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbfH3ITg (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 30 Aug 2019 04:19:36 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:59604 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726304AbfH3ITg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Aug 2019 04:19:36 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.89 #2 (Debian))
        id 1i3c7x-0004D2-MF; Fri, 30 Aug 2019 18:19:26 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 30 Aug 2019 18:19:23 +1000
Date:   Fri, 30 Aug 2019 18:19:23 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc:     linux-crypto@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Kamil Konieczny <k.konieczny@partner.samsung.com>,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] drivers/crypto - s5p fixes
Message-ID: <20190830081923.GB8033@gondor.apana.org.au>
References: <20190819142226.1703-1-ard.biesheuvel@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190819142226.1703-1-ard.biesheuvel@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Aug 19, 2019 at 05:22:24PM +0300, Ard Biesheuvel wrote:
> Fix a couple of issues in the s5p crypto driver that were caught in fuzz
> testing.
> 
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Vladimir Zapolskiy <vz@mleia.com>
> Cc: Kamil Konieczny <k.konieczny@partner.samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org
> 
> Ard Biesheuvel (2):
>   crypto: s5p - deal gracefully with bogus input sizes
>   crypto: s5p - use correct block size of 1 for ctr(aes)
> 
>  drivers/crypto/s5p-sss.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

All applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
