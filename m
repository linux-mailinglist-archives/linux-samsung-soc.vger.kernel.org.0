Return-Path: <linux-samsung-soc+bounces-6587-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FA4A28587
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  5 Feb 2025 09:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C65F7A3C72
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  5 Feb 2025 08:26:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96CEA22A4C5;
	Wed,  5 Feb 2025 08:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEWO9RyE"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49541229B0D;
	Wed,  5 Feb 2025 08:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738744030; cv=none; b=YOF4o3kn4YUOcpNTwGVv2Z53yjMVo7wQqlHM42cFA0gnr2BZglcnmYnn28e7uPmb+ee7QVcrP/SqFHZOBOvsJqnii6iOz4+qmIvVeoJe+EnzOzPTcJXy8OVFmgWs+bmI5+We0VClrfAUGoWDj3O6Y9VzlWtYTLeFPQhK5HNLM0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738744030; c=relaxed/simple;
	bh=ETR1Agu6oBr3w2SdxuurAFr3g4zECpbf/Tkpdskw4tE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVZq+ee9oR68VIW6ELGaLsz/DLSKEDW4//kiIj0Y7Rs/D21+w/g7e+ppmw/cnneza7vvdOs2Mg/bdzgH+7DUmqqoXY2E6zFBXo+zHJlxFoEKmAVinfyBLJFcjhBIufaaLS3bVE+gtCbGIje5XENaH+C5WuBXOHq3ZhSX57DOEYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEWO9RyE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA4F5C4CED1;
	Wed,  5 Feb 2025 08:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738744029;
	bh=ETR1Agu6oBr3w2SdxuurAFr3g4zECpbf/Tkpdskw4tE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UEWO9RyE/R9jqBKyZtYZct+PYNR+BH5fYijbI/Uv3FBjxsYxMKVXgjxIO/yqNyTVI
	 Ee5EK9mjELYpl6QNHvYCQC0PB8X/Jd0UQamWIxbiJMxxSsbKk1+LvblycBXeX0eneV
	 yNpY+7Sl62yZRGh2un2w2lOXUBO5Ks2lp98Wzt4er2HiNXx3DUasgNL/qBOSx5POFb
	 IIFKIarNHy76uzvFMY/GofiNj2S9EbnNK/v1hbBr0R3EFI+eiV81xG9qHTo2tsXoPr
	 rPbiSklTLypnhYBGrTUk131A+cqdgRgWB3Rsi6Xoq6iPhu3wnUPKgv9FB5hILNSnmX
	 sFCXCjtVqdeBg==
Date: Wed, 5 Feb 2025 09:27:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Sergey Lisov <sleirsgoevy@gmail.com>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: i2c: exynos5: add exynos7870-hsi2c
 compatible
Message-ID: <20250205-succinct-ammonite-of-agility-4c3bbb@krzk-bin>
References: <20250204-exynos7870-i2c-v1-0-63d67871ab7e@disroot.org>
 <20250204-exynos7870-i2c-v1-2-63d67871ab7e@disroot.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250204-exynos7870-i2c-v1-2-63d67871ab7e@disroot.org>

On Tue, Feb 04, 2025 at 02:03:33AM +0530, Kaustabh Chakraborty wrote:
> Exynos7870's HS-I2C controllers are entirely compatible with
> samsung,exynos7-hsi2c. Document Exynos7870's HS-I2C compatible string
> appropriately.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


