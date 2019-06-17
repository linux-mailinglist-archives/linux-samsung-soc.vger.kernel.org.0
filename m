Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93CF748DBE
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 17 Jun 2019 21:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726424AbfFQTQp (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 17 Jun 2019 15:16:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:35184 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725829AbfFQTQp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 15:16:45 -0400
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A46FA20B1F;
        Mon, 17 Jun 2019 19:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560799004;
        bh=Gt19uq+qmreWDS4gPNgKL+i/1lZeWJVrbTndQXm88hA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ygI4mXZ4FK/DIAC0x67TCpM/GLGF7iIf6vOaeEfsnPSMNoQfK28rgck+5RB2qRpEO
         CMsaZVg4ehzf/O4mj+wCZIvyxGeQNNkRPycGzlVa9w80eY/UyXxP7tixjhKDXtQyHL
         YyRUpu5ryCwzuA+MoSUQrA/vBH4C2sSnqAWyYbSw=
Received: by mail-qt1-f181.google.com with SMTP id d17so7213538qtj.8;
        Mon, 17 Jun 2019 12:16:44 -0700 (PDT)
X-Gm-Message-State: APjAAAVPXSIBBYhHq+yZ/0IOHNrkufAqR0Jlb7EdhPldrrbeHIX2l8mP
        NWwCmfRrPhMgQ9dMCkT0ju4zQmE51eOuV+qHEw==
X-Google-Smtp-Source: APXvYqyVZbh0PlMogbVhE0NULb2YNLy3fCj6PKe8704XokjeEqmm6eZIegjHmk/tzMvMCwl9xNlf5j9cXMv6fjsBPAU=
X-Received: by 2002:ac8:368a:: with SMTP id a10mr13618835qtc.143.1560799003868;
 Mon, 17 Jun 2019 12:16:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203144.3850-2-joseph.kogut@gmail.com> <20190614235719.8134-1-joseph.kogut@gmail.com>
In-Reply-To: <20190614235719.8134-1-joseph.kogut@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 17 Jun 2019 13:16:31 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKasi4m7xU2AF1YQk-Tp0Z6=qh51LgTpb=xiZ9g6A3HvA@mail.gmail.com>
Message-ID: <CAL_JsqKasi4m7xU2AF1YQk-Tp0Z6=qh51LgTpb=xiZ9g6A3HvA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm: dts: add ARM Mali GPU node for Odroid XU3
To:     Joseph Kogut <joseph.kogut@gmail.com>
Cc:     Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Jun 14, 2019 at 5:57 PM Joseph Kogut <joseph.kogut@gmail.com> wrote:
>
> Add device tree node for mali gpu on Odroid XU3 SoCs.
>
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>
> Changes v1 -> v2:
> - Use interrupt name ordering from binding doc
> - Specify a single clock for GPU node
> - Add gpu opp table
> - Fix warnings from IRQ_TYPE_NONE
>
>  .../boot/dts/exynos5422-odroidxu3-common.dtsi | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> index 93a48f2dda49..b8a4246e3b37 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> @@ -48,6 +48,32 @@
>                 cooling-levels = <0 130 170 230>;
>         };
>
> +       gpu: gpu@11800000 {
> +               compatible = "samsung,exynos-mali", "arm,mali-t628";
> +               reg = <0x11800000 0x5000>;
> +               interrupts = <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 74  IRQ_TYPE_LEVEL_HIGH>,
> +                            <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +               interrupt-names = "job", "mmu", "gpu";
> +               clocks = <&clock CLK_G3D>;
> +               mali-supply = <&buck4_reg>;
> +               operating-points-v2 = <&gpu_opp_table>;
> +       };
> +
> +       gpu_opp_table: gpu-opp-table {

Not really a new problem in this file, but you are mixing nodes with
and without an address and really the gpu node should be under a
simple-bus node.

If the OPP is only for the GPU, I'd make it a child of the gpu node instead.

> +               compatible = "operating-points-v2";
> +
> +               opp-177000000 {
> +                       opp-hz = /bits/ 64 <117000000>;
> +                       opp-microvolt = <812500>;
> +               };
> +
> +               opp-600000000 {
> +                       opp-hz = /bits/ 64 <600000000>;
> +                       opp-microvolt = <1150000>;
> +               };
> +       };
> +
>         thermal-zones {
>                 cpu0_thermal: cpu0-thermal {
>                         thermal-sensors = <&tmu_cpu0 0>;
> --
> 2.22.0
>
