Return-Path: <linux-samsung-soc+bounces-1163-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A1E838EFF
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 23 Jan 2024 13:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79B061F25C93
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 23 Jan 2024 12:59:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5415F860;
	Tue, 23 Jan 2024 12:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dwEiL28r"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AB75F856
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jan 2024 12:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706014498; cv=none; b=Gndull3F03oYZ10JuPq72QlJ0JDW0hxcXDLQRxDORUtvaV7UIeaKT76pJFkb1LRdhZkLpZYvJPdO9OkRHBqDovBl9k9rV35UebKyv6glBB0dosj3GivwSPGfbVYIxV91N0FRsVuFUrUwB/zMs/JW3OrFo/sQQ9sNALpYIWtFSGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706014498; c=relaxed/simple;
	bh=O0FJHSfKYfe9PmreWTwOZnuzqGNOcsslT8fd0nZ0oaQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=clCys7CXqK9D4PsQ5WzzQQFfZ00I8v9OWtVwbMfa0rXcj6/hsV+Al4yikFtmq3xlcXtRu+0yMyycdwJzP8qrd60hiXWzzpjIYM6WevwPpvIPONIDJqO9EzKabeERx70iKbbB8U6jHgBNsgbifHY2i+FkNY/EdiIW8yewxD/bc+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dwEiL28r; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-337cf4ac600so3988488f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Jan 2024 04:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706014495; x=1706619295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BXv6GcvHxSamJACw/Vu/xjD9IvTTgaCvE04/PYg7Tv8=;
        b=dwEiL28rbaDH/pkTSxinpiG6vo9U5srydYbZT604k7kJa2JxucuoZEQnkDab/kuh9M
         Gll2qETcy6CPHg5w7h4DM/3Xc3CQrpYVZqX6Gmttz3QNIxFlK8x996EZcSvAI0cm+LSi
         K+Nmfqd4Lx2aZcYoUzdoy9qHB08L3OtxYTyRTNuI8iwu5UbnH5xv2XXZgAlTfCUgLm3x
         odsbQ+s3/Dmg7FHC8j+vo8bD/GbcnTUvxH7L7saiL2ufXrcGp2eGkaSBV+2uISJWKkzP
         HnRnjf56YHAYv1MYuYWWLUCpUSCHf1xyAj/hnx2eMS+etB0hpCdxb44FtZ7nytuBbD2Y
         Oi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706014495; x=1706619295;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BXv6GcvHxSamJACw/Vu/xjD9IvTTgaCvE04/PYg7Tv8=;
        b=vXrpVjGqiEJmo7pFp25beyCrKhA2f4tBx/hvTFHJBdCVKCtZt73duZV131ZLAcWZIM
         eoMk1r5Td9TsXWOLtfa0gZHH3iOnDOFLgAENZfM0nmvd5qiNrbqyT8gdIvDJW4v70wbw
         uCojy3YzFZf6haWGceKNAiXQlznHpvIhdItN0wp6y1l96xFFDU6cgK+Z8v2i1ydMxhlx
         F6lSOfdrobLZGQdHvcAIn60Mb8CziN5CqDWCq0u/Sh4diFFoZGJIYXfDgw+XKbNdBd3j
         Jo1r8HK7sOlqLqd0VG4TGDOBibhzJKSsXWJ2UiVKWnfHY9SvOx5GTO+ZXXJe2jwHrrAH
         WGZA==
X-Gm-Message-State: AOJu0Yz0J9d1LXbsZb637PAMs8nAvaqi+beQZ6Fssy9DSd2bFmU6wKht
	Ti4FmrUGNeC1jL1b5vP018HZevfeUlaEgUEFuXA7WM63UjO+rEwcLDYATmYfKVc=
X-Google-Smtp-Source: AGHT+IGCm88E7Mb6BMnwj+m60uxypS5GrB63KptppN7rx+rdWWmrbOjaOWjtIGTHjQOon7qjnATKbw==
X-Received: by 2002:adf:f20e:0:b0:337:bf9e:c0c7 with SMTP id p14-20020adff20e000000b00337bf9ec0c7mr3756643wro.27.1706014495093;
        Tue, 23 Jan 2024 04:54:55 -0800 (PST)
Received: from [127.0.1.1] ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id d6-20020adff846000000b0033725783839sm16173587wrq.110.2024.01.23.04.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 04:54:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Andi Shyti <andi.shyti@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
 linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
In-Reply-To: <20240120012948.8836-2-semen.protsenko@linaro.org>
References: <20240120012948.8836-1-semen.protsenko@linaro.org>
 <20240120012948.8836-2-semen.protsenko@linaro.org>
Subject: Re: (subset) [PATCH 1/7] dt-bindings: clock: exynos850: Add PDMA
 clocks
Message-Id: <170601449352.48954.11601245809418910717.b4-ty@linaro.org>
Date: Tue, 23 Jan 2024 13:54:53 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.4


On Fri, 19 Jan 2024 19:29:42 -0600, Sam Protsenko wrote:
> Add constants for Peripheral DMA (PDMA) clocks in CMU_CORE controller:
>   - PDMA_ACLK: clock for PDMA0 (regular DMA)
>   - SPDMA_ACLK: clock for PDMA1 (secure DMA)
> 
> 

Applied, thanks!

[1/7] dt-bindings: clock: exynos850: Add PDMA clocks
      https://git.kernel.org/krzk/linux/c/bc8cc7fb55b8da8c6b947603b1bad585e866b90c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


