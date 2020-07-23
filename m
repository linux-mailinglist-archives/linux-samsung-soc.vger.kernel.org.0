Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D62F22AAE9
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 23 Jul 2020 10:44:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726975AbgGWIoJ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 23 Jul 2020 04:44:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbgGWIoI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Jul 2020 04:44:08 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E601C0619E2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jul 2020 01:44:08 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id z24so5455400ljn.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jul 2020 01:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CkH2cH1tSHkiWUdx4NYvU3H/EJsQDUARMZQ26FKEGq4=;
        b=kxz381FsxyT6cNf9sYuimdhuIrl8nxWcoY7uM46nPmZffugo6no1qzJr5aIXrKo7h2
         5/8PKpg8A61z+wAa44SJdBgFVJmKEebebfWSTexkPuGPVtDBC+M8W2EETKfrxS/ajZbu
         jrLJqSTpXgSXiW+U+t9OKLEoilfVGq/LOzePAnPruqfi0mbPianEerwMGFitwc7Zj1Ix
         jwx6dUtf//RZoU+1i1gpp60/9sLPr1XTolu2Q1iQAAuEoUllIQ192rjwvvpx08okrahQ
         YV0s8XPRp2ObxIqNjdJ3SXyRjL2Ip5CA52ocGM7KqHgdPd90tsqQTO0UAmjRMnGvGkwb
         Q1Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CkH2cH1tSHkiWUdx4NYvU3H/EJsQDUARMZQ26FKEGq4=;
        b=W5D9MdUULvnfXpZmY5OUMy4c3yIBTRymLzXCp4PVdmpYPzLKjRhUWyUIDA7T87x63P
         R9hLNj1oIQzhSUfidiipuYEoCF+yTW3QCtAJ4NdEcvQ/lWbwIG8puLytVJEL2jElhq4C
         7XKd9MZ3yR1r8UCH6IPjrdVK9BHAVNMn63cWWnO0p2maRSj1awS8/90OS6GOaeUFZ4vV
         mpQoGRt93uyvhNN3tDkWE+WXjEFNFuOQ14tn+ZUQluQKsgB99N8WKEkGRCMQWES4nY4L
         HFhWNMT5h914mvUZd1iSzmQNEzKg938CCQGPmsVz6tJpqOyh+Mj2LfeCIj5kVThgH2ky
         iJCA==
X-Gm-Message-State: AOAM532LrWg/BCy/mhLNVfz+gWC1qCR0FENBQ6BlfiABdc7d6h+PxIDg
        KPcYIQonNtHPKh/M3SU2t1zZqoCH9RTAgFYj9Vy0nw==
X-Google-Smtp-Source: ABdhPJy9FYQzEz5+a+xAYCl+rAh2wms4y8ztY1F8hFb6jAnV1ZJBUBI6y73dlz37/bChnljh88y3BVK9wCTiobiTO6M=
X-Received: by 2002:a05:651c:1291:: with SMTP id 17mr1628930ljc.286.1595493846705;
 Thu, 23 Jul 2020 01:44:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200713144930.1034632-1-lee.jones@linaro.org>
 <20200713144930.1034632-7-lee.jones@linaro.org> <20200720142714.GA6747@kozik-lap>
 <20200720144955.GD3368211@dell> <20200720145219.GA23990@kozik-lap>
In-Reply-To: <20200720145219.GA23990@kozik-lap>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Jul 2020 10:43:55 +0200
Message-ID: <CACRpkdaYQ3PEh838Qoxig4n1iNFp8AOj_Wk9jdvB-qMy0PBRKw@mail.gmail.com>
Subject: Re: [PATCH 06/25] pinctrl: samsung: pinctrl-samsung: Demote obvious
 misuse of kerneldoc to standard comment blocks
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Thomas Abraham <thomas.ab@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Jul 20, 2020 at 4:52 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Mon, Jul 20, 2020 at 03:49:55PM +0100, Lee Jones wrote:

> > > Thanks, applied.
> >
> > Same as the others.  Already in -next.
>
> Thanks for letting me know. I dropped all of them.

It's a bit tricky at times with clean-up topics, I want submaintainers to pick
it up if possible so sorry about this, it's just too much to coordinate
sometimes.

Yours,
Linus Walleij
