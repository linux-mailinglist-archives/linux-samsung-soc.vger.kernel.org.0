Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E2F1D33B5
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 10 Oct 2019 23:57:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727224AbfJJV4E (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 10 Oct 2019 17:56:04 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:46497 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725867AbfJJV4E (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Oct 2019 17:56:04 -0400
Received: by mail-oi1-f194.google.com with SMTP id k25so6259923oiw.13;
        Thu, 10 Oct 2019 14:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dmEyns0qiRRKvVwvDe9b3zXgdL6xxWI9qrjMl+HbFFk=;
        b=Ox6Eyd4q1MlGDsI3KA19i3I5H4Lu74wDkew+/3fGKZ5n67gAtKuOA8R1TunFl+NpRk
         uSxtHBltX+QBza7C2ve2d+oVYidlJYBdvge97iXVjqaMBMQgT2lw36M/xlMvHn9Pzc13
         at++C/VK8K/WsholIOdpOBoijbSs9Kl877G7H19GNYV7KgjcTpmoXly08BIyAxhLDOmy
         ZdDygntNVAAq8ppYL2FPVJqMnvrJ9Vabs54hm0o9RI7gRX6dElTw2zvPBvITaImqYsRn
         tssmK/4HBWj4QmExX1CRw7mG6THQHBqOyyctEzP53PTLZMVCqzKOeowncqw31wb2UB1e
         xI5w==
X-Gm-Message-State: APjAAAWr6kiJxrGNBDqWGttJK5EgUBIUidU04p2PYI7K3xuW/YGqdJFc
        4Dp6HEjNLqa5qQuj7++GzQ==
X-Google-Smtp-Source: APXvYqzj4kur/33FK2sd//f66BtsRFHAy4do5i9dVlNwbGf5OzP49TJkH5CgWCvXWaooiVa5ktHY5w==
X-Received: by 2002:aca:cdc3:: with SMTP id d186mr9834094oig.162.1570744563038;
        Thu, 10 Oct 2019 14:56:03 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id o23sm2108179ote.67.2019.10.10.14.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2019 14:56:02 -0700 (PDT)
Date:   Thu, 10 Oct 2019 16:56:01 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Falkowski <m.falkowski@samsung.com>
Subject: Re: [PATCH v2] dt-bindings: sound: Convert Samsung Exynos5433 TM2(E)
 audio complex with WM5110 codec to dt-schema
Message-ID: <20191010215601.GA24757@bogus>
References: <CGME20190926120221eucas1p1a11b4182b93b408d5d5507dc65c951b4@eucas1p1.samsung.com>
 <20190926120210.8544-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190926120210.8544-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, Sep 26, 2019 at 02:02:10PM +0200, Marek Szyprowski wrote:
> From: Maciej Falkowski <m.falkowski@samsung.com>
> 
> Convert Samsung Exynos5433 TM2(E) audio complex with WM5110 codec to
> newer dt-schema format.
> 
> Signed-off-by: Maciej Falkowski <m.falkowski@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> v2:
> - Added type and description and removed number of items from 'model' property.
> 
> Best regards,
> Maciej Falkowski
> ---
>  .../bindings/sound/samsung,tm2-audio.txt      | 42 ----------
>  .../bindings/sound/samsung,tm2-audio.yaml     | 84 +++++++++++++++++++
>  2 files changed, 84 insertions(+), 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2-audio.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/samsung,tm2-audio.yaml

> diff --git a/Documentation/devicetree/bindings/sound/samsung,tm2-audio.yaml b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.yaml
> new file mode 100644
> index 000000000000..62b5b9a1dec0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/samsung,tm2-audio.yaml
> @@ -0,0 +1,84 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/samsung,tm2-audio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Samsung Exynos SoC Exynos5433 TM2(E) audio complex with WM5110 codec
> +
> +maintainers:
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +  - Sylwester Nawrocki <s.nawrocki@samsung.com>
> +
> +properties:
> +  compatible:
> +    const: samsung,tm2-audio
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: The user-visible name of this sound complex.
> +
> +  audio-codec:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/phandle-array
> +      - items:

This way works, but we get better error messages if you move this up to 
'allOf' level. IOW, only the $ref has to be under an 'allOf'.

> +          - description: |
> +              phandle of the wm5110 audio codec node,
> +              as described in ../mfd/arizona.txt;
> +          - description: phandle of the HDMI transmitter node.
> +
> +  i2s-controller:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/phandle-array
> +      - items:
> +          - description: phandle of the I2S0.
> +          - description: phandle of the I2S1.
> +
> +  audio-amplifier:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: phandle of the MAX98504 amplifier.
> +
> +  samsung,audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: |
> +      List of the connections between audio components.
> +      Each entry is a pair of strings, the first being the
> +      connection's sink, the second being the connection's
> +      source. Valid names for sources and sinks are
> +      the WM5110's and MAX98504's pins and the jacks on the
> +      board: HP, SPK, Main Mic, Sub Mic, Third Mic, Headset Mic.

Please enumerate the possible strings.

> +
> +  mic-bias-gpios:
> +    description: GPIO pin that enables the Main Mic bias regulator.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - model
> +  - audio-codec
> +  - i2s-controller
> +  - audio-amplifier
> +  - samsung,audio-routing
> +  - mic-bias-gpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    sound {
> +        compatible = "samsung,tm2-audio";
> +        model = "wm5110";
> +        audio-codec = <&wm5110>, <&hdmi>;
> +        i2s-controller = <&i2s0 0>, <&i2s1 0>;
> +        audio-amplifier = <&max98504>;
> +        mic-bias-gpios = <&gpr3>;
> +        samsung,audio-routing =
> +                "HP", "HPOUT1L",
> +                "HP", "HPOUT1R",
> +                "SPK", "SPKOUT",
> +                "SPKOUT", "HPOUT2L",
> +                "SPKOUT", "HPOUT2R",
> +                "Main Mic", "MICBIAS2",
> +                "IN1R", "Main Mic";
> +    };
> +
> -- 
> 2.17.1
> 
> 
> 
