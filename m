Return-Path: <linux-samsung-soc+bounces-856-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 194D981E8FF
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 26 Dec 2023 19:24:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C22CF1F22BEB
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 26 Dec 2023 18:24:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4225380E;
	Tue, 26 Dec 2023 18:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="c1r+qaqy"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1469524CA
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Dec 2023 18:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-42786514fe6so43031781cf.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Dec 2023 10:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1703615053; x=1704219853; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbpck61YwtlHFMw5U/Lo3wdHWoHYEKh8KkvQ9gudgQY=;
        b=c1r+qaqyurG/qhmvIiqVHdz1oSnR58y8/ep/p9Whu9jRw5+k3eJhNB22Xs/8oj4pG/
         2OBDehnEbI10I8U2bEqaL7JnryezxoBHQ00DcmtN1tv37Pg+ISiq87adHFdQMGsExiHj
         ll8zFQduifkGaucAKFnhTUm7sWcNwVoAQmc3Ro0Av7Thc1RvbicelFo9odVvzwK+ZNnh
         OPtsqe+hervrLOpVdfQM3I6EqtLpJchFDggTMQPxbdaBhtpWUsowxbx7T2kq1vCLuMIV
         bIdidLSjvvq4TNof5HF/rT7tg8Sb3VfvQsvsMixLYLjRs3ubPqfaG38T6MP7R/RkjEmb
         jftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703615053; x=1704219853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nbpck61YwtlHFMw5U/Lo3wdHWoHYEKh8KkvQ9gudgQY=;
        b=j3t6d6SHMZt1dpOnEhmyiMMZd+JGeZ2YmcxOd7LzV1JlP5rrB6NIaFCyYTy+PHyyil
         gPdLe9Dx/ggwbPnGRTLP5NSE3veV0kMJRozWf99CdfDysaIhnMUsm4yIM9Fqnio2A/d0
         0fqo1eLzEO8DwqwnSkARQY4vHBm3ibrpRMhq3f1EIDoOGqvs6AE7MvtZwMnV9ynf8k8w
         5Agwu4Zgu90mil8ASfsdIJF55rFgq248/Ws8HuQAAF9x5ei4l1zPBx+RRGRGRtodx2uE
         ZChFZClcin6W1aquR9q+Jh7gywpJ6Khebktgi/8htYgXenxZ+R3nhhF5poK2uU04pv+x
         zdGw==
X-Gm-Message-State: AOJu0YxX9YuGSZLVvAWKZZW9r3J1/VQzlsMRtnasnljjp5z8CmR5LdrY
	Wsm0TaXfZTdZhwnQUnZNP8Ev7EburgSLwgNooMKoDr2GBD4tWQ==
X-Google-Smtp-Source: AGHT+IFWmjNlQw3TJVBvqU22wp4AVqBkS4XAMC4VqHZ635t1MVhw4Y6RPWn1r1oeRtxRwF8xQLfAKRRH1Aun3pHsf+k=
X-Received: by 2002:a05:622a:307:b0:427:7c4f:9d1a with SMTP id
 q7-20020a05622a030700b004277c4f9d1amr12102912qtw.31.1703615053674; Tue, 26
 Dec 2023 10:24:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231128204938.1453583-1-pasha.tatashin@soleen.com>
 <20231128204938.1453583-16-pasha.tatashin@soleen.com> <20231225110930-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231225110930-mutt-send-email-mst@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 26 Dec 2023 13:23:37 -0500
Message-ID: <CA+CK2bCTVqgW2uuSi7WqwGKkd7GT+QoSad2zkNun74wVV_J0Yw@mail.gmail.com>
Subject: Re: [PATCH 15/16] vhost-vdpa: account iommu allocations
To: "Michael S. Tsirkin" <mst@redhat.com>
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
	mhiramat@kernel.org, m.szyprowski@samsung.com, netdev@vger.kernel.org, 
	paulmck@kernel.org, rdunlap@infradead.org, robin.murphy@arm.com, 
	samuel@sholland.org, suravee.suthikulpanit@amd.com, sven@svenpeter.dev, 
	thierry.reding@gmail.com, tj@kernel.org, tomas.mudrunka@gmail.com, 
	vdumpa@nvidia.com, virtualization@lists.linux.dev, wens@csie.org, 
	will@kernel.org, yu-cheng.yu@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 25, 2023 at 11:09=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com=
> wrote:
>
> On Tue, Nov 28, 2023 at 08:49:37PM +0000, Pasha Tatashin wrote:
> > iommu allocations should be accounted in order to allow admins to
> > monitor and limit the amount of iommu memory.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>
>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>

Thank you,
Pasha

