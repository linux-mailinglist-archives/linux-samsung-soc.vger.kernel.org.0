Return-Path: <linux-samsung-soc+bounces-1506-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 747F2840BC8
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 29 Jan 2024 17:39:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15C6D1F2501E
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 29 Jan 2024 16:39:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8098215705A;
	Mon, 29 Jan 2024 16:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GetVDMWW"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E541F156980
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 16:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706546084; cv=none; b=mpMFhE2gqPH5TlBFl04zvKnrmdQmxCx1NZmaenqNR2DjH7foGOcqmdVnorgjAPaj6T7r9fwtUeJYg0+UCn0TAabRpiY7MVFnKffGnv+yWXQHwnCQ2hylOww+hR2Ie4sAAp5+iqZDCd7lMhIoiedLn9qdM3nVGAEFcEQ8NqGPUiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706546084; c=relaxed/simple;
	bh=DZ1/Lt2XeZ8N7ZlRDPICU0NnPsl3dsLafwpn46RvGsM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZBguv/Tt/Msv24UCq3QHWKBDDdeNkIfhrpmQh4FYqlXC1PJScblETFQ0ikjGS9FePUeu/xX7FGrXAnTX+Hr+0a6wTLHBUtQFPT0LcfkDDQc5/G1xrZ+Xe7VqFzyN3ulHN7PvV6+ohatsz5kMKfL0eejkhlAYzbBThEuDsBcqe/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GetVDMWW; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-59a0fb8a802so1523816eaf.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Jan 2024 08:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706546082; x=1707150882; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fIE7MVnsGMDWWJrtfQ2GIjZCJnpM7Y+nioDW77prozg=;
        b=GetVDMWWac3Myi7B/L6aXI85rR/cpKqDsVnCPV5rvsnxh6FMhAIMUbjjhR4/FXXv8K
         ePtEDYfVl8sCTkdyNP76OSPKNISYorDC7ZTx4mQdX+/aCpUfKTfMsHVnFY0pywPRABUG
         c3TERWTW+GpHndnNkYz7UdDkyKDByeIZAvf74wddrlidV4LXJCNp/6b3wXUB/5jWbusE
         e3PWPOJDnQIdvoi69SUzlMIt2niFtEA2RsYAa3kd6msIqY5QUmc65GFx4N6lnhSApM6N
         GR9Qoxbr/I9xox/d3BTBd1hJZkjK96mGsDE9KLpbuu/Bf4cvqRos4LwoN/Asm+p+PLsX
         aedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706546082; x=1707150882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fIE7MVnsGMDWWJrtfQ2GIjZCJnpM7Y+nioDW77prozg=;
        b=XSk1ac6NakCrOX6kNNsKWhp4uWI6ImgQuxFO2djz85sgHJ0z/NghHHo+plXBdfesDu
         uA5S2Ti4PCqowoYwkaicfSgEQYHew6ZdHcWcJCUcVb0XcQoD2DS3yCQFIqFzIJczNGRN
         i6Bpdz1xRISPcnGgUMIh97xqIcT8QYcgR4BEo9EHt/rgISRtLMRV5HGBDA8vS8waZn6b
         mvthBNrhf7HXK4cbW4sKNuEIwpP+NF8Ia0QXwcL5pi9MnGuig0K7KK1GTtw+tzBdqbsQ
         KxbL4afd5zOqezoCLAmLDEMZNioa/93V6B1gv8FtRdFWLmsJVVVtPc2t4+I9y/l+6B1k
         GzxA==
X-Gm-Message-State: AOJu0YzHtM21nontYpeFna7/MyP+6F9XiAjMUdkZ2A7Jzb4sI/UZ6Oai
	hyN31OL/I8mDpXOe0aePlzQsYAIdp9TEDY+B01PeyarI90MLz0nte5FTCNSUTyMreK3TM7zNuOM
	TWngGJxlL/kroxUnAhCBPT7ZIhGZFosiAbeamVQ==
X-Google-Smtp-Source: AGHT+IFR/lXrslAYvsfTLAD59PjcNkwmdU+1xJqBt3z10O3k3Fc8WFZF6p/UfVn3P1FSriG+2FEnUFiu5ahNzgsRcG8=
X-Received: by 2002:a05:6358:90c:b0:178:652e:5e32 with SMTP id
 r12-20020a056358090c00b00178652e5e32mr5573155rwi.62.1706546081900; Mon, 29
 Jan 2024 08:34:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127001926.495769-1-andre.draszik@linaro.org>
 <20240127001926.495769-7-andre.draszik@linaro.org> <CAPLW+4m4G+-zFLGr6Bp-73-mERCofxDiD7F=2fd_Wq+18iTs9g@mail.gmail.com>
 <0d3236e90604e82a609d205c6fbb56fd882ecfbb.camel@linaro.org>
In-Reply-To: <0d3236e90604e82a609d205c6fbb56fd882ecfbb.camel@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Mon, 29 Jan 2024 10:34:30 -0600
Message-ID: <CAPLW+4nk7hStr=g4vt+iztOr6bqbtJFVDLZ37BfFh4POazgjJA@mail.gmail.com>
Subject: Re: [PATCH 6/9] arm64: dts: exynos: gs101: enable i2c bus 12 on gs101-oriole
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: peter.griffin@linaro.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, alim.akhtar@samsung.com, 
	s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 29, 2024 at 4:40=E2=80=AFAM Andr=C3=A9 Draszik <andre.draszik@l=
inaro.org> wrote:
>
> Hi Sam,
>
> On Fri, 2024-01-26 at 20:58 -0600, Sam Protsenko wrote:
> > On Fri, Jan 26, 2024 at 6:19=E2=80=AFPM Andr=C3=A9 Draszik <andre.drasz=
ik@linaro.org> wrote:
> > >
> > > This bus has various USB-related devices attached to it.
> > >
> > > [...]
> > >
> > > +&hsi2c_12 {
> > > +       status =3D "okay";
> >
> > But there are no bus clients declared here? A bit of explanation about
> > how this bus is being currently used would be nice to have (in commit
> > message); e.g. maybe it's used in user space somehow, etc. Because
> > otherwise it doesn't have much sense to enable the bus with no users.
>
> As per the commit message, there are devices, but:
> * most or all don't have an upstream driver at this stage
> * it does make sense to enable the bus, as enabling it allows working on
>   the drivers for the devices that are attached to this bus
>

Then can you please add the corresponding TODO comment on top of the
code you added in this patch? And perhaps also describe which devices
you have on the bus in commit message.

> Cheers,
> Andre'
>

