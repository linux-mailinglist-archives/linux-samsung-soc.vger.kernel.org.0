Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E4365F3163
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  3 Oct 2022 15:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229906AbiJCNlE (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 3 Oct 2022 09:41:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbiJCNlD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 3 Oct 2022 09:41:03 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 941E342AC6
        for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Oct 2022 06:41:02 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id k10so16633852lfm.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 03 Oct 2022 06:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ggu8Cn7z/zwCPwUOnXaMQWi6G7iy2Vg9dkgcI3YeUzI=;
        b=blxP0LKU/Yr0QMAPggTAcnD9Uyt1RtfvFtMBCpwQo7QwfEj2AEmc1al7DRvqU8xRxI
         1/prE7hOQzEbcSpYG3qh/5abjmVbaMr/1Sq2yesVH+iixgVgmC2GxWIjHioHpT845KzW
         NdXmka3mSvSO4VQGgVmTR708lfqQd8xTe6+rCMLtI6fecHGz7TIZfsWy0iT4o27xN+54
         gGqoZuC2PIn5fwXsBbfUcNiNBucgmNiXvVbzeGOadsVrFEhW4uQY+L8icwfTeoll2xKN
         2MUSACr9Njb5J8sg0kVHTdsu25NPOCre49cmV02Xh+Ei0b3H/dHvPPLcANyp/fOZMBfJ
         ka2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ggu8Cn7z/zwCPwUOnXaMQWi6G7iy2Vg9dkgcI3YeUzI=;
        b=14+MBzoj6L4pOdpYRWZipY5xhNf+ovlN0Sga5iikJCRfJKHWKUjXjdCBxN1+UqO7El
         m+xSiF7jdWBJ64XLIbYbatXR2Bv376dEQBLmosmUETzLcYsknj8PuVsOICiYQWh0/gtE
         B1QloMKwX1PZVpDNXnCqakf3tQTzp21jFq1KYe5zcwRvvqRbs9iy14Le7eRrhha6sS9T
         ulpopuM2QNwYgyIsX7MCzJvS42BZF4Mu6qmpyp11vXTWcF6givfdz6cVx1KG0j4FmCMz
         ECkc7tSB1pPChd/IImO/40mmwacZpD+aTXQzp+WbSko9iT11HMdR5EgEmxYvaD8fDOSG
         o0zQ==
X-Gm-Message-State: ACrzQf0XWcK0YC6nA2vNLZ5JHrzTtdMloQ2PNGpV1ybEeYAElnllVncj
        Dq9PNqTkEq70G/sWklXmpoyYcQ==
X-Google-Smtp-Source: AMsMyM5BofhxvdkJVT7YGkIkZPZp7FxrpJlq8nWKL6i/DUsDYO9sQ7rPC1ZadZRtIrW/zaxCYQ/oHw==
X-Received: by 2002:ac2:58ce:0:b0:4a2:2a6b:939b with SMTP id u14-20020ac258ce000000b004a22a6b939bmr3437214lfo.274.1664804460987;
        Mon, 03 Oct 2022 06:41:00 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id m14-20020a056512114e00b00494706193adsm1463333lfg.208.2022.10.03.06.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 06:41:00 -0700 (PDT)
Message-ID: <905a82ae-c4f6-ea6c-7396-05acfc4fc53e@linaro.org>
Date:   Mon, 3 Oct 2022 15:40:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] thermal/drivers/exynos: Fix NULL pointer dereference when
 getting the critical temp
Content-Language: en-US
To:     Daniel Lezcano <daniel.lezcano@linaro.org>, rafael@kernel.org,
        m.szyprowski@samsung.com
Cc:     Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "open list:SAMSUNG THERMAL DRIVER" <linux-pm@vger.kernel.org>,
        "open list:SAMSUNG THERMAL DRIVER" 
        <linux-samsung-soc@vger.kernel.org>,
        "moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" 
        <linux-arm-kernel@lists.infradead.org>,
        open list <linux-kernel@vger.kernel.org>
References: <4e4d873b-4a40-334a-34e7-defb0fcc4e6b@samsung.com>
 <20221003132943.1383065-1-daniel.lezcano@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221003132943.1383065-1-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 03/10/2022 15:29, Daniel Lezcano wrote:
> The driver is assuming the get_critical temperature exists as it is
> inherited by the thermal of ops. But this one has been removed in
> favor of the generic one.
> 
> Use the generic thermal_zone_get_crit_temp() function instead
> 
> Fixes: 13bea86623b ("thermal/of: Remove of_thermal_get_crit_temp(")
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Looks good.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

