Return-Path: <linux-samsung-soc+bounces-2650-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BE6899A2C
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  5 Apr 2024 12:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D81A284ED7
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  5 Apr 2024 10:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F93616191C;
	Fri,  5 Apr 2024 10:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Npm0cDWT"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC17C16190B
	for <linux-samsung-soc@vger.kernel.org>; Fri,  5 Apr 2024 10:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712311525; cv=none; b=L/+HLKh9yM+YtETOFVbxnu26RIiggyRI60DYNVVE/An2ipDB6O1uS+LYKluF5o0zBcPLSuj+CYT47xjDRu1NVpgAb6B6DVyDNFy3lfpyFqC5GDNFjlC3Km92gUQmfr5IO8Q1Lff86PTLeweEY+0MGSmYviHu4PNI0Uy7/OMpKok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712311525; c=relaxed/simple;
	bh=5faoT9xunTo9gmrfIgQNKCITOx66fCo3gMcXas4GecM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=ZR6fuwkPCAwGP1BFD4PO/K3ReKmO24Os630JbRJrnR/PCf3m1aVAwvbIfji3QZ/wMtzUDfcqvx2b05G9rPsm1/SabqGGG06q/DQQeXe8tAPqdf7ByuNceswFa86GneDVeqKhayCyT4/8ksFd9R1dhzDBdftCF8vjJLfc/dpE+sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Npm0cDWT; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2d4a8bddc21so25312311fa.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Apr 2024 03:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712311522; x=1712916322; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwcV05X3lqi4MM+buZxa5Jcly8fqYYsYkniToo40n50=;
        b=Npm0cDWT7zT0KM1edc2dkRy9SPK6iBF80s0AqPGNYSoi92cDbMHdk25VKESGV3KG8G
         HLzgvDAjp2cwKDHnyJyzJ/0rxrvPrWTsTm0TA6Yag/O1rH9dHByhDTCqMzmXmGVgYoam
         XBtM14eJ+mzZbeMg0Fz0S7hw0nrl2yvHkhbup6hw2LifBT+yMhckns4+Ze9Psr4gxKQ1
         b10FAoqQWFBEx5pfPeenJZzCHXZvVxqUsuspTRUhOPmYv454/d+vfTyRQJARmZjJwXzk
         s64n5TdAQxWJVch7f78ycZXPvJFg+Lacux7DfqONl7kNLkLnSjdvdoXdpkm4/z/HfMDm
         U54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712311522; x=1712916322;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WwcV05X3lqi4MM+buZxa5Jcly8fqYYsYkniToo40n50=;
        b=YVbj/+PV9GLfkxy9/SjsxrL0Yz0agkV8fQ/fZUvwjP1zWZE3y+Rs8UNUSlrYLDBxj8
         E1NVp0d9IVJAwM8pJ5iTHvz8+b97vQB10M5gossuUfCk3IIYa0Cb2QdizVWD0CX05cnc
         xxSEgE0pt/n5M1G7vzKQz75cDxYm4J18hJfnExTQMzCeEQz4NPgFJn95ilGxQhPFJUL0
         xc9xrTSOKnfNllDnKF2rggbTK27l7WGSB811HEoeV81yvGR8Cq70Xatr3cdA6lx3UbwF
         fPw02GrGHgnuAjQB4csV8BZ4rR6RYiLIMjaZKTM/z1CZ+tuBim1cpiW/iJZIBe1Sze0S
         YUEw==
X-Forwarded-Encrypted: i=1; AJvYcCWwaSDVqZ2uVdnLee/HFsqzYKtx0t7FhCX1zAC/KwmFhIwp+pgTgtvZ8wJzjF1qs+BJFmqUeHXsk1X9oAfc3T712ihB2fWsDLGGmn8Z6MbRbV4=
X-Gm-Message-State: AOJu0YyJPXW+4dHUa5nBbmhVvsxBL7UbrCnAaY1rPh9L4cVhbXNzFHxJ
	1fskX0Zy4CdPOieIG+pLFDhX1LgKpUCfTY5xrDtGYcM8PcpDz5LFbKENHexL10w=
