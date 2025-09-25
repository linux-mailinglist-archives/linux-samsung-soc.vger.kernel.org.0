Return-Path: <linux-samsung-soc+bounces-11210-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4E8B9DDCB
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Sep 2025 09:34:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 47DBA4A7D60
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Sep 2025 07:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39C2281358;
	Thu, 25 Sep 2025 07:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="RMeFRgwK"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-m155110.qiye.163.com (mail-m155110.qiye.163.com [101.71.155.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C1920E6;
	Thu, 25 Sep 2025 07:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758785640; cv=none; b=PLAmC1CZWxcOmov/teLTRSlhSC/uUNL3ymL5WlcI8dMhGWHkSS13lTYHAXi6N5ppq7l9eKrI2lH6WgFdZFGx9l7dBLmL4lyEyFZ67TuXgqRsRH41GCOv1kAEdIo8t6Kbr/tsqrZyxMFhMGzwrFObvX4f9b1WGzxTDn3LiwaPhII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758785640; c=relaxed/simple;
	bh=wZK6hGBwuhkOaBBGI9z+sQf/LCiFQEj+2zn3QoymJeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pY+FxOZYs20UJCjVqmex0oYD1/cbfPfYobUky1CFqglqbEHbhiOUIUSSvJ0oqhSxLDlzHPLOFXXjCKachpK60MSOVEgomuTJYJUL4qPAOw83H+eATc8Dxm9aHH4hNnXMMgqVDiaO/vPFApNRGAlGQAFTJjbKzKEbr5QRQa51F5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=RMeFRgwK; arc=none smtp.client-ip=101.71.155.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 2404c7a9b;
	Thu, 25 Sep 2025 15:33:45 +0800 (GMT+08:00)
Message-ID: <7babd32a-6b20-4e4b-9c40-594520a183bb@rock-chips.com>
Date: Thu, 25 Sep 2025 15:33:45 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/17] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
 dianders@chromium.org, m.szyprowski@samsung.com, luca.ceresoli@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org
References: <20250912085846.7349-1-damon.ding@rock-chips.com>
 <20250912085846.7349-11-damon.ding@rock-chips.com>
 <tsgfxlkxty653crmzmwsr7p6slf27pxf6n6to5p7zvi6wsl444@525tz5uhbj44>
 <2870c278-3c65-4d8f-ace3-1fd5b03af2b4@rock-chips.com>
 <ykj7xrnpagbtftr7wt2vkyc4d4u4k5nmxsir433jzz7lhc3oq3@gaq4kicsrlpr>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <ykj7xrnpagbtftr7wt2vkyc4d4u4k5nmxsir433jzz7lhc3oq3@gaq4kicsrlpr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a997fcadceb03a3kunmf428ea61f44a4
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR5MHlZDTEhJGE5IQ04dTRpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=RMeFRgwK/u9gvsfKikZ6QJa4SgufBJayFB0NijJ2dZPIYudWTPVknCf/RSzoR9Eb42n56CnuehVerhBm3oRxFYvPPN3Lie/WVYt7wWFD0QMNUuCgPHo9Rn+IUxAofGpqUs0SnaLkyd7qtyJfB3cCp7JWz3XnclQfDza1rydM3V4=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=IQqtJyNfbYnJRIw/BGD/cND3AGmHGHL0thx41Mcmirc=;
	h=date:mime-version:subject:message-id:from;

Hi Dmitry,

On 9/25/2025 11:37 AM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 05:14:57PM +0800, Damon Ding wrote:
>> Hi Dmitry,
>>
>> On 9/12/2025 7:03 PM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 12, 2025 at 04:58:39PM +0800, Damon Ding wrote:
>>>> Apply drm_bridge_connector helper for Analogix DP driver.
>>>>
>>>> The following changes have been made:
>>>> - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
>>>>     and &drm_connector_helper_funcs.
>>>> - Remove unnecessary parameter struct drm_connector* for callback
>>>>     &analogix_dp_plat_data.attach.
>>>> - Remove &analogix_dp_device.connector.
>>>> - Convert analogix_dp_atomic_check()/analogix_dp_detect() to
>>>>     &drm_bridge_funcs.atomic_check()/&drm_bridge_funcs.detect().
>>>> - Split analogix_dp_get_modes() into &drm_bridge_funcs.get_modes() and
>>>>     &drm_bridge_funcs.edid_read().
>>>>
>>>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>>>
>>>> ------
>>>>
>>>> Changes in v2:
>>>> - For &drm_bridge.ops, remove DRM_BRIDGE_OP_HPD and add
>>>>     DRM_BRIDGE_OP_EDID.
>>>> - Add analogix_dp_bridge_edid_read().
>>>> - Move &analogix_dp_plat_data.skip_connector deletion to the previous
>>>>     patches.
>>>>
>>>> Changes in v3:
>>>> - Rebase with the new devm_drm_bridge_alloc() related commit
>>>>     48f05c3b4b70 ("drm/bridge: analogix_dp: Use devm_drm_bridge_alloc()
>>>>     API").
>>>> - Expand the commit message.
>>>> - Call drm_bridge_get_modes() in analogix_dp_bridge_get_modes() if the
>>>>     bridge is available.
>>>> - Remove unnecessary parameter struct drm_connector* for callback
>>>>     &analogix_dp_plat_data.attach.
>>>> - In order to decouple the connector driver and the bridge driver, move
>>>>     the bridge connector initilization to the Rockchip and Exynos sides.
>>>>
>>>> Changes in v4:
>>>> - Expand analogix_dp_bridge_detect() parameters to &drm_bridge and
>>>>     &drm_connector.
>>>> - Rename the &analogix_dp_plat_data.bridge to
>>>>     &analogix_dp_plat_data.next_bridge.
>>>>
>>>> Changes in v5:
>>>> - Set the flag fo drm_bridge_attach() to DRM_BRIDGE_ATTACH_NO_CONNECTOR
>>>>     for next bridge attachment of Exynos side.
>>>> - Distinguish the &drm_bridge->ops of Analogix bridge based on whether
>>>>     the downstream device is a panel, a bridge or neither.
>>>> - Remove the calls to &analogix_dp_plat_data.get_modes().
>>>> ---
>>>>    .../drm/bridge/analogix/analogix_dp_core.c    | 151 ++++++++----------
>>>>    .../drm/bridge/analogix/analogix_dp_core.h    |   1 -
>>>>    drivers/gpu/drm/exynos/exynos_dp.c            |  25 +--
>>>>    .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  11 +-
>>>>    include/drm/bridge/analogix_dp.h              |   3 +-
>>>>    5 files changed, 95 insertions(+), 96 deletions(-)
>>>>
>>>> @@ -1532,6 +1487,7 @@ EXPORT_SYMBOL_GPL(analogix_dp_resume);
>>>>    int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
>>>>    {
>>>> +	struct drm_bridge *bridge = &dp->bridge;
>>>>    	int ret;
>>>>    	dp->drm_dev = drm_dev;
>>>> @@ -1545,7 +1501,23 @@ int analogix_dp_bind(struct analogix_dp_device *dp, struct drm_device *drm_dev)
>>>>    		return ret;
>>>>    	}
>>>> -	ret = drm_bridge_attach(dp->encoder, &dp->bridge, NULL, 0);
>>>> +	if (dp->plat_data->panel)
>>>> +		/* If the next is a panel, the EDID parsing is checked by the panel driver */
>>>> +		bridge->ops = DRM_BRIDGE_OP_MODES | DRM_BRIDGE_OP_DETECT;
>>>> +	else if (dp->plat_data->next_bridge)
>>>> +		/* If the next is a bridge, the supported operations depend on the next bridge */
>>>> +		bridge->ops = 0;
>>>
>>> And what if the next bridge is dp_connector without a separate HPD pin?
>>
>> This case was indeed not taken into account.
>>
>> If the next is a bridge, it should be better to set DRM_BRIDGE_OP_DETECT and
>> return connector_status_connected in analogix_dp_bridge_detect(). This
>> ensures the connection status remains connected for both the dp-connector
>> and the bridges without DRM_BRIDGE_OP_DETECT.
> 
> Maybe OP_EDID | OP_DETECT? I think, we need to fix drm_bridge_connector
> to stop preferring OP_EDID bridges over OP_MODES if the latter one is
> enountered later in the chain. In other words inside
> drm_bridge_connector_init() clear bridge_edid if OP_MODES is encountered
> and vice versa. This way you can always declare OP_EDID here (after
> converting to panel bridge) and then letting panel's OP_MODES take over
> mode declaration. Would you please include such a patch in the next
> iteration?
> 

I see. Following your suggestions, the logic will be:

1.If the later bridge declares OP_MODES and 
&drm_bridge_connector.bridge_edid already exists, the 
&drm_bridge_connector.bridge_edid should be set to NULL.
2.If the later bridge declares OP_EDID and 
&drm_bridge_connector.bridge_modes already exists, the 
&drm_bridge_connector.bridge_modes should be set to NULL.
3.If the later bridge declares both OP_EDID and OP_MODES, set 
&drm_bridge_connector.bridge_modes and &drm_bridge_connector.bridge_edid 
to it(preserving the existing behavior).

I will add a new commit with necessary code comments to implement this 
in v6.

>>
>>>
>>>> +	else
>>>> +		/* In DP mode, the EDID parsing and HPD detection should be supported */
>>>> +		bridge->ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
>>>> +
>>>> +	bridge->of_node = dp->dev->of_node;
>>>> +	bridge->type = DRM_MODE_CONNECTOR_eDP;
>>>> +	ret = devm_drm_bridge_add(dp->dev, &dp->bridge);
>>>> +	if (ret)
>>>> +		goto err_unregister_aux;
>>>> +
>>>> +	ret = drm_bridge_attach(dp->encoder, bridge, NULL, 0);
>>>>    	if (ret) {
>>>>    		DRM_ERROR("failed to create bridge (%d)\n", ret);
>>>>    		goto err_unregister_aux;
>>>
>>

Best regards,
Damon


