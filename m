Return-Path: <linux-samsung-soc+bounces-6495-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FFFBA25F5E
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  3 Feb 2025 16:59:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D91163A37BD
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  3 Feb 2025 15:59:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D411620A5CC;
	Mon,  3 Feb 2025 15:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tjfWlBNE"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EA2209F5C;
	Mon,  3 Feb 2025 15:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738598375; cv=none; b=BoLKnRelkKW0G4WhiZy8uTUIx4lG8TJyC1IaALGVM+UnDnSacxPrSBEHG68BaDlhOnUiuCisF9lVuoPFVob5UcCYRX1jtABW8JyzEXTEHHfK25na7VR97G9HTUk75IraGHWwrekulVtsSI8evrbmzxtseho78QEVvg4HNVezG08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738598375; c=relaxed/simple;
	bh=pB/avWjDA66o8qKuT2L9+9mKgLG7V6fnqRlYSS+zEjA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=CFYWu/s7fSLVlNMK1DuhS0wzw5SjiFwwkB/wQqvTMM0rAeHfrF0U3QXWkxn5run2i3nhUYVBsxWelemLdwJGk8QKxvHSDX+sD+69qGtUw72G7mMnAnKHRUUWCnpX4+i/7UOGCM7PJYDZfASVcRRuehZIDwL3CCCCmgfjOCtUyWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tjfWlBNE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C28D4C4CEE2;
	Mon,  3 Feb 2025 15:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738598375;
	bh=pB/avWjDA66o8qKuT2L9+9mKgLG7V6fnqRlYSS+zEjA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=tjfWlBNE0ro2NFADlOh5t7iM+e5SYlVBcjAvJI1pvU3sAOYkBkuaLtsgzyY890KLD
	 W+/AHwBP880dWVzZhETmMYAuqqaaMUUabAL0zq7aSNZEKqR3l+8MyZV5SIjEv6C/Jc
	 fPx71AYeqD/Rw1A2U2eqWXkpBBbfLFCnpkvZOLH1BdJFC3wxGqLaN4lvbS+UQ4oml+
	 GxxemtxZ1Hf/WLwm/yrg1ESx5brqCoM+ma7EJk0/DxPP1tWMIkof3gujXlLpI26i11
	 12YJ/ZSPwL/2eQYq24WhG+khBlM9XYYqv5aLSjnOh8dFaRck8tGo66yZQNO9aHia2H
	 Ihmkm0uGc+d3w==
Date: Mon, 3 Feb 2025 09:59:33 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Inki Dae <daeinki@gmail.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: wait_event_timeout() usage in decon_wait_for_vblank()
Message-ID: <20250203155933.GA786168@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAQKjZNqFt=SYxCzpQ5JwOADRUwsWsq5KzLRoPG++27SXGubnQ@mail.gmail.com>

On Sun, Feb 02, 2025 at 01:02:47PM +0900, Inki Dae wrote:
> 2025년 2월 1일 (토) 오전 1:56, Bjorn Helgaas <helgaas@kernel.org>님이 작성:
> >
> > I don't know this code at all, so this is likely just noise, but the
> > wait_event_timeout() usage in decon_wait_for_vblank() looks funny to
> > me.
> >
> > decon_wait_for_vblank() waits on wait_vsync_queue for wait_vsync_event
> > to be cleared.
> >
> > But decon_irq_handler() only clears wait_vsync_event and wakes up
> > wait_vsync_queue when !ctx->i80_if.
> >
> > I don't see any i80_if connection in decon_wait_for_vblank().  Does
> > the wait always time out if i80_if is set?  Is there some reason we
> > don't use decon_wait_for_vblank() at all if i80_if is set?
> 
> For the decon series, the implementation for the i80 interface has not
> yet been completed. If you would like to see how the i80 interface is
> handled in Exynos, please refer to the code for the legacy display
> controller module, exynos_drm_fimd.c, available at the following link:
> https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git/tree/drivers/gpu/drm/exynos/exynos_drm_fimd.c?h=exynos-drm-fixes#n1053
> 
> Furthermore, please note that within the decon driver, prior to
> creating the CRTC, it is necessary to implement the TE handler for the
> i80 interface in the te_handler of exynos_drm_crtc_ops and register it
> as a callback.

I'll take your word for it that this all works as intended.  For many
wait_event_timeout() callers, the connection between kicking off some
operation, waiting for completion, and doing the wakeup is a little
bit obscure and hard to analyze without deep knowledge of the driver.
This was just one instance of those.

Bjorn

