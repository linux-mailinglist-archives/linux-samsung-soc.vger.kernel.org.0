Return-Path: <linux-samsung-soc+bounces-2037-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4ED85B95C
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 20 Feb 2024 11:43:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C39E5284920
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 20 Feb 2024 10:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31E1634EE;
	Tue, 20 Feb 2024 10:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SnzrDt8/"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3784B627FF
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Feb 2024 10:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708425821; cv=none; b=cgqpnyWwf++F44kYlfI3h+6e3bKyfDFg8wN5FMps4nytXWuAwyBZIIM654aXd7t/bW5qAuJHd31aN+6EFFrrwwRqrjTLpQ7yLDNlPU7ltal5a7ru/DjvY1t+MNEN+dW513xrjNfoF3sWHQZ+A3cBAGc/DQeqTM/ENrkgo277O8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708425821; c=relaxed/simple;
	bh=2uVxjGx+3eud5qhkSTkqJX9rEMg+dS/p52YYnV0DAZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JKqwEWBdxEYjrpZ9vOK0OX3KiymMlFUOXqCjpG7ZTZrLmmCZSeOv18cTKM7wOoSLsWw5tox5V8w8WtaDAcr5ylYFDa7YgWkc7kxqr6+fTN6Zn68SCt596c+JW857uVsSFjdJR55Ka/cnVCpiyDfU9/XMGUbfBmeKBeGltwwHGUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SnzrDt8/; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-68f283daa21so38190566d6.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Feb 2024 02:43:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708425819; x=1709030619; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7RLmEvEb9uthgWOA8C/L1GOxTd9uDNdhyoVcD48vMYU=;
        b=SnzrDt8/dIP5HvFG1YD5S67CB+29fMANv0LN6tpqtBwHwonEFgTPrD+d0Rn/sf0sNI
         xDr7od/WtvvOLzCfLUTHmu2zvNQWgTZN2KVJpv+TlBFnasRoIRdrBZ2LM6DM3paH8MNe
         NgNtRzxjK9Q/2PLZn2EhsYaonoVLsr/JMc0/noZR8eF5/hbmWfsvFuD1yhQF+GGbCYEu
         g2qFiVo/qIN217NKBqXT4ObaIaFyH1xEcAqGJyKSTbiBkz7Ou6/Dc/VBaNVSE9dJOMdJ
         aWd6GeXazMRPmL3Ef/LE3UK1tFPxpkeWFxfGIKWdFp9OgolzxV23ApQEkuR3Bp0lDyYL
         ob3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708425819; x=1709030619;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7RLmEvEb9uthgWOA8C/L1GOxTd9uDNdhyoVcD48vMYU=;
        b=j/YToBiMxOWimCu/9lAfD/4IYykvpWEBWg8t8VPlsaDnPbzeNw5COUA+Lf4/apBrfJ
         lSlgiuPFtZJARabkK8oUlBR+WGIWkFaH01RgChgSG8xORiR+ctLjaHzVtyl1cFsWwyRs
         lxv2bV3vJN3T6ONgHrbST7HtA0KWjUSKtYzUCgM3h6z47MJZtxYlOIUDRckQnH+XzgX8
         pXTRiG5VXYERbzVZZv1pihWAO68J7yZyX/66VFhLjqvFS8cuE3Cg4tMHbY0QlKC4Gnjn
         LDTtdHbtWZMX/+vkeUa9L5k3YBZoTAyc/9Ie4gfoVFiV2pTly6PohnAfbn/RvD0BMrzP
         4NIA==
X-Forwarded-Encrypted: i=1; AJvYcCXpRBclMPopZ0rtkLo+irZ9uQ925c9oTEbC7dvB4FI7lH8Om7g7lZarN4o9dzAxGESswzrtqe9jTEVZyhSo3WPdi15k0q+sRInJbot2XzWReIs=
X-Gm-Message-State: AOJu0Yw8zRB5LF14IfLLUcNqtEanZPaRzy7E56cnt3ym0hOL7aFbgn1g
	iqLbeeqKcjTWzel/YaH7+mWIh9LB+kqDV44k0R9xl9rkrmIF6XCfv1fnyKcTeISSjwnZs242oyU
	B5Bw5uOSFDU8IxsM9U3kGo9OkD7N/UH5gkyuddw==
X-Google-Smtp-Source: AGHT+IFUKCZfJRzuavD+JnHMpBxd55N68+Y6zcwrt1W83FWCjiT/Yx7qrZ3Ck1WPvs84YRZwuFI4HskxV1M5kDVsGeQ=
X-Received: by 2002:a0c:dd13:0:b0:68f:4e3a:29e9 with SMTP id
 u19-20020a0cdd13000000b0068f4e3a29e9mr5805704qvk.0.1708425819073; Tue, 20 Feb
 2024 02:43:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240208161700.268570-1-peter.griffin@linaro.org>
 <20240208161700.268570-2-peter.griffin@linaro.org> <ab1f9285-73ba-4b69-8882-0cf08c508e28@linaro.org>
 <CADrjBPqw9E5foNvZ-ETFZR3mb8=x8CYHz3UUhfJUbBpOi3iKYw@mail.gmail.com> <d25a887e-801d-410b-9ccd-2ec10fb28f23@linaro.org>
In-Reply-To: <d25a887e-801d-410b-9ccd-2ec10fb28f23@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 20 Feb 2024 10:43:27 +0000
Message-ID: <CADrjBPp9A2eYbE+tRxfOe7MPaNa0uW+=6OzWbQeu2En=VoA0iA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] soc: samsung: exynos-pmu: Add regmap support for
 SoCs that protect PMU regs
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: arnd@arndb.de, linux@roeck-us.net, wim@linux-watchdog.org, 
	alim.akhtar@samsung.com, jaewon02.kim@samsung.com, semen.protsenko@linaro.org, 
	alexey.klimov@linaro.org, kernel-team@android.com, tudor.ambarus@linaro.org, 
	andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	linux-fsd@tesla.com, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Tue, 20 Feb 2024 at 06:56, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 19/02/2024 20:47, Peter Griffin wrote:
> >>
> >>> +
> >>> +     if (property)
> >>> +             pmu_np = of_parse_phandle(np, property, 0);
> >>> +     else
> >>> +             pmu_np = np;
> >>> +
> >>> +     if (!pmu_np)
> >>> +             return ERR_PTR(-ENODEV);
> >>> +
> >>> +     /*
> >>> +      * Determine if exynos-pmu device has probed and therefore regmap
> >>> +      * has been created and can be returned to the caller. Otherwise we
> >>> +      * return -EPROBE_DEFER.
> >>> +      */
> >>> +     dev = driver_find_device_by_of_node(&exynos_pmu_driver.driver,
> >>> +                                         (void *)pmu_np);
> >>> +
> >>> +     of_node_put(pmu_np);
> >>
> >> You are dropping now referencen from np when property==NULL. This does
> >> no look right.
> >
> > Good spot, will fix. It seems syscon.c and altera-sysmgr also have the
> > same issue.
> >
>
> Do you plan on fixing them as well in such case?

Yes I'll send some patches to fix syscon and altera-sysmgr as well.

Thanks,

Peter

