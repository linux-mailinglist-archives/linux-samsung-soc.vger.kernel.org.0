Return-Path: <linux-samsung-soc+bounces-9052-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D895FAEBD6F
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 27 Jun 2025 18:32:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2471E1887CCC
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 27 Jun 2025 16:29:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3B152EA75E;
	Fri, 27 Jun 2025 16:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XzXmYOkR"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819EE2EA734
	for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2025 16:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751041699; cv=none; b=H7feBOa1q3urC7VT08hlTEcScvTQzRCZyy+1IxOGS8tcT7a1u5F2wqwOATq7b39LU5VNQZrnILXc60IARA1LVDfwUYDsN0fZipJsQ8VuIUAM4jhHOiE/4Er0+BMIy+/DIKUnY39VagYpdFhTHuhEk+CttI+hYRm1JnyKsovNOVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751041699; c=relaxed/simple;
	bh=9FA9bMKxVeb5yQVsUVm+jp/IZZQX6CQBPJL+CqLfVAg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m3nhcWETQIrbNJDL9kFfjoqhQ0/qTiBRbEQ28zb7Q8QyxPlijnhTF+bwuN4QmW01W0WEFHZ+7KTZzGEj7dz6wm4q+KmkgpmJFa8CKqZsYfARJeh7BUFvhoSWhKDgQcvXeFMa+49Q9EVN3lQD/OqAoM+NoY/6Bla7Azy00EgtlEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XzXmYOkR; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2ea35edc691so608785fac.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 27 Jun 2025 09:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751041696; x=1751646496; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9FA9bMKxVeb5yQVsUVm+jp/IZZQX6CQBPJL+CqLfVAg=;
        b=XzXmYOkRJ409bBDin9CGpXNXJ/Rguok2syKgwL0r1XCkF0tzEEAz2jX1AHHcuDIi+d
         LeXiRWftzPsqNigFV4oEP5JWkqyiPK/Xro0o8uGqA3/2fegb9dqc+Uq2T/ESbE9o9brF
         lU8UPeuPu2nT4u1TkGszLmuGqV7KQea/xJW9wsJ3EXTLWGAFpBpIBEJY/fSAzlZR1Elu
         uUdpjsfI/OMYt0WpiPt19Zm/qlGGPLAU/t880gHT7dwScVPk4XbS3gR7dRib6frY6iWU
         X6P5sLE3lnjW39LkE+u/EQ6jtfZ0Rr6LevvTbeAZ4+Tw/CtYd9jIJhKOmdMQiMavDOlE
         NRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751041696; x=1751646496;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9FA9bMKxVeb5yQVsUVm+jp/IZZQX6CQBPJL+CqLfVAg=;
        b=PROLIxxT/faieEkd3qHHsgenL1CeSCubCJnlqZozmEXkTaWM4N4YZ4ZGVg/rQ7bWJH
         abupsTuNxX0FREEnYV3haEO0ZALquwfPRaf3TY0GLsT4iIruRWa9OdMw+ZZnH3H0m0lw
         QkB2dcTMcgxh6+CKcf+GFotpXYwvtcerIgXTjvobStTm1yyT7MNRLnZ4IxWalYF2SkH4
         IpOOMBSiJDBwaD6vw59wlWzU9a2+2lj9B1t6R7pZbXjtG/3w9mPR/SvuMAnSYhXLoNgT
         clm/DzNV4HEqaY3nzZGQ4N2ApFO7eNOl3272ZxrMg2sOUcsCbhmjjVgjOZ8f0TFU4MrS
         /N5w==
X-Forwarded-Encrypted: i=1; AJvYcCU+ICSiP2UrrK4l0O6voxTvVw7KwY3sO9HuE3K9+96nhU4OGIALCyrAFrvtJcjFxbvHtJqOfqDd6DFSs0PvqDuWfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/G3pSMlN/8jJVD1vxaLP/P/MgdY66/GCB8taO0T6ns+Uk2TjM
	BIHSaroIzZfkRO8ukSekFNsYsstsGkZWDzZvXgwKozmoa8StIWliSvt/L4gz6noFTmMjFXeVG60
	bjDOmdZ8RYqsONOoDWb0ZbpgI6XKqYvuocIXjYJRrrg==
X-Gm-Gg: ASbGnct0IYh+FAMtJAPXCL53dU3qK/JZmYfShHvyLwgsUDmGAHlyTlgj0dbEd5AO6vZ
	lp14cgP6T/AxBTaFRI5YZrqQTmuD+F5NmjrNc90f6m6HDKM/nGJwIBXmJB4JcVqU8a4JDNOpVWq
	fFa9szKmk3lQktVLOSVOFZHJHphSEZEcFhZOOohOTLiPbp
X-Google-Smtp-Source: AGHT+IHG27gv9karbj1NOogatAO2BrlEvYrLEtmFNeu9XKhGpRsgm/m1RTB+hY9Q08ptcJZaTLUxxE8Xd6aHQ2a8Oic=
X-Received: by 2002:a05:6871:588a:b0:2d9:45b7:8ffc with SMTP id
 586e51a60fabf-2efed430597mr2254424fac.3.1751041696545; Fri, 27 Jun 2025
 09:28:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250314-ufs-dma-coherent-v1-0-bdf9f9be2919@linaro.org> <20250314-ufs-dma-coherent-v1-1-bdf9f9be2919@linaro.org>
In-Reply-To: <20250314-ufs-dma-coherent-v1-1-bdf9f9be2919@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 27 Jun 2025 17:28:05 +0100
X-Gm-Features: Ac12FXykTIPEyZRenrTTVdLWukedtCGjmkjr6e-4BGSc71M9daw1mwCSL7G-obU
Message-ID: <CADrjBPqdr1NEd+W4ATJ-6Xi36y8Gi_=81LsFNtY_s2-pBPagFA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: exynos: gs101: ufs: add dma-coherent property
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>, 
	Bart Van Assche <bvanassche@acm.org>, "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org, 
	kernel-team@android.com, willmcvicker@google.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Fri, 14 Mar 2025 at 15:38, Peter Griffin <peter.griffin@linaro.org> wrote:
>
> ufs-exynos driver configures the sysreg shareability as
> cacheable for gs101 so we need to set the dma-coherent
> property so the descriptors are also allocated cacheable.
>
> This fixes the UFS stability issues we have seen with
> the upstream UFS driver on gs101.
>
> Fixes: 4c65d7054b4c ("arm64: dts: exynos: gs101: Add ufs and ufs-phy dt nodes")
> Cc: stable@vger.kernel.org
> Suggested-by: Will McVicker <willmcvicker@google.com>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---

Friendly ping about this patch :)

Peter

