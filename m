Return-Path: <linux-samsung-soc+bounces-4734-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C7A9866CC
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 25 Sep 2024 21:22:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27DB61C20E8C
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 25 Sep 2024 19:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 847A013D52C;
	Wed, 25 Sep 2024 19:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="jab1XArA"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD7013CA9C;
	Wed, 25 Sep 2024 19:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727292153; cv=none; b=IUc8ogT6edSV8L2Tk1rO6F7UX4jXrKF07BnZGaBa/lXDMnvkSv+jnL+cNw9XATSsGJm8x7kw3khZdIfurGeLd754AcvCKQdCApgOSiAtoa0LopqvwrLKqSx7tzlXemYXXYW+ieHMZ0y+EL5Vho22FbY8GkfO6YSVStrndqIpPaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727292153; c=relaxed/simple;
	bh=4AOBEWDi+wIT+2mWhnODD4oRA7Jy5g1vOfK1zL2v2jw=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=dKE/GfdtiZUJF38sE9JaIYTmIzBdoKZNhGx7v9QVpb+5T2mTxd6OKX4PL0Qjt6yuMMp3ccoewZHYsa6oQfd/dh4teRznzq36f1GLyMpeQzKDkR8H3SqkNqqKM2z4a0M+NnoufNxDVu1M8g2l3e1b3lNNM4H70fl3oe/FXJy5E3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=jab1XArA; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D18612040C;
	Wed, 25 Sep 2024 21:22:27 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwJVTPf963ii; Wed, 25 Sep 2024 21:22:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1727292147; bh=4AOBEWDi+wIT+2mWhnODD4oRA7Jy5g1vOfK1zL2v2jw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=jab1XArAQCpMpUifYMzULpPmP4mLFDH14YqPBFrPOIbDkP1YvzUpHR8cLQFlWFHjJ
	 IXzqI7sENWvoev0+LlTtCV/W5T1+zpD6pEbQlpRriQUd9p4HAzyq40COGMb+XnvhqZ
	 yqx7mvOYY33lpBpQOVkykPVy9H6u2X6KJ1/RTJepHwN/mppKOxWpcNEoZ52hu8m0Mn
	 bEuD9jWZNBdoHYhfePEfbImFaUOFdOqPal0eniAaMKW25CbNsNBa7bqmAi6FS3nI/h
	 n8vvUUHHhWnXg20R0LPdhIVoKHvhG2XM6UqYAM3tLYuxV+tW1+E+deClkZJlPdUnNn
	 xMOqG17lNUX4w==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 25 Sep 2024 19:22:26 +0000
From: Kaustabh Chakraborty <kauschluss@disroot.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Alim Akhtar <alim.akhtar@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Conor Dooley <conor@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, kauschluss@disroot.org
Subject: Re: [PATCH 2/6] drm/exynos: exynos7_drm_decon: fix suspended
 condition in decon_commit()
In-Reply-To: <f64c303e-8a88-4aee-9110-ee4a06a3d67f@kernel.org>
References: <20240919-exynosdrm-decon-v1-0-6c5861c1cb04@disroot.org>
 <20240919-exynosdrm-decon-v1-2-6c5861c1cb04@disroot.org>
 <f64c303e-8a88-4aee-9110-ee4a06a3d67f@kernel.org>
Message-ID: <206c17ac8f79bbd51bf94b8f1f72fbb9@disroot.org>
X-Sender: kauschluss@disroot.org
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2024-09-20 12:40, Krzysztof Kozlowski wrote:
> On 19/09/2024 17:11, Kaustabh Chakraborty wrote:
>> decon_commit() gets called during atomic_enable. At this stage, DECON is
>> suspended, and thus the function refuses to run. Fix the suspended
>> condition checking in decon_commit().
>> 
>> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
>> ---
> 
> If this is a fix, then you miss fixes tag and cc-stable. However the
> explanation seems just incomplete. This looked like a intentional code,
> so you should explain really why original approach was wrong.

Fixes: 96976c3d9aff ("drm/exynos: Add DECON driver")

Now that I read the commit description of the above commit, which mentions
that the DECON driver is based on the FIMD driver, I think it makes more
sense to rewrite the suspend logic exactly as done in the FIMD driver.
Will do it in v2.

Here's a commit description which may be better suited, let me know:

A flag variable in struct decon_context, called 'suspended' is set to false
at the end of decon_atomic_enable() and is set back to true at the end of
decon_atomic_disable().

Functions called in decon_atomic_enable(), such as decon_enable_vblank()
and decon_commit() are guarded by suspend condition checking, where it
refuses to proceed if 'suspended' is set to true. Since 'suspended' isn't
set to true until the end of the calling function, the called functions
aren't even executed.

The original commit, 96976c3d9aff ("drm/exynos: Add DECON driver")
implementing the DECON driver, is based on the FIMD driver, but changes
the suspend flag logic which causes this issue. Implement the suspend
logic present in FIMD, which changes the flag at the beginning of
atomic_enable and atomic_disable instead.

> 
> Best regards,
> Krzysztof

