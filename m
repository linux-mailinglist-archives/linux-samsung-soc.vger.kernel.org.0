Return-Path: <linux-samsung-soc+bounces-10609-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 726B6B3D3A5
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 31 Aug 2025 15:28:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4547118946AD
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 31 Aug 2025 13:29:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E24426AA93;
	Sun, 31 Aug 2025 13:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FWnTr8fa"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A445268C40
	for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Aug 2025 13:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756646900; cv=none; b=cPLeCyBjPq2uzh8wmhfO3qItIEZMUAvAsX/tconGF8ShmdN/GrDXIz8jhRQHTBT7ZdaFfkMTCOP8iEcWFrNA3OmcHA/kMKgBl60GG20FvPaOKiN5Pr5LrMazeuuneORoHOSsX+vHlC6LGlh8pzNA20rCKPMITsEwcjAPpxP8JpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756646900; c=relaxed/simple;
	bh=ST8wHdef2LgPonMkQdZRXjWtFBeRH6dlNAeB4eL/Hmo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=l7GfWcTqpGO4eX31bzLTal1k+wZ256NZWgh9O3pWj/K1I1Pj93fGTkGDWOclZ/eGyqSXhSRHJwA1CXCH+SsauHIzK/Ko+EowHBiyKylQN/fcg5JEtQXE4i1HNSsBpHyza9MfqjIOKuLKuZBuBuD7FN2p/HDCmyCoz8Eahzsf5Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FWnTr8fa; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45a1b0ce15fso3810135e9.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 31 Aug 2025 06:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756646896; x=1757251696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VUsiiWH7g4d6FEVfKTRPbe3R6ugJoOhF5bsWtOAIO6k=;
        b=FWnTr8faMjnNB12zUdraVl3FGqwHH7oQQBg/HvIOi2vusa0cjXY5fuooqPXTj4dFli
         VtgDnoa+ZaTHrrYUSDBCChpWQVNqrtrpiQUyD48qbtzGkRnXPq1KmiAvpvTYKRs+qGv9
         mfgVIhNJ1fmsNlxtfZExJ82+ItcrK0KDzfFE9iKrVGxQ0YxY7aBsONFOTYsUjFfO3Q1S
         /UKViy098h4uWO3VcDgyRLLuQy2q2RZPORi6ox2NrOtbxwFxLUZaopOv3r4CRfSZ4xsU
         tWyfbou35YmlbpGkbJgCcDlQ0CMtoMn//8sb99G2Qh8AJGEnvQYAV89LGJXJkle11gq4
         7Tkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756646896; x=1757251696;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VUsiiWH7g4d6FEVfKTRPbe3R6ugJoOhF5bsWtOAIO6k=;
        b=P/YALv5NZSwe8Cqn9bluT+0J9wIgnTlZrVVk734ie71wQFN8erBugSGiP3eMFWllfX
         B1cQLrMVVY24PevBRi3CnDT0Z9CFr4LoTA4iHFPXNUaaB5pUgXfjolxcARDbQnczoB+0
         wpqJhqcniKK+SnZIeaEsTl7PgpXUf6FV875xx62VwqrNJ7boIMvqNAD1g3F8m3AKYYbu
         +kpFfmc3Oi82+oSWQ1Hrh9Fz5rRndRqmdcAEII05uLLlrL/2m1MNgvy+gUvT9Y9UExEn
         hCL0m0p/bmQ6gX/khBpVyNmZtShVuOjfvorrk7M5MDySLGxSV8aMeGW6R+FAkkWiQ1rA
         ZBXA==
X-Forwarded-Encrypted: i=1; AJvYcCWVovGeuM4WldQWEZ/F+wYdLmuDKvhpe8Mjhas680UO24Am7E7jYHg+uveSb7aD5ZIKUI30O2PM4FrS03W/5WHwDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpQQGf1Bbr3znf62EgsyeqhB9YUkZRES0n3KjjIHkpCDHY1iJ4
	ayw+95BzXR/7Gloom8+svtUudDmksUjv2f6YuazTIXqn+zHk40eBSb1fRmGlDu3mG4E=
