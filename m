Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43D93468C2B
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  5 Dec 2021 17:48:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236016AbhLEQvm (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 5 Dec 2021 11:51:42 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:56658
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235974AbhLEQvl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 5 Dec 2021 11:51:41 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 59C3F3F1C0
        for <linux-samsung-soc@vger.kernel.org>; Sun,  5 Dec 2021 16:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638722893;
        bh=YAG394abehWP5x5UVEiEsvM3lkNLZNo/SvP+RiyStYY=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=GJ11wBQB87Drpz5ETWAdjimFA07TAvDkZfUcL3CtmGPIYqr+mAhxR7o/N6drKuvrL
         4/KrhxKVjPziwaytFi53ni6Wm/BctGJaaeewQbCgqd9WEliiA+ZBSpjGw79Ip9/ka9
         6VZzx4tkKUDuAyVTf7aweXbtcEgJu8eFAhht3TYwV5sjsS1p4b3Ldt5Dwkmwz23lQ0
         UodNQc+hRMdcaYOLh16l0mnRIwhBkInPbbvYsbnrstc5oZWOokrwC2cU9xhe4iXYnB
         YiV53aNMOGQoUtr6DJEQY2NHSVKBKKHU1/xFE+PdLPBwpsXL9WZ83Tey8dYqpMaezG
         tbPX/SIjAt3dQ==
Received: by mail-lj1-f199.google.com with SMTP id k24-20020a2e9a58000000b00218c7914524so2917031ljj.17
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Dec 2021 08:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=YAG394abehWP5x5UVEiEsvM3lkNLZNo/SvP+RiyStYY=;
        b=AIArCYrHQttndGVqEwdKa62lBowaO2cK1SjT7l3k0eUylmstpO5VbSlnn7f8gw3uu2
         5eNnbOLW/LCVxR7UG4hvthhiKjDM1p6nh/AkqRKP0LzrKG0kfVGb6GUU+DBqzXwq44q+
         Uv2m5+NNY6dKdDBlI+H76DGMf9VFpva/ryqPXOBs1i53F+9Z79Z8sXb2lKbbJR7FRe3x
         OILoP27cFSdPzo10mfUX4cfSJtZsxeUGCH0u1glNqmf8sg8DvHmm+7MhZrDeR8Rv2w2p
         hDh5AxCr5OnG+C3GNyfwZtbdT97/lQT3OjC+lY+sA6uE3Qsdy6Q6rXOC6LEPCWbnTRNE
         fMVA==
X-Gm-Message-State: AOAM531hcZ/x5eNyHZZTqZ6svFBmgpjO9vxhCp8rupBoaEVR1VdgL/0R
        6pRL5xOKXgFfUW3K3UU+/uRsP4R1Jkou3OukwCMX2ztmFa1uoT4RXDmmKxRS7LryKvUtC6ugw0M
        2cGz5y3FcvFFHOKHtZHhQRD/80HtEcOJgcJvg9qD3JRmcH9UA
X-Received: by 2002:a19:e209:: with SMTP id z9mr29962172lfg.133.1638722892700;
        Sun, 05 Dec 2021 08:48:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxzC0fsm8KG4Ao2+bh0SCDSiY7H1XtLL1X5+1zGM67HiLL9zb2nVYVuoUjrUCquzapYaIV4wQ==
X-Received: by 2002:a19:e209:: with SMTP id z9mr29962151lfg.133.1638722892531;
        Sun, 05 Dec 2021 08:48:12 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id j22sm1112336lfu.155.2021.12.05.08.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Dec 2021 08:48:12 -0800 (PST)
Message-ID: <06c46a8d-6335-6ff8-c036-6d3356e1281a@canonical.com>
Date:   Sun, 5 Dec 2021 17:48:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 3/6] dt-bindings: clock: Document Exynos7885 CMU bindings
Content-Language: en-US
To:     David Virag <virag.david003@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20211205153302.76418-1-virag.david003@gmail.com>
 <20211205153302.76418-4-virag.david003@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211205153302.76418-4-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05/12/2021 16:32, David Virag wrote:
> Provide dt-schema documentation for Exynos7885 SoC clock controller.
> Description is modified from Exynos850 clock controller documentation as
> I couldn't describe it any better, that was written by Sam Protsenko.
> 
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---
>  .../clock/samsung,exynos7885-clock.yaml       | 166 ++++++++++++++++++
>  1 file changed, 166 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos7885-clock.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos7885-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos7885-clock.yaml
> new file mode 100644
> index 000000000000..9ec7358889d6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos7885-clock.yaml
> @@ -0,0 +1,166 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/samsung,exynos7885-clock.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos7885 SoC clock controller
> +
> +maintainers:
> +  - Dávid Virág <virag.david003@gmail.com>
> +  - Chanwoo Choi <cw00.choi@samsung.com>
> +  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> +  - Tomasz Figa <tomasz.figa@gmail.com>
> +
> +description: |
> +  Exynos7885 clock controller is comprised of several CMU units, generating
> +  clocks for different domains. Those CMU units are modeled as separate device
> +  tree nodes, and might depend on each other. The root clock in that root tree
> +  is an external clock:: OSCCLK (26 MHz). This external clock must be defined

Double ':'. I think you meant only one

> +  as a fixed-rate clock in dts.
> +


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
