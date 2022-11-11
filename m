Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D490C625AB1
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 11 Nov 2022 13:48:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232983AbiKKMsf (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 11 Nov 2022 07:48:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231625AbiKKMsd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Nov 2022 07:48:33 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E875A2ACE
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Nov 2022 04:48:30 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id b29so4788659pfp.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Nov 2022 04:48:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4PpE7Q5f5bvtpLJ/b9REabVXXBhrphdzGDXXrX+228E=;
        b=lnqya06q8SxpiNiyTObscWjOCgipaybNtUHPgkBfY6/cxGij/KkV8NjH1LVDpZnQdF
         Ooya33qPMF0QGqSWvIL+NH+aXm6V1sVWmmDQIQTl4AJiUAO9b/0puj40k6lqH+T2FRIC
         kfIoX81VLr0ofEKTlMHER5t1jIvIN1uWze53b1xLlIqGSrmkwBHk5f4hzzVO3i1mESPq
         5bzm8wrv1HjK9M9EdDOxtBns5wpuxGYYuucxCVlvJxYTBEDxgImUHlZsavzOQdk3qwRJ
         dKCYZzyLyKH1SdUC6cE3aE/PjU1bCTIfTLiJSdCQi03MrH85cvU4cIzyOkXabtagPEWg
         93BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PpE7Q5f5bvtpLJ/b9REabVXXBhrphdzGDXXrX+228E=;
        b=3tYBx+57mIeMzWNOgoNJpIdd1B48BkozwUUnwVAzTZtMPFadNrqKQcRPTxMkTWkwwh
         D/mzgIEh4KZIB909qemZbD/i6n2uYYApiZBSy7yA+qa9OfEhpfdMJpX7Nbef/sdSETxL
         ZuAXtbZ4TxYqVikCA6o00gNvnYDuX9yo28EUKmWxlrbByt945VzLAY5a/Ov6Ovm7Ucpx
         KpKia2d/suoNFcBK20CjntWNOI1GMigPfB8SkfIaDI2pM7a+YpBKdNBpEbIQMi6xgGV+
         V7DrFHAmu0bi/RHXXT5UeBAK/tZlWZoM3CPLCvmW3dcoLckg/pyw8HwoOLoGT8OrUb35
         T6tg==
X-Gm-Message-State: ANoB5pm/pT/xQeuF/icFPYNI9DJSLR+c151szJ1WUnSywrjgCQmjU1C2
        eB1dmzUq222HJzUj2beZq7ugs5D2eIH66Lc4QMb43g==
X-Google-Smtp-Source: AA0mqf7HRYt0+EuJGsxK9ElnJj+/eHkmT2ZJVA90wah6LD67x1i/m5vKjZkYjDoojKjAk4frpM1L55k/W4KghZALTko=
X-Received: by 2002:a63:4d1c:0:b0:462:e0d0:2582 with SMTP id
 a28-20020a634d1c000000b00462e0d02582mr1552736pgb.48.1668170910453; Fri, 11
 Nov 2022 04:48:30 -0800 (PST)
MIME-Version: 1.0
References: <CGME20221110154412eucas1p26182a3d691584b577ddced9a1287df60@eucas1p2.samsung.com>
 <20221110154407.26531-1-m.szyprowski@samsung.com>
In-Reply-To: <20221110154407.26531-1-m.szyprowski@samsung.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 11 Nov 2022 13:48:18 +0100
Message-ID: <CAPLW+4=T5h+gs-1Sw=XpXL_NtCRQUtU_97mu4ThaKaaMecZ8Dg@mail.gmail.com>
Subject: Re: [PATCH v2] iommu/exynos: Fix driver initialization sequence
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     iommu@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 10 Nov 2022 at 16:44, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Registering a SYSMMU platform driver might directly trigger initializing
> IOMMU domains and performing the initial mappings. Also the IOMMU core
> might use the IOMMU hardware once it has been registered with
> iommu_device_register() function. Ensure that all driver resources are
> allocated and initialized before the driver advertise its presence to the
> platform bus and the IOMMU subsystem.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/iommu/exynos-iommu.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
> index 45fd4850bacb..b0cde2211987 100644
> --- a/drivers/iommu/exynos-iommu.c
> +++ b/drivers/iommu/exynos-iommu.c
> @@ -708,10 +708,6 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
>         if (ret)
>                 return ret;
>
> -       ret = iommu_device_register(&data->iommu, &exynos_iommu_ops, dev);
> -       if (ret)
> -               goto err_iommu_register;
> -
>         platform_set_drvdata(pdev, data);
>
>         if (PG_ENT_SHIFT < 0) {
> @@ -743,11 +739,13 @@ static int exynos_sysmmu_probe(struct platform_device *pdev)
>
>         pm_runtime_enable(dev);
>
> +       ret = iommu_device_register(&data->iommu, &exynos_iommu_ops, dev);
> +       if (ret)
> +               goto err_dma_set_mask;
> +
>         return 0;
>
>  err_dma_set_mask:
> -       iommu_device_unregister(&data->iommu);
> -err_iommu_register:
>         iommu_device_sysfs_remove(&data->iommu);
>         return ret;
>  }
> @@ -1432,12 +1430,6 @@ static int __init exynos_iommu_init(void)
>                 return -ENOMEM;
>         }
>
> -       ret = platform_driver_register(&exynos_sysmmu_driver);
> -       if (ret) {
> -               pr_err("%s: Failed to register driver\n", __func__);
> -               goto err_reg_driver;
> -       }
> -
>         zero_lv2_table = kmem_cache_zalloc(lv2table_kmem_cache, GFP_KERNEL);
>         if (zero_lv2_table == NULL) {
>                 pr_err("%s: Failed to allocate zero level2 page table\n",
> @@ -1446,10 +1438,16 @@ static int __init exynos_iommu_init(void)
>                 goto err_zero_lv2;
>         }
>
> +       ret = platform_driver_register(&exynos_sysmmu_driver);
> +       if (ret) {
> +               pr_err("%s: Failed to register driver\n", __func__);
> +               goto err_reg_driver;
> +       }
> +
>         return 0;
> -err_zero_lv2:
> -       platform_driver_unregister(&exynos_sysmmu_driver);
>  err_reg_driver:
> +       platform_driver_unregister(&exynos_sysmmu_driver);
> +err_zero_lv2:
>         kmem_cache_destroy(lv2table_kmem_cache);
>         return ret;
>  }
> --
> 2.17.1
>
