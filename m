Return-Path: <linux-samsung-soc+bounces-706-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B8881393A
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 14 Dec 2023 18:58:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D7661C20AF7
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 14 Dec 2023 17:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3F5667E6E;
	Thu, 14 Dec 2023 17:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xGZbKlpO"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0007123
	for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Dec 2023 09:58:26 -0800 (PST)
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-35f8865cc32so2415ab.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Dec 2023 09:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702576706; x=1703181506; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=o8hhXPzgTkSbGrZlVoxMVSGKEuHWo76SGrFtR2YZpAU=;
        b=xGZbKlpO2u0cKvAWGqFmHSjb3EV1nYmRpMMA6kG0/SCMBMXGAp6bWV8OVzcCkECcty
         LEaQDCIecag6Gccbo/Wzy7bHgsEIo9pJ1ETPxYTw4/+I8DqfAzEbBPmvtGRomXSIegfh
         NYgd2JfxHDyyjvYsA60GReXCQBsyARo2jHJwjckE3bnGD1q+C+TMfttWqB0WqJDaHdho
         TW6zCjF9DFIaKhw3QZk0WK01/VqFIibX0Hq6azcwIWmisqG6jSuKyzZcrDhlQPWt02b+
         DBsSqQZosN7/8xOtx2yBm4qmdAcHyWKBCLG8rOqNkobZ5ttgcZ01J4yJq7W3iWXpJwJD
         TUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702576706; x=1703181506;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o8hhXPzgTkSbGrZlVoxMVSGKEuHWo76SGrFtR2YZpAU=;
        b=MYgpImCBWwmewaiiAe94qK7RQkWDVd+kwMx3occXm1x+F6YX3dggWo4ICGXsn/dWI9
         0RTADnXsj4OdG8hMD+DfmSzKTLdV8rn+27qUfSBLG8il5Yld3jf5EimWSC0dHVgvFUsw
         T62U08sgRYTtW1IDTfmtzQyIS6G4n60AboSjfTeBt+ZNANsd2MWaKB9ARJ8b0rNPe0/T
         FXpG+mu9km0Q0E4Z5xfNjLHc0dkEEsZkwGCntJ3OyZyRbDH8LCN1Pqp784bdt5XOKYtE
         3vlGskjFiMrVoUthgMACAphp6gbyxracVb511WmNBtiBwgv+Duko4sg1iSKDFWZzpZk1
         E6vw==
X-Gm-Message-State: AOJu0YzGTKCbiUREsr/khYveYaC6ibDnfJVnTxkKJeiGf7U4hGNqE4iE
	UOJ8AyawV0WeE+d5QEUESRaTIw==
X-Google-Smtp-Source: AGHT+IHmJZOc6yIjryc1hqs+mSoywAgy/Kw7JX+y+PxO7dXRpBhV7x9zJfpibywCzeGN/8UCDSSJcQ==
X-Received: by 2002:a05:6e02:4a3:b0:35f:7497:181a with SMTP id e3-20020a056e0204a300b0035f7497181amr419773ils.2.1702576705658;
        Thu, 14 Dec 2023 09:58:25 -0800 (PST)
Received: from [2620:0:1008:15:740b:4c24:bdb6:a42a] ([2620:0:1008:15:740b:4c24:bdb6:a42a])
        by smtp.gmail.com with ESMTPSA id ba1-20020a170902720100b001d09c539c95sm12769653plb.90.2023.12.14.09.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 09:58:25 -0800 (PST)
