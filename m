Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B8DA0DA31C
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 17 Oct 2019 03:27:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731017AbfJQB1Y (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 16 Oct 2019 21:27:24 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4194 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727916AbfJQB1Y (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 21:27:24 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 735A76153B773426C5B9;
        Thu, 17 Oct 2019 09:27:20 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Thu, 17 Oct 2019
 09:27:17 +0800
Subject: Re: [PATCH -next 00/13] hwrng: use devm_platform_ioremap_resource()
 to simplify code
To:     Florian Fainelli <f.fainelli@gmail.com>,
        <herbert@gondor.apana.org.au>, <mpm@selenic.com>, <arnd@arndb.de>,
        <gregkh@linuxfoundation.org>, <nicolas.ferre@microchip.com>,
        <alexandre.belloni@bootlin.com>, <ludovic.desroches@microchip.com>,
        <rjui@broadcom.com>, <sbranden@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>, <eric@anholt.net>,
        <wahrenst@gmx.net>, <l.stelmach@samsung.com>, <kgene@kernel.org>,
        <krzk@kernel.org>, <khilman@baylibre.com>, <dsaxena@plexity.net>,
        <patrice.chotard@st.com>
References: <20191016104621.26056-1-yuehaibing@huawei.com>
 <2c60b926-1e98-cca0-ec17-6b45f9da404a@gmail.com>
CC:     <linux-crypto@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-rpi-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-amlogic@lists.infradead.org>,
        <linuxppc-dev@lists.ozlabs.org>
From:   Yuehaibing <yuehaibing@huawei.com>
Message-ID: <7c0269b6-cab3-bded-7f9d-76430be89f9c@huawei.com>
Date:   Thu, 17 Oct 2019 09:27:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <2c60b926-1e98-cca0-ec17-6b45f9da404a@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



On 2019/10/17 0:44, Florian Fainelli wrote:
> On 10/16/19 3:46 AM, YueHaibing wrote:
>> devm_platform_ioremap_resource() internally have platform_get_resource()
>> and devm_ioremap_resource() in it. So instead of calling them separately
>> use devm_platform_ioremap_resource() directly.
> 
> Did your coccinelle script not cover
> drivers/char/hw_random/iproc-rng200.c somehow? Do you mind including it
> as a separate patch?

A patch from Markus Elfring has be queued:

commit a68b931932c5574aa5bd459529c766ba577c72b3
Author: Markus Elfring <elfring@users.sourceforge.net>
Date:   Wed Sep 18 09:09:22 2019 +0200

    hwrng: iproc-rng200 - Use devm_platform_ioremap_resource() in iproc_rng200_probe()

    Simplify this function implementation by using a known wrapper function.

    This issue was detected by using the Coccinelle software.

    Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
    Reviewed-by: Ray Jui <ray.jui@broadcom.com>
    Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
    Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>




> Thanks
> 
>>
>> YueHaibing (13):
>>   hwrng: atmel - use devm_platform_ioremap_resource() to simplify code
>>   hwrng: bcm2835 - use devm_platform_ioremap_resource() to simplify code
>>   hwrng: exynos - use devm_platform_ioremap_resource() to simplify code
>>   hwrng: hisi - use devm_platform_ioremap_resource() to simplify code
>>   hwrng: ks-sa - use devm_platform_ioremap_resource() to simplify code
>>   hwrng: meson - use devm_platform_ioremap_resource() to simplify code
>>   hwrng: npcm - use devm_platform_ioremap_resource() to simplify code
>>   hwrng: omap - use devm_platform_ioremap_resource() to simplify code
>>   hwrng: pasemi - use devm_platform_ioremap_resource() to simplify code
>>   hwrng: pic32 - use devm_platform_ioremap_resource() to simplify code
>>   hwrng: st - use devm_platform_ioremap_resource() to simplify code
>>   hwrng: tx4939 - use devm_platform_ioremap_resource() to simplify code
>>   hwrng: xgene - use devm_platform_ioremap_resource() to simplify code
>>
>>  drivers/char/hw_random/atmel-rng.c   | 4 +---
>>  drivers/char/hw_random/bcm2835-rng.c | 5 +----
>>  drivers/char/hw_random/exynos-trng.c | 4 +---
>>  drivers/char/hw_random/hisi-rng.c    | 4 +---
>>  drivers/char/hw_random/ks-sa-rng.c   | 4 +---
>>  drivers/char/hw_random/meson-rng.c   | 4 +---
>>  drivers/char/hw_random/npcm-rng.c    | 4 +---
>>  drivers/char/hw_random/omap-rng.c    | 4 +---
>>  drivers/char/hw_random/pasemi-rng.c  | 4 +---
>>  drivers/char/hw_random/pic32-rng.c   | 4 +---
>>  drivers/char/hw_random/st-rng.c      | 4 +---
>>  drivers/char/hw_random/tx4939-rng.c  | 4 +---
>>  drivers/char/hw_random/xgene-rng.c   | 4 +---
>>  13 files changed, 13 insertions(+), 40 deletions(-)
>>
> 
> 

