Return-Path: <linux-samsung-soc+bounces-1889-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A42FE850227
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 10 Feb 2024 03:22:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A661B23FB0
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 10 Feb 2024 02:21:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A03F75238;
	Sat, 10 Feb 2024 02:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=soleen.com header.i=@soleen.com header.b="E1MTeg84"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D9F4C81
	for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Feb 2024 02:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707531710; cv=none; b=GnFKsDklcELhuKLsdjwO2zUE4vhcnYkno9Q6WDkYrRDjzyJTCGbjFGadVLS5k/pi78RpE10TYDGUmdytfoN9cZ5TDiBZO3ojdkid87apyNm+srx3TNbwx8SDTuHIRfn/X72vq4tPmahcww4a/GwgpcY8CnCgLjS5ah5F8jzClJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707531710; c=relaxed/simple;
	bh=OEsr09Gb3Hzxbc+OG+EIkVQM7fLubAEWg7orSg+gNbQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G6gZX9Ba9niWeWJr4yy/h/eFyl0mrpj9JhUbmeP4OUUjhPruD8Y44MqzaXBCB6Neomry7ch+mrEOMpBnJrE93RS3k72FJY+ZCAYBwNNOoQ30gMjWQUuWMICJyD4CpRNDilM1FonefjFLkn7TkFoDHvVBKDXnseMt5awIrE4DjYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soleen.com; spf=none smtp.mailfrom=soleen.com; dkim=fail (0-bit key) header.d=soleen.com header.i=@soleen.com header.b=E1MTeg84 reason="key not found in DNS"; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=soleen.com
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-214c940145bso848683fac.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Feb 2024 18:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1707531707; x=1708136507; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HxzMCuaeyhn3J9cU+FUkQXDQEw1s8FDPbrSZbrZddcs=;
        b=E1MTeg84HyX2eWEqdtJvMGUHAsHw4vPk1Srm6/eP/13CA8Tx8MMWNdrD/i6sscuz4l
         9fv6Gs64K4NTqllfuBu3vsarRxrHfYNSsuVBpTc2l0Un0jb9JOZ/TlixloFzfcBdXZz3
         z0TuMS+MaAbQGHLMDunzgJy/a8WYYeY1f5XkbvefPkUSBlLi5fwDhyc4lwq5RO2E1sBx
         kUTHIWvcpC1UhFlnEbxd95JKLlQkoSkd2Sofi3Y8uASJjJgUtZug7k9WbhWdkMsnZEvE
         8fdnO6K7czYOK3g2d/kPvJlRh6RHbNGS6y81kTfaGKdH/RDJ3y2ezLlS3OiDxyIS6loJ
         CWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707531707; x=1708136507;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HxzMCuaeyhn3J9cU+FUkQXDQEw1s8FDPbrSZbrZddcs=;
        b=hACQqQnUzbqUC5Iwb/9kTvJdnF79Y8CV4F5UDPMZuPq17ePQaoBz81kJMjQv/+gtie
         Lod38Oq1LoinjbAV+nfalHho8psxzgQew4hiy9aYC6QvbehpOnXXcYKi/bKjXkBZfQio
         /xWypCQElnQRel9DT05oN9ZcF2gId6lzNdfNobd/+Ub7h6kMKA46qwxdqFYYWObG5rSx
         NXiM1gqaOktLb7i5YiGptQ0c5UWC3B6J5KdsVcBTtW1MKOnxxW/ATTgj77Ub7Ca5uu9E
         2Q+a1gJ/kjOI/ce2mo2GZuSdyg22FZjkB/fEdCIsWqULONriBhFOp5bSkfgg05i+CwS7
         QruA==
X-Forwarded-Encrypted: i=1; AJvYcCW3FCzhlHTIPh+WshRKm9pjv7+xNf7mMX1V3dj6G1T0b15vPKHUTbtfXnrXiUca4kxedJ3Oa2r+9YPxuk2JDZP7jDhlYjAgqiGDi9Xh2190zQo=
X-Gm-Message-State: AOJu0YyKKi4FDDNWYnwWUjcH+hMVj+Rn8LWjIDc6OW28FIJ/zNv1j86p
	0TjN3aRcQoPiJVjb3/6AzgR66CIeJn8PELugYt4KjdGAOKMxXrBVkwG7EBlHwAIAqcACJhgXg72
	jqtndo/SQwxUkYnzzfC/VDLpDaW6aiOJdA95hzw==
