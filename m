Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DF26952ECCF
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 20 May 2022 15:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346862AbiETNCC (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 20 May 2022 09:02:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236266AbiETNCB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 May 2022 09:02:01 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A72335DCD
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 May 2022 06:02:00 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id bq30so14231672lfb.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 May 2022 06:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=JuZHQ6f7UwG9sEcrBgd7CjvcA+TEESz6YOxMScXKub4=;
        b=oe7Ihu+Q38xydzIWx7L1VP2mveLIrDlraThtNZ/ZoAz2/WRIXeZBgN41A/MlyIrclb
         OrX55qBrx2BeXGVMyQKJbo8sTNu1m0W/RI7XqzVOHPKzCVEtYZnvMUGxFIcRe2ku3vab
         nwDsk93wl9k0K2zNJAs0PP78ghFBgt3k+U/qwe1a+5tmVnQ790bG2ZRF+bm8Og18bq4D
         qiKQA+S5Bq6mbVtHuUk1zZm0+HdDEDMuIA62eCVS8LFH+eewGz4diDxDPYrnXemlBhfn
         nhmz/94tEOF8VvLgU7moZKumeAShxaGFQwb50yMb4q+gRqyKCUG2dJw/rM3D6yu14Xb9
         CWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=JuZHQ6f7UwG9sEcrBgd7CjvcA+TEESz6YOxMScXKub4=;
        b=5ijIeynaAerOevzpvyquT0OVAxplillFyrOh4xjMHDg8tPI9jfYhSDARe2NYdLqG1H
         OQG2mwwiw0M923+USCLviwovVbVyBTGRAVtTN/INnYsNMTrlNeJrYunk8PnpzPlKXmwF
         9t881anss6sNDGPQFQ7kqxW1gQI776F9muJ2G75JlsuZFCwRUPs5la5TPEw1USxbCrkp
         Aq806jveZRk0A7SmOPDeMKSFYAU8Y1+2TlBab+4qco5yyvHqvGqY4pfUj3zlH9UaIuTd
         2e2xjrdKHrCD2xoPy9IifvZI6pBzp6jB7tdNvO4I7BhlwxxSCxpOj4ODGqn8wCcsp5cG
         GTiQ==
X-Gm-Message-State: AOAM530wHtEJN0rgZ4NiHcvB9ymrKE00LnaWcxPl9rDrUOf6GjpVXkgc
        Jt+bRB+iXXjrnCa8h+nk0ndLkQQWoqVrFLPF
X-Google-Smtp-Source: ABdhPJxWUauG7t9fEtUHzFuI8dk+jUlB1lV9RhKNo3qpTJb8fi//3+EhuolJeMHUbppfvl9h7cj5gA==
X-Received: by 2002:a19:4306:0:b0:471:bc59:aeb1 with SMTP id q6-20020a194306000000b00471bc59aeb1mr6715970lfa.566.1653051718531;
        Fri, 20 May 2022 06:01:58 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id b9-20020a056512024900b0047255d21148sm653005lfo.119.2022.05.20.06.01.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 06:01:58 -0700 (PDT)
Message-ID: <4c0c64ac-df79-f677-c6bb-1ba52af41bea@linaro.org>
Date:   Fri, 20 May 2022 15:01:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/4] watchdog: s3c2410_wdt: support exynosautov9 watchdog
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        linux-watchdog@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220520121750.71473-1-chanho61.park@samsung.com>
 <CGME20220520121722epcas2p25b1d7b12db6030b490f191c2ae3e9f9d@epcas2p2.samsung.com>
 <20220520121750.71473-3-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220520121750.71473-3-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/05/2022 14:17, Chanho Park wrote:

> @@ -644,9 +675,11 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev)
>  
>  		switch (index) {
>  		case 0:
> -			return &drv_data_exynos850_cl0;
> +			return variant;
>  		case 1:
> -			return &drv_data_exynos850_cl1;
> +			return (variant == &drv_data_exynos850_cl0) ?
> +				&drv_data_exynos850_cl1 :
> +				&drv_data_exynosautov9_cl1;

This stops scaling... it's fine now, but any next variant will require
some rework.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
