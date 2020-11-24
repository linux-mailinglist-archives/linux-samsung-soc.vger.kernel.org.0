Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB292C2999
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 24 Nov 2020 15:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389011AbgKXO2T (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 24 Nov 2020 09:28:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388848AbgKXO2T (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 24 Nov 2020 09:28:19 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7D77C0617A6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Nov 2020 06:28:18 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id z7so6699674wrn.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Nov 2020 06:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=KSq6GECp1i25ezV0Y6T/3NvT3N3r3AJ5cEVxbDW0CLw=;
        b=M8OKVKLPb+FMINuPALRG9V3PVI91CXQvXh6el7xGRjUkVyzBaQH4KHu/tMBmJ5taDe
         59iDiQDNm2o3xbPwv0oSLio8yFOJvro7J42g63pWYI73IIHBT3JzdvD1M0d8OksY+kMI
         XGPBgQVF+ghp0Mqq2KbUaYPWwm0MKVO12MAPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=KSq6GECp1i25ezV0Y6T/3NvT3N3r3AJ5cEVxbDW0CLw=;
        b=dnLVaedh99RIOL/cFdMu+osB3xohCjpW+X/ns+L7adBVAkfNccVTkH9xW9tB8E9S6z
         kdw4YsvA5B/0TrdAYTAZxoJKY699x8SrdZWUxn3kdn3tJkY6oIOU1P4OuQ7X/8sY6/Po
         udtnS8kbkDPj0vZbDvQ1Ed2wihqtxbu7MTzEesFcqlHJ//stgvifph/oc1IYQmlZNzIf
         pNx/tm5z+RmEbcTY8GLsTSRC5bsLKGruWU9N/OfmhdLqAOUJD/CB6LisR8LtB/nFsiM1
         xyx4rnZuCOpG2e7HtSDJRZl3fU2ZU/rJ/LkLmoLt/uvwLzaWNOlHO5dL0eee1r0ciUhM
         GGVA==
X-Gm-Message-State: AOAM530ADuEXuu7Yc6KrRszENeJNjUNDFPuRwz84UQo3eHw4dWo0gPEu
        DY0Bs10pXTy2kZy/9rdlF8yhJw==
X-Google-Smtp-Source: ABdhPJzYIyfiFO7Qic0f+2tVMFNssr9Nw0LvMxY+vwY4ywKdlugcFp6ONKZKvUGFaWMjY1vmdCWa+w==
X-Received: by 2002:a5d:610d:: with SMTP id v13mr5595456wrt.425.1606228097589;
        Tue, 24 Nov 2020 06:28:17 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id 35sm27158318wro.71.2020.11.24.06.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 06:28:16 -0800 (PST)
Date:   Tue, 24 Nov 2020 15:28:14 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        Christoph Hellwig <hch@infradead.org>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>
Subject: Re: [PATCH v6 17/17] RFC: mm: add mmu_notifier argument to follow_pfn
Message-ID: <20201124142814.GM401619@phenom.ffwll.local>
Mail-Followup-To: Jason Gunthorpe <jgg@ziepe.ca>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
        linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Daniel Vetter <daniel.vetter@intel.com>,
        Christoph Hellwig <hch@infradead.org>,
        Kees Cook <keescook@chromium.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>
References: <20201119144146.1045202-1-daniel.vetter@ffwll.ch>
 <20201119144146.1045202-18-daniel.vetter@ffwll.ch>
 <20201120183029.GQ244516@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120183029.GQ244516@ziepe.ca>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Nov 20, 2020 at 02:30:29PM -0400, Jason Gunthorpe wrote:
> On Thu, Nov 19, 2020 at 03:41:46PM +0100, Daniel Vetter wrote:
> > @@ -4805,21 +4824,15 @@ EXPORT_SYMBOL(follow_pte_pmd);
> >   * Return: zero and the pfn at @pfn on success, -ve otherwise.
> >   */
> >  int follow_pfn(struct vm_area_struct *vma, unsigned long address,
> > -	unsigned long *pfn)
> > +	unsigned long *pfn, struct mmu_notifier *subscription)
> >  {
> > -	int ret = -EINVAL;
> > -	spinlock_t *ptl;
> > -	pte_t *ptep;
> > +	if (WARN_ON(!subscription->mm))
> > +		return -EINVAL;
> >  
> > +	if (WARN_ON(subscription->mm != vma->vm_mm))
> > +		return -EINVAL;
> 
> These two things are redundant right? vma->vm_mm != NULL?

Yup, will remove.

> BTW, why do we even have this for nommu? If the only caller is kvm,
> can you even compile kvm on nommu??

Kinda makes sense, but I have no idea how to make sure with compile
testing this is really the case. And I didn't see any hard evidence in
Kconfig or Makefile that mmu notifiers requires CONFIG_MMU. So not sure
what to do here.

Should I just remove the nommu version of follow_pfn and see what happens?
We can't remove it earlier since it's still used by other subsystems.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