X-Google-Smtp-Source: AGHT+IFmCDzBaOTRJEg/f8FLkRS6yQpqqh3yX5ZW6I0WCsOQ72Tibv6RAzofMrIiMT9QniCTSK/5rtfk2WW8zRu6CiM=
X-Received: by 2002:a05:6870:211:b0:218:f001:10bf with SMTP id
 j17-20020a056870021100b00218f00110bfmr1150766oad.35.1707531707564; Fri, 09
 Feb 2024 18:21:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240207174102.1486130-1-pasha.tatashin@soleen.com>
 <20240207174102.1486130-2-pasha.tatashin@soleen.com> <8ce2cd7b-7702-45aa-b4c8-25a01c27ed83@arm.com>
In-Reply-To: <8ce2cd7b-7702-45aa-b4c8-25a01c27ed83@arm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 9 Feb 2024 21:21:10 -0500
Message-ID: <CA+CK2bC=XyUhoSP9f0XBqEnQ-P5mMT2U=5dfzRSc9C=2b+bstQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] iommu/vt-d: add wrapper functions for page allocations
To: Robin Murphy <robin.murphy@arm.com>
Cc: akpm@linux-foundation.org, alim.akhtar@samsung.com, alyssa@rosenzweig.io, 
	asahi@lists.linux.dev, baolu.lu@linux.intel.com, bhelgaas@google.com, 
	cgroups@vger.kernel.org, corbet@lwn.net, david@redhat.com, 
	dwmw2@infradead.org, hannes@cmpxchg.org, heiko@sntech.de, 
	iommu@lists.linux.dev, jernej.skrabec@gmail.com, jonathanh@nvidia.com, 
	joro@8bytes.org, krzysztof.kozlowski@linaro.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
	mhiramat@kernel.org, m.szyprowski@samsung.com, paulmck@kernel.org, 
	rdunlap@infradead.org, samuel@sholland.org, suravee.suthikulpanit@amd.com, 
	sven@svenpeter.dev, thierry.reding@gmail.com, tj@kernel.org, 
	tomas.mudrunka@gmail.com, vdumpa@nvidia.com, wens@csie.org, will@kernel.org, 
	yu-cheng.yu@intel.com, rientjes@google.com, bagasdotme@gmail.com, 
	mkoutny@suse.com
Content-Type: text/plain; charset="UTF-8"

Hi Robin,

Thank you for reviewing this.

> > +#ifndef __IOMMU_PAGES_H
> > +#define __IOMMU_PAGES_H
> > +
> > +#include <linux/vmstat.h>
> > +#include <linux/gfp.h>
> > +#include <linux/mm.h>
> > +
> > +/*
> > + * All page allocation that are performed in the IOMMU subsystem must use one of
>
> "All page allocations" is too broad; As before, this is only about
> pagetable allocations, or I guess for the full nuance, allocations of
> pagetables and other per-iommu_domain configuration structures which are
> reasonable to report as "pagetables" to userspace.

I will update the comment.


>
> > + * the functions below.  This is necessary for the proper accounting as IOMMU
> > + * state can be rather large, i.e. multiple gigabytes in size.
> > + */
> > +
> > +/**
> > + * __iommu_alloc_pages_node - allocate a zeroed page of a given order from
> > + * specific NUMA node.
> > + * @nid: memory NUMA node id
> > + * @gfp: buddy allocator flags
> > + * @order: page order
> > + *
> > + * returns the head struct page of the allocated page.
> > + */
> > +static inline struct page *__iommu_alloc_pages_node(int nid, gfp_t gfp,
> > +                                                 int order)
> > +{
> > +     struct page *page;
> > +
> > +     page = alloc_pages_node(nid, gfp | __GFP_ZERO, order);
> > +     if (unlikely(!page))
> > +             return NULL;
> > +
> > +     return page;
> > +}
>
> All 3 invocations of this only use the returned struct page to trivially
> derive page_address(), so we really don't need it; just clean up these
> callsites a bit more.

I will remove this function, and update all invocations to use
iommu_alloc_pages_node() directly.


> > + * __iommu_alloc_pages - allocate a zeroed page of a given order.
> > + * @gfp: buddy allocator flags
> > + * @order: page order
> > + *
> > + * returns the head struct page of the allocated page.
> > + */
> > +static inline struct page *__iommu_alloc_pages(gfp_t gfp, int order)
> > +{
> > +     struct page *page;
> > +
> > +     page = alloc_pages(gfp | __GFP_ZERO, order);
> > +     if (unlikely(!page))
> > +             return NULL;
> > +
> > +     return page;
> > +}
>
> Same for the single invocation of this one.

