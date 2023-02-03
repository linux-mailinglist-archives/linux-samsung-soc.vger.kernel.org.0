Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E019A68942F
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  3 Feb 2023 10:45:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232507AbjBCJmL (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 3 Feb 2023 04:42:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232860AbjBCJmE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Feb 2023 04:42:04 -0500
Received: from mail.8bytes.org (mail.8bytes.org [IPv6:2a01:238:42d9:3f00:e505:6202:4f0c:f051])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5F3A614EA6
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Feb 2023 01:41:50 -0800 (PST)
Received: from 8bytes.org (p200300c27714bc0086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:7714:bc00:86ad:4f9d:2505:dd0d])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.8bytes.org (Postfix) with ESMTPSA id 253A2224208;
        Fri,  3 Feb 2023 10:41:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
        s=default; t=1675417308;
        bh=SByJjWxgR6x3teX2cMdrO2uuYT22engALik+DQf9/Sg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aSs9RPJrHTJO8mb4wvzMgllqYrcuVVK5nQ9cb706iXgudDid7pYoemDE8szLEilM7
         gN2r5oL64BDmR1Ck4Ygd14K0t69RWzheYNrTtwFUOpunoFDSG12pevQCZ9pzXrfEzE
         eVtsB1MyG0bUL01hn7yW+LWE9BlD6DNNxy38NT17+Jqd3fMHsxvwLlgYm1QLDdAvYV
         DbtlPS0Rd5EQcY5L9BJNN+btbDHN8buM8ba6Mqx4hAl2laDftCSuZHB0RlM/BXUrzy
         wxp0nzvktMeZvGBn3eBmqRMZnDBVeAlw/Q7tebyoYR0+5cic58pm4oNO57M4bF2fLt
         U7rEVdYFw9izA==
Date:   Fri, 3 Feb 2023 10:41:46 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     iommu@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        lim Akhtar <alim.akhtar@samsung.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH] iommu/exynos: add missing set_platform_dma_ops callback
Message-ID: <Y9zW2s2Vmib5L5zK@8bytes.org>
References: <CGME20230123093116eucas1p19b8fe8afc4b631debbdc5321c53009e9@eucas1p1.samsung.com>
 <20230123093102.12392-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230123093102.12392-1-m.szyprowski@samsung.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Jan 23, 2023 at 10:31:01AM +0100, Marek Szyprowski wrote:
> Add set_platform_dma_ops() required for proper driver operation on ARM
> 32bit arch after recent changes in the IOMMU framework (detach ops
> removal).
> 
> Fixes: c1fe9119ee70 ("iommu: Add set_platform_dma_ops callbacks")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Applied, thanks.
