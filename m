Return-Path: <linux-samsung-soc+bounces-210-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3EC7FCA70
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 29 Nov 2023 00:04:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7B8482830DD
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 28 Nov 2023 23:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5AFF5733C;
	Tue, 28 Nov 2023 23:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T4+k+4UI"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com [IPv6:2607:f8b0:4864:20::c33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF97E19B6
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Nov 2023 15:04:12 -0800 (PST)
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-58cdc801f69so3624487eaf.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Nov 2023 15:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701212652; x=1701817452; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43/GorJHph6wZf7ST1s9EfwOKwV7OvTpzkca3ztNxsA=;
        b=T4+k+4UIC04cOOUR2nvsU3u7pNoVVtWCRDRoeU582COZQW2ayY+qUXL3KQdPvLCbza
         VH1pT9x4sKAeCs9phGD+jh2rDGTtT6lCf+JsqtWLxgBXOO+e3wYPxGpqAyC+JSNCFKmB
         vzrhJ+lQlSvRgweKlSV5qiYjs+/LqHfca1OuVtBAC5+4iZqhTpnCc4xuh/OHo+wXJOSx
         Funu3YeeGPrrwqfLv4VV9jiQ4dHL2GWOGeeeVX9R7QUh92Lp/tCRdnva8MZQOYk0m8Al
         juJzaiCk7kKVw5t4rSexsTnuQYEfcHxlV2jjujm7rkS1Zpa+hScOzyUMvxNGtC5DAWYl
         bPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701212652; x=1701817452;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43/GorJHph6wZf7ST1s9EfwOKwV7OvTpzkca3ztNxsA=;
        b=E+EkZLLTnboFty3R0rbJ1tBtTA7ILyYd4TcUua2Tk29VEXiNghogm55N2awNC33eO8
         PA/brJJGb2ZDLWt8pTUspX5dH4HHostdXvMMtF0SccdOQ9SvJCc4RprYgM3h8QecZRNJ
         w+j4bH3X8000S/+Q6YbCtRgRJ/8G5t5KOoMEBVZYCOfVpXA3ldpgO5tQTtnOtFQ8pXfi
         Wsd5TSBp3ZdmQq6WGNkyG7aPerCY5+i0oFdzfA1dMU8K3wJaY9kMHNlEj1dwg+UUYuJW
         QhUjvjoyRv/cl73tnqrcmccHCM3t4xDY9WsmBA53T0LcV32M3wJHQ8idI6GtCW7SYhmF
         yHmw==
X-Gm-Message-State: AOJu0YxnTQJu/JmUrukXOoMJxtXVT7VoB5NexopPE7Ib99tdoC/doM51
	gRjYGn4qlMTTfKyidBUK0nd/x9bH8WveH8PxMJkBcw==
X-Google-Smtp-Source: AGHT+IGHG/fZ39GpQH7XprtM75RYsFLPLsqrr/P3BS2SaFOkE/NfcmuncSRUnInNrgp9PW0qlhq9u6ZhURJEjUsg//c=
X-Received: by 2002:a05:6359:67a9:b0:16d:bd74:19c9 with SMTP id
 sq41-20020a05635967a900b0016dbd7419c9mr14576065rwb.16.1701212651861; Tue, 28
 Nov 2023 15:04:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128204938.1453583-1-pasha.tatashin@soleen.com>
 <CAJD7tkb1FqTqwONrp2nphBDkEamQtPCOFm0208H3tp0Gq2OLMQ@mail.gmail.com> <CA+CK2bB3nHfu1Z6_6fqN3YTAzKXMiJ12MOWpbs8JY7rQo4Fq0g@mail.gmail.com>
