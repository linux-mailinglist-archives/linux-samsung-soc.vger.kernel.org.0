Return-Path: <linux-samsung-soc+bounces-2753-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 739628A394D
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 13 Apr 2024 02:27:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2902D284921
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 13 Apr 2024 00:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DB4208B6;
	Sat, 13 Apr 2024 00:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="tEg6rS1V"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03BCF1B947
	for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Apr 2024 00:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712967940; cv=none; b=MXsAX6nNVfx/B2xEezmaF9Rmgxv7sgs5LyAwHovkMQzseMaDrz+B4iLwOip3ZEJMzro3mCVxaXnV8K8gIPKmKSeSph5WIqdE3g/Cti88ElfmOLngAGmD9K1TawDidz8TKOubPqbsaTyHPlHaNsGpjk0hPz8LvDipzW8dPVlkb9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712967940; c=relaxed/simple;
	bh=S/sBR1NCxNI/U5SAtH05O6LxOFmnYHqMGvt3EyOOqMw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qXRqcrWEb1EUMbkMLNXlKDz9mRa2GUJ4XkagNTEEj/mPSxDzdH9EzIAP4LHrHGVEVubCEaieB0ec8QAlKftHA0WrYZEmEbFNIIOfmRJVkc828XzKZI41yTxCoiLVgXAC12WuJu6ezzqe3AYs5tk2LMnmEfnEVkvbed6yocEmdEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=tEg6rS1V; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-78ecd752a7cso58094885a.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Apr 2024 17:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712967935; x=1713572735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lsGN5WIIRNrc7OxFwMhPRXWLlVhvYQL3ZDijKX4hJeQ=;
        b=tEg6rS1VSmqWizA7Pq0eKMDT4hB2ZkGxLMzb57MM/RdDBukQOdzuHjgB7VMxZtXw1B
         V0PVQ1NQFQgyZxJeBkINguGezNGChwLm7K/puZg+SFRxckPxva7ww0UlrYKP3YAF4ind
         Xa4r5pOP5lhCCP7UOSN1VZdM+XNkWnyiJDy0/QG6vmiEBIRaR5NRTFQaW1YWjXjdSJKB
         prWAMy1H7qaIq1U71pNum1kWCajEHFKykEyBpYg1WoTWL9xt2nyojDdll9XgGi+1t7Ag
         lz9YVvkCgZLlMMJXe8YKOhq1I0XUmCIkzkoQWHiouo/xdYOEtc4AQYocVWey4U6MNI4v
         trBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712967935; x=1713572735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsGN5WIIRNrc7OxFwMhPRXWLlVhvYQL3ZDijKX4hJeQ=;
        b=Jdw7LdJhxYCAqMbezUtMjp20mZC9VP2dX0XJaXsRW9GnHQWXaH0UxOun462c9NUwj/
         /vWKG5HBEjv/m80fA/EFlByYLGrBTOSAn+66x8PPT49HKbDjbNBN3J5fGNX8+7zYaDpk
         7laE69gQAnfzE8ByHJzcNKfGX4y2uNc5Mh/1FUw9lbPfnalkTTSsqKRTMIZn1KwMDBO4
         MZhRnLPBeZnbKCDS6+dQH+ytK62L3YaaVynTNYo6EQ905X7tD1OrJnbjD0cLsCYNdtg0
         yjBK9XwOSxr6elyQBfVaFtamCj/CtgUAkkWqJnt+1h0GfmIYQhPjvVDkb9sNTq++oVRC
         gAgw==
X-Forwarded-Encrypted: i=1; AJvYcCU04qHognOZOC5bpJrq3NlaBJBij3KX2e8Nbr5XScjdKdIvBQonJlcJFlHcyf+I+HtO2zcGln74R/YAEi9uXZwN/UcaGx6RVDlyKIblln2Ze4s=
X-Gm-Message-State: AOJu0Yxn5n7ZsvCFWQrAGlh+5hR41Y/uTHtRa98UBkM5XOq1T7Gl1M9P
	WqO8POCVU4oWy7eL/c5rEDTwQyQ/hgydx+dH8bclh6NowhQKqvRXx0ZJ0DWfe48=
X-Google-Smtp-Source: AGHT+IFlAsPoHG2FDkZGPGOgYKbc0L/VN/uoaQSjmKoP15ZCmJynTAbwXmhrnqPB3wz5ZBdnnVJffA==
X-Received: by 2002:a05:620a:b41:b0:78d:53eb:c256 with SMTP id x1-20020a05620a0b4100b0078d53ebc256mr4232583qkg.72.1712967934863;
        Fri, 12 Apr 2024 17:25:34 -0700 (PDT)
