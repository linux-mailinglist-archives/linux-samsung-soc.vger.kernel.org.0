Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E017472B78
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 13 Dec 2021 12:33:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232911AbhLMLdm (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 13 Dec 2021 06:33:42 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:35584
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232862AbhLMLdl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 13 Dec 2021 06:33:41 -0500
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7E65E3F1B3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Dec 2021 11:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639395220;
        bh=VzBGjYKrsgrY+fTF0zueaq+vb1uGxo85UvSFvdhw/Y4=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=H9NMiaZJfe7cpvcwFDFcKLQfo7Z/VOfIPVp3o2KuVxh1b99+Vg3XrBQn6+NzNJcZS
         ++nMPfOYms8/HOVKDK2F98FyhPY105W+DqBGNWOT1IkKSy1f6hSxArd7B0BjURK0M8
         FN1VOvB+0POEJpb4xrCdFCBVnaHBQAewoADUMBtfLNqrCFd+80/FEub8v7cNuiFeve
         T9EklhQKTaWAuGQHlrTkiVPS9YpQfmSS9nR/mcCsXkXDcG/RLG4yJONaGAiMkkqnre
         YmWs+MCy6bXBVpTx4tZ1zfwxb7ZuGWHHfXnGdvJCNIuv3EJ8G5b6Ay5yGuaTvm/Ig/
         HQdwWAqDLN5xA==
Received: by mail-lj1-f200.google.com with SMTP id h18-20020a05651c159200b0021cf7c089d0so4374951ljq.21
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Dec 2021 03:33:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VzBGjYKrsgrY+fTF0zueaq+vb1uGxo85UvSFvdhw/Y4=;
        b=yI4UKAzXlJzm3NciCNrvNyUqplJy8KwP169d5VSsNir0Yjzg7OtJYRkgbqcK9eUIEh
         nu8pFlaBYFcHc+yMCoYDQvERqLWMt7j8F7DQnOlLS6dxVw6OVPZnmyUuHLHj2KnGOCSZ
         NnXTxr2Tgk2vY9mjXy1G8MDPxfrs9gHq/JPHPaF+Ex9Z6Z3lwz0NNh81tKEJH6hA1K21
         9IDU5pA8s1tJBnpxC7+8+62hfztbj/YqBv8Adna8sI21VzVXMOfoaxBHAvPV3wWB8IMs
         b9KQyLAOmEi1slJTcNppykEwoZkNjiXznJjBpAO5CVRbwvLnkjtzK4NT5Lxz4ik+rZO+
         k/aQ==
X-Gm-Message-State: AOAM530xJeo7dFsAx1ud6UuuGQbTR1lDAYxhZ5S9HGVk/9rWgUz+WC+O
        2Lyv0AbDUQ68YNuwNoaXILnqHLgm0nWrIdq1ujONWwly0A3ZRsL2p5zmGTkaEAWWc0XtMYk72Mr
        TovAiFKSolajcooDWcd2bcGM0iW3GIy7mYCzOoV2kk6FLtdFP
X-Received: by 2002:a05:651c:2011:: with SMTP id s17mr29173959ljo.397.1639395219867;
        Mon, 13 Dec 2021 03:33:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwoh2aGuCAnYRxkKOajKxjFTPY5EBTPRy9GiGWCTv835HFbcvdhoyqGn2vWRqES/MVYmtkeRw==
X-Received: by 2002:a05:651c:2011:: with SMTP id s17mr29173942ljo.397.1639395219673;
        Mon, 13 Dec 2021 03:33:39 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id e3sm1386935lfc.259.2021.12.13.03.33.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Dec 2021 03:33:39 -0800 (PST)
Message-ID: <fd19d251-355a-25c4-e255-97e43c20f251@canonical.com>
Date:   Mon, 13 Dec 2021 12:33:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v3 3/5] tty: serial: samsung: Remove USI initialization
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20211204195757.8600-1-semen.protsenko@linaro.org>
 <20211204195757.8600-4-semen.protsenko@linaro.org>
 <e9472cec-7aca-92c4-6184-f442c0f88d56@canonical.com>
 <CAPLW+4kWmSK7rmUO-bBj-U=JyGWWgguBL2dLa6KCbX6q5CJshA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAPLW+4kWmSK7rmUO-bBj-U=JyGWWgguBL2dLa6KCbX6q5CJshA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 13/12/2021 12:31, Sam Protsenko wrote:
> On Mon, 13 Dec 2021 at 13:00, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On 04/12/2021 20:57, Sam Protsenko wrote:
>>> USI control is now extracted to the dedicated USI driver. Remove USI
>>> related code from serial driver to avoid conflicts and code duplication.
>>>
>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>> ---
>>> Changes in v3:
>>>   - Spell check fixes in commit message
>>>
>>> Changes in v2:
>>>   - (none)
>>>
>>>  drivers/tty/serial/samsung_tty.c | 36 ++++----------------------------
>>>  include/linux/serial_s3c.h       |  9 --------
>>>  2 files changed, 4 insertions(+), 41 deletions(-)
>>>
>>
>> Hi Sam,
>>
>> Does this patch depend on USI driver? In cover letter you did not
>> mention any dependency, so this can go via Greg's tree, right?
>>
> 
> Hi Krzysztof,
> 
> TL;DR: Serial patches from this series don't really depend on USI
> driver and can go via Greg's tree.
> 
> I'd say ideally those should be applied right after USI driver
> patches. Because otherwise we'd have double initialization of USI
> block (from USI driver and from serial driver), which wasn't tested
> and may lead to not functional USI (though I think it should be fine).
> That's why I decided to keep those in one single patch series. But if
> we don't care about some short period of not tested behavior -- then
> those can go via Greg's tree.

I think it is fine considering that only one board will be affected and
it will be already non-bisectable due to DTS/driver changes going
separate branches. More important is to get USI and serial driver
changes in the same kernel release, so in v5.17.


Best regards,
Krzysztof
