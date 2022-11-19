Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9095D630DD4
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 19 Nov 2022 10:34:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230391AbiKSJeM (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 19 Nov 2022 04:34:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230266AbiKSJeL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 19 Nov 2022 04:34:11 -0500
X-Greylist: delayed 1094 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 19 Nov 2022 01:34:11 PST
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1B104A3166
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Nov 2022 01:34:10 -0800 (PST)
Received: from 8bytes.org (p200300c27724780086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:7724:7800:86ad:4f9d:2505:dd0d])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.8bytes.org (Postfix) with ESMTPSA id 380592A00C5;
        Sat, 19 Nov 2022 10:34:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
        s=default; t=1668850450;
        bh=Vg/lY3KoFK3Ajbf1n+XXYfDpHTNf4XHoWuksuqy20sA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rg0QK1gXNhrI7umH2KEvc6O4+c2auws18j9/rZP1LvrQkdREB98QlGNKH0oVteMEG
         DerygnmoePWTDoMm9zNqDWdXmBHzofek5Yv7x76jlrukWjd+PwCtBTxQSPr3xG8JP7
         BHSTEX/wi7guZpaZuGFRkNlwBderDEd4CM0D8prKcW2+tNNht6YnuNbIYvqSu8Awtr
         nGVAkZWbX0YkDaU+J1eIFdL7RMt2eue6z+8xbBwOGGBrfZOFWnhLe1aGR7WGAro8u4
         PzQM3nB3Gu9z6UDPB1U0c+9/kRmmkNm/6nIOYvcplAJNOORdOFgvjGNvC5xrTzis2S
         au2mhvtaoDKiQ==
Date:   Sat, 19 Nov 2022 10:34:09 +0100
From:   Joerg Roedel <joro@8bytes.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     iommu@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: [PATCH v2] iommu/exynos: Fix driver initialization sequence
Message-ID: <Y3ijEe/VbAQuL4QA@8bytes.org>
References: <CGME20221110154412eucas1p26182a3d691584b577ddced9a1287df60@eucas1p2.samsung.com>
 <20221110154407.26531-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221110154407.26531-1-m.szyprowski@samsung.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Nov 10, 2022 at 04:44:07PM +0100, Marek Szyprowski wrote:
> Registering a SYSMMU platform driver might directly trigger initializing
> IOMMU domains and performing the initial mappings. Also the IOMMU core
> might use the IOMMU hardware once it has been registered with
> iommu_device_register() function. Ensure that all driver resources are
> allocated and initialized before the driver advertise its presence to the
> platform bus and the IOMMU subsystem.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/iommu/exynos-iommu.c | 26 ++++++++++++--------------
>  1 file changed, 12 insertions(+), 14 deletions(-)

Removed v1 and applied this instead, thanks.
