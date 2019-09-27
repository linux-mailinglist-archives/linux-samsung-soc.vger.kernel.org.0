Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97E7FC083E
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 27 Sep 2019 17:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727506AbfI0PCp (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 27 Sep 2019 11:02:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:40282 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727319AbfI0PCp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 27 Sep 2019 11:02:45 -0400
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B8D5021D56;
        Fri, 27 Sep 2019 15:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569596564;
        bh=PPVrg31jFsrd7Bb7WNQSWveOn6okoAYRcvr6DKHC6Rs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=anMo7lpQvcOoM8adFgciIu8hAZzGl/ACVS8D7IYkNWDzW/WQpmyh/sQAN+MObtq5Y
         bhaJuxSa8BgmZphQLIYj4rwRFkpZ404mO5S1dODJ1+rPfTBAmVHkpNgPgXcQaE/3ls
         iBK+Meh8QFWennVgtbzfwz1SUKKjE9n5IKE6m5bg=
Received: by mail-lf1-f45.google.com with SMTP id q11so2155695lfc.11;
        Fri, 27 Sep 2019 08:02:43 -0700 (PDT)
X-Gm-Message-State: APjAAAV0x5vO0oQMmBT7hsS4AwbDWzkJc0qYnu/Qs0E2+A+yHgeWpqZY
        Ny8nl5N5ba7aXE/WEOPwINdhuaR/UQNgy55BUc4=
X-Google-Smtp-Source: APXvYqy7jRhfFe+G4lbc7z7OKjLE8RFoVguNq/Nw8wsZJrdUMbNUF8U/vQWDWWcPDvaR8I5XatG0ubwRa/is+GJvxEQ=
X-Received: by 2002:ac2:4853:: with SMTP id 19mr3073713lfy.69.1569596561915;
 Fri, 27 Sep 2019 08:02:41 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20190927143325eucas1p289cb46e8dcbb1ace0b1f80ade738c29b@eucas1p2.samsung.com>
 <20190927143319.12232-1-m.szyprowski@samsung.com>
In-Reply-To: <20190927143319.12232-1-m.szyprowski@samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 27 Sep 2019 17:02:30 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfUN5C3OXAYJ9TLp-wuuBQPZmbMkTher1nV8O5+F38ghg@mail.gmail.com>
Message-ID: <CAJKOXPfUN5C3OXAYJ9TLp-wuuBQPZmbMkTher1nV8O5+F38ghg@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: gpu: Convert Samsung 2D Graphics
 Accelerator to dt-schema
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Maciej Falkowski <m.falkowski@samsung.com>
Cc:     devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Inki Dae <inki.dae@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 27 Sep 2019 at 16:33, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> From: Maciej Falkowski <m.falkowski@samsung.com>
>
> Convert Samsung 2D Graphics Accelerator to newer dt-schema format
>
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> ---
> v3:
> - Merged two if-statements with single if-else statement
> - Added 'additionalProperties: false'
> - Listed all missing 'properties' in properties scope
>
> Best regards,
> Maciej Falkowski
> ---
>  .../devicetree/bindings/gpu/samsung-g2d.txt   | 27 -------
>  .../devicetree/bindings/gpu/samsung-g2d.yaml  | 75 +++++++++++++++++++
>  2 files changed, 75 insertions(+), 27 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpu/samsung-g2d.txt
>  create mode 100644 Documentation/devicetree/bindings/gpu/samsung-g2d.yaml
>
> diff --git a/Documentation/devicetree/bindings/gpu/samsung-g2d.txt b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
> deleted file mode 100644
> index 1e7959332dbc..000000000000
> --- a/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -* Samsung 2D Graphics Accelerator
> -
> -Required properties:
> -  - compatible : value should be one among the following:
> -       (a) "samsung,s5pv210-g2d" for G2D IP present in S5PV210 & Exynos4210 SoC
> -       (b) "samsung,exynos4212-g2d" for G2D IP present in Exynos4x12 SoCs
> -       (c) "samsung,exynos5250-g2d" for G2D IP present in Exynos5250 SoC
> -
> -  - reg : Physical base address of the IP registers and length of memory
> -         mapped region.
> -
> -  - interrupts : G2D interrupt number to the CPU.
> -  - clocks : from common clock binding: handle to G2D clocks.
> -  - clock-names : names of clocks listed in clocks property, in the same
> -                 order, depending on SoC type:
> -                 - for S5PV210 and Exynos4 based SoCs: "fimg2d" and
> -                   "sclk_fimg2d"
> -                 - for Exynos5250 SoC: "fimg2d".
> -
> -Example:
> -       g2d@12800000 {
> -               compatible = "samsung,s5pv210-g2d";
> -               reg = <0x12800000 0x1000>;
> -               interrupts = <0 89 0>;
> -               clocks = <&clock 177>, <&clock 277>;
> -               clock-names = "sclk_fimg2d", "fimg2d";
> -       };
> diff --git a/Documentation/devicetree/bindings/gpu/samsung-g2d.yaml b/Documentation/devicetree/bindings/gpu/samsung-g2d.yaml
> new file mode 100644
> index 000000000000..e7daae862578
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpu/samsung-g2d.yaml
> @@ -0,0 +1,75 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpu/samsung-g2d.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung SoC 2D Graphics Accelerator
> +
> +maintainers:
> +  - Inki Dae <inki.dae@samsung.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,s5pv210-g2d    # in S5PV210 & Exynos4210 SoC
> +      - samsung,exynos4212-g2d # in Exynos4x12 SoCs
> +      - samsung,exynos5250-g2d
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks: {}
> +  clock-names: {}
> +  iommus: {}
> +  power-domains: {}
> +
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: samsung,exynos5250-g2d
> +
> +then:
> +  properties:
> +    clocks:
> +      items:
> +        - description: fimg2d clock
> +    clock-names:
> +      items:
> +        - const: fimg2d
> +
> +else:
> +  properties:
> +    clocks:
> +      items:
> +        - description: sclk_fimg2d clock
> +        - description: fimg2d clock
> +    clock-names:
> +      items:
> +        - const: sclk_fimg2d
> +        - const: fimg2d
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    g2d@12800000 {
> +        compatible = "samsung,s5pv210-g2d";
> +        reg = <0x12800000 0x1000>;
> +        interrupts = <0 89 0>;
> +        clocks = <&clock 177>, <&clock 277>;
> +        clock-names = "sclk_fimg2d", "fimg2d";
> +    };
> +
> +...

The same trailing lines. I mentioned this already about scaler
bindings. Please fix all your patches at once for the same commented
issue.

With this fixup:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
