Return-Path: <linux-samsung-soc+bounces-2877-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AD58B20D8
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Apr 2024 14:03:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93F4F1F251A8
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Apr 2024 12:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E700A12BEA4;
	Thu, 25 Apr 2024 12:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bzEEEkKb"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AB712AADC
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2024 12:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714046581; cv=none; b=OMpSYF8UAEBFZ3BdOLwf8PyBTdmuZH8S5pcGAh22Dxd/QQibI7U1AOexVJYb6MCFS0px2OXoCyhGfh+TAUgSoMlUUYcTLncadxKGZlaYqf+fys2K2fqkDWI/S3gohFkQDEFstOMAPuNa5c9uveEu4PpeYL3+roihBhNHUbjQlUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714046581; c=relaxed/simple;
	bh=jphqvKLIukinGvb9JMFC352rTpP7/8VXNF6oX6moPJg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=duK2/1pRTTOOXs2D2Tni7Mblbe5vV/J7f5TmFeOuguHWnuhKvtOFF3Vvgo73c0/n60FWs4jWPouyyNtTuF2zOUJr6pw8UWFVtAKSpn8EuJ2GCvijXYqknI72C88SIaPGkvEpy5M/jvgdG5nm9ue2witiyNngse1G+r3jU00Ng18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bzEEEkKb; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-343d7ff2350so725589f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Apr 2024 05:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714046578; x=1714651378; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AZtgfXbbk2xQsw1Lmj4dmQHGao3EmNipVbMSfwpwCWw=;
        b=bzEEEkKbvW6eGqugSTDMMWOARDxCjrBsB73AuYu3mBKufCDyBoIybIf87+O8o/cYlo
         8dnUdZWz7hHWcsuR391z2Ojkb/pqqxZqlQCHdC9bYZibdNsvuloWttCqT6b+XqmLs4Uv
         48OkKDEBz208iJOfdVhxV5zKokj68aeJKRxLGZ6kpVaNuokK5jDs2vFgsAlG3QyMuBq5
         VwKvIsDJBDYPid3YjzSDE2MX8GJsE1DbbKcCmdBGjKYCi93pw9si3bzybCHJJSzcPQ9a
         WcWzOPre5zrY/q+I0opcdwYUupRIXZA/bVJR06FpAjSm/HHD48shBQnHYzjWRnbAbEMz
         2zFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714046578; x=1714651378;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AZtgfXbbk2xQsw1Lmj4dmQHGao3EmNipVbMSfwpwCWw=;
        b=eBJ43BvvkdVjf3SkFjlMSB1AzlQZQoon8e21Ibm1Vuq/H3yPF1ScR8GGAXxjE0DERk
         twCysN0GLvYWPFhf4fzScGMt/7SF08n81XieuzYzxTTEW1nbmWPzOmi+v5oowd0v88Rj
         pqVdcigCDlTozqEXE2qDkpNeVNJ7IzmgmDs2C57Ey78VeVrUZECqcHuS8ZBKnWcwpnWQ
         AVlvOYjZ0BpUE9jy3Il8FPEDdhC8ZBUSQzGPzAcmIjOjaj8Zxhgv2BWALgOjsyVOQE37
         /7a5bNGvT3XY1vB9LincjHcBIQ2cAq5+5ekcsTrJG1E3IsUebEUfndZlbIThvN7BPB9p
         lzXw==
X-Forwarded-Encrypted: i=1; AJvYcCVRn1j1jCRS0UBUfuazBkjCYk+kBW855+3XCcqBgLSOrd2xoUCdtJb3xVjN76fYiVKWhVn3vuh3laYaQYP8U+XzNyjw9cM769iXwzT8ROzqY0k=
X-Gm-Message-State: AOJu0YxCasEK/Z12zCdlkocPcELyXhh061NAo7UmCwYUBdwmOfw8Z2iN
	mENnYzx4kjfPMERf+TzLw7xlrt2WlTqrZ9DORWR394OxfzOom78hh4YD9Bs36P4=
X-Google-Smtp-Source: AGHT+IEzZdSed4XOrE4rETuECmfdaxcVqf4C7+1LXgTcZDv2J71RTHhX+CpK/z2WbiePkXS0N6SWDw==
X-Received: by 2002:adf:eeca:0:b0:34b:147f:df67 with SMTP id a10-20020adfeeca000000b0034b147fdf67mr3840631wrp.53.1714046577733;
        Thu, 25 Apr 2024 05:02:57 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id w20-20020adfe054000000b0034a366f26b0sm18062178wrh.87.2024.04.25.05.02.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 05:02:57 -0700 (PDT)
Message-ID: <52403f522a4f7513c5ee5dae48856988f7141825.camel@linaro.org>
Subject: Re: [PATCH v2 06/14] arm64: dts: exynos: gs101: Add ufs, ufs-phy
 and ufs regulator dt nodes
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, mturquette@baylibre.com, 
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
  vkoul@kernel.org, kishon@kernel.org, alim.akhtar@samsung.com,
 avri.altman@wdc.com,  bvanassche@acm.org, s.nawrocki@samsung.com,
 cw00.choi@samsung.com,  jejb@linux.ibm.com, martin.petersen@oracle.com, 
 James.Bottomley@HansenPartnership.com, ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, tudor.ambarus@linaro.org, 
	saravanak@google.com, willmcvicker@google.com
Date: Thu, 25 Apr 2024 13:02:55 +0100
In-Reply-To: <20240423205006.1785138-7-peter.griffin@linaro.org>
References: <20240423205006.1785138-1-peter.griffin@linaro.org>
	 <20240423205006.1785138-7-peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-04-23 at 21:49 +0100, Peter Griffin wrote:
> Enable the ufs controller, ufs phy and ufs regulator in device tree.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0.../boot/dts/exynos/google/gs101-oriole.dts=C2=A0=C2=A0 | 18 ++++++=
++++
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101.dtsi=C2=A0 | 36 +++++++++++=
++++++++
> =C2=A02 files changed, 54 insertions(+)
>=20

[...]

> +
> +		ufs_0: ufs@14700000 {
> +			compatible =3D "google,gs101-ufs";
> +			reg =3D <0x14700000 0x200>,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x14701100 0x200>,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x14780000 0xa000>,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <0x14600000 0x100>;
> +			reg-names =3D "hci", "vs_hci", "unipro", "ufsp";
> +			interrupts =3D <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&cmu_hsi2 CLK_GOUT_HSI2_UFS_EMBD_I_ACLK>,
> +				 <&cmu_hsi2 CLK_GOUT_HSI2_UFS_EMBD_I_CLK_UNIPRO>,
> +				 <&cmu_hsi2 CLK_GOUT_HSI2_UFS_EMBD_I_FMP_CLK>,
> +				 <&cmu_hsi2 CLK_GOUT_HSI2_QE_UFS_EMBD_HSI2_ACLK>,
> +				 <&cmu_hsi2 CLK_GOUT_HSI2_QE_UFS_EMBD_HSI2_PCLK>,
> +				 <&cmu_hsi2 CLK_GOUT_HSI2_SYSREG_HSI2_PCLK>;
> +			clock-names =3D "core_clk", "sclk_unipro_main", "fmp",
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "ufs_aclk", "ufs_pclk", "sysreg";
> +			freq-table-hz =3D <0 0>, <0 0>, <0 0>, <0 0>, <0 0>, <0 0>;
> +			pinctrl-names =3D "default";
> +			pinctrl-0 =3D <&ufs_rst_n &ufs_refclk_out>;

The preferred order is pinctrl-0 before pinctrl-names (similar to clock-nam=
es and reg-names).

Other than that,

Acked-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>