I kept this function, but removed __iommu_alloc_page() that depends on
it. This is because tegra-smmu needs a "struct page" allocator.

>
> > +
> > +/**
> > + * __iommu_alloc_page_node - allocate a zeroed page at specific NUMA node.
> > + * @nid: memory NUMA node id
> > + * @gfp: buddy allocator flags
> > + *
> > + * returns the struct page of the allocated page.
> > + */
> > +static inline struct page *__iommu_alloc_page_node(int nid, gfp_t gfp)
> > +{
> > +     return __iommu_alloc_pages_node(nid, gfp, 0);
> > +}
>
> There are no users of this at all.

Yes, I added it just for completeness, I will remove it.


> > + * __iommu_alloc_page - allocate a zeroed page
> > + * @gfp: buddy allocator flags
> > + *
> > + * returns the struct page of the allocated page.
> > + */
> > +static inline struct page *__iommu_alloc_page(gfp_t gfp)
> > +{
> > +     return __iommu_alloc_pages(gfp, 0);
> > +}
> > +
> > +/**
> > + * __iommu_free_pages - free page of a given order
> > + * @page: head struct page of the page
> > + * @order: page order
> > + */
> > +static inline void __iommu_free_pages(struct page *page, int order)
> > +{
> > +     if (!page)
> > +             return;
> > +
> > +     __free_pages(page, order);
> > +}
> > +
> > +/**
> > + * __iommu_free_page - free page
> > + * @page: struct page of the page
> > + */
> > +static inline void __iommu_free_page(struct page *page)
> > +{
> > +     __iommu_free_pages(page, 0);
> > +}
>
> Beyond one more trivial Intel cleanup for __iommu_alloc_pages(), these 3
> are then only used by tegra-smmu, so honestly I'd be inclined to just
> open-code there page_address()/virt_to_page() conversions as appropriate
> there (once again I think the whole thing could in fact be refactored to
> not use struct pages at all because all it's ever ultimately doing with
> them is page_address(), but that would be a bigger job so definitely
> out-of-scope for this series).

I removed __iommu_free_page(), but kept __iommu_free_pages() variant.

>
> > +
> > +/**
> > + * iommu_alloc_pages_node - allocate a zeroed page of a given order from
> > + * specific NUMA node.
> > + * @nid: memory NUMA node id
> > + * @gfp: buddy allocator flags
> > + * @order: page order
> > + *
> > + * returns the virtual address of the allocated page
> > + */
> > +static inline void *iommu_alloc_pages_node(int nid, gfp_t gfp, int order)
> > +{
> > +     struct page *page = __iommu_alloc_pages_node(nid, gfp, order);
> > +
> > +     if (unlikely(!page))
> > +             return NULL;
>
> As a general point I'd prefer to fold these checks into the accounting
> function itself rather than repeat them all over.

For the free functions this saves a few cycles by not repeating this
check again inside __free_pages(), to keep things symmetrical it makes
sense to keep __iomu_free_account and __iomu_alloc_account the same.
With the other clean-up there are not that many of these checks left.

> > + */
> > +static inline void *iommu_alloc_page_node(int nid, gfp_t gfp)
> > +{
> > +     return iommu_alloc_pages_node(nid, gfp, 0);
> > +}
>
> TBH I'm not entirely convinced that saving 4 characters per invocation
> times 11 invocations makes this wrapper worthwhile :/

Let's keep them. After the clean-up that you suggested, there are
fewer functions left in this file, but I think that it is cleaner to
keep these remaining, as it is beneficial to easily distinguish when
exactly one page is allocated vs when multiple are allocated via code
search.


> > + *
> > + * There are no locking requirement for these pages, as they are going to be
> > + * put on a free list as soon as refcount reaches 0. Pages are put on this LRU
> > + * list once they are removed from the IOMMU page tables. However, they can
> > + * still be access through debugfs.
> > + */
> > +static inline void iommu_free_pages_list(struct list_head *page)
>
> Nit: I'd be inclined to call this iommu_put_pages_list for consistency.

I will rename it to iommu_put_pages_list(), indeed a better name.

>
> > +{
> > +     while (!list_empty(page)) {
> > +             struct page *p = list_entry(page->prev, struct page, lru);
> > +
> > +             list_del(&p->lru);
> > +             put_page(p);
> > +     }
> > +}
>
> I realise now you've also missed the common freelist freeing sites in
> iommu-dma.

Ah yes, thank you for catching that. I will fix it.

Pasha

