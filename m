Return-Path: <linux-samsung-soc+bounces-2086-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4699185FF92
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 22 Feb 2024 18:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1C05B2181F
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 22 Feb 2024 17:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506C715696C;
	Thu, 22 Feb 2024 17:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="QIgIN8iF"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA42155A45
	for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Feb 2024 17:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708623589; cv=none; b=uf4kCn2II4ihqP/LOYvK9/aq8xsDk/1TSfvJV2dfh+zRrC1VvAnJLLNXk5UMSPO54grecSpVAqvmFlPhVFh1w64c38WN4tqb/yC9icctwriI/uRG6d2CBe8w04rgZItII6fP/FodBgNgT69UZdU+5a9M15oJOHSVoJNWPwgiUpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708623589; c=relaxed/simple;
	bh=nvxVBP9G8vyW1pjoAsXI7Druau5onIPvQrtVWXmTopM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZqaKFa+42ild7D5VvU8tpspkO8bFzylurBYD/oKPPK5eAe8VhAUorxQ2HBvYvfgOu4mqVN6FJFgQ9y2HQfNTAcRqPT4/AQSM0+DwF9MkkFxgn1SgmzsjiFYFxJQVOdAfmj8y0hzVsImrG1nai65uj1oWhpNfiSS4Nncr+p5DWCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=QIgIN8iF; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-42a029c8e62so14481071cf.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Feb 2024 09:39:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1708623586; x=1709228386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SmC4SQg9RJFTyxACzu+4WUHQYE29YjgzDeLpVcyOgV4=;
        b=QIgIN8iFVsoKNIk11BxiSlbCIhTr2skiL7I7NKoJ9jFAjBFkPaTwi8+UuiY7hrq0Fk
         uyP2kZBWprCtRNwUDna3KpHPbjq5frKQL7m2tycBN6VuYurjfUlw/p0S9tfBZOSQZ2zY
         l/SyqaLmWGAvoaqSEvvznLo8yph7eYwsR2l9VjDupZrWcC8vhM97nWWY76fNIEFZveka
         eK07Ye1o5UOw/JRSelT1Qb+wqbYCAylsfd+28XjYDi/+XWGwNS01h2aWJxGgyJb5R7pR
         Gw4lgrPXXleXP9FMhl6HkxbR7hYsw6H600VMFLXb7zvLI6bs1eDawH3KZ/43s3K51H71
         oR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708623586; x=1709228386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SmC4SQg9RJFTyxACzu+4WUHQYE29YjgzDeLpVcyOgV4=;
        b=ZfQyA1DLVzpuR2w6T+HzcO7RTNV7U05995Y3gIX48IumMqfEK7kr/steLf+o2pBBmh
         Q7W0ROpRTT1QLC7Na7fyf2gMyWmPSFSP3jzyHakZSfTtD8PBesjX7Nsv68nneERZXil3
         gLN28dYpnLiP/prGR7QBpYKFmlsAWNa5xCNQFNofSvsBf6HaOxu7YBLL16dh+SFkVP6/
         hQSORDoglVQXdMcQCcTycj1SYyx16uJeyJwe8hUdK8TUZFoRbFzT4prtRESLfzWweuvZ
         jk9rxUhZSddtqUQ/59cLy3mv/ZXaA6VZ2lntZO+TMqMkrnI4ZEw+G3gYYNwUa/g9GeCF
         7LVA==
X-Forwarded-Encrypted: i=1; AJvYcCXIY6OXw6MCAMEyOhn+bkulSME0+d4aL6Ul5DQwno40kOJv5DfvVzyfyPBA2TztdHzV8ieYwt1EaelyCtMYBrev0zB1+MNn1geiTcm87vvQwNc=
X-Gm-Message-State: AOJu0Yz0MyUZhlSZrLdU64mgjPHRqtLPcyGojRAGuiKKftrIdPhF8s3U
	UgJZhi343Ipl6MCdlP9LY8fHsoyZJbiuYoGr+n4U75M8N4AlA7MbayUE6W3mZuA=
