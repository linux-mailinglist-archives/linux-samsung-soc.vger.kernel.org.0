Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B8D4472B6B
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 13 Dec 2021 12:31:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233201AbhLMLbo (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 13 Dec 2021 06:31:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232478AbhLMLbo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Dec 2021 06:31:44 -0500
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA5DDC06173F
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Dec 2021 03:31:43 -0800 (PST)
Received: by mail-vk1-xa33.google.com with SMTP id m16so10014759vkl.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Dec 2021 03:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qC4ZSqynNet1d3u3evcixiPYa8pz+jv/1b2fg2jt3/E=;
        b=QOdBJYT2mZxle5D5I94A+YFxirEXMK7D+RZ/DmEHHV37FwvtmN6oIJBRDknSwiGG8d
         0IIhhji0n4ik7trmPe2hVh6doYu/FJx4+Aw3s/dy3dFWq6cv5cxAtPVc0RlXWu1tLXN5
         3alruEzvSjC3KPLV53F2Oz0ROUIJWWxKtmdVK9xsA5HUznbs55jDzj5EBNOp3AH+lcZ5
         e3pXgjNisPOfAddm6jPZOEu9k+ANyxJVXBbL/Ud/TFq1fBLl7q5CswANyHIhUbvUuqQS
         cZSsYBKOhMr4J1NxfjlTM13Wld9h1Yil1/XaZMjd9RoUT8JJsdZqVwdhGATQmghIeLm1
         xjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qC4ZSqynNet1d3u3evcixiPYa8pz+jv/1b2fg2jt3/E=;
        b=iL3RgcY+jusbzn1X0W9hoI7fFAYsyMxARiNc7wkqgPdpD8HL8DtAV4guJlaXSEYrsi
         Qn2umSI55iEjld/dCr/MYVcsAuDbk76eZzV304EmkogZLsTqyLK3kmzt2Q9w6fIVrX9P
         92ndtsYc2gE6+AwWKvXChVc0VqgmlSNCNUuUg0YEz6DRrvm6bcK9s39lHQbVAkuytYtA
         AhQZBX+/AesqY2PEvPg98U2+Is3qTRYavAOD+0HCiwsOvK8hlG4CLwY1sYTRXRk4oB7p
         Ce0nW0pJZ4UgJig5gN9cHOkAugtaTLLw24SvT0PbvdJeBmFR4oiuj3nvytjTZ/Rq3eGr
         LveA==
X-Gm-Message-State: AOAM531GL7TAU7dYJQkOM3l0wx6hARW/XrShOUxiQ0+8ZAzzfBqho9zZ
        4Et8l/cXB2aHigV1BHNMRI6R1mDl352DjJ1P7FqwtA==
X-Google-Smtp-Source: ABdhPJwJFk/XEEmirluOPP8pbb8Z0D6a63kxwCab2jfc0C6ZaALAayx2vMQ1tnqCAiJ61OFpnO5j62GEEyhjDWlrTCs=
X-Received: by 2002:a05:6122:c9b:: with SMTP id ba27mr30928520vkb.14.1639395103089;
 Mon, 13 Dec 2021 03:31:43 -0800 (PST)
MIME-Version: 1.0
References: <20211204195757.8600-1-semen.protsenko@linaro.org>
 <20211204195757.8600-4-semen.protsenko@linaro.org> <e9472cec-7aca-92c4-6184-f442c0f88d56@canonical.com>
In-Reply-To: <e9472cec-7aca-92c4-6184-f442c0f88d56@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 13 Dec 2021 13:31:31 +0200
Message-ID: <CAPLW+4kWmSK7rmUO-bBj-U=JyGWWgguBL2dLa6KCbX6q5CJshA@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] tty: serial: samsung: Remove USI initialization
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 13 Dec 2021 at 13:00, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 04/12/2021 20:57, Sam Protsenko wrote:
> > USI control is now extracted to the dedicated USI driver. Remove USI
> > related code from serial driver to avoid conflicts and code duplication.
> >
> > Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> > ---
> > Changes in v3:
> >   - Spell check fixes in commit message
> >
> > Changes in v2:
> >   - (none)
> >
> >  drivers/tty/serial/samsung_tty.c | 36 ++++----------------------------
> >  include/linux/serial_s3c.h       |  9 --------
> >  2 files changed, 4 insertions(+), 41 deletions(-)
> >
>
> Hi Sam,
>
> Does this patch depend on USI driver? In cover letter you did not
> mention any dependency, so this can go via Greg's tree, right?
>

Hi Krzysztof,

TL;DR: Serial patches from this series don't really depend on USI
driver and can go via Greg's tree.

I'd say ideally those should be applied right after USI driver
patches. Because otherwise we'd have double initialization of USI
block (from USI driver and from serial driver), which wasn't tested
and may lead to not functional USI (though I think it should be fine).
That's why I decided to keep those in one single patch series. But if
we don't care about some short period of not tested behavior -- then
those can go via Greg's tree.

> Best regards,
> Krzysztof
