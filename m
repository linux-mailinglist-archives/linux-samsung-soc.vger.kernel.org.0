Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D0BB74CD0
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Jul 2019 13:19:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390784AbfGYLT1 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 25 Jul 2019 07:19:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:35830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390493AbfGYLT1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 25 Jul 2019 07:19:27 -0400
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7F64D22BF5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2019 11:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564053565;
        bh=RsITX6ePkAMVGG3hL+GoDv/TMw1QkOZFUsmJ32yFJHs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=IyIyoZGXnqdm45B+CAVG+GX2HdB16KcPBTrEBHdeSpQNU6/JM5ZF6nX0OgHdhbFZY
         oW6VgopC311MpHX5NMZ7mOiBLJRlDrRj00ITyHeZtv+TpaeihVLOHjZgo57P+EHV52
         Sd7Mdjt3MmyTcWgIMxYM3C9RX0iVl5sWiC0XRRc4=
Received: by mail-lf1-f44.google.com with SMTP id h28so34218040lfj.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jul 2019 04:19:25 -0700 (PDT)
X-Gm-Message-State: APjAAAVTKq30BtPezvsFylKJAMDSwmXuLLVBHLTYlWUiRVXgehtKdyHx
        Qn8rM977P4c05myxs9PnNGsYkFs1WOlNcJITtS8=
X-Google-Smtp-Source: APXvYqx1lM65hedlAaq5hJ9vcQnP8ka92OsgDK7he9h2XV+2K7EJvucPEzFYBmj3wjtr7i5NjbNjx5LfPxJPbg3eueM=
X-Received: by 2002:ac2:5601:: with SMTP id v1mr277121lfd.106.1564053563654;
 Thu, 25 Jul 2019 04:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190724072008.6272-1-guillaume.gardet@free.fr> <20190725083433.6505-1-guillaume.gardet@arm.com>
In-Reply-To: <20190725083433.6505-1-guillaume.gardet@arm.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 25 Jul 2019 13:19:12 +0200
X-Gmail-Original-Message-ID: <CAJKOXPejSxxH5DJPyEHTt=VEOdVgiXOm1c3MKKir-qRxtDcLLA@mail.gmail.com>
Message-ID: <CAJKOXPejSxxH5DJPyEHTt=VEOdVgiXOm1c3MKKir-qRxtDcLLA@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] arm: dts: exynos: Add GPU/Mali T604 node to exynos5250
To:     Guillaume <guillaume.gardet@arm.com>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 25 Jul 2019 at 10:34, Guillaume <guillaume.gardet@arm.com> wrote:
>
> From: Guillaume GARDET <guillaume.gardet@arm.com>
>
> Add nodes for GPU (Mali T604) to Exynos5250.
> Tested with kmscube and glmark2-es2-drm on Chromebook snow.
> Load tested on arndale board.
>
> Signed-off-by: Guillaume GARDET <guillaume.gardet@arm.com>
>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2 changes:
>   * move mali node as /soc sub-node
>   * move gpu_opp_table as mali sub-node
>   * minor style updates
>   * test on arndale board
>   * enable by default

I was not specific enough. It can stay disabled in the DTSI because
not all resources are provided. The board DTSes (all or ones which are
tested) will enable it and provide missing resources - mali-supply.
Just like:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f0a6208b90bdd44f48f5718c8bb0eb1e763d14c0

>   * add dt bindings, in a separate patch

Put the bindings before DTS change.

>
>  arch/arm/boot/dts/exynos5250.dtsi | 47 +++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index d5e0392b409e..f7f34d469bde 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -328,6 +328,52 @@
>                         iommus = <&sysmmu_rotator>;
>                 };
>
> +               mali: gpu@11800000 {
> +                       compatible = "samsung,exynos5250-mali", "arm,mali-t604";
> +                       reg = <0x11800000 0x5000>;
> +                       interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "job", "mmu", "gpu";
> +                       clocks = <&clock CLK_G3D>;
> +                       clock-names = "g3d";

According to bindings this is not proper clock name. I wonder why it
was working... it seems the driver expects first clock to be always
the core clock.

Best regards,
Krzysztof