Received: from soleen.c.googlers.com.com (128.174.85.34.bc.googleusercontent.com. [34.85.174.128])
        by smtp.gmail.com with ESMTPSA id wl25-20020a05620a57d900b0078d5fece9a6sm3053490qkn.101.2024.04.12.17.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 17:25:34 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: akpm@linux-foundation.org,
	alim.akhtar@samsung.com,
	alyssa@rosenzweig.io,
	asahi@lists.linux.dev,
	baolu.lu@linux.intel.com,
	bhelgaas@google.com,
	cgroups@vger.kernel.org,
	corbet@lwn.net,
	david@redhat.com,
	dwmw2@infradead.org,
	hannes@cmpxchg.org,
	heiko@sntech.de,
	iommu@lists.linux.dev,
	jernej.skrabec@gmail.com,
	jonathanh@nvidia.com,
	joro@8bytes.org,
	krzysztof.kozlowski@linaro.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	lizefan.x@bytedance.com,
	marcan@marcan.st,
	mhiramat@kernel.org,
	m.szyprowski@samsung.com,
	pasha.tatashin@soleen.com,
	paulmck@kernel.org,
	rdunlap@infradead.org,
	robin.murphy@arm.com,
	samuel@sholland.org,
	suravee.suthikulpanit@amd.com,
	sven@svenpeter.dev,
	thierry.reding@gmail.com,
	tj@kernel.org,
	tomas.mudrunka@gmail.com,
	vdumpa@nvidia.com,
	wens@csie.org,
	will@kernel.org,
	yu-cheng.yu@intel.com,
	rientjes@google.com,
	bagasdotme@gmail.com,
	mkoutny@suse.com
Subject: [PATCH v6 10/11] iommu: observability of the IOMMU allocations
Date: Sat, 13 Apr 2024 00:25:21 +0000
Message-ID: <20240413002522.1101315-11-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
In-Reply-To: <20240413002522.1101315-1-pasha.tatashin@soleen.com>
References: <20240413002522.1101315-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add NR_IOMMU_PAGES into node_stat_item that counts number of pages
that are allocated by the IOMMU subsystem.

The allocations can be view per-node via:
/sys/devices/system/node/nodeN/vmstat.

For example:

$ grep iommu /sys/devices/system/node/node*/vmstat
/sys/devices/system/node/node0/vmstat:nr_iommu_pages 106025
/sys/devices/system/node/node1/vmstat:nr_iommu_pages 3464

The value is in page-count, therefore, in the above example
the iommu allocations amount to ~428M.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Acked-by: David Rientjes <rientjes@google.com>
Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/iommu/iommu-pages.h | 30 ++++++++++++++++++++++++++++++
 include/linux/mmzone.h      |  3 +++
 mm/vmstat.c                 |  3 +++
 3 files changed, 36 insertions(+)

diff --git a/drivers/iommu/iommu-pages.h b/drivers/iommu/iommu-pages.h
index 5a222d0ad25c..1264b0f6b6c3 100644
--- a/drivers/iommu/iommu-pages.h
+++ b/drivers/iommu/iommu-pages.h
@@ -20,6 +20,30 @@
  * large, i.e. multiple gigabytes in size.
  */
 
+/**
+ * __iommu_alloc_account - account for newly allocated page.
+ * @page: head struct page of the page.
+ * @order: order of the page
+ */
+static inline void __iommu_alloc_account(struct page *page, int order)
+{
+	const long pgcnt = 1l << order;
+
+	mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, pgcnt);
+}
+
+/**
+ * __iommu_free_account - account a page that is about to be freed.
+ * @page: head struct page of the page.
+ * @order: order of the page
+ */
+static inline void __iommu_free_account(struct page *page, int order)
+{
+	const long pgcnt = 1l << order;
+
+	mod_node_page_state(page_pgdat(page), NR_IOMMU_PAGES, -pgcnt);
+}
+
 /**
  * __iommu_alloc_pages - allocate a zeroed page of a given order.
  * @gfp: buddy allocator flags
@@ -35,6 +59,8 @@ static inline struct page *__iommu_alloc_pages(gfp_t gfp, int order)
 	if (unlikely(!page))
 		return NULL;
 
+	__iommu_alloc_account(page, order);
+
 	return page;
 }
 
@@ -48,6 +74,7 @@ static inline void __iommu_free_pages(struct page *page, int order)
 	if (!page)
 		return;
 
+	__iommu_free_account(page, order);
 	__free_pages(page, order);
 }
 
@@ -67,6 +94,8 @@ static inline void *iommu_alloc_pages_node(int nid, gfp_t gfp, int order)
 	if (unlikely(!page))
 		return NULL;
 
+	__iommu_alloc_account(page, order);
+
 	return page_address(page);
 }
 
@@ -147,6 +176,7 @@ static inline void iommu_put_pages_list(struct list_head *page)
 		struct page *p = list_entry(page->prev, struct page, lru);
 
 		list_del(&p->lru);
+		__iommu_free_account(p, 0);
 		put_page(p);
 	}
 }
diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index c11b7cde81ef..be17195f6f86 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -206,6 +206,9 @@ enum node_stat_item {
 #endif
 	NR_PAGETABLE,		/* used for pagetables */
 	NR_SECONDARY_PAGETABLE, /* secondary pagetables, e.g. KVM pagetables */
+#ifdef CONFIG_IOMMU_SUPPORT
+	NR_IOMMU_PAGES,		/* # of pages allocated by IOMMU */
+#endif
 #ifdef CONFIG_SWAP
 	NR_SWAPCACHE,
 #endif
diff --git a/mm/vmstat.c b/mm/vmstat.c
index db79935e4a54..8507c497218b 100644
--- a/mm/vmstat.c
+++ b/mm/vmstat.c
@@ -1242,6 +1242,9 @@ const char * const vmstat_text[] = {
 #endif
 	"nr_page_table_pages",
 	"nr_sec_page_table_pages",
+#ifdef CONFIG_IOMMU_SUPPORT
+	"nr_iommu_pages",
+#endif
 #ifdef CONFIG_SWAP
 	"nr_swapcached",
 #endif
-- 
2.44.0.683.g7961c838ac-goog


