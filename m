Return-Path: <linux-samsung-soc+bounces-5282-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 351539C1DEA
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  8 Nov 2024 14:27:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 394A4286BEA
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  8 Nov 2024 13:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20F651F473E;
	Fri,  8 Nov 2024 13:25:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XFdurxkY"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51531F4731;
	Fri,  8 Nov 2024 13:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731072358; cv=none; b=XZQnKFdp5mFtkrubydRMuhan1cJo15rWnuoWSSW2hMnTCzICl3vg0LWRUgur/C1NCWg0pYt7so3+YY5fXtXXegLJcOcIgRR/XlFeK8jo8x27WvTa1TXeV9CshSUfpcISVXTnqZ8OjL36XamhxOkVCVom4hUkLX1ywJsKOTaq+WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731072358; c=relaxed/simple;
	bh=NzSq40S6H+m4dnAmAcZuf6YkgbbLPdnr4BQb58vYOGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UAMmfhyOvRyeTVkLhuJgE2FRy8SAaWwb/ka7FgXR4WvgajgVHmYG8IzvfBvMbv5ehiVXiXz9icJHeNERQIlK3/fmxbo2ZnkJTcEgZT8OLP0YY6aT07R82RIrxnLnbbF42deJBgh17FILeEaUA0qSX0Ne3pxWJDrVfsZOMNHBxSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XFdurxkY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89401C4CECD;
	Fri,  8 Nov 2024 13:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731072357;
	bh=NzSq40S6H+m4dnAmAcZuf6YkgbbLPdnr4BQb58vYOGM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=XFdurxkYvKi1gWfdNIvzLVGxk/Uqza5d3A8eIMm6gJ03xk35RWiKxaxmHpNQmc2Qy
	 qaCzetXqysLRkCzBuqFAgDWbyZqoa2tx2oV/ovEKKSPb9ICLFm/RSuv6sNuhBt3ZIf
	 OApeYLOx2T1eUdRo45vTgCHilzIilkhH5rgu4a6dMowX+BzCWMZz6a5aT4t+TV2Zck
	 MpV+ZmZ35gO8+xpTeDhiwF2fk91h1Ftwvzlvk7lx5HUON1s8y7VPNZdjUJMsysFYUP
	 NPXtqHLPVXSFew5515EH3EAYVSNnWffFjvvVb9YFYn6LsIWQqXdTjmTirgPMkjxYkr
	 LSVupMRJPRL0Q==
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e28fea0f5b8so2065361276.1;
        Fri, 08 Nov 2024 05:25:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVe17XJhvL3EGXqwXEVxjmkVhhxguXsE2CmkLPGTkEMKHsZmukLHCTvYnVD2mm61dBlpFaTRsQrNtBq@vger.kernel.org, AJvYcCW8cTh1QyZA53C4kPi6ESQeaEw8vwP7OcMIWNgo7yK8HMpNLbEnLyu48s4H8MYmlELbLKaCeUiF+q16+d95YD6VtdU=@vger.kernel.org, AJvYcCWrck6anOQ8QL0CSBR9L7QreLoC6AbunHaUHfJOx6Mpn8oqoRB0Qy6O9aH1clB+YWXIu21EjEzE6CsDLJza@vger.kernel.org
X-Gm-Message-State: AOJu0YxQQl9VGx6CeAq48wtwZ8z5Naa16EnafRrGzAaNFs3G2wE/Usez
	lVdspoktf/Rs+wVoWosN+Q6GSbnEs1f1MY+Lov24TABJvnDTIbp9TvP+C/UnFm/dqVfF6ubPUES
	j1sJYjr5gCui4JA8jyRdjKq5tZA==
X-Google-Smtp-Source: AGHT+IECg00zLeoZ7chYyzWrNyzbjVBp5fXiBM7C5rv6DO8E9sfe7abtHoShDgzkiCqMR2bwkofkYHrLBTHioxg/VZQ=
X-Received: by 2002:a05:6902:144d:b0:e33:1486:79d6 with SMTP id
 3f1490d57ef6-e337f8819afmr2745576276.26.1731072356758; Fri, 08 Nov 2024
 05:25:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20241108110444eucas1p20cbed7533af31573dac30dbb435c3d9d@eucas1p2.samsung.com>
 <20241106171028.3830266-1-robh@kernel.org> <3706d174-fadd-485f-be7b-f7ef4b11cf84@samsung.com>
