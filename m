Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 582AF36AC57
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 26 Apr 2021 08:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231913AbhDZGq2 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 26 Apr 2021 02:46:28 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:39041 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbhDZGq2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Apr 2021 02:46:28 -0400
Received: from mail-ed1-f70.google.com ([209.85.208.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lav05-0001cB-Pj
        for linux-samsung-soc@vger.kernel.org; Mon, 26 Apr 2021 06:45:45 +0000
Received: by mail-ed1-f70.google.com with SMTP id l7-20020aa7c3070000b029038502ffe9f2so16656404edq.16
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Apr 2021 23:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9xIOSyOaw73gC2mc2/PSWGKHvijdirmS0Vp1Q5g1N6w=;
        b=QNuPwxeL3cd3qEyT2YWTubMQ+MK8a0FMFoV2qqhlwMU56srAplGyHfBMPqeu6x8ulP
         iQI85ysL2b3TsMuuj0MpL2+vg2QBb7o7iwQuIjVmcp74UCpf7bFBCcAnQAXsDY9pNenh
         oxWstlosxOIhLVcRQHYOkexmhMH+Fylr1e1sXt5DIfWBB0vuhBrR/rfQ5M9Da3Jega7S
         01SBPyDnBjlhfgJkxVkte8tQZypVkvomyUngMUaO8iNuRekvIGuz7NelgAI+Cc00muks
         bIn9c2raPnn6hjBMeZZEpfcWMBh6/VdjEDIuWVYrRa7QydSiLgucWU0VdWCnV/L847Jw
         iWiQ==
X-Gm-Message-State: AOAM532tlA974rZI68X7l1rgsy3Eg81SWztD4wb0vFO8Q+IVaVjCom68
        YNo2y39D8LXCrkBtPwQ0Fie6EN9dY7Wp7UsVoM1mfmMomsCIynSqwXz6yvdaTtTTsnWM6oqy6Dy
        FLr1TPJpF/uCb9z0GtfuJc5xhQZMXtX/CtYMwvLrHve5bgNlV
X-Received: by 2002:a50:fe01:: with SMTP id f1mr19629111edt.272.1619419545520;
        Sun, 25 Apr 2021 23:45:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfP2P5sSZTd3ChDyRUf3HpzyJroOEypIN/0HezN1dZ5z0xM+oplOtY61SZz9ALWE1vc6xFsg==
X-Received: by 2002:a50:fe01:: with SMTP id f1mr19629099edt.272.1619419545316;
        Sun, 25 Apr 2021 23:45:45 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id g22sm10864117ejz.46.2021.04.25.23.45.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Apr 2021 23:45:45 -0700 (PDT)
Subject: Re: [PATCH] tty: serial: samsung_tty: remove set but not used
 variables
To:     Greg KH <gregkh@linuxfoundation.org>,
        "tiantao (H)" <tiantao6@huawei.com>
Cc:     Tian Tao <tiantao6@hisilicon.com>, jirislaby@kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org
References: <1619170740-63717-1-git-send-email-tiantao6@hisilicon.com>
 <YIKXs7WCF2zI3uvI@kroah.com>
 <660e8905-6c5c-e076-5211-a87a62ea5c87@huawei.com>
 <YIKeAFbqyl00tHXH@kroah.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6ea876c3-2ffb-ed39-e927-0eea57af21bd@canonical.com>
Date:   Mon, 26 Apr 2021 08:45:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YIKeAFbqyl00tHXH@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 23/04/2021 12:14, Greg KH wrote:
> On Fri, Apr 23, 2021 at 05:54:16PM +0800, tiantao (H) wrote:
>>
>> 在 2021/4/23 17:47, Greg KH 写道:
>>> On Fri, Apr 23, 2021 at 05:39:00PM +0800, Tian Tao wrote:
>>>> The value of 'ret' is not used, so just delete it.

Tian Tao, please use scripts/get_maintainers.pl to get the list of
people needed for Cc.

>>>>
>>>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>>>> ---
>>>>   drivers/tty/serial/samsung_tty.c | 1 -
>>>>   1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
>>>> index d9e4b67..d269d75 100644
>>>> --- a/drivers/tty/serial/samsung_tty.c
>>>> +++ b/drivers/tty/serial/samsung_tty.c
>>>> @@ -2220,7 +2220,6 @@ static int s3c24xx_serial_probe(struct platform_device *pdev)
>>>>   			default:
>>>>   				dev_warn(&pdev->dev, "unsupported reg-io-width (%d)\n",
>>>>   						prop);
>>>> -				ret = -EINVAL;
>>> That looks odd, shouldn't you do something with this instead of ignoring
>>> it???
>>
>> How about this ？
>>
>> diff --git a/drivers/tty/serial/samsung_tty.c
>> b/drivers/tty/serial/samsung_tty.c
>> index d9e4b67..9fbc611 100644
>> --- a/drivers/tty/serial/samsung_tty.c
>> +++ b/drivers/tty/serial/samsung_tty.c
>> @@ -2220,8 +2220,7 @@ static int s3c24xx_serial_probe(struct platform_device
>> *pdev)
>>                         default:
>>                                 dev_warn(&pdev->dev, "unsupported
>> reg-io-width (%d)\n",
>>                                                 prop);
>> -                               ret = -EINVAL;
>> -                               break;
>> +                               return -EINVAL;
>>
> 
> You tell me, does the patch work for you?
> 
> Is this really a "hard error" and did you now just break devices that
> used to work properly?  Are you correctly unwinding any previously
> allocated state when you return here?
> 
> Please do some research on this, and ideally, lots of testing, before
> submitting it as a real solution.

It's a patch coming from automated tool (e.g. Coverity), so I doubt
there is any testing here. However the "return -EINVAL" looks correct here:
1. No particular unwinding is needed here,
2. It's an optional property (not used by existing DTS, only
non-upstreamed by Samsung) thus treating it as hard-error is fine.
Probably better to exit than convert it to some default value.


Best regards,
Krzysztof
