Return-Path: <linux-samsung-soc+bounces-8962-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00827AE878D
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 25 Jun 2025 17:12:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70FFB3B30C8
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 25 Jun 2025 15:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A8E026A0C6;
	Wed, 25 Jun 2025 15:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tzh2zbhz"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5EB26A0AF
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2025 15:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750864332; cv=none; b=fHh5vhYF7veBLqNd9MfrDlZCPhlBp5KlvJGmTF/nwc5/jxxJyA3xWPHKRq2tYtQ3tIVrWObqTT1Lg34kCOKhhznGRXiVArZm+haZdadpD35ao3S8Q4hpB3lT/PSFcpNqcz6befKfbHB4DkVFR9l9AfCAp0r4XwPJcJv4u8/33t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750864332; c=relaxed/simple;
	bh=MyOeN1BOVe0tVdXuH6wdqHh3iBo9MBd6JpkNczrI04I=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dd6gDFTJJSIAZWd1Q9F4WxTyyi+e17J0iuuVGvy/f9H+WGiHgfBYOCQ/SpXYSnaiqwXuAPPYrJN/KPp5vKDBbrUiwy+YBye5u2GGzxT6rhAc29R76gGM8wK+jSqn1ZrdJThVj7mC8/f1xCdM0prQqKF7OVJdczBHc5Uzw6adpXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tzh2zbhz; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-453066fad06so12613335e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2025 08:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750864329; x=1751469129; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MyOeN1BOVe0tVdXuH6wdqHh3iBo9MBd6JpkNczrI04I=;
        b=Tzh2zbhzXRzrR/6pacGnEH3xrQU7dHwksWZE00xO4o/nTMoPVGh6FStKTEyA429DfN
         q5wvexfNoV2d0pJaLDpznnRkSm6/4G8HYn7uV0/vXNSeP3G3OHhvxp8xnoJ0V5SceMst
         ER17LHEVgd6PRJ0bdejwSquKkHWkHPnHRna5e75vqZ5sMvJgTMZvBXTPz2S7NpCZCzVe
         lDCfkYoLcUTM1BfN05/hyqEoU8HBm1GNWWpKC2KwwR4ABngvOWtG3eMMBJqRv930LbpA
         SpW9WkI/VM3+7QStrsCMjaD7vUqqOiVtBiU9BRFwRw671MLpJBBOqgSYpKi2VAFzjuIU
         KxkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750864329; x=1751469129;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MyOeN1BOVe0tVdXuH6wdqHh3iBo9MBd6JpkNczrI04I=;
        b=DsnzOKAQF1XR8ef1LJTrizZiG32QDaQqaVBv4rkdmQXnwNrQf6/k+iHy/xlyAaFN7G
         eBmyxG+6zDN+QU2xt2mgHLAAYRQbyKqWlIyn9ZaSmBsVMeqlV6vUXaq538pOaBO3q3o3
         U7zY4lqJYugAKcLXs62LUGBz4DNc+ZetD4CyLA5yuPJBDQUxcCesxmwEwtethl1SPXEr
         nmJRqUBmzqa5E/PeVAFZJcn5nWHdEJ1dLclXct0xorxV2eH6/yq0aeIYicE8eCniHvWK
         Bzwr++rUn+DgBAd9vfkCw+41jStBtVIR6rBapiw+iNe7dJ3UffeR0QNuPIaT0r95+zRw
         jTgg==
X-Forwarded-Encrypted: i=1; AJvYcCXE8SUIAE6xFuESCpVOc/lvz1rTfLMtHqdFjTlU9jZOMeSXTJSt0yPBmcbp74Q/S3CSgdrLLXSe4CAKtFRO4pkzAw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJSh9PiFGVxPU/Dsw3AiwhCmrAeqz/XJidfCVov+5hoFftpQ3s
	yNCg/g9Zl7ktU4OGirIgtPJ+EQMhz+b4VfnDtYQLwvBQ7+GXnDQRxFZuvNY5DE6RIwI=