In-Reply-To: <CA+CK2bB3nHfu1Z6_6fqN3YTAzKXMiJ12MOWpbs8JY7rQo4Fq0g@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Tue, 28 Nov 2023 15:03:30 -0800
Message-ID: <CAJD7tkZZNhf4KGV+7N+z8NFpJrvyeNudXU-WdVeE8Rm9pobfgQ@mail.gmail.com>
Subject: Re: [PATCH 00/16] IOMMU memory observability
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: akpm@linux-foundation.org, alex.williamson@redhat.com, 
	alim.akhtar@samsung.com, alyssa@rosenzweig.io, asahi@lists.linux.dev, 
	baolu.lu@linux.intel.com, bhelgaas@google.com, cgroups@vger.kernel.org, 
	corbet@lwn.net, david@redhat.com, dwmw2@infradead.org, hannes@cmpxchg.org, 
	heiko@sntech.de, iommu@lists.linux.dev, jasowang@redhat.com, 
	jernej.skrabec@gmail.com, jgg@ziepe.ca, jonathanh@nvidia.com, joro@8bytes.org, 
	kevin.tian@intel.com, krzysztof.kozlowski@linaro.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, lizefan.x@bytedance.com, marcan@marcan.st, 
	mhiramat@kernel.org, mst@redhat.com, m.szyprowski@samsung.com, 
	netdev@vger.kernel.org, paulmck@kernel.org, rdunlap@infradead.org, 
	robin.murphy@arm.com, samuel@sholland.org, suravee.suthikulpanit@amd.com, 
	sven@svenpeter.dev, thierry.reding@gmail.com, tj@kernel.org, 
	tomas.mudrunka@gmail.com, vdumpa@nvidia.com, virtualization@lists.linux.dev, 
	wens@csie.org, will@kernel.org, yu-cheng.yu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 2:32=E2=80=AFPM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
>
> On Tue, Nov 28, 2023 at 4:34=E2=80=AFPM Yosry Ahmed <yosryahmed@google.co=
m> wrote:
> >
> > On Tue, Nov 28, 2023 at 12:49=E2=80=AFPM Pasha Tatashin
> > <pasha.tatashin@soleen.com> wrote:
> > >
> > > From: Pasha Tatashin <tatashin@google.com>
> > >
> > > IOMMU subsystem may contain state that is in gigabytes. Majority of t=
hat
> > > state is iommu page tables. Yet, there is currently, no way to observ=
e
> > > how much memory is actually used by the iommu subsystem.
> > >
> > > This patch series solves this problem by adding both observability to
> > > all pages that are allocated by IOMMU, and also accountability, so
> > > admins can limit the amount if via cgroups.
> > >
> > > The system-wide observability is using /proc/meminfo:
> > > SecPageTables:    438176 kB
> > >
> > > Contains IOMMU and KVM memory.
> > >
> > > Per-node observability:
> > > /sys/devices/system/node/nodeN/meminfo
> > > Node N SecPageTables:    422204 kB
> > >
> > > Contains IOMMU and KVM memory memory in the given NUMA node.
> > >
> > > Per-node IOMMU only observability:
> > > /sys/devices/system/node/nodeN/vmstat
> > > nr_iommu_pages 105555
> > >
> > > Contains number of pages IOMMU allocated in the given node.
> >
> > Does it make sense to have a KVM-only entry there as well?
> >
> > In that case, if SecPageTables in /proc/meminfo is found to be
> > suspiciously high, it should be easy to tell which component is
> > contributing most usage through vmstat. I understand that users can do
> > the subtraction, but we wouldn't want userspace depending on that, in
> > case a third class of "secondary" page tables emerges that we want to
> > add to SecPageTables. The in-kernel implementation can do the
> > subtraction for now if it makes sense though.
>
> Hi Yosry,
>
> Yes, another counter for KVM could be added. On the other hand KVM
> only can be computed by subtracting one from another as there are only
> two types of secondary page tables, KVM and IOMMU:
>
> /sys/devices/system/node/node0/meminfo
> Node 0 SecPageTables:    422204 kB
>
>  /sys/devices/system/node/nodeN/vmstat
> nr_iommu_pages 105555
>
> KVM only =3D SecPageTables - nr_iommu_pages * PAGE_SIZE / 1024
>

Right, but as I mention above, if userspace starts depending on this
equation, we won't be able to add any more classes of "secondary" page
tables to SecPageTables. I'd like to avoid that if possible. We can do
the subtraction in the kernel.