X-Google-Smtp-Source: AGHT+IHQazQ2VKGKYiiCB/F+URR0eEgUMsL+eJQ7E97VwpEkplwTztlYNQqqnsB6QCcvUbBxCire4A==
X-Received: by 2002:a05:622a:3d0:b0:42c:71ea:9b28 with SMTP id k16-20020a05622a03d000b0042c71ea9b28mr28604094qtx.32.1708623585634;
        Thu, 22 Feb 2024 09:39:45 -0800 (PST)
Received: from soleen.c.googlers.com.com (249.240.85.34.bc.googleusercontent.com. [34.85.240.249])
        by smtp.gmail.com with ESMTPSA id f17-20020ac86ed1000000b0042e5ab6f24fsm259682qtv.7.2024.02.22.09.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 09:39:45 -0800 (PST)
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
Subject: [PATCH v5 00/11] IOMMU memory observability
Date: Thu, 22 Feb 2024 17:39:26 +0000
Message-ID: <20240222173942.1481394-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

----------------------------------------------------------------------
Changelog
----------------------------------------------------------------------
v5:
- Synced with v6.8-rc5
- Added: Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
- Added: Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
- Addressed review comments from Robin Murphy:
  Updated the header comment in iommu-pages.h
  Removed __iommu_alloc_pages_node(), invoke
  iommu_alloc_pages_node directly.
  Removed unused: __iommu_alloc_page_node()
  Removed __iommu_free_page()
  Renamed: iommu_free_pages_list() -> iommu_put_pages_list()
  Added missing iommu_put_pages_list() to dma-iommu.c in
  iommu/dma: use iommu_put_pages_list() to releae freelist

v4:
- Synced with v6.8-rc3
- Updated commit log for "iommu: account IOMMU allocated memory" as
  suggested by Michal Koutný
- Added more Acked-bys David Rientjes and Thierry Reding
- Added Tested-by Bagas Sanjaya.

v3:
- Sync with v6.7-rc7
- Addressed comments from David Rientjes: s/pages/page/, added
  unlikely() into the branches, expanded comment for
  iommu_free_pages_list().
- Added Acked-bys: David Rientjes

v2:
- Added Reviewed-by Janne Grunau
- Sync with 6.7.0-rc3
- Separated form the series patches:
vhost-vdpa: account iommu allocations
https://lore.kernel.org/all/20231130200447.2319543-1-pasha.tatashin@soleen.com
vfio: account iommu allocations
https://lore.kernel.org/all/20231130200900.2320829-1-pasha.tatashin@soleen.com
as suggested by Jason Gunthorpe
- Fixed SPARC build issue detected by kernel test robot
- Drop the following patches as they do account iommu page tables:
iommu/dma: use page allocation function provided by iommu-pages.h
iommu/fsl: use page allocation function provided by iommu-pages.h
iommu/iommufd: use page allocation function provided by iommu-pages.h
as suggested by Robin Murphy. These patches are not related to IOMMU
page tables. We might need to do a separate work to support DMA
observability.
- Remove support iommu/io-pgtable-arm-v7s as the 2nd level pages are
under a page size, thanks Robin Murphy for pointing this out.

----------------------------------------------------------------------
Description
----------------------------------------------------------------------
IOMMU subsystem may contain state that is in gigabytes. Majority of that
state is iommu page tables. Yet, there is currently, no way to observe
how much memory is actually used by the iommu subsystem.

This patch series solves this problem by adding both observability to
all pages that are allocated by IOMMU, and also accountability, so
admins can limit the amount if via cgroups.

The system-wide observability is using /proc/meminfo:
SecPageTables:    438176 kB

Contains IOMMU and KVM memory.