X-Gm-Gg: ASbGncviN46IKv25qWl3rW8KpHQLKWfNajwC1Fn16nOoNhETEmLMYz4dQaJtne75hh3
	QstEx0v8V3+awtWmVgFnfnD+Xff/3jX3jtIeSvulXOGhjmMBATCLgpMTZvVrDZNPiqkwZeTZgVa
	cn1JeaRCNpaWnTXzKCsSPuCN0MEoVWI3tB3drSIgX3CUuThkBdGjnlIEI3kIQjGbW49SN9yoENc
	/Ml2hn0TAcEpKh2SFrgaxUIWQjIEGhwC5AR2pQu7Hn9gN93teXy2EXphnVVg2k0Qq8uqvLyhPyz
	EGY6naIRWl6J09+ejRyorjDBFcU5im9T9xSx0FW48+Bf1LmFND6gMbWrWkqgRf8Ugg==
X-Google-Smtp-Source: AGHT+IFSg3dibVTIEpD6FpD0UUWYk6yh5yAs3N7EJ6HO9SoNfajU5TZY11EXzo28LUVmj7JsxNhSvw==
X-Received: by 2002:a05:600c:4f07:b0:450:cac5:45e7 with SMTP id 5b1f17b1804b1-453886d3649mr1206935e9.1.1750864328873;
        Wed, 25 Jun 2025 08:12:08 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8069534sm4740368f8f.44.2025.06.25.08.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 08:12:08 -0700 (PDT)
Message-ID: <e29a3494986d78ca964846b54fd3e5bc78e4afd4.camel@linaro.org>
Subject: Re: [PATCH 07/17] mfd: sec-common: Instantiate s2mpg10 bucks and
 ldos separately
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski	
 <brgl@bgdev.pl>, Peter Griffin <peter.griffin@linaro.org>, Will McVicker	
 <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Date: Wed, 25 Jun 2025 16:12:07 +0100
In-Reply-To: <05b9862c9a8f11bf7d7c8afdf60ecff30716a196.camel@linaro.org>
References: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
		 <20250604-s2mpg1x-regulators-v1-7-6038740f49ae@linaro.org>
		 <20250613141902.GI897353@google.com>
	 <05b9862c9a8f11bf7d7c8afdf60ecff30716a196.camel@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-06-13 at 15:49 +0100, Andr=C3=A9 Draszik wrote:
> Hi Lee,
>=20
> Thanks for your review!
>=20
> On Fri, 2025-06-13 at 15:19 +0100, Lee Jones wrote:
> > On Wed, 04 Jun 2025, Andr=C3=A9 Draszik wrote:
> >=20
> > > Bucks can conceivably be used as supplies for LDOs, which means we ne=
ed
> > > to instantiate them separately from each other so that the supply-
> > > consumer links can be resolved successfully at probe time.
> > >=20
> > > By doing so, the kernel will defer and retry instantiating the LDOs
> > > once BUCKs have been created while without this change, it can be
> > > impossible to mark BUCKs as LDO supplies. This becomes particularly
> > > an issue with the upcoming support for the S2MPG11 PMIC, where
> > > typically certain S2MP10/11 buck rails supply certain S2MP11/10 LDO
> > > rails.
> > >=20
> > > The platform_device's ::id field is used to inform the regulator driv=
er
> > > which type of regulators (buck or ldo) to instantiate.
> >=20
> > I'm confused.
> >=20
> > There is nothing that differentiates the two, so why do you need to?
>=20
> On gs101, we have two PMICs, s2mpg10 and s2mpg11. Several s2mpg10 LDOs
> are consumers of various s2mpg10 bucks & s2mpg10 bucks, and several
> s2mpg11 LDOs are also supplied by various s2mpg10 bucks & s2mpg11 bucks.
>=20
> So we have a circular dependency here. LDOs of one PMIC depend on bucks
> of the other.
>=20
> If all s2mpg10 rails are handled by the same instance of the s2mpg10
> regulator driver, probe will defer (and ultimately fail), because the
> supplies to the LDOs can not be resolved during probe.
>=20
> The same goes for s2mpg11.
>=20
> The result is that neither driver can probe successfully (unless you're
> _extremely_ lucky due to parallel probing, but we can not rely on that,
> of course).
>=20
> By splitting LDO and buck rails into separate instances, this circular
> dependency is gone, the buck-instance of each respective driver can probe=
,
> which then allows the LDO instance of the other driver to probe.

My next version will have that changed to be fully granular (one mfd cell
per regulator), since I've come to the conclusion that the high-level
split is non-ideal, otherwise important supplies might be turned off during
EPROBE_DEFER of a consumer, affecting unrelated consumers (rails) that
haven't probed yet, since multiple consumers share the same supply.


Cheers,
Andre'

