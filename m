Return-Path: <linux-samsung-soc+bounces-1782-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A0784C85E
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Feb 2024 11:15:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4951E1F2202E
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Feb 2024 10:15:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5620424B2F;
	Wed,  7 Feb 2024 10:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jYV/BBpa"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5624824208
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 10:14:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707300897; cv=none; b=YpwfxhwelHZe3AFy8xkgPYMWV17awiC4D+Eyv5QOpucXgnvjCMUdKLGG+asC9JfpnhZ2CNFBYeMZkW3cQUGTbVgmE2Q2iFpWQiLuFzZrBhAoLl4462gYjq4NGNGTXqRJvHk9AeNbfsK09FJz4vYQB/a18ZLv3JwLKfDdI4aIjd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707300897; c=relaxed/simple;
	bh=q6bQnwUqaVGcclfFabbklXYfbgyQCcPXKWsE/HtS/E4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HmwnsRKz20TjIYWe7avKT0/luOH/LJYKZtEqep44VOE5d4likL5lJ+d638BUUcN5BNZkScRrRsf2eLtxmOCtsvBSQE7SSAizfEjwGswdn0JuFPwOZOuAvCTAP6qaxzaU1c+DJpc74MkB07zz3N1++XKBbml2yLJQH6ihmYini4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jYV/BBpa; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-33b4e5ed890so320935f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Feb 2024 02:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707300893; x=1707905693; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8SpP3uo6CWXbsGtYpTJN7BN0yrIkj+G/qNJ7CBzI06o=;
        b=jYV/BBpad3SdIOR8EUCW9VdompFMxQJFGYcJNP5mIfqaSoeTl743spH1U5q1N6R645
         GJt59tDy0hbuRNfVED5iP4kKrkiHfj+oXC7gW09a/BryrS8DAL0Kn7IIT9fwttbDwt65
         sVMlpuOm/fcAkaeegh7YDelnWLGalDynaxAqN7cGViHY041it9u/B9yc4okorBsTHOz/
         Qx247UDS+0bZFnv9HUYl+UT7e0xf6vJRBYyGpK0jmeG7NYAf6Ub7k5Hqp0R5N7wa7E/+
         vb3yt52yUYPRFh1g2+hXIEB5+oWfD0XKCLcVO1WnMqHUGTVNaGl00afni5IJHZY20amT
         4t1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707300893; x=1707905693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8SpP3uo6CWXbsGtYpTJN7BN0yrIkj+G/qNJ7CBzI06o=;
        b=cXaJmxl6hwX/GAspiFmOyrwfCJMasID5tmUePL6C1jdbsxOmy5aAfsrxUoTdLvguIX
         xEjluenHW2XHsX0xVTNubRYuPTU4whIE/PFoU+wVvAPhQuSXa2gt0YscpFX0awmBsW7l
         oDJPj4I590qXlZxdaSilYdWPrAZdjvzaaEp9MtYgQtfJEnuBOb65bpEJ1ccAyTZ8Z/t9
         rNcMoAx49HnNf33ZoQIxTjO7sOp91PW5wU0GXCQKwge9nIJV4T/8sAgxmgZ7gdOQgmkI
         b2I+NBDnSNeMDXZEacMr1uyayp0clKwSxuBHN2S3hiJGQ5xOqDE8nj+KlBPM6+v2/avs
         nkbA==
X-Forwarded-Encrypted: i=1; AJvYcCV7lqnlUeBasTU9GYxU3KvW/XkGrYO57VyQmS5/ss91Vb7L/3ErsStUUsM/vAOpkcyolwUwWd8kYVsCIpBdApEzbkyuzFmKpOeDwBVO5shRndc=
X-Gm-Message-State: AOJu0YyTFkU7dEGdTCOE5D1oO142z/3IFKYWNR9VBpIL85ik6aATonQK
	3TwVGVoQ1bEk0xFboZtY/1mLj3taQL17dBU9xkbtaZdzFfp828ECI2lT6c7h2lU=
