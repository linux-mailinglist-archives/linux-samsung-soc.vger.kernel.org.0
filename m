Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B71B6CC112
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 28 Mar 2023 15:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233194AbjC1Nfs (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 28 Mar 2023 09:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232776AbjC1Nfs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Mar 2023 09:35:48 -0400
Received: from mail.8bytes.org (mail.8bytes.org [IPv6:2a01:238:42d9:3f00:e505:6202:4f0c:f051])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3A825C162
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Mar 2023 06:35:14 -0700 (PDT)
Received: from 8bytes.org (p200300c27714bc0086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:7714:bc00:86ad:4f9d:2505:dd0d])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.8bytes.org (Postfix) with ESMTPSA id C674C243A61;
        Tue, 28 Mar 2023 15:35:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
        s=default; t=1680010512;
        bh=Evx6aFnhohriNiu4fnc6X88sT6xC0NcjkNsGTLNyEjQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PeANwKQWAd7YObXmsY6C7npDllTw2pnLBAmTA0JRoV0SPIDXIbgfJX7oqUy2Tfsl5
         zz+KGSkrPuFgSGbmg0xd4xRf1Bnu1B9hzHBRLKyWhLNnavzhvzJOL2fQuy4cxH0EgW
         z8hFSdzxAYVZyJCO8VIOJ99emhv5NRotSO30dft/EZWvhpLK7kopdcXs82/GDiNryh
         t4gIRiTXnDmklMUkTcw4Y/hHbTwgUGdMNtsqvg1jLrWzWpF5GdipLVcLHp0v5Ccnvk
         TPkQWVNNT0I5UxqVm9DnB4jzQJdr/uh+/VACUbucvPjMSIiEUpjbCwCkjtYEAXG1+N
         xB9y7LnAIjBEA==
Date:   Tue, 28 Mar 2023 15:35:11 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     iommu@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2] iommu/exynos: Fix set_platform_dma_ops() callback
Message-ID: <ZCLtD1w0YWXzpcAj@8bytes.org>
References: <CGME20230315232523eucas1p2565ef5954e3b5b451803c6200c8bce32@eucas1p2.samsung.com>
 <20230315232514.1046589-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315232514.1046589-1-m.szyprowski@samsung.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Mar 16, 2023 at 12:25:14AM +0100, Marek Szyprowski wrote:
>  drivers/iommu/exynos-iommu.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)

Applied to iommu/fixes.