Per-node observability:
/sys/devices/system/node/nodeN/meminfo
Node N SecPageTables:    422204 kB

Contains IOMMU and KVM memory in the given NUMA node.

Per-node IOMMU only observability:
/sys/devices/system/node/nodeN/vmstat
nr_iommu_pages 105555

Contains number of pages IOMMU allocated in the given node.

Accountability: using sec_pagetables cgroup-v2 memory.stat entry.

With the change, iova_stress[1] stops as limit is reached:

$ ./iova_stress
iova space:     0T      free memory:   497G
iova space:     1T      free memory:   495G
iova space:     2T      free memory:   493G
iova space:     3T      free memory:   491G

stops as limit is reached.

This series encorporates suggestions that came from the discussion
at LPC [2].
----------------------------------------------------------------------
[1] https://github.com/soleen/iova_stress
[2] https://lpc.events/event/17/contributions/1466
----------------------------------------------------------------------
Previous versions
v1: https://lore.kernel.org/all/20231128204938.1453583-1-pasha.tatashin@soleen.com
v2: https://lore.kernel.org/linux-mm/20231130201504.2322355-1-pasha.tatashin@soleen.com
v3: https://lore.kernel.org/all/20231226200205.562565-1-pasha.tatashin@soleen.com
v4: https://lore.kernel.org/all/20240207174102.1486130-1-pasha.tatashin@soleen.com
----------------------------------------------------------------------

Pasha Tatashin (11):
  iommu/vt-d: add wrapper functions for page allocations
  iommu/dma: use iommu_put_pages_list() to releae freelist
  iommu/amd: use page allocation function provided by iommu-pages.h
  iommu/io-pgtable-arm: use page allocation function provided by
    iommu-pages.h
  iommu/io-pgtable-dart: use page allocation function provided by
    iommu-pages.h
  iommu/exynos: use page allocation function provided by iommu-pages.h
  iommu/rockchip: use page allocation function provided by iommu-pages.h
  iommu/sun50i: use page allocation function provided by iommu-pages.h
  iommu/tegra-smmu: use page allocation function provided by
    iommu-pages.h
  iommu: observability of the IOMMU allocations
  iommu: account IOMMU allocated memory

 Documentation/admin-guide/cgroup-v2.rst |   2 +-
 Documentation/filesystems/proc.rst      |   4 +-
 drivers/iommu/amd/amd_iommu.h           |   8 -
 drivers/iommu/amd/init.c                |  91 ++++++------
 drivers/iommu/amd/io_pgtable.c          |  13 +-
 drivers/iommu/amd/io_pgtable_v2.c       |  20 +--
 drivers/iommu/amd/iommu.c               |  13 +-
 drivers/iommu/dma-iommu.c               |   7 +-
 drivers/iommu/exynos-iommu.c            |  14 +-
 drivers/iommu/intel/dmar.c              |  16 +-
 drivers/iommu/intel/iommu.c             |  47 ++----
 drivers/iommu/intel/iommu.h             |   2 -
 drivers/iommu/intel/irq_remapping.c     |  16 +-
 drivers/iommu/intel/pasid.c             |  18 +--
 drivers/iommu/intel/svm.c               |  11 +-
 drivers/iommu/io-pgtable-arm.c          |  15 +-
 drivers/iommu/io-pgtable-dart.c         |  37 ++---
 drivers/iommu/iommu-pages.h             | 186 ++++++++++++++++++++++++
 drivers/iommu/rockchip-iommu.c          |  14 +-
 drivers/iommu/sun50i-iommu.c            |   7 +-
 drivers/iommu/tegra-smmu.c              |  18 ++-
 include/linux/mmzone.h                  |   5 +-
 mm/vmstat.c                             |   3 +
 23 files changed, 361 insertions(+), 206 deletions(-)
 create mode 100644 drivers/iommu/iommu-pages.h

-- 
2.44.0.rc0.258.g7320e95886-goog


