Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F32646A49
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 14 Jun 2019 22:37:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727344AbfFNUg6 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 14 Jun 2019 16:36:58 -0400
Received: from mail.kernel.org ([198.145.29.99]:36758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727131AbfFNUg6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 14 Jun 2019 16:36:58 -0400
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A6B0E21881;
        Fri, 14 Jun 2019 20:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560544617;
        bh=BMo9z7ktz9HuAZSsZMrvij5s/QTJTao6137g4UhlIgs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=vWedKb+jbEbTSmw49dIs6fTCJMj1eNLfzV8lZhNRiHHoNikTzq2f3wdnIMZkVCQyL
         knYe1cDPqn1d10QezlNcqa/UafNrHuBUfY7wb2TBsdKdscj2QcfL0si88DVa5eR8xe
         an96ZnAgozIFPA2aIN/tmAjrRvruXjj6fWhglrLM=
Received: by mail-qt1-f175.google.com with SMTP id y57so4049194qtk.4;
        Fri, 14 Jun 2019 13:36:57 -0700 (PDT)
X-Gm-Message-State: APjAAAVsG14ub8MW2Ej7ZVWH/jtE+G8uSJfvW54jTvn3g8kfHopL4ewN
        BD8k7alFN/himm5udj/Ni9NnxSfhGpOAEnIIBw==
X-Google-Smtp-Source: APXvYqyWRzWEZ0HIsQNXaYvRLs4N5ZiA6PSR36infTnI62eYz0wn0LN3U9LzbcQ569w7rU4GDgO6FBTD8OY61VcRQO8=
X-Received: by 2002:a0c:b627:: with SMTP id f39mr10202928qve.72.1560544616863;
 Fri, 14 Jun 2019 13:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190614203144.3850-1-joseph.kogut@gmail.com> <20190614203144.3850-2-joseph.kogut@gmail.com>
In-Reply-To: <20190614203144.3850-2-joseph.kogut@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Fri, 14 Jun 2019 14:36:45 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJjqCRU2a9sfMimTJoMQnR6CjqAqjHRAxyaebWAad299g@mail.gmail.com>
Message-ID: <CAL_JsqJjqCRU2a9sfMimTJoMQnR6CjqAqjHRAxyaebWAad299g@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm: dts: add ARM Mali GPU node for Odroid XU3
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

On Fri, Jun 14, 2019 at 2:31 PM Joseph Kogut <joseph.kogut@gmail.com> wrote:
>
> Add device tree node for mali gpu on Odroid XU3 SoCs.
>
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> ---
>  .../boot/dts/exynos5422-odroidxu3-common.dtsi  | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> index 93a48f2dda49..1f2ae19d01af 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
> @@ -48,6 +48,24 @@
>                 cooling-levels = <0 130 170 230>;
>         };
>
> +       gpu: gpu@11800000 {
> +               compatible = "samsung,exynos-mali", "arm,mali-t628";
> +               reg = <0x11800000 0x5000>;
> +               interrupts = <0 117 0>,
> +                            <0 219 0>,
> +                            <0 74  0>;
> +               interrupt-names = "gpu", "job", "mmu";

Please use the order defined in the binding doc.

> +               clocks = <&clock CLK_G3D>,
> +                        <&clock CLK_DOUT_ACLK_G3D>,
> +                        <&clock CLK_FOUT_VPLL>;

The binding doc says a single clock.

> +               mali-supply = <&buck4_reg>;
> +               operating-points = <

The binding doc says operating-points-v2.

> +                       /* KHz  uV   */
> +                       600000  1150000
> +                       177000  812500
> +               >;
> +       };
> +
>         thermal-zones {
>                 cpu0_thermal: cpu0-thermal {
>                         thermal-sensors = <&tmu_cpu0 0>;
> --
> 2.22.0
>