Date: Thu, 14 Dec 2023 09:58:23 -0800 (PST)
From: David Rientjes <rientjes@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
cc: Andrew Morton <akpm@linux-foundation.org>, alim.akhtar@samsung.com, 
    alyssa@rosenzweig.io, asahi@lists.linux.dev, baolu.lu@linux.intel.com, 
    bhelgaas@google.com, cgroups@vger.kernel.org, corbet@lwn.net, 
    david@redhat.com, dwmw2@infradead.org, hannes@cmpxchg.org, heiko@sntech.de, 
    iommu@lists.linux.dev, jernej.skrabec@gmail.com, jonathanh@nvidia.com, 
    joro@8bytes.org, krzysztof.kozlowski@linaro.org, linux-doc@vger.kernel.org, 
    linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
    linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
    linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
    mhiramat@kernel.org, m.szyprowski@samsung.com, paulmck@kernel.org, 
    rdunlap@infradead.org, robin.murphy@arm.com, samuel@sholland.org, 
    suravee.suthikulpanit@amd.com, sven@svenpeter.dev, 
    thierry.reding@gmail.com, tj@kernel.org, tomas.mudrunka@gmail.com, 
    vdumpa@nvidia.com, wens@csie.org, will@kernel.org, yu-cheng.yu@intel.com
Subject: Re: [PATCH v2 01/10] iommu/vt-d: add wrapper functions for page
 allocations
In-Reply-To: <20231130201504.2322355-2-pasha.tatashin@soleen.com>
Message-ID: <776e17af-ae25-16a0-f443-66f3972b00c0@google.com>
References: <20231130201504.2322355-1-pasha.tatashin@soleen.com> <20231130201504.2322355-2-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 30 Nov 2023, Pasha Tatashin wrote:

