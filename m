Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A02361D3EF3
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 14 May 2020 22:23:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbgENUXb (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 14 May 2020 16:23:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726241AbgENUXb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 May 2020 16:23:31 -0400
X-Greylist: delayed 162 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 14 May 2020 13:23:30 PDT
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5301::9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEFFDC061A0C
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 May 2020 13:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1589487809;
        s=strato-dkim-0002; d=chronox.de;
        h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=5qEHN9Aos9wJSmrSmHepYAI40f0iVUfr9ovzdP/JcuY=;
        b=oM4UzZVan4ExOmLrZbWJoY+6M6SOvijGRGE8yAN2tUPd9YK6g+qQCtKmYrx2lXPgaJ
        05KK4KLSFW4ejXEhXxcAJW6b80mbNJFpEesPDxPv7m3/3hG+oUPFz9Zao12lpmRVQ1Ja
        WZHv9Gs8NvCjAmFkMs0tkU1q0MlcWPfnzjby/6E8opWNrYIOEEt59g4WJVmzTkUc9cXo
        MYMtVThldwvkdvYE0U46fijhjdHlFpd1UMTr07AJ3d81Hn1kZOALznPuLbsSWwDlovYo
        LRFfvC4WGIj5BZYzGQMqs/RuI9wYxx6JcBlvMPRhCiqiQPylfspxWSliVK1HM0UzNIJH
        gc2g==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9xmwdNnzGHXPaJfSc9C1S"
X-RZG-CLASS-ID: mo00
Received: from tauon.chronox.de
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id u08bf3w4EKKQxtG
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Thu, 14 May 2020 22:20:26 +0200 (CEST)
From:   Stephan Mueller <smueller@chronox.de>
To:     =?utf-8?B?xYF1a2Fzeg==?= Stelmach <l.stelmach@samsung.com>
Cc:     Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Markus Elfring <elfring@users.sourceforge.net>,
        Matthias Brugger <mbrugger@suse.com>,
        Stefan Wahren <wahrenst@gmx.net>, linux-crypto@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/2] hwrng: iproc-rng200 - Set the quality value
Date:   Thu, 14 May 2020 22:20:26 +0200
Message-ID: <4493123.C11H8YMYNy@tauon.chronox.de>
In-Reply-To: <20200514190734.32746-2-l.stelmach@samsung.com>
References: <20200514190734.32746-1-l.stelmach@samsung.com> <CGME20200514190738eucas1p2695c0d8af064ee702209ca03696ef438@eucas1p2.samsung.com> <20200514190734.32746-2-l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Am Donnerstag, 14. Mai 2020, 21:07:33 CEST schrieb =C5=81ukasz Stelmach:

Hi =C5=81ukasz,

> The value has been estimaded by obtainig 1024 chunks of data 128 bytes
> (1024 bits) each from the generator and finding chunk with minimal
> entropy using the ent(1) tool. The value was 6.327820 bits of entropy
> in each 8 bits of data.

I am not sure we should use the ent tool to define the entropy level. Ent=20
seems to use a very coarse entropy estimation.

I would feel more comfortable when using other measures like SP800-90B whic=
h=20
even provides a tool for the analysis.

I understand that entropy estimates, well, are estimates. But the ent data =
is=20
commonly not very conservative.

[1] https://github.com/usnistgov/SP800-90B_EntropyAssessment

Ciao
Stephan


