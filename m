Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F0827FC55
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  1 Oct 2020 11:17:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbgJAJRE (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 1 Oct 2020 05:17:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:54334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725894AbgJAJRE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Oct 2020 05:17:04 -0400
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DE0292087D;
        Thu,  1 Oct 2020 09:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601543824;
        bh=6tCffKGBRQz3g32yfl6DkyDrZEG2XbapbE2KKFd9bFs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=AN5SSI5U9O+gMSlLWJ7RJOfXa6uj3epvq3cELm3AS4w2TgnFg/ARJ99641p7wyjax
         /Vd1pJplNN2ZBYVbriQEJSC8YfpkG2CBaGDgmIngJsh0Ag3sfPb7VoR1NK/lBocqpU
         yjNKsTwUq4SwbS0IzKrXv0GFCXToU7BCaJFXEdYE=
Received: by mail-ej1-f54.google.com with SMTP id i26so6925998ejb.12;
        Thu, 01 Oct 2020 02:17:03 -0700 (PDT)
X-Gm-Message-State: AOAM532hCmnhb101TA0jGuVTQoLwBtmlg5LhmBWhmF7Bcq0UbFWc9uYE
        LR4pZV2Pd77fsatHlMQnRKoWT2qDnDfA5ZNgPZ0=
X-Google-Smtp-Source: ABdhPJx7RqEWMyME2IKnFfBCTPbZGoQbdgNCC9RgXX5fvV3JQrHTkEvY3um+08QeqrdUI5ekmiwWk7hCt1fKWvSIx/Y=
X-Received: by 2002:a17:906:82d1:: with SMTP id a17mr6907875ejy.385.1601543822483;
 Thu, 01 Oct 2020 02:17:02 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20201001083615eucas1p2886f47d032844823b419a92fa02994ad@eucas1p2.samsung.com>
 <20201001072236.GA4815@kozik-lap> <dleftjr1qigx6p.fsf%l.stelmach@samsung.com>
In-Reply-To: <dleftjr1qigx6p.fsf%l.stelmach@samsung.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 1 Oct 2020 11:16:48 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfghaFLruCJwkgoG0j_G6+EVZTPKY2MNsQ33CkxD2naxg@mail.gmail.com>
Message-ID: <CAJKOXPfghaFLruCJwkgoG0j_G6+EVZTPKY2MNsQ33CkxD2naxg@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: exynos: Add a placeholder for a MAC address
To:     Lukasz Stelmach <l.stelmach@samsung.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 1 Oct 2020 at 10:36, Lukasz Stelmach <l.stelmach@samsung.com> wrote=
:
>
> It was <2020-10-01 czw 09:22>, when Krzysztof Kozlowski wrote:
> > On Wed, Sep 30, 2020 at 04:31:51PM +0200, =C5=81ukasz Stelmach wrote:
> >> Add a placeholder for a MAC address. A bootloader may fill it
> >> to set the MAC address and override EEPROM settings.
> >>
> >> Signed-off-by: =C5=81ukasz Stelmach <l.stelmach@samsung.com>
> >> ---
> >>  arch/arm/boot/dts/exynos5422-odroidxu3.dts | 18 ++++++++++++++++++
> >>  1 file changed, 18 insertions(+)
> >>
> >> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3.dts b/arch/arm/boo=
t/dts/exynos5422-odroidxu3.dts
> >> index db0bc17a667b..9f7f3eacb750 100644
> >> --- a/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> >> +++ b/arch/arm/boot/dts/exynos5422-odroidxu3.dts
> >> @@ -70,3 +70,21 @@ &pwm {
> >>  &usbdrd_dwc3_1 {
> >>      dr_mode =3D "peripheral";
> >>  };
> >> +
> >> +&usbhost2 {
> >> +    #address-cells =3D <1>;
> >> +    #size-cells =3D <0>;
> >> +
> >> +    hub@1 {
> >> +            compatible =3D "usb8087,0024";
> >> +            reg =3D <1>;
> >> +            #address-cells =3D <1>;
> >> +            #size-cells =3D <0>;
> >> +
> >> +            ethernet: usbether@1 {
> >> +                    compatible =3D "usb0c45,6310";
> >> +                    reg =3D <1>;
> >> +                    mac-address =3D [00 00 00 00 00 00]; /* Filled in=
 by a bootloader */
> >
> > Why do you need a placeholder? U-Boot can just append the
> > address/property.
>
> Several other dts files have such placeholder
>
> git grep 'mac-addr.*\[00 00 00 00 00 00\]' arch/arm/boot/dts/ | wc -l
> 26

Yeah, but if this is cargo cult, then it is not a good reason. First of all=
,
git grep '[^-]mac-addr.*\[.*00 00 00 00 00 00.*\]' arch/arm/boot/dts/
gives just seven boards. Not a big number to make a standard. :)

The meaning of mac-address, I think, is not a placeholder, but:
"should be used in cases where the MAC address assigned to the device
by the boot program is different from the local-mac-address property."

I think you actually wanted a local-mac-address and the majority of
DTSes use it. Not mac-address.

>
> I can see two scenarios where this patch may be helpful. Another
> (simple) boot loading code might be used.

OK, good point. However other bootloader still has to adhere to the DT
specification and the bindings.

> The value may also be
> customized during build time and used without any support of a
> bootloader.

Yes, with an overlay. You do not need a placeholder for this and
actually having a placeholder instead of using overlays is the wrong
approach for customization of boots/builds.

> Finding and filling a placeholder would be easier in u-boot too.

U-Boot already has the code for updating mac-address or
local-mac-address so how is it easier for him? You mean that it cannot
find an ethernet node here?

> And it serves as a reference how to configure a USB device in a dts

Great places for references are examples in bindings.

Best regards,
Krzysztof