> diff --git a/drivers/iommu/iommu-pages.h b/drivers/iommu/iommu-pages.h
> new file mode 100644
> index 000000000000..2332f807d514
> --- /dev/null
> +++ b/drivers/iommu/iommu-pages.h
> @@ -0,0 +1,199 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2023, Google LLC.
> + * Pasha Tatashin <pasha.tatashin@soleen.com>
> + */
> +
> +#ifndef __IOMMU_PAGES_H
> +#define __IOMMU_PAGES_H
> +
> +#include <linux/vmstat.h>
> +#include <linux/gfp.h>
> +#include <linux/mm.h>
> +
> +/*
> + * All page allocation that are performed in the IOMMU subsystem must use one of
> + * the functions below.  This is necessary for the proper accounting as IOMMU
> + * state can be rather large, i.e. multiple gigabytes in size.
> + */
> +
> +/**
> + * __iommu_alloc_pages_node - allocate a zeroed page of a given order from
> + * specific NUMA node.
> + * @nid: memory NUMA node id

NUMA_NO_NODE if no locality requirements?

> + * @gfp: buddy allocator flags
> + * @order: page order
> + *
> + * returns the head struct page of the allocated page.
> + */
> +static inline struct page *__iommu_alloc_pages_node(int nid, gfp_t gfp,
> +						    int order)
> +{
> +	struct page *pages;

s/pages/page/ here and later in this file.

> +
> +	pages = alloc_pages_node(nid, gfp | __GFP_ZERO, order);
> +	if (!pages)

unlikely()?

> +		return NULL;
> +
> +	return pages;
> +}
> +
> +/**
> + * __iommu_alloc_pages - allocate a zeroed page of a given order.
> + * @gfp: buddy allocator flags
> + * @order: page order
> + *
> + * returns the head struct page of the allocated page.
> + */
> +static inline struct page *__iommu_alloc_pages(gfp_t gfp, int order)
> +{
> +	struct page *pages;
> +
> +	pages = alloc_pages(gfp | __GFP_ZERO, order);
> +	if (!pages)
> +		return NULL;
> +
> +	return pages;
> +}
> +
> +/**
> + * __iommu_alloc_page_node - allocate a zeroed page at specific NUMA node.
> + * @nid: memory NUMA node id
> + * @gfp: buddy allocator flags
> + *
> + * returns the struct page of the allocated page.
> + */
> +static inline struct page *__iommu_alloc_page_node(int nid, gfp_t gfp)
> +{
> +	return __iommu_alloc_pages_node(nid, gfp, 0);
> +}
> +
> +/**
> + * __iommu_alloc_page - allocate a zeroed page
> + * @gfp: buddy allocator flags
> + *
> + * returns the struct page of the allocated page.
> + */
> +static inline struct page *__iommu_alloc_page(gfp_t gfp)
> +{
> +	return __iommu_alloc_pages(gfp, 0);
> +}
> +
> +/**
> + * __iommu_free_pages - free page of a given order
> + * @pages: head struct page of the page

I think "pages" implies more than one page, this is just a (potentially 
compound) page?

> + * @order: page order
> + */
> +static inline void __iommu_free_pages(struct page *pages, int order)
> +{
> +	if (!pages)
> +		return;
> +
> +	__free_pages(pages, order);
> +}
> +
> +/**
> + * __iommu_free_page - free page
> + * @page: struct page of the page
> + */
> +static inline void __iommu_free_page(struct page *page)
> +{
> +	__iommu_free_pages(page, 0);
> +}
> +
> +/**
> + * iommu_alloc_pages_node - allocate a zeroed page of a given order from
> + * specific NUMA node.
> + * @nid: memory NUMA node id
> + * @gfp: buddy allocator flags
> + * @order: page order
> + *
> + * returns the virtual address of the allocated page
> + */
> +static inline void *iommu_alloc_pages_node(int nid, gfp_t gfp, int order)
> +{
> +	struct page *pages = __iommu_alloc_pages_node(nid, gfp, order);
> +
> +	if (!pages)
> +		return NULL;
> +
> +	return page_address(pages);
> +}
> +
> +/**
> + * iommu_alloc_pages - allocate a zeroed page of a given order
> + * @gfp: buddy allocator flags
> + * @order: page order
> + *
> + * returns the virtual address of the allocated page
> + */
> +static inline void *iommu_alloc_pages(gfp_t gfp, int order)
> +{
> +	struct page *pages = __iommu_alloc_pages(gfp, order);
> +
> +	if (!pages)
> +		return NULL;
> +
> +	return page_address(pages);
> +}
> +
> +/**
> + * iommu_alloc_page_node - allocate a zeroed page at specific NUMA node.
> + * @nid: memory NUMA node id
> + * @gfp: buddy allocator flags
> + *
> + * returns the virtual address of the allocated page
> + */
> +static inline void *iommu_alloc_page_node(int nid, gfp_t gfp)
> +{
> +	return iommu_alloc_pages_node(nid, gfp, 0);
> +}
> +
> +/**
> + * iommu_alloc_page - allocate a zeroed page
> + * @gfp: buddy allocator flags
> + *
> + * returns the virtual address of the allocated page
> + */
> +static inline void *iommu_alloc_page(gfp_t gfp)
> +{
> +	return iommu_alloc_pages(gfp, 0);
> +}
> +
> +/**
> + * iommu_free_pages - free page of a given order
> + * @virt: virtual address of the page to be freed.
> + * @order: page order
> + */
> +static inline void iommu_free_pages(void *virt, int order)
> +{
> +	if (!virt)
> +		return;
> +
> +	__iommu_free_pages(virt_to_page(virt), order);
> +}
> +
> +/**
> + * iommu_free_page - free page
> + * @virt: virtual address of the page to be freed.
> + */
> +static inline void iommu_free_page(void *virt)
> +{
> +	iommu_free_pages(virt, 0);
> +}
> +
> +/**
> + * iommu_free_pages_list - free a list of pages.
> + * @pages: the head of the lru list to be freed.

Document the locking requirements for this?

> + */
> +static inline void iommu_free_pages_list(struct list_head *pages)
> +{
> +	while (!list_empty(pages)) {
> +		struct page *p = list_entry(pages->prev, struct page, lru);
> +
> +		list_del(&p->lru);
> +		put_page(p);
> +	}
> +}
> +
> +#endif	/* __IOMMU_PAGES_H */
> -- 
> 2.43.0.rc2.451.g8631bc7472-goog
> 
> 
> 

