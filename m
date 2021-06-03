Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B472E39A0DE
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  3 Jun 2021 14:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhFCMb2 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 3 Jun 2021 08:31:28 -0400
Received: from helcar.hmeau.com ([216.24.177.18]:60854 "EHLO deadmen.hmeau.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229840AbhFCMb2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Jun 2021 08:31:28 -0400
Received: from gondobar.mordor.me.apana.org.au ([192.168.128.4] helo=gondobar)
        by deadmen.hmeau.com with esmtp (Exim 4.92 #5 (Debian))
        id 1lomTj-0001wi-QN; Thu, 03 Jun 2021 20:29:39 +0800
Received: from herbert by gondobar with local (Exim 4.92)
        (envelope-from <herbert@gondor.apana.org.au>)
        id 1lomTf-0001cl-TU; Thu, 03 Jun 2021 20:29:35 +0800
Date:   Thu, 3 Jun 2021 20:29:35 +0800
From:   Herbert Xu <herbert@gondor.apana.org.au>
To:     Tian Tao <tiantao6@hisilicon.com>
Cc:     l.stelmach@samsung.com, krzysztof.kozlowski@canonical.com,
        linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tiantao6@hisilicon.com
Subject: Re: [PATCH v2] hwrng: exynos: Use pm_runtime_resume_and_get() to
 replace open coding
Message-ID: <20210603122935.GA6226@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621857218-28590-1-git-send-email-tiantao6@hisilicon.com>
X-Newsgroups: apana.lists.os.linux.cryptoapi
Organization: Core
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Tian Tao <tiantao6@hisilicon.com> wrote:
> use pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
> pm_runtime_put_noidle. this change is just to simplify the code, no
> actual functional changes.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
> v2: drop unnecessary change about if condition.
> ---
> drivers/char/hw_random/exynos-trng.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
