Return-Path: <linux-samsung-soc+bounces-9327-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D88B0156F
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 11 Jul 2025 10:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E9E85455AF
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 11 Jul 2025 08:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03DC320C461;
	Fri, 11 Jul 2025 08:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="f3ABdV+J"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-m21467.qiye.163.com (mail-m21467.qiye.163.com [117.135.214.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03291A2632;
	Fri, 11 Jul 2025 08:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.214.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752221147; cv=none; b=ta8Az8H4zeg5kDiZqKwIitKSlQJTioF3QwTyisfIm5olItIENbjK6skHeK9VS2U4i472GgVqkIXMYjNCwI0g0YHqt9rq15x7vbsmI9LmcCDddRWc1yfEEzPyvJx78AXtNnamzs6TTTAQip7Fw/cjnu3dpoDFb/7A1HzUJ0i57PE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752221147; c=relaxed/simple;
	bh=YNgM2YUegra+JJIhbeMsctb/xCYn3P/Rg4e68nZ+iyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gRIh8B3X3056sHw2rG4iSh32ELDnapqqTqBm/pRTl71MAVktBtLJbJ1nZNek+LBYRgABg76bDmWzK/1Q3Zcm6wQbE5xIIEo4NDwETyQ2P5ZnnohWnWoa9SqeYNnWVrSq8tpyO6MBxiyN9yefNnIWRyUC/nH8HgWsSIXIedeN6rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=f3ABdV+J; arc=none smtp.client-ip=117.135.214.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1baf32046;
	Fri, 11 Jul 2025 15:50:18 +0800 (GMT+08:00)
Message-ID: <84b8fe6e-0d33-42a9-9f8f-ed10998429e8@rock-chips.com>
Date: Fri, 11 Jul 2025 15:50:18 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] drm/bridge: analogix_dp: Apply
 drm_bridge_connector helper
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
 hjc@rock-chips.com, andy.yan@rock-chips.com,
 dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20250709070139.3130635-1-damon.ding@rock-chips.com>
 <20250709070139.3130635-13-damon.ding@rock-chips.com>
 <6140569.FjKLVJYuhi@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <6140569.FjKLVJYuhi@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUIeS1YYSUJKSUpMQkgfTxhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a97f876b52003a3kunm13db4e75f3c74a
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PxA6GCo*KjE2Lx8SUSk5EgEj
	C08wCj5VSlVKTE5JSUlLSUlLTEJNVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFPT0lMNwY+
DKIM-Signature:a=rsa-sha256;
	b=f3ABdV+J9ZF4Xh4dDg/WOg07CApS5rihUgUFAvDfOc0Q3Sk0KKlc5dUnKK0B8PkH67LddM3XLMInqreiNp6Iq4k45NkImv8eCKuNN/9Qarq/wNQ452zop5AwY0dB2gNx8FzkKokv0WlZypir9qZ2d0Pl+UxU4dsxr9HRKS+eZqs=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=ugJYj+exyps/6wR5MX4czRxtXgkmuqVMFOJv2QPxESU=;
	h=date:mime-version:subject:message-id:from;

Hi Heiko,

On 2025/7/10 4:11, Heiko Stübner wrote:
> Am Mittwoch, 9. Juli 2025, 09:01:39 Mitteleuropäische Sommerzeit schrieb Damon Ding:
>> Apply drm_bridge_connector helper for Analogix DP driver.
>>
>> The following changes have been made:
>> - Remove &analogix_dp_device.connector and change
>>    &analogix_dp_device.bridge from a pointer to an instance.
>> - Apply devm_drm_bridge_alloc() to allocate &analogix_dp_device that
>>    contains &drm_bridge.
>> - Apply drm_bridge_connector helper to get rid of &drm_connector_funcs
>>    and &drm_connector_helper_funcs.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> ------
>>
>> Changes in v2:
>> - For &drm_bridge.ops, remove DRM_BRIDGE_OP_HPD and add
>>    DRM_BRIDGE_OP_EDID.
>> - Add analogix_dp_bridge_edid_read().
>> - Move &analogix_dp_plat_data.skip_connector deletion to the previous
>>    patches.
>> ---
>>   .../drm/bridge/analogix/analogix_dp_core.c    | 169 ++++++++----------
>>   .../drm/bridge/analogix/analogix_dp_core.h    |   4 +-
>>   2 files changed, 80 insertions(+), 93 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> index abc64cc17e4c..fb510e55ef06 100644
>> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
>> @@ -23,6 +23,7 @@
>>   #include <drm/drm_atomic.h>
>>   #include <drm/drm_atomic_helper.h>
>>   #include <drm/drm_bridge.h>
>> +#include <drm/drm_bridge_connector.h>
>>   #include <drm/drm_crtc.h>
>>   #include <drm/drm_device.h>
>>   #include <drm/drm_edid.h>
>> @@ -948,23 +949,13 @@ static int analogix_dp_disable_psr(struct analogix_dp_device *dp)
>>   	return analogix_dp_send_psr_spd(dp, &psr_vsc, true);
>>   }
>>   
>> -static int analogix_dp_get_modes(struct drm_connector *connector)
>> +static int analogix_dp_bridge_get_modes(struct drm_bridge *bridge, struct drm_connector *connector)
>>   {
>> -	struct analogix_dp_device *dp = to_dp(connector);
>> -	const struct drm_edid *drm_edid;
>> +	struct analogix_dp_device *dp = to_dp(bridge);
>>   	int num_modes = 0;
>>   
>>   	if (dp->plat_data->panel) {
>>   		num_modes += drm_panel_get_modes(dp->plat_data->panel, connector);
> 
> here is one example where a panel_bridge would help :-)
> 
> I.e. I'd think without it the code would need some sort of
> 
>    	if (dp->plat_data->bridge) {
>    		num_modes += drm_bridge_get_modes(dp->plat_data->bridge, connector);
> 
> thing?
> 

Oh, the handling of bridge here is indeed not well thought out. I will 
implement the panel-bridge in the next version.

>> -	} else {
>> -		drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
>> -
>> -		drm_edid_connector_update(&dp->connector, drm_edid);
>> -
>> -		if (drm_edid) {
>> -			num_modes += drm_edid_connector_add_modes(&dp->connector);
>> -			drm_edid_free(drm_edid);
>> -		}
>>   	}
>>   
>>   	if (dp->plat_data->get_modes)
> 

Best regards,
Damon


