Return-Path: <linux-samsung-soc+bounces-8050-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B9CA921D4
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 17 Apr 2025 17:43:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48B8B3B2617
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 17 Apr 2025 15:42:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECD76253F11;
	Thu, 17 Apr 2025 15:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="m38jqekq"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A8A253B7B;
	Thu, 17 Apr 2025 15:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744904583; cv=none; b=YvtvvB/MyHZ1Ilb4rnLUb57LhTp2BvJVVqOGUty4yc+880kSNM3+5OvAAVeM6mDOjhFsYeBOM1xFhYdSS5+Aol2NW+C+jznze2Ax8J8rQix5a6WNdZY9ExFozjRglwlLrKGg72u+f75r+quO9+eQZfs6CCezjS3wSTr6DCajnwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744904583; c=relaxed/simple;
	bh=YJ8LpTKQW+D2AUqysghHq+yImGwgrWT7DRfZaQ/LtWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aEtVrGxiM3fI9LwQsN0fvUZ0qJLmNvrr7FkWs2CGcZ77tRXRYJeQEc2dAKr5CRjCxjs0rsWpsmvPxRMXO8+edA4flAxXrBhnq73yMPnYYVPMsltaZ17puOrrGjTEmp0W46qtc/ITmvNLeI5Qtr4AS35RgnbpPdcoM8gEC7naBiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=m38jqekq; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id D9C8A439AE;
	Thu, 17 Apr 2025 15:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744904579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LZp/NeDHcn4kz4i8YEhiZ7BJXzOynMSoJ4YpajxDv9Y=;
	b=m38jqekqN4LLyjuSzkr9b68XeNZ/fLMNDbqHEZyi3Gj55qmnrcebhrmp1ePWxiXt8rPd00
	yA5xxuF8w6OYc9xjjtalMIDVipq+edkpI59JeI/V1jX6PRwLKyq4Q/z2WZcuXeIlNwmb3V
	7FTk22k2WZ1Uywvzo7gQNRbKs/XL0RvFnM5ZlXKvwH280acGfoV38tDvXnJevaUr0SDTQ1
	s1bGigazo7VVOyfVMoQq8fiGn+J8vgJmlx9MswhLPH7aayxQuaXLqNLF+zrN/wrIUksvP8
	uM902u8R+jbUo2bfD6sKSMz11oOjrVFLY54bxE1G6PsDdSZgVcyCKFWMDLVwZA==
Date: Thu, 17 Apr 2025 17:42:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Lee Jones <lee@kernel.org>
Cc: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 00/32] Samsung S2MPG10 PMIC MFD-based drivers
Message-ID: <2025041715425693974c6d@mail.local>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
 <20250415160212.GA372032@google.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415160212.GA372032@google.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdelieehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeetlhgvgigrnhgurhgvuceuvghllhhonhhiuceorghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeiudeuteehhfekgeejveefhfeiudejuefhgfeljefgjeegkeeujeeugfehgefgnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemugekjegvmedusgdusgemledtkeegmegttghftgdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdegpdhrtghpthhtoheplhgvvgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghnughrvgdrughrrghsiihikheslhhinhgrrhhordhorhhgpdhrtghpthhtohepkhhriihksehkv
 ghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsrdhnrgifrhhotghkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegtfidttddrtghhohhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheprghlihhmrdgrkhhhthgrrhesshgrmhhsuhhnghdrtghomh
X-GND-Sasl: alexandre.belloni@bootlin.com

On 15/04/2025 17:02:12+0100, Lee Jones wrote:
> >  drivers/mfd/Kconfig                                |  35 +-
> >  drivers/mfd/Makefile                               |   5 +-
> >  drivers/mfd/sec-acpm.c                             | 442 +++++++++++++++++++
> >  drivers/mfd/sec-common.c                           | 301 +++++++++++++
> >  drivers/mfd/sec-core.c                             | 481 ---------------------
> >  drivers/mfd/sec-core.h                             |  23 +
> >  drivers/mfd/sec-i2c.c                              | 239 ++++++++++
> >  drivers/mfd/sec-irq.c                              | 460 +++++++-------------
> 
> >  drivers/rtc/rtc-s5m.c                              | 197 ++++++---
> 
> MFD parts look okay to me now.
> 
> With Acks from the Clk and RTC maintainers, I can merge all of the
> driver stuff together and submit a PR for others to pull from.
> 

I don't think the RTC part depends on the MFD one so I was going to
apply the patches in my tree if this is fine for everyone.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

