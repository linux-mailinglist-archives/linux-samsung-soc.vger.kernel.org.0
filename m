Return-Path: <linux-samsung-soc+bounces-1753-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B6484B460
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  6 Feb 2024 13:06:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63589281ADC
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  6 Feb 2024 12:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F0212FF91;
	Tue,  6 Feb 2024 12:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uUwKGVVY"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED1112FF60
	for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Feb 2024 12:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707220830; cv=none; b=Ty9cKUTMPvelJzAiHZbZbPo78LOhf5pT9MtOMgcJ7y3NpzwhEADiB7mz/urKms1kWxEx7lg9SVNrwV81tQyx0WmY/Tlpfj7LRKJd4BnffCjO3W3TkyG88FkTqLtStF7Vwma+jFmD36uAymDKmrHYnLpC8ihFh2XWyrRj3tge/88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707220830; c=relaxed/simple;
	bh=zHzTftf7qljyFyamE3gPK65Zs/n2+lrZ0S7UePOD9lA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQp4xFCYXLS/A5xCW/zn/9rRJESqdAvjuAr1t3N559dtb4FJY20Fy71heFFWinblLY2k/3f0bfG6b+SF7v87orBhZIa2vL7l/xoIkMqObhV1erYPGk08lAde0RTcwj/MmP4Clsn6N6QmGB17NPhJgRZOqpsp2eYCFoHLjWptK1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uUwKGVVY; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-68c3a14c6e7so25169246d6.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Feb 2024 04:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707220828; x=1707825628; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VYcLq+0GybZqiLelEzr2Y9hS+F3sRASXDSVWvTM+L0U=;
        b=uUwKGVVYrBChUZfjOXBJuiPNkZpMJAMaHB5s+riSgawFAx5YgeSAV9bxi008vjymw7
         SY1ueT+NftJoBeHY1kAT/yhKQz+BvVgmVgwdIYTtIHbhjbUwnEOrDepawx27cbWJDXpX
         N1fk+QmH4cAfVv+1H+hVzcaPvMl5ss/iW+pAf9DT2d0yjTF3Fs5MHSNJyIC4tbvN3EFc
         qGs6sCr6xLv0H5S35KDImW5YH+mReEXAfT9U3OrJqH0PXMDuhuwnu/wSrZGhpWoFw60M
         FnaCLZYX/qrue2rzWRE4fimr6Gry+btpmQWq9+vvviZsATA/kUVOlcs34hg5cAizECw1
         JXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707220828; x=1707825628;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VYcLq+0GybZqiLelEzr2Y9hS+F3sRASXDSVWvTM+L0U=;
        b=jzLi3SAq1t4JOqP1RllAmXHVm2BdByrF1K/lQSOOjvZ4Z/Dq4AJwn4C3u/UlNygILM
         rJ7/kOBjgM6LgjA8LRobwjwLHC0SADVHMh51ee0yvcJXEZ46wSHtZ5E+NSt5djpO0ptD
         1OjQhqgZVx0TkIYz5K5jMWunFYtoKdXfJImuZQQbNTaL+cLRaObzNT5BJ5YbzlAYCNtP
         MRwbLSSvt+5CmUF9XRc9rVij6s/QCLMp5zQrBW8vHmnMbxBSyZ5B3EHoqKjR8tEbbtRh
         WBwyoQF6AwlDmA9+47WlRKyBSt57yF7C4lW0HvRB0jjCseI0HsAQYV7J2crzdUF7L4RP
         WSUA==
X-Gm-Message-State: AOJu0YxqA8opjlqXrqWAdlt+oVNFB2jBQXJSSotiog//k7f5snkWp/QV
	f1dS5qV5hmVnonHjuh7uQnPTDCRfVTEwVoJ7yWxlY+NkYMK45LnuAC/3Y7eRNKB5y/5pMphv/c/
	UVVxnTd0s63f6QLEHwc4Bm/aBKWPZjEpPp5p6cGRlA4mJSCXg
X-Google-Smtp-Source: AGHT+IFV+oUSkiUAp29uvJltm9vvmt4Me3yZxlKDNCTv1Gn65ralsDCsUWdPBGzl8Rj9xoJuSnBOEhj1ISiTbwxIvxQ=
X-Received: by 2002:a05:6214:27e1:b0:68c:91be:68ea with SMTP id
 jt1-20020a05621427e100b0068c91be68eamr2250014qvb.38.1707220827979; Tue, 06
 Feb 2024 04:00:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206085238.1208256-1-tudor.ambarus@linaro.org>
 <20240206085238.1208256-5-tudor.ambarus@linaro.org> <CADrjBPqaE9Mmbr+zkHOAadr3aLSu3GMjS4nPPd4VZY4s2DTznA@mail.gmail.com>
 <ZcISMLoB2ytoQs/0@finisterre.sirena.org.uk> <833b96e5-348f-4c5c-b157-c57c9a67e0f2@linaro.org>
In-Reply-To: <833b96e5-348f-4c5c-b157-c57c9a67e0f2@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 6 Feb 2024 12:00:16 +0000
Message-ID: <CADrjBPpF_RdB5fe9udOgxLKmdb7D0Gux+n0XxUtneuAawSjoaA@mail.gmail.com>
Subject: Re: [PATCH 4/4] spi: s3c64xx: add support for google,gs101-spi
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Mark Brown <broonie@kernel.org>, andi.shyti@kernel.org, semen.protsenko@linaro.org, 
	krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com, 
	linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	robh+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Feb 2024 at 11:19, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>
>
>
> On 2/6/24 11:04, Mark Brown wrote:
> > On Tue, Feb 06, 2024 at 10:12:30AM +0000, Peter Griffin wrote:
> >
> >> The patch ordering seems a bit off with this series..I believe it should be
> >> 1) dt-bindings patch (docs first)
> >> 2) Add the use_32bit_io flag / functionality
> >> 3) gs101 support (this patch) that uses the use_32bit_io functionality
> >
> > That's the ordering the series has?  There's a random cleanup patch
> > tacked on the front but that really ought to be separate anyway.
>
> I put the include <linux/types.h> patch first because I considered it a
> fix (driver is using u32) and because I need types.h in patch 3/4. Fixes
> first, then bindings, then driver.
>
> Was I wrong?

No my mistake, sorry for the noise. Gmail showed this driver change as
the first patch after the cover letter but the subject was hidden so
it wasn't obvious it was [4/4]

