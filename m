Return-Path: <linux-samsung-soc+bounces-160-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BB87FA272
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 27 Nov 2023 15:20:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 777CE1C20D41
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 27 Nov 2023 14:20:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3F6E315AF;
	Mon, 27 Nov 2023 14:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7B5D6FA2;
	Mon, 27 Nov 2023 06:20:06 -0800 (PST)
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-5cbcfdeaff3so42805607b3.0;
        Mon, 27 Nov 2023 06:20:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701094805; x=1701699605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8asMA5McnjUqiDsQhrdKj0am/206nD+kU8Fb3R8j7Q=;
        b=nwYLifb5c03uBSoGy08J+jk4kdSTzWG2HUdNOUK9Toymsx7FNnlAEISUAEKCULXlqi
         tA/+IdWgjUmuf/Rcij4uv0uwOOBWKluBdcZunKKqrcsnyjygTjxIyFi1i3/mwYIKw2ec
         69gRtE+3z5VZKi5HxeuuMmqBnLNddnzNOKMAef6ZQEWXTkGgp+356vO7DyHZYDRGeGzx
         Fcnfy10u5U+afWNGkfOZljZWS5rP0KxPMZcLpKK+Xh2qX91ukBA//5X6WC9R6QOVmWGk
         kgk/uU/Kh4dGzL7I8WpMh0HQl7OoicB9QVarh4C8n5SVo1tdf6dd5V3Lzr1/Tj4c1oAW
         8apQ==
X-Gm-Message-State: AOJu0YwaJcDUgbz1R/iFhh5FhfWvOspgkqE3s8D1wfhBiv73/U7sU0Hj
	rKnsRD3tFThRLPKxtwZUE7KevIwRevWq0qoG
X-Google-Smtp-Source: AGHT+IH5EZJ3JXP1ys8qvMygvedokqxnAV2ajL+xIX1xN5Tq5j5zb7onIkAN9QKV3wbGyR2XId9FTA==
X-Received: by 2002:a0d:d68c:0:b0:5a7:bfbf:691d with SMTP id y134-20020a0dd68c000000b005a7bfbf691dmr11601951ywd.42.1701094804463;
        Mon, 27 Nov 2023 06:20:04 -0800 (PST)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id v126-20020a818584000000b005c08cfb7cadsm3310487ywf.57.2023.11.27.06.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 06:20:04 -0800 (PST)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-5cc66213a34so42655617b3.1;
        Mon, 27 Nov 2023 06:20:03 -0800 (PST)
X-Received: by 2002:a0d:e207:0:b0:5a8:207b:48d with SMTP id
 l7-20020a0de207000000b005a8207b048dmr10958508ywe.11.1701094803713; Mon, 27
 Nov 2023 06:20:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231125184422.12315-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231125184422.12315-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Nov 2023 15:19:52 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUYEwMuxJ2Xx=KRVKneRT-e+uHz8LE1JVY5zLDkWksqKw@mail.gmail.com>
Message-ID: <CAMuHMdUYEwMuxJ2Xx=KRVKneRT-e+uHz8LE1JVY5zLDkWksqKw@mail.gmail.com>
Subject: Re: [PATCH v3] docs: dt-bindings: add DTS Coding Style document
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>, 
	Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Jonathan Corbet <corbet@lwn.net>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Michal Simek <michal.simek@amd.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Sat, Nov 25, 2023 at 7:44=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> Document preferred coding style for Devicetree sources (DTS and DTSI),
> to bring consistency among all (sub)architectures and ease in reviews.
>
> Cc: Andrew Davis <afd@ti.com>
> cc: Andrew Lunn <andrew@lunn.ch>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Chen-Yu Tsai <wens@kernel.org>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Konrad Dybcio <konrad.dybcio@linaro.org>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Michal Simek <michal.simek@amd.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Olof Johansson <olof@lixom.net>
> Cc: Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
> Acked-by: Heiko Stuebner <heiko@sntech.de>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
> ---
>
> Merging idea: Rob/DT bindings
>
> Changes in v3
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> 1. should->shall (Angelo)
> 2. Comments // -> /* (Angelo, Michal)
> 3. Use imaginary example in "Order of Properties in Device Node"
>    (Angelo)
> 4. Added paragraphs for three sections with justifications of chosen
>    style.
> 5. Allow two style of ordering overrides in board DTS: alphabetically or
>    by order of DTSI (Rob).
> 6. I did not incorporate feedback about, due to lack of consensus and my
>    disagreement:
>    a. SoM being DTS without DTSI in "Organizing DTSI and DTS"

Thanks for the update!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dts-coding-style.rst

> +       /* SoC DTSI */
> +
> +       / {
> +               cpus {
> +                       /* ... */
> +               };
> +
> +               psci {
> +                       /* ... */
> +               };
> +
> +               soc@ {

"soc@" is invalid, that should be "soc".

As the "soc" node is special, you may want to elaborate:

                compatible =3D "simple-bus";
                #address-cells =3D <1>;
                #size-cells =3D <1>;
                ranges;

> +                       dma: dma-controller@10000 {
> +                               /* ... */
> +                       };
> +
> +                       clk: clock-controller@80000 {
> +                               /* ... */
> +                       };
> +               };
> +       };
> +
> +       /* Board DTS - alphabetical order */
> +
> +       &clk {
> +               /* ... */
> +       };
> +
> +       &dma {
> +               /* ... */
> +       };
> +
> +       /* Board DTS - alternative order, keep as DTSI */
> +
> +       &dma {
> +               /* ... */
> +       };
> +
> +       &clk {
> +               /* ... */
> +       };

IMO that alternative order is hard to review: you need to have multiple
files open.  It will also make validation hard, as you can only validate
the end result, not individual files.

Anyway, this is already quite usable so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

