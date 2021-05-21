Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C4C38C1D3
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 21 May 2021 10:30:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbhEUIcI (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 21 May 2021 04:32:08 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:5714 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230480AbhEUIcH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 May 2021 04:32:07 -0400
Received: from dggems703-chm.china.huawei.com (unknown [172.30.72.59])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fmfq32t2ZzqVbK;
        Fri, 21 May 2021 16:27:11 +0800 (CST)
Received: from dggeme759-chm.china.huawei.com (10.3.19.105) by
 dggems703-chm.china.huawei.com (10.3.19.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 21 May 2021 16:30:43 +0800
Received: from [127.0.0.1] (10.40.188.144) by dggeme759-chm.china.huawei.com
 (10.3.19.105) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 21
 May 2021 16:30:42 +0800
Subject: Re: [PATCH] drm/exynos: Use pm_runtime_resume_and_get() to replace
 open coding
To:     Inki Dae <inki.dae@samsung.com>, Tian Tao <tiantao6@hisilicon.com>,
        <airlied@linux.ie>, <daniel@ffwll.ch>,
        <krzysztof.kozlowski@canonical.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>
References: <CGME20210520133703epcas1p138cb4b2bc0f0bc0ef45886a16852fa60@epcas1p1.samsung.com>
 <1621517811-64765-1-git-send-email-tiantao6@hisilicon.com>
 <0d5b2910-079e-ecd7-0985-e2b0c8c74b24@samsung.com>
 <722b1b97-b229-2c72-6fc8-42cf294fbd7b@huawei.com>
 <43b89645-808b-e148-7b8e-ddb1856bd48e@samsung.com>
From:   "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <2efa8901-066c-8bf8-7122-1c9ea33d99d8@huawei.com>
Date:   Fri, 21 May 2021 16:30:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <43b89645-808b-e148-7b8e-ddb1856bd48e@samsung.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.188.144]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggeme759-chm.china.huawei.com (10.3.19.105)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


在 2021/5/21 16:36, Inki Dae 写道:
>
> 21. 5. 21. 오후 3:08에 tiantao (H) 이(가) 쓴 글:
>> 在 2021/5/21 12:47, Inki Dae 写道:
>>> Hi,
>>>
>>> 21. 5. 20. 오후 10:36에 Tian Tao 이(가) 쓴 글:
>>>> use pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
>>>> pm_runtime_put_noidle. it also avoids the problem of positive return
>>>> values so we can change if (ret < 0) to if (ret).
>>> Could you tell me why did you change the condition? pm_runtime_resume_and_get() can return only 0 or negative value.
>>> So I think you don't have to change the condition. Could you drop this description?
>>>
>>>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>>>> ---
>>>>    drivers/gpu/drm/exynos/exynos_drm_mic.c | 6 ++----
>>>>    1 file changed, 2 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
>>>> index 3821ea7..6d94eae 100644
>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
>>>> @@ -268,11 +268,9 @@ static void mic_pre_enable(struct drm_bridge *bridge)
>>>>        if (mic->enabled)
>>>>            goto unlock;
>>>>    -    ret = pm_runtime_get_sync(mic->dev);
>>>> -    if (ret < 0) {
>>>> -        pm_runtime_put_noidle(mic->dev);
>>>> +    ret = pm_runtime_resume_and_get(mic->dev);
>>> Right, we can use pm_runtime_resume_and_get function because pm_runtime_resume_and_get function does exactly same thing as existing code does.
>>>
>>>> +    if (ret)
>>> Seems unnecessary change.
>> as you can see，If pm_runtime_resume_and_get returns 0, it means that the function was executed successfully and should not be executed in an if condition.
>>
>> There is no error in continuing to use if (ret < 0), but it is not as concise as using if (ret) directly
>>
> I don't see why positive value should be considered because pm_runtime_resume_and_get function never return positive value as you can see.
> Is there something I'm missing?
sorry， I misunderstand you, I wil send v2 to drop this.
>
>> static inline int pm_runtime_resume_and_get(struct device *dev)
>> {
>>      int ret;
>>
>>      ret = __pm_runtime_resume(dev, RPM_GET_PUT);
>>      if (ret < 0) {
>>          pm_runtime_put_noidle(dev);
>>          return ret;
>>      }
>>
>>      return 0;
>> }
>>> Thanks,
>>> Inki Dae
>>>
>>>>            goto unlock;
>>>> -    }
>>>>          mic_set_path(mic, 1);
>>>>   
>>> .
>>>
>>
> .
>

