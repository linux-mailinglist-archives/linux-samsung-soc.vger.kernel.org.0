Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC1F328A360
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 11 Oct 2020 01:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390409AbgJJW5K (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 10 Oct 2020 18:57:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731412AbgJJTV1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 10 Oct 2020 15:21:27 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44570C08EA7E
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Oct 2020 10:31:13 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id ce10so17582532ejc.5
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Oct 2020 10:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xsOZOc5wUkDsyS+q4XR7sRY+/Nw08dWS4rH9PR3SdYM=;
        b=K43vYuvFf4p0HKwpNNYM8EVjuArTRuuNWIw2q4YLC5jyws5WqABCqrRlB8L6Kw/ga/
         9pb07pav9vu70DJL9+qIG+8WZUav68UhLbRS2hY3VnFfDpqam6GcqIBnDSm/T02riaI0
         bK3Q77l+IKqRqvdVTvJ6gEi/4zr+9omw8Jdkw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xsOZOc5wUkDsyS+q4XR7sRY+/Nw08dWS4rH9PR3SdYM=;
        b=g4AZOZ7pp4mcgd6qyhEYnp1ozqM2DPNeW2aVsP0equ7Ya014ehW5yo+V1iTCmtvj+i
         z8mJPtvXL7FvHNuc9eLaD3ZG9a9ASq443aUbjEaVmbFDFlcymrs+GEcqTjmOPqOa7vTw
         9HYRp6Vyc7mC/gErr6EZweBdgPDoqvKqxaacxbtz2cXiNvYKu1a/rXxTOkuPO9+CKHgh
         15A1mHhkWIQzRrFgoyXzd9UJoKI+dRDtxZAE7w0kz5OEmEPW2uvRIK9ljmVQRQ2dXfrz
         QiJQ+cjsNJnqv+kFPvTTqWVY48b6xa8BPFy4CG7bkcBlanBVfOcekH8h9HxNxQzMBd96
         fsOg==
X-Gm-Message-State: AOAM531ElqWqsGk5Rjlzkgy7n4m/DbVDQmhlNvWtZUWWw9eueEX56q9o
        2H4wHQI59vOQrEpAjaaKRN67R0hrPnjQhA==
X-Google-Smtp-Source: ABdhPJwUQGe+5ipqVaLg52qHfFeOupUygyU0sL8px8Lvbc1y12LmO238yQpvinLpSaNVmrKcHLzvtA==
X-Received: by 2002:a17:906:1644:: with SMTP id n4mr20995066ejd.332.1602351071467;
        Sat, 10 Oct 2020 10:31:11 -0700 (PDT)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id bv8sm8235965ejb.3.2020.10.10.10.31.10
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2020 10:31:10 -0700 (PDT)
Received: by mail-wm1-f50.google.com with SMTP id a72so2303429wme.5
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Oct 2020 10:31:10 -0700 (PDT)
X-Received: by 2002:a1c:8057:: with SMTP id b84mr3433695wmd.116.1602351069766;
 Sat, 10 Oct 2020 10:31:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
 <20201009075934.3509076-10-daniel.vetter@ffwll.ch> <20201009123421.67a80d72@coco.lan>
 <20201009122111.GN5177@ziepe.ca> <20201009143723.45609bfb@coco.lan>
In-Reply-To: <20201009143723.45609bfb@coco.lan>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Sat, 10 Oct 2020 19:30:59 +0200
X-Gmail-Original-Message-ID: <CAAFQd5CVqa4o0W32FE_NsSheN906uE7uA5gctHr=Z-PeU=1wuw@mail.gmail.com>
Message-ID: <CAAFQd5CVqa4o0W32FE_NsSheN906uE7uA5gctHr=Z-PeU=1wuw@mail.gmail.com>
Subject: Re: [PATCH v2 09/17] mm: Add unsafe_follow_pfn
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm <kvm@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Mauro,

On Fri, Oct 9, 2020 at 2:37 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Em Fri, 9 Oct 2020 09:21:11 -0300
> Jason Gunthorpe <jgg@ziepe.ca> escreveu:
>
> > On Fri, Oct 09, 2020 at 12:34:21PM +0200, Mauro Carvalho Chehab wrote:
> > > Hi,
> > >
> > > Em Fri,  9 Oct 2020 09:59:26 +0200
> > > Daniel Vetter <daniel.vetter@ffwll.ch> escreveu:
> > >
> > > > Way back it was a reasonable assumptions that iomem mappings never
> > > > change the pfn range they point at. But this has changed:
> > > >
> > > > - gpu drivers dynamically manage their memory nowadays, invalidating
> > > > ptes with unmap_mapping_range when buffers get moved
> > > >
> > > > - contiguous dma allocations have moved from dedicated carvetouts to
> > > > cma regions. This means if we miss the unmap the pfn might contain
> > > > pagecache or anon memory (well anything allocated with GFP_MOVEABLE)
> > > >
> > > > - even /dev/mem now invalidates mappings when the kernel requests that
> > > > iomem region when CONFIG_IO_STRICT_DEVMEM is set, see 3234ac664a87
> > > > ("/dev/mem: Revoke mappings when a driver claims the region")
> > > >
> > > > Accessing pfns obtained from ptes without holding all the locks is
> > > > therefore no longer a good idea.
> > > >
> > > > Unfortunately there's some users where this is not fixable (like v4l
> > > > userptr of iomem mappings) or involves a pile of work (vfio type1
> > > > iommu). For now annotate these as unsafe and splat appropriately.
> > > >
> > > > This patch adds an unsafe_follow_pfn, which later patches will then
> > > > roll out to all appropriate places.
> > >
> > > NACK, as this breaks an existing userspace API on media.
> >
> > It doesn't break it. You get a big warning the thing is broken and it
> > keeps working.
> >
> > We can't leave such a huge security hole open - it impacts other
> > subsystems, distros need to be able to run in a secure mode.
>
> Well, if distros disable it, then apps will break.
>

