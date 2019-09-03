Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B484AA622A
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  3 Sep 2019 09:04:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbfICHEi (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 3 Sep 2019 03:04:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:54104 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725878AbfICHEi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Sep 2019 03:04:38 -0400
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7038323401
        for <linux-samsung-soc@vger.kernel.org>; Tue,  3 Sep 2019 07:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567494276;
        bh=WLp1f5cOEPDmKPiQ5B8TdG9marHgUtMjLyqWzoyLoak=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=BOeZSnkTCv3RQZoNxDU7FrTWt/DHvyBdNzheXUDLi/OmM8rD6PljhNP4hkXMenhvW
         uo6lhzkvilKDHo1PJ2R5rFjKeC7C1SI/4Tv8GpeBEF7IjItlC7CLOcVOQPmwdHmY3M
         U02hKehsPSSAfT4XnheusEy6UQE87u3s0AcN2xjM=
Received: by mail-lj1-f171.google.com with SMTP id l14so14919346lje.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Sep 2019 00:04:36 -0700 (PDT)
X-Gm-Message-State: APjAAAV5S04eEtRHUDsCwVOgoLpNbuGh8eurFNOZDFvHu0BmvX1eL7EJ
        l5sjvn2cUK4tLBs5fJlPkDjMno5czYnbGVK1/98=
X-Google-Smtp-Source: APXvYqzlx4zOoEstk7bgo2PL8WlITlAaTRYZlw9X32d9v0ngNpQZSUt5tsE6Eb2leZlHXBIi9hvvD1GUknbRnU3nJuA=
X-Received: by 2002:a2e:9a18:: with SMTP id o24mr7259269lji.123.1567494274643;
 Tue, 03 Sep 2019 00:04:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190725083433.6505-1-guillaume.gardet@arm.com>
 <20190830104502.7128-1-guillaume.gardet@arm.com> <20190830104502.7128-2-guillaume.gardet@arm.com>
 <20190902153146.GB9289@kozik-lap> <CAJKOXPe8QDzDoM4sKva0qrVUA7EMTR7FO5jGut+Paw9mAcdfAw@mail.gmail.com>
 <VE1PR08MB468570F2B6851C4CD3E80A5083B90@VE1PR08MB4685.eurprd08.prod.outlook.com>
In-Reply-To: <VE1PR08MB468570F2B6851C4CD3E80A5083B90@VE1PR08MB4685.eurprd08.prod.outlook.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 3 Sep 2019 09:04:23 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcYv_7s9wJQQL7Z7BYLCKmADG_h37yU1Z4e=Qv7vAxosw@mail.gmail.com>
Message-ID: <CAJKOXPcYv_7s9wJQQL7Z7BYLCKmADG_h37yU1Z4e=Qv7vAxosw@mail.gmail.com>
Subject: Re: [PATCH V3 1/5] dt-bindings: gpu: mali-midgard: Add samsung
 exynos5250 compatible
To:     Guillaume Gardet <Guillaume.Gardet@arm.com>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 3 Sep 2019 at 09:03, Guillaume Gardet <Guillaume.Gardet@arm.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > Sent: 03 September 2019 08:56
> > To: Guillaume Gardet <Guillaume.Gardet@arm.com>
> > Cc: linux-samsung-soc@vger.kernel.org; Kukjin Kim <kgene@kernel.org>;
> > Marek Szyprowski <m.szyprowski@samsung.com>; linux-arm-
> > kernel@lists.infradead.org
> > Subject: Re: [PATCH V3 1/5] dt-bindings: gpu: mali-midgard: Add samsung
> > exynos5250 compatible
> >
> > On Mon, 2 Sep 2019 at 17:31, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >
> > > On Fri, Aug 30, 2019 at 12:44:58PM +0200, Guillaume Gardet wrote:
> > > > Add "samsung,exynos5250-mali" binding.
> > > >
> > > > Signed-off-by: Guillaume Gardet <guillaume.gardet@arm.com>
> > > >
> > > > Cc: Kukjin Kim <kgene@kernel.org>
> > > > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > > > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > ---
> > > > V3 changes:
> > > >   * add dt-bindings before node in device tree
> > > > V2 changes:
> > > >   * new file
> > > >
> > > >  Documentation/devicetree/bindings/gpu/arm,mali-midgard.txt | 1 +
> > >
> > > Thanks, entire set applied (with re-ordering and minor description
> > > changes).
> >
> > Hi Guillaume,
>
> Hi,
>
> >
> > I applied yesterday entire patchset but this dt-bindings patch causes big
> > merge conflict which will not be reasonable to resolve by Linus.
> > Can you rebase this patch on top of latest linux-next? Basically you would
> > need to add respective entries to new YAML file:
> > Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
> >
> > Send it to regular dt-bindings maintainers (scripts/get_maintainers.pl).
>
> IIUC, I just need to resend this patch (1/5) rebased to use yaml, instead of txt, no need to resend other patches, right?

Yes, correct. Just remember to send it to proper maintainers (previous
one skipped DT guys).

Best regards,
Krzysztof
