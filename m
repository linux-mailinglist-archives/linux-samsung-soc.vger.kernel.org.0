Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D890264D72
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 10 Jul 2019 22:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbfGJUWM (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 10 Jul 2019 16:22:12 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:35949 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfGJUWL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 10 Jul 2019 16:22:11 -0400
Received: by mail-io1-f67.google.com with SMTP id o9so7627520iom.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2019 13:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DlFRlvlH9bN0SYpSDNk4APXnCg4d/CNCqu9ZPK+njpg=;
        b=Ugp7S7GFWdWPqCLlfCk+lMD6r2Vg7SKm/PaJOARJkx7lubIx1VUsoQQeklzDVBe/5O
         dOlmTOahKL1oFh+CKCrVBRY+ZaLF7YKnqm+F2oVkHTvC7JiAcNI6xgGAeo/miO9eMT2T
         4VgFxIdDMYWHgNraVouGl6QVmCdZ4+fCMklhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DlFRlvlH9bN0SYpSDNk4APXnCg4d/CNCqu9ZPK+njpg=;
        b=c41IAaCIOfbsgN7hTjuIMGzpIa5Jxb4FMLt0glAH4aDtJUzWe+Ho0haUibW0wFDcCV
         iRTtMlm+CsCYaAwk59tXb4GEjCvoxe6LdHiCuVk9kbKxyzeZSwlrTPOsPrGGflPGoYWE
         Wn60kAnmE3NVuOJbwJQTv/tAR5kOKU0NZY48Ejgv5L74P95dCKelBlPnJOZ97Odb2hGv
         TEfCWdks9gwW2lVid1EH4JZpKW+FeBysDP1khRgYF+etIdACNvPsd2riPbQk0Hdg10S8
         +HKyJ6z3trJYnN7l6TY6ZesxBIgPCc9P1k2pQGk+p89QaohzMLH+wwQzYAyi8vFOjvBF
         YHAw==
X-Gm-Message-State: APjAAAVOtH3xxO3e7Ix28uTsfIudYafsly2SABG17iKZtF0OPfZLuJML
        L4sSL1KCGMjQ/H5ckDJt8vw8wt1SLPU=
X-Google-Smtp-Source: APXvYqzniUpE30JPm6tm9xFut5SR3umwhloU18cIgt73Sao0+mBr2TrWYvqLklV344BVRp1FfAUyGA==
X-Received: by 2002:a5d:9ec4:: with SMTP id a4mr32700033ioe.125.1562790130403;
        Wed, 10 Jul 2019 13:22:10 -0700 (PDT)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id o7sm2668132ioo.81.2019.07.10.13.22.09
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 13:22:09 -0700 (PDT)
Received: by mail-io1-f48.google.com with SMTP id j6so7591176ioa.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 10 Jul 2019 13:22:09 -0700 (PDT)
X-Received: by 2002:a5d:885a:: with SMTP id t26mr11784877ios.218.1562790128781;
 Wed, 10 Jul 2019 13:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190708195613.205729-1-dianders@chromium.org>
 <CAJKOXPf9OTPaheUdiZtaDGU0sE2vsdRiLx5nptMt_EVKU7GObA@mail.gmail.com>
 <CAD=FV=WquwqKjUKh5=M6tbTrD3svVTGWLU3iSTzD-uXBX73YWA@mail.gmail.com> <CAD=FV=X=RALazfX+vjQ7E-JmVu6xqDWCad5hPF+gNtHCuvZMTA@mail.gmail.com>
In-Reply-To: <CAD=FV=X=RALazfX+vjQ7E-JmVu6xqDWCad5hPF+gNtHCuvZMTA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 10 Jul 2019 13:21:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WL_Hy78REn+0CMOjYgPcuDcN1w-+94QD9HHJraQBNj4g@mail.gmail.com>
Message-ID: <CAD=FV=WL_Hy78REn+0CMOjYgPcuDcN1w-+94QD9HHJraQBNj4g@mail.gmail.com>
Subject: Re: [PATCH] mmc: dw_mmc: Fix occasional hang after tuning on eMMC
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Jaehoon Chung <jh80.chung@samsung.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Brian Norris <briannorris@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Sonny Rao <sonnyrao@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On Tue, Jul 9, 2019 at 3:02 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Jul 9, 2019 at 9:38 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Tue, Jul 9, 2019 at 2:07 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > >
> > > On Tue, 9 Jul 2019 at 00:48, Douglas Anderson <dianders@chromium.org> wrote:
> > > >
> > > > In commit 46d179525a1f ("mmc: dw_mmc: Wait for data transfer after
> > > > response errors.") we fixed a tuning-induced hang that I saw when
> > > > stress testing tuning on certain SD cards.  I won't re-hash that whole
> > > > commit, but the summary is that as a normal part of tuning you need to
> > > > deal with transfer errors and there were cases where these transfer
> > > > errors was putting my system into a bad state causing all future
> > > > transfers to fail.  That commit fixed handling of the transfer errors
> > > > for me.
> > > >
> > > > In downstream Chrome OS my fix landed and had the same behavior for
> > > > all SD/MMC commands.  However, it looks like when the commit landed
> > > > upstream we limited it to only SD tuning commands.  Presumably this
> > > > was to try to get around problems that Alim Akhtar reported on exynos
> > > > [1].
> > > >
> > > > Unfortunately while stress testing reboots (and suspend/resume) on
> > > > some rk3288-based Chromebooks I found the same problem on the eMMC on
> > > > some of my Chromebooks (the ones with Hynix eMMC).  Since the eMMC
> > > > tuning command is different (MMC_SEND_TUNING_BLOCK_HS200
> > > > vs. MMC_SEND_TUNING_BLOCK) we were basically getting back into the
> > > > same situation.
> > > >
> > > > I'm hoping that whatever problems exynos was having in the past are
> > > > somehow magically fixed now and we can make the behavior the same for
> > > > all commands.
> > > >
> > > > [1] https://lkml.kernel.org/r/CAGOxZ53WfNbaMe0_AM0qBqU47kAfgmPBVZC8K8Y-_J3mDMqW4A@mail.gmail.com
> > > >
> > > > Fixes: 46d179525a1f ("mmc: dw_mmc: Wait for data transfer after response errors.")
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > > > Cc: Alim Akhtar <alim.akhtar@gmail.com>
> > > > Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > > > ---
> > > > Marek (or anyone else using exynos): is it easy for you to test this
> > > > and check if things are still broken when we land this patch?  If so,
> > > > I guess we could have a quirk to have different behavior for just
> > > > Rockchip SoCs but I'd rather avoid that if possible.
> > > >
> > > > NOTE: I'm not hoping totally in vain here.  It is possible that some
> > > > of the CTO/DTO timers that landed could be the magic that would get
> > > > exynos unstuck.
> > >
> > > I have eMMC module attached to Odroid U3 (Exynos4412,
> > > samsung,exynos4412-dw-mshc). What is the testing procedure? With your
> > > patch it boots fine:
> > > [    3.698637] mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot
> > > req 52000000Hz, actual 50000000HZ div = 0)
> > > [    3.703900] mmc1: new DDR MMC card at address 0001
> > > [    3.728458] mmcblk1: mmc1:0001 008G92 7.28 GiB
> >
> > To really test it, it'd be nice to see some HS200 eMMC cards enumerate
> > OK.  Specifically the patch adjusts the error handling and the place
> > where that happens mostly is during tuning.
> >
> > I'll also try to find some time today to check a peach_pit or a
> > peach_pi.  I think I saw one in the pile near my desk so if it isn't
> > in too bad of a shape I can give mainline a shot on it.
>
> OK, I managed to get an exynos5800-peach-pi up and running.  I put my
> patch in place and am currently at 45 reboots and counting w/ no
> problems.

In case it helps, I made it through 2379 more reboots on my peach_pi
w/ no hangs.  I'm putting the device back in mothball now.  :-P  I
didn't go back and try to reproduce the original problems so I guess I
can't assert with 100% authority that the original issue is gone, but
my testing combined with Enric's seems like things are working fine.

-Doug
