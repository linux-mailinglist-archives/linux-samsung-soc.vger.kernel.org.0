Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E72054BE9E8
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 21 Feb 2022 19:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbiBURmF (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 21 Feb 2022 12:42:05 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbiBURl0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Feb 2022 12:41:26 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8FB5A27162
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Feb 2022 09:40:32 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B0A2B3F1CA
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Feb 2022 17:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645465230;
        bh=LpXc1xYis15tzZuBaX7CvS9s8Rflb3ZQ3aLFG0/YcJA=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=FU0iDj/NLtFSFs7+KGn6wQno8TgVaM2AgpOHn0c74upm1Fgpm1kTpq7iT8OeLUUuD
         fFnAfRRHbsRWVpQ0EGWlzmwpwLOxTwzbvgmF9rxEvB7iejuV0IfXkAVcNfV74eUnnE
         Hulu205dtMhTXnDYxDvDiQvcBxgAB1623a7bI2KO1nZj/wd6kJBMhdOsFsc+7sAF4r
         ncHdIMiZgY/Pba6B8gfiW8Fj95sjFkWzddIeM5mq4Eoqgg0C6wa4+DJ/pKsK2YW3me
         PjjvuxG1K7W24ULolQXjGR+yHoZqZqF/vQxYhQW0fprQuz22HBqru+yyKB0WtgtBR0
         gH3aeO1TbG3CQ==
Received: by mail-ed1-f70.google.com with SMTP id l14-20020aa7cace000000b003f7f8e1cbbdso10481425edt.20
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Feb 2022 09:40:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=LpXc1xYis15tzZuBaX7CvS9s8Rflb3ZQ3aLFG0/YcJA=;
        b=rEY5iafIrwuD5BG5EssYbHuNXUn+rTIv+qjRYmx4ZvH237FJSHO0q0y5UsndCew3s/
         /Fwj0Q2ZFDIoMRh6+wwuGV9YCF94C4s3S3ligCDTdODeqjqGDYF7UJSq0cwx+f1ur5ih
         YjXCgZRMHbJDQ9tn74fQI1eaSJgJLda1RXD4g2ciNexEjuW7aW4S5yBR3IbytbBHOvIx
         xrGAVFLeRiHp1IsnewaQLHtw0brlQwwIVOX9Kkr3IbVu/zYxslCdKU3iUF6CFk77GEEb
         t+M+YA1zNvt6AuQRAbHeckULqHGE8s90spsY13hhDo6R+/v8t0IdRqA3viD9lSiBk94h
         1xTA==
X-Gm-Message-State: AOAM531mnXZrtIkzmFCkXnHuBzlDkvyxPCXU2jx+0EGhn6gnaU0xlIeC
        GUwzg56QSx7EetaJyCK5p+P7EEPAa5pE5x2d/tFb32ruEhLJzE7+TdCjCKYE2TAmUP0t7Gv15Rv
        NMO9VlcL4HchHQju0Rgv1an499hShcGhTT/yXIdq8JcVzZcs1
X-Received: by 2002:a50:fc05:0:b0:408:4d18:5070 with SMTP id i5-20020a50fc05000000b004084d185070mr22842609edr.365.1645465230438;
        Mon, 21 Feb 2022 09:40:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMxvJLsv/ZkxbFBnRkJZaiCErCEJ36+3HERlONGEdDrjbZqffp0RJNO7yqStYkMMNu0XCjfQ==
X-Received: by 2002:a50:fc05:0:b0:408:4d18:5070 with SMTP id i5-20020a50fc05000000b004084d185070mr22842598edr.365.1645465230312;
        Mon, 21 Feb 2022 09:40:30 -0800 (PST)
Received: from [192.168.0.122] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id hp7sm259204ejc.144.2022.02.21.09.40.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 09:40:29 -0800 (PST)
Message-ID: <bf907500-fbf4-dae9-2e7a-e14d61a85b87@canonical.com>
Date:   Mon, 21 Feb 2022 18:40:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 3/3] clocksource/drivers/exynos_mct: increase the size
 of name array
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     linux-samsung-soc@vger.kernel.org, daniel.lezcano@linaro.org,
        tglx@linutronix.de, pankaj.dubey@samsung.com,
        m.szyprowski@samsung.com
References: <20220221174547.26176-1-alim.akhtar@samsung.com>
 <CGME20220221173407epcas5p117620b55b5f5a94d6a525342374efa51@epcas5p1.samsung.com>
 <20220221174547.26176-3-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220221174547.26176-3-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/02/2022 18:45, Alim Akhtar wrote:
> Variable _name_ hold mct_tick number per cpu and it is currently
> limited to 10. Which restrict the scalability of the MCT driver for
> the SoC which has more local timers interrupts (>= 12).
> Increase the length of it to make mct_tick printed correctly for
> each local timer interrupts per CPU.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  drivers/clocksource/exynos_mct.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