In-Reply-To: <3706d174-fadd-485f-be7b-f7ef4b11cf84@samsung.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 8 Nov 2024 07:25:45 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKpv73RXLhdgox5gjxRUdaP7TVQyMs5rur+Ac=S4OtEFw@mail.gmail.com>
Message-ID: <CAL_JsqKpv73RXLhdgox5gjxRUdaP7TVQyMs5rur+Ac=S4OtEFw@mail.gmail.com>
Subject: Re: [PATCH v2] of: WARN on deprecated #address-cells/#size-cells handling
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 8, 2024 at 5:04=E2=80=AFAM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Rob,
>
> On 06.11.2024 18:10, Rob Herring (Arm) wrote:
> > While OpenFirmware originally allowed walking parent nodes and default
> > root values for #address-cells and #size-cells, FDT has long required
> > explicit values. It's been a warning in dtc for the root node since the
> > beginning (2005) and for any parent node since 2007. Of course, not all
> > FDT uses dtc, but that should be the majority by far. The various
> > extracted OF devicetrees I have dating back to the 1990s (various
> > PowerMac, OLPC, PASemi Nemo) all have explicit root node properties. Th=
e
> > warning is disabled for Sparc as there are known systems relying on
> > default root node values.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > v2:
> >   - Add a define for excluded platforms to help clarify the intent
> >     is to have an exclude list and make adding platforms easier.
> >   - Also warn when walking parent nodes.
> > ---
> >   drivers/of/base.c | 28 ++++++++++++++++++++++------
> >   drivers/of/fdt.c  |  4 ++--
> >   2 files changed, 24 insertions(+), 8 deletions(-)
>
> This patch landed in today's linux-next as commit 4b28a0dec185 ("of:
> WARN on deprecated #address-cells/#size-cells handling"). In my tests I
> found that it introduces warnings on almost all of my test systems. I
> took a look at the first one I got in my logs (Samsung Exynos Rinato
> board: arch/arm/boot/dts/samsung/exynos3250-rinato.dts):

Thanks for the report. Let me know if any others have a different
backtrace. Also, since it's a WARN_ONCE, fixing one case could expose
others.

> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 1 at drivers/of/base.c:107
> of_bus_n_addr_cells+0x98/0xcc
> Missing '#address-cells' in /soc/system-controller@10020000
> Modules linked in:
> CPU: 1 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> 6.12.0-rc6-next-20241108 #9360
> Hardware name: Samsung Exynos (Flattened Device Tree)
> Call trace:
>   unwind_backtrace from show_stack+0x10/0x14
>   show_stack from dump_stack_lvl+0x68/0x88
>   dump_stack_lvl from __warn+0x150/0x1dc
>   __warn from warn_slowpath_fmt+0x128/0x1b0
>   warn_slowpath_fmt from of_bus_n_addr_cells+0x98/0xcc
>   of_bus_n_addr_cells from of_bus_default_flags_match+0x8/0x18
>   of_bus_default_flags_match from of_match_bus+0x28/0x58
>   of_match_bus from __of_get_address+0x3c/0x1c8
>   __of_get_address from __of_address_to_resource.constprop.2+0x3c/0x1e8
>   __of_address_to_resource.constprop.2 from of_device_alloc+0x54/0x164
>   of_device_alloc from of_platform_device_create_pdata+0x60/0xfc
>   of_platform_device_create_pdata from of_platform_bus_create+0x1b0/0x4dc
>   of_platform_bus_create from of_platform_populate+0x80/0x114
>   of_platform_populate from devm_of_platform_populate+0x50/0x98
>   devm_of_platform_populate from exynos_pmu_probe+0x12c/0x284
>   exynos_pmu_probe from platform_probe+0x80/0xc0
>   platform_probe from really_probe+0x154/0x3ac
>   really_probe from __driver_probe_device+0xa0/0x1d4
>   __driver_probe_device from driver_probe_device+0x30/0xd0
>   driver_probe_device from __device_attach_driver+0xbc/0x11c
>   __device_attach_driver from bus_for_each_drv+0x74/0xc0
>   bus_for_each_drv from __device_attach+0xec/0x1b4
>   __device_attach from bus_probe_device+0x8c/0x90
>   bus_probe_device from device_add+0x56c/0x77c
>   device_add from of_platform_device_create_pdata+0xac/0xfc
>   of_platform_device_create_pdata from of_platform_bus_create+0x1b0/0x4dc
>   of_platform_bus_create from of_platform_bus_create+0x218/0x4dc
>   of_platform_bus_create from of_platform_populate+0x80/0x114
>   of_platform_populate from of_platform_default_populate_init+0xc0/0xd0
>   of_platform_default_populate_init from do_one_initcall+0x6c/0x328
>   do_one_initcall from kernel_init_freeable+0x1c8/0x218
>   kernel_init_freeable from kernel_init+0x1c/0x12c
>   kernel_init from ret_from_fork+0x14/0x28
> Exception stack(0xe0045fb0 to 0xe0045ff8)
> ...
> ---[ end trace 0000000000000000 ]---
>
> To silence the above warning and the rest of them on this board I had to
> do the following change:
>
> diff --git a/arch/arm/boot/dts/samsung/exynos3250.dtsi
> b/arch/arm/boot/dts/samsung/exynos3250.dtsi
> index b6c3826a9424..c09afbcd1cab 100644
> --- a/arch/arm/boot/dts/samsung/exynos3250.dtsi
> +++ b/arch/arm/boot/dts/samsung/exynos3250.dtsi
> @@ -347,6 +347,8 @@ pmu_system_controller: system-controller@10020000 {
>                          reg =3D <0x10020000 0x4000>;
>                          interrupt-controller;
>                          #interrupt-cells =3D <3>;
> +                       #size-cells =3D <0>;
> +                       #address-cells =3D <0>;
>                          interrupt-parent =3D <&gic>;
>                          clock-names =3D "clkout8";
>                          clocks =3D <&cmu CLK_FIN_PLL>;
> @@ -615,6 +617,8 @@ pdma1: dma-controller@12690000 {
>                  adc: adc@126c0000 {
>                          compatible =3D "samsung,exynos3250-adc";
>                          reg =3D <0x126c0000 0x100>;
> +                       #size-cells =3D <0>;
> +                       #address-cells =3D <0>;
>                          interrupts =3D <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>=
;
>                          clock-names =3D "adc", "sclk";
>                          clocks =3D <&cmu CLK_TSADC>, <&cmu CLK_SCLK_TSAD=
C>;
>
> I'm not a device tree expert, but for me this size/address cells
> requirement for nodes, which don't have addressable children looks a bit
> excessive. I bet, that if it was really needed from specification point
> of view, Krzysztof would already add it to Samsung Exynos dtsi/dts, as
> he spent quite a lot of time making them conformant with the spec.
> Krzysztof, could you comment on this?

No, you shouldn't need them and that's in fact a warning if you do.

I'm going to fold in the following fix which should fix the warning:

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 824bb449e007..f21f4699df7a 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -333,7 +333,8 @@ static unsigned int of_bus_isa_get_flags(const __be32 *=
addr)

 static int of_bus_default_flags_match(struct device_node *np)
 {
-       return of_bus_n_addr_cells(np) =3D=3D 3;
+       /* Check for presence first since of_bus_n_addr_cells() will
walk parents */
+       return of_property_present(np, "#address-cells") &&
(of_bus_n_addr_cells(np) =3D=3D 3);
 }

 /*
@@ -701,16 +702,16 @@ const __be32 *__of_get_address(struct
device_node *dev, int index, int bar_no,
        if (strcmp(bus->name, "pci") && (bar_no >=3D 0))
                return NULL;

-       bus->count_cells(dev, &na, &ns);
-       if (!OF_CHECK_ADDR_COUNT(na))
-               return NULL;
-
        /* Get "reg" or "assigned-addresses" property */
        prop =3D of_get_property(dev, bus->addresses, &psize);
        if (prop =3D=3D NULL)
                return NULL;
        psize /=3D 4;

+       bus->count_cells(dev, &na, &ns);
+       if (!OF_CHECK_ADDR_COUNT(na))
+               return NULL;
+
        onesize =3D na + ns;
        for (i =3D 0; psize >=3D onesize; psize -=3D onesize, prop +=3D one=
size, i++) {
                u32 val =3D be32_to_cpu(prop[0]);

