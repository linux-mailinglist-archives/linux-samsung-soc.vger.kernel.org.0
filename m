Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 145F328683A
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Oct 2020 21:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728225AbgJGTZF (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 7 Oct 2020 15:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727430AbgJGTZE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Oct 2020 15:25:04 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 968C0C061755
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Oct 2020 12:25:02 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id q136so2505781oic.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Oct 2020 12:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BZRP/YEUZ8RoSb8Ypgb3DGxVhdoAtHRN1N0p0L0pWpA=;
        b=IfegH4nwN/o6kcQDvfu01nenDUeNQgBkda4/dhczUdP0kMFXcvE572DUDzf1wvqGpa
         nyp1a/D73Mflnvnu40XfTC32OrNKnzCHp2mvGEYcnzK1KJ6+dezHuXb9vC5VNmLGIhTb
         kwAV9e9OpEVj4sQ6ggzRYYm32tqaPtdzoptpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BZRP/YEUZ8RoSb8Ypgb3DGxVhdoAtHRN1N0p0L0pWpA=;
        b=VJ4Yr/jhwa/LPho+laStL17AOS/ZGRfA5zwZwSzXgCCCsL2Wb5kN+uUuHipnwezGTR
         xKMXnxstxZ1pEo264Npy9RJCIK2e4Uh1cTZBa8S0A2jSTb38ApRmxv0/vO8HgN3xu1fg
         5oL0bMkH2mrPjFpeQYebJW6ScUkgWeaTLwWWzq6ogO13jOVW2Z0qMfZTujZmqM9VkgIw
         SUjNGkWUNaJibsK4jU7u3aSQFp0gnPWhTfitsVHVbmqb7jjqXof/sdV8R058jxoYHtA+
         VzBd4Kx6iFY2fgRnAoe6AMhELor088sy6mWlgrOOPM/kWJFLIfhTPsfIf6GI99JeGYbp
         u7qg==
X-Gm-Message-State: AOAM5311cEw+08+NtzXqDllp/drkJFvA+wHGGpVu2A+TgFCrWsrhrzjx
        DABl6K/CAB2zcU1z/Nol/Arfex2FZEeCmLSE+3+DjA==
X-Google-Smtp-Source: ABdhPJzhvBCanKpF9yHYf4rPvV3OgJoXcQ8bSZqPwzVGdWv0uBGdiJso5tL8awsEi+dW1GpdYavbUXQPpc/1p2uOTug=
X-Received: by 2002:aca:6083:: with SMTP id u125mr2929990oib.14.1602098701967;
 Wed, 07 Oct 2020 12:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201007164426.1812530-11-daniel.vetter@ffwll.ch> <20201007184131.GA3259154@bjorn-Precision-5520>
In-Reply-To: <20201007184131.GA3259154@bjorn-Precision-5520>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 7 Oct 2020 21:24:49 +0200
Message-ID: <CAKMK7uEi-PaoP2mSgg-aub49gctjTbwW6-X4nuRLnv1uzTh9dQ@mail.gmail.com>
Subject: Re: [PATCH 10/13] PCI: revoke mappings like devmem
To:     Bjorn Helgaas <helgaas@kernel.org>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, linux-s390@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, Bjorn Helgaas <bhelgaas@google.com>,
        Linux PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Oct 7, 2020 at 8:41 PM Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> Capitalize subject, like other patches in this series and previous
> drivers/pci history.
>
> On Wed, Oct 07, 2020 at 06:44:23PM +0200, Daniel Vetter wrote:
> > Since 3234ac664a87 ("/dev/mem: Revoke mappings when a driver claims
> > the region") /dev/kmem zaps ptes when the kernel requests exclusive
> > acccess to an iomem region. And with CONFIG_IO_STRICT_DEVMEM, this is
> > the default for all driver uses.
> >
> > Except there's two more ways to access pci bars: sysfs and proc mmap
> > support. Let's plug that hole.
>
> s/pci/PCI/ in commit logs and comments.
>
> > For revoke_devmem() to work we need to link our vma into the same
> > address_space, with consistent vma->vm_pgoff. ->pgoff is already
> > adjusted, because that's how (io_)remap_pfn_range works, but for the
> > mapping we need to adjust vma->vm_file->f_mapping. Usually that's done
> > at ->open time, but that's a bit tricky here with all the entry points
> > and arch code. So instead create a fake file and adjust vma->vm_file.
> >
> > Note this only works for ARCH_GENERIC_PCI_MMAP_RESOURCE. But that
> > seems to be a subset of architectures support STRICT_DEVMEM, so we
> > should be good.
> >
> > The only difference in access checks left is that sysfs pci mmap does
> > not check for CAP_RAWIO. But I think that makes some sense compared to
> > /dev/mem and proc, where one file gives you access to everything and
> > no ownership applies.
>
> > --- a/drivers/char/mem.c
> > +++ b/drivers/char/mem.c
> > @@ -810,6 +810,7 @@ static loff_t memory_lseek(struct file *file, loff_t offset, int orig)
> >  }
> >
> >  static struct inode *devmem_inode;
> > +static struct vfsmount *devmem_vfs_mount;
> >
> >  #ifdef CONFIG_IO_STRICT_DEVMEM
> >  void revoke_devmem(struct resource *res)
> > @@ -843,6 +844,20 @@ void revoke_devmem(struct resource *res)
> >
> >       unmap_mapping_range(inode->i_mapping, res->start, resource_size(res), 1);
> >  }
> > +
> > +struct file *devmem_getfile(void)
> > +{
> > +     struct file *file;
> > +
> > +     file = alloc_file_pseudo(devmem_inode, devmem_vfs_mount, "devmem",
> > +                              O_RDWR, &kmem_fops);
> > +     if (IS_ERR(file))
> > +             return NULL;
> > +
> > +     file->f_mapping = devmem_indoe->i_mapping;
>
> "devmem_indoe"?  Obviously not compiled, I guess?

Yeah apologies, I forgot to compile this with CONFIG_IO_STRICT_DEVMEM
set. The entire series is more rfc about the overall problem really, I
need to also figure out how to even this this somehow. I guess there's
nothing really ready made here?
-Daniel

> > --- a/include/linux/ioport.h
> > +++ b/include/linux/ioport.h
> > @@ -304,8 +304,10 @@ struct resource *request_free_mem_region(struct resource *base,
> >
> >  #ifdef CONFIG_IO_STRICT_DEVMEM
> >  void revoke_devmem(struct resource *res);
> > +struct file *devm_getfile(void);
> >  #else
> >  static inline void revoke_devmem(struct resource *res) { };
> > +static inline struct file *devmem_getfile(void) { return NULL; };
>
> I guess these names are supposed to match?
>
> >  #endif
> >
> >  #endif /* __ASSEMBLY__ */
> > --
> > 2.28.0
> >



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
