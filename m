Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45618428706
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 11 Oct 2021 08:48:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234284AbhJKGuw (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 11 Oct 2021 02:50:52 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:42488
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234343AbhJKGuw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 11 Oct 2021 02:50:52 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B22413FFF1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Oct 2021 06:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633934931;
        bh=CPA7uzjIObwjcajWBp0XF7TZaxKa4ak20yBxoc8Joug=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=WuVqIwoC3/FEau3CN7P9tkxFMu6/htF8aMWl6AhLm6PedK2eIerybd+kyyO9ZGIof
         VCbnvAZq9mfBo9/Iu1IOoUc9k4+rK+sB99ZM3RbnFnYEweHuE2vBahb4umMSEeDq/U
         lxhJrlWLHQereVEpKllkJx5/HusM+jSor/fhfKOuQltu7mvLBGojGBMi2e7ZdBBMM4
         wjEjpot0LMqS1vAozXwUfO5s7eDnhXwbgEYOpWgcNmHtniQ+KSlD+/oaRor81a/NeI
         HQjiuVcQbt4JajuriF4qoa5joFA2Nt/oxuMoS2t3lILQLSITTlYLLGhvZRNqk2oAEE
         MRoe+4jaQpTgw==
Received: by mail-ed1-f71.google.com with SMTP id h19-20020aa7de13000000b003db6ad5245bso6340847edv.9
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Oct 2021 23:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CPA7uzjIObwjcajWBp0XF7TZaxKa4ak20yBxoc8Joug=;
        b=ajr60PGizC1wPVUvbASFkHWxbDmooKnwOJIv+ztZyip1dArg6a+cWY2CFTaCUl2pOX
         di6d2Oh7ivuYACqbAa6xctsiqnNiVibeXXw7KTs3VUvPu8H1880ET97CXdtrrbZ9i0+2
         QsyHIFeuRzdBCcMATtd9QuXEaoYMH2oHnwF2JUknQCHmXbOl/wJNljXhVnMhIZbs+APr
         0bTR+YOAkmWkfQ+yKhEO7dYk8diY9vVOtSw2Gcjln7YBw5dSyyfWBc4IXnNQ2DKe3D/9
         Q5R8YYRsmwlBbKDM1XXm7N5GFYy5XgTJL+UW6IPHxTkAJkZyN+6Hp+f/agOWP1W9+U8c
         AqWw==
X-Gm-Message-State: AOAM533R0Mi2j+gn8WLn0bLdMWZDfnxDB3bgb3hr6NdWVdWV2J4tvfDj
        QaVI0BV1ycIKASzip8trlb9vAAt0K65PWR7VfmScQRYoS7k07GJRNIwAe4IToX1yFnAPeTPOJiq
        YRjGXX6JXp+7XtnYXhsqfxYQt+f1+L9GqwzRr7PBTIdzt5ibf
X-Received: by 2002:a17:906:b803:: with SMTP id dv3mr23882240ejb.289.1633934931378;
        Sun, 10 Oct 2021 23:48:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuxCqjNMs6Kw57A47X/e54HeKbkQEUbux8m9ZH97PAe0Joxy5ueBHUew3edGYZnzAXBEw19Q==
X-Received: by 2002:a17:906:b803:: with SMTP id dv3mr23882218ejb.289.1633934931167;
        Sun, 10 Oct 2021 23:48:51 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id ox9sm2943850ejb.66.2021.10.10.23.48.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Oct 2021 23:48:50 -0700 (PDT)
Subject: Re: [PATCH 6/7] tty: serial: samsung_tty: Support runtime PM
To:     Hector Martin <marcan@marcan.st>,
        linux-arm-kernel@lists.infradead.org
Cc:     Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Kettenis <mark.kettenis@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20211005155923.173399-1-marcan@marcan.st>
 <20211005155923.173399-7-marcan@marcan.st>
 <77ae3bb1-6da5-3ec6-de33-5e5f661b6145@canonical.com>
 <46109820-904b-4e87-5134-7d045dbbe57e@marcan.st>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <b4aa2023-238a-7929-fd1b-3a2aa0b49b6c@canonical.com>
Date:   Mon, 11 Oct 2021 08:48:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <46109820-904b-4e87-5134-7d045dbbe57e@marcan.st>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/10/2021 07:32, Hector Martin wrote:
>>> +
>>>   		s3c24xx_serial_cpufreq_deregister(to_ourport(port));
>>>   		uart_remove_one_port(&s3c24xx_uart_drv, port);
>>> +
>>> +		pm_runtime_disable(&dev->dev);
>>
>> Why disabling it only if port!=NULL? Can remove() be called if
>> platform_set_drvdata() was not?
> 
> Good question, I'm not entirely sure why these code paths have a check 
> for NULL there. They were already there, do you happen to know why? To 
> me it sounds like remove would only be called if probe succeeds, at 
> which point drvdata should always be set.
> 

Exactly, anyway it is not part of your patch, so no problem.


Best regards,
Krzysztof
