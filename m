Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7360928685D
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Oct 2020 21:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728353AbgJGTd1 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 7 Oct 2020 15:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728333AbgJGTdY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Oct 2020 15:33:24 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C53DC0613D4
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Oct 2020 12:33:20 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id h24so4624252ejg.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Oct 2020 12:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RmnEZ1FdPT1UPs7kQcpuXD7GC8rLG+yumUNPCpNpOGc=;
        b=N8r/yrLDPKroMQCnakJtgQlEsxQFffAa7XjZXv3NwJKYhW6cGY3P32N/wys8kUmeLc
         Z3cf4MV0FjcxNYHuUtP7Oj2/h/K2d2euOJU/PSS52ypyRDR0EBh1cJO1YDWaJVba6fQ/
         H6alqkWn1zpA9cwsKPV0dohBNC66x1N6cRfq2ZiKrJCwD803V9/8UX+b9D3jMVPIj2FY
         NiVc6lfVxwhoQC3sLujKgSkr8KPyal/ezBglcD4d9hDhYk/CQ3pPnvtXwA7Ku8FHDzUO
         W0Kvwl/89Un3CcMfnS9Y//x9EccKgDRIV41sKknRM3LIym9lfBoDuNoTYkQr+aKovhyr
         Mbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RmnEZ1FdPT1UPs7kQcpuXD7GC8rLG+yumUNPCpNpOGc=;
        b=lzyrxJwVKmKbw2jkGPFYj5K9vwk/1x0QzCDYzDkgNMVgpFolEzdSYwZZllyD/tHc43
         AUbXOyRFCOi2JuB8m6eOBoBRkiOhATOjzIqC0qXUrGz7smwXKrbgxYPEM5mAvp1CmRr/
         3+gD1TCl1Cbwu3vD2l+ixbITrGY2ryVkKai3PtACMaNlJtdH8UwikWhdgjZGU7qIakkm
         VkbLhi1fJaC/Y0BW3fQ+dJ+kINSnU0mNSiqfEbkQe/TzoB5I3TintXWe5WYFhPJPMVfM
         7fY0+d9eWEao0EbEfPbyRCb6UBLgB4CUd+998AP3zzcN0Iy3+X8sdhnJ4OC3edQjOYdZ
         Ogww==
X-Gm-Message-State: AOAM530GZRjID6XgP05FTkHYPX604lSnpCce+QlyWBS4xyQtWhWSdWbe
        ZeLoT05HRkdUQafaQaQLbZDAaeu12MxYmzuS8JrZug==
X-Google-Smtp-Source: ABdhPJwxGpDKjE8M6aFCtzChdIqpmhlJGveNVqW3bvq/Ql2n/UAIW/iMsi5CJ7xIyexOlAXnBF03c4LTBSDYYkOBolI=
X-Received: by 2002:a17:906:1a0b:: with SMTP id i11mr4984968ejf.472.1602099198813;
 Wed, 07 Oct 2020 12:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch> <20201007164426.1812530-11-daniel.vetter@ffwll.ch>
In-Reply-To: <20201007164426.1812530-11-daniel.vetter@ffwll.ch>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 7 Oct 2020 12:33:06 -0700
Message-ID: <CAPcyv4hBL68A7CZa+YnooufDH2tevoxrx32DTJMQ6OHRnec7QQ@mail.gmail.com>
Subject: Re: [PATCH 10/13] PCI: revoke mappings like devmem
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        KVM list <kvm@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Kees Cook <keescook@chromium.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Oct 7, 2020 at 11:11 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
>
> Since 3234ac664a87 ("/dev/mem: Revoke mappings when a driver claims
> the region") /dev/kmem zaps ptes when the kernel requests exclusive
> acccess to an iomem region. And with CONFIG_IO_STRICT_DEVMEM, this is
> the default for all driver uses.
>
> Except there's two more ways to access pci bars: sysfs and proc mmap
> support. Let's plug that hole.

Ooh, yes, lets.

>
> For revoke_devmem() to work we need to link our vma into the same
> address_space, with consistent vma->vm_pgoff. ->pgoff is already
> adjusted, because that's how (io_)remap_pfn_range works, but for the
> mapping we need to adjust vma->vm_file->f_mapping. Usually that's done
> at ->open time, but that's a bit tricky here with all the entry points
> and arch code. So instead create a fake file and adjust vma->vm_file.

I don't think you want to share the devmem inode for this, this should
be based off the sysfs inode which I believe there is already only one
instance per resource. In contrast /dev/mem can have multiple inodes
because anyone can just mknod a new character device file, the same
problem does not exist for sysfs.