X-Google-Smtp-Source: AGHT+IFRZvWaIc4R4wqzFQxzb4lr/0s5+VXmSp/P9CqMffphL5aQPauRPhjEJ7GIOKJGgYq4goWJow==
X-Received: by 2002:a5d:64a7:0:b0:33b:14f8:7331 with SMTP id m7-20020a5d64a7000000b0033b14f87331mr4038225wrp.4.1707300893590;
        Wed, 07 Feb 2024 02:14:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUw6Ze0/Hikj13JQIsBsOcFBPXxiElzhsZJIyiR3J+MmfQqMrI7qBj3Z/V71devLD0zfoR8uRT+alIeBPn9jopt4LwIM4SByB/eggi2CVF/uL0D2Z73swumDZ13NZklxHVZuC1+htTQzhsQVXZRJRwb764sY6UzuExPUWGaMJ4iGTUMRasagx8UWA7FHOFXCzkog1I0/d3FhvKYQTwmKOTFjU4UEDdzycbRZjZdANkJweFCQZfIOuMB20IM/3zc/kAsEv9UlPYi9FnUIENw3qzJ9l8bPGP47TI+a4Gj9LFI6lbrlU46ni7PJsvoNDJ7dg340uK5FwSm6LFv1AJoFMh3Lp/FGDQ2M6B3YJPLIukmCEdPlhBpsa5WCH8CEwPRtLLRQbhsJ7o9bCKswA3lh2huzFPBhgWxCp/c+Iq5g5rbTC1eZZp3YlzIRHaiobJlOU58NNyyIiENisooFEfTk7fsytOLLLqxoUq6ND+ggkPXVlY7F6yM9Fk4ypv6WnvyiLT8vGI6yktyP+aMaSbHUmaUvkjtkm3kNwolU9SAy7I+ZxSKPLiunglPlJiw+ToGf6xRv51lVh8suHkLeRpiIBo=
Received: from [192.168.0.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id dr9-20020a5d5f89000000b0033b14f22180sm1180447wrb.20.2024.02.07.02.14.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Feb 2024 02:14:53 -0800 (PST)
Message-ID: <894561a9-51b5-4e7d-a65d-5e8e6c32a3ff@linaro.org>
Date: Wed, 7 Feb 2024 10:14:49 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] spi: s3c64xx: explicitly include <linux/types.h>
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sam Protsenko <semen.protsenko@linaro.org>, broonie@kernel.org,
 andi.shyti@kernel.org, krzysztof.kozlowski@linaro.org,
 alim.akhtar@samsung.com, linux-spi@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, andre.draszik@linaro.org,
 peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com,
 robh+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
References: <20240206085238.1208256-1-tudor.ambarus@linaro.org>
 <20240206085238.1208256-2-tudor.ambarus@linaro.org>
 <CAPLW+4=Xd+B=ZncqPgU4qaJ8zY8JJvJZApdUW_v0w6yr2cy9Sg@mail.gmail.com>
 <16a5e423-1111-49ff-ad6c-b0bb89a4879a@linaro.org>
 <2024020741-repaint-nastiness-9f8d@gregkh>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <2024020741-repaint-nastiness-9f8d@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 2/7/24 09:58, Greg Kroah-Hartman wrote:
> On Wed, Feb 07, 2024 at 06:20:56AM +0000, Tudor Ambarus wrote:
>>
>>
>> On 2/6/24 18:02, Sam Protsenko wrote:
>>> On Tue, Feb 6, 2024 at 2:52 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>>>
>>>> The driver uses u32 and relies on an implicit inclusion of
>>>> <linux/types.h>.
>>>>
>>>> It is good practice to directly include all headers used, it avoids
>>>> implicit dependencies and spurious breakage if someone rearranges
>>>> headers and causes the implicit include to vanish.
>>>>
>>>> Include the missing header.
>>>>
>>>> Fixes: 230d42d422e7 ("spi: Add s3c64xx SPI Controller driver")
>>>
>>> Not sure if Fixes tag is needed here.
>>
>> We have already talked about this. If a patch that causes the implicit
>> include to vanish is backported to stable, it will reveal the missing
>> header here and will result in backporting this patch as well.
> 
> So worry about this then, not now.
> 
>> So, as a
>> good practice let's allow this patch to be queued to stable, it will
>> avoid possible compilation errors.
> 
> "possible" does not mean "needed".
> 
> Please only tag stuff that you know is needed, if the stable developers
> break things, they can fix it up when it happens.
> 
> Adding .h includes is not a fixes: thing unless it actually fixes
> something in Linus's tree, otherwise it's an abuse of the tag.  Please
> don't do that.
> 

Okay, thanks for the clarification.

Cheers,
ta

