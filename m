Return-Path: <linux-samsung-soc+bounces-2359-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72E6888A4DB
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 25 Mar 2024 15:42:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 901A71C3C199
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 25 Mar 2024 14:42:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782F316F8F6;
	Mon, 25 Mar 2024 11:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D/W3xGaS"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3237E16F82D
	for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Mar 2024 11:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711365221; cv=none; b=A45wX39Rj6JgT4uDQ+Tbnnfof5wtEEQ0DfA+kkFovviIytJNtfoO/Xub9aAyABpW/1iqFfahilkcMBhrTyQN8VqHf77kYsXT0KJqt3Qoz01mpaoDIfwhfogKldqsdCzY7Nop32PkOtRVL07jQ7/LBXt1U/1gXsZDSoLq7N7Os2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711365221; c=relaxed/simple;
	bh=9PMUjn8RdkjtSyngjkr83QqyrlJOo/C/rNsA96zzs78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JJGGYzPjooYtUb7yjOIXJQsXiivmcZX9TB7R36Uy11IObMkdHyPFIbxC6nCYl0UN7q88aqPgHwFwV6ssTpo/AbDFscfdCmVKpWD2XrijBXZ3BGns1ga+B3B+bln9zQVACtI4CPpDH2XNvNeuB8WWf12BVaAydmVvnPIgmId056Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D/W3xGaS; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a47385a4379so412306666b.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Mar 2024 04:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711365218; x=1711970018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GVTLPRNC8lERWtFEKllCFLlAr+4rekLqrYnvlo/C204=;
        b=D/W3xGaS56mjL09e0oN1uOGx+N1LMr9v8wsZuywx3scZ4AaaCpkyhAEwDZvvlcX21V
         0zpqH/KE+ajLWoLkaMV8nSsskIYBczAQDiRQnamwWcs+Ux5UsZILOkv7v/vtz2riKUFU
         KEewvI0utUs54uYVWSCi4KX7ijavJQS0VyvdZ5vvESApUVIIL5Z5Ixfr6l6v6cIuDsKs
         9V1dO1RbWpHHRh+sxY+DT4BtQHPmYS642u5pNcrIkkplvWIOF0/RFbZsL56NEiN5uEHx
         VO050hG0zL2K3yw0RHc5OM703yF5Q4u27MDFHbdg7j89anHDJVn37mADuOVsxA6wb2co
         MSZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711365218; x=1711970018;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVTLPRNC8lERWtFEKllCFLlAr+4rekLqrYnvlo/C204=;
        b=e1FxLWOEOU0ARj8NUQfzWdVtGQ0RJXp+qSL4cy8E2OxXTJHAXhlGRnzCgvrjM3Cw0f
         lAqYC7Z3GaOb3QkvutiTtgWKWrBERMoCLKYI7Es/LNluc9YuDX3ayNkIuvSCLEsYXwTD
         tKSapjawVXMPtWT1IKm/qHEQlxaT6/qVhEt3jUcEev9xuW8PCK8vj6R6buKsj/1Lljmu
         EPvSZtXOPUC3bCE6XziX96FzymURWTeDhJ0nKXlgJgrHEMmzb8ccc2Z5UiWsKiCbzspT
         /QOtQzwYDkDSJV5MariNF1V8W73k6q3IU3g28FO3fsjlK2+M5PHFNFmBexCPyRAij+VV
         /lIA==
X-Forwarded-Encrypted: i=1; AJvYcCWffN26C21ObtEmaDvaDQ9mCSea4i1LTyE6hHCa4tNsQq1WDtqUHYuxDCBU7fqx8mGi4/CmZ3vHAIxs4TQfU6jvJqgPwbB24V0oK3UM4pu6ZfI=
X-Gm-Message-State: AOJu0YyDAkuRNY06ezb0lEPEFElYd2jChF+iahkU0u4LYsZsqnimizrD
	CCbMqRLIPsCWRLcbvBl3ipGcA2Uqs/IUpiENv91VDPdgSsTRw47pObJptNP+CIY=
X-Google-Smtp-Source: AGHT+IGWJgUWwiyuSJJARP08SDpf9eX4VrEW4YkuyG/NTERYUB5N6tRJO3ciAhp4KXQS5nhmrR1zAA==
X-Received: by 2002:a17:907:9804:b0:a49:833d:a9ad with SMTP id ji4-20020a170907980400b00a49833da9admr2666831ejc.38.1711365218577;
        Mon, 25 Mar 2024 04:13:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id h10-20020a170906590a00b00a46196a7faesm2943993ejq.57.2024.03.25.04.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 04:13:38 -0700 (PDT)
Message-ID: <1d9f160f-e155-4d2b-b598-d1dc76e49110@linaro.org>
Date: Mon, 25 Mar 2024 12:13:36 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] ARM: dts: samsung: exynos5433: specify the SPI
 FIFO depth
To: Tudor Ambarus <tudor.ambarus@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org, robh@kernel.org, conor+dt@kernel.org
Cc: alim.akhtar@samsung.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, broonie@kernel.org, andi.shyti@kernel.org,
 semen.protsenko@linaro.org, kernel-team@android.com,
 willmcvicker@google.com, andre.draszik@linaro.org, peter.griffin@linaro.org
References: <20240216140449.2564625-1-tudor.ambarus@linaro.org>
 <20240216140449.2564625-6-tudor.ambarus@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240216140449.2564625-6-tudor.ambarus@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/02/2024 15:04, Tudor Ambarus wrote:
> Up to now the SPI alias was used as an index into an array defined in
> the SPI driver to determine the SPI FIFO depthj Drop the dependency on
> the SPI alias and specify the SPI FIFO depth directly into the SPI node.
> 
> The FIFO depth were determined based on the SPI aliases that are defined
> in exynos5433-tm2-common.dtsi:
> 	spi0 = &spi_0;
> 	spi1 = &spi_1;
> 	spi2 = &spi_2;
> 	spi3 = &spi_3;
> 	spi4 = &spi_4;
> spi-s3c64xx.c driver defines the following fifo_lvl_mask for the
> "samsung,exynos5433-spi" compatible:
> 	.fifo_lvl_mask  = { 0x1ff, 0x7f, 0x7f, 0x7f, 0x7f, 0x1ff},
> Thus spi{0, 4} were considered having 256 byte FIFO depths, and
> spi{1, 2, 3} having 64 byte FIFO depths. Update device tree with these
> FIFO depths. No functional change expected.
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433.dtsi | 5 +++++

This and next one has wrong subject prefix. I fixed it.

Best regards,
Krzysztof


