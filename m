Return-Path: <linux-samsung-soc+bounces-205-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 51AB17FC9EB
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 28 Nov 2023 23:50:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 748CFB217C8
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 28 Nov 2023 22:50:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9784750274;
	Tue, 28 Nov 2023 22:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="SDn0Lz4Z"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C12E619B2
	for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Nov 2023 14:50:38 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4239f2c1209so24884051cf.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Nov 2023 14:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1701211838; x=1701816638; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dCerhjjG9KrYi0TXMgF4xJvZ7AQK4ONjRJhrC9AuZik=;
        b=SDn0Lz4Zx0o9l2XkQP0XKmwmFDlTmHaDCTD5x0qdN/sTaQ3Y/lJv8Ff7k9fi8b0cnV
         X2O65KSloS0sB9E4E7G95iSaoSwD+hD1v6iix54nGZlqoyijw8cdxzbAPU2Nk+OFVXl/
         8dHRFpOzdc9X0xbNry2XPYUDF/4Ec42YvcghfKK1mHTPGBwCX0cLjfRpuJspxTy+vd02
         PJzFKkf+d+4JbYq4yikWJneP+mNltRecirfSjOxS/jiZBYry3+90ylg0/HIPQ8h/cWii
         2rwARbyJKrA+9KV/lF6jK0mls5cSDaSAm7W8Nv+++5Gy475nlEr6RCJx5CJh1FMdLkte
         Vr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701211838; x=1701816638;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dCerhjjG9KrYi0TXMgF4xJvZ7AQK4ONjRJhrC9AuZik=;
        b=XcA2KlmbndfykLiH6b4LrtxpB0MbTOrgH9fRUjkDzbbEkknZCgjpPXK8Q6mtHldYFf
         w50ISJraM6o3l00WmkELkh6IinNGz2llQwIo4y61hG07egmEOxrW3YbWkmeevDDyyp5Y
         c0/FKYYVk/b+3sOFsvCddisnBhg3xlEpQ/w4tBK//hmtXCeUiIjc8XJMDHjT0YmIG39E
         1qNFaIFCux5DrEkpaK8L0DCFpZC6InZguUj97t+up6sdO3zS/wLBpLcj1oWWc5txMsgf
         r3mOj9Pm99wJOGfwZURD6biQZECfCeSAQLxgdWPpFuV8D1+o21Okm48yevW9+4IqkYNi
         XCKg==
X-Gm-Message-State: AOJu0YytU8OcvJnojsO5MCQCtXqK2jnkV5wMBKORN+jkpwjv7kFzlwkC
	C/mZ83Gm+vXxJNvF04euVXDnnVHNDAshAEx2jJAeuw==
X-Google-Smtp-Source: AGHT+IFxEAQBwk403dZeGueHLhec0OT/vzBcOBPxuj+Prssp33QGReImzhYCBhKzogO690G6BVR/8UVJbn/fn+bRF6c=
X-Received: by 2002:a05:622a:10f:b0:423:78b4:d136 with SMTP id
 u15-20020a05622a010f00b0042378b4d136mr24659151qtw.54.1701211837930; Tue, 28
 Nov 2023 14:50:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128204938.1453583-1-pasha.tatashin@soleen.com>
 <20231128204938.1453583-7-pasha.tatashin@soleen.com> <d99e0d4a-94a9-482b-b5b5-833cba518b86@arm.com>
In-Reply-To: <d99e0d4a-94a9-482b-b5b5-833cba518b86@arm.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 28 Nov 2023 17:50:01 -0500
Message-ID: <CA+CK2bDswtrqiOMt3+0LBb0+7nJY9aBpzZdsmrWRzy9WxBqKEg@mail.gmail.com>
Subject: Re: [PATCH 06/16] iommu/dma: use page allocation function provided by iommu-pages.h
To: Robin Murphy <robin.murphy@arm.com>
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
	samuel@sholland.org, suravee.suthikulpanit@amd.com, sven@svenpeter.dev, 
	thierry.reding@gmail.com, tj@kernel.org, tomas.mudrunka@gmail.com, 
	vdumpa@nvidia.com, virtualization@lists.linux.dev, wens@csie.org, 
	will@kernel.org, yu-cheng.yu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 28, 2023 at 5:34=E2=80=AFPM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 2023-11-28 8:49 pm, Pasha Tatashin wrote:
> > Convert iommu/dma-iommu.c to use the new page allocation functions
> > provided in iommu-pages.h.
>
> These have nothing to do with IOMMU pagetables, they are DMA buffers and
> they belong to whoever called the corresponding dma_alloc_* function.

Hi Robin,

This is true, however, we want to account and observe the pages
allocated by IOMMU subsystem for DMA buffers, as they are essentially
unmovable locked pages. Should we separate IOMMU memory from KVM
memory all together and add another field to /proc/meminfo, something
like "iommu -> iommu pagetable and dma memory", or do we want to
export DMA memory separately from IOMMU page tables?

Since, I included DMA memory, I specifically removed mentioning of
IOMMU page tables in the most of places, and only report it as IOMMU
memory. However, since it is still bundled together with SecPageTables
it can be confusing.

Pasha

