Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A4403EF400
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 17 Aug 2021 22:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232539AbhHQU0q (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 17 Aug 2021 16:26:46 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:38404 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230515AbhHQU0q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Aug 2021 16:26:46 -0400
Received: by mail-ot1-f51.google.com with SMTP id 108-20020a9d01750000b029050e5cc11ae3so26393802otu.5;
        Tue, 17 Aug 2021 13:26:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Jwv4/AsABqqbZxTyNSClz3yIj4zaoG7ZZxQJMXVkY5M=;
        b=mdpM0c46FFWboCwNsOASYbwX0i5LuedG4VqDAm2F74U2OzX7tExskSDLaSl+8xmzgo
         p/YJPJbvWLFugiFKdhj3ghsEPuJexLa2mBowDaBzGscXL2ihAJZpdjt8EBOVx9xgN7P5
         a9MvIx0kX63tn5nqkTr9RTSkLDvcQPCUB5oewd6NxRR1HFrTiqKLJJIJ8DGqcBr109Mb
         S5cHhHkNMQfHN3bzSuBjOLUJwoEg3DH9Hf/9+Yo7PqKahYzp0ulSU9Dckzwx+70TOLlZ
         9+3f1jUZnhONoTBi9n0GrzvI6kTVu09sjBzOF30JOY00/VDOQLVn9+aL9A1KqL9eykJd
         o8eg==
X-Gm-Message-State: AOAM532azfguz+NZJeBH8a69vVSOJkYA+MDaLSNQuoHRlc4bUiAE8Sr5
        dTeMMuPu5ubOEX0wu2tmQA==
X-Google-Smtp-Source: ABdhPJyc8IVEtDkOqCHSGdj045OkJ/ExCWQA+FZrC8VyI4LW6fvMBIPMnj0fMMioLTVH8rTBUrfG8Q==
X-Received: by 2002:a9d:6359:: with SMTP id y25mr4043386otk.274.1629231972035;
        Tue, 17 Aug 2021 13:26:12 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f33sm402653otf.0.2021.08.17.13.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 13:26:11 -0700 (PDT)
Received: (nullmailer pid 781404 invoked by uid 1000);
        Tue, 17 Aug 2021 20:26:10 -0000
Date:   Tue, 17 Aug 2021 15:26:10 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>
Subject: Re: [PATCH v2 6/8] dt-bindings: clock: samsung: convert Exynos AudSS
 to dtschema
Message-ID: <YRwbYiS7VTd/NdS5@robh.at.kernel.org>
References: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com>
 <20210810093145.26153-7-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810093145.26153-7-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, Aug 10, 2021 at 11:31:43AM +0200, Krzysztof Kozlowski wrote:
> Convert Samsung Exynos Audio SubSystem clock controller bindings to DT
> schema format using json-schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/clock/clk-exynos-audss.txt       | 103 ------------------
>  .../clock/samsung,exynos-audss-clock.yaml     |  79 ++++++++++++++
>  2 files changed, 79 insertions(+), 103 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-audss-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt b/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
> deleted file mode 100644
> index 6030afb10b5c..000000000000
> --- a/Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
> +++ /dev/null
> @@ -1,103 +0,0 @@
> -* Samsung Audio Subsystem Clock Controller
> -
> -The Samsung Audio Subsystem clock controller generates and supplies clocks
> -to Audio Subsystem block available in the S5PV210 and Exynos SoCs. The clock
> -binding described here is applicable to all SoCs in Exynos family.
> -
> -Required Properties:
> -
> -- compatible: should be one of the following:
> -  - "samsung,exynos4210-audss-clock" - controller compatible with all Exynos4 SoCs.
> -  - "samsung,exynos5250-audss-clock" - controller compatible with Exynos5250
> -    SoCs.
> -  - "samsung,exynos5410-audss-clock" - controller compatible with Exynos5410
> -    SoCs.
> -  - "samsung,exynos5420-audss-clock" - controller compatible with Exynos5420
> -    SoCs.
> -- reg: physical base address and length of the controller's register set.
> -
> -- #clock-cells: should be 1.
> -
> -- clocks:
> -  - pll_ref: Fixed rate PLL reference clock, parent of mout_audss. "fin_pll"
> -    is used if not specified.
> -  - pll_in: Input PLL to the AudioSS block, parent of mout_audss. "fout_epll"
> -    is used if not specified.
> -  - cdclk: External i2s clock, parent of mout_i2s. "cdclk0" is used if not
> -    specified.
> -  - sclk_audio: Audio bus clock, parent of mout_i2s. "sclk_audio0" is used if
> -    not specified.
> -  - sclk_pcm_in: PCM clock, parent of sclk_pcm.  "sclk_pcm0" is used if not
> -    specified.
> -
> -- clock-names: Aliases for the above clocks. They should be "pll_ref",
> -  "pll_in", "cdclk", "sclk_audio", and "sclk_pcm_in" respectively.
> -
> -Optional Properties:
> -
> -  - power-domains: a phandle to respective power domain node as described by
> -    generic PM domain bindings (see power/power_domain.txt for more
> -    information).
> -
> -The following is the list of clocks generated by the controller. Each clock is
> -assigned an identifier and client nodes use this identifier to specify the
> -clock which they consume. Some of the clocks are available only on a particular
> -Exynos4 SoC and this is specified where applicable.
> -
> -Provided clocks:
> -
> -Clock           ID      SoC (if specific)
> ------------------------------------------------
> -
> -mout_audss      0
> -mout_i2s        1
> -dout_srp        2
> -dout_aud_bus    3
> -dout_i2s        4
> -srp_clk         5
> -i2s_bus         6
> -sclk_i2s        7
> -pcm_bus         8
> -sclk_pcm        9
> -adma            10      Exynos5420
> -
> -Example 1: An example of a clock controller node using the default input
> -	   clock names is listed below.
> -
> -clock_audss: audss-clock-controller@3810000 {
> -	compatible = "samsung,exynos5250-audss-clock";
> -	reg = <0x03810000 0x0C>;
> -	#clock-cells = <1>;
> -};
> -
> -Example 2: An example of a clock controller node with the input clocks
> -           specified.
> -
> -clock_audss: audss-clock-controller@3810000 {
> -	compatible = "samsung,exynos5250-audss-clock";
> -	reg = <0x03810000 0x0C>;
> -	#clock-cells = <1>;
> -	clocks = <&clock 1>, <&clock 7>, <&clock 138>, <&clock 160>,
> -		<&ext_i2s_clk>;
> -	clock-names = "pll_ref", "pll_in", "sclk_audio", "sclk_pcm_in", "cdclk";
> -};
> -
> -Example 3: I2S controller node that consumes the clock generated by the clock
> -           controller. Refer to the standard clock bindings for information
> -           about 'clocks' and 'clock-names' property.
> -
> -i2s0: i2s@3830000 {
> -	compatible = "samsung,i2s-v5";
> -	reg = <0x03830000 0x100>;
> -	dmas = <&pdma0 10
> -		&pdma0 9
> -		&pdma0 8>;
> -	dma-names = "tx", "rx", "tx-sec";
> -	clocks = <&clock_audss EXYNOS_I2S_BUS>,
> -		<&clock_audss EXYNOS_I2S_BUS>,
> -		<&clock_audss EXYNOS_SCLK_I2S>,
> -		<&clock_audss EXYNOS_MOUT_AUDSS>,
> -		<&clock_audss EXYNOS_MOUT_I2S>;
> -	clock-names = "iis", "i2s_opclk0", "i2s_opclk1",
> -		      "mout_audss", "mout_i2s";
> -};
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos-audss-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos-audss-clock.yaml
> new file mode 100644
> index 000000000000..d60b29fa22e7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos-audss-clock.yaml
> @@ -0,0 +1,79 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/samsung,exynos-audss-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos SoC Audio SubSystem clock controller
> +
> +maintainers:
> +  - Chanwoo Choi <cw00.choi@samsung.com>
> +  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> +  - Tomasz Figa <tomasz.figa@gmail.com>
> +
> +description: |
> +  All available clocks are defined as preprocessor macros in
> +  include/dt-bindings/clock/exynos-audss-clk.h header.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - samsung,exynos4210-audss-clock
> +      - samsung,exynos5250-audss-clock
> +      - samsung,exynos5410-audss-clock
> +      - samsung,exynos5420-audss-clock
> +
> +  clocks:
> +    minItems: 2
> +    items:
> +      - description:
> +          Fixed rate PLL reference clock, parent of mout_audss. "fin_pll" is
> +          used if not specified.
> +      - description:
> +          Input PLL to the AudioSS block, parent of mout_audss. "fout_epll" is
> +          used if not specified.
> +      - description:
> +          Audio bus clock, parent of mout_i2s. "sclk_audio0" is used if not
> +          specified.
> +      - description:
> +          PCM clock, parent of sclk_pcm.  "sclk_pcm0" is used if not specified.
> +      - description:
> +          External i2s clock, parent of mout_i2s. "cdclk0" is used if not
> +          specified.
> +
> +  clock-names:
> +    minItems: 2
> +    items:
> +      - const: pll_ref
> +      - const: pll_in
> +      - const: sclk_audio
> +      - const: sclk_pcm_in
> +      - const: cdclk
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  power-domains: true

How many?

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - "#clock-cells"
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@3810000 {
> +        compatible = "samsung,exynos5250-audss-clock";
> +        reg = <0x03810000 0x0c>;
> +        #clock-cells = <1>;
> +        clocks = <&clock 1>, <&clock 7>, <&clock 138>, <&clock 160>, <&ext_i2s_clk>;
> +        clock-names = "pll_ref", "pll_in", "sclk_audio", "sclk_pcm_in", "cdclk";
> +    };
> -- 
> 2.30.2
> 
> 
