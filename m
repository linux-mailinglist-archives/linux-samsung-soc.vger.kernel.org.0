Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36F16D14C2
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  9 Oct 2019 19:02:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731821AbfJIRB7 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 9 Oct 2019 13:01:59 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:36418 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730546AbfJIRB6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 9 Oct 2019 13:01:58 -0400
Received: by mail-wm1-f66.google.com with SMTP id m18so3385294wmc.1;
        Wed, 09 Oct 2019 10:01:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1ntg9Cgk0VsZd8S7ttijlhlq6wPX6YWJRFJKhAxqY2s=;
        b=mEMc6Q/L7kjw1iSYzVLXs9XhqC3PnLnV4NoNnlUjEqunoSPG+nVZCQQxfG/wND5g88
         g3Go9+SC4Ge1UjdFd6yErAmaZUCqTy8IZg3iYxIIpXqWxN2yMSAzZ9BVWqxTXEVukvcy
         TxM34quS9INRTI0fdgGvub0XuINjfusaw8YwHu7LtqZFW5t/igltMvCGdPcbjjcDEKPr
         +O70hKbfiJxHLwMnjIvOdaD1+vF0y17xc1Nwt4uE3UUE95jM0ZYCCV4z7UDXclyKkU7p
         2YlGhmQ2y21jRTdZqmMb3d5yBMoRG75jfv9CoY0WLdX8iwJZnlzZvnpTHiv4iiTjTf5d
         HkQA==
X-Gm-Message-State: APjAAAWjTFrt8rVmHXzb6De7mdFW0BBKu1HpSBltm05k6SvHyqz38onW
        Jd2Y0aR7yPjB5jiPdRtBLLoAyBzw
X-Google-Smtp-Source: APXvYqywRoqPo105V6/4gJ2UkRNcxVS4KHZ1uLjw16BuZ4XXdBsIl7s5m/bKvGnMs9P6wgRpjkKSJQ==
X-Received: by 2002:a1c:55c4:: with SMTP id j187mr3319915wmb.155.1570640515524;
        Wed, 09 Oct 2019 10:01:55 -0700 (PDT)
Received: from kozik-lap ([194.230.155.145])
        by smtp.googlemail.com with ESMTPSA id v6sm5131269wma.24.2019.10.09.10.01.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 10:01:54 -0700 (PDT)
Date:   Wed, 9 Oct 2019 19:01:52 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Olof Johansson <olof@lixom.net>,
        Simon Horman <horms+renesas@verge.net.au>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 1/2] ARM: multi_v7_defconfig: Enable options for
 boards with Exynos SoC
Message-ID: <20191009170152.GA28821@kozik-lap>
References: <20191008160234.3106-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191008160234.3106-1-krzk@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Oct 08, 2019 at 06:02:33PM +0200, Krzysztof Kozlowski wrote:
> Sync with exynos_defconfig and enable following options for Samsung
> Exynos SoC based boards:
> 1. NFC_S3FWRN5_I2C (with NFC stack): Samsung S3FWRN5 NCI NFC Controller,
>    used for example on Exynos5433 (if booted in 32-bit mode),
> 2. S3C2410_WATCHDOG: watchdog driver used on S3C, S5P and Exynos SoCs,
> 3. REGULATOR_S2MPA01: Samsung S2MPA01 regulators driver present on
>    Exynos5260 RexNos REX-RED board,
> 4. SND_SOC_ARNDALE: sound support on Arndale boards,
> 5. EXYNOS_IOMMU: IOMMU driver used on all Exynos SocS,,
> 6. EXTCON_MAX14577, EXTCON_MAX77693 and EXTCON_MAX8997: extcon drivers
>    for handling micro USB on mobile Samsung boards (Trats, Trats2,
>    Rinato),
> 7. PHY_EXYNOS5250_SATA: SATA phy for Exynos5250 present on Arndale and
>    SMDK5250 boards.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> SND_SOC_ARNDALE is in progress (patch introducing it was not yet applied)
> 
> Changes since v1:
> 1. Bring back REMOTEPROC.
> ---
>  arch/arm/configs/multi_v7_defconfig | 17 ++++++++++++++++-

Applied both.

Best regards,
Krzysztof

