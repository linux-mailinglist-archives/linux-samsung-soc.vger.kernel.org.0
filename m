Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0247678B8CC
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 28 Aug 2023 21:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233509AbjH1T5i (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 28 Aug 2023 15:57:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233517AbjH1T5V (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 15:57:21 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B12A9185
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Aug 2023 12:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693252591;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=+aPLP5Dvqf88CiJMFQl9Auucq47ZaEdR+LnhUOVMwHI=;
        b=Np5RMnIsQGGjcERpD2dKd+RMORGJmVEUZPQ/yFj+tX4L1liEak6afLU1JoZeU2SBpBULwo
        JWU9ZzzH9LR/275HFWl6FX0v+xKgeZE1Yeq53t2AwSrxGWFeUXu2hdgC/rnAz5Q2wNnoWc
        CLcpIv1Anlx1xHp0KjNECiFOyR1tqik=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-AlVa4DmbM9CDCJ1irM2R6g-1; Mon, 28 Aug 2023 15:56:30 -0400
X-MC-Unique: AlVa4DmbM9CDCJ1irM2R6g-1
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-41213943314so29079511cf.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Aug 2023 12:56:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693252590; x=1693857390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+aPLP5Dvqf88CiJMFQl9Auucq47ZaEdR+LnhUOVMwHI=;
        b=bVLbO3XhQ8Spol+L6JBAVKWigUJ0S4VGA72C9pCkqApLJtnqQsy60wSvx4CYR3Ok48
         m4vKcMPnw5JcQw35JT66vmgLHcHEvZNsK8gdxwPldKr9BnDdnhgzh2LXpzFXapnfPrbR
         SdgQuwmANG6KjuPY18Eooxfqc3gS/4rEwrN92KZlciQQRSCgObU6Kz6bK23yxZ/wca3P
         Ztj506+V70lIYrI5fBEqnTsOj8khpkqF2PpqCFp9hLCvkURYRh4OyNTTS86/OMWK7+f5
         /HBgpIjXKgUOP0V6FMm9L6PuD8Pdoc1qAtna2q5n3PYCXxtJgTqz8J1gxlLKNJcywKzw
         DLkQ==
X-Gm-Message-State: AOJu0YyAWygEce7RyQ5lwNPn9kv7bxiK6tpUf81jVtCwtf9lOCJ6Q3y0
        PNzT8zrPZnzZW+8NqFvulMHFXsXQ396DqNFJpYXFaWri2JqolJr1dl3E7Vv9lL0lOTYdTzlz74v
        8MvKMCxYr52G+KR47NmolHIiWcgetxps=
X-Received: by 2002:a05:622a:1b92:b0:403:fd62:ce75 with SMTP id bp18-20020a05622a1b9200b00403fd62ce75mr28215986qtb.5.1693252590248;
        Mon, 28 Aug 2023 12:56:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsYP9ZZ2CsJhUv0f/7ePOTXR8lCjq1Is30niybYFTHi0Enn8YltRs8yVE4tVH5Ow+UhbE98A==
X-Received: by 2002:a05:622a:1b92:b0:403:fd62:ce75 with SMTP id bp18-20020a05622a1b9200b00403fd62ce75mr28215977qtb.5.1693252589954;
        Mon, 28 Aug 2023 12:56:29 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id d4-20020ac86144000000b0040ff25d8712sm2559692qtm.18.2023.08.28.12.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 12:56:29 -0700 (PDT)
Date:   Mon, 28 Aug 2023 12:56:28 -0700
From:   Jerry Snitselaar <jsnitsel@redhat.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Andy Gross <agross@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bjorn Andersson <andersson@kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
        Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joerg Roedel <joro@8bytes.org>,
        Kevin Tian <kevin.tian@intel.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        linuxppc-dev@lists.ozlabs.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Matthew Rosato <mjrosato@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Samuel Holland <samuel@sholland.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
        Yong Wu <yong.wu@mediatek.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Steven Price <steven.price@arm.com>,
        Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v7 08/24] iommu: Reorganize
 iommu_get_default_domain_type() to respect def_domain_type()
Message-ID: <3pxd6d44iejlvlijiyd65ze3wfsvvjtgrvstwhgp423uwutrz6@dak5ytcxcspv>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <8-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Aug 23, 2023 at 01:47:22PM -0300, Jason Gunthorpe wrote:
> Except for dart (which forces IOMMU_DOMAIN_DMA) every driver returns 0 or
> IDENTITY from ops->def_domain_type().
> 
> The drivers that return IDENTITY have some kind of good reason, typically
> that quirky hardware really can't support anything other than IDENTITY.
> 
> Arrange things so that if the driver says it needs IDENTITY then
> iommu_get_default_domain_type() either fails or returns IDENTITY.  It will
> not ignore the driver's override to IDENTITY.
> 
> Split the function into two steps, reducing the group device list to the
> driver's def_domain_type() and the untrusted flag.
> 
> Then compute the result based on those two reduced variables. Fully reject
> combining untrusted with IDENTITY.
> 
> Remove the debugging print on the iommu_group_store_type() failure path,
> userspace should not be able to trigger kernel prints.
> 
> This makes the next patch cleaner that wants to force IDENTITY always for
> ARM_IOMMU because there is no support for DMA.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/iommu.c | 117 ++++++++++++++++++++++++++++--------------
>  1 file changed, 79 insertions(+), 38 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

