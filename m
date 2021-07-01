Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 555513B8DC6
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  1 Jul 2021 08:36:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233942AbhGAGiy (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 1 Jul 2021 02:38:54 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:53460 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231962AbhGAGiy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Jul 2021 02:38:54 -0400
Received: from mail-ej1-f71.google.com ([209.85.218.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lyqJD-0006PZ-KV
        for linux-samsung-soc@vger.kernel.org; Thu, 01 Jul 2021 06:36:23 +0000
Received: by mail-ej1-f71.google.com with SMTP id c13-20020a17090603cdb029049617c6be8eso1703758eja.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Jun 2021 23:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1nK6FKv+wQ5vJJz+UrddvTERhXbD+8+95gnEDeqxL9w=;
        b=ZThy7bHkV0UN+5upeYp/PFGU0jnRHj9TGdEcKr5akFz7vt3V2eFjIT7x3SxZnygju5
         3r8RGkNWC5I5OCz5/4qUOI/dgizoiOem/0Djkdeyr/j8nscf/bRv8ljGGppRnvDd3j1d
         kt6l8mZDtNBhWJbXQJ1xmOowDpl2/7Ojv2UHiRJtq0o1P02xnG6HGSKrO3N5NENXhHPR
         RHX3PW+Zm4xGNBsbW6KhJgExyuMKNJKE+YWpnSm+gLzdZq8vdqRAHDE6exXAQ2GTyFOS
         pAa3EPlOUiNnWM+JzpPHeV/el4qcNxTpmWdmILSG1OooMt3Cj/VHGGK/Ei6MWvTbNPMh
         7Svw==
X-Gm-Message-State: AOAM533uJk8v1BG6H2R79CtYTgHGKnihZ2ydeDiZKv+Uwb+dglOM50o2
        KCYyNBetPYPFospQ8UN3MHFyTgeSKMZ7T6A1nPPvhm53BLd+PvosMvQjpR72mYKxO5OJ/tb78Mb
        +U5CQ8EgCtfFMPcv9yCnUfgjNRIEwuaIGCWh6Fdvdm37QOd4D
X-Received: by 2002:a17:906:6bcd:: with SMTP id t13mr13473683ejs.551.1625121383346;
        Wed, 30 Jun 2021 23:36:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyvZFAOe6lKIu9s5SojYCz91sAwTldnQ6yrZh+sr2ymKgcStvH6BCYTmAH55a1wFZX24Lha4g==
X-Received: by 2002:a17:906:6bcd:: with SMTP id t13mr13473665ejs.551.1625121383124;
        Wed, 30 Jun 2021 23:36:23 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id n2sm13594880edi.32.2021.06.30.23.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jun 2021 23:36:22 -0700 (PDT)
Subject: Re: [PATCH v2] serial: samsung: Checks the return value of function
To:     Tamseel Shams <m.shams@samsung.com>, gregkh@linuxfoundation.org,
        jirislaby@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, alim.akhtar@samsung.com
References: <CGME20210630133115epcas5p1706041f122819d47b18b83853b49694e@epcas5p1.samsung.com>
 <20210630133359.59275-1-m.shams@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <0c608d5e-f59b-3f05-a461-2205cece4b7e@canonical.com>
Date:   Thu, 1 Jul 2021 08:36:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630133359.59275-1-m.shams@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 30/06/2021 15:33, Tamseel Shams wrote:
> "uart_add_one_port" function call may fail and return
> some error code, so adding a check for return value.
> If it is returning some error code, then displaying the
> result, unregistering the driver and then returning from
> probe function with error code.
> 
> Signed-off-by: Tamseel Shams <m.shams@samsung.com>
> ---
> Changes since v1:
> 1. Added support to unregister driver on failure of "uart_add_onr_port"
> function call.
> 2. Commit message updated.
> 
>  drivers/tty/serial/samsung_tty.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
> index 9fbc61151c2e..188e2d2da201 100644
> --- a/drivers/tty/serial/samsung_tty.c
> +++ b/drivers/tty/serial/samsung_tty.c
> @@ -2253,7 +2253,11 @@ static int s3c24xx_serial_probe(struct platform_device *pdev)
>  	}
>  
>  	dev_dbg(&pdev->dev, "%s: adding port\n", __func__);
> -	uart_add_one_port(&s3c24xx_uart_drv, &ourport->port);
> +	ret = uart_add_one_port(&s3c24xx_uart_drv, &ourport->port);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "Failed to add uart port, err %d\n", ret);
> +		goto add_port_error;
> +	}
>  	platform_set_drvdata(pdev, &ourport->port);
>  
>  	/*
> @@ -2272,6 +2276,11 @@ static int s3c24xx_serial_probe(struct platform_device *pdev)
>  	probe_index++;
>  
>  	return 0;
> +
> +add_port_error:

You did not unwind fully s3c24xx_serial_init_port() - clocks.

> +	ourport->port.mapbase = 0;
> +	uart_unregister_driver(&s3c24xx_uart_drv);
> +	return ret;
>  }
>  
>  static int s3c24xx_serial_remove(struct platform_device *dev)
> 


Best regards,
Krzysztof