X-Gm-Gg: ASbGncuJpsvwCxgbMygPjRDsm/W/tpbJLOQ6wgh4NbcSa5fpb46siEbI/aUwJUdzRxe
	9IlQry3UVtfafHNLGdbs/4KmAson1XDmI0ScjeU5rMrNSTe5B5v8owNXSRWPPWygngQ+UYhAGdf
	4OP5h7llnubTl992nRPANzMAUk1Sc+l/2WDJ87N+JknOrMjMQ62mDMIsXmWut8nfDkbFCFdBiA+
	uy2svQubwDc0auGx3EAxho0w22SHFWpNgvCJZ2zICw6dtt2rh7+h5PNi3/gWpUQ/IKQYKYpwXFr
	Ehm9qbq6QA1XQ3QMOiNj83J5f9mCBSqyNZTa89hlkRo7kXeB01T4dEUF6UR5RNHYZMDlfYhmn19
	XORj6SR504ykV1hZ8uKqGSqikA50fg64+9ybYV4ruONf2h+yDqw==
X-Google-Smtp-Source: AGHT+IHuGuVHHk5pZhTIqaJ6T0pRMpVLKOi+qYDhard/uCHRhDaK8a/HDroJFFPgp6qQQ0xTGeYLmw==
X-Received: by 2002:a05:600c:6385:b0:451:dee4:cd07 with SMTP id 5b1f17b1804b1-45b81e23616mr32007925e9.0.1756646895694;
        Sun, 31 Aug 2025 06:28:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b87b3900dsm29956925e9.0.2025.08.31.06.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Aug 2025 06:28:15 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: jesper.nilsson@axis.com, mturquette@baylibre.com, sboyd@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org, 
 s.nawrocki@samsung.com, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
 linus.walleij@linaro.org, tomasz.figa@gmail.com, catalin.marinas@arm.com, 
 will@kernel.org, arnd@arndb.de, Ravi Patel <ravi.patel@samsung.com>
Cc: ksk4725@coasia.com, kenkim@coasia.com, pjsin865@coasia.com, 
 gwk1013@coasia.com, hgkim05@coasia.com, mingyoungbo@coasia.com, 
 smn1196@coasia.com, pankaj.dubey@samsung.com, shradha.t@samsung.com, 
 inbaraj.e@samsung.com, swathi.ks@samsung.com, hrishikesh.d@samsung.com, 
 dj76.yang@samsung.com, hypmean.kim@samsung.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@axis.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, soc@lists.linux.dev, 
 Varada Pavani <v.pavani@samsung.com>
In-Reply-To: <20250825114436.46882-4-ravi.patel@samsung.com>
References: <20250825114436.46882-1-ravi.patel@samsung.com>
 <CGME20250825120710epcas5p421c3c8169019599e76f782bb7086e0e1@epcas5p4.samsung.com>
 <20250825114436.46882-4-ravi.patel@samsung.com>
Subject: Re: (subset) [PATCH v3 03/10] clk: samsung: artpec-8: Add initial
 clock support for ARTPEC-8 SoC
Message-Id: <175664689350.195158.6648344469963977673.b4-ty@linaro.org>
Date: Sun, 31 Aug 2025 15:28:13 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 25 Aug 2025 17:14:29 +0530, Ravi Patel wrote:
> Add initial clock support for Axis ARTPEC-8 SoC which is required
> for enabling basic clock management.
> 
> Add clock support for below CMU (Clock Management Unit) blocks
> in ARTPEC-8 SoC:
>  - CMU_CMU
>  - CMU_BUS
>  - CMU_CORE
>  - CMU_CPUCL
>  - CMU_FSYS
>  - CMU_IMEM
>  - CMU_PERI
> 
> [...]

Applied, thanks!

[03/10] clk: samsung: artpec-8: Add initial clock support for ARTPEC-8 SoC
        https://git.kernel.org/krzk/linux/c/bd5336e3f7040f300b01702215b45e6267a400cc

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


