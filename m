Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D12F213578F
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  9 Jan 2020 12:00:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730504AbgAIK7x (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 9 Jan 2020 05:59:53 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:39591 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728635AbgAIK7w (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Jan 2020 05:59:52 -0500
Received: by mail-io1-f65.google.com with SMTP id c16so6637798ioh.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jan 2020 02:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QPi6QnVXghXv8TY7JMc2BuYgut9DZveS4sz8HSAzzAE=;
        b=WxtF6rMhat0yOMYOkIGw1PZioR964EQ0WGOdDWYoA4+TwrtGwcvF471ZdqnxorH+R6
         JEi1bKDztJVqWgCIWLQ5bH80cEw5JZJak2XTFCVGavFicQZFC0I57NcUbrKpmb6LMCQn
         Ho8KowQTK6vAx+J2SE9zTNXGo9yBrJlC0mrEXy3/BVPRJ4DQf73YsijLrIt2W1mKC36m
         1PsZ1RQk+yUVF1o3TrbcEtAyMCbPu5DHnO0G5bj4WPRbOMOcwwFVcIqYPfeUGYJuwM6E
         0RkxNn+bxdnC4UEb7Xa8B18mFIv4FyhYRvMzcTnft+1mPcfXVyjRGHYpwzd36Gc/cpzW
         FTJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QPi6QnVXghXv8TY7JMc2BuYgut9DZveS4sz8HSAzzAE=;
        b=ujDqJ8fApqtjoMGkkPAlE1JKtRjqgstt9TKVn2kwsasVkP3+ifk5IEvpMJ9oJuPMpw
         Ckl5+ttZBAVNS1TklpSR1xwU1lxrOhS3dLCU0L62QMRxHVcwOnxEDzJGGCDneXuPVfVS
         6PT6sKf7Lv2usbPNOkq1R7Ugi5jPnwx5N8kysbJXlmbVBEMZDLlxDSnVz2hGkFQ7Nu5W
         DOVSY5rAP5XGhMuUNsq4np1zNHc1ScvMMF9shzQZ/Th3v6Z6SjZm25wvRQDFxn3HwO7y
         v7kAPEAOpOnY9Eozwx/3qw5Ni/Ynpwdb5RCHtVPOXc6Ov8sAxFZajwZ7qdDP5qwaLYSR
         UeuA==
X-Gm-Message-State: APjAAAU2BYjagx1H+euV11ytfmvheckhHRBibOlmEH8Tm2RzxLVxITFz
        JyG4HpfFG0DpIQcIFpr28n0WxwmMnpu6J9HbuuBI7w==
X-Google-Smtp-Source: APXvYqy5YRToV4ho+1HZN01NgOpFCbr14jsvMrxynyarJaFUyY1ek05rytw4zulCXWiF5tX1rdl3nX75mbjlAFbZqhc=
X-Received: by 2002:a6b:8f41:: with SMTP id r62mr7053509iod.140.1578567590321;
 Thu, 09 Jan 2020 02:59:50 -0800 (PST)
MIME-Version: 1.0
References: <CGME20200108115027eucas1p1d3645ba53703780679c662921efbca78@eucas1p1.samsung.com>
 <20200108115007.31095-1-m.szyprowski@samsung.com> <20200108115007.31095-2-m.szyprowski@samsung.com>
 <CA+Px+wXkFE5b_8bLz7-c95TvEdqHGD5s-XKRYMVr40xQkqTWxQ@mail.gmail.com>
In-Reply-To: <CA+Px+wXkFE5b_8bLz7-c95TvEdqHGD5s-XKRYMVr40xQkqTWxQ@mail.gmail.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Thu, 9 Jan 2020 18:59:39 +0800
Message-ID: <CA+Px+wWVhZn+UrX04bGMnR8J0XeR0+Oy1r0DD4Spm+i1WPZKqQ@mail.gmail.com>
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

On Thu, Jan 9, 2020 at 1:36 PM Tzung-Bi Shih <tzungbi@google.com> wrote:
> On Wed, Jan 8, 2020 at 7:50 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
> > This fixes the following lockdep warning observed on Exynos4412-based
> > Odroid U3 board:
> > ======================================================
> > -> #1 (&card->controls_rwsem){++++}:
> >        snd_ctl_add_replace+0x3c/0x84
> >        dapm_create_or_share_kcontrol+0x24c/0x2e0
> >        snd_soc_dapm_new_widgets+0x308/0x594
> >        snd_soc_bind_card+0x80c/0xad4
> >        devm_snd_soc_register_card+0x34/0x6c
> >        odroid_audio_probe+0x288/0x34c
> >        platform_drv_probe+0x6c/0xa4

I noticed the stack is a little different than the last time
(odroid_audio_probe vs. asoc_simple_probe).  Did you use the same
machine to test?
>        asoc_simple_probe+0x244/0x4a0
>        platform_drv_probe+0x6c/0xa4
(https://mailman.alsa-project.org/pipermail/alsa-devel/2019-December/160142.html)

> I would like to spend some time to find the root cause.  It would be a
> little challenging though (I have no real runtime to test...).

After a few hours of study, I failed to find the reason to cause the
possible circular locking.  And would need more of your input.

Followed the information provided in the message
(https://mailman.alsa-project.org/pipermail/alsa-devel/2019-December/160535.html).
As the message said "snd_soc_of_get_dai_link_codecs() return
-EPROBE_DEFER".  The snd_soc_of_get_dai_link_codecs( ) is before
devm_snd_soc_register_card( ), and I didn't find any side effects in
odroid_audio_probe( ).

Only a very minor issue: snd_soc_of_put_dai_link_codecs(codec_link)
will be called twice.  One in snd_soc_of_get_dai_link_codecs( ) when
return -EPROBE_DEFER; another one is under the label
"err_put_cpu_dai".
(https://elixir.bootlin.com/linux/v5.5-rc5/source/sound/soc/samsung/odroid.c#L328)
 The code doesn't generate any side effects because of
snd_soc_of_put_dai_link_codecs( )'s robustness.

Another minor thing: odroid_card_dais is not immutable but
odroid_audio_probe( ) would try to modify it
(https://elixir.bootlin.com/linux/v5.5-rc5/source/sound/soc/samsung/odroid.c#L295).
Again, I don't think it would produce any troubles.  I guess no
machine would have multiple sound cards, share the same machine
driver, and unbind/bind in runtime.

> It is weird: userspace should not see things (e.g. no controlC0) until
> snd_card_register( ).

(based on today's broonie/sound.git/for-next) I would like to provide
you more information about this statement to help you find further
information.
When userspace can see the control device?  Ideally,
snd_soc_bind_card( ) -> snd_card_register( ) ->
snd_device_register_all( ) -> __snd_device_register( ) ->
snd_ctl_dev_register( ) -> snd_register_device( ).
If you look at the calling stack of possible circular locking,
snd_soc_dapm_new_widgets( ) is before snd_card_register( ).  That's
why we think userspace should not see control devices (i.e. controlC0,
controlC1, ...) and should not be able to set mixer control via ioctl(
).


As this may not directly be related to the issue, could you share the
init script of alsactl in your system?  Does it follow the convention?
 (i.e. sound card is ready when receives controlC* changed event in
udev rule 78-sound-card.rules)
> 6. when userspace init scripts (alsactl) enumerates devices
(https://mailman.alsa-project.org/pipermail/alsa-devel/2019-December/160535.html)
