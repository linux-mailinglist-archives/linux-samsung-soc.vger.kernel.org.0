Return-Path: <linux-samsung-soc+bounces-72-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0E767F43F9
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 22 Nov 2023 11:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 555A5281641
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 22 Nov 2023 10:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64FF32D60F;
	Wed, 22 Nov 2023 10:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cHIXt3yG"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 648CF93;
	Wed, 22 Nov 2023 02:33:26 -0800 (PST)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 364576607351;
	Wed, 22 Nov 2023 10:33:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700649204;
	bh=LW60lqPVhl0HcdFitvYc/FI/s8B9ah3/L4d5OITngAc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cHIXt3yGjJ3de3cpUqTsK2Y98ZcEXYHOKty7yHSKLnrNdAEasf96wcSMy/rbUrLOk
	 GRrzY57idyR6V90u8+y1iNTGMNlOrss9Ekl9x0IyC04Ke1W2/p/sP5hyZKEsokJspy
	 k/2qL8mLxfegCWjdY1UbMokc+MSDBTOLyDmDSStNouEO66w24aM6BGXnX4hqyVOIaT
	 /mHMvQ1d4F39dpRLCvu47EfKGYCtkPErhrfm53m3CGw81jDUYxTGP0bLksiaoob670
	 wW4JnW3SUxASzZBZvjlzj/acETgJRA85t53k2DTeW/LNELc390uTqDjNWIVAXxIzx5
	 IKqyMXtEK0JBQ==
Message-ID: <1e196ad9-48b3-484f-ada5-83c56eea60ec@collabora.com>
Date: Wed, 22 Nov 2023 11:33:21 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panfrost: Really power off GPU cores in
 panfrost_gpu_power_off()
Content-Language: en-US
To: Steven Price <steven.price@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: tzimmermann@suse.de, linux-kernel@vger.kernel.org, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, wenst@chromium.org, kernel@collabora.com,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
References: <20231102141507.73481-1-angelogioacchino.delregno@collabora.com>
 <7928524a-b581-483b-b1a1-6ffd719ce650@arm.com>
 <1c9838fb-7f2d-4752-b86a-95bcf504ac2f@linaro.org>
 <6b7a4669-7aef-41a7-8201-c2cfe401bc43@collabora.com>
 <20231121175531.085809f5@collabora.com>
 <d95259b8-10cf-4ded-866c-47cbd2a44f84@linaro.org>
 <4c73f67e-174c-497e-85a5-cb053ce657cb@collabora.com>
 <cae4eebd-2aa2-4baf-8c9a-59eca114098d@arm.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <cae4eebd-2aa2-4baf-8c9a-59eca114098d@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Il 22/11/23 10:48, Steven Price ha scritto:
> On 22/11/2023 09:06, AngeloGioacchino Del Regno wrote:
>> Il 21/11/23 18:08, Krzysztof Kozlowski ha scritto:
>>> On 21/11/2023 17:55, Boris Brezillon wrote:
>>>> On Tue, 21 Nov 2023 17:11:42 +0100
>>>> AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>>> wrote:
>>>>
>>>>> Il 21/11/23 16:34, Krzysztof Kozlowski ha scritto:
>>>>>> On 08/11/2023 14:20, Steven Price wrote:
>>>>>>> On 02/11/2023 14:15, AngeloGioacchino Del Regno wrote:
>>>>>>>> The layout of the registers {TILER,SHADER,L2}_PWROFF_LO, used to
>>>>>>>> request
>>>>>>>> powering off cores, is the same as the {TILER,SHADER,L2}_PWRON_LO
>>>>>>>> ones:
>>>>>>>> this means that in order to request poweroff of cores, we are
>>>>>>>> supposed
>>>>>>>> to write a bitmask of cores that should be powered off!
>>>>>>>> This means that the panfrost_gpu_power_off() function has always
>>>>>>>> been
>>>>>>>> doing nothing.
>>>>>>>>
>>>>>>>> Fix powering off the GPU by writing a bitmask of the cores to
>>>>>>>> poweroff
>>>>>>>> to the relevant PWROFF_LO registers and then check that the
>>>>>>>> transition
>>>>>>>> (from ON to OFF) has finished by polling the relevant PWRTRANS_LO
>>>>>>>> registers.
>>>>>>>>
>>>>>>>> While at it, in order to avoid code duplication, move the core mask
>>>>>>>> logic from panfrost_gpu_power_on() to a new panfrost_get_core_mask()
>>>>>>>> function, used in both poweron and poweroff.
>>>>>>>>
>>>>>>>> Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
>>>>>>>> Signed-off-by: AngeloGioacchino Del Regno
>>>>>>>> <angelogioacchino.delregno@collabora.com>
>>>>>>
>>>>>>
>>>>>> Hi,
>>>>>>
>>>>>> This commit was added to next recently but it causes "external
>>>>>> abort on
>>>>>> non-linefetch" during boot of my Odroid HC1 board.
>>>>>>
>>>>>> At least bisect points to it.
>>>>>>
>>>>>> If fixed, please add:
>>>>>>
>>>>>> Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>
>>>>>> [    4.861683] 8<--- cut here ---
>>>>>> [    4.863429] Unhandled fault: external abort on non-linefetch
>>>>>> (0x1008) at 0xf0c8802c
>>>>>> [    4.871018] [f0c8802c] *pgd=433ed811, *pte=11800653, *ppte=11800453
>>>>>> ...
>>>>>> [    5.164010]  panfrost_gpu_irq_handler from
>>>>>> __handle_irq_event_percpu+0xcc/0x31c
>>>>>> [    5.171276]  __handle_irq_event_percpu from
>>>>>> handle_irq_event+0x38/0x80
>>>>>> [    5.177765]  handle_irq_event from handle_fasteoi_irq+0x9c/0x250
>>>>>> [    5.183743]  handle_fasteoi_irq from
>>>>>> generic_handle_domain_irq+0x28/0x38
>>>>>> [    5.190417]  generic_handle_domain_irq from
>>>>>> gic_handle_irq+0x88/0xa8
>>>>>> [    5.196741]  gic_handle_irq from generic_handle_arch_irq+0x34/0x44
>>>>>> [    5.202893]  generic_handle_arch_irq from __irq_svc+0x8c/0xd0
>>>>>>
>>>>>> Full log:
>>>>>> https://krzk.eu/#/builders/21/builds/4392/steps/11/logs/serial0
>>>>>>     
>>>>>
>>>>> Hey Krzysztof,
>>>>>
>>>>> This is interesting. It might be about the cores that are missing
>>>>> from the partial
>>>>> core_mask raising interrupts, but an external abort on non-linefetch
>>>>> is strange to
>>>>> see here.
>>>>
>>>> I've seen such external aborts in the past, and the fault type has
>>>> often been misleading. It's unlikely to have anything to do with a
>>>
>>> Yeah, often accessing device with power or clocks gated.
>>>
>>
>> Except my commit does *not* gate SoC power, nor SoC clocks 🙂
>>
>> What the "Really power off ..." commit does is to ask the GPU to
>> internally power
>> off the shaders, tilers and L2, that's why I say that it is strange to
>> see that
>> kind of abort.
>>
>> The GPU_INT_CLEAR GPU_INT_STAT, GPU_FAULT_STATUS and
>> GPU_FAULT_ADDRESS_{HI/LO}
>> registers should still be accessible even with shaders, tilers and cache
>> OFF.
>>
>> Anyway, yes, synchronizing IRQs before calling the poweroff sequence
>> would also
>> work, but that'd add up quite a bit of latency on the runtime_suspend()
>> call, so
>> in this case I'd be more for avoiding to execute any register r/w in the
>> handler
>> by either checking if the GPU is supposed to be OFF, or clearing
>> interrupts, which
>> may not work if those are generated after the execution of the poweroff
>> function.
>> Or we could simply disable the irq after power_off, but that'd be hacky
>> (as well).
>>
>>
>> Let's see if asking to poweroff *everything* works:
>>
>>
>> ---
>>   drivers/gpu/drm/panfrost/panfrost_gpu.c | 14 +++++++++++---
>>   1 file changed, 11 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c
>> b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>> index 09f5e1563ebd..1c7276aaa182 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
>> @@ -429,21 +429,29 @@ void panfrost_gpu_power_off(struct panfrost_device
>> *pfdev)
>>       int ret;
>>       u32 val;
>>
>> -    gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present &
>> core_mask);
>> +    gpu_write(pfdev, SHADER_PWROFF_LO, pfdev->features.shader_present);
> 
> Hopefully this one line change, and...
> 
>> +    gpu_write(pfdev, SHADER_PWROFF_HI, U32_MAX);
>>       ret = readl_relaxed_poll_timeout(pfdev->iomem + SHADER_PWRTRANS_LO,
>>                        val, !val, 1, 1000);
>>       if (ret)
>>           dev_err(pfdev->dev, "shader power transition timeout");
>>
>>       gpu_write(pfdev, TILER_PWROFF_LO, pfdev->features.tiler_present);
>> +    gpu_write(pfdev, TILER_PWROFF_HI, U32_MAX);
>>       ret = readl_relaxed_poll_timeout(pfdev->iomem + TILER_PWRTRANS_LO,
>>                        val, !val, 1, 1000);
>>       if (ret)
>>           dev_err(pfdev->dev, "tiler power transition timeout");
>>
>> -    gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present &
>> core_mask);
>> +    gpu_write(pfdev, L2_PWROFF_LO, pfdev->features.l2_present);
> 
> ... this one are all that are actually needed - the rest should be
> ignored as they affect cores that aren't present.
> 

