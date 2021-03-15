Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B02D33ABC6
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 15 Mar 2021 07:46:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbhCOGpp (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 15 Mar 2021 02:45:45 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:14337 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbhCOGpO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 02:45:14 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DzRh76trGz8x2B;
        Mon, 15 Mar 2021 14:43:19 +0800 (CST)
Received: from [127.0.0.1] (10.40.188.144) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Mon, 15 Mar 2021
 14:45:02 +0800
Subject: Re: [PATCH] drm/exynos/decon5433: Clean up GPIO includes
To:     Inki Dae <inki.dae@samsung.com>, Tian Tao <tiantao6@hisilicon.com>,
        <airlied@linux.ie>, <daniel@ffwll.ch>, <krzk@kernel.org>
CC:     <dri-devel@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>
References: <CGME20210303014433epcas1p4fefd6787c74d86d6f11f93318c3833fd@epcas1p4.samsung.com>
 <1614654193-40203-1-git-send-email-tiantao6@hisilicon.com>
 <3fb21326-8e4a-51bf-4f7c-7a3215f08803@samsung.com>
From:   "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <1e83f1d7-20c7-0ab3-0d8d-e331e7e5d09c@huawei.com>
Date:   Mon, 15 Mar 2021 14:45:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3fb21326-8e4a-51bf-4f7c-7a3215f08803@samsung.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.188.144]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


在 2021/3/15 14:35, Inki Dae 写道:
> Hi Tian Tao,
>
> 21. 3. 2. 오후 12:03에 Tian Tao 이(가) 쓴 글:
>> remove the legacy GPIO headers <linux/of_gpio.h> but what it really
>> uses is <linux/gpio/consumer.h> since only gpio_desc structs are ever
>> referenced.
> This driver doesn't reference even linux/gpio/consumer.h so could you drop only of_gpio.h inclusion?

Thanks for helping to review patch,I've posted a new patch to fix this 
problem  If you can give me review-by, I can help push to drm-misc.

Subject: [PATCH] drm/exynos/decon5433: Remove the unused include statements

This driver doesn't reference of_gpio.h, so drop it.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 1 -
  1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c 
b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
index 1f79bc2..1510e4e 100644
--- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
@@ -13,7 +13,6 @@
  #include <linux/irq.h>
  #include <linux/mfd/syscon.h>
  #include <linux/of_device.h>
-#include <linux/of_gpio.h>
  #include <linux/platform_device.h>
  #include <linux/pm_runtime.h>
  #include <linux/regmap.h>

>
> Thanks,
> Inki Dae
>
>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>> ---
>>   drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
>> index 1f79bc2..9fc51a6 100644
>> --- a/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
>> +++ b/drivers/gpu/drm/exynos/exynos5433_drm_decon.c
>> @@ -11,9 +11,9 @@
>>   #include <linux/component.h>
>>   #include <linux/iopoll.h>
>>   #include <linux/irq.h>
>> +#include <linux/gpio/consumer.h>
>>   #include <linux/mfd/syscon.h>
>>   #include <linux/of_device.h>
>> -#include <linux/of_gpio.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/regmap.h>
>>
> .
>

