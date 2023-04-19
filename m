Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8D376E74D8
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 19 Apr 2023 10:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232444AbjDSIUA (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 19 Apr 2023 04:20:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232446AbjDSIT7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 19 Apr 2023 04:19:59 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C05BEC155
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Apr 2023 01:19:57 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id fy21so36517436ejb.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Apr 2023 01:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681892396; x=1684484396;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ItPXPHDOfZGbby39xkX7IqQWchop/Vei1qaPQuYQG5Y=;
        b=FDMLi9cc8hu6zqp7VRHACmMiH4HGnt+zZut8ui16zl3vDJz1/nyupD3o4bqE62UFhl
         inKHhKUMeLNwHioNH/UOlPEALp+PnEHNm3cU/0Hy/xl/u58XXw4S6+G9ASdi759qbPIw
         3JpJhlT6gKbOVJtqOtxhnZRpDEAaumnXSaWl0lVy6yBLWikKOdaOFXSdPLDc59C1e/tq
         HE56Rahq3aiB9cRREmJD3d+l8CCWNgwr7FJHRs5M3o6CdsyjydOzm7+r1Rwq5YbouKpM
         c18QD0xkEBVAARvhOtxZpnqcTCh+/vwjhHJ3ZxeLhezCzScZYObNhmksAMDRkS/tyRGP
         zvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681892396; x=1684484396;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ItPXPHDOfZGbby39xkX7IqQWchop/Vei1qaPQuYQG5Y=;
        b=SIbN5lf7Vk0eTZS0dk4+AmZfmSG/2H5080UVuOeOSDfFIgrS/8WQlLkytHCXtKwVMV
         EQ+6Vz9lbo2w6RTIiAm7PKJ/EIVh9C4mlUa0vXPEg8PQURo6L2jUDx0Jzsu/WgtHm1xL
         ruyNf4VDgGYWL0s2pRoGK2cIp8tLuLFXL6c2eF9eu8f6M+xr54LUBhNNN/9OckLXfoqM
         xgCoP5zmU7OBclBlZA59IPicToOl3KQayEtY6Pn5b9kejifxiS1WuBlgZdFNijxHa+Xn
         MLmh7gbq1LJqA6C63lXiY0mN+Sd/f7PqoFF5aIBvbvsDJ6fND6zdE6IWOL06Rs6mkj00
         GDJQ==
X-Gm-Message-State: AAQBX9eKtJWlwSf5IIiuGnsrt9YuxqSGfJTW64ZaJ+OyNpI799lZK70n
        5WY/XnhKfOmPMKiaDlzXs5H/2A==
X-Google-Smtp-Source: AKy350YsPQp5+u1mozQqwN0mh9L0kY/J42LpWWAGw7UUxDNq0t+l1NHztwdBopzCzWmvT7z8L7b/jg==
X-Received: by 2002:a17:906:953:b0:94f:37af:d21b with SMTP id j19-20020a170906095300b0094f37afd21bmr11149062ejd.74.1681892396201;
        Wed, 19 Apr 2023 01:19:56 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:62f5:eb43:f726:5fee? ([2a02:810d:15c0:828:62f5:eb43:f726:5fee])
        by smtp.gmail.com with ESMTPSA id q1-20020aa7d441000000b0050499afe96bsm7880909edr.10.2023.04.19.01.19.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 01:19:55 -0700 (PDT)
Message-ID: <b91c6cfb-4fd2-1189-72fd-92b40d1b4743@linaro.org>
Date:   Wed, 19 Apr 2023 10:19:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 3/4] spi: s3c64xx: add sleep during transfer
Content-Language: en-US
To:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Mark Brown <broonie@kernel.org>, Andi Shyti <andi@etezian.org>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
References: <20230419060639.38853-1-jaewon02.kim@samsung.com>
 <CGME20230419062755epcas2p1bca14bbd5200ebe5241780d2d7ec1596@epcas2p1.samsung.com>
 <20230419060639.38853-4-jaewon02.kim@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230419060639.38853-4-jaewon02.kim@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/04/2023 08:06, Jaewon Kim wrote:
> In polling mode, the status register is constantly read to check transfer
> completion. It cause excessive CPU usage.
> So, it calculates the SPI transfer time and made it sleep.
> 
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> ---
>  drivers/spi/spi-s3c64xx.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 886722fb40ea..cf3060b2639b 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -561,6 +561,14 @@ static int s3c64xx_wait_for_pio(struct s3c64xx_spi_driver_data *sdd,
>  	u32 cpy_len;
>  	u8 *buf;
>  	int ms;
> +	u32 tx_time;
> +
> +	/* sleep during signal transfer time */
> +	status = readl(regs + S3C64XX_SPI_STATUS);
> +	if (RX_FIFO_LVL(status, sdd) < xfer->len) {
> +		tx_time = (xfer->len * 8 * 1000 * 1000) / sdd->cur_speed;
> +		usleep_range(tx_time / 2, tx_time);
> +	}

Did you actually check the delays introduced by it? Is it worth?

>  
>  	/* millisecs to xfer 'len' bytes @ 'cur_speed' */
>  	ms = xfer->len * 8 * 1000 / sdd->cur_speed;

You have now some code duplication so this could be combined.

Best regards,
Krzysztof

