Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 745F74024BE
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  7 Sep 2021 09:53:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240047AbhIGHxa (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 7 Sep 2021 03:53:30 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:53152
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233626AbhIGHxa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Sep 2021 03:53:30 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 55834401A9
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Sep 2021 07:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631001143;
        bh=6hoir0QrvzeNUzQCfwlUC1LyxisQ8e3e8Z8lne4EEGs=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=oZiq76QA4iN9HkgXAc99u8jfXdpAm4WHZr4eADrJArW1fI9+nRQK/uZCi5rOv/lCm
         8L1VmvjdZ5JqjcVX4N/aOF99QF3wzNuEyKs8W6Ap9Ozyez2VZKvoZXoYb0w/TKftDJ
         AEohlrzhhPMr1TCFZfmG0DFB7F6L3tCeopKLo0lQbob59jeYMC5aBBi9CHvcuRpFrT
         u1iclnwLumG7RcexDpxNoQnOnzXlA+e+qQoSYxNF1ZIJtP/ALqErhABzz09zZfrLSD
         OTXtWDrASUus+7aVM40mWfdkAtgPV+x7ZsasI13BOPlVv2qMyG0+6bmE2Ydd8VBlwD
         jwr7MiByNLhbA==
Received: by mail-wm1-f70.google.com with SMTP id r125-20020a1c2b830000b0290197a4be97b7so782652wmr.9
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Sep 2021 00:52:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6hoir0QrvzeNUzQCfwlUC1LyxisQ8e3e8Z8lne4EEGs=;
        b=llNsH/McT2F1BMv9edZUVtr8fGAVynuH0Vk/zeTeXblaNbez0U2+ua9JwjNB1BeEJ0
         jUYos9U4CCvFznO+2f71or51X7UuvybZNeil6W3rLPbq8Dbs8ue/hYPIjuE2DSF7Uq3v
         txd49Ln2MVLoQIBFgGnsavMUKQpJQvKW9b9147xfA9QAI3MYJPboodNr6B94N0ZfAdKW
         dwLifxhvXgrGk5BfbGAmCQrKk6HcRcu8fPJasPOyYfUcvR63Z9/BcG5+q6UbCwAcmeb5
         vmNj0S+IJpgDDR+v0Qwcacv3HjPjoMs3WbHT8P/cQ3WKUB/fxIgRMbY0x8qMqR5WhxQZ
         b99A==
X-Gm-Message-State: AOAM532DSHhz3niVy3rxafhTfSsq4sKi2vmQgxouhbPna8euLhc0XU60
        kZ2BvQzOXAf01iCfLzO84YsvH6fiT6RKjsqM03ZxubXKbCkmKMokGvmJH0HF7JDQMNJIICfsSnF
        yuI0XDGvJAQdgjDU2ecbxYT9o43ZJKT65a++eezefneX26Xww
X-Received: by 2002:a05:600c:3b15:: with SMTP id m21mr2518036wms.162.1631001143085;
        Tue, 07 Sep 2021 00:52:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzalMdA7sfLPAn9UvoPi+zO9Qi/NDlD8yJUM6rPa5gBN6QUCzPnSz15tH/qJZ8I+YWe/XOQ1w==
X-Received: by 2002:a05:600c:3b15:: with SMTP id m21mr2518022wms.162.1631001142926;
        Tue, 07 Sep 2021 00:52:22 -0700 (PDT)
Received: from [192.168.3.211] ([79.98.113.15])
        by smtp.gmail.com with ESMTPSA id d29sm9645189wrc.6.2021.09.07.00.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Sep 2021 00:52:22 -0700 (PDT)
Subject: Re: [PATCH v3 3/7] dt-bindings: serial: samsung: Add Exynos850 doc
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>
Cc:     "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Tom Gall <tom.gall@linaro.org>, Marc Zyngier <maz@kernel.org>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Amit Pundir <amit.pundir@linaro.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        John Stultz <john.stultz@linaro.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Stephen Boyd <sboyd@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>
References: <20210811114827.27322-1-semen.protsenko@linaro.org>
 <20210811114827.27322-4-semen.protsenko@linaro.org>
 <YRwodjUxlZmvrvSC@robh.at.kernel.org>
 <CAPLW+4kvty3PQmSki8eM+WSgcA+zFfyD+--e6KBpird0-gOhMw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <20525267-0ea2-cac6-b42b-f651dce3ced5@canonical.com>
Date:   Tue, 7 Sep 2021 09:52:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4kvty3PQmSki8eM+WSgcA+zFfyD+--e6KBpird0-gOhMw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/09/2021 18:27, Sam Protsenko wrote:
> On Wed, 18 Aug 2021 at 00:22, Rob Herring <robh@kernel.org> wrote:
>>
>> On Wed, 11 Aug 2021 14:48:23 +0300, Sam Protsenko wrote:
>>> Add compatible string for Exynos850 SoC.
>>>
>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>> ---
>>> Changes in v3:
>>>   - None
>>>
>>> Changes in v2:
>>>   - None
>>>
>>>  Documentation/devicetree/bindings/serial/samsung_uart.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>
>> Acked-by: Rob Herring <robh@kernel.org>
> 
> Hi guys,
> 
> Can we please merge this one? I can see that corresponding driver
> changes were pulled in already into malinline, but this one seems to
> be missed.

It's a merge window, so this has to wait.

Originally, it should go via Greg's tree along with the drivers. I guess
Rob will skip it now because it has his review/ack. :) If it is still
pending after the merge window, ping me. With Rob's tag I can pick it up
via Samsung SoC.

Best regards,
Krzysztof
