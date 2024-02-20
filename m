Return-Path: <linux-samsung-soc+bounces-2038-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD3C85B99F
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 20 Feb 2024 11:53:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 505CC28446D
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 20 Feb 2024 10:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D199F657CA;
	Tue, 20 Feb 2024 10:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MV5SHB88"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8CE664B5
	for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Feb 2024 10:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708426408; cv=none; b=HpNJej2H9pXOCrFDWKc/okFmjL2JZkcRzegRtL9Piop7zfGpZFCNbkiWf88VGjBNL+wVVxSNo7tQGWBB65Su67tjfUcrDhPgCBDm9bZ8n9PyCtX7wSwS++MXfs07q+BRweiKNze8HI1pN8E97ILRNr3ighmzWXn4detQSW8Pu4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708426408; c=relaxed/simple;
	bh=8vi6GmLWUFu13gK8croE2S4F5cWVZeaaePrUfRm5924=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zi5iTAHAesw3cxsJpSRX5+QJgCp/SpzAPg19J3pbWUYo0JorIBAYCG3ClVWJareV4bDJIBl2rZEwM+KMC2BbxwFyj23J/Os3zIHtOL7eVF9jDoNinRUrLmx96rjCCiAUQG8WncZ8Y7sZtRBJosJfKdPNVT87lVknvw6s5cQJCTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MV5SHB88; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d22d0f8ad1so32010671fa.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Feb 2024 02:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708426405; x=1709031205; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8vi6GmLWUFu13gK8croE2S4F5cWVZeaaePrUfRm5924=;
        b=MV5SHB88xAxe0hPoZKkkkxb66tVTWvjnFGrvE/bsMJ+lYDgglOg8gmNAEmxewMwg6C
         w83CpvmJCDvx9/MeUk/qgoVA2xmYZKikjvuB2hX57dUyxkRsVsMpbv5R3ycESIfdqqOd
         pIF2FEjfuahANLaoStX6dthVl7SpO4UgG4+5FpgKOh6J8GPbYrxwtY1BjGaLJkmfTo+s
         OziDrJrwNE2KUZTqi+dF0RZy39ZDSEvr2hFwNmwHWDCz7UqnprLGK8kx/MopXAKEnpQ/
         Fy7p7JKsLlbITkYI+hWiyHQyG3olgHoxcD1PSAzIPkhpHp878NYP0ldhuvQqb0DvxfMu
         rErg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708426405; x=1709031205;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8vi6GmLWUFu13gK8croE2S4F5cWVZeaaePrUfRm5924=;
        b=U8Gmtx/MjUSmFBo7VZ2L6bs39HBjwBR8i/fboeXa42z5SCrWSL6comwrN7yjYsiDhe
         4YpISXXFp5DjO94RntN3a+7OErRBt3LEa7adE883z3CU2xsckAYATGFgU83mpzQm1cv/
         PSkEEvMx6/COh3zgFEDdWD3XFQ0L4eIqtpHewwz/xocBnDhHUOkGxgpTCaoZsyx81ERU
         Q1dKv6WLu6jEo3BRfXqKrIWBJPGJRNeeiPrnZ7zPB1/hpj1JTLnAYfUE7r2pVRaXZd8A
         MpIa1bGksibPuG5vUOQZLpbZfbQBXKsVYP5ewI4a/RCXYASFpJzGxMoOC2izvo5gUjjG
         Id9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU2ITvGNYTeIGRRWB2A3SoyzdhoNKIi658cz9XyelR3tURGBdrJ7EVv9gUEIKk5DugzasdnqEaw7B33RHFkZqXRnc/uoQsZsqFVlvmZnyJqKI4=
X-Gm-Message-State: AOJu0Yw1HnuGsDrDC//UDC8VzsRjPGyHayS0vphI/oD0HJTFGhbuwp63
	8NURcf1QQLnPpOkhqYmjJe6sThO8nkR2zVvvCtAefZJtNfecohsO9rU2mXbwKsg=
X-Google-Smtp-Source: AGHT+IGj/7AXoisMK+BCkKwotSzF6x35dkD2gVUI9ij4ByeXOMxpFwLG6GP50Kx7b4hnuJNfmyQRUg==
X-Received: by 2002:a2e:be9d:0:b0:2d2:2aec:108f with SMTP id a29-20020a2ebe9d000000b002d22aec108fmr6573949ljr.47.1708426405349;
        Tue, 20 Feb 2024 02:53:25 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id z17-20020a1c4c11000000b004127057d6b9sm1013957wmf.35.2024.02.20.02.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 02:53:24 -0800 (PST)
Message-ID: <8c1f0a4f-8a8b-41e7-b7f1-4c5a38ec7c1a@linaro.org>
Date: Tue, 20 Feb 2024 11:53:22 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/16] clk: samsung: Pass actual clock controller base
 address to CPU_CLK()
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20240216223245.12273-1-semen.protsenko@linaro.org>
 <20240216223245.12273-8-semen.protsenko@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240216223245.12273-8-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/02/2024 23:32, Sam Protsenko wrote:
> The documentation for struct exynos_cpuclk says .ctrl_base field should
> contain the controller base address. But in reality all Exynos clock
> drivers are passing CPU_SRC register address via CPU_CLK() macro, which
> in turn gets assigned to mentioned .ctrl_base field. Because CPU_SRC
> address usually already has 0x200 offset from controller's base, all
> other register offsets in clk-cpu.c (like DIVs and MUXes) are specified
> as offsets from CPU_SRC offset, and not from controller's base. That
> makes things confusing and not consistent with register offsets provided
> in Exynis clock drivers, also breaking the contract for .ctrl_base field

Typo: Exynos

> as described in struct exynos_cpuclk doc. Rework all register offsets in
> clk-cpu.c to be actual offsets from controller's base, and fix offsets
> provided to CPU_CLK() macro in all Exynos clock drivers.

Change is fine and makes sense on devices having separate CPU clock
controller. That's not the case for:
1. Exynos3250: dedicated CPU clock controller space, but we merged it
into one driver/binding.
2. Exynos4 and 5250: no obvious dedicated CPU clock controller, but
register layout suggests that there is such, just not explicit.

In all these cases you provide not the correct offset against explicit
or implicit CPU base, but from main clock controller base.

Mention it briefly in above commit msg.


Best regards,
Krzysztof


