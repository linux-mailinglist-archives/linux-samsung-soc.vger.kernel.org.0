Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27E921CF17E
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 12 May 2020 11:23:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbgELJXI (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 12 May 2020 05:23:08 -0400
Received: from foss.arm.com ([217.140.110.172]:50852 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725889AbgELJXH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 May 2020 05:23:07 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F221A1045;
        Tue, 12 May 2020 02:23:06 -0700 (PDT)
Received: from [10.37.12.83] (unknown [10.37.12.83])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65BAC3F305;
        Tue, 12 May 2020 02:23:05 -0700 (PDT)
Subject: Re: [PATCH] memory/samsung: reduce unnecessary mutex lock area
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Bernard Zhao <bernard@vivo.com>, Kukjin Kim <kgene@kernel.org>,
        linux-pm@vger.kernel.org,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        opensource.kernel@vivo.com
References: <20200508131338.32956-1-bernard@vivo.com>
 <20200512065023.GA10741@kozik-lap>
 <e762ce12-eff0-d3a5-f083-2b592921de59@arm.com>
 <CAJKOXPekrkyDf2TMCnX7Nvbdaj-JQwuyqrsurFM4moALqVx8Sw@mail.gmail.com>
From:   Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <fd463b97-6db7-f7ba-c4bd-5c709a4898c0@arm.com>
Date:   Tue, 12 May 2020 10:23:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAJKOXPekrkyDf2TMCnX7Nvbdaj-JQwuyqrsurFM4moALqVx8Sw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



On 5/12/20 10:05 AM, Krzysztof Kozlowski wrote:
> On Tue, 12 May 2020 at 10:47, Lukasz Luba <lukasz.luba@arm.com> wrote:
>>
>> Hi Krzysztof,
>>
>> I am sorry, I was a bit busy recently.
>>
>> On 5/12/20 7:50 AM, Krzysztof Kozlowski wrote:
>>> On Fri, May 08, 2020 at 06:13:38AM -0700, Bernard Zhao wrote:
>>>> Maybe dmc->df->lock is unnecessary to protect function
>>>> exynos5_dmc_perf_events_check(dmc). If we have to protect,
>>>> dmc->lock is more better and more effective.
>>>> Also, it seems not needed to protect "if (ret) & dev_warn"
>>>> branch.
>>>>
>>>> Signed-off-by: Bernard Zhao <bernard@vivo.com>
>>>> ---
>>>>    drivers/memory/samsung/exynos5422-dmc.c | 6 ++----
>>>>    1 file changed, 2 insertions(+), 4 deletions(-)
>>>
>>> I checked the concurrent accesses and it looks correct.
>>>
>>> Lukasz, any review from your side?
>>
>> The lock from devfreq lock protects from a scenario when
>> concurrent access from devfreq framework uses internal dmc fields 'load'
>> and 'total' (which are set to 'busy_time', 'total_time').
>> The .get_dev_status can be called at any time (even due to thermal
>> devfreq cooling action) and reads above fields.
>> That's why the calculation of the new values inside dmc is protected.
> 
> I looked at this path (get_dev_status) and currently in devfreq it
> will be only called from update_devfreq() -> get_target_freq()... at
> least when looking at devfreq core and governors. On the other hand
> you are right that this is public function and this call scenario
> might change. It could be called directly from other paths sooner or
> later.

Indeed, I am currently changing this while I am adding devfreq devices
to the Energy Model.

> 
>> This patch should not be taken IMO. Maybe we can release lock before the
>> if statement, just to speed-up.
> 
> Yep.
> 
> Bernard, you can send just this part of the patch.

Thank you Bernard and please submit the patch v2.

> 
> Best regards,
> Krzysztof
> 

Thank you Krzysztof for your time spent on this.


Regards,
Lukasz
