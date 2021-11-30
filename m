Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE3E5462E79
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 30 Nov 2021 09:25:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239596AbhK3I2c (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 30 Nov 2021 03:28:32 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:58986
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235299AbhK3I2b (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 30 Nov 2021 03:28:31 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C6D4D3F1F0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Nov 2021 08:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638260707;
        bh=3p+JKumUVKLGKnRDqiGTb6SvutQxVEuErwdRZXy1umI=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=RGpTrwsBKOV0Vn1FU03b4NvZ1F+NDNXmVPUjE4BTB4JXjm4myOYoVtbpl1Tw0k2+5
         RHepkFUtEa5ErPiiEdR61CZjkIfz8nbqs0JA6fT4Nxpg29x7vgw/fcn2l/uEPJKnLn
         EjHGvlZnsOWhvxJ2hYyU1sWSxaywnfUZMz7pt+QsOfUFY7ZNCujCgpNK5BqhXgxtG3
         fp0ud9iznLTLNHIZlecob9acbDzxM/YNBvMGnbgrAYbKXqoWmq63oR85IpOSp8Ydjm
         2SYQxtyuvlPPopPt3zXRI+N5TUBB9Zm7vdRpH99Ak2qP5LtBM1TYTiYF2rLA1QshV5
         U6Ixlxhgy9fqw==
Received: by mail-lf1-f72.google.com with SMTP id h40-20020a0565123ca800b00402514d959fso7577851lfv.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Nov 2021 00:25:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=3p+JKumUVKLGKnRDqiGTb6SvutQxVEuErwdRZXy1umI=;
        b=SYg4Yj31269T7NGxFUfYlHWeJx88BRKcL8bP2g+BU554nf+/MY/nv+N2QmPAfiL6Bd
         NNV65j5tdsrN04Mp6eog811HRUkC9MCLPSF1k1XKLj4O7bc2A1lymDqZQe0duvrJ7eeU
         x8Ha5Rba1C4Niq3nLiY14W+MFCp4DUpLDbImNWVM7wOXWBT5yw8JaWESLQ5i1brg0J89
         p3oqyOy9Fptks4vNbNPcAZ/sleovxkKS3h+Odn4S+7hy10vDmGGOyetDf53N4WafNr9/
         gjOuZ8S6e9YEASHHKOpljaGGw/nmi+q9CkdaIpxN/FrZmgII3pZYITbKj6e7b6vj7lg2
         3tvA==
X-Gm-Message-State: AOAM533s59+Qa73pQcyCGJqRGfduQxdYL+wv1zNr5BhgdTz2x2fT0hlo
        4HJd+oKIpA3LvofblFKqF12clNWuMe8RhpoQ0TdwL0VwJrIHKer0sIc6iaeSYScTnn9D8vnl5mT
        iA4K/AgoE1AN22rxeV2GEXcgRUD8+AmVcDtufxsn+pv/43rhF
X-Received: by 2002:a2e:8691:: with SMTP id l17mr52337005lji.119.1638260707139;
        Tue, 30 Nov 2021 00:25:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdw4vqCeU9ExJ30tnXrnx/idsd2AeWPGkG2nc5MgwnfQ943t0An/5UqXHsZhtvNTbME+PtHw==
X-Received: by 2002:a2e:8691:: with SMTP id l17mr52336973lji.119.1638260706847;
        Tue, 30 Nov 2021 00:25:06 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id v6sm1644426lfo.19.2021.11.30.00.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Nov 2021 00:25:06 -0800 (PST)
Message-ID: <3d3c201c-fcfe-0ebc-5a09-52ba2220bc35@canonical.com>
Date:   Tue, 30 Nov 2021 09:25:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 2/5] soc: samsung: Add USI driver
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jiri Slaby <jirislaby@kernel.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20211130022453.28648-1-semen.protsenko@linaro.org>
 <CAPLW+4=BcQPqyW4gkq1BTYErv_StqvdLNMwbNWEizz1CEL7mnA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAPLW+4=BcQPqyW4gkq1BTYErv_StqvdLNMwbNWEizz1CEL7mnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 30/11/2021 03:31, Sam Protsenko wrote:
> On Tue, 30 Nov 2021 at 04:24, Sam Protsenko <semen.protsenko@linaro.org> wrote:
>>
>> USIv2 IP-core is found on modern ARM64 Exynos SoCs (like Exynos850) and
>> provides selectable serial protocol (one of: UART, SPI, I2C). USIv2
>> registers usually reside in the same register map as a particular
>> underlying protocol it implements, but have some particular offset. E.g.
>> on Exynos850 the USI_UART has 0x13820000 base address, where UART
>> registers have 0x00..0x40 offsets, and USI registers have 0xc0..0xdc
>> offsets. Desired protocol can be chosen via SW_CONF register from System
>> Register block of the same domain as USI.
>>
>> Before starting to use a particular protocol, USIv2 must be configured
>> properly:
>>   1. Select protocol to be used via System Register
>>   2. Clear "reset" flag in USI_CON
>>   3. Configure HWACG behavior (e.g. for UART Rx the HWACG must be
>>      disabled, so that the IP clock is not gated automatically); this is
>>      done using USI_OPTION register
>>   4. Keep both USI clocks (PCLK and IPCLK) running during USI registers
>>      modification
>>
>> This driver implements above behavior. Of course, USIv2 driver should be
>> probed before UART/I2C/SPI drivers. It can be achived by embedding
>> UART/I2C/SPI nodes inside of USI node (in Device Tree); driver then
>> walks underlying nodes and instantiates those. Driver also handles USI
>> configuration on PM resume, as register contents can be lost during CPU
>> suspend.
>>
>> This driver is designed with different USI versions in mind. So it
>> should be relatively easy to add new USI revisions to it later.
>>
>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>> ---
> 
> I'm sorry for sending this v2 series as a bunch of separate mails. My
> msmtp failed in the middle of submission, two times in a row. If it's
> a bother, please tell me and I'll re-send as v3.
> 

You can always fix it by using --in-reply-to and --no-thread. This
unfortunately breaks b4, so please resend (can be v2 RESEND):

Looking up
https://lore.kernel.org/r/20211130022250.28519-1-semen.protsenko%40linaro.org

Grabbing thread from
lore.kernel.org/all/20211130022250.28519-1-semen.protsenko%40linaro.org/t.mbox.gz

Analyzing 2 messages in the thread

Checking attestation on all messages, may take a moment...

  ✓ [PATCH v2 1/5] dt-bindings: soc: samsung: Add Exynos USI bindings

    ✓ Signed: DKIM/linaro.org

  ERROR: missing [2/5]!

  ERROR: missing [3/5]!

  ERROR: missing [4/5]!

  ERROR: missing [5/5]!




Best regards,
Krzysztof
