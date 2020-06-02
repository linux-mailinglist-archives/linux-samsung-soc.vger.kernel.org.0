Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5CB11EC033
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  2 Jun 2020 18:38:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbgFBQiW (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 2 Jun 2020 12:38:22 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:23309 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726140AbgFBQiS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 2 Jun 2020 12:38:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591115896;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:in-reply-to:in-reply-to:  references:references;
        bh=hHqD35umcQO2huEjb9WL/Ckh3jB+GYgIq0lk1r/iSMI=;
        b=ReaM5w19lpFOo9+RfsXq7dFeZ9bWvhu14kG2nAWplJp0ePFumtaL4uls9p1uPD6u/j3VBa
        vh6+j4NPJujFXrqqkiiaCLBFCnCcGmZ5Ltgprb00h8L31BJ8WLg15qHR8OU5zwECz5WUm9
        /pLgzynC4eaUES6YKgX5jfe3cMBhDYg=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-43-W0J6LW0YPQSf0QqpPFv0gQ-1; Tue, 02 Jun 2020 12:38:10 -0400
X-MC-Unique: W0J6LW0YPQSf0QqpPFv0gQ-1
Received: by mail-qt1-f200.google.com with SMTP id u26so14518170qtj.21
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Jun 2020 09:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=hHqD35umcQO2huEjb9WL/Ckh3jB+GYgIq0lk1r/iSMI=;
        b=aOrqkyTGXoLONqdpRL4u85XgVVaBHVv1tqX/oPwSMOCAN+Z2ypDzN1/r8UQ+z9yRgB
         JpJGWyO1gEspkZcFQH4XZnmpURtiEJLijzvFQJc3D1BTPZciOarmQbbd/MDxB6OoE1p0
         puZcGQgyNLhPRFCAouzuP0GWv4t/jbfKyetsdDk2COeRlMZLgGNTMpOET/XBaybEv/eI
         QkHbyyxERIcRY7yWZQ0YGK4KkO9mvt7aUw+uT3BurUrhxrq7fe4skL8+CTdCl8LYG0oM
         AuBIc9lssMpmgnEkTlxDP6sYXU5BZKzyeeeql7cazjEMC4qc1RGgX4qAfrrWL+CFFuVm
         enwg==
X-Gm-Message-State: AOAM532fVlLbwXCsq+4hiblZ3LpfS9pECzR28TRNPBOsc1V7ZK4jlktL
        YDTSiJCeD+tldn+FuGf0bUdHVw+/NjHmuLCA7JELdk3zgXnxk8hx0VhCXacdwqIYzI6bdHHSwOj
        3JaLpIyEJa4gt5ZDFliPZzujZOCUrMlA=
X-Received: by 2002:a37:e205:: with SMTP id g5mr26245752qki.451.1591115889884;
        Tue, 02 Jun 2020 09:38:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxEHwB8sZ6GJqYFOX4Dc4L1exr5Cive5nf+jzBOew3IuxjQdOjd9lAvq/gnZam2w9pqVYc4MQ==
X-Received: by 2002:a37:e205:: with SMTP id g5mr26245713qki.451.1591115889616;
        Tue, 02 Jun 2020 09:38:09 -0700 (PDT)
Received: from localhost (ip70-163-223-149.ph.ph.cox.net. [70.163.223.149])
        by smtp.gmail.com with ESMTPSA id 70sm2863201qkk.10.2020.06.02.09.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 09:38:08 -0700 (PDT)
Date:   Tue, 2 Jun 2020 09:38:06 -0700
From:   Jerry Snitselaar <jsnitsel@redhat.com>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Lu Baolu <baolu.lu@linux.intel.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-rockchip@lists.infradead.org,
        iommu@lists.linux-foundation.org,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 00/33] iommu: Move iommu_group setup to IOMMU core code
Message-ID: <20200602163806.o5dpj2tpemwdzyiw@cantor>
Reply-To: Jerry Snitselaar <jsnitsel@redhat.com>
Mail-Followup-To: Joerg Roedel <joro@8bytes.org>,
        Lu Baolu <baolu.lu@linux.intel.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-rockchip@lists.infradead.org,
        iommu@lists.linux-foundation.org,
        linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org
References: <20200414131542.25608-1-joro@8bytes.org>
 <20200529221623.qc6twmpzryh7nkvb@cantor>
 <20200601104240.7f5xhz7gooqhaq4n@cantor>
 <47711845-98ee-95b8-aa95-423a36ed9741@linux.intel.com>
 <20200602000236.j4m3jvluzdhjngdc@cantor>
 <20200602142312.GJ14598@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20200602142312.GJ14598@8bytes.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue Jun 02 20, Joerg Roedel wrote:
>Hi Jerry,
>
>On Mon, Jun 01, 2020 at 05:02:36PM -0700, Jerry Snitselaar wrote:
>>
>> Yeah, that will solve the panic.
>>
>
>If you still see the kdump faults, can you please try with the attached
>diff? I was not able to reproduce them in my setup.
>
>Regards,
>
>	Joerg
>

I have another hp proliant server now, and reproduced. I will have the
patch below tested shortly. Minor change, I switched group->domain to
domain since group isn't an argument, and *data being passed in comes
from group->domain anyways.

>diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
>index b5ea203f6c68..5a6d509f72b6 100644
>--- a/drivers/iommu/iommu.c
>+++ b/drivers/iommu/iommu.c
>@@ -1680,8 +1680,12 @@ static void probe_alloc_default_domain(struct bus_type *bus,
> static int iommu_group_do_dma_attach(struct device *dev, void *data)
> {
> 	struct iommu_domain *domain = data;
>+	int ret = 0;
>
>-	return __iommu_attach_device(domain, dev);
>+	if (!iommu_is_attach_deferred(group->domain, dev))
>+		ret = __iommu_attach_device(group->domain, dev);
>+
>+	return ret;
> }
>
> static int __iommu_group_dma_attach(struct iommu_group *group)
>_______________________________________________
>iommu mailing list
>iommu@lists.linux-foundation.org
>https://lists.linuxfoundation.org/mailman/listinfo/iommu
>

