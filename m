Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 209D67EBBA
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  2 Aug 2019 06:56:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732295AbfHBE41 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 2 Aug 2019 00:56:27 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:48728 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732224AbfHBE41 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 00:56:27 -0400
Received: from gondolin.me.apana.org.au ([192.168.0.6] helo=gondolin.hengli.com.au)
        by fornost.hmeau.com with esmtps (Exim 4.89 #2 (Debian))
        id 1htPbT-0006IL-3e; Fri, 02 Aug 2019 14:55:43 +1000
Received: from herbert by gondolin.hengli.com.au with local (Exim 4.80)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1htPbN-0004jz-DL; Fri, 02 Aug 2019 14:55:37 +1000
Date:   Fri, 2 Aug 2019 14:55:37 +1000
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Chuhong Yuan <hslester96@gmail.com>
Cc:     Matt Mackall <mpm@selenic.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        =?utf-8?Q?=C5=81ukasz?= Stelmach <l.stelmach@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Deepak Saxena <dsaxena@plexity.net>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Patrice Chotard <patrice.chotard@st.com>,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] hwrng: Use device-managed registration API
Message-ID: <20190802045537.GG18077@gondor.apana.org.au>
References: <20190725080155.19875-1-hslester96@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190725080155.19875-1-hslester96@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Jul 25, 2019 at 04:01:55PM +0800, Chuhong Yuan wrote:
> Use devm_hwrng_register to simplify the implementation.
> Manual unregistration and some remove functions can be
> removed now.
> 
> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> ---
>  drivers/char/hw_random/atmel-rng.c     |  3 +--
>  drivers/char/hw_random/cavium-rng-vf.c | 11 +----------
>  drivers/char/hw_random/exynos-trng.c   |  3 +--
>  drivers/char/hw_random/n2-drv.c        |  4 +---
>  drivers/char/hw_random/nomadik-rng.c   |  3 +--
>  drivers/char/hw_random/omap-rng.c      |  3 +--
>  drivers/char/hw_random/powernv-rng.c   | 10 +---------
>  drivers/char/hw_random/st-rng.c        |  4 +---
>  drivers/char/hw_random/xgene-rng.c     |  4 +---
>  9 files changed, 9 insertions(+), 36 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
