Return-Path: <linux-samsung-soc+bounces-2413-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 740BD88CB25
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 26 Mar 2024 18:43:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A5DEE1C389F4
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 26 Mar 2024 17:43:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C39DC1D539;
	Tue, 26 Mar 2024 17:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Cu8OTgNH"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC065A95B
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 17:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711475024; cv=none; b=XT84oeOUvbsrA1jOSbF/LH8V/+7vb3dxAPuIswtXW48mO3O+MGv4xzSC0COt2WYUNl/dhQTla4ajcmbqusGQyNDaxShmeC27//PfV01/Erm2RVSYUHcDWDndO1oLhxX5cORd/fcXalSFg+sf6TCwivNLYQOB1Z4N8wRZ96lQwtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711475024; c=relaxed/simple;
	bh=oUwPm+LhhzEAcP5+F2HK822pq0W7vnOXkTx+lfC3XGs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ONRpGodNSf/YO2adueve6572n7QJAFu4iDXm0Ledr5A8PNsXhTzq1z+ZyZ5aB20hs6CqgIWn8IyktkoV46ac6S270Wg5/o2vZn4ObPJKHXKXUHTlXQzxXaLgiwpxnpB9DnuQqVvuBv7olYbkv8Sj4W5mgBCHAlzjLDFp8zO5OMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Cu8OTgNH; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4148c607f31so9838385e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 10:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711475021; x=1712079821; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=d+pLwrN7IzQtt4YVaoVDzL2T1kedcYqHyKuMC9bhaZk=;
        b=Cu8OTgNH1LeXqtz7/X/onlu7RaIMEl/6qL9su2RKKyfYJvRM54ws+236tmtVA6Db6m
         +yhImJcWV5NPWxhWdhxNfJ9N4SVLsYhPDn2y1s7luabhNAYhm52mKzPmoa2wVYWwQWS6
         HLpJrNLLncSkipIsD2IJxhCLcr9kVlQwdeLg4rf8ArSxq3H0vXJLvyeBwpueChxNmr/F
         7q3RmiTxiDJDBTJtCoivT5nWn0/bBS6ALPPWd+4TnQicLRDQOVfNQMfp3EojBrBG9c9m
         GegCyjxn84pJlHX7e5BbCnu0YU74p4DKOldXdpvZDN1Dyk8h/QyVyf/7qXEAh88JzPqd
         PlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711475021; x=1712079821;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d+pLwrN7IzQtt4YVaoVDzL2T1kedcYqHyKuMC9bhaZk=;
        b=YZhop7jPv8nM0Jx/Vj4Ltzlf4Do+bS5dpIbXkHH4bWXkH2MUa70wLyRHHVMQAwsgIk
         f8LQycNpoRiUUe8OdDr5ypOmrO8ga9UyZxE43RaMvolFfNB5XrGzt62VnfZuL0h0e/CC
         olkoKoAawZ4wNlaF4NvHza9D7VZSZkZUCxCJYmIPLdFBQYb43mtkQqVfysJ+AIUZQ6eZ
         O5zyW310IXD6EUtynbdXXdbHh25YYKbaYQ8ujQa3ibC9Af4+I1EsTrTxUSGlqAraEybI
         vbvrIB0waBcUdW8yPYl3XRs3yhGckZsF69mmyFwoHUAqfGJ/rdNJ571do7nZlLruKrE5
         nBxA==
X-Forwarded-Encrypted: i=1; AJvYcCUIZn9cwsImrGMHJoTYovnYnSI05YULgpAzBCXZR1R6d5RQLyZZXcHeAGHNrAdiCtMgYibF4rMzqhrOeQhYFRjP4ALKywOYVcDBfpuhzFLZtFo=
X-Gm-Message-State: AOJu0Yx/2XGsxGmY9rWfaIL1c1brHdDbzwzHfBQVvJocTArUxcSUCRij
	0uy0yrOBBYYlMxalgt2jIMwTh1/AAxK5xeGuDZmyqiX9JC/xnMR9xK9JYydT0uA=
X-Google-Smtp-Source: AGHT+IEyEXDtYyd75K2bmQfUIiC16cTW8DNiy24ESWAtnb8lrm3Dg6lDC68YQjKZFYHpQF9mZihYjg==
X-Received: by 2002:a05:600c:2201:b0:414:71b2:73c4 with SMTP id z1-20020a05600c220100b0041471b273c4mr8862368wml.12.1711475021184;
        Tue, 26 Mar 2024 10:43:41 -0700 (PDT)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id j19-20020a05600c191300b00414610d9223sm12215452wmq.14.2024.03.26.10.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 10:43:40 -0700 (PDT)
Message-ID: <c20452059e62d3b8c45efb8070223f10f0bd06ed.camel@linaro.org>
Subject: Re: [PATCH v2 1/3] clk: samsung: introduce nMUX for MUX clks that
 can reparented
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, peter.griffin@linaro.org, 
	krzysztof.kozlowski@linaro.org
Cc: alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 willmcvicker@google.com, kernel-team@android.com, s.nawrocki@samsung.com, 
 cw00.choi@samsung.com, mturquette@baylibre.com, sboyd@kernel.org, 
 semen.protsenko@linaro.org, linux-clk@vger.kernel.org,
 jaewon02.kim@samsung.com
Date: Tue, 26 Mar 2024 17:43:39 +0000
In-Reply-To: <20240326172813.801470-2-tudor.ambarus@linaro.org>
References: <20240326172813.801470-1-tudor.ambarus@linaro.org>
	 <20240326172813.801470-2-tudor.ambarus@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2-1 
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Tudor,

On Tue, 2024-03-26 at 17:28 +0000, Tudor Ambarus wrote:
> All samsung MUX clocks that are defined with MUX() set the
> CLK_SET_RATE_NO_REPARENT flag in __MUX(), which prevents MUXes to be
> reparented during clk_set_rate().
>=20
> Introduce nMUX() for MUX clocks that can be reparented.

What does n in nMUX stand for?

> [...]
> =C2=A0
> +/* Used by MUX clocks where reparenting is allowed. */
> +#define __nMUX(_id, cname, pnames, o, s, w, f, mf)		\
> +	{							\
> +		.id		=3D _id,				\
> +		.name		=3D cname,			\
> +		.parent_names	=3D pnames,			\
> +		.num_parents	=3D ARRAY_SIZE(pnames),		\
> +		.flags		=3D f,				\
> +		.offset		=3D o,				\
> +		.shift		=3D s,				\
> +		.width		=3D w,				\
> +		.mux_flags	=3D mf,				\
> +	}

You've duplicated __MUX() and removed the CLK_SET_RATE_NO_REPARENT
from flags - I think it would make sense to instead drop the flag
from the existing __MUX(), and adjust the only two existing users
of the macro, i.e. to add it in MUX() and MUX_F().


Cheers,
Andre'


