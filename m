Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DCC4630C78
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 31 May 2019 12:20:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726330AbfEaKUP (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 31 May 2019 06:20:15 -0400
Received: from mail-oi1-f181.google.com ([209.85.167.181]:38509 "EHLO
        mail-oi1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbfEaKUP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 31 May 2019 06:20:15 -0400
Received: by mail-oi1-f181.google.com with SMTP id 18so6524463oij.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 May 2019 03:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iy+b2XmhA0ntKME0CnMJCgRk0OfnARxxHVb5nAyoOQI=;
        b=NsM6Ojtr9vYMDTe1/mfRqJupLufihu+ZNUA0u/SNXUiXRqSs5vzhrg6EJCVVp47vua
         csDeujruhQ52gKRcsDzg+TNOyATTyYrEUPZRQ8CgvxuRfHVTHBESoi3M3caz1MktLeeQ
         gcOjC16+wZ4tOKU/esGTXt7IbhtV7MP+3F1fWGcWV1+EIoEGDKhrYgu/QmFjCFPPAYJx
         fM5KFxta5mP1FY4t9E8EFGCQC1DGAtEaRVK2khkPqqm7xE+4dZ8N/K6EOVG5xlUlyHUg
         Iretlr5BJIcYk+L+LCNn4iNJwpmrX9suAxk4syrbuBbPMFc+6dDd+Hy/FiI8feCuByOK
         7M+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iy+b2XmhA0ntKME0CnMJCgRk0OfnARxxHVb5nAyoOQI=;
        b=VEhWT5mvnIGhM1S/WI+LkoG5daR4NoE4lwtatWgB+QSnJtE9C6b4mcWlWY6JPyqGl3
         PwRj9wuu6NOnwh7GQGy4byfDKQKx6J+UJPpkkxWO5msxXf+EWeLqVdIYJgIAPJFD1PqA
         HSLpWO5SRAyN6I+u149VR/TFI+ONsRcYutnlbQuWrtKiRT/kmLLJrNtglNll4KlciWiQ
         8raJEBkoyMDW0KqOz6xL4xN5/kwQhCxD4z4qAsDnxf/6IjbA+3O5HmnJZJAxPqbuatkj
         wZxG4GRxZ2A5XiDG/lGQAu5UPhlfZxeEv65jGTOaOohbM9Lp2avoamEg2Bn5ny2jvQhs
         Hrdw==
X-Gm-Message-State: APjAAAXq8ClT9sllielMlX3MCPUhh8XQhUaaOPlQbHUIcF1VPy43s06p
        HERerWpG3heGf2IAFMhZfxsJ0p1YfsuoMxjxO4MMkg==
X-Google-Smtp-Source: APXvYqyXFvGVgoiZdcOxGr/H1SlhMtGXL6Lz7te6iFo0TuR9613uWJrlqnQVhGO1bcWpGSXyPQR0yNsMKuEton5QgRg=
X-Received: by 2002:aca:80e:: with SMTP id 14mr5832960oii.2.1559298014153;
 Fri, 31 May 2019 03:20:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAJKOXPfREyt3P2H8bL9=6+EQ1S3Ja7Urkhy1x7sCHaaubMqV1Q@mail.gmail.com>
In-Reply-To: <CAJKOXPfREyt3P2H8bL9=6+EQ1S3Ja7Urkhy1x7sCHaaubMqV1Q@mail.gmail.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Fri, 31 May 2019 18:20:03 +0800
Message-ID: <CA+Px+wXs1u9VjkzDerb-BVPQRLZNMnw8Rh5prkb+0mHAggwWgg@mail.gmail.com>
Subject: Re: [BISECT] No audio after "ASoC: core: use component driver name as
 component name"
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, May 31, 2019 at 5:27 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> The problem might be in component name. The driver->name and
> fmt_single_name(dev, &component->id) are:
> snd_dmaengine_pcm != 3830000.i2s
> snd_dmaengine_pcm != 3830000.i2s-sec
> samsung-i2s != 3830000.i2s
>
> This commit should not go in without fixing the users of old
> behavior... I could adjust the platform names for primary and
> secondary links... but now it looks like two components will have the
> same name.
That is because the two component drivers used the same name in
somehow.  But yes, we should not have the commit without fixing
potential errors for users depend on old behavior.

Could you send a patch to revert the commit b19671d6caf1?
