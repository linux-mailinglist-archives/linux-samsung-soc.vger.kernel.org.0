Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D954F8CED3
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 14 Aug 2019 10:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725861AbfHNIvy (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 14 Aug 2019 04:51:54 -0400
Received: from 8bytes.org ([81.169.241.247]:49208 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725863AbfHNIvy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Aug 2019 04:51:54 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 1D2C42E2; Wed, 14 Aug 2019 10:51:52 +0200 (CEST)
Date:   Wed, 14 Aug 2019 10:51:49 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     iommu@lists.linux-foundation.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] iommu: exynos: Remove __init annotation from
 exynos_sysmmu_probe()
Message-ID: <20190814085148.GA24321@8bytes.org>
References: <CGME20190812103255eucas1p1cdab368b5fb06e4e3df62dfdc679f3af@eucas1p1.samsung.com>
 <20190812103246.18049-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812103246.18049-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Aug 12, 2019 at 12:32:46PM +0200, Marek Szyprowski wrote:
> Exynos SYSMMU driver supports deferred probe. It happens when clocks
> needed for this driver are not yet available. Typically next calls to
> driver ->probe() happen before init section is free, but this is not
> really guaranteed. To make if safe, remove __init annotation from
> exynos_sysmmu_probe() function.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Applied, thanks.
