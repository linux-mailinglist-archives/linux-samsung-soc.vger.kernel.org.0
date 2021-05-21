Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34EE738C59B
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 21 May 2021 13:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbhEULZc (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 21 May 2021 07:25:32 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41937 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbhEULZc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 May 2021 07:25:32 -0400
Received: from mail-vk1-f198.google.com ([209.85.221.198])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lk3GC-0004Yg-Nb
        for linux-samsung-soc@vger.kernel.org; Fri, 21 May 2021 11:24:08 +0000
Received: by mail-vk1-f198.google.com with SMTP id g134-20020a1f9d8c0000b02901e488c819edso2757940vke.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 May 2021 04:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x9QeAuKPtkUv6ZpvmdpqQaHgtAYj6ktz1zWOx4dEWL0=;
        b=bUGPq+KWyys44vO696CDD6Xyy+9anSjl4L3S7EwApo0CuH8p+H9DgBLzRpI/ECEw18
         fJH5xvHpo1ia8dPAmwmdTHFIz2kh6L7vPdqk7ZytI44Z6zx50YCHJlahGVqkYFfr01Ww
         OSZWNsMJtwJa5Ix+iY/Jbwfxfpvb9C7XoE9L7sjP1L3E74UEL/FxpSk5QtoZc7OiWTo/
         pX6PhP+MEYIexmP/Wu48r6wKDTyTevpctLfSlV2JROLrOVn4qiOMG3B7h2l/OOYao9GY
         RaJm2Ywe+2FpEk9xvEQvikzO6mlpwfpz49VkUbSV3sFexAoS4O8tGo6wvpWN45sKzQfM
         I4vg==
X-Gm-Message-State: AOAM533cdlzMFnvMbRCc753P3I4PbKbYYnH9M2+2+HWXyb4fxRAxHV9i
        GNLDFIhI4YYY1cDssnOxOWjo/hMm3KN8V6+UVZ+VUvQcXLrUpONqqj5clnHt6M/kuYPni2Nw4++
        Oj+Mhzm9B7ERG26AfZJmEu+Sl8RxBQHTfTvGGzwUM/0hCVFrk
X-Received: by 2002:a67:f702:: with SMTP id m2mr10248177vso.40.1621596247800;
        Fri, 21 May 2021 04:24:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMIaL2fbD4ztzQzkhA3Qt2SO7PIKsWJ2O3/gGpl22g79xSoPiJVsXsKVtbzeY9cq+6RwC+Bw==
X-Received: by 2002:a67:f702:: with SMTP id m2mr10248173vso.40.1621596247673;
        Fri, 21 May 2021 04:24:07 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.2])
        by smtp.gmail.com with ESMTPSA id t18sm896471vke.3.2021.05.21.04.24.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 May 2021 04:24:07 -0700 (PDT)
Subject: Re: [PATCH] hwrng: exynos: Use pm_runtime_resume_and_get() to replace
 open coding
To:     Tian Tao <tiantao6@hisilicon.com>, l.stelmach@samsung.com
Cc:     linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org
References: <1621569489-20554-1-git-send-email-tiantao6@hisilicon.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <d871c39a-2592-d50d-9a8d-69dc54b3fd55@canonical.com>
Date:   Fri, 21 May 2021 07:24:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1621569489-20554-1-git-send-email-tiantao6@hisilicon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/05/2021 23:58, Tian Tao wrote:
> use pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
> pm_runtime_put_noidle. this change is just to simplify the code, no
> actual functional changes.
> 
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/char/hw_random/exynos-trng.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/char/hw_random/exynos-trng.c b/drivers/char/hw_random/exynos-trng.c
> index 8e1fe3f..d71ef3c 100644
> --- a/drivers/char/hw_random/exynos-trng.c
> +++ b/drivers/char/hw_random/exynos-trng.c
> @@ -196,10 +196,9 @@ static int __maybe_unused exynos_trng_resume(struct device *dev)
>  {
>  	int ret;
>  
> -	ret = pm_runtime_get_sync(dev);
> -	if (ret < 0) {
> +	ret = pm_runtime_resume_and_get(dev);
> +	if (ret) {
>  		dev_err(dev, "Could not get runtime PM.\n");
> -		pm_runtime_put_noidle(dev);
>  		return ret;

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
