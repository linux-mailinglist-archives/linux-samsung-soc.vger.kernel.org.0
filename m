Return-Path: <linux-samsung-soc+bounces-9325-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB300B014E4
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 11 Jul 2025 09:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F0CB5A2A79
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 11 Jul 2025 07:42:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D50141F12FB;
	Fri, 11 Jul 2025 07:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b="MVDBP+Ml"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-m3289.qiye.163.com (mail-m3289.qiye.163.com [220.197.32.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A12731F0E24;
	Fri, 11 Jul 2025 07:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752219753; cv=none; b=o+kSjR9XdKRd4uPqL42QH0d9UG7IwZevh4EQu02XOkAvPBZ2jJydiJjui2A7hr540HjqZMHZXLEj5bXZthstMo/HylPyis1xSq7w+DJP00dE0sZa7Z3fDerUDYWShv3cKH8GbTrr7JO4RNAb38EXiEzC8QJK9gcPD5NR2LsEzhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752219753; c=relaxed/simple;
	bh=zSY5SfpIxP5bW4/J02CzHcFnbyzwnF76bsOcMPBvMAM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LT0aihJmlEbOswMNwKVF3fU+iiJzZWteC9trBBx/VprfDS9KAFxN/aOspqFCv2d4fk6lWuob73iAuVYD8koTW07ICy0Q7Uo9InGW98u7OSmsJPPwtvZ3U4Ki2R6Zq+3wDeBRyENPBDXdiGEMqoek7dw4zQHJGtxWKuK/tkoadzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com; spf=pass smtp.mailfrom=rock-chips.com; dkim=pass (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.b=MVDBP+Ml; arc=none smtp.client-ip=220.197.32.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rock-chips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rock-chips.com
Received: from [172.16.12.26] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1bae50b4c;
	Fri, 11 Jul 2025 15:26:58 +0800 (GMT+08:00)
Message-ID: <ec271884-87a1-4117-a7f7-45e423b9de8a@rock-chips.com>
Date: Fri, 11 Jul 2025 15:26:57 +0800
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] drm/exynos: exynos_dp: Remove redundant
 &analogix_dp_plat_data.skip_connector
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
 <20250709070139.3130635-6-damon.ding@rock-chips.com>
 <6306541.2iPT33SAM4@diego>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <6306541.2iPT33SAM4@diego>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0saQ1ZPTxhIHh8aQx1OS0NWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a97f86155fa03a3kunm5a905d91f32139
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MC46TRw5ATE0Qh8eE1ZDGTwX
	PEIKCy9VSlVKTE5JSUpDQ0lLSUpNVTMWGhIXVR8aFhQVVR8SFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJQk5INwY+
DKIM-Signature:a=rsa-sha256;
	b=MVDBP+MlXmQIBids0j03Vrslb0E7yHyCGuZ7vavVT9bPeByoPFrna+SYZtUEzpKc162OMDNeixdHM2x4Lyi7dBzfmK8GzfH9YcN70K/4VBtbxnDPFtyKHshIarOPguVv7/6s15pne+vD4nRZd1JOoUilcMrtPA7VZP8FsUR2+wQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=3f/SyxPB0VfACu7tJD6T5FVMoYuITfLiK8Gntfmm160=;
	h=date:mime-version:subject:message-id:from;

Hi Heiko,

On 2025/7/10 3:58, Heiko Stübner wrote:
> Hi Damon,
> 
> Am Mittwoch, 9. Juli 2025, 09:01:32 Mitteleuropäische Sommerzeit schrieb Damon Ding:
>> The &analogix_dp_plat_data.skip_connector related check can be replaced
>> by &analogix_dp_plat_data.bridge.
>>
>> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
>> ---
>>   drivers/gpu/drm/exynos/exynos_dp.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
>> index 9d7d3f009e58..9e1313fdecad 100644
>> --- a/drivers/gpu/drm/exynos/exynos_dp.c
>> +++ b/drivers/gpu/drm/exynos/exynos_dp.c
>> @@ -237,7 +237,6 @@ static int exynos_dp_probe(struct platform_device *pdev)
>>   	dp->plat_data.power_off = exynos_dp_poweroff;
>>   	dp->plat_data.attach = exynos_dp_bridge_attach;
>>   	dp->plat_data.get_modes = exynos_dp_get_modes;
>> -	dp->plat_data.skip_connector = !!bridge;
>>   
>>   out:
>>   	dp->adp = analogix_dp_probe(dev, &dp->plat_data);
>>
> 
> I think you might want to merge
> - drm/exynos: exynos_dp: Remove redundant &analogix_dp_plat_data.skip_connector
> - drm/bridge: analogix_dp: Remove redundant &analogix_dp_plat_data.skip_connector
> 
> Because when separate this creates a bisection issue.
> Like when a bisect happens to land directly on this commit, you already have
> removed the exynos assignment, but the updated check from the following patch
> is not yet in place.
> 
> 

Oh, I see. Squashing related commits together would be better.

Best regards,
Damon


