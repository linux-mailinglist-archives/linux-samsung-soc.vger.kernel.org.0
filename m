Return-Path: <linux-samsung-soc+bounces-698-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 72755813544
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 14 Dec 2023 16:51:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C7CF1F21C8F
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 14 Dec 2023 15:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B97325D913;
	Thu, 14 Dec 2023 15:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zp9XedpY"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C59D126
	for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Dec 2023 07:51:41 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-28aedba3641so944375a91.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Dec 2023 07:51:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702569100; x=1703173900; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C4shbPEqVxkGN9H1B1A5vAGpPP6O8/awx28j2SHUPR0=;
        b=Zp9XedpY8de2Q6nzf08cJFKD8lVysD4gbtzSuUyzRBBi1oew3netCqW2f/Ebry/7gv
         9LmB1uhd3JKlAMbPQ/7EFAE1SqOdO2/SDV1ICL7q9KXh0KKNcSoqJnKASNxsqTkC/JRp
         NgAuvJGw2UOtMDGDVzxl6dzu3PsRiDVJ7v9aCukx3j4Enx0HpikUaNkU3LGE7egNgEFX
         5udDHJOAk0W4xdkLFSoSdRxDLOSFXsR0hraMnb6e1Ul744nnh8wooAKnaJ9ODjZbR7uE
         zey7WBMAR4Ey8SmQUy/FlRLu5vivsDaPBQxS6DLg7aluRecEjPWgZQQImSDm5/KPAJy8
         FaFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702569100; x=1703173900;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C4shbPEqVxkGN9H1B1A5vAGpPP6O8/awx28j2SHUPR0=;
        b=svHNw7JvjMLFFNKPn0KPiaiGgsNyzY6vFf3Ln3VIVYnyZMsRS4ZMvQkmIV8pHYj5Dy
         oH2cieGVxsOw3gTRRI0WlMwQFoT5Du6VjtE4QB8A8yyGyizYZqtl6uu/G1AN6DD+XgAJ
         KpNc/eHhNohBHEbkl9n7U4dZ9uXz6Nyrg/lSg9oKWm+aMU92SONQl4dvCJRac1M/zVfc
         +9sAhA7G0nIrvVUdmlqgXij3TAEpg/QWMM49DAp7YsC5bgvfpiAbHlRfOHpzoKhMiAPw
         Amw4xkPHL6TxUTj3Xbb19T/X+Rt8XD8qvV8ocajNbyucJP0NWuXwRKwIOO+g2THjyKT5
         tkvw==
X-Gm-Message-State: AOJu0YzMKG5c8OAPVTubmyFINwLy120TOc2zj0qlK+zmTvmO8quv1CFN
	z22JmJ0u+fovu08i2/CYPApPXFRKUSBzL2u2G5Ybzg==
X-Google-Smtp-Source: AGHT+IEcLyIBjCeACmNKHeqZ9hHHJ2Q7TjC4blb+sKMEqy3oaRC2aQn0Nv8MggtFAhmMpCa9dnIxmORX9rGbyNPaNqU=
X-Received: by 2002:a17:90a:1b8b:b0:286:6cc1:268 with SMTP id
 w11-20020a17090a1b8b00b002866cc10268mr4586020pjc.51.1702569100651; Thu, 14
 Dec 2023 07:51:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org> <20231214105243.3707730-11-tudor.ambarus@linaro.org>
In-Reply-To: <20231214105243.3707730-11-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 14 Dec 2023 09:51:29 -0600
Message-ID: <CAPLW+4nKgAN2_dE1-28KbAobR55pr2RzKD1fjA2WN2A-tQ4MpA@mail.gmail.com>
Subject: Re: [PATCH 10/13] arm64: dts: exynos: gs101: define USI8 with I2C configuration
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
	conor+dt@kernel.org, andi.shyti@kernel.org, alim.akhtar@samsung.com, 
	gregkh@linuxfoundation.org, jirislaby@kernel.org, catalin.marinas@arm.com, 
	will@kernel.org, s.nawrocki@samsung.com, tomasz.figa@gmail.com, 
	cw00.choi@samsung.com, arnd@arndb.de, andre.draszik@linaro.org, 
	saravanak@google.com, willmcvicker@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 4:53=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> USI8 I2C is used to communicate with an eeprom found on the battery
> connector. Define USI8 in I2C configuration.
>
> USI8 CONFIG register comes with a 0x0 reset value, meaning that USI8
> doesn't have a default protocol (I2C, SPI, UART) at reset. Thus the
> selection of the protocol is intentionally left for the board dtsi file.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 26 ++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index ffb7b4d89a8c..4ea1b180cd0a 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -354,6 +354,32 @@ pinctrl_peric0: pinctrl@10840000 {
>                         interrupts =3D <GIC_SPI 625 IRQ_TYPE_LEVEL_HIGH 0=
>;
>                 };
>
> +               usi8: usi@109700c0 {
> +                       compatible =3D "google,gs101-usi",
> +                                    "samsung,exynos850-usi";
> +                       reg =3D <0x109700c0 0x20>;
> +                       ranges;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +                       clocks =3D <&cmu_peric0 CLK_DOUT_PERIC0_USI8_USI>=
,

Are you sure this is a leaf clock? Usually it's a GATE clock, not a DIV one=
.

> +                                <&cmu_peric0 CLK_GOUT_PERIC0_CLK_PERIC0_=
USI8_USI_CLK>;

Because of following letter-for-letter the crazy TRM clock namings,
now it's not possible to keep 80 characters length in a sane way :(

> +                       clock-names =3D "pclk", "ipclk";
> +                       samsung,sysreg =3D <&sysreg_peric0 0x101c>;

samsung,mode is not needed in this case?

> +                       status =3D "disabled";
> +
> +                       hsi2c_8: i2c@10970000 {
> +                               compatible =3D "google,gs101-hsi2c",
> +                                            "samsung,exynosautov9-hsi2c"=
;
> +                               reg =3D <0x10970000 0xc0>;
> +                               interrupts =3D <GIC_SPI 642
> +                                             IRQ_TYPE_LEVEL_HIGH 0>;

IRQ type constant can fit the previous line.

> +                               clocks =3D <&cmu_peric0 CLK_DOUT_PERIC0_U=
SI8_USI>,
> +                                        <&cmu_peric0 CLK_GOUT_PERIC0_CLK=
_PERIC0_USI8_USI_CLK>;
> +                               clock-names =3D "hsi2c", "hsi2c_pclk";
> +                               status =3D "disabled";

Pinctrl properties are not needed for this node?

> +                       };
> +               };
> +
>                 usi_uart: usi@10a000c0 {
>                         compatible =3D "google,gs101-usi",
>                                      "samsung,exynos850-usi";
> --
> 2.43.0.472.g3155946c3a-goog
>

