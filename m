Return-Path: <linux-samsung-soc+bounces-2780-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6908A6A6B
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 16 Apr 2024 14:14:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 15CB0281A72
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 16 Apr 2024 12:14:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52AD412A163;
	Tue, 16 Apr 2024 12:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TgTsVXOy"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA09F12A177
	for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Apr 2024 12:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713269648; cv=none; b=TfI3Cohu/pHYp8PTmSNB96dw0Ax8esJVmWC+8Bk5K/GgUsR2eb0kLU5Xg/uXPop9w5QhH18a8D/T9x1056H26Lbpl+NdTmdl0pGqmLXSasjF+ibZKpKS0cnoIIbgLXk4mojnLb0abNql5w9WRfWsK2s+0h8QmZtxMP/FR6Z/aNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713269648; c=relaxed/simple;
	bh=48Gr5eNn+Ssi4i2JyFoZuqgowPbwgV2AjpZpW+lUl3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NJvYNZ0OH+5swrIxo15Za/72IZjUSuy7MJu8tdcKKkmEfgVl5H5gJl5HBoojhhSFEaQpG4Mh/BZeSBiUWtjTjKOan1m6LPQjOZa0L2raehXtKgCYtrXQcr0SDZgrN25iYwzGihNrx/ufsrGjnw2vYMFfo4sETxZWgRDeCsbSIn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TgTsVXOy; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5a9ec68784cso2592880eaf.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Apr 2024 05:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713269646; x=1713874446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6x8KfkMeFuCLUkF0VuQt50edEuiXuMJGbYVUcWevqo=;
        b=TgTsVXOy1BpfAVmNZd6pMis8Xm+uhVRYhI58Qf5crvUjjKkK2v9QVI4lbTBpSMDkdc
         pg1Rakbv+OYxgl3xZ88b3I60ow/heXASw5e0dysEHExpeoiAZdCIxAVD1WtzUnAR+yCd
         meOrqtKhi0Zpen295B1WWAqNwm9L7+waTIs/ZNjlwGwlFcjjdZ9CumLzTI+59roVspIL
         L3DYE/ADhw7hpVujQQpAUOsDq3n7CN1UWKyOXcQSHuWE9ZYCyb+ZXkMYq4WRrxjJRhKW
         N4eLvb+KucEpq7wDI2B8ZD2sTNJ2TeI2n06jtbZUFVAHCyrN8OJyuw8zkSJ9IDzYIcyq
         WU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713269646; x=1713874446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z6x8KfkMeFuCLUkF0VuQt50edEuiXuMJGbYVUcWevqo=;
        b=ALLvrcV4gCzKLgKJbPXUcbJnL3RnfOgZTW208Vg05dKsBVh46G56HwAbSElLeWBcGi
         KbFADV1F53SdmN08yEER6eUfRvyy1FxnLS/iaZSwp4PKgKZbdlLWhgdcYI6OXR5yFIkI
         JjTuUKffr72gA49r/rljjcNoiN5vlnNHnVHVlqZr7VepsrOYNjcsxvSU2k2fC9Ju6swe
         p/B89cyc28mR5tPXyNPZgVep7X4oAqzUEeiZ7l8vPGxqaG6loFkyf+u29WDPDioj2HBQ
         zptFnVJLoVfUOh/PJXxaHY5s7SfL8fTsyQYhAm0d42x0ic5P+bgb2Ws1dbH97vanzTgY
         XAzg==
X-Forwarded-Encrypted: i=1; AJvYcCWWpO6tVyzwVxbfDqb64kpcw5BPiLQipZ8NWSRLfuqfEftTagRGkDjsxEmB8gAvubpPW8+QFDkBRQ1KFtj10U446KmWh8vJW5UscubZO8YfLJI=
X-Gm-Message-State: AOJu0Yw5ym0dGBH6ZTNc0LuaDBdYSibhOc1c/O8bNNuDWd+Vy0l3yfnn
	6VyyDhiCn0VdS7ccBG5WUqAeNuSiR33ZZoxH5RsiFFdGhBoJm49TH8UFmGpk7slzZjV6WfqW1W/
	aP8B77cKlvzpUequ+ZAgXMPibIgiykTgqd9qtWA==
X-Google-Smtp-Source: AGHT+IHjbw9BdGe0LBffamuGVcO3Fjs/dxkO1OlPwbcLBOwnYZIDIIIMJZvaH9S0UdI3wP+pcdkx10/t2jWsgTG3mgE=
X-Received: by 2002:a4a:9893:0:b0:5ac:9fc0:cc6a with SMTP id
 a19-20020a4a9893000000b005ac9fc0cc6amr6760168ooj.4.1713269645676; Tue, 16 Apr
 2024 05:14:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240404122559.898930-1-peter.griffin@linaro.org>
 <20240404122559.898930-7-peter.griffin@linaro.org> <560e9a5b236728f62be4bfd8df187071c4bffb23.camel@linaro.org>
In-Reply-To: <560e9a5b236728f62be4bfd8df187071c4bffb23.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 16 Apr 2024 13:13:54 +0100
Message-ID: <CADrjBPois-nLGkNdXRp9SF2t4xv1fr4MvSK7yT-7GA+QwkA2NA@mail.gmail.com>
Subject: Re: [PATCH 06/17] arm64: dts: exynos: gs101: Add the hsi2 sysreg node
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, kishon@kernel.org, 
	alim.akhtar@samsung.com, avri.altman@wdc.com, bvanassche@acm.org, 
	s.nawrocki@samsung.com, cw00.choi@samsung.com, jejb@linux.ibm.com, 
	martin.petersen@oracle.com, chanho61.park@samsung.com, ebiggers@kernel.org, 
	linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, tudor.ambarus@linaro.org, 
	saravanak@google.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

Thanks for the review.

On Fri, 5 Apr 2024 at 08:33, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> Hi Pete,
>
> On Thu, 2024-04-04 at 13:25 +0100, Peter Griffin wrote:
> > This has some configuration bits such as sharability that
> > are required by UFS.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/=
boot/dts/exynos/google/gs101.dtsi
> > index 38ac4fb1397e..608369cec47b 100644
> > --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> > @@ -1265,6 +1265,12 @@ cmu_hsi2: clock-controller@14400000 {
> >                       clock-names =3D "oscclk", "bus", "pcie", "ufs_emb=
d", "mmc_card";
> >               };
> >
> > +             sysreg_hsi2: syscon@14420000 {
> > +                     compatible =3D "google,gs101-hsi2-sysreg", "sysco=
n";
> > +                     reg =3D <0x14420000 0x1000>;
>
> Should the length not be 0x10000?

The downstream kernel uses a length of 0x1000 for all the
foobar-sysreg nodes, but checking the specs it does indeed seem that
the length should be 0x10000 (and that is what we've used for all the
other sysreg nodes upstream).

Will update this in v2.

regards,

Pete

