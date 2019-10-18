Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76548DBF68
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 18 Oct 2019 10:07:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2504795AbfJRIHA (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 18 Oct 2019 04:07:00 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:37420 "EHLO fornost.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2442157AbfJRIHA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 18 Oct 2019 04:07:00 -0400
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.0.7])
        by fornost.hmeau.com with smtp (Exim 4.89 #2 (Debian))
        id 1iLNHW-00021C-T6; Fri, 18 Oct 2019 19:06:44 +1100
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation); Fri, 18 Oct 2019 19:06:42 +1100
Date:   Fri, 18 Oct 2019 19:06:42 +1100
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Laurent Vivier <lvivier@redhat.com>
Cc:     linux-kernel@vger.kernel.org, Matt Mackall <mpm@selenic.com>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-crypto@vger.kernel.org
Subject: Re: [PATCH] hwrng: core - Fix use-after-free warning in
 hwrng_register()
Message-ID: <20191018080642.GN25128@gondor.apana.org.au>
References: <20191014114632.10875-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191014114632.10875-1-lvivier@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Oct 14, 2019 at 01:46:32PM +0200, Laurent Vivier wrote:
> Commit daae28debcb0 has moved add_early_randomness() out of the
> rng_mutex and tries to protect the reference of the new rng device
> by incrementing the reference counter.
> 
> But in hwrng_register(), the function can be called with a new device
> that is not set as the current_rng device and the reference has not been
> initialized. This patch fixes the problem by not using the reference
> counter when the device is not the current one: the reference counter
> is only meaningful in the case of the current rng device and a device
> is not used if it is not the current one (except in hwrng_register())
> 
> The problem has been reported by Marek Szyprowski on ARM 32bit
> Exynos5420-based Chromebook Peach-Pit board:
> 
> WARNING: CPU: 3 PID: 1 at lib/refcount.c:156 hwrng_register+0x13c/0x1b4
> refcount_t: increment on 0; use-after-free.
> Modules linked in:
> CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.4.0-rc1-00061-gdaae28debcb0
> Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
> [<c01124c8>] (unwind_backtrace) from [<c010dfb8>] (show_stack+0x10/0x14)
> [<c010dfb8>] (show_stack) from [<c0ae86d8>] (dump_stack+0xa8/0xd4)
> [<c0ae86d8>] (dump_stack) from [<c0127428>] (__warn+0xf4/0x10c)
> [<c0127428>] (__warn) from [<c01274b4>] (warn_slowpath_fmt+0x74/0xb8)
> [<c01274b4>] (warn_slowpath_fmt) from [<c054729c>] (hwrng_register+0x13c/0x1b4)
> [<c054729c>] (hwrng_register) from [<c0547e54>] (tpm_chip_register+0xc4/0x274)
> ...
> 
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Fixes: daae28debcb0 ("hwrng: core - move add_early_randomness() out of rng_mutex")
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  drivers/char/hw_random/core.c | 33 ++++++++++++++++-----------------
>  1 file changed, 16 insertions(+), 17 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
