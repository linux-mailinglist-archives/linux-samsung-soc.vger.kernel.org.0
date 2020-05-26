Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4333219C0E6
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  2 Apr 2020 14:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387958AbgDBMN3 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 2 Apr 2020 08:13:29 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:42322 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387722AbgDBMN3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Apr 2020 08:13:29 -0400
Received: from [IPv6:2a00:5f00:102:0:1862:4eff:fe91:4534] (unknown [IPv6:2a00:5f00:102:0:1862:4eff:fe91:4534])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: gtucker)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 4FC87297C2F;
        Thu,  2 Apr 2020 13:13:27 +0100 (BST)
Subject: Re: [PATCH] ARM: exynos: update l2c_aux_mask to fix alert message
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@collabora.com
References: <b29f34870380093e6268c11d3033033d6def61b7.1585756648.git.guillaume.tucker@collabora.com>
 <20200401163101.GV25745@shell.armlinux.org.uk>
From:   Guillaume Tucker <guillaume.tucker@collabora.com>
Message-ID: <35c7cf4b-e6b8-43aa-d934-4a1c2e738372@collabora.com>
Date:   Thu, 2 Apr 2020 13:13:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200401163101.GV25745@shell.armlinux.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 01/04/2020 17:31, Russell King - ARM Linux admin wrote:
> On Wed, Apr 01, 2020 at 05:08:03PM +0100, Guillaume Tucker wrote:
>> Allow setting the number of cycles for RAM reads in the pl310 cache
>> controller L2 auxiliary control register mask (bits 0-2) since it
>> needs to be changed in software.  This only affects exynos4210 and
>> exynos4412 as they use the pl310 cache controller.
>>
>> With the mask used until now, the following warnings were generated,
>> the 2nd one being a pr_alert():
>>
>>   L2C: platform modifies aux control register: 0x02070000 -> 0x3e470001
>>   L2C: platform provided aux values permit register corruption.
>>
>> This latency cycles value has always been set in software in spite of
>> the warnings.  Keep it this way but clear the alert message about
>> register corruption to acknowledge it is a valid thing to do.
> 
> This is telling you that you are doing something you should not be
> doing.  The L2C controller should be configured by board firmware
> first and foremost, because if, for example, u-boot makes use of the
> L2 cache, or any other pre-main kernel code (in other words,
> decompressor) the setup of the L2 controller will be wrong.
> 
> So, NAK.

OK thanks, I guess I misinterpreted the meaning of the error
message.  It's really saying that the register value was not the
right one before the kernel tried to change it.  Next step for me
is to look into U-Boot.

Guillaume

>> Tested on exynos4412-odroid-x2.
>>
>> Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
>> Reported-by: "kernelci.org bot" <bot@kernelci.org>
>> ---
>>  arch/arm/mach-exynos/exynos.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
>> index 7a8d1555db40..ed1bba49210d 100644
>> --- a/arch/arm/mach-exynos/exynos.c
>> +++ b/arch/arm/mach-exynos/exynos.c
>> @@ -194,7 +194,7 @@ static void __init exynos_dt_fixup(void)
>>  
>>  DT_MACHINE_START(EXYNOS_DT, "Samsung Exynos (Flattened Device Tree)")
>>  	.l2c_aux_val	= 0x3c400001,
>> -	.l2c_aux_mask	= 0xc20fffff,
>> +	.l2c_aux_mask	= 0xc20ffff8,
>>  	.smp		= smp_ops(exynos_smp_ops),
>>  	.map_io		= exynos_init_io,
>>  	.init_early	= exynos_firmware_init,
>> -- 
>> 2.20.1
>>
>>
> 

