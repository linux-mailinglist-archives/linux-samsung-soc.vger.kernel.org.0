Return-Path: <linux-samsung-soc+bounces-1834-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF5784D004
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Feb 2024 18:42:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF4721C24F13
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Feb 2024 17:42:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CA686ACD;
	Wed,  7 Feb 2024 17:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=soleen.com header.i=@soleen.com header.b="Y8txqXxl"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DA385924
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 17:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707327680; cv=none; b=gAGVARMSnYPc6GzDACsynGZIJVazlBdRUbyg1+9g5XytOB2U1wVFaTVkFRR1WhtrTPVLLg499s65MfUNy1q7kZLalACVqhiT8lVqwrUKBhWy4R8XFVZqaKMz6a1zkao7cELekav//YtV4Qk9UXuSeh5NyeDobk0YOH/vFhaQw6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707327680; c=relaxed/simple;
	bh=ZrKDwv7ntd6MUNEgXFkjIjsD/7n0h2NtbCDhpUVACm4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=THqOMp6U6gNF210HBH9ZlVWO94N6vYOWaPBcHabw3iuOhrRp2peR0HWfwQ8jj/02dbLPdobSMBzuuHmgTtF7m2kh+HKcvdyoWEfrMd2QA4V34RoaVzKRKpYr+a9vEMDirZAcV7Bmxvpva98KwGYrHUZuGiMqiKfqFS5pHfRV498=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soleen.com; spf=none smtp.mailfrom=soleen.com; dkim=fail (0-bit key) header.d=soleen.com header.i=@soleen.com header.b=Y8txqXxl reason="key not found in DNS"; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=soleen.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-783f553fdabso5939785a.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Feb 2024 09:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1707327676; x=1707932476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfVh0oPEahUZvzrBZ9xf+/i5rxN2+U5mi493evzNcuQ=;
        b=Y8txqXxlsAiG32BITA7s5gTFSRQrg5F2jwvTbfV0q6OrogUydiPgWmkySiZsAlB/G/
         f+52ElafAOQycTP6Tdu9jwmO3JJioR+yreBMf+CeOWFRk5NAAoiOg87V0GySrywaRthm
         IQmE1QA+l2UMfMEkY51V8nUVxN1VzN7va2rMQUOR5d/MZP5OhX5TtFbSmARMaRW0+vBv
         //3sXKx0abjTGSfy/j96EzAE6kUAuCFjuiJ+DEwQufVGJyWOQQvoTVOt8fDxoHeV5zXU
         FlVr9PxpqjvLyGHPOgHqBbWd0mXu6fx+M5E4Q0Ga4HAR+6iXY6/BLEeA8TYnt3a7fssB
         vdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707327676; x=1707932476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfVh0oPEahUZvzrBZ9xf+/i5rxN2+U5mi493evzNcuQ=;
        b=SgHVyOVlLHbYqZfNMIjD4jUjVc7/CVb0XpMBxpqfNxIzwDcPagImGZUQFcurFkvbDG
         ariIE7dnZ7mY5SanqSX0Sa4SF62pwiH/taPNnjd+p4PdlmUKLZcYYI53E9AbGDU4T1lt
         CWZWPabt5dEIDlmF40istI/DrmsgaSZ3noTREIyOaVI0SBlgucyZHHsph4ouxHCOB3Pd
         y2UwJgaZr/HS1p+96MVrEDtBoBuE7zm3Y3SbzYqViXrouyAJivynGm2ogrw32p9S65na
         G2M6UILLp25a6TFoV4Mau7TOZXkQV8VLosUjsDjgS5z1LfYG9yVv4i0ZDTYlT0lZpk2n
         dyvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQhpoEnUk0res8yWy2yT7Q1Y5GhmRc4CjX93LyFDHp7tYXQ8YnMwW+Yld7QZ+ZmyEcGUS3Drw3QOuEZH/IWBpcx2fCIM4yAN0VzH3mth7nUps=
X-Gm-Message-State: AOJu0Yynw3zaBd0KFzEcP9oQ/DHQoQvp9qFH8vlD85S1zhZX82Jbnvz7
	E0qezlLcrfwccta22KFnPJdxpSRDq8m1cRkMPgxQ6AY3581px0F0l76XfIMCT3c=
