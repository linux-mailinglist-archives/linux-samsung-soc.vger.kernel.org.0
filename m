Return-Path: <linux-samsung-soc+bounces-191-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3147FC643
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 28 Nov 2023 21:53:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 197631C22B7A
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 28 Nov 2023 20:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D5060EEC;
	Tue, 28 Nov 2023 20:50:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="SvWFKyrF"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E531FD6
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Nov 2023 12:49:52 -0800 (PST)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5d05ff42db0so27503567b3.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Nov 2023 12:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1701204591; x=1701809391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwZxW20NTsAI6OtU2mg3WBn7dc7VhXurLb9lJcGaB3s=;
        b=SvWFKyrF6VDMtt35mvvjqHaCQnIBwza4Mio9j2jVB6Rc7q2c317f52e286/e8iTyVN
         isdvbCxLGYRUNn5tyh3Vq6cxnZ067QRRTWs9fC3vSHpHsrNqLfcKeRZzaBdFNPkgHJPO
         wxhb/RG7HZ/7KfAfppZEDRLgnoo43V8s3yKtIDuAM/tYdEsaujThmKQRrHXUq74EAMEb
         fXc12W2Y0/yVOB0ChfGsPdNYI4bEnoE2pIu9gVTOtH/iAFAJPijqEeq3z/o20oYa/tYO
         ctUOr8Cua2gAjiwdwfzdBY5R7PayKOoszFEDpaXxbQDKwav56fJF+kREwA/aoZnc1xHz
         JL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701204591; x=1701809391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WwZxW20NTsAI6OtU2mg3WBn7dc7VhXurLb9lJcGaB3s=;
        b=vyPKWOVS7QsAqB1GLbc5sUWZc06Ea5KvShOVn/AX8hvHEzdDHiYD5iH67qgQ77LPri
         53OzIEhe+FmB0cu5Q+bPGxrL0EjPN3W/p3btsWWf3eNjvhpP80FQtPmT7CmyLKYTg8Yy
         q1aM86gk2hMWekEByvoCW/BDJj1X28j74l4UccnpBf0jJD8wMw6J0vS8FG9xkjWYYCqA
         ZCw+G57BxWR+wDEpxsU3zjTSBaz8l7hrDlP8lz9CSZcSnugBXnKQ61rwq0UH+l8sUzp0
         8vHvNB8sr4uMsTeDBFmyOrqGcqDKvAWszawo3eGHCUmgB0KsGzbFwpLWjARI+BJ//5NH
         eSUw==
X-Gm-Message-State: AOJu0Ywa4BgGSdZXusi/yPvI8vgHBfkHtd7ddQ/nMi1mjGIrv7QtYJ1/
	nKlmEGw5m33Hqxp4mIRC1a6tgA==
X-Google-Smtp-Source: AGHT+IHCcneC8xut0NvwO9Mjx/qxjTP4L7ixlY2hbUe9eNo80eBX8ekYQZcNVvvgdD6z0QrQuBV3MA==
X-Received: by 2002:a0d:d409:0:b0:5cb:5171:ab07 with SMTP id w9-20020a0dd409000000b005cb5171ab07mr16139567ywd.12.1701204591541;
        Tue, 28 Nov 2023 12:49:51 -0800 (PST)
Received: from soleen.c.googlers.com.com (55.87.194.35.bc.googleusercontent.com. [35.194.87.55])
        by smtp.gmail.com with ESMTPSA id d11-20020a0cfe8b000000b0067a56b6adfesm1056863qvs.71.2023.11.28.12.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 12:49:51 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: akpm@linux-foundation.org,
	alex.williamson@redhat.com,
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
	jasowang@redhat.com,
	jernej.skrabec@gmail.com,
	jgg@ziepe.ca,
	jonathanh@nvidia.com,
	joro@8bytes.org,
	kevin.tian@intel.com,
	krzysztof.kozlowski@linaro.org,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
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
	mst@redhat.com,
	m.szyprowski@samsung.com,
	netdev@vger.kernel.org,
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
	virtualization@lists.linux.dev,
	wens@csie.org,
	will@kernel.org,
	yu-cheng.yu@intel.com
Subject: [PATCH 11/16] iommu/sun50i: use page allocation function provided by iommu-pages.h
Date: Tue, 28 Nov 2023 20:49:33 +0000
Message-ID: <20231128204938.1453583-12-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231128204938.1453583-1-pasha.tatashin@soleen.com>
References: <20231128204938.1453583-1-pasha.tatashin@soleen.com>
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
2.43.0.rc2.451.g8631bc7472-goog


