Return-Path: <linux-samsung-soc+bounces-2745-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 881558A3920
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 13 Apr 2024 02:25:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15F271F22B48
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 13 Apr 2024 00:25:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71776A954;
	Sat, 13 Apr 2024 00:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="0ZfJwwxN"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8642A17FE
	for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Apr 2024 00:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712967930; cv=none; b=SLHbiD86mrNaFjaRG11Q+n0eeDRO6q4dcyb/HONrWGezy1eiun9QXWk+HHp1mNe8B0dOQJXcmDlRvUNcavG6PR/elqGZyWSVSv8gbuKo2cqkuYzfPCjsCON4YuD6U29QUjj73KDUNaxWjqWh8o3grPFtdDVeQQo5BMmTnrAT+cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712967930; c=relaxed/simple;
	bh=TehD/Ru/HAYMBDFGU99nYa4e2M5BvXq7XtR91Hn0y80=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UPyrBvJsXerbQvLj2vnjIlJZac9oasoFmkiA/J9F8gyK3Z8idl4QjeCvjzyeLT+ba0oAr+7CTuNrbzLKT0J/md4iR6fMsKC2mEmLQXkog5Bryo9qBwocv/wCarOLZ1+nMkK3nsSdikFBpS5nL7o+4wpOt8rfz/kQZexNNfcrMc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=0ZfJwwxN; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-78d57bd5781so91681485a.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 12 Apr 2024 17:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712967927; x=1713572727; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pZlpX3txUE4TJWo1dAHShmrFptGg2d9oY1hNAoNGiuE=;
        b=0ZfJwwxNFF3LiiKHadJ4plJ5X++virJULuzxb5X7c1idr41oND3tEUt2VCrNYhWYm7
         z7jjhz9fiTBIayLbjJwqZZ3Sz/uCxIH7ubsxuZTfLzTVN06KRErEgNEmMBYVBnB11rwg
         vwMClfNycwPzZ1si/NlGwoKwxNlBW3n5NOumfrcNdqIBuIclkiy02wuqEHEeDN9nYmUz
         wL3EpS8Fcp49IA+KTkV05zzkNMaf19e6MZg5k8zQH3WV6eUrfQdGgCGFTPhIN2H80W/s
         I8QbEb2JK+1KJio0zgITQEegOubRGyVDVHMFqlwrbnbWSdniEYOebgx5dDolJuNN8iNZ
         cnQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712967927; x=1713572727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZlpX3txUE4TJWo1dAHShmrFptGg2d9oY1hNAoNGiuE=;
        b=d1/5Igf1uZMd9+XIYQ3DLSAIT6P7uEXhauPiSbIKorssh5ClVLV5o6OEY4Al+Mut9z
         R1Zvj2LjjGj3SzZ16ssRBhEcxzqNisFmWWFGVnaxrPCvYhk1JlI8xs4tXR5TtnPUJRsC
         z32QokQB/tshTQgH39O21dq65bsik0nnwhPiDBbM1uTn3BZhoqurUPkLcYo40BkbVLE2
         pCv3QZjt+PfPVHVwq1eU6UBBdSh36nb5E7x8b7ZjrlZcSSYHh4MuA6Hq4Dx6FrK/86bA
         R6vZoo8x5U5wiZ+GffcEM42tSn27ZjrSWqb/xJCO8X+7Qm83Td33lMj5X0R95624Iu2z
         lwrw==
X-Forwarded-Encrypted: i=1; AJvYcCWNhrm0K+g7Z9hKi7j0sHGzrW2dgEqt4XAfyRrq3psfYWZKeHH6unhkYaCo9pRqFJRJ0D6dWEJxeGdNItkagmsfPsJQZEwPZaD8dXA4I6peuf8=
X-Gm-Message-State: AOJu0YyoNPL0CsbGES0864jC+kaT+2ES+VXIYJTGm9nJY50Ljec5Bx4B
	H761l+DtgQQ+eLwt74DFgnbCFaI3f79+SFenhwKr4EndXWbbNYcTmw+fzn8/fBU=
X-Google-Smtp-Source: AGHT+IHnFRJRktafMl8iFWoPD2wZry7L4eUZEKmr/HQPmjiBtsCGzy14Fj8Nir/jZCpUWrNk2ovbMw==
X-Received: by 2002:a05:620a:56a:b0:78a:f5b:ed05 with SMTP id p10-20020a05620a056a00b0078a0f5bed05mr3835236qkp.22.1712967927419;
        Fri, 12 Apr 2024 17:25:27 -0700 (PDT)
Received: from soleen.c.googlers.com.com (128.174.85.34.bc.googleusercontent.com. [34.85.174.128])
        by smtp.gmail.com with ESMTPSA id wl25-20020a05620a57d900b0078d5fece9a6sm3053490qkn.101.2024.04.12.17.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Apr 2024 17:25:26 -0700 (PDT)
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
Subject: [PATCH v6 02/11] iommu/dma: use iommu_put_pages_list() to releae freelist
Date: Sat, 13 Apr 2024 00:25:13 +0000
Message-ID: <20240413002522.1101315-3-pasha.tatashin@soleen.com>
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

Free the IOMMU page tables via iommu_put_pages_list(). The page tables
were allocated via iommu_alloc_* functions in architecture specific
places, but are released in dma-iommu if the freelist is gathered during
map/unmap operations into iommu_iotlb_gather data structure.

Currently, only iommu/intel that does that.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Acked-by: David Rientjes <rientjes@google.com>
---
 drivers/iommu/dma-iommu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index e4cb26f6a943..16a7c4a4f3db 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -32,6 +32,7 @@
 #include <trace/events/swiotlb.h>
 
 #include "dma-iommu.h"
+#include "iommu-pages.h"
 
 struct iommu_dma_msi_page {
 	struct list_head	list;
@@ -156,7 +157,7 @@ static void fq_ring_free_locked(struct iommu_dma_cookie *cookie, struct iova_fq
 		if (fq->entries[idx].counter >= counter)
 			break;
 
-		put_pages_list(&fq->entries[idx].freelist);
+		iommu_put_pages_list(&fq->entries[idx].freelist);
 		free_iova_fast(&cookie->iovad,
 			       fq->entries[idx].iova_pfn,
 			       fq->entries[idx].pages);
@@ -254,7 +255,7 @@ static void iommu_dma_free_fq_single(struct iova_fq *fq)
 	int idx;
 
 	fq_ring_for_each(idx, fq)
-		put_pages_list(&fq->entries[idx].freelist);
+		iommu_put_pages_list(&fq->entries[idx].freelist);
 	vfree(fq);
 }
 
@@ -267,7 +268,7 @@ static void iommu_dma_free_fq_percpu(struct iova_fq __percpu *percpu_fq)
 		struct iova_fq *fq = per_cpu_ptr(percpu_fq, cpu);
 
 		fq_ring_for_each(idx, fq)
-			put_pages_list(&fq->entries[idx].freelist);
+			iommu_put_pages_list(&fq->entries[idx].freelist);
 	}
 
 	free_percpu(percpu_fq);
-- 
2.44.0.683.g7961c838ac-goog


