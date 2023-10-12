Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 633CF7C6ABB
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 12 Oct 2023 12:15:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347137AbjJLKPY (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 12 Oct 2023 06:15:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347111AbjJLKPW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 12 Oct 2023 06:15:22 -0400
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com [IPv6:2607:f8b0:4864:20::f2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 067E2E6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Oct 2023 03:15:19 -0700 (PDT)
Received: by mail-qv1-xf2d.google.com with SMTP id 6a1803df08f44-66cfd35f595so4652436d6.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Oct 2023 03:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697105718; x=1697710518; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4bfmHiCpC0jdM/8Nmc5CLWmrrts9axW4w44tXuO9DcI=;
        b=Mau7NHR0b2aPF+Txd8J6JkUTo8sF3sv0sAg5q4yO03xHdzTYYdHql4+KxeQ3xOnyHX
         P7J2cVnmz29UDTphZg9aWrZA7aF2xkrAOvQ7SyYYHd9szBsMjILvQzRK5E5Ptrx8eBfN
         c5GleJal1Jgi6QNFa7qxzZo6YzkVN/rORwOGeAvMFd244uikpMNadh3OsJb9hQtg8Ys6
         7iuLf2r/erNhleLjMwmCUGNKqjoaMLL/iZQkwlu3gCZBpoLRF2wKXgmkEWkb0hL3muav
         H7bYLqekLbZuKiSWbroDui5xku444r6o02QRzlY2i53OWEMP9atOsv6r3/LZ7Qh1awIW
         4iDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697105718; x=1697710518;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4bfmHiCpC0jdM/8Nmc5CLWmrrts9axW4w44tXuO9DcI=;
        b=nvAhrAlEVa8wo+GpYcu/A8NXG0ZmEeP9/fP91/o71eQVskbWAvCIJSI0mG3c+I2KI6
         sy9sqqj/3qA8Jp8+hUoSDQLStCLUBiYJBgoutN09DVk7ZCXPYXXe4rzb3beMVq5Xhacf
         wK3zj/WWl395P6vQSWYBwQp2Z/RRqQxGEI07sOBMRGeuyhwhOByrkGTcTFTnUeX1rMLl
         Q1omxucOhmk4oTT5K3X7OuBvdoMAjND00DO4M89u2dfT7N7hvCMxykwbdEFMgsB2uzfJ
         bt+7NSEAc5/cU6rZBOLKF6X7bJ/9/k46y/EJF4ij2QN5B6hKcO2OucF1YZaYxg5E/ecB
         ry1w==
X-Gm-Message-State: AOJu0YzOTxjRqOcE6GSqxYDGWaQ5Vsg1o38YE5Q2BVbrIEbNPvfI/QTo
        Dxrdddv4bW0ZWd6kv1S6fVDBtIoV8W+IdF+0VsLYrg==
X-Google-Smtp-Source: AGHT+IEr9WuwYaxxoqJYFrbfAwBrWEHdqAE5exk8Mtmrx/Nk29qQXhDrGvuFAVS7ncKWTmolqk5rMwGO1qR3JFlm9Cg=
X-Received: by 2002:a05:6214:2c04:b0:65a:fcd1:1d85 with SMTP id
 qq4-20020a0562142c0400b0065afcd11d85mr24813204qvb.60.1697105718086; Thu, 12
 Oct 2023 03:15:18 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-3-peter.griffin@linaro.org> <5907e2b3-9a0b-4871-be08-6ca42200b8ec@linaro.org>
In-Reply-To: <5907e2b3-9a0b-4871-be08-6ca42200b8ec@linaro.org>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Thu, 12 Oct 2023 11:15:06 +0100
Message-ID: <CADrjBPqF67bcTnssQO8cN2n1ZbevziVNa+gA5azEDz_1wXzaNQ@mail.gmail.com>
Subject: Re: [PATCH v3 02/20] dt-bindings: clock: Add Google gs101 clock
 management unit bindings
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

Thanks for your review.

On Thu, 12 Oct 2023 at 07:11, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/10/2023 20:48, Peter Griffin wrote:
> > Provide dt-schema documentation for Google gs101 SoC clock controller.
> > Currently this adds support for cmu_top, cmu_misc and cmu_apm.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../bindings/clock/google,gs101-clock.yaml    | 125 ++++++++++
> >  include/dt-bindings/clock/google,gs101.h      | 232 ++++++++++++++++++
> >  2 files changed, 357 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> >  create mode 100644 include/dt-bindings/clock/google,gs101.h
> >
> > diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> > new file mode 100644
> > index 000000000000..f74494594b3b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> > @@ -0,0 +1,125 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/google,gs101-clock.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google GS101 SoC clock controller
> > +
> > +maintainers:
> > +  - Peter Griffin <peter.griffin@linaro.org>
> > +
> > +description: |
> > +  Google GS101 clock controller is comprised of several CMU units, generating
> > +  clocks for different domains. Those CMU units are modeled as separate device
> > +  tree nodes, and might depend on each other. The root clock in that clock tree
> > +  is OSCCLK (24.576 MHz). That external clock must be defined as a fixed-rate
> > +  clock in dts.
> > +
> > +  CMU_TOP is a top-level CMU, where all base clocks are prepared using PLLs and
> > +  dividers; all other leaf clocks (other CMUs) are usually derived from CMU_TOP.
> > +
> > +  Each clock is assigned an identifier and client nodes can use this identifier
> > +  to specify the clock which they consume. All clocks available for usage
> > +  in clock consumer nodes are defined as preprocessor macros in
> > +  'dt-bindings/clock/gs101.h' header.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - google,gs101-cmu-top
> > +      - google,gs101-cmu-apm
> > +      - google,gs101-cmu-misc
> > +
> > +  clocks:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  "#clock-cells":
> > +    const: 1
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +allOf:
>
> No improvements here from v1.

Seems I missed the
"required:" go before "allOf:" comment here. Sorry about that I've fixed that
in v4.

Seems like a few other exynos clock yaml bindings need that fix to.

>
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: google,gs101-cmu-top
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: External reference clock (24.576 MHz)
> > +
> > +        clock-names:
> > +          items:
> > +            - const: oscclk
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
>
> enum:
>   - google,gs101-cmu-apm
>   - google,gs101-cmu-misc

Ok just to be clear, are you saying I should have it like this?

  - if:
      properties:
        compatible:
          contains:
            enum:
              - google,gs101-cmu-misc
              - google,gs101-cmu-apm

    then:
      properties:
        clocks:
          minItems: 1
          items:
            - description: External reference clock (24.576 MHz)
            - description: Misc bus clock (from CMU_TOP)

        clock-names:
          minItems: 1
          items:
            - const: oscclk
            - const: dout_cmu_misc_bus

Instead of a dedicated  'if: const <compatible> then: ' for each CMU?

If I'm wrong above would you been kind enough to elaborate a bit
more on what you want, as all this dt-schema yaml stuff is a bit new
for me

Many thanks,

Peter
