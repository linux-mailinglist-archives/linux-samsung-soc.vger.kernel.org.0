Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C65074CF2E6
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  7 Mar 2022 08:48:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235954AbiCGHtp (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 7 Mar 2022 02:49:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235947AbiCGHto (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 02:49:44 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F5E631DF7
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Mar 2022 23:48:49 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 79BC13F5F9
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 07:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646639328;
        bh=NL82W9UcwLeLIZxdqDUqeSVzfk3euX+LYU1WgY6zZBY=;
        h=Message-ID:Date:MIME-Version:Subject:To:References:From:
         In-Reply-To:Content-Type;
        b=NtshgHo3yu4DqpCEs7QR0mz7WIJ9Olnr0AWYcQCUh9/yZJT6EC39SGCW6nhY/l9Zd
         ZUTNlg1TlIEzcSp7Id3s9Tc7Z2yVV8pEtJJSVczwIM4Drw6BK2vWF1EPmYVplqdwLz
         e7TO7aSAdpLfKpRWhym+nXH4ZB0loDt3ofptsSD/trg5Gp0s/Qlu9BmmFHsKWDrjQk
         iSCnCmNPXT8keGRWvClvvbSlnhHj72rvYoLn3QzSi110iz6K+wrTPWBeYGrT7Ibo6b
         lzhbXCbbrCF7ijzARt37HoyIuogOk+DyWdf1tYm8oMN7bBmB5SGAs3o1gyLozjTJdr
         2FuZKZFQykYeg==
Received: by mail-ed1-f69.google.com with SMTP id s7-20020a508dc7000000b0040f29ccd65aso8127324edh.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Mar 2022 23:48:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=NL82W9UcwLeLIZxdqDUqeSVzfk3euX+LYU1WgY6zZBY=;
        b=2GjCHBBD6BZOtgF+4zbwxH18bh3TUmGPLsFuUcxYnPdOGjUSjlQvX7MHvyjEXiszdX
         4k2uNMsPj1BNCNKtSixqW2xndeksg1U/MDhWVhzwC8PZ7zVmP3L8eE8OADv0+4ecJS2Y
         5LXNNMNoxPH1NBAcQp4j41NqF2WdT0d2gUQlYTTKLuJWo1Y98sJYRGgdNuE+MQBBd0eu
         d7kDfjlNu18gVLEuFJHyNr8HkcKf5FjSB6xomn+lJcvq1MShhiHYTR4cWzItAzm1DEM3
         ch7wUqDcz4cnZkmtyF8jszISICnBzF1ZI6RLr2rLgQLK1iAtp46hv6gxRKKmGNa7+14Y
         f85Q==
X-Gm-Message-State: AOAM531me54SctezRHGJN9Bqp/DAg1cskJM/+A/ZklrayFblw6GsGQyg
        3XmKX1521k9azlFNGLxtxtCfU9tAlyFVL80j2dwKN1pJo1uuQA480DmQkQrFnTQpQ3NR8vlWNE/
        crq4NVUKuqrPM866Ebxf2Ok9lkzLRs2g7yun+4+EILHbzxKMa
X-Received: by 2002:a17:906:3748:b0:6db:3859:dca7 with SMTP id e8-20020a170906374800b006db3859dca7mr926530ejc.309.1646639328048;
        Sun, 06 Mar 2022 23:48:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxmbeaf98JCz8PXhYFFfAm6gNhhUWExmMXo4RnKFzBbjb4e8QDroAu2DeDUG1UhXEKBwoQ4KA==
X-Received: by 2002:a17:906:3748:b0:6db:3859:dca7 with SMTP id e8-20020a170906374800b006db3859dca7mr926519ejc.309.1646639327844;
        Sun, 06 Mar 2022 23:48:47 -0800 (PST)
Received: from [192.168.0.140] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id b6-20020a50e386000000b00410d64cb3e4sm5978356edm.75.2022.03.06.23.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Mar 2022 23:48:47 -0800 (PST)
Message-ID: <df43dd5e-253c-3d16-2b18-0a0a2dedaadd@canonical.com>
Date:   Mon, 7 Mar 2022 08:48:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 3/7] tty: serial: samsung: constify
 s3c24xx_serial_drv_data
Content-Language: en-US
To:     Jiri Slaby <jirislaby@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220304080348.218581-1-krzysztof.kozlowski@canonical.com>
 <20220304080348.218581-3-krzysztof.kozlowski@canonical.com>
 <ba2a4504-b886-09b6-71ea-528c99a869f6@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <ba2a4504-b886-09b6-71ea-528c99a869f6@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/03/2022 07:36, Jiri Slaby wrote:
> On 04. 03. 22, 9:03, Krzysztof Kozlowski wrote:
>> The driver data (struct s3c24xx_serial_drv_data) is only used to
>> initialize the driver properly and is not modified.  Make it const.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ...
>> @@ -2726,13 +2726,13 @@ static struct s3c24xx_serial_drv_data s3c6400_serial_drv_data = {
>>   		.ufcon		= S3C2410_UFCON_DEFAULT,
>>   	},
>>   };
>> -#define S3C6400_SERIAL_DRV_DATA ((kernel_ulong_t)&s3c6400_serial_drv_data)
>> +#define S3C6400_SERIAL_DRV_DATA (&s3c6400_serial_drv_data)
>>   #else
>> -#define S3C6400_SERIAL_DRV_DATA (kernel_ulong_t)NULL
>> +#define S3C6400_SERIAL_DRV_DATA (NULL)
>>   #endif
>>   
>>   #ifdef CONFIG_CPU_S5PV210
>> -static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
>> +static const struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
>>   	.info = {
>>   		.name		= "Samsung S5PV210 UART",
>>   		.type		= TYPE_S3C6400,
>> @@ -2755,9 +2755,9 @@ static struct s3c24xx_serial_drv_data s5pv210_serial_drv_data = {
>>   	},
>>   	.fifosize = { 256, 64, 16, 16 },
>>   };
>> -#define S5PV210_SERIAL_DRV_DATA ((kernel_ulong_t)&s5pv210_serial_drv_data)
>> +#define S5PV210_SERIAL_DRV_DATA (&s5pv210_serial_drv_data)
>>   #else
>> -#define S5PV210_SERIAL_DRV_DATA	(kernel_ulong_t)NULL
>> +#define S5PV210_SERIAL_DRV_DATA	(NULL)
> 
> 
> All these changes are somehow irrelevant to the subject/to this patch. 
> Care to put them into a separate patch?
> 
> There is no need to put NULL into parentheses.

I wanted to make it consistent with the other, but indeed I can skip it.

> 
>> @@ -3062,7 +3062,6 @@ static int __init apple_s5l_early_console_setup(struct earlycon_device *device,
>>   OF_EARLYCON_DECLARE(s5l, "apple,s5l-uart", apple_s5l_early_console_setup);
>>   #endif
>>   
>> -MODULE_ALIAS("platform:samsung-uart");
> 
> This is as well a different change to what is claimed.

D'oh, this was not intended. Thanks for spotting it.


Best regards,
Krzysztof
