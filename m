Return-Path: <linux-samsung-soc+bounces-1898-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D243885108A
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 12 Feb 2024 11:17:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 434E61F2218A
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 12 Feb 2024 10:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4132B17C71;
	Mon, 12 Feb 2024 10:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y6QFCcFb"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACFF17C6C
	for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Feb 2024 10:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707733074; cv=none; b=TlZTrNwD01SO8f7WLRC+G65oyNYJULDl0/NkjYrfaZQMb2Lq5lOen3X5ga1Sq2sPPnRTUhb04mZMrdTrOn5U68Xe9ON6+ZX4s2UjrHE3H56ehAKIYCMWQHF3P0aFC8e737HgJTaU3ykejjJGHJg8PATZvMJhdBbpdkLy4f2IBeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707733074; c=relaxed/simple;
	bh=8tSF0jlKqaYoudnTGmjGNrNMBoIoz9p0dEXgVzrpIhQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m72+CXW+wwA81LnVKgwW7mXtfFaKhFiVQ8BhtQ/+QD2tMFi8txlCu+V0GZNF7kIKqHITQNIYo57gGUH4RhHU2qhrbi9WwuN+3UCsYeZlEt/UTnEHDitAxeofq+K/PZ5c1DtMCpLNe4SMUKYFJ3K4FZAxAT+R4yTJ1L1NdH9b0U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y6QFCcFb; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3392b12dd21so1838773f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Feb 2024 02:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707733071; x=1708337871; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8tSF0jlKqaYoudnTGmjGNrNMBoIoz9p0dEXgVzrpIhQ=;
        b=Y6QFCcFb6aIC1V4CAChXY9MKXionRmZAhL+8H7v+61GquWmWm0JzYmLExg1MMrz159
         A8IKg/4dNjgA2fYMWtI/F3yq+J+6acvMAPSnhWz4zxPAD6VzCibzcg1vig0DZBdc/ip9
         bgK8vjQolVjIzU3GuT2YEnO5Bvgqv8po1v/mBXeici5zHKQ4/6pjyz9ZeznHCgh4nrT3
         4Rx0tHoA2ZrpU9t6ZmMdpYjEIz22jwyFHQ+DM/ZtinFaSxzZF6Ma64Jamo7PTY4cfS1L
         1zOPQL2ANHmxgvnw+sbIV+6geGmWu7KVTHZwP2wYpmatp7spQxAlOdQZYssHJthVzVku
         9aOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707733071; x=1708337871;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8tSF0jlKqaYoudnTGmjGNrNMBoIoz9p0dEXgVzrpIhQ=;
        b=FH7zTNJoxiX/s45Vl2ULj6CqAj5YFmaGZPIvMuKw9wRp2tlYyNcy4XbvNLUKwhW211
         OgsqIDvZpRmIBuOt1JZPhIATnIrDgnaVx5xypHA1KDYH4uXarw9ZPS0XdW4Ho2LBVkcO
         TpPFFFywKzK1QUxGfoaFhQLPb7EzVc2qDvNLt/NpMJ/5cRgZhvgFOxedgahhoCZwMZSf
         9RNeywLHxxIEceea5YVyq6uGPz+9BbBNduG/XD6d/z7QEVx/6AlJfwpBeLQIBWaQMSGf
         ispuAvP5q7U9/jbUnxAq+yRuT5fLRPk5v9HXHxJUmY933MLHd2EGqfMb+si7cbTxQdZZ
         og4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOTgHYWHTWQMAWojMzMBEWKjuzIStPd+AyIhewDQ2rtpwGfaTgrJdHV84gRI5kJTnNhcWz1yDAByH+78vHKWIGYxDjGgRqeoWkstDFYDHDPiI=
X-Gm-Message-State: AOJu0YxSSHx79pyU8TrVmeLXEI0kW0sUW4ry7FQzNRSHgZEqsmZmyBZN
	ISuF5mXlO27w3xYhyE6yO1/3gwRgo8pTdyk5WUDl0+1x2Cd9Yc4fvPS/yxpZvDM=
X-Google-Smtp-Source: AGHT+IFcf82HXcacp3V+HVrWbXaP9rjPPjK8qFH+9DGIcSX8OpZbtxgBhGvuHv7p+wPMLEO+M4T7xA==
X-Received: by 2002:a5d:4a04:0:b0:33b:615a:19b7 with SMTP id m4-20020a5d4a04000000b0033b615a19b7mr4595435wrq.22.1707733069963;
        Mon, 12 Feb 2024 02:17:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW+mm3KiRPo1HXNV7b+yhiuRyD7lE2xoiezMnzudmmH7NuHMH6anZGcme3J8GlP3/ouVSGng246HS1MWVzwnlSPN9z8+WLvnCG7VjyyY6Zwugr6TlTpFTB+tBo0PTp4BLpl66F2mA+iJk8M14/s/IxLhh0/VfLi+Qz6YS9NQuU/+N0TtoOkY5jLmgf1ySssHf2NHr+V0KcALj1951KvYnBQpE/VkvNfGQZWdmIZQK9EUU5coOL8lQcgFFyd8mehZACtSi1P1SiTHCNMJnq7Ce3deP5K3sWjiAc/V7g7vwVvDossPGPEuQNW7F1QmkcZsHYbdzw7SYyTEDi4kPbjP3kRGH20vIqa6OylHF1TOqnVc92I3OSQjX38inx4Q8VIjLyMNwjUTIus0OFdLTdzEKXA8nd7WIUD7Z+iLV/mDY/oIbHHG/xGuaFs5anUjIF5brT5B9ViFzWj
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id u7-20020a056000038700b0033b72aa93b5sm5744635wrf.89.2024.02.12.02.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Feb 2024 02:17:49 -0800 (PST)
Message-ID: <5972b6a4ae8669e2a9e872278b740b182217906b.camel@linaro.org>
Subject: Re: [PATCH] arm64: dts: exynos: gs101: add stable i2c aliases for
 gs101-oriole
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 peter.griffin@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org,  conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-team@android.com, 
 tudor.ambarus@linaro.org, willmcvicker@google.com,
 semen.protsenko@linaro.org,  alim.akhtar@samsung.com,
 linux-arm-kernel@lists.infradead.org,  linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org
Date: Mon, 12 Feb 2024 10:17:48 +0000
In-Reply-To: <170737972037.52344.9107022607101399076.b4-ty@linaro.org>
References: <20240130233700.2287442-1-andre.draszik@linaro.org>
	 <170737972037.52344.9107022607101399076.b4-ty@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

On Thu, 2024-02-08 at 09:08 +0100, Krzysztof Kozlowski wrote:
>=20
> On Tue, 30 Jan 2024 23:37:00 +0000, Andr=C3=A9 Draszik wrote:
> > Now that we have more than i2c interface, add aliases to ensure
> > deterministic bus number assignment.
> >=20
> > So as to keep compatibility with existing Pixel userspace builds, use
> > the same bus numbers for hsi2c_8 and hsi2c_12 as the downstream
> > drivers with the intention to eventually add all the earlier busses as
> > well.
> >=20
> > [...]
>=20
> Applied, thanks!
>=20
> [1/1] arm64: dts: exynos: gs101: add stable i2c aliases for gs101-oriole
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 https://git.kernel.org/krzk/linux/c/72ccd9=
25dcbd2ad6935a4874679b6cf5b3de7156

Is it too late to ask for this patch to be dropped please? It appears
downstream has just changed all their aliases on Friday, whereas the
point of this patch was to keep things aligned.

I won't post anything similar until we start integrating with Android/AOSP
at some point in the future.


Thanks,
Andre'


