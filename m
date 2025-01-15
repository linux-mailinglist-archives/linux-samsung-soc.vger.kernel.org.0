Return-Path: <linux-samsung-soc+bounces-6338-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 992DFA1180F
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 15 Jan 2025 04:50:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6A401688BB
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 15 Jan 2025 03:50:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B2B422DF85;
	Wed, 15 Jan 2025 03:50:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="teidT1Fw"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6792F35951
	for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2025 03:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736913053; cv=none; b=eA3mf30BlwzugZ9mLu6yUtGpAzLKypKSKXZgjCtpVqGSWIlSJSPtAk5MzbLNMTseAZzpDazg60GW9SXikj0JEITW4N7DCjsPs8+U3Q7SDX3vsE1qHwi6GA1L07mmhynDA/9xcCXF5Su3MWWZrZmTAfNQlQZvo4VXavMRVZrh2LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736913053; c=relaxed/simple;
	bh=QeTZHSamn53IGk4tvWVy23iSQOLFtvqao9aJxrZvzko=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tBPI7G5RrB8WgOsfsodE0+0CnuSsCKHVEVwq44tfkvwK6sXL1TeR0nTbtGW/anEjNgZRWLifw3jhb6WH8MxaHpGyiVqjujawTxHtWSK5IDvt0gOITbrTmYPkIJxK7g0fHkihzoX8z3+hrV4EXEj6GErjDKKmi3sTGETtlnsYJCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=teidT1Fw; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <078ddd52-1d04-4aad-935a-67c12ebf569a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736913034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jVhN80lSe9/RJE7xTb/gBfGOBNDnLQWNn0HdoXTdJX4=;
	b=teidT1Fw63fY1UplJo7A5bi9iE7QpymiDozRtg4zga+cfodcNKCHBs5xeOi588P6Xgf2QP
	CYp1SqpJZNtGd/fHLlyHIgbHFs46Z3aoqpduhurkaP+sGXJgpt1fvAeSbcUUllSz8kx3vA
	np+KZYyxC2PBSgowDFD5qMH7M7wgWl8=
Date: Wed, 15 Jan 2025 11:50:20 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 11/25] drm/loongson: Compute dumb-buffer sizes with
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
 Sui Jingfeng <suijingfeng@loongson.cn>
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-12-tzimmermann@suse.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20250109150310.219442-12-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,

On 2025/1/9 22:57, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch and
> buffer size. Align the pitch according to hardware requirements.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sui Jingfeng <suijingfeng@loongson.cn>
> Cc: Sui Jingfeng <sui.jingfeng@linux.dev>


Reviewed-by: Sui Jingfeng <sui.jingfeng@linux.dev>


> ---
>   drivers/gpu/drm/loongson/lsdc_gem.c | 29 ++++++++---------------------
>   1 file changed, 8 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/loongson/lsdc_gem.c b/drivers/gpu/drm/loongson/lsdc_gem.c
> index a720d8f53209..9f982b85301f 100644
> --- a/drivers/gpu/drm/loongson/lsdc_gem.c
> +++ b/drivers/gpu/drm/loongson/lsdc_gem.c
> @@ -6,6 +6,7 @@
>   #include <linux/dma-buf.h>
>   
>   #include <drm/drm_debugfs.h>
> +#include <drm/drm_dumb_buffers.h>
>   #include <drm/drm_file.h>
>   #include <drm/drm_gem.h>
>   #include <drm/drm_prime.h>
> @@ -204,45 +205,31 @@ int lsdc_dumb_create(struct drm_file *file, struct drm_device *ddev,
>   	const struct lsdc_desc *descp = ldev->descp;
>   	u32 domain = LSDC_GEM_DOMAIN_VRAM;
>   	struct drm_gem_object *gobj;
> -	size_t size;
> -	u32 pitch;
> -	u32 handle;
>   	int ret;
>   
> -	if (!args->width || !args->height)
> -		return -EINVAL;
> -
> -	if (args->bpp != 32 && args->bpp != 16)
> -		return -EINVAL;
> -
> -	pitch = args->width * args->bpp / 8;
> -	pitch = ALIGN(pitch, descp->pitch_align);
> -	size = pitch * args->height;
> -	size = ALIGN(size, PAGE_SIZE);
> +	ret = drm_mode_size_dumb(ddev, args, descp->pitch_align, 0);
> +	if (ret)
> +		return ret;
>   
>   	/* Maximum single bo size allowed is the half vram size available */
> -	if (size > ldev->vram_size / 2) {
> -		drm_err(ddev, "Requesting(%zuMiB) failed\n", size >> 20);
> +	if (args->size > ldev->vram_size / 2) {
> +		drm_err(ddev, "Requesting(%zuMiB) failed\n", (size_t)(args->size >> PAGE_SHIFT));
>   		return -ENOMEM;
>   	}
>   
> -	gobj = lsdc_gem_object_create(ddev, domain, size, false, NULL, NULL);
> +	gobj = lsdc_gem_object_create(ddev, domain, args->size, false, NULL, NULL);
>   	if (IS_ERR(gobj)) {
>   		drm_err(ddev, "Failed to create gem object\n");
>   		return PTR_ERR(gobj);
>   	}
>   
> -	ret = drm_gem_handle_create(file, gobj, &handle);
> +	ret = drm_gem_handle_create(file, gobj, &args->handle);
>   
>   	/* drop reference from allocate, handle holds it now */
>   	drm_gem_object_put(gobj);
>   	if (ret)
>   		return ret;
>   
> -	args->pitch = pitch;
> -	args->size = size;
> -	args->handle = handle;
> -
>   	return 0;
>   }
>   

-- 
Best regards,
Sui


