Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E1426C3486
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 21 Mar 2023 15:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbjCUOlZ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 21 Mar 2023 10:41:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbjCUOlY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Mar 2023 10:41:24 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C67994FF12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Mar 2023 07:41:21 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id r5so18086340qtp.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Mar 2023 07:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1679409680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VsESyQmPEYPtlv8Qtns7l7XM+vfyI6Pmh9fN7mCM7RU=;
        b=eHkykCav8PIbZ8d6K8QZ6Rtx/B23qF8ynIK5Inpjk3UWanV0GOlFzWYcLMy6vRtM+l
         dMp2FPdu5yNaVh+Xptj4CfUzs9jy8R/G/Tig8W8hLneo9HND9GxtWbJxTs0w9R+q5a1J
         M0nMrReffPok/IOndWtu2Mi2tXtDrLdFYQPnsGG1wuZThYsOBDWOyHUaftXhSUD8eVYp
         qhE0Pi7kIllt1i54g7KqTwHOLXRUFc1QQeKKPlPX0M73AykshOs2HNKN304sxRgWcT5h
         BN3ElDhcRr+KmU9GgMdfFQKvzNyBNjHYpmFePFEj2dGTgx37Lb9rPwb8CJhwiYsswybM
         ugNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679409680;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VsESyQmPEYPtlv8Qtns7l7XM+vfyI6Pmh9fN7mCM7RU=;
        b=h6bDP3KqHUWK69gR3rlgdMArAfNYCDOU+OEq+faGt3rVmFpE87s5graRN2Ljwu6uTb
         f7CbLa5ShCzlMm3oFuFZkCaVAMrMyA6+/+luSZHwUELCuwk6fkZHg7qjf8x9LGgyfu3H
         ElHyWZHSNVAB5fohU9c2clDRrFCtYKC8YUgidbYW6/UOOw4u4zBQsQA6v4B8ev8zCzfY
         HyHS2nhPolB5ObeFzUPgf4HYcE9kA4sLyralfjz9YN+4tHeY1MpzJhCBaIiH/P2uhcIz
         jgeSdBqQTct/MAgDCRrrU5sU1N6x/dBYxLNksT7Elmxsn6OwUddqaZOl7yyTcQJutDmK
         HOGA==
X-Gm-Message-State: AO0yUKXH4E5rDmBZeYkrE5LZMnAkXXsK/+TtXBRCNyl9x5POMxS03O37
        RRfRdSaBkw4JIE/OmCn7G3k0ag==
X-Google-Smtp-Source: AK7set+UzRDTVZ0qoylhnByM6ScHpCtlilLXdrBM9ohzsnMm3+w0gXwuni40utMRZ9ry2o6G/Ho9cw==
X-Received: by 2002:a05:622a:2cc:b0:3bc:dd23:cbb2 with SMTP id a12-20020a05622a02cc00b003bcdd23cbb2mr5322002qtx.33.1679409680729;
        Tue, 21 Mar 2023 07:41:20 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id jr28-20020a05622a801c00b003bd0f0b26b0sm8257944qtb.77.2023.03.21.07.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 07:41:20 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1pedAt-000VZN-Nm;
        Tue, 21 Mar 2023 11:41:19 -0300
Date:   Tue, 21 Mar 2023 11:41:19 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     iommu@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH v2] iommu/exynos: Fix set_platform_dma_ops() callback
Message-ID: <ZBnCD7Xc9WCM55ub@ziepe.ca>
References: <CGME20230315232523eucas1p2565ef5954e3b5b451803c6200c8bce32@eucas1p2.samsung.com>
 <20230315232514.1046589-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315232514.1046589-1-m.szyprowski@samsung.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Mar 16, 2023 at 12:25:14AM +0100, Marek Szyprowski wrote:
> There are some subtle differences between release_device() and
> set_platform_dma_ops() callbacks, so separate those two callbacks. Device
> links should be removed only in release_device(), because they were
> created in probe_device() on purpose and they are needed for proper
> Exynos IOMMU driver operation. While fixing this, remove the conditional
> code as it is not really needed.
> 
> Reported-by: Jason Gunthorpe <jgg@ziepe.ca>
> Fixes: 189d496b48b1 ("iommu/exynos: Add missing set_platform_dma_ops callback")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v2:
> - keep set_platform_dma_ops only on ARM 32bit
> 
> Some more background why set_platform_dma_ops is needed on ARM 32bit is
> available here:
> https://lore.kernel.org/all/9a12fcac-c347-5d81-acef-1124c50d0c37@arm.com/
> ---
>  drivers/iommu/exynos-iommu.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)

It seems OK, but do you know what state the device is left in after
exynos_iommu_detach_device ? Ie is it blocking or identity?

Jason