Do we have any information on userspace that actually needs this functionality?

Note that we're _not_ talking here about the complete USERPTR
functionality, but rather just the very corner case of carveout memory
not backed by struct pages.

Given that the current in-tree ways of reserving carveout memory, such
as shared-dma-pool, actually give memory backed by struct pages, do we
even have a source of such legacy memory in the kernel today?

I think that given that this is a very niche functionality, we could
have it disabled by default for security reasons and if someone
_really_ (i.e. there is no replacement) needs it, they probably need
to use a custom kernel build anyway for their exotic hardware setup
(with PFN-backed carveout memory), so they can enable it.

> > > While I agree that using the userptr on media is something that
> > > new drivers may not support, as DMABUF is a better way of
> > > handling it, changing this for existing ones is a big no,
> > > as it may break usersapace.
> >
> > media community needs to work to fix this, not pretend it is OK to
> > keep going as-is.
>
> > Dealing with security issues is the one case where an uABI break might
> > be acceptable.
> >
> > If you want to NAK it then you need to come up with the work to do
> > something here correctly that will support the old drivers without the
> > kernel taint.
> >
> > Unfortunately making things uncomfortable for the subsystem is the big
> > hammer the core kernel needs to use to actually get this security work
> > done by those responsible.
>
>
> I'm not pretending that this is ok. Just pointing that the approach
> taken is NOT OK.
>
> I'm not a mm/ expert, but, from what I understood from Daniel's patch
> description is that this is unsafe *only if*  __GFP_MOVABLE is used.
>
> Well, no drivers inside the media subsystem uses such flag, although
> they may rely on some infrastructure that could be using it behind
> the bars.
>
> If this is the case, the proper fix seems to have a GFP_NOT_MOVABLE
> flag that it would be denying the core mm code to set __GFP_MOVABLE.
>
> Please let address the issue on this way, instead of broken an
> userspace API that it is there since 1991.

Note that USERPTR as a whole generally has been considered deprecated
in V4L2 for many years and people have been actively discouraged to
use it. And, still, we're just talking here about the very rare corner
case, not the whole USERPTR API.

Best regards,
Tomasz
