Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C47169AB9F
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 17 Feb 2023 13:36:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229984AbjBQMgC (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 17 Feb 2023 07:36:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbjBQMgB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 17 Feb 2023 07:36:01 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 852F54BE8E
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Feb 2023 04:36:00 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id a27so674827qto.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Feb 2023 04:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H6ylVVjWrPaYJcA3ux2lI5605W12dXBlhPx+mi97Pp0=;
        b=agm1UNnxDumI4+z/tyRqkXAdxFP3/0LO/DXHGeHusxzUUHGZszSg+AfNrT32IzVg2l
         bbZv3OqTjW2vyJI8DLRWRE7fwCoOB5fRrDb3kAJPd4pEGS6NQ38hq0t+EmeQe2AcmOo6
         WOWKl++8ph4yhuMQ1vaqhBNLBdQbwZaeqgC/ksLtkHfoeRVVPXKXi18GILcVO/Q1zTAN
         LvPT+J8WFtDG89DkZczPgF7eOGzUmvWmg04/OdKqm+PBQfuL7m4EqbI8tonpwvXuTezC
         HvdNSQRy5GrtHKKOnZobqqfrzk7+30tIslpoVlNdxKI4N/57l80KNsd2CJbk6QM0u2O3
         ntug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6ylVVjWrPaYJcA3ux2lI5605W12dXBlhPx+mi97Pp0=;
        b=KKAmiZN/eZQQEt+RC4YMTx88L2rX6y8qGh5O6A2y9g7C0tBeQjEbqhl8E5Ijkp08Hf
         kcu26HZVkvDr2aGdJAPxPEW5l6p/jK1QSvR7OJ/Oc+yUIxEiijoJpbf7HjjJ+8NOG3f/
         17FXxBQufp4FaDujBgH1Sl0gMoSKLKLJ7T5LWdnzumKztRhGOi6Kz6L9fLVIf1/dA00y
         byhY/Fn2OaezJAS2KxPVvaGACmR3OVGs76rZNyTmC1/HavAIenIqzfuKhQRz5BXYkTAZ
         XahqHovjTl8Gr3XUclHyy+IjJGy58LxUCsR3ZBWhCFkYwuFjoFt2DjNUgmX7CjSq1muc
         43kQ==
X-Gm-Message-State: AO0yUKVqBXwsYFFrEqWeSq2tnx1VWeCvqR7Ebn9VK7veEen0zuqwSO65
        ry5aYlWeAE4FYz4s/wBc2VzRWw==
X-Google-Smtp-Source: AK7set9Qww8MxkEenI3GgxUUK5ReouGiIDSZwTwMF1Bt/gDfEKdywTCHAooHf3YDUWpy3OwN42Bk9A==
X-Received: by 2002:ac8:4e45:0:b0:3b9:a4c8:d57a with SMTP id e5-20020ac84e45000000b003b9a4c8d57amr2339760qtw.32.1676637359414;
        Fri, 17 Feb 2023 04:35:59 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-25-194.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.25.194])
        by smtp.gmail.com with ESMTPSA id d17-20020ac800d1000000b003b9b8ec742csm3181866qtg.14.2023.02.17.04.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 04:35:58 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
        (envelope-from <jgg@ziepe.ca>)
        id 1pSzy2-00362g-1s;
        Fri, 17 Feb 2023 08:35:58 -0400
Date:   Fri, 17 Feb 2023 08:35:58 -0400
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     iommu@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        lim Akhtar <alim.akhtar@samsung.com>,
        Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH] iommu/exynos: add missing set_platform_dma_ops callback
Message-ID: <Y+90rkPHe/+eSLs6@ziepe.ca>
References: <CGME20230123093116eucas1p19b8fe8afc4b631debbdc5321c53009e9@eucas1p1.samsung.com>
 <20230123093102.12392-1-m.szyprowski@samsung.com>
 <Y871a3elCP1gmPQi@ziepe.ca>
 <e7aa3a5d-c8f9-ad7d-4c5c-08756c1ab2d3@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7aa3a5d-c8f9-ad7d-4c5c-08756c1ab2d3@samsung.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Feb 17, 2023 at 12:08:42PM +0100, Marek Szyprowski wrote:
> Hi,
> 
> I'm sorry for a delay in replying, but I was busy with other stuff.
> 
> On 23.01.2023 22:00, Jason Gunthorpe wrote:
> > On Mon, Jan 23, 2023 at 10:31:01AM +0100, Marek Szyprowski wrote:
> >> Add set_platform_dma_ops() required for proper driver operation on ARM
> >> 32bit arch after recent changes in the IOMMU framework (detach ops
> >> removal).
> > Thanks for looking into this!
> >
> > Can you explain more about how this actually solves the problem in the
> > commit message? I don't get it.
> 
> Exynos DRM driver calls arm_iommu_detach_device(), then 
> arm_iommu_attach_device() with a difrent 'mapping', see 
> drivers/gpu/drm/exynos/exynos_drm_dma.c Lack of set_platform_dma_ops 
> leads to a warning in iommu_group_do_set_platform_dma(). The other case 
> of calling arm_iommu_detach_device() is after unsuccessful probe of the 
> platform device.

Why can't this just use the normal iommu path in all cases?

It looks like it is trying to copy the DMA API domain from a parent
device to a sub device.

Even when using arm_iommu an iommu_domain is still present, so the
copy code should work?

Though I'm still not really sure how this arm_iommu stuff works..

eg if a driver does iommu_device_claim_dma_owner() how does the
iommu_domain get set back to the arm_iommu's mapping's iommu_domain?

According to the API that is what set_platform is supposed to do (eg
it is what s390 does), but I don't see any code like that in any of
the ARM32 drivers..

Jason
