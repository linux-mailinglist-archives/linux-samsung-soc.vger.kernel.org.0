Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 491613977BB
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  1 Jun 2021 18:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234017AbhFAQPK (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 1 Jun 2021 12:15:10 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49537 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231918AbhFAQPJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Jun 2021 12:15:09 -0400
Received: from mail-ed1-f69.google.com ([209.85.208.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lo71D-0007hP-9Q
        for linux-samsung-soc@vger.kernel.org; Tue, 01 Jun 2021 16:13:27 +0000
Received: by mail-ed1-f69.google.com with SMTP id y7-20020aa7ce870000b029038fd7cdcf3bso4594720edv.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 01 Jun 2021 09:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=2ynkpujCou9NfTAZ9mjRuBBH8CKUsEIW60PHdi5amDs=;
        b=nJrXLDX9cU7he92F/CHJABzk/aR9QtCDQK0zSBRfWVnALVCibmeCI4WQ3153k5fEQW
         h+BRIinzpFpr2g6qhCFvCvPehmmQ6ry4ryXFUOylcHikLxmGGaympYjxG2ab7hUGF2n8
         LxvUNoEjaCBlBm3+ktW70+xDRE9Cf1t9afAj9Vf+e+ubmskvX+/Qbqnr4j5o3hzVJBuO
         s/7XYbB4B9nLrPmpuaK4tq4SuZKJGIBQhwuOumgx2v58VnyOgm7NlfIWEPKO9Ej05Z19
         xAuTwBG7MSSg81qU9Lg1mY15OS1fPoSeKaa26aH02IbdYyGqgPC0Prx5dFOd8wkclth/
         zYlg==
X-Gm-Message-State: AOAM5301XKi4k19ei7p8+f/U6ASEFzXr4KEAVeP9I8w/6EveGakYTUl2
        phfOio9ONnLWFY0QONOtrgY5Vim8YD+DdzJFq+7pUpaf0r9cMaqkHolYntNLYpH+9x6YkGx8GsX
        pYw9oN3SDPddipH0+8Ww3pdN4Ui4zmCLBCFa4oD1iTA/XkAwD
X-Received: by 2002:a05:6402:2044:: with SMTP id bc4mr34517826edb.282.1622564007076;
        Tue, 01 Jun 2021 09:13:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJztLTZkdLCHrH695KliUdfuJxr4t8ctJTHJ8+zUqsCGjcG0A6oz4POiCu53tJSkRGVSxiyXnA==
X-Received: by 2002:a05:6402:2044:: with SMTP id bc4mr34517815edb.282.1622564006974;
        Tue, 01 Jun 2021 09:13:26 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id bh3sm7446959ejb.19.2021.06.01.09.13.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jun 2021 09:13:26 -0700 (PDT)
Subject: Re: [PATCH v2 0/7] mfd/power/rtc: Do not enforce (incorrect)
 interrupt trigger type
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20210526172036.183223-1-krzysztof.kozlowski@canonical.com>
 <20210601154123.GD2159518@dell>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <63ef9657-3b01-f06e-0d61-555806e4b191@canonical.com>
Date:   Tue, 1 Jun 2021 18:13:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210601154123.GD2159518@dell>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 01/06/2021 17:41, Lee Jones wrote:
> On Wed, 26 May 2021, Krzysztof Kozlowski wrote:
> 
>> Hi,
>>
>> This is a v2 with only minor changes:
>> 1. Drop patches which landed in mainline.
>> 2. Add acks.
>> 3. Rebase max17040 power supply (dtschema conversion).
>>
>> Patches are independent and there are no external dependencies, so
>> please pick up freely.
>>
>> Best regards,
>> Krzysztof
>>
>>
>> Krzysztof Kozlowski (7):
>>   mfd: sec-irq: Do not enforce (incorrect) interrupt trigger type
>>   mfd: max77686: Do not enforce (incorrect) interrupt trigger type
>>   mfd: max77693: Do not enforce (incorrect) interrupt trigger type
>>   mfd: max14577: Do not enforce (incorrect) interrupt trigger type
>>   rtc: max77686: Do not enforce (incorrect) interrupt trigger type
>>   power: supply: max17042: Do not enforce (incorrect) interrupt trigger
>>     type
>>   power: supply: max17040: Do not enforce (incorrect) interrupt trigger
>>     type
> 
> MFD patches (at least) do not apply.
> 
> Please rebase and resubmit with my:
> 
> For my own reference (apply this as-is to your sign-off block):
> 
>   Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

I'll resend the MFD part.

For the RTC and power, I hope these apply still cleanly.


Best regards,
Krzysztof
