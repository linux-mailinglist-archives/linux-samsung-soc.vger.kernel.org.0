Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEE7A259372
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  1 Sep 2020 17:26:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730058AbgIAPZi (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 1 Sep 2020 11:25:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:50310 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730052AbgIAPZh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Sep 2020 11:25:37 -0400
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 02D64206FA;
        Tue,  1 Sep 2020 15:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598973936;
        bh=dt0uPCgqA2UkzByRpvH836C/HijSVdlozfTi2rrAOao=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=C7uOrhsVqPRlHMAta5eV8ksbBFNCUpIBGOOrdMg7foI7teaTc1REKWNu5TxY3Es0S
         e6lOqcIlrvmJToIoMes2VDNaHEZjlMpxy29Jma4MlAk0c72oK1cl9LoPBjQcrjLxOI
         cCjvgm2xS9BjFEOYNSVYWDzOwFwvWS5MHeBnvW3M=
Received: by mail-ej1-f53.google.com with SMTP id d26so2276846ejr.1;
        Tue, 01 Sep 2020 08:25:35 -0700 (PDT)
X-Gm-Message-State: AOAM531FcbFJvbC9qYlWLcLIsQGPEPf1ZlCIOas2rX/18AIq1+86lLu2
        KEXcGNFGpHeRmJUejmenw7AyQ/fliVpl/sE8a3g=
X-Google-Smtp-Source: ABdhPJzh1hNetH5rZ60C9AUx80r4SPqL6nutQWfXz6QlHt16bwsP6Lk4YkuJbUpSKMu3AEV2K/P421eyp+7Rtv3kzNc=
X-Received: by 2002:a17:906:9356:: with SMTP id p22mr1858821ejw.119.1598973934455;
 Tue, 01 Sep 2020 08:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <267a81e550a0b5d479c82b5908e2a2caa4c9c874.1597061474.git.guillaume.tucker@collabora.com>
 <c0509b5f-a064-2e73-7e04-51f41a56d222@collabora.com> <CAJKOXPczS_RpSFpjGygZ_1MCYxJ_cUDRjriZvrHd6+zhmq=c8Q@mail.gmail.com>
 <CAJKOXPfT7LvHVpTdaQ1voVi=OtC4aV6hbyzcekmrPMkb+5ebNg@mail.gmail.com> <fd1a34c4-dcc1-1480-1e96-8bd94ada9846@collabora.com>
In-Reply-To: <fd1a34c4-dcc1-1480-1e96-8bd94ada9846@collabora.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 1 Sep 2020 17:25:23 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdQiXc3zVRK25AsfYPBwL1Rm6y1niFt5wxkC5gH5baiZA@mail.gmail.com>
Message-ID: <CAJKOXPdQiXc3zVRK25AsfYPBwL1Rm6y1niFt5wxkC5gH5baiZA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] ARM: exynos: clear L310_AUX_CTRL_NS_LOCKDOWN in
 default l2c_aux_val
To:     Guillaume Tucker <guillaume.tucker@collabora.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, kernel@collabora.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 1 Sep 2020 at 16:42, Guillaume Tucker
<guillaume.tucker@collabora.com> wrote:
>
> On 01/09/2020 14:51, Krzysztof Kozlowski wrote:
> > On Tue, 1 Sep 2020 at 15:45, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>
> >> On Tue, 1 Sep 2020 at 15:34, Guillaume Tucker
> >> <guillaume.tucker@collabora.com> wrote:
> >>>
> >>> Hi Krzysztof, Russell,
> >>>
> >>> On 10/08/2020 13:22, Guillaume Tucker wrote:
> >>>> The L310_AUX_CTRL_NS_LOCKDOWN flag is set during the L2C enable
> >>>> sequence.  There is no need to set it in the default register value,
> >>>> this was done before support for it was implemented in the code.  It
> >>>> is not set in the hardware initial value either.
> >>>>
> >>>> Clean this up by removing this flag from the default l2c_aux_val, and
> >>>> add it to the l2c_aux_mask to print an alert message if it was already
> >>>> set before the kernel initialisation.
> >>>>
> >>>> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
> >>>> ---
> >>>>
> >>>> Notes:
> >>>>     v2: fix flag name L310_AUX_CTRL_NS_LOCKDOWN
> >>>>
> >>>>  arch/arm/mach-exynos/exynos.c | 4 ++--
> >>>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> I believe this v2 series has addressed all previous comments and
> >>> you were waiting for the 5.9 merge window to end.  The patches
> >>> all still apply cleanly on v5.9-rc3.  Do you want me to resend
> >>> the series anyway or is there anything else needed at this point?
> >>>
> >>> Maybe one thing that wasn't completely clear in v1 was whether
> >>> patch 2/4 was the right approach.  I've explained the reason
> >>> behind it but didn't get a final reply from Russell[1].
> >>
> >> I am sorry, my bad. I already applied this one and 3/4 (dts).
> >> Apparently I forgot to reply with confirmation and Patchwork did not
> >> notify you for some reason.
>
> No problem, I see them in linux-next now.  Thanks!
>
> >> Patch 2/4 does not look like one for me so I would need ack from
> >> Russell to take. Did you submit it to the ARM patches queue?
>
> I've CC-ed linux-arm-kernel@lists.infradead.org on the whole
> series.  Did you mean anything else by the ARM patches queue?

Unless anything changed, so far all ARM-core related patches had to be
submitted to Russell's system. I didn't submit anything for 3 years so
maybe something changed...
https://www.arm.linux.org.uk/developer/patches/

Best regards,
Krzysztof