X-Google-Smtp-Source: AGHT+IEYw/oN3ccwsdwQFv2jRl2FvfT6B6nkPyMXJGG4ZBtYYD02TxlhcFEf6LXGuUiTE1mdL7ys/w==
X-Received: by 2002:a05:620a:2191:b0:785:a0fd:26c with SMTP id g17-20020a05620a219100b00785a0fd026cmr230165qka.36.1707327676289;
        Wed, 07 Feb 2024 09:41:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVXXSvczqKSyNm43JX5/tzjrxJXXar4QNtSDMhqU2+N72ON7heLA3zeXwN1sPD8iNP1Ua3viph4VSvSaigEeBs+4AB16FSQoHG3nR2ARKpJ6Z6eqdW6RZ/Dx5gVULGUeNiZJs2bmFqEcerVJIR/k77MlP0P0vb2m946zLj3/Q+KKlAaf+S7e+fUwZ84VZBAoIKR3CAFqaEvfgSVeHvJDNlreq4nUF0bRbOmv+CTFkg6/34uIuhSrA1PfBuZS9NDpUrr7qD3iWEui7dadf1quYchsrHJm7Et0JCMwNo5G7j88fU0jnlH2f3xq6IprlzgVbwgVawD+F0w5yMxaKe31AMQCKLJDPkDnYGtso1cb3VcL9cwUUlE8zHdYGqDtmL4A3bNsEc+cHEYWlAikX+B5mca++p25pQQybiJgq5+xuv6MXn3SJAmkIrOedVuJQIGWWxUXhVKrHyW1vTefklNntllKnJ8kE94Q2QK6FQ7R5hbS7ZM+HnDQX4b8eU46NlXSODa0H04teVLWvmP9gtCad8fAMZqMrrR3WQ/TUTBO30OMZ3zF+k4DWHX9SXVVrt9nrRNprKLO9Z7u8dKJ7+GXLD3DWJoiQaPYhHwdfNS0J/6cWv0Cmhs4GVlXWvAwjKLkG6R+bd+Ys0jdTkMgWDuLUuIUZJXKs8G2j8ytxUN9ONqBDbvEtiqVgUbhqFtknANpqKIjtrOa5afMZB6vaVlSXSz7JIia1p4WLqYg76UjL26wPfE+YNYaoqoyla+/NM5tlqcG+Qv9qaBsUT0PrZlag/9hIB7OlkLkbIDeffOo1piVsMnuWQ2Fb0sIE5M3tMlSV4LOUvlm6MMoqTigjLdoiMPCpo3eSydh5ThPXQcdvauDs1iooRO19ROz7wfGQiGkN433FzI8pQIGwB/Y28HAGJ2Z/e4dzgMME9mxSg6/v6VWpPcpYfrpADNnE1HG5m17F3Z9/
 UwJNwsxkn3pX7eMFA/DZyCzVr6lCgR+6OWns+GLU2SxZUdU0xVvSfjQhkSCVyzsqGTBKOAl46Qb5IR6uUP95vhYRyZh/sazLK1hp6TuSuGwGRiqCEq3kw5QrDYNAeSeryfxDajztI6S9jiXf9iOAeZ2u7rYaFZy50vg9l9iMXxf9hkJco867096dyje+DKkhn4WuJV5pUKUPg0jyDyOEh9YkiepVTHVZe+2/e6eXAACmAIqtLN291FEcNxHSFVc9VoRJotuYKq+P9z10tdNS+gaUUxRVwOH60jk5JdNq6iqwWPhfb90cWSdU5X/SASbKNAWT2TUn7fb+cqTPdJqZU5F61vo4y6m5LgEiIZFuY8ciAZqGeXCJ4KoNYNcloHQYen9MDAb9yvPdMPytSIThAuivd6JL/t1mQ68T7pjNDeJUQ62Bl8xjmJOCkONVL1QfNYzX6G15djtpimeWhgGmyglvGJqsqIKWUnJObt/eRFoB8y
Received: from soleen.c.googlers.com.com (249.240.85.34.bc.googleusercontent.com. [34.85.240.249])
        by smtp.gmail.com with ESMTPSA id e10-20020a37db0a000000b007854018044bsm696310qki.134.2024.02.07.09.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Feb 2024 09:41:15 -0800 (PST)
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
Subject: [PATCH v4 07/10] iommu/sun50i: use page allocation function provided by iommu-pages.h
Date: Wed,  7 Feb 2024 17:40:59 +0000
Message-ID: <20240207174102.1486130-8-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
In-Reply-To: <20240207174102.1486130-1-pasha.tatashin@soleen.com>
References: <20240207174102.1486130-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert iommu/sun50i-iommu.c to use the new page allocation functions
provided in iommu-pages.h.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Acked-by: David Rientjes <rientjes@google.com>
Tested-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 drivers/iommu/sun50i-iommu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/sun50i-iommu.c b/drivers/iommu/sun50i-iommu.c
index 41484a5a399b..172ddb717eb5 100644
--- a/drivers/iommu/sun50i-iommu.c
+++ b/drivers/iommu/sun50i-iommu.c
@@ -26,6 +26,8 @@
 #include <linux/spinlock.h>
 #include <linux/types.h>
 
+#include "iommu-pages.h"
+
 #define IOMMU_RESET_REG			0x010
 #define IOMMU_RESET_RELEASE_ALL			0xffffffff
 #define IOMMU_ENABLE_REG		0x020
@@ -679,8 +681,7 @@ sun50i_iommu_domain_alloc_paging(struct device *dev)
 	if (!sun50i_domain)
 		return NULL;
 
-	sun50i_domain->dt = (u32 *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
-						    get_order(DT_SIZE));
+	sun50i_domain->dt = iommu_alloc_pages(GFP_KERNEL, get_order(DT_SIZE));
 	if (!sun50i_domain->dt)
 		goto err_free_domain;
 
@@ -702,7 +703,7 @@ static void sun50i_iommu_domain_free(struct iommu_domain *domain)
 {
 	struct sun50i_iommu_domain *sun50i_domain = to_sun50i_domain(domain);
 
-	free_pages((unsigned long)sun50i_domain->dt, get_order(DT_SIZE));
+	iommu_free_pages(sun50i_domain->dt, get_order(DT_SIZE));
 	sun50i_domain->dt = NULL;
 
 	kfree(sun50i_domain);
-- 
2.43.0.594.gd9cf4e227d-goog


