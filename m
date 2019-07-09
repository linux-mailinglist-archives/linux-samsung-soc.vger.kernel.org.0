Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 56A7763981
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  9 Jul 2019 18:38:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbfGIQi0 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 9 Jul 2019 12:38:26 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:43850 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726251AbfGIQi0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 Jul 2019 12:38:26 -0400
Received: by mail-io1-f65.google.com with SMTP id k20so44494111ios.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Jul 2019 09:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7LyPt6s8cmj2YeHR2PAPborfu2KKdQ1FBhjJQUrozkY=;
        b=hymN+SGItF5+W/FKPKUNzfx+sYCF7lrclzLDP+3xCJsCsA/G5hsw8ipGmbWA8qhea3
         JrueQbJRyfnCm6/NX6XY0jIcPdXB4WZrc6nwZ/3c1SkLh5n8I5TUoI/qmMvlgvH0rjak
         y5Pjah8+2NX+xNjbWchfzo7D2AAB1Ce+3qtjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7LyPt6s8cmj2YeHR2PAPborfu2KKdQ1FBhjJQUrozkY=;
        b=LPATKw3797r4UYCIr3ICnocIqy2XF+Ys3FgpR9i9EzCiYHLdciZkgijQ5E7/mG/5J7
         DkaUQdobeuPFGf5jWZY2DzmysFk7jffQRB61FLB4RHefoBBL9b6faPHzRJeFbuJ9T90s
         bTnO5gQvJ5x42yXZVhrjgWRal4fa1eLH7iZ/pbII7cy9LLMjAob86BLqaPNnS+vkUNcz
         UpCj/zhJJmZz1E8Rej5OPqyDjmMRnUh4k7p55aimDpVC4q8fhIrB2i6c6Gh8tXd9P9UF
         xukAOoK7FNbKUwfNmR60CAKk4OJ7qcVy3LzoFn+HQpiFCpi3koOdh+uiECd/2nyUNSIf
         bpXw==
X-Gm-Message-State: APjAAAVrstTA/akOww/FmcecXL32XRoSRjuDRwN3bDQsniJVaEdZdE5y
        x5mw5tbIYlksCXkfEzTjbfYuhLZdmI0=
X-Google-Smtp-Source: APXvYqxDgmsj4xDYxq3pAxpm0uosYQm0GsvQMBfwyUxGTHv+p6qTeiTz2HfD2yHHimrH8+6fyxcATA==
X-Received: by 2002:a6b:8bcb:: with SMTP id n194mr21822973iod.194.1562690304823;
        Tue, 09 Jul 2019 09:38:24 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com. [209.85.166.47])
        by smtp.gmail.com with ESMTPSA id k5sm26140136ioj.47.2019.07.09.09.38.22
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jul 2019 09:38:23 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id g20so23427168ioc.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Jul 2019 09:38:22 -0700 (PDT)
X-Received: by 2002:a02:5b05:: with SMTP id g5mr27979726jab.114.1562690302600;
 Tue, 09 Jul 2019 09:38:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190708195613.205729-1-dianders@chromium.org> <CAJKOXPf9OTPaheUdiZtaDGU0sE2vsdRiLx5nptMt_EVKU7GObA@mail.gmail.com>
In-Reply-To: <CAJKOXPf9OTPaheUdiZtaDGU0sE2vsdRiLx5nptMt_EVKU7GObA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 9 Jul 2019 09:38:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WquwqKjUKh5=M6tbTrD3svVTGWLU3iSTzD-uXBX73YWA@mail.gmail.com>
Message-ID: <CAD=FV=WquwqKjUKh5=M6tbTrD3svVTGWLU3iSTzD-uXBX73YWA@mail.gmail.com>
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

On Tue, Jul 9, 2019 at 2:07 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Tue, 9 Jul 2019 at 00:48, Douglas Anderson <dianders@chromium.org> wrote:
> >
> > In commit 46d179525a1f ("mmc: dw_mmc: Wait for data transfer after
> > response errors.") we fixed a tuning-induced hang that I saw when
> > stress testing tuning on certain SD cards.  I won't re-hash that whole
> > commit, but the summary is that as a normal part of tuning you need to
> > deal with transfer errors and there were cases where these transfer
> > errors was putting my system into a bad state causing all future
> > transfers to fail.  That commit fixed handling of the transfer errors
> > for me.
> >
> > In downstream Chrome OS my fix landed and had the same behavior for
> > all SD/MMC commands.  However, it looks like when the commit landed
> > upstream we limited it to only SD tuning commands.  Presumably this
> > was to try to get around problems that Alim Akhtar reported on exynos
> > [1].
> >
> > Unfortunately while stress testing reboots (and suspend/resume) on
> > some rk3288-based Chromebooks I found the same problem on the eMMC on
> > some of my Chromebooks (the ones with Hynix eMMC).  Since the eMMC
> > tuning command is different (MMC_SEND_TUNING_BLOCK_HS200
> > vs. MMC_SEND_TUNING_BLOCK) we were basically getting back into the
> > same situation.
> >
> > I'm hoping that whatever problems exynos was having in the past are
> > somehow magically fixed now and we can make the behavior the same for
> > all commands.
> >
> > [1] https://lkml.kernel.org/r/CAGOxZ53WfNbaMe0_AM0qBqU47kAfgmPBVZC8K8Y-_J3mDMqW4A@mail.gmail.com
> >
> > Fixes: 46d179525a1f ("mmc: dw_mmc: Wait for data transfer after response errors.")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> > Cc: Alim Akhtar <alim.akhtar@gmail.com>
> > Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> > ---
> > Marek (or anyone else using exynos): is it easy for you to test this
> > and check if things are still broken when we land this patch?  If so,
> > I guess we could have a quirk to have different behavior for just
> > Rockchip SoCs but I'd rather avoid that if possible.
> >
> > NOTE: I'm not hoping totally in vain here.  It is possible that some
> > of the CTO/DTO timers that landed could be the magic that would get
> > exynos unstuck.
>
> I have eMMC module attached to Odroid U3 (Exynos4412,
> samsung,exynos4412-dw-mshc). What is the testing procedure? With your
> patch it boots fine:
> [    3.698637] mmc_host mmc1: Bus speed (slot 0) = 50000000Hz (slot
> req 52000000Hz, actual 50000000HZ div = 0)
> [    3.703900] mmc1: new DDR MMC card at address 0001
> [    3.728458] mmcblk1: mmc1:0001 008G92 7.28 GiB

To really test it, it'd be nice to see some HS200 eMMC cards enumerate
OK.  Specifically the patch adjusts the error handling and the place
where that happens mostly is during tuning.

I'll also try to find some time today to check a peach_pit or a
peach_pi.  I think I saw one in the pile near my desk so if it isn't
in too bad of a shape I can give mainline a shot on it.

-Doug
