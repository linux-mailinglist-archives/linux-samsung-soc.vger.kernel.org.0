Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E45DE36AC86
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 26 Apr 2021 08:57:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231934AbhDZG6h (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 26 Apr 2021 02:58:37 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:39197 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbhDZG6h (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Apr 2021 02:58:37 -0400
Received: from mail-ej1-f69.google.com ([209.85.218.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lavBr-0002Ne-Gj
        for linux-samsung-soc@vger.kernel.org; Mon, 26 Apr 2021 06:57:55 +0000
Received: by mail-ej1-f69.google.com with SMTP id t9-20020a1709069489b02903807ab24426so7265946ejx.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Apr 2021 23:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PiG26S9A4Ma4PvZG6HA23/0O0KeK876dtgY3zEwCBlk=;
        b=Zhy9KMTf1G2/t2b3umhIwT9lbfqKwUHHGV6rR7CIK2UrS3JUsG4rH01YuR9zESCrtZ
         SH1yPoSNPk1l7hsZy1+ZPPgBrFLgsqovpDAxcZWEcHemDCZHgfut4wsFAVN53Faauoch
         GxrOuo6RQbSatBtNXdXrkTnLbNQ8VmOaArOw/kctGMHvzeI9fX1Djfj0Z0wja7nJuUif
         Nx7fOBmDZCvp/la14jXMvGQbMg3Baj4Un6Ur2eYuqPsfqiANpTwWNFitpKkWVqrwkT8y
         qLGsenWHhnEH/5LmEgEZpdSV07mEQUldLReNHNmiHiDzfHdcR0cUZn0a2fmJHVODYO5A
         l6iA==
X-Gm-Message-State: AOAM5310Rq7MzWdaieOpBovKHdDxZNG7fw/P/+YbEgJzz9Q48+8xc3Se
        0xTXGB5IBdIHq2kl1l0c+lh7gUIaaNKD7uVUxI76kwnxqop7aaChSS1jU4ygBGOLVo9NJDAIu9D
        y8GEPnWfYQeP44TdkW/otDJRJQNflAcF3ejl17IIZ+7xTahIY
X-Received: by 2002:a17:907:100e:: with SMTP id ox14mr1263420ejb.484.1619420275259;
        Sun, 25 Apr 2021 23:57:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwO835Xk+2TvPHEBM/z6ve/TBSpnZyKQoNpLAHySwF/XL0mQZXWbctCsCAiP/MXBNwSuRXm5w==
X-Received: by 2002:a17:907:100e:: with SMTP id ox14mr1263408ejb.484.1619420275132;
        Sun, 25 Apr 2021 23:57:55 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id k9sm13724782edv.69.2021.04.25.23.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Apr 2021 23:57:54 -0700 (PDT)
Subject: Re: [PATCH] tty: serial: samsung_tty: remove set but not used
 variables
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     "tiantao (H)" <tiantao6@huawei.com>,
        Tian Tao <tiantao6@hisilicon.com>, jirislaby@kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org
References: <1619170740-63717-1-git-send-email-tiantao6@hisilicon.com>
 <YIKXs7WCF2zI3uvI@kroah.com>
 <660e8905-6c5c-e076-5211-a87a62ea5c87@huawei.com>
 <YIKeAFbqyl00tHXH@kroah.com>
 <6ea876c3-2ffb-ed39-e927-0eea57af21bd@canonical.com>
 <YIZkJUel4RPs4lMf@kroah.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <0c11c83b-250a-8d20-0311-347739bce56c@canonical.com>
Date:   Mon, 26 Apr 2021 08:57:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YIZkJUel4RPs4lMf@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 26/04/2021 08:56, Greg KH wrote:
> On Mon, Apr 26, 2021 at 08:45:44AM +0200, Krzysztof Kozlowski wrote:
>> On 23/04/2021 12:14, Greg KH wrote:
>>> On Fri, Apr 23, 2021 at 05:54:16PM +0800, tiantao (H) wrote:
>>>>
>>>> 在 2021/4/23 17:47, Greg KH 写道:
>>>>> On Fri, Apr 23, 2021 at 05:39:00PM +0800, Tian Tao wrote:
>>>>>> The value of 'ret' is not used, so just delete it.
>>
>> Tian Tao, please use scripts/get_maintainers.pl to get the list of
>> people needed for Cc.
>>
>>>>>>
>>>>>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>>>>>> ---
>>>>>>   drivers/tty/serial/samsung_tty.c | 1 -
>>>>>>   1 file changed, 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
>>>>>> index d9e4b67..d269d75 100644
>>>>>> --- a/drivers/tty/serial/samsung_tty.c
>>>>>> +++ b/drivers/tty/serial/samsung_tty.c
>>>>>> @@ -2220,7 +2220,6 @@ static int s3c24xx_serial_probe(struct platform_device *pdev)
>>>>>>   			default:
>>>>>>   				dev_warn(&pdev->dev, "unsupported reg-io-width (%d)\n",
>>>>>>   						prop);
>>>>>> -				ret = -EINVAL;
>>>>> That looks odd, shouldn't you do something with this instead of ignoring
>>>>> it???
>>>>
>>>> How about this ？
>>>>
>>>> diff --git a/drivers/tty/serial/samsung_tty.c
>>>> b/drivers/tty/serial/samsung_tty.c
>>>> index d9e4b67..9fbc611 100644
>>>> --- a/drivers/tty/serial/samsung_tty.c
>>>> +++ b/drivers/tty/serial/samsung_tty.c
>>>> @@ -2220,8 +2220,7 @@ static int s3c24xx_serial_probe(struct platform_device
>>>> *pdev)
>>>>                         default:
>>>>                                 dev_warn(&pdev->dev, "unsupported
>>>> reg-io-width (%d)\n",
>>>>                                                 prop);
>>>> -                               ret = -EINVAL;
>>>> -                               break;
>>>> +                               return -EINVAL;
>>>>
>>>
>>> You tell me, does the patch work for you?
>>>
>>> Is this really a "hard error" and did you now just break devices that
>>> used to work properly?  Are you correctly unwinding any previously
>>> allocated state when you return here?
>>>
>>> Please do some research on this, and ideally, lots of testing, before
>>> submitting it as a real solution.
>>
>> It's a patch coming from automated tool (e.g. Coverity), so I doubt
>> there is any testing here. However the "return -EINVAL" looks correct here:
>> 1. No particular unwinding is needed here,
>> 2. It's an optional property (not used by existing DTS, only
>> non-upstreamed by Samsung) thus treating it as hard-error is fine.
>> Probably better to exit than convert it to some default value.
> 
> So is that a "Reviwed-by:" or not?  :)

First, Tian Tao needs to send a v2 of that patch with a "return" instead
of break. Then this will be a reviewed-by. :)

Best regards,
Krzysztof
