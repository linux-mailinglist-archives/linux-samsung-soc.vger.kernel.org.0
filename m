Return-Path: <linux-samsung-soc+bounces-10646-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B2FCB3E015
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  1 Sep 2025 12:25:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 211FB3A34D4
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  1 Sep 2025 10:25:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B387E30BF7F;
	Mon,  1 Sep 2025 10:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="kb7lCGLk"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9AA305068
	for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Sep 2025 10:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756722353; cv=none; b=QnmwcIltpI9kb9qVwIJk3280Vmeto12KtmX1EzJzkpfrWXVNVdNobqZxYDOaL26ghkf+bdPx7tQuLpbtmCa5hi++UzLYUnVPcpETJYKrwrJ2l6bRxrKwPOtxsoWi6odKYo/7L6jMxsnYZJwx+ERjbCPQ6HUYmxL4e3k/jPvJc6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756722353; c=relaxed/simple;
	bh=F4xJIUX+Y+FBb3NULBreN3SiwDzfm3V0O4TkmhPwn6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=i3r3IlJvnaoBEpws+Fn07dv08xX65hQXw0LKmsatSTlXU9k8din40BtfWPgOqJnZ66vYcmzb2U0VzJd/APwn2gUFVrKYFBx8ZkZiquuxSi1uRGruJavswSUeTgAMo0cMtRFVWSO3Wt/2JutW0+c7CSWWbOQud69xX1JG1B20SmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=kb7lCGLk; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250901102543euoutp02984885de1c5d956a7d1a19ae2298f0e1~hIan0snNW0643606436euoutp02H
	for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Sep 2025 10:25:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250901102543euoutp02984885de1c5d956a7d1a19ae2298f0e1~hIan0snNW0643606436euoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756722343;
	bh=0i5QpIyudkj0DESLieNBClWyAhZMEeba8yZNtq0Apww=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=kb7lCGLk7D9Hdwh9lJSLy1cNVaWOaudPEgFUP5EMD3NnelqzLeRGJKxpkmGosarGy
	 xyoNgPsLvqKsuvlC+8dVzC43xxh2RD5D7uzGxCCcLpHdV1eOC4rthcfg+NcLgwPLcR
	 J0x29gjWogIZ9oCQPZiU7IpnyfkRQmO+2+7wp3AI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250901102542eucas1p2d9dced055a8e021c8fa2c938bc9a9764~hIanQLu1r1127911279eucas1p2M;
	Mon,  1 Sep 2025 10:25:42 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250901102541eusmtip1e9890e14b6cf3f08dc2ad68f30fc9ad3~hIalo15pj1151611516eusmtip1Y;
	Mon,  1 Sep 2025 10:25:41 +0000 (GMT)
Message-ID: <ea57ca6e-4000-49f7-8e0b-899f34b7693a@samsung.com>
Date: Mon, 1 Sep 2025 12:25:40 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 00/13] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
To: Damon Ding <damon.ding@rock-chips.com>, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
	kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
	hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
	dianders@chromium.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <46f9137e-402d-4c0f-a224-10520f80c8b4@rock-chips.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250901102542eucas1p2d9dced055a8e021c8fa2c938bc9a9764
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264
X-EPHeader: CA
X-CMS-RootMailID: 20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264
References: <CGME20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264@eucas1p2.samsung.com>
	<20250814104753.195255-1-damon.ding@rock-chips.com>
	<a3a2f8be-2c3c-49e7-b27a-72364ea48b06@samsung.com>
	<7cb50c9c-ac41-43b6-8c69-5f184e7c94cf@samsung.com>
	<1ccd3889-5f13-4609-9bd8-2c208e17fc96@rock-chips.com>
	<f2ebfff1-08ab-4f26-98f3-6d6415d58a5e@samsung.com>
	<a5e613ba-b404-40ae-b467-0f6f223f5d4c@rock-chips.com>
	<461daea4-5582-4aa2-bfea-130d2fb93717@samsung.com>
	<46f9137e-402d-4c0f-a224-10520f80c8b4@rock-chips.com>

