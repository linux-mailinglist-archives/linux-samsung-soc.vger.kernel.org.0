Return-Path: <linux-samsung-soc+bounces-696-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7C28134FF
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 14 Dec 2023 16:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11CDD282AE1
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 14 Dec 2023 15:39:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FE175D8F8;
	Thu, 14 Dec 2023 15:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CjorwqaM"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C74A1133
	for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Dec 2023 07:39:47 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-28b05a2490bso946837a91.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Dec 2023 07:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702568387; x=1703173187; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdjSPhIyB1xzNvePwzN4Lv4667HwZ9Mo32XFQbt5RU0=;
        b=CjorwqaMiPGQidFhMzoDJnRgw5CvHfMjnV0O3bnJ1c+7nfTT8pBgXYUBAx+xONuqdm
         PoEwNuy8OExz/JPKygfkdgYZqI62xgBpcHptaSsBD7UzDcOdBJ8geEagtvW2x0OisLMc
         2+6C5IWQ3kQRwZ5Ae1bxVUgZC9iqV3sAlbMg5SrmdF8sy9RU8NmZddpgmCMiFX5HGpss
         h/37tCS94e9A5xhiP6TepgZ0EDJP+pgXjAsXs0qxy9eA5LpW2jE2l0HUz2fC8wqWS8jE
         POMnLIdAjrxhbFAlj0BlUYT8iYQvMU5CVKrCpdB+osbkNAP8nswuTOepaVGcC6yfEH0M
         +ZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702568387; x=1703173187;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdjSPhIyB1xzNvePwzN4Lv4667HwZ9Mo32XFQbt5RU0=;
        b=HCjcui1/NWPY6RP73mshThMkfFF4ha0zA9nyDTjAHIgP4C0TJSeibJUVJI/kw+JVox
         xL4kxHVGLjJlJ4IYUOyR3NhTSaODQ5GxZplKVUK3V3k2fzspFJQj4qeD0dwd1/Tak9qr
         Qjak5+Na/8SMUW4TL+/VJySj6ukNWAtTPQmNTGBXm4nnPw/wFfxaKVtpqT8PUA9fKCTW
         RlWpCIYZc4jhsPfjuZ0zGgpSf+FVZXmyk7ZSi/gj5fOpglaT/1OIyj/v+p9DN+nh8XIb
         NqF50Y7kfQDlREgpg0/RMCkkzYGISMdfE3OHrGuofO0393MtKqDYqPHqhKDqZbBMydF/
         JFlg==
X-Gm-Message-State: AOJu0Yx1H0kkaxZgOyOWb6l35M+EASc2Qx8aBFFab5Pw9x9IRt1geox+
	eICkREtW6Puo0s4neLGhxudeROJQwlA5fmGNwdY2IA==
X-Google-Smtp-Source: AGHT+IGirM4+nryJ8CQwEZU0IegMIG64eLAF/7DoRqfynsZoP/h4uO2l7qynqj6arTSz3lMXlgfoKAyn+JsuJdyqzHo=
X-Received: by 2002:a17:90a:e50:b0:286:964d:c with SMTP id p16-20020a17090a0e5000b00286964d000cmr7480168pja.86.1702568387270;
 Thu, 14 Dec 2023 07:39:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org> <20231214105243.3707730-9-tudor.ambarus@linaro.org>
In-Reply-To: <20231214105243.3707730-9-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 14 Dec 2023 09:39:35 -0600
Message-ID: <CAPLW+4=bfcemh-dd7r9hOe0RbtC01+sNpj3ZMMfc8rMezKQfNA@mail.gmail.com>
Subject: Re: [PATCH 08/13] arm64: dts: exynos: gs101: enable cmu-peric0 clock controller
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

On Thu, Dec 14, 2023 at 4:52=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> Enable the cmu-peric0 clock controller. It feeds USI and I3c.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index 9747cb3fa03a..d0b0ad70c6ba 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -339,6 +339,18 @@ ppi_cluster2: interrupt-partition-2 {
>                         };
>                 };
>
> +               cmu_peric0: clock-controller@10800000 {
> +                       compatible =3D "google,gs101-cmu-peric0";
> +                       reg =3D <0x10800000 0x4000>;
> +                       #clock-cells =3D <1>;
> +                       clocks =3D <&ext_24_5m>,
> +                                <&cmu_top CLK_DOUT_CMU_PERIC0_BUS>,
> +                                <&cmu_top CLK_DOUT_CMU_PERIC0_IP>;
> +                       clock-names =3D "oscclk",
> +                                     "dout_cmu_peric0_bus",

I'd pull this line to the above line. Other than that:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

> +                                     "dout_cmu_peric0_ip";
> +               };
> +
>                 sysreg_peric0: syscon@10820000 {
>                         compatible =3D "google,gs101-peric0-sysreg", "sys=
con";
>                         reg =3D <0x10820000 0x10000>;
> --
> 2.43.0.472.g3155946c3a-goog
>

