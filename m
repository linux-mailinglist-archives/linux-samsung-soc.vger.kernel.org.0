Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE101582C6
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 27 Jun 2019 14:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726375AbfF0MoN (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 27 Jun 2019 08:44:13 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:58909 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726059AbfF0MoM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 27 Jun 2019 08:44:12 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190627124410euoutp02ac278e5e8a657872bd18b459bdd332f8~sDs59ixnY0802408024euoutp02t
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Jun 2019 12:44:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190627124410euoutp02ac278e5e8a657872bd18b459bdd332f8~sDs59ixnY0802408024euoutp02t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1561639450;
        bh=O1reQMKhG3KKHzXiWYtk8GeswWiMB91vw1jxFDvy7Qs=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=TjHtWLvYFpoUSh/m8crEB7EAVebkrQpEt9CKurF7TrLw9/9SKQwh8gg7huyTJebBq
         jZ8ynrfg/X8Jn2vaJkL71+BkfVpPFBC+UGUO4i4/bNA8hBtWLq1zmplAaeTp1Hwnbz
         bflX+VboSIWtStu+OU3rhXj8Svlq7pXHSeaohwT8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190627124410eucas1p19c943f8b9cf8b906acb503d36b8f7870~sDs5dQeh91850418504eucas1p13;
        Thu, 27 Jun 2019 12:44:10 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 02.C1.04325.91AB41D5; Thu, 27
        Jun 2019 13:44:10 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190627124409eucas1p2b7e602bc00ec0720f6f5dcafbedd0ab0~sDs4sgvB02820328203eucas1p2O;
        Thu, 27 Jun 2019 12:44:09 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190627124409eusmtrp246cd75b920e85862733155e9a9b7e1df~sDs4efo1g2074420744eusmtrp2e;
        Thu, 27 Jun 2019 12:44:09 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-9f-5d14ba19bd0e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 04.81.04140.91AB41D5; Thu, 27
        Jun 2019 13:44:09 +0100 (BST)
Received: from [106.120.50.25] (unknown [106.120.50.25]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190627124408eusmtip1be2b7166ab8c60986e10f6464a511815~sDs4FKjji0189101891eusmtip1v;
        Thu, 27 Jun 2019 12:44:08 +0000 (GMT)
Subject: Re: [alsa-devel] [PATCH resend 25/47] ASoC: samsung: snow: don't
 select unnecessary Platform
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
Message-ID: <8ad6f826-4a83-4f2b-72d2-4bc7f363f141@samsung.com>
Date:   Thu, 27 Jun 2019 14:44:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <df7a5c52-177c-a15f-ac64-3af88d97b65f@samsung.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsWy7djPc7pSu0RiDW5aWly5eIjJYurDJ2wW
        589vYLd4dXgXo8WM8/uYLA6/aWd1YPPY8LmJzWPTqk42j29nJrJ49G1ZxejxeZNcAGsUl01K
        ak5mWWqRvl0CV8a+s9NZCp46VFzauIa1gXG+eRcjJ4eEgInE0qfP2LsYuTiEBFYwSvx7d5oN
        JCEk8IVR4s8SW4jEZ0aJY09PscF0TLzwlhUisZxR4kx7M5TzllGiofsyE0iVsEC6REfnRxYQ
        m03AUKLrbRcbSJGIwDQmiZUvHjKDJHgF7CTWr3rEDmKzCKhK9O84yApiiwrESDycf4cNokZQ
        4uTMJ2CDOAXsJTrvPwfrZRaQl2jeOhvKFpe49WQ+E8gCCYHJ7BJbfl1mgbjVReLPhuNMELaw
        xKvjW9ghbBmJ/zthGpoZJR6eW8sO4fQwSlxumsEIUWUtcfj4RaCTOIBWaEqs36UPEXaUeHd/
        LxtIWEKAT+LGW0GII/gkJm2bzgwR5pXoaBOCqFaTmHV8HdzagxcuMUPYHhJ3vs1mnMCoOAvJ
        m7OQvDYLyWuzEG5YwMiyilE8tbQ4Nz212DgvtVyvODG3uDQvXS85P3cTIzD1nP53/OsOxn1/
        kg4xCnAwKvHwKuwUiRViTSwrrsw9xCjBwawkwpsfBhTiTUmsrEotyo8vKs1JLT7EKM3BoiTO
        W83wIFpIID2xJDU7NbUgtQgmy8TBKdXAGP9CsiL8XsGCtmW/cx5PmZdWvv2C41yPreI9Dju/
        f937/o7VykVqc/+uWSE4n8XixWWfOHvWeXHyUZzTI6PmLneenhsu6iCZk9N04HvU/zvTZPw+
        3FCd9qb+leD2im7tx/1XMstcd829WLe9UE3dyTF6buuDH0Ga62SvftWXa0m/01vyROjEGiWW
        4oxEQy3mouJEAGgSHEc5AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRmVeSWpSXmKPExsVy+t/xu7qSu0RiDd5+4rK4cvEQk8XUh0/Y
        LM6f38Bu8erwLkaLGef3MVkcftPO6sDmseFzE5vHplWdbB7fzkxk8ejbsorR4/MmuQDWKD2b
        ovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2MfWensxQ8
        dai4tHENawPjfPMuRk4OCQETiYkX3rJ2MXJxCAksZZR4+mgCK0RCRuLktAYoW1jiz7UuNoii
        14wSx3d/YQNJCAukS3R0fmQBsdkEDCW63kIUiQjMYJKYfuUI1NgZrBLdl9+zg1TxCthJrF/1
        CMxmEVCV6N9xEGyFqECMRNfUnywQNYISJ2c+AbM5BewlOu8/ZwaxmQXMJOZtfghly0s0b50N
        ZYtL3Hoyn2kCo+AsJO2zkLTMQtIyC0nLAkaWVYwiqaXFuem5xUZ6xYm5xaV56XrJ+bmbGIFx
        te3Yzy07GLveBR9iFOBgVOLhVdgpEivEmlhWXJl7iFGCg1lJhDc/DCjEm5JYWZValB9fVJqT
        WnyI0RTouYnMUqLJ+cCYzyuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCeWJKanZpakFoE08fE
        wSnVwHg4el9f+tGvD82W6byyzYxf6fb14cxPzozVKy4Z93NPPqQZMiE75WaiW1qbhpm+7aEt
        7A+Z3rnUPeVTU1zS08CbqvzBdYJEg9ylawvfFBlYmUX4Lpqu8dHlgmCpgmbyd37loOmiWnnH
        mywfNj1/EXR34iHNtcu2Wtjaeb413+zOfKX06hn1ZUosxRmJhlrMRcWJAKbogKXBAgAA
X-CMS-MailID: 20190627124409eucas1p2b7e602bc00ec0720f6f5dcafbedd0ab0
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190624131905eucas1p2cf4335b4d1483b7e62d0c9e7b5223a3c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190624131905eucas1p2cf4335b4d1483b7e62d0c9e7b5223a3c
References: <877e9iwf9f.wl-kuninori.morimoto.gx@renesas.com>
        <874l4mv0h8.wl-kuninori.morimoto.gx@renesas.com>
        <CGME20190624131905eucas1p2cf4335b4d1483b7e62d0c9e7b5223a3c@eucas1p2.samsung.com>
        <9cfc8505-2903-033f-f68b-8ccc1c70132b@samsung.com>
        <87d0j232wg.wl-kuninori.morimoto.gx@renesas.com>
        <80c5c575-6f28-c6a6-91b2-d701bb9fbce8@samsung.com>
        <877e9a2hvn.wl-kuninori.morimoto.gx@renesas.com>
        <c4bb4599-e5d5-926b-75d5-d5c349ed8076@samsung.com>
        <87ef3hz0yn.wl-kuninori.morimoto.gx@renesas.com>
        <87a7e5ywqs.wl-kuninori.morimoto.gx@renesas.com>
        <7a96b050-4ad7-0a9f-41a1-adf27704bf61@samsung.com>
        <df7a5c52-177c-a15f-ac64-3af88d97b65f@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Kuninori,

On 2019-06-26 08:48, Marek Szyprowski wrote:
> Hi again,
>
> On 2019-06-26 08:41, Marek Szyprowski wrote:
>> Hi Kuninori,
>>
>> On 2019-06-26 03:15, Kuninori Morimoto wrote:
>>> Hi Marek, again
>>>
>>>> Thank you for your test.
>>>> And so sorry to bother you.
>>>> I will fixup this issue.
>>>>
>>>>>>>> I have no idea so far, but one capability is that if your system
>>>>>>>> used / based dummy platform, and if your CPU driver didn't 
>>>>>>>> use/have
>>>>>>>> snd_soc_set_runtime_hwparams() / snd_pcm_lib_ioctl,
>>>>>>>> it might be happen, but this patch seems not related to it...
>>>>>>> Reverting this patch fixes the issue, so it is definitely 
>>>>>>> related somehow.
>>>>>> Ahh... OK now I think I could understand your issue.
>>>>>> Your CPU is using devm_snd_dmaengine_pcm_register() with same *dev.
>>>>>> In such case, indeed this patch breaks sound card.
>>> I'm now negotiating to Mark to reverting issue patches.
>>> But, as alternative idea, I think below patch can solve this issue.
>>> Can you please test it ?
>>>
>>> ----------------------
>>> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
>>> index 358f1fb..79b9cc4 100644
>>> --- a/sound/soc/soc-core.c
>>> +++ b/sound/soc/soc-core.c
>>> @@ -931,9 +931,11 @@ static int soc_bind_dai_link(struct 
>>> snd_soc_card *card,
>>>       rtd->codec_dai = rtd->codec_dais[0];
>>>         /* Find PLATFORM from registered PLATFORMs */
>>> +    /* CPU driver might has both DAI and PLATFORM */
>>>       for_each_component(component) {
>>>           if (!snd_soc_is_matching_component(dai_link->platforms,
>>> -                           component))
>>> +                           component) &&
>>> +            !snd_soc_is_matching_component(dai_link->cpus, component))
>>>               continue;
>>>             snd_soc_rtdcom_add(rtd, component);
>>> ----------------------
>>
>> Yes, the above change fixes the issue on Samsung Snow, Peach-Pit and 
>> Peach-Pi Chromebooks, but causes regression on the other boards, for 
>> example here is the log from Odroid U3:
>>
>> max98090 1-0010: MAX98090 REVID=0x43
>> max98090 1-0010: use default 2.8v micbias
>> odroid-audio sound: snd-soc-dummy-dai <-> samsung-i2s mapping ok
>> odroid-audio sound: multicodec <-> snd-soc-dummy-dai mapping ok
>> ------------[ cut here ]------------
>> WARNING: CPU: 3 PID: 88 at fs/proc/generic.c:361 
>> proc_register+0xf8/0x12c
>> proc_dir_entry 'sub0/prealloc' already registered
>> Modules linked in:
>> CPU: 3 PID: 88 Comm: kworker/3:1 Not tainted 
>> 5.2.0-rc6-next-20190624-00004-g5611edb05c36-dirty #6233
>> Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
>> Workqueue: events deferred_probe_work_func
>> [<c0112548>] (unwind_backtrace) from [<c010e004>] (show_stack+0x10/0x14)
>> usb 1-3: new high-speed USB device number 3 using exynos-ehci
>> [<c010e004>] (show_stack) from [<c0aa63bc>] (dump_stack+0x98/0xc4)
>> [<c0aa63bc>] (dump_stack) from [<c01274d8>] (__warn+0x10c/0x124)
>> [<c01274d8>] (__warn) from [<c0127534>] (warn_slowpath_fmt+0x44/0x68)
>> [<c0127534>] (warn_slowpath_fmt) from [<c031f8b8>] 
>> (proc_register+0xf8/0x12c)
>> [<c031f8b8>] (proc_register) from [<c031fb88>] 
>> (proc_create_data+0x38/0x44)
>> [<c031fb88>] (proc_create_data) from [<c07a88a4>] 
>> (snd_info_register+0xe4/0x13c)
>> [<c07a88a4>] (snd_info_register) from [<c07a8804>] 
>> (snd_info_register+0x44/0x13c)
>> irq event stamp: 12923
>> hardirqs last  enabled at (12941): [<c01976a8>] 
>> console_unlock+0x4b8/0x6a8
>> hardirqs last disabled at (12958): [<c01972bc>] 
>> console_unlock+0xcc/0x6a8
>> softirqs last  enabled at (12956): [<c01026d8>] __do_softirq+0x4f0/0x5e0
>> softirqs last disabled at (12977): [<c012f6f8>] irq_exit+0x160/0x16c
>> ---[ end trace 9e0864d90e2e08ab ]---
>> odroid-audio sound: ASoC: failed to register soundcard -12
>> odroid-audio sound: snd_soc_register_card() failed: -12
>> odroid-audio: probe of sound failed with error -12
>>
>> here is the component list reported by your previous patch for that 
>> board:
>>
>> [    3.012781] -----3830000.i2s : samsung-i2s
>> [    3.015736] -----snd-soc-dummy : (null)
>> [    3.019588] -----3830000.i2s : snd_dmaengine_pcm
>> [    3.024122] -----snd-soc-dummy : (null)
>> [    3.027991] -----hdmi-audio-codec.0.auto : (null)
>> [    3.032620] -----max98090.1-0010 : (null)
>> [    3.078865] max98090 1-0010: MAX98090 REVID=0x43
>> [    3.085038] max98090 1-0010: use default 2.8v micbias
>> [    3.113438] odroid-audio sound: snd-soc-dummy-dai <-> samsung-i2s 
>> mapping ok
>> [    3.123849] odroid-audio sound: multicodec <-> snd-soc-dummy-dai 
>> mapping ok
>> [    3.263208] ALSA device list:
>> [    3.264234]   #0: Odroid-U3
>
>
> Just one more thing. Here is the component list with the above patch 
> applied:
>
> [    2.970127] -----3830000.i2s : samsung-i2s
> [    2.973029] -----snd-soc-dummy : (null)
> [    2.976851] -----hdmi-audio-codec.0.auto : (null)
> [    2.981476] -----3830000.i2s-sec : snd_dmaengine_pcm
> [    2.986459] -----3830000.i2s : snd_dmaengine_pcm
> [    2.991022] -----max98090.1-0010 : (null)
> [    2.995065] -----snd-soc-dummy : (null)
> [    2.998866] -----hdmi-audio-codec.0.auto : (null)
> [    3.003523] -----max98090.1-0010 : (null)
> [    3.047448] max98090 1-0010: MAX98090 REVID=0x43
> [    3.052177] max98090 1-0010: use default 2.8v micbias
> [    3.085090] odroid-audio sound: snd-soc-dummy-dai <-> samsung-i2s 
> mapping ok
> [    3.089691] odroid-audio sound: multicodec <-> snd-soc-dummy-dai 
> mapping ok
> [    3.099545] ------------[ cut here ]------------
> [    3.099799] WARNING: CPU: 2 PID: 33 at fs/proc/generic.c:361 
> proc_register+0xe4/0x118
> [    3.106497] proc_dir_entry 'sub0/prealloc' already registered
> [    3.112118] Modules linked in:
> [    3.115162] CPU: 2 PID: 33 Comm: kworker/2:1 Not tainted 
> 5.2.0-rc6-next-20190624-00004-g5611edb05c36-dirty #6238
> [    3.125310] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
> [    3.131399] Workqueue: events deferred_probe_work_func
> [    3.136533] [<c0112530>] (unwind_backtrace) from [<c010e070>] 
> (show_stack+0x10/0x14)
> [    3.144249] [<c010e070>] (show_stack) from [<c0aa2a2c>] 
> (dump_stack+0xa8/0xd4)
> [    3.151447] [<c0aa2a2c>] (dump_stack) from [<c01271f4>] 
> (__warn+0x10c/0x124)
> [    3.158472] [<c01271f4>] (__warn) from [<c0127250>] 
> (warn_slowpath_fmt+0x44/0x68)
> [    3.165937] [<c0127250>] (warn_slowpath_fmt) from [<c031cf5c>] 
> (proc_register+0xe4/0x118)
> [    3.174094] [<c031cf5c>] (proc_register) from [<c031d23c>] 
> (proc_create_data+0x38/0x4c)
> [    3.182095] [<c031d23c>] (proc_create_data) from [<c07a3bb0>] 
> (snd_info_register+0xe4/0x13c)
> [    3.190500] [<c07a3bb0>] (snd_info_register) from [<c07a3b10>] 
> (snd_info_register+0x44/0x13c)
> [    3.199072] irq event stamp: 12863
> [    3.202401] hardirqs last  enabled at (12871): [<c0196d60>] 
> console_unlock+0x464/0x6d0
> [    3.210328] hardirqs last disabled at (12888): [<c01969a4>] 
> console_unlock+0xa8/0x6d0
> [    3.218140] softirqs last  enabled at (12904): [<c01026fc>] 
> __do_softirq+0x4fc/0x5f8
> [    3.225834] softirqs last disabled at (12897): [<c012f52c>] 
> irq_exit+0x160/0x16c
> [    3.233242] ---[ end trace 09e9050a97457376 ]---
> [    3.237863] odroid-audio sound: ASoC: failed to register soundcard -12
> [    3.253458] odroid-audio sound: snd_soc_register_card() failed: -12
> [    3.254216] odroid-audio: probe of sound failed with error -12
>
I've noticed your "ASoC: soc-core: don't use soc_find_component() at 
snd_soc_find_dai()" patch, but sadly it doesn't fix any issue with the 
Samsung I2S and Snow ASoC driver. Do you want me to send revert to all 
the needed commits to restore audio on Samsung Chromebooks: Snow, Pit 
and Pi, Odroid XU and Samsung TM2 boards?

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

