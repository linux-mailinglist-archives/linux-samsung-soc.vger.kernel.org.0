Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC85365338
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 20 Apr 2021 09:25:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229503AbhDTHZd (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 20 Apr 2021 03:25:33 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:60284 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbhDTHZd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Apr 2021 03:25:33 -0400
Received: from mail-ej1-f72.google.com ([209.85.218.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYkkn-00070x-Cm
        for linux-samsung-soc@vger.kernel.org; Tue, 20 Apr 2021 07:25:01 +0000
Received: by mail-ej1-f72.google.com with SMTP id g7-20020a1709065d07b029037c872d9cdcso4434179ejt.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Apr 2021 00:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QlkzODqs3de/2r7bFY21pvtdX8g0owN/7v3UKLodqFM=;
        b=BqR/0vJSf3ZTgfWWQnjAguMGXiElQtEtjSMBr9M0AULNcylV6dVIF7+NjnIHAG78La
         JNZk+ofQL6F8TUqyxb7C80AwTD3/Aiozfzt0fU8FIUKVLgnLAQuNh0Zg33VDm2ysy9Im
         oZQQdixB+Vv+f7lo8yf/oYJdPK1NMWrdkOrimNCQs29WwzgZgGfo1sHorg34O1wUTl0m
         t8/SfqBL78dPwAx/MWqbS9+O2tk58EQH/0LiRnPHCFKq0oCq0ZHf8q/ojZqAgmVtgQ0U
         RusgYGJm5Ek0316EW2YfcYLIZ3MRzO9h4NQqZko1MTZ6QHZzANa/x0Jk/MQUtO7MlLtx
         ZJdw==
X-Gm-Message-State: AOAM531D5J5AajM1aGL+o8/CE6pdXggsTX6fF4csSJeiUbJbI2PXBgiW
        4UDlipjWbMmsKBM2s4K0qPo6LFulwf+4eaiRz1eNrp5AERxolrizeaQKfbsR2uT9s7JInuSkuTd
        xA9BpPY2GuPVw7b9VUZtwl35gfXESelzZT8KcUlcgLZ4eSceH
X-Received: by 2002:a05:6402:4242:: with SMTP id g2mr30143966edb.329.1618903501149;
        Tue, 20 Apr 2021 00:25:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxR0xQR3SxmpcZ02bhOq0nxAtZaxu1UiEvZpH8gjyloyiAJbhjG9+cavdaccyCaffHvyXDN5g==
X-Received: by 2002:a05:6402:4242:: with SMTP id g2mr30143954edb.329.1618903501005;
        Tue, 20 Apr 2021 00:25:01 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id ca1sm15147826edb.76.2021.04.20.00.25.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Apr 2021 00:25:00 -0700 (PDT)
Subject: Re: [PATCH 5/7] mfd: sec: Simplify getting of_device_id match data
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Lee Jones <lee.jones@linaro.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20210419081726.67867-1-krzysztof.kozlowski@canonical.com>
 <CGME20210419081852eucas1p29d7904aa73d6621feb03cb24a91ed95d@eucas1p2.samsung.com>
 <20210419081726.67867-5-krzysztof.kozlowski@canonical.com>
 <64fb91ae-c754-fb25-0ef7-17b2f1b8a1e4@samsung.com>
 <4a5e80c0-653e-a4d6-630e-0d75e3779f6d@canonical.com>
 <a65318f6-1465-a35c-a987-8b833311ef3a@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <cb24912d-1d5d-089b-2cfa-d0c3c3a8b2b6@canonical.com>
Date:   Tue, 20 Apr 2021 09:25:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <a65318f6-1465-a35c-a987-8b833311ef3a@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/04/2021 09:12, Marek Szyprowski wrote:
> On 20.04.2021 09:03, Krzysztof Kozlowski wrote:
>> On 20/04/2021 07:25, Marek Szyprowski wrote:
>>> On 19.04.2021 10:17, Krzysztof Kozlowski wrote:
>>>> Use of_device_get_match_data() to make the code slightly smaller.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>>> ---
>>>>    drivers/mfd/sec-core.c | 9 +++------
>>>>    1 file changed, 3 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
>>>> index 8d55992da19e..3126c39f3203 100644
>>>> --- a/drivers/mfd/sec-core.c
>>>> +++ b/drivers/mfd/sec-core.c
>>>> @@ -10,6 +10,7 @@
>>>>    #include <linux/slab.h>
>>>>    #include <linux/i2c.h>
>>>>    #include <linux/of.h>
>>>> +#include <linux/of_device.h>
>>>>    #include <linux/of_irq.h>
>>>>    #include <linux/interrupt.h>
>>>>    #include <linux/pm_runtime.h>
>>>> @@ -324,12 +325,8 @@ static inline unsigned long sec_i2c_get_driver_data(struct i2c_client *i2c,
>>>>    						const struct i2c_device_id *id)
>>>>    {
>>>>    #ifdef CONFIG_OF
>>>> -	if (i2c->dev.of_node) {
>>>> -		const struct of_device_id *match;
>>>> -
>>>> -		match = of_match_node(sec_dt_match, i2c->dev.of_node);
>>>> -		return (unsigned long)match->data;
>>>> -	}
>>>> +	if (i2c->dev.of_node)
>>>> +		return (unsigned long)of_device_get_match_data(&i2c->dev);
>>>>    #endif
>>> Does it make any sense to keep the #ifdef CONFIG_OF after this change?
>> Good point, it was only to hide usage of of_device_id table.
>>
>>> I would also skip (i2c->dev.of_node) check, because
>>> of_device_get_match_data() already does that (although indirectly).
>> First, the enum sec_device_type would need to be changed so it starts
>> from 1, not 0. It's because the value returned by this function is later
>> assigned to that enum and there is no way currently to differentiate
>> between NULL and S5M8767X.
>>
>> Second, it wouldn't make the code smaller;
>>
>> unsigned long data;
>> data = of_device_get_match_data(&i2c->dev);
>> if (data)
>> 	return data;
> 
> Then maybe one should go further and remove legacy, non-of based 
> initialization, because it is not used at all. This will simplify it 
> even more.

Indeed maybe it's the time to get rid of board-file support...

Thanks for the feedback!

Best regards,
Krzysztof
