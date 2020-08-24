Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0430124F3BD
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 24 Aug 2020 10:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726156AbgHXIPr (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 24 Aug 2020 04:15:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbgHXIPp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Aug 2020 04:15:45 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32015C061574
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Aug 2020 01:15:45 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id w13so7396088wrk.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Aug 2020 01:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9KMkA8yvIpAkuthwUciKtNLTQaMLm28WusWl2eSmPxc=;
        b=lbkuaxy4SfGifY7bs7inj1xF86RbdoB2rQTHTQS4RJqeTn4hzmYOw4ByaC08yA13Mx
         NAGmlNFkpQWJ3r3Rw/qvYkmgowcgxaQrsd3HyWx248qP7lZLGJPCoaosJ3EluaqmFM1/
         0UN2Nf5xWm5fgbCbuziQAJrfNLzLwdZFyuBesZNOPa+6PydvjmbNyeNW96YvAKUyjvrw
         bas5FZqtjuIHL40bBLsxXokUC4+9a4kllf37eaD5NC4TQl07leevc4hglwOjJmwN4Ww5
         QV7a9SVOa5KRXdhqsuPDmYlTm6Ck3fEU40r6hPILHk+LyeTgduFAdUjam+WgtKwIqiRe
         vuSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9KMkA8yvIpAkuthwUciKtNLTQaMLm28WusWl2eSmPxc=;
        b=DJFiEO6Ac9bSsGBly+Q0BpYGzNvfHdT1rDeek0Yl83iD2vdnfd+DWwaO7LEsvuNM++
         bDo5I/2TsmBi8j+xwIwC4GnU+w0hr0PqU5yugXPrdBJfRmSZ3L9uiyU4MhYIuPn7eWMA
         oklJSVzQYTVAopdf0p3GKJbZPz2hTLv9jDTnQxLwvjrTqYIhYXe7CTATKe/8kcDUpEnm
         6u1E4GttqX2xggGNKFIbCNmySQHr5CKaw41SkTlTcIgdoU6LnzHpT4WuBjfBXHHdaAcW
         6Dy0wlO47KJv9Dw3JYv+3PoAste7emJ90HDGDfq7xvnOV4CHaeKYhqIf1/6fmHM1MzdS
         gAew==
X-Gm-Message-State: AOAM530J6wPXsUZx6AYkG9I3olA+Fa14+FisCPXW5+zZOrXGGslaUbKn
        jclJ+R23VoapJA54+CUoQqWkng==
X-Google-Smtp-Source: ABdhPJzO/bOvzY8TtLyRUoMhjGCl+PFbqko8YuE5fb1RBhRzcLHa24JWDQlsnOtkyhVv6iKIr87VHA==
X-Received: by 2002:adf:f011:: with SMTP id j17mr4551494wro.335.1598256943562;
        Mon, 24 Aug 2020 01:15:43 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:cd42:2fa4:120f:76b0? ([2a01:e34:ed2f:f020:cd42:2fa4:120f:76b0])
        by smtp.googlemail.com with ESMTPSA id t25sm21375013wmj.18.2020.08.24.01.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2020 01:15:43 -0700 (PDT)
Subject: Re: [PATCH 2/4] cpuidle: big.LITTLE: enable driver only on
 Peach-Pit/Pi Chromebooks
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Lukasz Luba <lukasz.luba@arm.com>
References: <20200616081230.31198-1-m.szyprowski@samsung.com>
 <CGME20200616081249eucas1p2ad165b545f265bec88a06270d55fce76@eucas1p2.samsung.com>
 <20200616081230.31198-3-m.szyprowski@samsung.com>
 <db3315ef-1ca8-14b5-486a-9cc5a02150a8@samsung.com>
 <20200817153908.GA13144@kozik-lap>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <f46e7041-f75e-8d97-e967-2ac458aaaf2e@linaro.org>
Date:   Mon, 24 Aug 2020 10:15:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817153908.GA13144@kozik-lap>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 17/08/2020 17:39, Krzysztof Kozlowski wrote:
> On Wed, Jun 24, 2020 at 12:05:46PM +0200, Bartlomiej Zolnierkiewicz wrote:
>>
>> On 6/16/20 10:12 AM, Marek Szyprowski wrote:
>>> This driver always worked properly only on the Exynos 5420/5800 based
>>> Chromebooks (Peach-Pit/Pi), so change the required compatible string to
>>> the 'google,peach', to avoid enabling it on the other Exynos 542x/5800
>>> boards, which hangs in such case. The main difference between Peach-Pit/Pi
>>> and other Exynos 542x/5800 boards is the firmware - Peach platform doesn't
>>> use secure firmware at all.
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>
>> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> 
> This patch waited on list for almost two months and was not picked up.
> Therefore I'll take it for v5.10.

It happens some patches can fall into the cracks, especially when we are
fully busy with a peak of work. Also, we have filters in our mailers
which are not perfect. A gentle ping is enough to ask to pay attention
to the series.

I can understand that is annoying, but preemptively pick the patch is
not adequate.


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
