Return-Path: <linux-samsung-soc+bounces-11117-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2CEB8B435
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 19 Sep 2025 22:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F13FA08117
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 19 Sep 2025 20:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBEF2C327E;
	Fri, 19 Sep 2025 20:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RrbSRbwQ"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5944D2C3261;
	Fri, 19 Sep 2025 20:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758315582; cv=none; b=VTSZb9h1cD5OGd7InQ5w+NcaPX2GgnKPV+vqkqNOdtOCdV2ZcAGYmzYugGy/dDvYu1qZvPaQmeERTAuKWZUrnaVEqRID/eOotcEkLCQ5MXa+c3CiTm3W8Xnb3X3ovuJZv6rOXI8uR3rmXPUu/QPMsVnt9n9pGza06WiY5MSIJ70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758315582; c=relaxed/simple;
	bh=i/tnZg+7FZHJ7MVvgVqjrjsZ0b0664aRwSQlPNUdZKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4YZmZ0EWmaFZzP0ClE1Brewq+wuyx86dtvQ1JdvVgQFDieY4uAI/m1xjs0k7qV3VlHSHz5s7mPf9+rfUggkm9rol04UBWaBtdJraRTmChnSRKfhUso+J+1QI/7/nxZ/E2YvCTz/XS4AYNMGrrOA579arsjRXM8ZXUvbMb24xC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RrbSRbwQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB6CAC4CEF0;
	Fri, 19 Sep 2025 20:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758315581;
	bh=i/tnZg+7FZHJ7MVvgVqjrjsZ0b0664aRwSQlPNUdZKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RrbSRbwQtN+Kxc97iqWElOG5aU1X3r5q2TSenj6lVTLxZ+9PazqPrVyuDsIw/tH9m
	 dvH8TJf6CpL3tpXswSAHmQ0YSEFJ9enmeoPY64MeAGsYwKSHc6kFDid0glt3C9sYfY
	 L9TtY9KSObIZcNWXAj2B+pU5Ym9Uqm21Dkdn7rvHyOT7DA37aTMHktpXRhSUHGtG5G
	 mld6VmWG/+/Kip2txx4zNmQ0uVS7yziOGxvA58H6eBjCsjIo0LWG6jItyxtQWd4VvA
	 RgHgoP3XYLXKHTinj+B5KK43nY7i7sSAavb9+cC9K3P5QaEAGxSlcBVu6MSg7BPvcu
	 pLhZ9AmEZL9pQ==
Date: Fri, 19 Sep 2025 15:59:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/3] dt-bindings: hwinfo: samsung,exynos-chipid: add
 exynos8890-chipid compatible
Message-ID: <175831557662.2207360.15078209817499196017.robh@kernel.org>
References: <20250914112942.2604194-1-ivo.ivanov.ivanov1@gmail.com>
 <20250914112942.2604194-3-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914112942.2604194-3-ivo.ivanov.ivanov1@gmail.com>


On Sun, 14 Sep 2025 14:29:41 +0300, Ivaylo Ivanov wrote:
> Document the samsung,exynos8890-chipid compatible. The registers are
> entirely compatible with "samsung,exynos4210-chipid".
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  .../devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


