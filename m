Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA75317DB4A
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  9 Mar 2020 09:41:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgCIIlG (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 9 Mar 2020 04:41:06 -0400
Received: from foss.arm.com ([217.140.110.172]:49128 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726450AbgCIIlG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Mar 2020 04:41:06 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BEA11FB;
        Mon,  9 Mar 2020 01:41:05 -0700 (PDT)
Received: from [10.37.12.74] (unknown [10.37.12.74])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 454DD3F6CF;
        Mon,  9 Mar 2020 01:41:02 -0700 (PDT)
Subject: Re: [PATCH] drm/exynos: Fix memory leak and release IOMMU mapping
 structures
To:     Inki Dae <inki.dae@samsung.com>, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     jy0922.shim@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, airlied@linux.ie, daniel@ffwll.ch,
        kgene@kernel.org, krzk@kernel.org, b.zolnierkie@samsung.com,
        a.hajda@samsung.com, Dietmar.Eggemann@arm.com
References: <CGME20200304220104epcas1p2d65f8ab31df6aa5373787b695b14f8ff@epcas1p2.samsung.com>
 <20200304220022.8003-1-lukasz.luba@arm.com>
 <c69c1163-a75b-6667-1979-f3aa356dc0b4@samsung.com>
From:   Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <7962c9f2-e85d-9f9b-f442-c4a5b387ca44@arm.com>
Date:   Mon, 9 Mar 2020 08:41:00 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <c69c1163-a75b-6667-1979-f3aa356dc0b4@samsung.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Inki,

On 3/9/20 12:45 AM, Inki Dae wrote:
> Hi Lukasz,
> 
> 20. 3. 5. 오전 7:00에 Lukasz Luba 이(가) 쓴 글:
>> There is a memory leak which left some objects not freed. The reference
>> counter of mapping: 'mapping->kref' was 2 when calling
>> arm_iommu_detach_device(), so the release_iommu_mapping() won't be called.
>> Since the old mapping structure is not going to be used any more (because
>> it is detached and new one attached), call arm_iommu_release_mapping()
>> to trigger cleanup.
>>
>> Found using kmemleak detector, the output:
>>

[snip]

>>
>> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
>> ---
>>
>> Hi all,
>>
>> I have discovered this issue on OdroidXU4 while running some stress tests
>> for upcoming Energy Model. To reproduce it, kernel must be compiled with
>> DEBUG_KMEMLEAK. When the boot has finished, type:
>> # echo scan > /sys/kernel/debug/kmemleak
>> # cat /sys/kernel/debug/kmemleak
>> You should expect similar output to the one from the commit message.
>>
>> I don't know if it should go via stable tree as well. I can resend with CC
>> stable, if there is a need.
> 
> Thanks for fixup. BTW, as you commented on Marek's patch thread, with Marek's patch the memory leak will be solved.
> Do you want Marek to rework his patch on top of your patch or are you ok me to pick up only Marek's one?

Please drop this one and apply only Marek's patch, it fixes the issue.
I didn't know that he was working on similar stuff.

> 
> Marek's patch is conflicted with your one.
> 
> Thanks,
> Inki Dae

Regards,
Lukasz
