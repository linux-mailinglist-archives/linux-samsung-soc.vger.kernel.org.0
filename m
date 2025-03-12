Return-Path: <linux-samsung-soc+bounces-7435-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9ECA5DD05
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 12 Mar 2025 13:46:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 80C36179261
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 12 Mar 2025 12:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FC24244EA0;
	Wed, 12 Mar 2025 12:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XNZrZpWQ"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C3424E003
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Mar 2025 12:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741783513; cv=none; b=gSPGuA1mF3Q97cCOOgPmoL7wKpTLs6nFzT6YxxmBJQk1tUIh1B2PsQM4+qFZFxNvRDQ34nBMDPTx9jTu4rjYfE7fGbp77vliKTCS3kQCCAaKJYjrsxovh/8z60oib/jEd94ZxuFpeU3l2PmzMaDCaeN7Vt1L7iFUBkLaVR4G8r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741783513; c=relaxed/simple;
	bh=W1wDN+9s1jhdPV61L/v4Imov4WNCE17+44iAJg1ZMVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJahRHuo5dGz3MH9qHursOS2QtMZAG9XmYa0FCV4fiEtyLlq41ZbVpEFu86YlV0STsNJPUeKeh93+gPMMBFAzjHm/t27CjxaC8C9p0bMg+GtFKOgBHcIEA/rMIH6FoehUpgF6h1y6qhR/sKaCIr3SPJ6tMGVgE4JrAjqM7PkBq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XNZrZpWQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cfe808908so45215e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Mar 2025 05:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741783509; x=1742388309; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J6XsRAVYS5vvkiYq6htp9xtxjYL0Ohzn7Mzm+Pk000s=;
        b=XNZrZpWQbdUnmyfs++lwsacEjDLRy+pMlhbKpbZVu5KQ5BXOLcngnxeT9yjU2+Li0b
         NT4hiY+mmaokFxUU8vbjPYgCfscyHYFUAfu/v4RUce5Rft8x5bHSqTp8z6Xrr7NsiEG+
         VBpsUs2xRWJ5zhq0yyWUs3Ag9v9Xix5aVK1DncLBlq9KUGvjTarXpfogKr6AH7frMGnq
         jKpMbytRbHqj3YAqlnidHssHSR69n7IJsH7Y+HLHNsczp5YLRMxe3gYWyWo258n3mhq2
         JcIgrii2Kil5BCC++4CZscv/E9mGf/D23swrOfuewM4SlOxilPzg9ct5MLg8wMplr+Oz
         bDjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741783509; x=1742388309;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6XsRAVYS5vvkiYq6htp9xtxjYL0Ohzn7Mzm+Pk000s=;
        b=bCay0Cu2exgnExG5YoF0dgb/3eTYp0I1JdVZ15gY1rF42Yj9m0gtVHbySqwK8vejdY
         B6psDR0dk+ZCl2wiZ/1nLixeXhux/7O0zZAZoSPiarMvsmNWoh9FfD99jPv4v222tiAh
         BlAABU+j836I9Ruiu6aXuVnBxQgtDzrAiifnqOI/+eF3rbZ6tOaY8sa3VpKicuYMhzvN
         tWJKso/eME8dATZgSNFgWbLqSgmxBWY/3wWXqoppcpO77JhM42RVCQUkMh0MIkqxzQ23
         tqxuaRhlJT0/Jm985eYtVI19HLk77lgt815+zfdEXSC0jMU1OKN9Zk+bKWgtjvRBz5yN
         iidw==
X-Forwarded-Encrypted: i=1; AJvYcCWqlSiinwrd4be0Y64noZWEcDtay3W4FjOY+t2+F7D6OcXl1Qm2PEJusUFJtuPDu18XYMNjwiTJwvULe8aS4I/sdg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaBDaUZ/ZsVF1dnJCrSDg385HsRzlS0jM2OsVoMpNeN6wzKe+b
	U3JI4vGG3kpIAQxABWXfKWZNXCYc2jktfOnC0q6EwKkafZ/bDZcnNEunBQQFdQ==
X-Gm-Gg: ASbGnctppkYeANliCcIxLGScKmNFgaPq9lJKbVWiOyb0mLt+vxEKHFus/cmb4ZFfL2q
	MYZTMH7vTvCbudXSiDyW1l5t1oTeCBvPcSr6DXpMWyhsBPE7XFK/TkiSYYVbSqEp3X7uynYPoSP
	TCnWovFNhPwEdmF5Arf3HtEb9iy3gMGB8crMDM3jQ42ojDVFWibX2Jd690e7rjF7E8p8yoRdeXo
	4Dp1DoP9Db4huCaEHV4WtuBzayb7Rb2oL5Q8e6/pNtUHYKyOEVzN9wGT5ifJYB32+kyPWn8nf6t
	Fc+GVk8wy1fcaEN7WkCPFQ58U6y1kuNsLm13ZWuZawzOpMA/1wMBP1mdiWcOJNrU6ChBeqLi+Yi
	GJLEP