Honestly - when I wrote that diff, I didn't care at all whether the HI registers
were powering off cores that weren't present, because I knew that the GPU would
have handled that gracefully anyway.

What I wanted to do was to reduce Krzysztof's testing effort to a minimum, actually
preventing to send more than one patch to try... but with that, you bought me a bit
of precious time that I would've spent with research, so, hats off! Thank you!

> The Exynos 5422 SoC has a T628 MP6 - so two core groups which isn't a
> particularly well supported configuration. But I'm not sure how we're
> ending up with the second core group being powered up in the first
> place. Even if it was left powered by something previous (e.g. the
> bootloader) then the soft-reset during probe should cause them to power
> down.
> 

Hm. I didn't know that soft_reset is supposed to (and will) power down cores.
This is clarifying some things I didn't really have an explanation for... so thanks
again :-)

> But it seems like a good idea to power off everything when powering
> down, even if we didn't expect the cores to be on.
> 
> Boris also has a point that before cutting the power/clocks we should
> really be synchronising with the IRQs - but that affects the follow on
> patches not this one.
> 

...which gives me some more ideas to try... in the near future.
But it's out of context for this fix anyway.

Cheers,
Angelo

> Steve
> 
>>       ret = readl_poll_timeout(pfdev->iomem + L2_PWRTRANS_LO,
>> -                 val, !val, 0, 1000);
>> +                     val, !val, 0, 1000);
>> +    if (ret)
>> +        dev_err(pfdev->dev, "l2_low power transition timeout");
>> +
>> +    gpu_write(pfdev, L2_PWROFF_HI, U32_MAX);
>> +    ret = readl_poll_timeout(pfdev->iomem + L2_PWRTRANS_HI,
>> +                     val, !val, 0, 1000);
>>       if (ret)
>>           dev_err(pfdev->dev, "l2 power transition timeout");
>>   }
> 



