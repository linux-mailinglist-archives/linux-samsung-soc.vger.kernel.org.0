Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD79A852D8
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Aug 2019 20:18:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389293AbfHGSSl (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 7 Aug 2019 14:18:41 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34082 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389288AbfHGSSl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Aug 2019 14:18:41 -0400
Received: by mail-wm1-f67.google.com with SMTP id e8so1918653wme.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Aug 2019 11:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=OkCRcSez60k6DrhipSCuhRzjMA0yXg8Kl2ULa1yIne8=;
        b=trIzdh7lmco47j71eU52+d2ZSVbdXw45wdOGqyWbjRqxR2ghVcCrUbrlz094i4U+wS
         hNW6p7g2xROR6a1R/hBKueXddXLC1gxWOgvWt71fDxjI5cQfxMwBxkdw8PlyyWRV2R8V
         6kLzoUFbOQG8pmnCmxQ9rcciMDoVVCsPbnjxO1ceyXNrzqtbr6S6Ea7UR1gVepcSxWEm
         yMp9MluKmmpOdBuQ7GtlE9apoJnlvOmgrzpXbQTUFEFIPCggb/C08O3ch3E2WCziRraM
         POJsZL+PjJ1l9q/m9pKNdg6IZgt/I0/Bg9ROjgS8JK9wWaDhG5RGa+7pWqORayqnfCBf
         1wtg==
X-Gm-Message-State: APjAAAUSV7sYsBV/BMvy9VBuZMXMZiksihg4/Hi2CLDpTcv3cBAyWsFP
        Gz+4mSvl6XsMxR2cBwJIwnJ9X2fX
X-Google-Smtp-Source: APXvYqyy225yblIHeKRiSBANJqOly3pa31zeDcs3g2tfsygdRmFq+RwnUvgjKYPqUlU9T7BihuMICg==
X-Received: by 2002:a05:600c:2245:: with SMTP id a5mr1096901wmm.121.1565201919020;
        Wed, 07 Aug 2019 11:18:39 -0700 (PDT)
Received: from kozik-lap ([194.230.155.124])
        by smtp.googlemail.com with ESMTPSA id l8sm180344784wrg.40.2019.08.07.11.18.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 11:18:38 -0700 (PDT)
Date:   Wed, 7 Aug 2019 20:18:36 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 1/2] ARM: dts: exynos: Add port map to Exynos5250 AHCI
 node
Message-ID: <20190807181836.GA29189@kozik-lap>
References: <CGME20190802101837eucas1p148cc47e6eb2faa3d08ed245a67c11e77@eucas1p1.samsung.com>
 <20190802101822.10131-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190802101822.10131-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Aug 02, 2019 at 12:18:21PM +0200, Marek Szyprowski wrote:
> Exynos AHCI (SATA) controller has only one port for SATA device. According
> to AHCI driver bindings (ata/ahci-platform.txt), if the bootloader doesn't
> program the PORTS_IMPL register to proper value, the available port map has
> to be provided by 'ports-implemented' device tree property. This fixes
> SATA operation on Exynos5250-based boards since Linux v4.5.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi | 1 +

Thanks, applied both.

Best regards,
Krzysztof

