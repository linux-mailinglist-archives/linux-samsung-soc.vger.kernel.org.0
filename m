Return-Path: <linux-samsung-soc+bounces-2605-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E41898931
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  4 Apr 2024 15:51:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B259AB22EA1
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  4 Apr 2024 13:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C5B128830;
	Thu,  4 Apr 2024 13:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="IaK6ZFAS"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EFE12839F
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Apr 2024 13:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712238699; cv=none; b=sOEbmC5E/KmXY3OcQG0Fm+v2ClvA2AGVdYtO/dqx8B/sAmytEgOFCQIqTXQwduZYGXspX1RQIiZvKGmqjJ1k51PMQjHXNux/yiCO/igEhUdpVPgcVYV7qETGG6UA+G8/IFXyCJGoAi/47RQqd5s3Xvb86iE+pmb+NNoLhrzihmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712238699; c=relaxed/simple;
	bh=1F5VA5YE599dOlO3zQ9ZskLhNBoOk9J98W5SFXY1QOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OWsBDtY85Y7F0w7/Q3O9Xu5Vu+b4kh9460rTAZXvTfqN5wyUT0rMwj+Ib1LBXw/LytJnfUN0wuf//NjFREtliBtEpqQk/vti+FQN2TOWikWYgmq9LmoNi7ERHFAniOguiygCAvP9OiMWXN0+qgU4MBRghyh992S6AlOGF2XJn7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=IaK6ZFAS; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4317aff5cfdso5478261cf.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Apr 2024 06:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1712238697; x=1712843497; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GEhrf+Xnwdm4P0BoHyd6IIElLQSsz5Bym9Fr83GNG8o=;
        b=IaK6ZFASM9ZbNHLWy0px/hWReUW0WZm1twCBxdS176TODDQ1u5YzOsniRkQpFB+UZ+
         TnCeAtf2+LVOUUhCwRXPg/iTd97A33Ijpc3fyJq7ThoswZFV5bds7Gv6fA9glPgYkfL1
         PmH+jN3wPgQ2lnxXc7s5S1mf0WUiQmR5pPVEswt2ABYyEkIT8jIij5swa7pN9bWYpw6z
         j1miCYsbdThniJc9xstU796pwQlScPJ3w35xsHU+xT2i5D9umW+iSG0t/T+tsNnHKf3W
         34V4UaRO9ZbT9HrxPbNFhGNTxsZ7uMiTZyZbYPvvKdSoXRmCXEbPOHxo5cklub6HAIOZ
         nxCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712238697; x=1712843497;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GEhrf+Xnwdm4P0BoHyd6IIElLQSsz5Bym9Fr83GNG8o=;
        b=GW2+QnSh3GaUJUw9NJ6r2JZALy4/19JPTXWpglONdIU8acBBbgged4YKg/fAmGe0EH
         fhoahOAo42cGYnheb210cfDcl1do4kbc2HS7xvx+MNaRNadyou/3XNTn2xguTv6azED/
         3NhwIOHS1t6CWI/1zYUMOrEtNTpuySqkW22BLxUm51Rpe4I2wXPBi6+Su1Hmd+GPhIBa
         OdsKmf5uUNFIYLp6xPeutK0pWnrdDw03sy2ZbPOQqSzNkQhb5m6A58kTOvjyyUVCc8sk
         +yEzychgagGADrEgd6PaUOEMVywv3XFQ3tYjNCUqXR8LDMWyX1981Tj736XFJI6qMTou
         5W0w==
X-Forwarded-Encrypted: i=1; AJvYcCWtp8+bk7FjhSLk5s3UgfRJrKBc6y5n8fmysMNHoIsVhVTBi0FIFHqxhwkI08HAQHqp/1RDHtsRmh/NceHaEkq3N1g663jdHqqban1g86yyeFI=
X-Gm-Message-State: AOJu0YzzCnaxDvaEHyQicMU6VgHlMDs0C5o5+4JWN5qaE1Eu9MkPfSP4
	QfrISr6a+0BgIsPSSvd8OLrJs3ODQkkPfnMU4rF/xIwTDaMKvwmIbY9Up4PVX1Y9j0hcYirhsSH
	q17+TsmlVvRJfWBqORrU7SaGBErfTZoKvOUcUGQ==
X-Google-Smtp-Source: AGHT+IG34VfsrO/bFBQm1+tAdMAMjkEMbTIL7Igt83TuV9+7PUf7aasZynC6bg9Q2hezj4QPdzlhPGGLCOEcmSFudGM=
X-Received: by 2002:a05:622a:20d:b0:431:8135:6fa9 with SMTP id
 b13-20020a05622a020d00b0043181356fa9mr2490307qtx.61.1712238696692; Thu, 04
 Apr 2024 06:51:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240222173942.1481394-1-pasha.tatashin@soleen.com> <20240404005803.GA102637@hyd1403.caveonetworks.com>
In-Reply-To: <20240404005803.GA102637@hyd1403.caveonetworks.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 4 Apr 2024 09:50:59 -0400
Message-ID: <CA+CK2bAiM_eC6k2EVL93uuOwB+hhV1WkDDK0YROo9-wAh=ju-w@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] IOMMU memory observability
To: Linu Cherian <lcherian@marvell.com>
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
	rdunlap@infradead.org, robin.murphy@arm.com, samuel@sholland.org, 
	suravee.suthikulpanit@amd.com, sven@svenpeter.dev, thierry.reding@gmail.com, 
	tj@kernel.org, tomas.mudrunka@gmail.com, vdumpa@nvidia.com, wens@csie.org, 
	will@kernel.org, yu-cheng.yu@intel.com, rientjes@google.com, 
	bagasdotme@gmail.com, mkoutny@suse.com
Content-Type: text/plain; charset="UTF-8"

> > Description
> > ----------------------------------------------------------------------
> > IOMMU subsystem may contain state that is in gigabytes. Majority of that
> > state is iommu page tables. Yet, there is currently, no way to observe
> > how much memory is actually used by the iommu subsystem.
> >
> > This patch series solves this problem by adding both observability to
> > all pages that are allocated by IOMMU, and also accountability, so
> > admins can limit the amount if via cgroups.
> >
> > The system-wide observability is using /proc/meminfo:
> > SecPageTables:    438176 kB
> >
> > Contains IOMMU and KVM memory.
>
> Can you please clarify what does KVM memory refers to here ?
> Does it mean the VFIO map / virtio-iommu invoked ones for a guest VM?

This means that nested page tables that are managed by KVM, and device
page tables that are managed by IOMMU are all accounted in
SecPageTables (secondary page tables). The decision to account them
both in one field of meminfo was made at LPC'23.

Pasha

