Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3597849D1C
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 18 Jun 2019 11:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729253AbfFRJ1M (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 18 Jun 2019 05:27:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:57970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729207AbfFRJ1M (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 05:27:12 -0400
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6935F2085A;
        Tue, 18 Jun 2019 09:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560850031;
        bh=3d0WB2FWSq617HwBgtInbOFcIijY2d0ifcR6Ea00qN8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ImqAUIsomz+S+K3RJ1At8naHxBQ5VKVZ7zN2BeD/fqyI+PN1PHJnllocUrPWLqL9R
         4RJoVrM+vEJSIBAnQ89brETmsQokQSFSKDVLkqSdOszPh70zYhR+Ki5IN1H8jvO2tV
         LgI2Q6sdVSP+1oDmThdaHW4dcWzk0NYRSuQd/mvA=
Received: by mail-lj1-f178.google.com with SMTP id i21so12380807ljj.3;
        Tue, 18 Jun 2019 02:27:11 -0700 (PDT)
X-Gm-Message-State: APjAAAWIOmHZair595unobivo5O9ctcDqAPo+FofS/yB+HXOa4Du+zcj
        aDd27tcpSmwz86b8sggCNWKEiwNLTbPPJ9+H8qI=
X-Google-Smtp-Source: APXvYqzv7Gbmd6Xf/1K1px/rY6lBV7NSaMJUwamp2eOU1O40f6wjgppWFyx9CidnmsTWpf06LGliW+GVZtXWpi54Tbo=
X-Received: by 2002:a2e:8155:: with SMTP id t21mr10481642ljg.80.1560850029693;
 Tue, 18 Jun 2019 02:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203144.3850-2-joseph.kogut@gmail.com> <20190614235719.8134-1-joseph.kogut@gmail.com>
In-Reply-To: <20190614235719.8134-1-joseph.kogut@gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Tue, 18 Jun 2019 11:26:58 +0200
X-Gmail-Original-Message-ID: <CAJKOXPc-Xztou+xyibb8YZtfz20q3kzr_gTBoE=R3q_CSk9kzQ@mail.gmail.com>
Message-ID: <CAJKOXPc-Xztou+xyibb8YZtfz20q3kzr_gTBoE=R3q_CSk9kzQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm: dts: add ARM Mali GPU node for Odroid XU3
To:     Joseph Kogut <joseph.kogut@gmail.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, kgene@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 15 Jun 2019 at 01:57, Joseph Kogut <joseph.kogut@gmail.com> wrote:
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

One more thing - use "opp_table" as node name (generic class of node,
matches style with other tables).

Best regards,
Krzysztof

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
