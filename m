Return-Path: <linux-samsung-soc+bounces-6293-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1723BA07E7B
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  9 Jan 2025 18:15:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D15933A8226
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  9 Jan 2025 17:15:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3F8C18BB9C;
	Thu,  9 Jan 2025 17:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R0mEQ+Wu"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71F118E05F;
	Thu,  9 Jan 2025 17:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736442927; cv=none; b=dGubg2ijQ3RGfml4/jRRqPVBfbtvjATOSymRvY70WPKJWIk8rUUvTZYSke+ZqbHEIkxx6AcG3diS32WBh9eRG5nr2eV+Jl4267w/8V/i/CWPp4aNILeJdB+uprmLFMmFisE2mMJ9u+ex5E3rytvUcEbvwhKBKwmdxDbqp1C9VRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736442927; c=relaxed/simple;
	bh=iHe0e5c+fmzIEFb4JwfVINvpf7LWF6/4nvNtj0QRgPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gjSyq4wpUGf05i6SP16AyTL7Q/D1mofNYIHjzqkWVmkJo/2oWTtKqOHx8dnHzMwQM32I40wXMBUFD5CiAkxfQSLdXClJnUNz4ie3/D8V7XP0Fz2S58QCiuxw6HOrjFHinMcxHwbiY1chj8Lr+V7mAXOxHUs0h+Un6TG1cmcWKuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R0mEQ+Wu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736442926; x=1767978926;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=iHe0e5c+fmzIEFb4JwfVINvpf7LWF6/4nvNtj0QRgPQ=;
  b=R0mEQ+WuUaHa5xHsD1YsYxKojJgiuLbG7KgDusO19vIqAqLmP+cTqSwz
   LfRIh+glbMsbVuJUi3jpL6ZBCDcehOwtV9cJgwIBIMg15JEUL3x4E8G1o
   lpwJ/VJIDKIDtPHOQS7yk61zH9xneX1RDTLpMcdppznHK6wBPuw2t1JML
   L7YkAbgzQxUYbircwgDBGXzhrcBz6KIvKdC4a/+qV6/Q+YtCuwCqYG21f
   5SOcVm79KzpOdZWsUUlFggDHFv+yFLrGXwNiVdOeZlxFWjUg8jFkc+QsM
   56bkzb6lj1qK/XBAtbWxQd5p9HU1GBfD3UdT86inl66/Oi4zaJq2YmPWL
   Q==;
X-CSE-ConnectionGUID: hMJ0Okn/T5KKfu2pCyyrxA==
X-CSE-MsgGUID: rNzKv++oTSSC1KgQzZi8fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36604448"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="36604448"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 09:15:26 -0800
X-CSE-ConnectionGUID: sCHGnpr3S22msRSMnEsaNw==
X-CSE-MsgGUID: Kiw4VfoXQbSJcARHoMEU4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140776648"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.245.241]) ([10.245.245.241])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 09:15:20 -0800
Message-ID: <ec240a46-3fe1-46fa-84bc-2f962d7441ce@intel.com>
Date: Thu, 9 Jan 2025 17:15:17 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/25] drm/xe: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-24-tzimmermann@suse.de>
 <91c904f8-ba47-4595-be65-6fb57dcc9c64@intel.com>
 <6666af19-a98d-41d7-8329-7b50807c04a9@suse.de>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <6666af19-a98d-41d7-8329-7b50807c04a9@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/01/2025 16:26, Thomas Zimmermann wrote:
> Hi
> 
> 
> Am 09.01.25 um 17:05 schrieb Matthew Auld:
>> On 09/01/2025 14:57, Thomas Zimmermann wrote:
>>> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
>>> and buffer size. Align the pitch to a multiple of 8. Align the
>>> buffer size according to hardware requirements.
>>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>>> index e6c896ad5602..d75e3c39ab14 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -8,6 +8,7 @@
>>>   #include <linux/dma-buf.h>
>>>     #include <drm/drm_drv.h>
>>> +#include <drm/drm_dumb_buffers.h>
>>>   #include <drm/drm_gem_ttm_helper.h>
>>>   #include <drm/drm_managed.h>
>>>   #include <drm/ttm/ttm_device.h>
>>> @@ -2535,14 +2536,13 @@ int xe_bo_dumb_create(struct drm_file 
>>> *file_priv,
>>>       struct xe_device *xe = to_xe_device(dev);
>>>       struct xe_bo *bo;
>>>       uint32_t handle;
>>> -    int cpp = DIV_ROUND_UP(args->bpp, 8);
>>>       int err;
>>>       u32 page_size = max_t(u32, PAGE_SIZE,
>>>           xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K);
>>>   -    args->pitch = ALIGN(args->width * cpp, 64);
>>> -    args->size = ALIGN(mul_u32_u32(args->pitch, args->height),
>>> -               page_size);
>>> +    err = drm_mode_size_dumb(dev, args, SZ_64, page_size);
>>
>> AFAICT this looks to change the behaviour, where u64 size was 
>> technically possible and was allowed given that args->size is u64, but 
>> this helper is limiting the size to u32. Is that intentional? If so, 
>> we should probably make that clear in the commit message.
> 
> That's an interesting observation; thanks. The ioctl's internal checks 
> have always limited the size to 32 bit. [1] I think it is not supposed 
> to be larger than that. We can change the helper to support 64-bit sizes 
> as well.

Ah, I missed the internal check.

> 
> Having said that, is there any use case? Dumb buffers are for software 
> rendering only. Allocating more than a few dozen MiB seems like a 
> mistake. Maybe we should rather limit the allowed allocation size instead?

Yeah, I doubt there are any real users. Given the existing internal 
check, limiting to u32 makes sense to me.

> 
> Best regards
> Thomas
> 
> [1] https://elixir.bootlin.com/linux/v6.12.6/source/drivers/gpu/drm/ 
> drm_dumb_buffers.c#L82
> 
>>
>>> +    if (err)
>>> +        return err;
>>>         bo = xe_bo_create_user(xe, NULL, NULL, args->size,
>>>                      DRM_XE_GEM_CPU_CACHING_WC,
>>
> 


