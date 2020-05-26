Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFA8E1D4924
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 15 May 2020 11:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727910AbgEOJLB (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 15 May 2020 05:11:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726922AbgEOJLA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 May 2020 05:11:00 -0400
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de [IPv6:2a01:238:20a:202:5302::11])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E181EC061A0C;
        Fri, 15 May 2020 02:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1589533857;
        s=strato-dkim-0002; d=chronox.de;
        h=References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=5rOBFNRSIm8wOG/3ZTXTdyUjSY/V30dWRh3affiRjZo=;
        b=ZmqiM4bIncVzBB4IViZsPHc+iMbDAkEidtyCdmA6xmPNkxaCstxJne/PRDsvlrelaK
        dSLwRZwWfuEXE9pM+TKQjOrvt7g+N5d27qPVoPPRgOuptx7puheA/AH2J3AcWGvQkD0M
        CTzA6r6WvRTG0BUUfeTE+/BBGoV4UUl/UPMb/SDcGbziVT/HuLgTCWZdbwVmJ1S5SqMC
        FfW+cIoCZASVKDiAECFS2FfCAmpToN4G16Es16X4ZSLMPUPicgeRqcd29cZg3f2X+KZX
        dSSu0Pl48AfAj8ipZHIUbgSclgGO3XKdRnDysGHDieJ668xJVo6MHIwIifnnjusiDMWJ
        xnGA==
X-RZG-AUTH: ":P2ERcEykfu11Y98lp/T7+hdri+uKZK8TKWEqNyiHySGSa9k9xmwdNnzGHXPaJfSc9C1S"
X-RZG-CLASS-ID: mo00
Received: from tauon.chronox.de
        by smtp.strato.de (RZmta 46.6.2 DYNA|AUTH)
        with ESMTPSA id u08bf3w4F9Aj0s8
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Fri, 15 May 2020 11:10:45 +0200 (CEST)
From:   Stephan Mueller <smueller@chronox.de>
To:     Lukasz Stelmach <l.stelmach@samsung.com>
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
Date:   Fri, 15 May 2020 11:10:45 +0200
Message-ID: <3640422.T8yoyu11Ch@tauon.chronox.de>
In-Reply-To: <dleftjimgx8tc3.fsf%l.stelmach@samsung.com>
References: <4493123.C11H8YMYNy@tauon.chronox.de> <CGME20200515090158eucas1p1b653fc50f1ad4f0f6c92525ab3188d45@eucas1p1.samsung.com> <dleftjimgx8tc3.fsf%l.stelmach@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Am Freitag, 15. Mai 2020, 11:01:48 CEST schrieb Lukasz Stelmach:

Hi Lukasz,


As I mentioned, all that is or seems to be analyzed here is the quality of the 
cryptographic post-processing. Thus none of the data can be used for getting 
an idea of the entropy content.

That said, the ent value indeed looks too low which seems to be an issue in 
the tool itself.

Note, for an entropy assessment commonly at least 1 million traces from the 
raw noise source are needed.

See for examples on how such entropy assessments are conducted in the LRNG 
documentation [1] or the Linux /dev/random implementation in [2]

[1] appendix C of https://www.chronox.de/lrng/doc/lrng.pdf

[2] chapter 6 of https://www.bsi.bund.de/SharedDocs/Downloads/EN/BSI/
Publications/Studies/LinuxRNG/LinuxRNG_EN.pdf

Ciao
Stephan


