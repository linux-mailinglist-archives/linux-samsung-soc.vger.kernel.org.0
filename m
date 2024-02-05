Return-Path: <linux-samsung-soc+bounces-1726-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EAB84A084
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  5 Feb 2024 18:22:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44124282E76
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  5 Feb 2024 17:22:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C8F41746;
	Mon,  5 Feb 2024 17:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="We1r8X5g"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4EF48780;
	Mon,  5 Feb 2024 17:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707153685; cv=none; b=tQvmFL0ZMr6Tk492nD9RWDfCF/ckqsj8xTpLiZDokqXaaCFqmLkJppwWqwgn2f0DcxOkuzYsHhWc6MpN/921Pcqmsjo4XKncYWk/LuEFxGC7FfhnrjJNjGAAiLUKH95YRDkf9xaS5S3Hm9/rBpUOycjjXAat07u8hDnxz0hKoA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707153685; c=relaxed/simple;
	bh=TtEdRyvBolsu7hDkQmw3V3u02IpjDyC0rSysvf+GMjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XjMcoFYZyFQJh3NCeFpzzc7flarhOjA3qdjkBrgLSbNP+R7eHKDehhxAU5D9Y9FKTgy5OQ0HIEqh1O4a1J3rwjMP4ZdC2pla5i3iSiaHX1kUy4E+iUjOLFVooyfqNr8P6ZOKVgJFTGOTZiZNWOFCmcFB2mX5xg2v9W4MrFjqqec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=We1r8X5g; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC82C433A6;
	Mon,  5 Feb 2024 17:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707153684;
	bh=TtEdRyvBolsu7hDkQmw3V3u02IpjDyC0rSysvf+GMjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=We1r8X5g0i7EQ8I1wQztuyCM/WFbDr/htyuKgUDFK8sXnPRCFOE8xi5fAFcmZ63ts
	 kKVtPGC9M1IIvAnyNA84h8NCmzrmc2iAcs8hRatrp5C3s4qSrHLkNoNuOr5zklmFyH
	 5qvPiEgapCotI1UANSOqqG8t8mY83gG2qd06ka8GydAdkN3sVjNv4YJeXeUNmJT2uO
	 qc7E/tyEb3V+y8tpfjBw5GaAZitZy3O597YZZCXPcUIUJL6k8kwaN3GO7q0yc1MSaG
	 +M2CHCF8Cp4RzXk5rlSYpwE4Yj2Z6UO4QqqQnKeXdJb7bgUmiV7RTAdE4pvlzqDCzp
	 +97ay1DyIgVUg==
Date: Mon, 5 Feb 2024 17:21:20 +0000
From: Rob Herring <robh@kernel.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: tudor.ambarus@linaro.org, linux-samsung-soc@vger.kernel.org,
	krzysztof.kozlowski@linaro.org, krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org, andre.draszik@linaro.org,
	kernel-team@android.com, peter.griffin@linaro.org,
	robh+dt@kernel.org, arnd@arndb.de, klimov.linux@gmail.com,
	semen.protsenko@linaro.org, saravanak@google.com,
	willmcvicker@google.com, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alim.akhtar@samsung.com
Subject: Re: [PATCH 1/4] dt-bindings: hwinfo: samsung,exynos-chipid: add
 gs101-chipid compatible
Message-ID: <170715368034.3642320.248183501361428491.robh@kernel.org>
References: <20240201172224.574238-1-alexey.klimov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201172224.574238-1-alexey.klimov@linaro.org>


On Thu, 01 Feb 2024 17:22:21 +0000, Alexey Klimov wrote:
> Add "google,gs101-chipid" compatible string to binding document.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  .../devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml        | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>


