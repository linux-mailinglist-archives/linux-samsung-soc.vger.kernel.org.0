Return-Path: <linux-samsung-soc+bounces-2275-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 543B188690E
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 22 Mar 2024 10:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BF32F1F25B2F
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 22 Mar 2024 09:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534E21B7F3;
	Fri, 22 Mar 2024 09:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j2q8Pc+h"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D1B1C2AE
	for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Mar 2024 09:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711099036; cv=none; b=Osu8jfpWoF5Z5lrDptHBqhI9xhbeQLB8rGMK83z+eLg4O+grPXLeRDjfO2vkl7ZLt66VM7jFr3dgm/QW5Hrv05OzfxXGvAQW2NVjcwRaGrR8x74RcaFVyliZY9e7/xdABySpR1SryGzQXb8Qq7D5lKji0x+RgqMi/z8l5kp1SY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711099036; c=relaxed/simple;
	bh=BnqFZuBPOQ/1oZmEieiOWKGOwcPnQUJTN8zI9s8x3B4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PeqvSRX0/QMsPxS1/m9RU4/+SRK6Gqx/N9A+fKtk+Ai/gqPsEPJAJZERyyCEYhVx9KT0obb0LrtjgQJhPnNjoeNRqDcnFRi2GgsTJS3anUpHGWrqhaL8tyEt+3YH6eacgwAsLfJttKbQ6V7m3PWE9gKwuLYODsXHtZUncQ7am2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j2q8Pc+h; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a4734ae95b3so27676166b.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Mar 2024 02:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711099033; x=1711703833; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wQ03dPvbzMpRi7eWEJdHXaZKi6IgHd35+FRG3t2T590=;
        b=j2q8Pc+hClpcHmRe7z5bz2QpXE1nmzi/7Rxx4Lm5cZeXvWdk7I7xuWqa9DlJi+OsKm
         TqKFoxRdktA4qWLnuEZ1uNu/QL8dAB0GZJUy6P0T8fKCwloV2ZNXPLWkGZ4b4rQYey5P
         75a5dXbtVVTdfj0SWF69B2u35maO/wHdVCWDIOnGnfGPE1wHUOrXPUuout8CigsXR+Tr
         m4V6J6NkT9XUMU6NGVEzLlJrfh5+k5DeSKszdcPanda8JXPTEFIOU5+xNQNBx/m+DyzT
         6AjBgQ65zIB8dkICIls0d7Zzh5sqqSvz7wUH7nzKQak+HV+kDeV2OKwCF5nZ+10goypb
         tSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711099033; x=1711703833;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wQ03dPvbzMpRi7eWEJdHXaZKi6IgHd35+FRG3t2T590=;
        b=AQPt+Mffcyg3yvD5HrX5CSS+FmigSnVQ+wA3SF0yjJSD8hvWy/k8M0pJWiMH25ZuUM
         ebtI/u53p7ByRCL6of0s27ERPvGLPMykXokxJZol8IPdmUkXVUPui/Egu2HhQxKr0rBr
         JgKtNjPENrj+3YDozLZj3ILhJNlHdIfM45eLAaFDZRcpWOQX18LCyetqyhiri67NIA1t
         JK9Y6JX3paIe+g/UehzZVln9uRzOiR8Q/TO2U6HTgPNKMPFqsTemkob6HRjW+Olik3In
         GIAkO7rP19vXYJmtT+ZWK483jH2M3gWhYAM1onTfsJLxuvW2BQF5Hgb+XECB/sPcW2zo
         snnA==
X-Forwarded-Encrypted: i=1; AJvYcCVI9B7EJMXaUJ/7jx1NIcUj6QBucx8XmYLIyjiNH9DAD4g4xtpvckAiNW4aRTORUtJTLdAHybGXsEpEJ7gq5iJcheFy1J66addivIQz6aczhOU=
X-Gm-Message-State: AOJu0YyP2F//enkAoHHFqwTrC9uztGKxmgDKwgNr6jV0fDW7Rl/m7q1z
	RN3q+I1lHHF+ojm0O9QZIq39Um2I41L6UCEzSQz6xkACk8y20oeRGRvJQ+QAanI=
X-Google-Smtp-Source: AGHT+IG0gM7oX0za3mc7H4omG9BZBm/xluMZh7IubNesmj5Lf2R09cBSpu0v45lTT9aqyYpialFynA==
X-Received: by 2002:a17:906:b24c:b0:a46:d789:812d with SMTP id ce12-20020a170906b24c00b00a46d789812dmr1315201ejb.52.1711099032634;
        Fri, 22 Mar 2024 02:17:12 -0700 (PDT)
Received: from [172.20.10.10] ([213.233.108.187])
        by smtp.gmail.com with ESMTPSA id jg4-20020a170907970400b00a4652efd795sm814525ejc.83.2024.03.22.02.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 02:17:11 -0700 (PDT)
