Return-Path: <linux-samsung-soc+bounces-852-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2344A81E8AA
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 26 Dec 2023 18:15:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF1802811BE
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 26 Dec 2023 17:15:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CAC74F8AA;
	Tue, 26 Dec 2023 17:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="XG8NXn4F"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80EB4F895
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Dec 2023 17:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-427e8bb6778so872241cf.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Dec 2023 09:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1703610912; x=1704215712; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=znBescOeGDyEd/eBwZlWM7zCSH3WtYT9hTuxQY/0ciQ=;
        b=XG8NXn4Fr+o6AFgkb7X5OPcfBqq+fpn7iaghciF2mBPh/76Z2Gl1GjtDqFoZCjWXCq
         25dZxF+i90zFauBaUQNVn/qUPfAvXqJCdbrGfCheQf51Je/x8+jLj6NnWT8TPEV3dVSZ
         u5LjEdKRw1h9nyn8cTp+m6kJOPOpbX3qqRN4NMpixyXeXeHoOfa/SrvpalKAo97CSmqt
         H9HhBbupSM09x9RC8oDJEl0tkapBhgK4he/2p4f67NS3gUCmLiLqKkIlMDdtydWoaPAy
         Qj6N0Mfr5QSSwMaMkZ9oUzjT6UXbGvupaByjQMg5+QHcGFUUXGRHUXX1MnPXAX/J3elA
         fADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703610912; x=1704215712;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=znBescOeGDyEd/eBwZlWM7zCSH3WtYT9hTuxQY/0ciQ=;
        b=EFAeAoEvTWDf5v7TbNdU9FuQs0ZKxGi37ByB7HdI0ZaDwAFWNDsO3611KMTrYSha8K
         cuig5GAAwtbIpew96tsUdLEHAtAD2a1v2OINeDd/VoDr+di0iZ3dcQT8v74vN/Oz+sLD
         DiyFAbXGHeka5HU5I1PaiAFgikipEi9zkFxKiPpYOS9beWBSXB+xoWchzi0mfMLGQiaw
         BzBDIZ3S0030CWoIUpkq19Jb7Z5YoIhNR5gW2t6RuLHtQMwvbEKVrxE7WShZrVO0TdLb
         8swQaCyKPb2CW5Ymb+0+PFp4vPo/gm9xuyMdGAanVetC6a2Sj3o20TvdATZ0X7pIDKja
         xB+Q==
X-Gm-Message-State: AOJu0Yz7r5xgfK9gGwPdNxb9SoHb+AgCUmi8Y1bBfd4vGP0MOzkhw51m
	Qb1hP8w4NrhGvxCE+ZiLgkOhOj7HlveCZ8Ne37x5qiCV6KOMDQ==
X-Google-Smtp-Source: AGHT+IHyQ5pm+vKsp8dlt+xdHnTW6C3uPhOZpDSwoY++VClJ/nDwEbMxRN02tbeUhgBwD4pSJVi4TOSqszJhqwYmmj4=
X-Received: by 2002:ac8:5bc2:0:b0:425:a28f:ddd8 with SMTP id
 b2-20020ac85bc2000000b00425a28fddd8mr8563250qtb.137.1703610912560; Tue, 26
 Dec 2023 09:15:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231130201504.2322355-1-pasha.tatashin@soleen.com>
 <20231130201504.2322355-2-pasha.tatashin@soleen.com> <776e17af-ae25-16a0-f443-66f3972b00c0@google.com>
 <CA+CK2bA8iJ_w8CSx2Ed=d2cVSujrC0-TpO7U9j+Ow-gfk1nyfQ@mail.gmail.com> <0ba8e579-2b6f-4e9f-a38c-097694f14d3c@intel.com>
In-Reply-To: <0ba8e579-2b6f-4e9f-a38c-097694f14d3c@intel.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 26 Dec 2023 12:14:35 -0500
Message-ID: <CA+CK2bBGHv3f2AM999C5zoo018yzFdQpygUaPn0AVoJ7cX+Sbg@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] iommu/vt-d: add wrapper functions for page allocations
To: "Liu, Jingqi" <jingqi.liu@intel.com>
Cc: David Rientjes <rientjes@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	alim.akhtar@samsung.com, alyssa@rosenzweig.io, asahi@lists.linux.dev, 
	baolu.lu@linux.intel.com, bhelgaas@google.com, cgroups@vger.kernel.org, 
	corbet@lwn.net, david@redhat.com, dwmw2@infradead.org, hannes@cmpxchg.org, 
	heiko@sntech.de, iommu@lists.linux.dev, jernej.skrabec@gmail.com, 
	jonathanh@nvidia.com, joro@8bytes.org, krzysztof.kozlowski@linaro.org, 
	linux-doc@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	lizefan.x@bytedance.com, marcan@marcan.st, mhiramat@kernel.org, 
	m.szyprowski@samsung.com, paulmck@kernel.org, rdunlap@infradead.org, 
	robin.murphy@arm.com, samuel@sholland.org, suravee.suthikulpanit@amd.com, 
	sven@svenpeter.dev, thierry.reding@gmail.com, tj@kernel.org, 
	tomas.mudrunka@gmail.com, vdumpa@nvidia.com, wens@csie.org, will@kernel.org, 
	yu-cheng.yu@intel.com
Content-Type: text/plain; charset="UTF-8"

> >> Document the locking requirements for this?
> >
> > Thank you for the review. I will add info about locking requirements,
> > in fact they are very relaxed.
> >
> > These pages are added to the list by unmaps or remaps operation in
> > Intel IOMMU implementation. These calls assume that whoever is doing
> > those operations has exclusive access to the VA range in the page
> > table of that operation. The pages in this freelist only belong to the
> > former page-tables from the IOVA range for those operations.
>
> These pages maybe be accessed concurrently by thread contexts other than
> the IOMMU driver (such as debugfs).

Good point regarding debugfs. While, it does not change any locking
assumptions, for this series. It might change some design decisions
that we need to make when freeing pages on unmaps (a separate RFC
series that I sent). I will have to study how debugfs affect refcnt
and mapcount, and whether we could use per-page page table locking if
needed.

Thanks,
Pasha

