Return-Path: <linux-samsung-soc+bounces-231-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B974C7FD150
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 29 Nov 2023 09:48:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E4942B211EA
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 29 Nov 2023 08:48:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44B4A125AF;
	Wed, 29 Nov 2023 08:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E53B0;
	Wed, 29 Nov 2023 00:47:55 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5cbcfdeaff3so66495557b3.0;
        Wed, 29 Nov 2023 00:47:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701247675; x=1701852475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLerLul424y9KF+UL/6zr3ivEhD1RgHSR/3xjytvLS8=;
        b=ZkemoQjO/bBTd8d+LsdUMD4ToLFvR20uTycUuPxASEp1Wv2jracDpJVgxuRhBKgrEe
         Dv8UdOCyYtn4jolKAK4sP6RSsPGdC2iMkUPZ0S5x5T3GOJUs4mGd0o+GP3c0bN61YS+v
         reWI8SIzVw3ops8uEEJRZuKt+F021WhZYGbnzgWtzawtgIzARNp5p2IpIdcWRxPw1inS
         KX4TqE7nxu4NOKRYqZzv7i4LINXvhKAjvbWkAOH0idqiR1rbe5WeryFNRl3ruKGmXupS
         XotY6M5C+57zYE9/5WtXUVdimrFItNhI8//XtzhFOi2crDcWuQgN+HmH5Zy2mNAS+S/g
         RlDA==
X-Gm-Message-State: AOJu0YwhAMu2qlqPqdc4Z90/V5/ZBk4IYYMRuHFYGGJUPwSY2LlQlfYj
	1fLzznAmzfiVy805JgkGlhzy5QFijUR+NA==
X-Google-Smtp-Source: AGHT+IHIJ2CnpACRf14tRnG90JPNWlW5HmFEZrLCws+3jYIXscmZFWQC37s6lXP2Vkxf3COSceFtOw==
X-Received: by 2002:a0d:cbd0:0:b0:5ce:9d68:2b81 with SMTP id n199-20020a0dcbd0000000b005ce9d682b81mr14200254ywd.28.1701247674706;
        Wed, 29 Nov 2023 00:47:54 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id t184-20020a8183c1000000b005cb7fccffe2sm4409502ywf.126.2023.11.29.00.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 00:47:54 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-db49ab94768so3541001276.2;
        Wed, 29 Nov 2023 00:47:54 -0800 (PST)
X-Received: by 2002:a25:3d1:0:b0:db4:47e1:407d with SMTP id
 200-20020a2503d1000000b00db447e1407dmr16074846ybd.60.1701247673674; Wed, 29
 Nov 2023 00:47:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231125184422.12315-1-krzysztof.kozlowski@linaro.org> <ZWboWqELHbIrblnz@francesco-nb.int.toradex.com>
In-Reply-To: <ZWboWqELHbIrblnz@francesco-nb.int.toradex.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Nov 2023 09:47:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVSAgihFAuPecyrR+Wvzqr58z_fkWkShOSu+HnHzZnW2g@mail.gmail.com>
Message-ID: <CAMuHMdVSAgihFAuPecyrR+Wvzqr58z_fkWkShOSu+HnHzZnW2g@mail.gmail.com>
Subject: Re: [PATCH v3] docs: dt-bindings: add DTS Coding Style document
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>, 
	Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jonathan Corbet <corbet@lwn.net>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michal Simek <michal.simek@amd.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Francesco,

On Wed, Nov 29, 2023 at 8:29=E2=80=AFAM Francesco Dolcini <francesco@dolcin=
i.it> wrote:
> On Sat, Nov 25, 2023 at 07:44:22PM +0100, Krzysztof Kozlowski wrote:
> > Document preferred coding style for Devicetree sources (DTS and DTSI),
> > to bring consistency among all (sub)architectures and ease in reviews.
>
> Thank Krzysztof, we had most of this collected as BKM in some internal
> documents and it's great to see the effort to consolidate this and add
> it to the kernel documentation.
>
> > ---
> > +Following order of properties in device nodes is preferred:
> > +
> > +1. compatible
> > +2. reg
> > +3. ranges
> > +4. Standard/common properties (defined by common bindings, e.g. withou=
t
> > +   vendor-prefixes)
> > +5. Vendor-specific properties
> > +6. status (if applicable)
> > +7. Child nodes, where each node is preceded with a blank line
>
> On point 4, do you have a more explicit way to define what is an actual
> standard/common property? You mention the vendor-prefixes as an example,
> is this just an example or this is the whole definition?

I think there are three classes of standard properties:
  1. Device Tree Specification (from devicetree.org)
  2. dt-schema
  3. Common subsystem bindings (Documentation/devicetree/bindings/)
     (may be moved to 2).

> What would be the order for this for example (from an existing DTS file)?
>
>         reg_sdhc1_vmmc: regulator-sdhci1 {
>                 compatible =3D "regulator-fixed";
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&pinctrl_sd1_pwr_en>;
>                 enable-active-high;
>                 gpio =3D <&main_gpio0 29 GPIO_ACTIVE_HIGH>;
>                 off-on-delay-us =3D <100000>;
>                 regulator-max-microvolt =3D <3300000>;
>                 regulator-min-microvolt =3D <3300000>;
>                 regulator-name =3D "+V3.3_SD";
>                 startup-delay-us =3D <2000>;
>         };
>
> I guess the point that is not obvious to me here is where do we want
> pinctrl. I like it at position between 3 and 4, the rationale is that is
> a very frequent property and this way it will be in a similar place for
> every node.

The pinctrl properties are only present in board DTS files, not in
SoC DTSi files.  There are two classes of them:
  1. Extension of on-SoC devices, where they are added to already
     existing nodes, defined in the SoC DTSi files, e.g. (from the same
     existing DTS file):

         &cpsw3g {
                 pinctrl-names =3D "default";
                 pinctrl-0 =3D <&pinctrl_rgmii1>;
                 status =3D "disabled";
         };

  2. Pure board devices, in new nodes (e.g. your regulator example).
     These are less common, so I don't even know from the top of my
     mind when I last added one, and where ;-)
     I'd guess after all standard properties?

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