Message-ID: <71df1d6b-f40b-4896-a672-c5f0f526fb1f@linaro.org>
Date: Fri, 22 Mar 2024 09:17:08 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: samsung: clk: re-parent MUX to OSCCLK at run-time
To: =?UTF-8?B?6rmA7J6s7JuQL0pBRVdPTiBLSU0=?= <jaewon02.kim@samsung.com>,
 'Sylwester Nawrocki' <s.nawrocki@samsung.com>,
 'Chanwoo Choi' <cw00.choi@samsung.com>,
 'Alim Akhtar' <alim.akhtar@samsung.com>
Cc: 'Sam Protsenko' <semen.protsenko@linaro.org>,
 'Krzysztof Kozlowski' <krzysztof.kozlowski@linaro.org>,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>,
 'Peter Griffin' <peter.griffin@linaro.org>,
 =?UTF-8?Q?=27Andr=C3=A9_Draszik=27?= <andre.draszik@linaro.org>,
 'William McVicker' <willmcvicker@google.com>, kernel-team@android.com
References: <CGME20240306032022epcas2p14368c055af804c2f066a6b1ec5cee070@epcas2p1.samsung.com>
 <d508dfc1-bc28-4470-92aa-cf71915966f4@linaro.org>
 <000001da7068$7f60f020$7e22d060$@samsung.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <000001da7068$7f60f020$7e22d060$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 3/7/24 08:21, 김재원/JAEWON KIM wrote:
> Hi Tudor

Hi, Jaewon!

> 
> 
> On 3/6/24 12:20, Tudor Ambarus wrote:
>>
>> Hi,
>>
>> Trying to get some feedback from the samsung experts. Please consider the
>> following:
>>
>>                          ---------------------------------------------
>>                         |                                CMU_PERIC0   |
>>                         |                                             |
>>                         |  MUX_USI                                    |
>>                         |                                             |
>>                         |  |\                                         |
>>               OSCCLK ---|->| \                                        |
>>                         |  |  \                                       |
>>                         |  | M |                                      |
>>                         |  | U |--> DIV_CLK_PERIC0_USI*_ --> GATE_USI |
>>                         |  | X |        (1 ~ 16)                      |
>>                         |  |  /                                       |
>> DIV_CLKCMU_PERIC0_IP ---|->| /                                        |
>>     (1 ~ 16)          | |  |/                                         |
>>                       | |                                             |
>>                       | |                                             |
>>                       | |  MUX_I3C                                    |
>>                       | |                                             |
>>                       | |  |\                                         |
>>                       --|->| \                                        |
>>                         |  |  \                                       |
>>                         |  | M |                                      |
>>                         |  | U |--> DIV_CLK_PERIC0_I3C --> GATE_I3C   |
>>                         |  | X |                                      |
>>                         |  |  /                                       |
>>               OSCCLK ---|->| /                                        |
>>                         |  |/                                         |
>>                         |                                             |
>>                          ---------------------------------------------
>>
>> Is it fine to re-parent the MUX_USI from above to OSCCLK at run-time,
>> during normal operation mode? Experimentally I determined that it's fine,
>> but the datasheet that I'm reading mentions OSCCLK just in the low-power
>> mode context:
>> i/ CMU ... "Communicates with Power Management Unit (PMU) to stop clocks
>> or switch OSC clock before entering a Low-Power mode to reduce power
>> consumption by minimizing clock toggling".
>> ii/ "All CMUs have MUXs to change the OSCCLK during power-down mode".
>>
>> Re-parenting the MUX to OSCCLK allows lower clock rates for the USI blocks
>> than the DIV_CLK_PERIC0_USI can offer. For a USI clock rate below
>> 6.25 MHz I have to either reparent MUX_USI to OSCCLK, or to propagate the
>> clock rate to the common divider DIV_CLKCMU_PERIC0_IP. I find the
>> propagation to the common DIV less desirable as a low USI clock rate
>> affects I3C by lowering its clock rate too. Worse, if the common bus
>> divider is not protected (using CLK_SET_RATE_GATE), USI can lower the I3C
>> clock rate without I3C noticing.
>>
>> Either re-parenting the MUX_USI to OSCCLK, or propagating the clock rate
>> to DIV_CLKCMU_PERIC0_IP allows the same clock ranges. The first with the
>> benefit of not affecting the clock rate of I3C for USI clock rates below
>> 6.25 MHz. Is it fine to re-parent MUX_USI to OSCCLK at run-time?
>>
>> If no feedback is received I lean towards propagating the USI clock rate
>> to the common divider, but by protecting it with CLK_SET_RATE_GATE.
>>
>> Feel free to add in To: or Cc: whoever might be interested. Thanks, ta
> 
> 
> "DIV_CLK_PERIC0_USI" re-parent to OSCCLK is already used samsung downstream driver.
> Looking at the samsung downstream SPI driver, if the SPI request clock is lower than the clock that can be supported by the CMU, it re-parents to OSCCLK.

I've just verified the downstream driver, added some prints, and indeed
the MUX re-parents to OSCCLK on low clock rates.
> 
> There is no problem with clock switching before USI data transfer.

I think that too. Thanks a lot, Jaewon!

Cheers,
ta