X-Google-Smtp-Source: AGHT+IG4l6i7zsE0j06PLqFsFcdloNEjDbS1APZki97f74wF9+Bk20Rls5AlNCF5S5eWzRhlYo0ndA==
X-Received: by 2002:a05:600c:2d56:b0:439:7fc2:c7ad with SMTP id 5b1f17b1804b1-43d0a5fd65emr1090335e9.7.1741783509129;
        Wed, 12 Mar 2025 05:45:09 -0700 (PDT)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb7ae4sm20402347f8f.5.2025.03.12.05.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Mar 2025 05:45:08 -0700 (PDT)
Date: Wed, 12 Mar 2025 12:45:04 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Hector Martin <marcan@marcan.st>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>,
	Will Deacon <will@kernel.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
	Joerg Roedel <jroedel@suse.de>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	David Rientjes <rientjes@google.com>,
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v3 07/23] iommu/pages: De-inline the substantial functions
Message-ID: <Z9GB0IcNc2432dki@google.com>
References: <0-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
 <7-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7-v3-e797f4dc6918+93057-iommu_pages_jgg@nvidia.com>

On Tue, Feb 25, 2025 at 03:39:24PM -0400, Jason Gunthorpe wrote:
> These are called in a lot of places and are not trivial. Move them to the
> core module.
> 
> Tidy some of the comments and function arguments, fold
> __iommu_alloc_account() into its only caller, change
> __iommu_free_account() into __iommu_free_page() to remove some
> duplication.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>