X-Google-Smtp-Source: AGHT+IF/mnkjD81MfQ9NRJLmv+Df3tYQPOjV/tVLAZmpQGuXJx5AC651mf0V7ABqFuKf8dZ5K3m+Xg==
X-Received: by 2002:a2e:9b0b:0:b0:2d7:1830:d5f9 with SMTP id u11-20020a2e9b0b000000b002d71830d5f9mr742081lji.31.1712311521856;
        Fri, 05 Apr 2024 03:05:21 -0700 (PDT)
Received: from [192.168.2.107] ([82.76.204.14])
        by smtp.gmail.com with ESMTPSA id u11-20020a05600c210b00b00414674a1a40sm2312275wml.45.2024.04.05.03.05.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Apr 2024 03:05:21 -0700 (PDT)
Message-ID: <e4089855-aca9-4993-bac6-e59370cf7954@linaro.org>
Date: Fri, 5 Apr 2024 11:05:18 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: GS101 pl330 AxCACHE
To: Arnd Bergmann <arnd@kernel.org>, =?UTF-8?B?6rmA7J6s7JuQL0pBRVdPTiBLSU0=?=
 <jaewon02.kim@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org, bumyong.lee@samsung.com, surendran.k@samsung.com,
 l.stelmach@samsung.com, m.szyprowski@samsung.com
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-samsung-soc@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 William McVicker <willmcvicker@google.com>, kernel-team@android.com,
 Sam Protsenko <semen.protsenko@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 sugar.zhang@rock-chips.com, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, jassisinghbrar@gmail.com,
 "Simek, Michal" <michal.simek@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

I'm trying to enable the pl330 DMA controller in GS101 and I'm facing
some problems related to AxCACHE. I'm writing this with the hope that
someone (from samsung?) knows a bit more about the pl330 integration and
its AxCACHE use.

For simplicity, let's consider just the DMA_MEM_TO_MEM case for the
moment. With the current upstream pl330 driver I see that the dmatest
module complains with errors like:
  [ 6572.661927][ T6358] dmatest: dma0chan0-copy0: dstbuf[0x18e0] not
copied! Expected cf, got 3f

Checked the downstream driver and found a fix:
-       desc->rqcfg.scctl = CCTRL0;
-       desc->rqcfg.dcctl = CCTRL0;
+       desc->rqcfg.scctl = CCTRL2;
+       desc->rqcfg.dcctl = CCTRL2;

According to CoreLing DMA-330 TRM [1], the {dst,src}_cache_ctrl fields
program the state of AxCACHE.

AMBA AXI and ACE Protocol Specification [2] says that these signals
specify the memory attributes of a request.
  - CTRL0 -> AxCACHE[3:0] = 0b0000 (Device non-bufferable)
  - CTRL2 -> AxCACHE[3:0] = 0b0010 (Normal Non-cacheable Non-bufferable)

AxCACHE[1] bit is the Modifiable bit. I guess that GS101 can not meet
the requirements of Non-modifiable transactions. But why? Culprit could
be TREX, the non-coherent interconnect, which collects requests from
different masters and sends the request to cache coherent interconnect
and to System-Level Cache. But I can't pin-point the exact restriction
that comes with it. Any hints here are appreciated.

Thanks for reading up to here. Let's consider now the DMA_MEM_TO_DEV and
DMA_DEV_TO_MEM cases. I guess that for simplicity the driver author
chose to always set CCTRL0 for both src and dst regardless of the memory
type, device or normal. This is possible because normal non-cacheable
memory can be accessed by any Manager using a device memory transaction
(see "A4.5 Mismatched memory attributes" section of [2]). This can be
improved however, if we use CTRL0 (thus Device non-bufferable) for DEV,
and CTRL2 (thus Normal Non-cacheable Non-bufferable) for MEM. I tried
this suggestion on GS101 for a MEM to DEV transaction and I get
timeouts. I tried the downstream driver as well. The downstream GS101
device tree defines all the USI nodes without DMA support, I guess the
to/from DEV transactions are not sorted out yet. I enabled the DMA use
for USI in downstream and ITMON complains with "Unsupported transaction
error". Any feedback is welcomed.

Thanks!
ta

[1]
https://documentation-service.arm.com/static/5e8e25befd977155116a5ad9?token=
[2]
https://documentation-service.arm.com/static/602a9df190ee6824a1e02b98?token=

