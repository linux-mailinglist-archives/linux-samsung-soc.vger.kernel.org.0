Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 719713DBCCB
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 30 Jul 2021 18:05:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229587AbhG3QFz (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 30 Jul 2021 12:05:55 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:50338
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229477AbhG3QFy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 12:05:54 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 446C43F233
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jul 2021 16:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627661148;
        bh=ckOz90kE72EEodkfysirBp4bfPPhomkbsSq4zFCD8p4=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=ivOSwVeQ0XHeXJBn214ExMBSMaX2KvjrEqvC+7lTcxGxtfWL13XYfOQpgoFMqebyL
         lKFXypmXXtKLme757tve6gpoWOI7zOxyYNZgqjALJxUvxOtTabZIWt4GCV8pH9pGNr
         uH5TNdRyTINpmfX10QPA19OX2vYHPuTv2CtnFEes1iwLWMSsQiahHYyvamYA6K9VkG
         JCF73vvZFCBmbl3EWPkbfzNPMXxtMj5mOxerhiQyBn4IsPLzPQ1lDzlub4DfgPLPZr
         gv6YGzFsgOfDfMMAKTIXQdBY4PqKp7vH4tAPYitmmTgV5nXROYHrlFZ7jdbzpufSZT
         jbATtbenVqPVg==
Received: by mail-ed1-f69.google.com with SMTP id n24-20020aa7c7980000b02903bb4e1d45aaso4813360eds.15
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jul 2021 09:05:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ckOz90kE72EEodkfysirBp4bfPPhomkbsSq4zFCD8p4=;
        b=uBjFKSERr7viF/gmDpm8QZz1bE3UyWH1kH7MuNAX7knmNGxQ9qb51DuwxdCSuMn/CP
         TSGIBbzjBbrmtYerp9AXGCjtZIwzlKY+RBvulbRIvIW25amD+DDk+wqVmuzo9N/yL8ce
         WnSNU2xT5gVVEQ4JykV7npK4zde2mM9aqdsKd6WlHl2E0zy6pao9F/+1HGI22RGeOgGa
         F+BzJkLqpt13kc+GMAMBHujlXPBOrXYSeIeXWpWT/NBV5isNwAypQ/J5czbDLooVvfp2
         EIvNAmsabiUW8Lqqt5emFjW7zeW1Z7z6A95O0wfTGuiIvhtadIbdBAg74AFkxR2SD4GW
         dxUw==
X-Gm-Message-State: AOAM531nN5JybMz1yzvXjcbAC7No5u/VD5bnIaueU9tRU/JuU/lFT7Uk
        +WERi5q4ezx9T54XzMjVIyY/3klTtQQE/qOCcuWM9tk361jb+qJBHSlkbSPTjBc68BbvadNSZZE
        OeNY4P7gaWmTBQjZLGcnqIDa1glXecpyxwUrZFh6eI1P9C/e3
X-Received: by 2002:a17:906:c0cd:: with SMTP id bn13mr3270803ejb.251.1627661145661;
        Fri, 30 Jul 2021 09:05:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7c3uXOvkRzFd+EjfGwOi9GkfnP6xyPWeV21oXtz+M8LxzO4q9ZXaaXNPEO6I0wjp44bYNLA==
X-Received: by 2002:a17:906:c0cd:: with SMTP id bn13mr3270781ejb.251.1627661145512;
        Fri, 30 Jul 2021 09:05:45 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id b3sm697246ejb.7.2021.07.30.09.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jul 2021 09:05:45 -0700 (PDT)
Subject: Re: [PATCH 06/12] tty: serial: samsung: Add Exynos850 SoC data
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-7-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <5826bc3e-e9e8-a9bb-4541-21c1b944a60e@canonical.com>
Date:   Fri, 30 Jul 2021 18:05:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730144922.29111-7-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 30/07/2021 16:49, Sam Protsenko wrote:
> Add serial driver data for Exynos850 SoC. This driver data is basically
> reusing EXYNOS_COMMON_SERIAL_DRV_DATA, which is common for all Exynos
> chips, but also enables USI init, which was added in previous commit:
> "tty: serial: samsung: Init USI to keep clocks running".
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/tty/serial/samsung_tty.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> index 75ccbb08df4a..d059b516a0f4 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -2814,11 +2814,19 @@ static struct s3c24xx_serial_drv_data exynos5433_serial_drv_data = {
>  	.fifosize = { 64, 256, 16, 256 },
>  };
>  
> +static struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
> +	EXYNOS_COMMON_SERIAL_DRV_DATA_USI(1),
> +	.fifosize = { 0, },

This does not look correct. You rely on samsung,uart-fifosize property
but it is optional.


Best regards,
Krzysztof
