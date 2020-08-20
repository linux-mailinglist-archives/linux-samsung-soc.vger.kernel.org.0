Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5E4E24B826
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 20 Aug 2020 13:10:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729099AbgHTLKf (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 20 Aug 2020 07:10:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730848AbgHTKJw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 20 Aug 2020 06:09:52 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 297EEC061384
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2020 03:09:52 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id d11so741651ejt.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2020 03:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p7IDsCs3O3XVq6Oo36ltfbQDp/qQH17B8kNCHrYYi58=;
        b=ehZtgn4/AxsmBi4CkUnsCHo/q6bpQxXO/GGgvrCHjALePJV0mY03gGKLtDpnr62vq7
         KV3mdnnS1aNkayPfMEd6+kiXUtw5pXZFUZ/dq+zcrKhOGKgl7b3lXQNmHHz0Fv8waUXO
         bUcyInFMwIZHXpvW8Pcz/o4WwKo7iyfKJp3kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p7IDsCs3O3XVq6Oo36ltfbQDp/qQH17B8kNCHrYYi58=;
        b=WEQxQ4MOsm/bntuUpMlXToQWTWOjVjzeVPb4qIanGwoJQJBmOac+TVi2iNBSe+gJ0f
         rdgEXjs1HWWOgANdVj+kASs6j5a0RAHWrUDk/j1NpIg9bi1guKrpBaa9UV0WFJA9dz5r
         Fm1N+5f6pVQWtKp//OmHoW7xsk3jSctfEN0JT8w4aDGedRX47VzZKON2SKrmsXyNPpGM
         dKDcfHcoy399xTrBgQRg2MN7+xmkH/eOHZPooY7wpFDiD1krZrV66kCBrkgi2bPZzPMa
         pFBC/P9z3hxLE/1sZGnT6q6x0sEUL6Zcd7w/7eg5jLsQwTP0WRJeZAYWJbnjS7JNuJRG
         9BJQ==
X-Gm-Message-State: AOAM532uf4gbc/IIGWJwWqaaqhcuJOqdP8eSI5EtCa2/Wht96DGgrZgL
        WzLIkqWCnWELryL4CL4veYU5RQeN+A7VZMwb
X-Google-Smtp-Source: ABdhPJxjkQeKDX8sTnGHzEq1Tp5XTBftryy3Ojy5pOO+W+iBhBqnJlJMvNZ0mOaHlqzgPgtpw2xWPg==
X-Received: by 2002:a17:906:5495:: with SMTP id r21mr2396988ejo.33.1597918190375;
        Thu, 20 Aug 2020 03:09:50 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id v5sm1146347ejv.114.2020.08.20.03.09.48
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Aug 2020 03:09:49 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id c19so3440283wmd.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Aug 2020 03:09:48 -0700 (PDT)
X-Received: by 2002:a1c:5581:: with SMTP id j123mr2797156wmb.11.1597918188072;
 Thu, 20 Aug 2020 03:09:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200819065555.1802761-1-hch@lst.de> <20200819065555.1802761-6-hch@lst.de>
 <CAAFQd5COLxjydDYrfx47ht8tj-aNPiaVnC+WyQA7nvpW4gs=ww@mail.gmail.com>
 <62e4f4fc-c8a5-3ee8-c576-fe7178cb4356@arm.com> <CAAFQd5AcCTDguB2C9KyDiutXWoEvBL8tL7+a==Uo8vj_8CLOJw@mail.gmail.com>
 <20200819135738.GB17098@lst.de> <CAAFQd5BvpzJTycFvjntmX9W_d879hHFX+rJ8W9EK6+6cqFaVMA@mail.gmail.com>
 <20200820044533.GA4570@lst.de>
In-Reply-To: <20200820044533.GA4570@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 20 Aug 2020 12:09:34 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CEsC2h-oEdZOPTkUQ4WfFL0yyYu9dE5UscEVpLyMLrCg@mail.gmail.com>
Message-ID: <CAAFQd5CEsC2h-oEdZOPTkUQ4WfFL0yyYu9dE5UscEVpLyMLrCg@mail.gmail.com>
Subject: Re: [PATCH 05/28] media/v4l2: remove V4L2-FLAG-MEMORY-NON-CONSISTENT
To:     Christoph Hellwig <hch@lst.de>
Cc:     Robin Murphy <robin.murphy@arm.com>, alsa-devel@alsa-project.org,
        linux-ia64@vger.kernel.org,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        nouveau@lists.freedesktop.org, linux-nvme@lists.infradead.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        linux-mm@kvack.org, Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        linux-scsi@vger.kernel.org,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Matt Porter <mporter@kernel.crashing.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Pawel Osciak <pawel@osciak.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Aug 20, 2020 at 6:45 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Aug 19, 2020 at 04:11:52PM +0200, Tomasz Figa wrote:
> > > > By the way, as a videobuf2 reviewer, I'd appreciate being CC'd on any
> > > > series related to the subsystem-facing DMA API changes, since
> > > > videobuf2 is one of the biggest users of it.
> > >
> > > The cc list is too long - I cc lists and key maintainers.  As a reviewer
> > > should should watch your subsystems lists closely.
> >
> > Well, I guess we can disagree on this, because there is no clear
> > policy. I'm listed in the MAINTAINERS file for the subsystem and I
> > believe the purpose of the file is to list the people to CC on
> > relevant patches. We're all overloaded with work and having to look
> > through the huge volume of mailing lists like linux-media doesn't help
> > and thus I'd still appreciate being added on CC.
>
> I'm happy to Cc and active participant in the discussion.  I'm not
> going to add all reviewers because even with the trimmed CC list
> I'm already hitting the number of receipients limit on various lists.

Fair enough.

We'll make your job easier and just turn my MAINTAINERS entry into a
maintainer. :)

Best regards,
Tomasz