> ---
>  drivers/iommu/Makefile      |   1 +
>  drivers/iommu/iommu-pages.c |  84 +++++++++++++++++++++++++++++
>  drivers/iommu/iommu-pages.h | 103 ++----------------------------------
>  3 files changed, 90 insertions(+), 98 deletions(-)
>  create mode 100644 drivers/iommu/iommu-pages.c
> 
> diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
> index 5e5a83c6c2aae2..fe91d770abe16c 100644
> --- a/drivers/iommu/Makefile
> +++ b/drivers/iommu/Makefile
> @@ -1,6 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-y += amd/ intel/ arm/ iommufd/ riscv/
>  obj-$(CONFIG_IOMMU_API) += iommu.o
> +obj-$(CONFIG_IOMMU_SUPPORT) += iommu-pages.o
>  obj-$(CONFIG_IOMMU_API) += iommu-traces.o
>  obj-$(CONFIG_IOMMU_API) += iommu-sysfs.o
>  obj-$(CONFIG_IOMMU_DEBUGFS) += iommu-debugfs.o
> diff --git a/drivers/iommu/iommu-pages.c b/drivers/iommu/iommu-pages.c
> new file mode 100644
> index 00000000000000..31ff83ffaf0106
> --- /dev/null
> +++ b/drivers/iommu/iommu-pages.c
> @@ -0,0 +1,84 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024, Google LLC.
> + * Pasha Tatashin <pasha.tatashin@soleen.com>
> + */
> +#include "iommu-pages.h"
> +#include <linux/gfp.h>
> +#include <linux/mm.h>
> +
> +/**
> + * iommu_alloc_pages_node - Allocate a zeroed page of a given order from
> + *                          specific NUMA node
> + * @nid: memory NUMA node id
> + * @gfp: buddy allocator flags
> + * @order: page order
> + *
> + * Returns the virtual address of the allocated page. The page must be
> + * freed either by calling iommu_free_pages() or via iommu_put_pages_list().
> + */
> +void *iommu_alloc_pages_node(int nid, gfp_t gfp, unsigned int order)
> +{
> +	const unsigned long pgcnt = 1UL << order;
> +	struct page *page;
> +
> +	page = alloc_pages_node(nid, gfp | __GFP_ZERO | __GFP_COMP, order);
> +	if (unlikely(!page))
> +		return NULL;
> +
> +	/*
> +	 * All page allocations that should be reported to as "iommu-pagetables"
> +	 * to userspace must use one of the functions below. This includes
> +	 * allocations of page-tables and other per-iommu_domain configuration
> +	 * structures.
> +	 *
> +	 * This is necessary for the proper accounting as IOMMU state can be
> +	 * rather large, i.e. multiple gigabytes in size.
> +	 */
> +	mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, pgcnt);
> +	mod_lruvec_page_state(page, NR_SECONDARY_PAGETABLE, pgcnt);
> +
> +	return page_address(page);
> +}
> +EXPORT_SYMBOL_GPL(iommu_alloc_pages_node);
> +
> +static void __iommu_free_page(struct page *page)
> +{
> +	unsigned int order = folio_order(page_folio(page));
> +	const unsigned long pgcnt = 1UL << order;
> +
> +	mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, -pgcnt);
> +	mod_lruvec_page_state(page, NR_SECONDARY_PAGETABLE, -pgcnt);
> +	put_page(page);
> +}
> +
> +/**
> + * iommu_free_pages - free pages
> + * @virt: virtual address of the page to be freed.
> + *
> + * The page must have have been allocated by iommu_alloc_pages_node()
> + */
> +void iommu_free_pages(void *virt)
> +{
> +	if (!virt)
> +		return;
> +	__iommu_free_page(virt_to_page(virt));
> +}
> +EXPORT_SYMBOL_GPL(iommu_free_pages);
> +
> +/**
> + * iommu_put_pages_list - free a list of pages.
> + * @head: the head of the lru list to be freed.
> + *
> + * Frees a list of pages allocated by iommu_alloc_pages_node().
> + */
> +void iommu_put_pages_list(struct list_head *head)
> +{
> +	while (!list_empty(head)) {
> +		struct page *p = list_entry(head->prev, struct page, lru);
> +
> +		list_del(&p->lru);
> +		__iommu_free_page(p);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(iommu_put_pages_list);
> diff --git a/drivers/iommu/iommu-pages.h b/drivers/iommu/iommu-pages.h
> index fcd17b94f7b830..e3c35aa14ad716 100644
> --- a/drivers/iommu/iommu-pages.h
> +++ b/drivers/iommu/iommu-pages.h
> @@ -7,67 +7,12 @@
>  #ifndef __IOMMU_PAGES_H
>  #define __IOMMU_PAGES_H
>  
> -#include <linux/vmstat.h>
> -#include <linux/gfp.h>
> -#include <linux/mm.h>
> +#include <linux/types.h>
> +#include <linux/topology.h>
>  
> -/*
> - * All page allocations that should be reported to as "iommu-pagetables" to
> - * userspace must use one of the functions below.  This includes allocations of
> - * page-tables and other per-iommu_domain configuration structures.
> - *
> - * This is necessary for the proper accounting as IOMMU state can be rather
> - * large, i.e. multiple gigabytes in size.
> - */
> -
> -/**
> - * __iommu_alloc_account - account for newly allocated page.
> - * @page: head struct page of the page.
> - * @order: order of the page
> - */
> -static inline void __iommu_alloc_account(struct page *page, int order)
> -{
> -	const long pgcnt = 1l << order;
> -
> -	mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, pgcnt);
> -	mod_lruvec_page_state(page, NR_SECONDARY_PAGETABLE, pgcnt);
> -}
> -
> -/**
> - * __iommu_free_account - account a page that is about to be freed.
> - * @page: head struct page of the page.
> - * @order: order of the page
> - */
> -static inline void __iommu_free_account(struct page *page)
> -{
> -	unsigned int order = folio_order(page_folio(page));
> -	const long pgcnt = 1l << order;
> -
> -	mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, -pgcnt);
> -	mod_lruvec_page_state(page, NR_SECONDARY_PAGETABLE, -pgcnt);
> -}
> -
> -/**
> - * iommu_alloc_pages_node - allocate a zeroed page of a given order from
> - * specific NUMA node.
> - * @nid: memory NUMA node id
> - * @gfp: buddy allocator flags
> - * @order: page order
> - *
> - * returns the virtual address of the allocated page
> - */
> -static inline void *iommu_alloc_pages_node(int nid, gfp_t gfp, int order)
> -{
> -	struct page *page =
> -		alloc_pages_node(nid, gfp | __GFP_ZERO | __GFP_COMP, order);
> -
> -	if (unlikely(!page))
> -		return NULL;
> -
> -	__iommu_alloc_account(page, order);
> -
> -	return page_address(page);
> -}
> +void *iommu_alloc_pages_node(int nid, gfp_t gfp, unsigned int order);
> +void iommu_free_pages(void *virt);
> +void iommu_put_pages_list(struct list_head *head);
>  
>  /**
>   * iommu_alloc_pages - allocate a zeroed page of a given order
> @@ -104,42 +49,4 @@ static inline void *iommu_alloc_page(gfp_t gfp)
>  	return iommu_alloc_pages_node(numa_node_id(), gfp, 0);
>  }
>  
> -/**
> - * iommu_free_pages - free pages
> - * @virt: virtual address of the page to be freed.
> - *
> - * The page must have have been allocated by iommu_alloc_pages_node()
> - */
> -static inline void iommu_free_pages(void *virt)
> -{
> -	struct page *page;
> -
> -	if (!virt)
> -		return;
> -
> -	page = virt_to_page(virt);
> -	__iommu_free_account(page);
> -	put_page(page);
> -}
> -
> -/**
> - * iommu_put_pages_list - free a list of pages.
> - * @page: the head of the lru list to be freed.
> - *
> - * There are no locking requirement for these pages, as they are going to be
> - * put on a free list as soon as refcount reaches 0. Pages are put on this LRU
> - * list once they are removed from the IOMMU page tables. However, they can
> - * still be access through debugfs.
> - */
> -static inline void iommu_put_pages_list(struct list_head *page)
> -{
> -	while (!list_empty(page)) {
> -		struct page *p = list_entry(page->prev, struct page, lru);
> -
> -		list_del(&p->lru);
> -		__iommu_free_account(p);
> -		put_page(p);
> -	}
> -}
> -
>  #endif	/* __IOMMU_PAGES_H */
> -- 
> 2.43.0
> 

