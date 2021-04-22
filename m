Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8E1367EF3
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 22 Apr 2021 12:47:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235611AbhDVKrW (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 22 Apr 2021 06:47:22 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59778 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230270AbhDVKrW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 22 Apr 2021 06:47:22 -0400
Received: from mail-wr1-f72.google.com ([209.85.221.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lZWr8-000689-IY
        for linux-samsung-soc@vger.kernel.org; Thu, 22 Apr 2021 10:46:46 +0000
Received: by mail-wr1-f72.google.com with SMTP id 67-20020adf81490000b029010756d109e6so2104306wrm.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Apr 2021 03:46:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ChgsWVHouphJpIEvBcUP4TDV1Lb1Y7MqOzirYiGZuls=;
        b=G1jIFiHjUq8WXmvFwW8zggOz9uMEV5ayDrVbokg1tBu5xHVDZEncXRS8I6BvUw68gO
         XDdVVptk9pLzwVSTY6QbdpJBdPzj617JSfcFlrbVFUzjdygbSK0HgaARvrlCuGruhsu5
         X7uym9TklL62esvbQdQ23Um1fKenq2X1FRiFpDHXXjcOD0H3XmNquh5m56cqMZqgr09L
         J9NMOj7DNtC2Ma7mDhitVtrFFGVHqx0sXReWQLiXR0OdAd2RgXX3IsRDekl/rmZ2c9So
         iMg7V0Lu3NRQl/3PUNcbqDVV4mrOXOBgi5Bd5kDlg0YGy1aV6FS6ok5W9ULhKGgWWH2B
         PK1A==
X-Gm-Message-State: AOAM533YNdOjXZ9Rpt6MLf0gH7HPncU1QCKMhsZa2V3Hee453fTSxkQm
        QEXeWFZwBpUHIMv+UiiUOmTeS2uasiCf6lxyOJHOrnefyOeDXwtQju7LBHQ7rzXye10uHhKivo8
        Uk+4v5lklTqLN9iPQZPdKgA3ukHa6eqrku54jCkXxa6rYfFPt
X-Received: by 2002:a7b:c454:: with SMTP id l20mr14904430wmi.65.1619088406369;
        Thu, 22 Apr 2021 03:46:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwriIvSyixOuWHVrmtzdeZk8A0gu9EIEm+2/cX2GME4GssfKx9dIbuacbeZx9u7Rg6czj93yA==
X-Received: by 2002:a7b:c454:: with SMTP id l20mr14904416wmi.65.1619088406202;
        Thu, 22 Apr 2021 03:46:46 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id h17sm2936241wru.67.2021.04.22.03.46.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Apr 2021 03:46:44 -0700 (PDT)
Subject: Re: [PATCH v2] hwrng: exynos - Fix runtime PM imbalance on error
To:     =?UTF-8?Q?=c5=81ukasz_Stelmach?= <l.stelmach@samsung.com>,
        Matt Mackall <mpm@selenic.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     =?UTF-8?Q?Bart=c5=82omiej_=c5=bbolnierkiewicz?= 
        <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <CGME20210422104145eucas1p17f46c95b72f3568761a9f7911bf072e1@eucas1p1.samsung.com>
 <20210422104141.17668-1-l.stelmach@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <bc20ae4c-3e62-7b07-506c-ce8d90f65754@canonical.com>
Date:   Thu, 22 Apr 2021 12:46:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210422104141.17668-1-l.stelmach@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 22/04/2021 12:41, Łukasz Stelmach wrote:
> pm_runtime_get_sync() increments the runtime PM usage counter even
> the call returns an error code. Thus a pairing decrement is needed
> on the error handling path to keep the counter balanced.

It's exactly the same as Dinghao's patch:
https://lore.kernel.org/linux-samsung-soc/20200522011659.26727-1-dinghao.liu@zju.edu.cn/
which you reviewed. It has even the same commit msg
(although it's difficult to be creative here).

I think it's better to resend his patch instead.



Best regards,
Krzysztof