On 01.09.2025 05:41, Damon Ding wrote:
> On 8/29/2025 4:23 PM, Marek Szyprowski wrote:
>> On 29.08.2025 10:08, Damon Ding wrote:
>>> On 8/20/2025 5:20 AM, Marek Szyprowski wrote:
>>>> On 15.08.2025 04:59, Damon Ding wrote:
>>>>> On 2025/8/15 5:16, Marek Szyprowski wrote:
>>>>>> On 14.08.2025 16:33, Marek Szyprowski wrote:
>>>>>>> On 14.08.2025 12:47, Damon Ding wrote:
>>>>>>>> PATCH 1 is a small format optimization for struct
>>>>>>>> analogid_dp_device.
>>>>>>>> PATCH 2 is to perform mode setting in
>>>>>>>> &drm_bridge_funcs.atomic_enable.
>>>>>>>> PATCH 3-6 are preparations for apply drm_bridge_connector helper.
>>>>>>>> PATCH 7 is to apply the drm_bridge_connector helper.
>>>>>>>> PATCH 8-10 are to move the panel/bridge parsing to the Analogix
>>>>>>>> side.
>>>>>>>> PATCH 11-12 are preparations for apply panel_bridge helper.
>>>>>>>> PATCH 13 is to apply the panel_bridge helper.
>>>>>>>
>>>>>>> This series lacks 'select DRM_BRIDGE_CONNECTOR' in ExynosDP's
>>>>>>> Kconfig,
>>>>>>> so it causes build break:
>>>>>>>
>>>>>>> drivers/gpu/drm/exynos/exynos_dp.c:177: undefined reference to
>>>>>>> `drm_bridge_connector_init'
>>>>>>> make[2]: *** [scripts/Makefile.vmlinux:91: vmlinux] Error 1
>>>>>>>
>>>>>>> After adding this dependency, the Exynos DP driver stops 
>>>>>>> working. On
>>>>>>> Samsung Snow Chromebook I observed following issue:
>>>>>>>
>>>>>>> [    4.534220] exynos-dp 145b0000.dp-controller: failed to attach
>>>>>>> following panel or bridge (-16)
>>>>>>> [    4.543428] exynos-drm exynos-drm: failed to bind
>>>>>>> 145b0000.dp-controller (ops exynos_dp_ops): -16
>>>>>>> [    4.551775] exynos-drm exynos-drm: adev bind failed: -16
>>>>>>> [    4.556559] exynos-dp 145b0000.dp-controller: probe with driver
>>>>>>> exynos-dp failed with error -16
>>>>>>>
>>>>>>> I will investigate details later in the evening.
>>>>>>
>>>>>> The failure is caused by trying to add plat_data->next_bridge twice
>>>>>> (from exynos_dp's .attach callback, and from analogix' ->bind
>>>>>> callback).
>>>>>>
>>>>>>
>>>>>> Best regards
>>>>>
>>>>> I see. The bridge attachment for the next bridge was not well thought
>>>>> out. It may be better to move panel_bridge addition a little forward
>>>>> and remove next_bridge attachment on the Analogix side. Then, the
>>>>> Rockchip side and Exynos side can do their own next_bridge attachment
>>>>> in &analogix_dp_plat_data.attach() as they want.
>>>>>
>>>>> Could you please help test the following modifications(they have been
>>>>> tested on my RK3588S EVB1 Board) on the Samsung Snow Chromebook? ;-)
>>>>
>>>> Assuming that I properly applied the malformed diff, it doesn't solve
>>>> all the issues. There are no errors reported though, but the display
>>>> chain doesn't work and no valid mode is reported:
>>>>
>>>> # dmesg | grep drm
>>>> [    3.384992] [drm] Initialized panfrost 1.4.0 for 11800000.gpu on
>>>> minor 0
>>>> [    4.487739] [drm] Exynos DRM: using 14400000.fimd device for DMA
>>>> mapping operations
>>>> [    4.494202] exynos-drm exynos-drm: bound 14400000.fimd (ops
>>>> fimd_component_ops)
>>>> [    4.502374] exynos-drm exynos-drm: bound 14450000.mixer (ops
>>>> mixer_component_ops)
>>>> [    4.511930] exynos-drm exynos-drm: bound 145b0000.dp-controller 
>>>> (ops
>>>> exynos_dp_ops)
>>>> [    4.518411] exynos-drm exynos-drm: bound 14530000.hdmi (ops
>>>> hdmi_component_ops)
>>>> [    4.529628] [drm] Initialized exynos 1.1.0 for exynos-drm on 
>>>> minor 1
>>>> [    4.657434] exynos-drm exynos-drm: [drm] Cannot find any crtc or
>>>> sizes
>>>> [    4.925023] exynos-drm exynos-drm: [drm] Cannot find any crtc or
>>>> sizes
>>>>
>>>> # ./modetest -c -Mexynos
>>>> Connectors:
>>>> id      encoder status          name            size (mm)       modes
>>>>      encoders
>>>> 69      0       disconnected    LVDS-1          0x0             0
>>>>        68
>>>>     props:
>>>>           1 EDID:
>>>>                   flags: immutable blob
>>>>                   blobs:
>>>>
>>>>                   value:
>>>>           2 DPMS:
>>>>                   flags: enum
>>>>                   enums: On=0 Standby=1 Suspend=2 Off=3
>>>>                   value: 0
>>>>           5 link-status:
>>>>                   flags: enum
>>>>                   enums: Good=0 Bad=1
>>>>                   value: 0
>>>>           6 non-desktop:
>>>>                   flags: immutable range
>>>>                   values: 0 1
>>>>                   value: 0
>>>>           4 TILE:
>>>>                   flags: immutable blob
>>>>                   blobs:
>>>>
>>>>                   value:
>>>> 71      0       disconnected    HDMI-A-1        0x0             0
>>>>        70
>>>>     props:
>>>>           1 EDID:
>>>>                   flags: immutable blob
>>>>                   blobs:
>>>>
>>>>                   value:
>>>>           2 DPMS:
>>>>                   flags: enum
>>>>                   enums: On=0 Standby=1 Suspend=2 Off=3
>>>>                   value: 0
>>>>           5 link-status:
>>>>                   flags: enum
>>>>                   enums: Good=0 Bad=1
>>>>                   value: 0
>>>>           6 non-desktop:
>>>>                   flags: immutable range
>>>>                   values: 0 1
>>>>                   value: 0
>>>>           4 TILE:
>>>>                   flags: immutable blob
>>>>                   blobs:
>>>>
>>>>                   value:
>>>>
>>>>
>>>> I will investigate details later this week.
>>>>
>>>
>>> Could you please provide the related DTS file for the test? I will
>>> also try to find out the reason for this unexpected issue. ;-)
>>
>> Unfortunately I didn't find enough time to debug this further. The above
>> log is from Samsung Snow Chromebook,
>> arch/arm/boot/dts/samsung/exynos5250-snow.dts
>>
>>
>
> I compare the differences in the following display path before and 
> after this patch series:
>
> exynos_dp -> nxp-ptn3460 -> panel "auo,b116xw03"
>
> The issue is likely caused by the &drm_connector_funcs.detect() 
> related logic. Before this patch series, the nxp-ptn3460 connector is 
> always connector_status_connected because there is not available 
> &drm_connector_funcs.detect(). After it, the DRM_BRIDGE_OP_DETECT flag 
> make the connection status depend on analogix_dp_bridge_detect().
>
> Could you please add the following patches additionally and try again?
> (Not the final solution, just validation)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c 
> b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> index a93ff8f0a468..355911c47354 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -1491,9 +1491,11 @@ int analogix_dp_bind(struct analogix_dp_device 
> *dp, struct drm_device *drm_dev)
>                 }
>         }
>
> -       bridge->ops = DRM_BRIDGE_OP_DETECT |
> -                     DRM_BRIDGE_OP_EDID |
> +       bridge->ops = DRM_BRIDGE_OP_EDID |
>                       DRM_BRIDGE_OP_MODES;
> +       if (drm_bridge_is_panel(dp->plat_data->next_bridge))
> +               bridge->ops |= DRM_BRIDGE_OP_DETECT;
> +
>         bridge->of_node = dp->dev->of_node;
>         bridge->type = DRM_MODE_CONNECTOR_eDP;
>         ret = devm_drm_bridge_add(dp->dev, &dp->bridge);

It is better. Now the display panel is detected and reported to 
userspace, but it looks that something is not properly initialized, 
because there is garbage instead of the proper picture.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


