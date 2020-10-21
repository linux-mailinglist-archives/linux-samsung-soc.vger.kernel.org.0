Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6796294EF0
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 21 Oct 2020 16:42:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443106AbgJUOmY (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 21 Oct 2020 10:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2442221AbgJUOmY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 21 Oct 2020 10:42:24 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A36BEC0613D6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Oct 2020 07:42:23 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id f26so587168oou.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Oct 2020 07:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=AfTAgHtdVyrAaS1/nhVnFIFYQUqkwRIKER1d/mcr31s=;
        b=OFfWjJvd0e4xoMAnKosQZX6u4yueJkvQajrGY1gnJgHtnDIJWFT6fq0RgYnrDwWRw+
         gRHeZQoM62EreIDByRy+hh+RB9j+SqRdJPUlf5qW1UjkGm+tTrGcfzuZz+PumuavbfPc
         b7fWM4FcGBuAVp+/h1VQnDUxVv4jkFf54gZSo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=AfTAgHtdVyrAaS1/nhVnFIFYQUqkwRIKER1d/mcr31s=;
        b=gA6iy/3B0uXYDFMo9yo6dRvTziozbdWixxOIvt5GutHh8Eusum62PvXmmczruQ5IbQ
         R7ZdrhdeD6hCAfjKtC2mE1NGBQL8z6dPCteij6BpBEDGMJ+cXJMGIB2DJd+lkQ5YONO6
         SNhkLmjq5fy/lCUiibI9BTl+IBN2w+C0f1R5R+rc8zgyF4H2wJPf/aK1nVh8BLnCPVNf
         M3dBIDkfmy82I4FxO52ooL4pYvCwKLPFoeQIgMkXJLg6D9pW2pJjhExioOlR/+QB4YQs
         B2+j6evXyJWQhWIcMiiX3/FbxZ+68iDLjO4YbluA/CGv+jiCC3aonVv4P5fN2svOAG/4
         8CtA==
X-Gm-Message-State: AOAM531jowfO6jb1Eaf7T7OWFxHQnDzcQBrqKcw+j3IfWz62G33OgKR5
        zyp1UXzw6/HdjxOiIKVB9eLM7m+H+KPnjvmzXQocIw==
X-Google-Smtp-Source: ABdhPJycyct2TB9wVg2Ih3Z02FAHwtZsXVwJzQ0pYxum/KMQuFJw++9YeXuYFSUooQTyT8GemxYhpDCSqAKwx53jYrg=
X-Received: by 2002:a4a:e1d7:: with SMTP id n23mr2839407oot.85.1603291342907;
 Wed, 21 Oct 2020 07:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
 <20201021085655.1192025-13-daniel.vetter@ffwll.ch> <20201021125030.GK36674@ziepe.ca>
In-Reply-To: <20201021125030.GK36674@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 21 Oct 2020 16:42:11 +0200
Message-ID: <CAKMK7uEWe8CaT7zjcZ6dJAKHxtxtqzjVB35fCFviwhcnqksDfw@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] PCI: Obey iomem restrictions for procfs mmap
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, Bjorn Helgaas <bhelgaas@google.com>,
        Linux PCI <linux-pci@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@ffwll.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Oct 21, 2020 at 2:50 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Wed, Oct 21, 2020 at 10:56:51AM +0200, Daniel Vetter wrote:
> > There's three ways to access PCI BARs from userspace: /dev/mem, sysfs
> > files, and the old proc interface. Two check against
> > iomem_is_exclusive, proc never did. And with CONFIG_IO_STRICT_DEVMEM,
> > this starts to matter, since we don't want random userspace having
> > access to PCI BARs while a driver is loaded and using it.
> >
> > Fix this by adding the same iomem_is_exclusive() check we already have
> > on the sysfs side in pci_mmap_resource().
> >
> > References: 90a545e98126 ("restrict /dev/mem to idle io memory ranges")
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Jason Gunthorpe <jgg@ziepe.ca>
> > Cc: Kees Cook <keescook@chromium.org>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: John Hubbard <jhubbard@nvidia.com>
> > Cc: J=C3=A9r=C3=B4me Glisse <jglisse@redhat.com>
> > Cc: Jan Kara <jack@suse.cz>
> > Cc: Dan Williams <dan.j.williams@intel.com>
> > Cc: linux-mm@kvack.org
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-samsung-soc@vger.kernel.org
> > Cc: linux-media@vger.kernel.org
> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: linux-pci@vger.kernel.org
> > Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.com>
>
> Maybe not for fixing in this series, but this access to
> IORESOURCE_BUSY doesn't have any locking.
>
> The write side holds the resource_lock at least..
>
> >       ret =3D pci_mmap_page_range(dev, i, vma,
> >                                 fpriv->mmap_state, write_combine);
>
> At this point the vma isn't linked into the address space, so doesn't
> this happen?
>
>      CPU 0                                  CPU1
>  mmap_region()
>    vma =3D vm_area_alloc
>    proc_bus_pci_mmap
>     iomem_is_exclusive
>     pci_mmap_page_range
>                                             revoke_devmem
>                                              unmap_mapping_range()
>      // vma is not linked to the address space here,
>      // unmap doesn't find it
>   vma_link()
>   !!! The VMA gets mapped with the revoked PTEs
>
> I couldn't find anything that prevents it at least, no mmap_sem on the
> unmap side, just the i_mmap_lock
>
> Not seeing how address space and pre-populating during mmap work
> together? Did I miss locking someplace?
>
> Not something to be fixed for this series, this is clearly an
> improvement, but seems like another problem to tackle?

Uh yes. In drivers/gpu this isn't a problem because we only install
ptes from the vm_ops->fault handler. So no races. And I don't think
you can fix this otherwise through holding locks: mmap_sem we can't
hold because before vma_link we don't even know which mm_struct is
involved, so can't solve the race. Plus this would be worse that
mm_take_all_locks used by mmu notifier. And the address_space
i_mmap_lock is also no good since it's not held during the ->mmap
callback, when we write the ptes. And the resource locks is even less
useful, since we're not going to hold that at vma_link() time for
sure.

Hence delaying the pte writes after the vma_link, which means ->fault
time, looks like the only way to close this gap.

Trouble is I have no idea how to do this cleanly ...
-Daniel



--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
