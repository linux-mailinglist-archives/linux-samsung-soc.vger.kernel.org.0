Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AD82433BFF
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 19 Oct 2021 18:22:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233499AbhJSQZA (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 19 Oct 2021 12:25:00 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:45396
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232764AbhJSQY7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 19 Oct 2021 12:24:59 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 103F44074B
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 16:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634660566;
        bh=nrplF5/n2HJclWoZ/o1OS3oX2QVTFhwY1QiC0HJEo1Q=;
        h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=SJOEO4nylnDqLqlkkx3EmeX05vi+W9IHP3Zgp6c+vi8uPnjOwiZZGCnji/nGyLAcW
         teD3BDkX3xi4RYtONog1HUXRWyP0bVJdVjaDuYSCWTK5UU0MU6Wlvp5sGNuerjZBxU
         cqV3yicngBj3rzDiIo3bin6TTGbu1NCWZQYSfn1FxtCBWiCi+XK0CCKvA/eOp5UOoZ
         951GA4Kl1zfUBai6LkISvhr+esRLMLXm0uQjACJp3t7+ELLhD2F+Vnz7vIrk9T8Tqy
         NNqkPWGsmSP24qo4WNCVxPsjQEyzNlGp+lfM2scIkVxneLS0847cHUEFM73lkccup6
         E6NRygeUxdlNA==
Received: by mail-lf1-f70.google.com with SMTP id i6-20020a056512318600b003fd8c8c2677so1642771lfe.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Oct 2021 09:22:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nrplF5/n2HJclWoZ/o1OS3oX2QVTFhwY1QiC0HJEo1Q=;
        b=Xifm8Y/HRPxDTcTLlZADWx693o86UCF6EqxB586oXLxU/gJurOT0wN5ta9rUL/DqDX
         sD66Q6xo0GzXd4Dwu1Yn1JGNbEVwKaKpq21p8FcRbQCleNaBKG4Etu96c+5yP8On58X8
         /q1CGlwtuYyIcoe6U1EchH1DIiredV1g0DYvt2HB2Nui8gNEPF9exOmAWIgItIee7V6H
         SDElcPPWs2zZ8bgG3Ql66dneyTJBb6QJMIEUXw5J9o2rPmQ4/zLaD3IPhdkG5liiVCGS
         GWgKB9wc55527IQuDO6GSL7w4sAsiqoEhR9xhn6no4mpGi8NQ4VdWh7OT7vby7OfwxMy
         8o/Q==
X-Gm-Message-State: AOAM532VgOUN84clp8ax3BjwTSEvbOHh84JOJkVEJ8RN6hAP2SQ4eCPl
        KgeKDrrH/SLSfcRvei7QagmF7Kv2FghHRDoy4XB7qnYftEcup/xZEKuI7dmBCQgDQORTf4LbU4i
        hV/A5KFrqWVLLsG+cYtEqqlGQ3E6rJPsahQZTQtzn1jQ7O6yE
X-Received: by 2002:a05:651c:1503:: with SMTP id e3mr7584362ljf.182.1634660565533;
        Tue, 19 Oct 2021 09:22:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLfk4wVZVwvZJIEzb/oTGdx5lSxBHrZwnb1vR6F2383EIW8C3UxKhZXarC7rq4K9F+3uQmsw==
X-Received: by 2002:a05:651c:1503:: with SMTP id e3mr7584342ljf.182.1634660565385;
        Tue, 19 Oct 2021 09:22:45 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id x10sm1705240lff.44.2021.10.19.09.22.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 09:22:45 -0700 (PDT)
Subject: Re: [PATCH 2/4] rtc: s3c: Add time range
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20211019131724.3109-1-semen.protsenko@linaro.org>
 <20211019131724.3109-3-semen.protsenko@linaro.org>
 <6dbd4812-bac3-55dc-108e-c322e8a493de@canonical.com>
Message-ID: <6ce55971-bee5-1bc9-c3a2-28e6ede37401@canonical.com>
Date:   Tue, 19 Oct 2021 18:22:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6dbd4812-bac3-55dc-108e-c322e8a493de@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/10/2021 18:17, Krzysztof Kozlowski wrote:
> On 19/10/2021 15:17, Sam Protsenko wrote:
>> This RTC driver only accepts dates from 2000 to 2099 year. It starts
>> counting from 2000 to avoid Y2K problem, 
> 
> 1. Where is the minimum (2000) year set in the RTC driver?

Ah, indeed. I found it now in the driver.

> 
>> and S3C RTC only supports 100
> 
> On some of the devices 100, on some 1000, therefore, no. This does not
> look correct.

That part of sentence is still incorrect, but change itself makes sense.
Driver does not support <2000.

Best regards,
Krzysztof
