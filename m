Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 069D41352C6
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  9 Jan 2020 06:36:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725932AbgAIFgf (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 9 Jan 2020 00:36:35 -0500
Received: from mail-il1-f194.google.com ([209.85.166.194]:38321 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbgAIFgf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Jan 2020 00:36:35 -0500
Received: by mail-il1-f194.google.com with SMTP id f5so4703718ilq.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Jan 2020 21:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sAHhoFZ0iYCPxYt+rh/Px3+8GOp5DO3V29oeS42DXAM=;
        b=huiN23DIYcPHVv1KglkNFE9hwhktEqKgtWXiSkSJK5LmJDTbV3ps3AzdNKFwbVyRLU
         j6622puSU0EYgKiTBzKbjnldBj6p+SqrQ5IAZDpUi8Mwg/UESiWJuv042WLDon1jb0fb
         eG6eNsVZVo3F6z3ivbqJ842nbgPQHAGVoqVTN2RjedMNDHo32ifXrKlI4YvixtBl7NHU
         2st3DsieNEM8T0b4/zNVLJJWvpkuCbrnmBaRNyYuw+F/Eviulg7v7aA8N2/pQkL2Ybet
         g/9n823BtG2EUxnmgbY6Vzbo5Id0yUpX+Kfy4DlJQVetjj4ZGHYyMnjKI3X+dy7LGIYJ
         LJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sAHhoFZ0iYCPxYt+rh/Px3+8GOp5DO3V29oeS42DXAM=;
        b=RcDuhIBc0OWOpcF03yB7kh9nn+iDTDXmOTZYwWHAuQw5BXtiXE+R72TArOgnn6P72r
         PYpNH4QhbCFnKQydw+nwkHzzGjTCOYnrl0hmfJoNNzLdxV5Ozh0D86pzW/mdUYWucWVb
         siZB8b9CQ937cc+BExPyIgjt7kVRvjtTA+Cj18SwxpvQpCL2c1vNwhdF7cUxJuRn8cst
         4vb2q1+Pn0PzpirBk6TLCAeywdGfw2tz0j2FAIOCiAp/XVq2MBxzRGaTyqLwEou53Hzo
         4K8KhBeYEMfm12hCOyJM8HDKGtFAQ+FFBhe2uInZ0+Ey/D8xOGfkmaCzGUsjMcL4wqyp
         DGoA==
X-Gm-Message-State: APjAAAXJJki9gmdIXcUW9ZFyvHkCe/YSHReGc0L5Pg4MTBmBrpChfl9R
        5Ll7bqfGAQiKXc5EPy0TTZpvDpBAx8tceJVaWbiEt0PdiTw=
X-Google-Smtp-Source: APXvYqzFc89SrQMcMWBXOOpciBA/UbRyMnmDTvKUFY09Y6diFKdpRQB/cIzzntYu/ZXrqm6Imlk1zgpmom3NbH7Nup8=
X-Received: by 2002:a92:981b:: with SMTP id l27mr7483819ili.118.1578548194052;
 Wed, 08 Jan 2020 21:36:34 -0800 (PST)
MIME-Version: 1.0
References: <CGME20200108115027eucas1p1d3645ba53703780679c662921efbca78@eucas1p1.samsung.com>
 <20200108115007.31095-1-m.szyprowski@samsung.com> <20200108115007.31095-2-m.szyprowski@samsung.com>
In-Reply-To: <20200108115007.31095-2-m.szyprowski@samsung.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Thu, 9 Jan 2020 13:36:22 +0800
Message-ID: <CA+Px+wXkFE5b_8bLz7-c95TvEdqHGD5s-XKRYMVr40xQkqTWxQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: max98090: fix lockdep warning
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     ALSA development <alsa-devel@alsa-project.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dylan Reid <dgreid@google.com>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Jan 8, 2020 at 7:50 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Fix this by introducing a separate mutex only for serializing the SHDN
> hardware register related operations.

This fix makes less sense to me.  We used dapm_mutex intentionally
because: both DAPM and userspace mixer control would change SHDN bit
at the same time.

> This fixes the following lockdep warning observed on Exynos4412-based
> Odroid U3 board:
> ======================================================
> WARNING: possible circular locking dependency detected
> 5.5.0-rc5-next-20200107 #166 Not tainted
> ------------------------------------------------------
> alsactl/1104 is trying to acquire lock:
> ed0d50f4 (&card->dapm_mutex){+.+.}, at: max98090_shdn_save+0x1c/0x28
>
> but task is already holding lock:
> edb4b49c (&card->controls_rwsem){++++}, at: snd_ctl_ioctl+0xcc/0xbb8
>
> which lock already depends on the new lock.
>
> the existing dependency chain (in reverse order) is:
>
> -> #1 (&card->controls_rwsem){++++}:
>        snd_ctl_add_replace+0x3c/0x84
>        dapm_create_or_share_kcontrol+0x24c/0x2e0
>        snd_soc_dapm_new_widgets+0x308/0x594
>        snd_soc_bind_card+0x80c/0xad4
>        devm_snd_soc_register_card+0x34/0x6c
>        odroid_audio_probe+0x288/0x34c
>        platform_drv_probe+0x6c/0xa4
>        really_probe+0x200/0x490
>        driver_probe_device+0x78/0x1f8
>        bus_for_each_drv+0x74/0xb8
>        __device_attach+0xd4/0x16c
>        bus_probe_device+0x88/0x90
>        deferred_probe_work_func+0x3c/0xd0
>        process_one_work+0x22c/0x7c4
>        worker_thread+0x44/0x524
>        kthread+0x130/0x164
>        ret_from_fork+0x14/0x20
>        0x0
>
> -> #0 (&card->dapm_mutex){+.+.}:
>        lock_acquire+0xe8/0x270
>        __mutex_lock+0x9c/0xb18
>        mutex_lock_nested+0x1c/0x24
>        max98090_shdn_save+0x1c/0x28
>        max98090_put_enum_double+0x20/0x40
>        snd_ctl_ioctl+0x190/0xbb8
>        ksys_ioctl+0x470/0xaf8
>        ret_fast_syscall+0x0/0x28
>        0xbefaa564

As the stack trace suggested: when the card was still registering,
alsactl can see the mixer control and try to change it.

We have a discussion on an older thread
(https://mailman.alsa-project.org/pipermail/alsa-devel/2019-December/160454.html).
It is weird: userspace should not see things (e.g. no controlC0) until
snd_card_register( ).

I would like to spend some time to find the root cause.  It would be a
little challenging though (I have no real runtime to test...).
