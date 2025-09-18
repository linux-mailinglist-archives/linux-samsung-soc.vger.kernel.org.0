Return-Path: <linux-samsung-soc+bounces-10049-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B33B27672
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 15 Aug 2025 05:04:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D119A4E3DD6
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 15 Aug 2025 03:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39137292B38;
	Fri, 15 Aug 2025 03:04:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="CbGPxtlS"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-m15593.qiye.163.com (mail-m15593.qiye.163.com [101.71.155.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17AE189BB0;
	Fri, 15 Aug 2025 03:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755227089; cv=none; b=m6L6KZp+ilGDC1Slc/kYopmLwq95KVtM5EQGT7CFpI3sB77iQmllwiG815qgMdv1pkf9WWTjLjp+CoXSw0RGOA1ruLXH1irRFhvYAl6jPIOrEWpovBY/n0STyO+szTbTOxGXsrB3wIFHYTno94IhdQCWZJMsa5A5nw6nziaTbx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755227089; c=relaxed/simple;
	bh=nnlZY7uW14ujVJ+hApXPEl7ncrr/jP4pdhuBEXApWs0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K0Yy0CWzt/GwlAea9jSfOO6ztq+Zqb/7COiVTyClwmkOgik0DhuJN6hFhHQkRttQRfCaUxH0u6pi/V6ZPkX6bDJy85Dfie4twyAjApq61lM5Cvr0sideSeJgED9OXGqAzYxdFXuMlmx5hi9Mg+K/rk+BaV4tqo0XkD4+mfjHqZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=CbGPxtlS; arc=none smtp.client-ip=101.71.155.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1f749d277;
	Fri, 15 Aug 2025 10:59:31 +0800 (GMT+08:00)
Message-ID: <1ccd3889-5f13-4609-9bd8-2c208e17fc96@rock-chips.com>
Date: Fri, 15 Aug 2025 10:59:32 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/13] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
To: Marek Szyprowski <m.szyprowski@samsung.com>, andrzej.hajda@intel.com,
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
References: <CGME20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264@eucas1p2.samsung.com>
 <20250814104753.195255-1-damon.ding@rock-chips.com>
 <a3a2f8be-2c3c-49e7-b27a-72364ea48b06@samsung.com>
 <7cb50c9c-ac41-43b6-8c69-5f184e7c94cf@samsung.com>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <7cb50c9c-ac41-43b6-8c69-5f184e7c94cf@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98abab119c03a3kunm1448aade49cd3b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0NOGFZMTE5DH0hLGEtOSR5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=CbGPxtlSAL/bz4Zd0Ffltqa0Et/5QfhcDj9ONLF/N0BH5Nd3FmkMlOM/fCYPP+WBERcgKBR2GT0GvbeEuF7VcEpbgbJ7lCVd6UWPEqJYJfLy9NxLPr6VwgWWd7sgGngPT67y3E/PUMauppDgp/23XAPPqK27RCVKhmw8BHpFn64=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=dg6E2ecDLCPyC2BxxmXmYEeUBWon1a9PjvZIHATCs4k=;
	h=date:mime-version:subject:message-id:from;

Hi Marek,

On 2025/8/15 5:16, Marek Szyprowski wrote:
> 
> On 14.08.2025 16:33, Marek Szyprowski wrote:
>> On 14.08.2025 12:47, Damon Ding wrote:
>>> PATCH 1 is a small format optimization for struct analogid_dp_device.
>>> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
>>> PATCH 3-6 are preparations for apply drm_bridge_connector helper.
>>> PATCH 7 is to apply the drm_bridge_connector helper.
>>> PATCH 8-10 are to move the panel/bridge parsing to the Analogix side.
>>> PATCH 11-12 are preparations for apply panel_bridge helper.
>>> PATCH 13 is to apply the panel_bridge helper.
>>
>> This series lacks 'select DRM_BRIDGE_CONNECTOR' in ExynosDP's Kconfig,
>> so it causes build break:
>>
>> drivers/gpu/drm/exynos/exynos_dp.c:177: undefined reference to
>> `drm_bridge_connector_init'
>> make[2]: *** [scripts/Makefile.vmlinux:91: vmlinux] Error 1
>>
>> After adding this dependency, the Exynos DP driver stops working. On
>> Samsung Snow Chromebook I observed following issue:
>>
>> [    4.534220] exynos-dp 145b0000.dp-controller: failed to attach
>> following panel or bridge (-16)
>> [    4.543428] exynos-drm exynos-drm: failed to bind
>> 145b0000.dp-controller (ops exynos_dp_ops): -16
>> [    4.551775] exynos-drm exynos-drm: adev bind failed: -16
>> [    4.556559] exynos-dp 145b0000.dp-controller: probe with driver
>> exynos-dp failed with error -16
>>
>> I will investigate details later in the evening.
> 
> The failure is caused by trying to add plat_data->next_bridge twice
> (from exynos_dp's .attach callback, and from analogix' ->bind callback).
> 
> 
> Best regards

I see. The bridge attachment for the next bridge was not well thought 
out. It may be better to move panel_bridge addition a little forward and 
remove next_bridge attachment on the Analogix side. Then, the Rockchip 
side and Exynos side can do their own next_bridge attachment in 
&analogix_dp_plat_data.attach() as they want.

Could you please help test the following modifications(they have been 
tested on my RK3588S EVB1 Board) on the Samsung Snow Chromebook? ;-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c 
b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 0529bfb02884..8a9ce1f31678 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1573,6 +1573,15 @@ int analogix_dp_bind(struct analogix_dp_device 
*dp, struct drm_device *drm_dev)
                 return ret;
         }

+       if (dp->plat_data->panel) {
+               dp->plat_data->next_bridge = 
devm_drm_panel_bridge_add(dp->dev,
+ 
dp->plat_data->panel);
+               if (IS_ERR(dp->plat_data->next_bridge)) {
+                       ret = PTR_ERR(bridge);
+                       goto err_unregister_aux;
+               }
+       }
+
         bridge->ops = DRM_BRIDGE_OP_DETECT |
                       DRM_BRIDGE_OP_EDID |
                       DRM_BRIDGE_OP_MODES;
@@ -1588,22 +1597,6 @@ int analogix_dp_bind(struct analogix_dp_device 
*dp, struct drm_device *drm_dev)
                 goto err_unregister_aux;
         }

-       if (dp->plat_data->panel) {
-               dp->plat_data->next_bridge = 
devm_drm_panel_bridge_add(dp->dev,
- 
dp->plat_data->panel);
-               if (IS_ERR(dp->plat_data->next_bridge)) {
-                       ret = PTR_ERR(bridge);
-                       goto err_unregister_aux;
-               }
-       }
-
-       ret = drm_bridge_attach(dp->encoder, dp->plat_data->next_bridge, 
bridge,
-                               DRM_BRIDGE_ATTACH_NO_CONNECTOR);
-       if (ret) {
-               dev_err(dp->dev, "failed to attach following panel or 
bridge (%d)\n", ret);
-               goto err_unregister_aux;
-       }
-
         return 0;

  err_unregister_aux:
diff --git a/drivers/gpu/drm/exynos/exynos_dp.c 
b/drivers/gpu/drm/exynos/exynos_dp.c
index 80ba700d2964..d0422f940249 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -104,7 +104,7 @@ static int exynos_dp_bridge_attach(struct 
analogix_dp_plat_data *plat_data,
         /* Pre-empt DP connector creation if there's a bridge */
         if (plat_data->next_bridge) {
                 ret = drm_bridge_attach(&dp->encoder, 
plat_data->next_bridge, bridge,
-                                       0);
+                                       DRM_BRIDGE_ATTACH_NO_CONNECTOR);
                 if (ret)
                         return ret;
         }
diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c 
b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
index 0862b09a8be2..dfd32a79b94f 100644
--- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
@@ -164,6 +164,24 @@ static int rockchip_dp_powerdown(struct 
analogix_dp_plat_data *plat_data)
         return 0;
  }

+static int rockchip_dp_attach(struct analogix_dp_plat_data *plat_data,
+                                    struct drm_bridge *bridge)
+{
+       struct rockchip_dp_device *dp = pdata_encoder_to_dp(plat_data);
+       int ret;
+
+       if (plat_data->next_bridge) {
+               ret = drm_bridge_attach(&dp->encoder.encoder, 
plat_data->next_bridge, bridge,
+                                       DRM_BRIDGE_ATTACH_NO_CONNECTOR);
+               if (ret) {
+                       dev_err(dp->dev, "failed to attach following 
panel or bridge (%d)\n", ret);
+                       return ret;
+               }
+       }
+
+       return 0;
+}
+
  static int rockchip_dp_get_modes(struct analogix_dp_plat_data *plat_data,
                                  struct drm_connector *connector)
  {
@@ -478,6 +496,7 @@ static int rockchip_dp_probe(struct platform_device 
*pdev)
         dp->plat_data.dev_type = dp->data->chip_type;
         dp->plat_data.power_on = rockchip_dp_poweron;
         dp->plat_data.power_off = rockchip_dp_powerdown;
+       dp->plat_data.attach = rockchip_dp_attach;
         dp->plat_data.get_modes = rockchip_dp_get_modes;
         dp->plat_data.ops = &rockchip_dp_component_ops;


Best regards,
Damon


