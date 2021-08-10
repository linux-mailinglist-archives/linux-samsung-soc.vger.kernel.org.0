Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97A973E82AB
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 10 Aug 2021 20:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232739AbhHJSRR (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 10 Aug 2021 14:17:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238711AbhHJSO5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Aug 2021 14:14:57 -0400
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28E94C03ACAC
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Aug 2021 10:46:37 -0700 (PDT)
Received: by mail-ua1-x934.google.com with SMTP id m39so3660816uad.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Aug 2021 10:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cbcNgFPSz0OzHBe1xln1Cx0UEPJ7cJriNsAq1wTtQnw=;
        b=H+Vekug80X5FhOkWXXkYEuojkXWHJEiRBaYn563zxuzN1Johl2t/TYuXssgRh8OrKA
         6mSCIsk+XTzfXs9+bKm3dJ9a+u3dhAWIYTd8voSBKku4TDM2TXLgnWnUn96JWaOMlRQm
         QNwtrbA9dTDZzhnyndKrrKn1k5J6J/tXo35xkNkRWF1wUpYp8IAbqIG63yDi6zWtKtXf
         m3/RGFU11f+6QV1/RFuLUWMeLuAxr/lGyU8zHS3llu5GRSovcF/CiipfG0E0i2vj0nuE
         Z2FFcicxjAdG9Zqa27m2ouBgP6tPulIf1L9JuBTJXjYjV3AKkhTLyuoAZc9reO+U6OC1
         XFZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cbcNgFPSz0OzHBe1xln1Cx0UEPJ7cJriNsAq1wTtQnw=;
        b=SMkXrc4Yn7dWWEBKbpyBRPu5a4HY1RhcsbivWWSXLYZAjLKMbyGhJkaSPeiGJdhtWZ
         f+PZAHnMRlYd7OA/+tn6xdJ/GHBMPxAdEaXT5DG3rlAOFoSDBrLAZF8/dEC7p5rMk2s4
         JXAPXi4a9G8/2aNsp/pTW7KQ1CJcUATo4Ie2hXdlXog0snIV63iOaLE7TmDDKoQgTulz
         FB3T7iGSR/B26uSNxx1KDTJ13IXPDUu/TdBnQrecGtQZC4ARE71luztlUXzq8x/FJgoP
         k8ZJ4j8YxrrYEvoqI152qQZ8CIvKKpEP0AaoPDdfaEbp1fAzykw/TaU3zXLlG/R9UZg7
         kZfw==
X-Gm-Message-State: AOAM532rSrkJN+n6UVlMUn73QRIeZgsgAjKLZ29n2Mr1qA/wWqGeUIcA
        q7CIRBI/m5dp2MX7VUNV/MGeTUJD67NMyINrjdLmZQ==
X-Google-Smtp-Source: ABdhPJwrntD4ZxsH49yI3TNZvnHaWoX7fDRJkA8qmkk+sGGy7WRMINFZ6iBBiTt80dVk9SmeEN7vvmqPVvEMxcbPBD0=
X-Received: by 2002:ab0:6392:: with SMTP id y18mr22388136uao.139.1628617596264;
 Tue, 10 Aug 2021 10:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com> <20210810093145.26153-7-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210810093145.26153-7-krzysztof.kozlowski@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 10 Aug 2021 20:46:24 +0300
Message-ID: <CAPLW+4=tOpaNGs6vxwyVy7xaeX+w_jhtY2P2U8sZGvm6mdqh1Q@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] dt-bindings: clock: samsung: convert Exynos AudSS
 to dtschema
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 10 Aug 2021 at 12:32, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
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
> -          clock names is listed below.
> -
> -clock_audss: audss-clock-controller@3810000 {
> -       compatible = "samsung,exynos5250-audss-clock";
> -       reg = <0x03810000 0x0C>;
> -       #clock-cells = <1>;
> -};
> -
> -Example 2: An example of a clock controller node with the input clocks
> -           specified.
> -
> -clock_audss: audss-clock-controller@3810000 {
> -       compatible = "samsung,exynos5250-audss-clock";
> -       reg = <0x03810000 0x0C>;
> -       #clock-cells = <1>;
> -       clocks = <&clock 1>, <&clock 7>, <&clock 138>, <&clock 160>,
> -               <&ext_i2s_clk>;
> -       clock-names = "pll_ref", "pll_in", "sclk_audio", "sclk_pcm_in", "cdclk";
> -};
> -
> -Example 3: I2S controller node that consumes the clock generated by the clock
> -           controller. Refer to the standard clock bindings for information
> -           about 'clocks' and 'clock-names' property.
> -
> -i2s0: i2s@3830000 {
> -       compatible = "samsung,i2s-v5";
> -       reg = <0x03830000 0x100>;
> -       dmas = <&pdma0 10
> -               &pdma0 9
> -               &pdma0 8>;
> -       dma-names = "tx", "rx", "tx-sec";
> -       clocks = <&clock_audss EXYNOS_I2S_BUS>,
> -               <&clock_audss EXYNOS_I2S_BUS>,
> -               <&clock_audss EXYNOS_SCLK_I2S>,
> -               <&clock_audss EXYNOS_MOUT_AUDSS>,
> -               <&clock_audss EXYNOS_MOUT_I2S>;
> -       clock-names = "iis", "i2s_opclk0", "i2s_opclk1",
> -                     "mout_audss", "mout_i2s";
> -};

Seems like some examples and "Provided clocks" table were dropped in
in yaml binding. Also there is no description for example present in
yaml file. Is that some redundant info and was dropped intentionally?
I'm just worrying about losing some useful info during the conversion.

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
