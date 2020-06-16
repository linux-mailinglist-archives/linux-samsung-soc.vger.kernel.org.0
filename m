Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBDD21FA9EF
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 16 Jun 2020 09:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgFPHck (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 16 Jun 2020 03:32:40 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:52488 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725710AbgFPHck (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 16 Jun 2020 03:32:40 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.92 #5 (Debian))
        id 1jl64M-0002Xj-Rn; Tue, 16 Jun 2020 17:31:43 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Tue, 16 Jun 2020 17:31:42 +1000
Date:   Tue, 16 Jun 2020 17:31:42 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Lukasz Stelmach <l.stelmach@samsung.com>
Cc:     wu000273@umn.edu, kjlu@umn.edu, Matt Mackall <mpm@selenic.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] char: hw_random: Fix a reference count leak.
Message-ID: <20200616073142.GA30519@gondor.apana.org.au>
References: <20200613214128.32665-1-wu000273@umn.edu>
 <CGME20200615131915eucas1p2b8f3fa0ceb757e36aa888a4476de034f@eucas1p2.samsung.com>
 <dleftjr1uglb5t.fsf%l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dleftjr1uglb5t.fsf%l.stelmach@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Jun 15, 2020 at 03:18:54PM +0200, Lukasz Stelmach wrote:
>
> I believe this fix has already been submitted
> 
>     https://lore.kernel.org/linux-arm-kernel/20200522011659.26727-1-dinghao.liu@zju.edu.cn/T/#u
> 
> It hasn't been applied though. Anyway, thank you for your work.
> 
> Herbert, could you take a look at the Dinghao's patch, please?

It was part of a number of patches that did similar things.  The
general conclusion was that it should call put_noidle instead.

See

	https://patchwork.kernel.org/patch/11574843/

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
