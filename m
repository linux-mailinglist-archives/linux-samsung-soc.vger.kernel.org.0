Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9717A78B9E3
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 28 Aug 2023 23:02:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233195AbjH1VBp (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 28 Aug 2023 17:01:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233610AbjH1VBn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 28 Aug 2023 17:01:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E5CF132
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Aug 2023 14:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1693256453;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=mPucHT4vAUhtQdeHUtkBDDGaES5ThoGt/JYy///1HlU=;
        b=HzYaN8RBYe/PFKVckKpPmuF/VFZs69CNqOaaSHhtA58gn4SREE1TM/On8OQ+fOYFdOV2hC
        NdYMoltCLF35keijEjvtHy3EbnI8s5ACCvcm4SgPUSkMc6clTLkMn2m3mUsZDG3M+Cqij4
        mma/33nn+8FoG+AOcKXbKdkCqJ0WKc0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-hEdKWKJgORC9ou1zOhjbSA-1; Mon, 28 Aug 2023 17:00:52 -0400
X-MC-Unique: hEdKWKJgORC9ou1zOhjbSA-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-76ef4ff3aecso511564785a.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Aug 2023 14:00:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693256452; x=1693861252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPucHT4vAUhtQdeHUtkBDDGaES5ThoGt/JYy///1HlU=;
        b=RVpPZATs0gtktD1lkpMNTCKtBX0IZCmk6o4Lvi/ef1/D4iFZoDnuIVDcO4AYYyPHsp
         cFFDeulXsfi8yA5UCW/F1jZ9OUZFiQjsjXwg/YEOMuEaC2OQfG4bQuy1XucnofzeZnUH
         Ie4V+RaZdjxsNJyDa+YJuUqYX9aVKgYEQNMmiY64oAeSswtB9CtSUvdUTdSGxQ5PCIvh
         c/2Gt1ROoyIJ9QnfpuPlvjQ2wWm7Onnj1Iyvi6SeCYL7G30zHVhQSaIRwcSCyyRSHj4y
         Vb7CeMeiesU4K8DR4XVZvodryU+KVhDjCU6dDpLFdyexfqbUgMRxELSZIWhTrk4XAJIZ
         byUQ==
X-Gm-Message-State: AOJu0Yy9VMFmKz867MPCgf7mrPFfW8QF8z2jnlyiw/ZWxlxTOW/Yi+VQ
        u+sRdsb1D8it2CMMc4MvF6VY2wFzqPusNcWthp6N2XvVxKNMMbPtz/2EVcaB43nmJfR3mwhXkFi
        5HXVZkuoPUXJbowdNfc9Pp8rIdVbQgZE=
X-Received: by 2002:a05:620a:254e:b0:767:dd2c:9a1 with SMTP id s14-20020a05620a254e00b00767dd2c09a1mr32435872qko.20.1693256452103;
        Mon, 28 Aug 2023 14:00:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFc76gVDSQjoSi7VzVoCzv2VufWTRTR2JHknan7WgS/aaS2xw9REImaP5+SJVlVkj2Kooggog==
X-Received: by 2002:a05:620a:254e:b0:767:dd2c:9a1 with SMTP id s14-20020a05620a254e00b00767dd2c09a1mr32435844qko.20.1693256451852;
        Mon, 28 Aug 2023 14:00:51 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id v14-20020ae9e30e000000b00767d2870e39sm2642220qkf.41.2023.08.28.14.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 14:00:51 -0700 (PDT)
Date:   Mon, 28 Aug 2023 14:00:50 -0700
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
Subject: Re: [PATCH v7 16/24] iommu/qcom_iommu: Add an IOMMU_IDENTITIY_DOMAIN
Message-ID: <cfl4ixqvcradllxpjzbmyikl6jtr5q53tipn4p3bka7obavxjj@novxolxpv7sr>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <16-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <16-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, Aug 23, 2023 at 01:47:30PM -0300, Jason Gunthorpe wrote:
> This brings back the ops->detach_dev() code that commit
> 1b932ceddd19 ("iommu: Remove detach_dev callbacks") deleted and turns it
> into an IDENTITY domain.
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 39 +++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>

