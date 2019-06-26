Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6E0F56291
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 26 Jun 2019 08:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726077AbfFZGsN (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 26 Jun 2019 02:48:13 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:39472 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725790AbfFZGsN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Jun 2019 02:48:13 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190626064811euoutp02a232651210b506db31d8d9163435b5db~rrMy7Bsxu2900429004euoutp02e
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jun 2019 06:48:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190626064811euoutp02a232651210b506db31d8d9163435b5db~rrMy7Bsxu2900429004euoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1561531691;
        bh=LPOcOykhYosWB2v7ziUcfTIz30/dSMkRVEzkN27IgKQ=;
        h=Subject:From:To:Date:In-Reply-To:References:From;
        b=WvXkyo1RtDLy56AXZHxZLzrO8oGy+GAo/oyrCOjZ1TqCbTj3xaTJeMjbziVw0S915
         g/p7jsQHJZYcsCiImQYSURlG1uJmmbqm2SXlmkT/xZ0fAs7FBRvSjRGAKvkOOuM9/d
         Rfm/+GjKnTGP9W6+axFQzbb99GzBLRLFFHvjQKQY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190626064810eucas1p11d9d455b2ee0c3fb08a49a7df07cd6e4~rrMyVaMI_2840828408eucas1p1G;
        Wed, 26 Jun 2019 06:48:10 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id E4.7F.04325.A25131D5; Wed, 26
        Jun 2019 07:48:10 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190626064809eucas1p1ab0c5d6fd670317e231d0a4175f7b62a~rrMxsGK6E3242632426eucas1p1s;
        Wed, 26 Jun 2019 06:48:09 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190626064809eusmtrp18503e1ca81039fcf3391a3c2b8fb4a45~rrMxeBOnd1992219922eusmtrp1c;
        Wed, 26 Jun 2019 06:48:09 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-e7-5d13152af25b
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 99.DA.04146.925131D5; Wed, 26
        Jun 2019 07:48:09 +0100 (BST)
Received: from [106.120.50.25] (unknown [106.120.50.25]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190626064809eusmtip22acfd856ad458719699253044ea23268~rrMxFGRpG0631406314eusmtip2V;
        Wed, 26 Jun 2019 06:48:09 +0000 (GMT)
Subject: Re: [alsa-devel] [PATCH resend 25/47] ASoC: samsung: snow: don't
 select unnecessary Platform
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
Message-ID: <df7a5c52-177c-a15f-ac64-3af88d97b65f@samsung.com>
Date:   Wed, 26 Jun 2019 08:48:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <7a96b050-4ad7-0a9f-41a1-adf27704bf61@samsung.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SfUhTcRTtt/f29rZcPKfixSJpZaCUHyg1sCwh4kEQkX+Zis58zZWbsuc0
        i2LMSF0iOUlthl+Qy9HSZIqYaU5QS9n8gkpNHfiHmCtjKUQmuT0t/zv33nPvOQcuiUnM/BBS
        qc5nNGp5jpQQ4V1DvxwnI4IC0qJLXGLZ9ISdJ3viWiJkTme7QLYy2INktc4+nmxwtYR/nqDb
        PXqC7rCUEfTGWCVOV9gsiPZ0HL7CvyY6k8XkKAsYTVRChih7ur8Fz/saf/vleDmuQ7ZYAxKS
        QMXBs9lNvgGJSAn1AsHIVttO8ROB3riGuMKDoP93E7a70vSlH/diCWVG8M6ZwJHcCAzVM8g7
        CKAUUFr2w0ciqBgwuA2ElxRIVfOgddnluySmEkD/0asnJHEqDCyNJh8OolLB1TBHcBx/eP90
        yXdISJ0Dh6tZ4MUYFQrFnXUYh4NhZqmB5xUAqkYAtirzjtULYO3t5nM4AFaGbQIOH4LRqnKc
        WyhG4HJYBVxRjmBKX4s4VjwMDk9sb5PbEuHQ1hPFtRPh28JbwtsG6gB8cvtzJg6AsasG49pi
        KH0o4djHwTT86p/swPjkjjUa5jbq0GN0xLQnpmlPNNOeaKb/HhoRbkHBjJZVKRg2Vs0URrJy
        FatVKyKv56o60Pb7jG4Nr3ejvs1MO6JIJPUT60IlaRK+vIAtUtkRkJg0UPxcTqVJxFnyojuM
        Jjddo81hWDs6SOLSYPHdfYspEkohz2duMUweo9md8khhiA6liBS2D9FxlRtziX/ysHrHqcLR
        tkvB3UeX078Lsc7Km/v9GPPIZP24susNfXEo6ezybM/UegZph7iK0Bvzrxd19s/J99jmscvF
        zUrLmruqLLk6OfWqUdNyOrPbuppNJw7MuxZOGI95Nu/nW+PCtUlbcw/CeLLeJq1T1RLyqFWK
        s9nymAhMw8r/ApibCNs6AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRmVeSWpSXmKPExsVy+t/xe7qaosKxBsvWyltcuXiIyWLqwyds
        FufPb2C3eHV4F6PFjPP7mCwOv2lndWDz2PC5ic1j06pONo9vZyayePRtWcXo8XmTXABrlJ5N
        UX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllqkb5dgl7Glf3LWApe
        W1esudDD0sC4xbiLkZNDQsBEYuHd/SxdjFwcQgJLGSWOLNjGApGQkTg5rYEVwhaW+HOtiw2i
        6DWjxLv2OcwgCWGBdImOzo9gDWwChhJdbyGKRARmMElMv3KEFaLjMYvEjefPwap4Bewkmq6v
        BxvLIqAqsWrBLDBbVCBGomvqT6gaQYmTM5+A2ZwC9hLnHi5iB7GZBcwk5m1+yAxhy0s0b50N
        ZYtL3Hoyn2kCo+AsJO2zkLTMQtIyC0nLAkaWVYwiqaXFuem5xYZ6xYm5xaV56XrJ+bmbGIFx
        te3Yz807GC9tDD7EKMDBqMTD2yAvFCvEmlhWXJl7iFGCg1lJhHdpokCsEG9KYmVValF+fFFp
        TmrxIUZToOcmMkuJJucDYz6vJN7Q1NDcwtLQ3Njc2MxCSZy3Q+BgjJBAemJJanZqakFqEUwf
        EwenVANj8GPuN4vP3uyc1mlvbHVm4f7fpZK79zvdWnpEp7bls6+Yl4x3bsT+9beLb5QJ3A2f
        p9W7Iq6N9/SKNcm2E5p65Do99l4s7JtjuTBG4/e8zksc+gYSP9+vfni74FDpBOYT3nM2GNq6
        np385ouAYaibc/x52aboxH5Zvvpvrplm2S3eWczf9xUosRRnJBpqMRcVJwIAQRky7MECAAA=
X-CMS-MailID: 20190626064809eucas1p1ab0c5d6fd670317e231d0a4175f7b62a
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
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi again,

On 2019-06-26 08:41, Marek Szyprowski wrote:
> Hi Kuninori,
>
> On 2019-06-26 03:15, Kuninori Morimoto wrote:
>> Hi Marek, again
>>
>>> Thank you for your test.
>>> And so sorry to bother you.
>>> I will fixup this issue.
>>>
>>>>>>> I have no idea so far, but one capability is that if your system
>>>>>>> used / based dummy platform, and if your CPU driver didn't use/have
>>>>>>> snd_soc_set_runtime_hwparams() / snd_pcm_lib_ioctl,
>>>>>>> it might be happen, but this patch seems not related to it...
>>>>>> Reverting this patch fixes the issue, so it is definitely related 
>>>>>> somehow.
>>>>> Ahh... OK now I think I could understand your issue.
>>>>> Your CPU is using devm_snd_dmaengine_pcm_register() with same *dev.
>>>>> In such case, indeed this patch breaks sound card.
>> I'm now negotiating to Mark to reverting issue patches.
>> But, as alternative idea, I think below patch can solve this issue.
>> Can you please test it ?
>>
>> ----------------------
>> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
>> index 358f1fb..79b9cc4 100644
>> --- a/sound/soc/soc-core.c
>> +++ b/sound/soc/soc-core.c
>> @@ -931,9 +931,11 @@ static int soc_bind_dai_link(struct snd_soc_card 
>> *card,
>>       rtd->codec_dai = rtd->codec_dais[0];
>>         /* Find PLATFORM from registered PLATFORMs */
>> +    /* CPU driver might has both DAI and PLATFORM */
>>       for_each_component(component) {
>>           if (!snd_soc_is_matching_component(dai_link->platforms,
>> -                           component))
>> +                           component) &&
>> +            !snd_soc_is_matching_component(dai_link->cpus, component))
>>               continue;
>>             snd_soc_rtdcom_add(rtd, component);
>> ----------------------
>
> Yes, the above change fixes the issue on Samsung Snow, Peach-Pit and 
> Peach-Pi Chromebooks, but causes regression on the other boards, for 
> example here is the log from Odroid U3:
>
> max98090 1-0010: MAX98090 REVID=0x43
> max98090 1-0010: use default 2.8v micbias
> odroid-audio sound: snd-soc-dummy-dai <-> samsung-i2s mapping ok
> odroid-audio sound: multicodec <-> snd-soc-dummy-dai mapping ok
> ------------[ cut here ]------------
> WARNING: CPU: 3 PID: 88 at fs/proc/generic.c:361 proc_register+0xf8/0x12c
> proc_dir_entry 'sub0/prealloc' already registered
> Modules linked in:
> CPU: 3 PID: 88 Comm: kworker/3:1 Not tainted 
> 5.2.0-rc6-next-20190624-00004-g5611edb05c36-dirty #6233
> Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
> Workqueue: events deferred_probe_work_func
> [<c0112548>] (unwind_backtrace) from [<c010e004>] (show_stack+0x10/0x14)
> usb 1-3: new high-speed USB device number 3 using exynos-ehci
> [<c010e004>] (show_stack) from [<c0aa63bc>] (dump_stack+0x98/0xc4)
> [<c0aa63bc>] (dump_stack) from [<c01274d8>] (__warn+0x10c/0x124)
> [<c01274d8>] (__warn) from [<c0127534>] (warn_slowpath_fmt+0x44/0x68)
> [<c0127534>] (warn_slowpath_fmt) from [<c031f8b8>] 
> (proc_register+0xf8/0x12c)
> [<c031f8b8>] (proc_register) from [<c031fb88>] 
> (proc_create_data+0x38/0x44)
> [<c031fb88>] (proc_create_data) from [<c07a88a4>] 
> (snd_info_register+0xe4/0x13c)
> [<c07a88a4>] (snd_info_register) from [<c07a8804>] 
> (snd_info_register+0x44/0x13c)
> irq event stamp: 12923
> hardirqs last  enabled at (12941): [<c01976a8>] 
> console_unlock+0x4b8/0x6a8
> hardirqs last disabled at (12958): [<c01972bc>] console_unlock+0xcc/0x6a8
> softirqs last  enabled at (12956): [<c01026d8>] __do_softirq+0x4f0/0x5e0
> softirqs last disabled at (12977): [<c012f6f8>] irq_exit+0x160/0x16c
> ---[ end trace 9e0864d90e2e08ab ]---
> odroid-audio sound: ASoC: failed to register soundcard -12
> odroid-audio sound: snd_soc_register_card() failed: -12
> odroid-audio: probe of sound failed with error -12
>
> here is the component list reported by your previous patch for that 
> board:
>
> [    3.012781] -----3830000.i2s : samsung-i2s
> [    3.015736] -----snd-soc-dummy : (null)
> [    3.019588] -----3830000.i2s : snd_dmaengine_pcm
> [    3.024122] -----snd-soc-dummy : (null)
> [    3.027991] -----hdmi-audio-codec.0.auto : (null)
> [    3.032620] -----max98090.1-0010 : (null)
> [    3.078865] max98090 1-0010: MAX98090 REVID=0x43
> [    3.085038] max98090 1-0010: use default 2.8v micbias
> [    3.113438] odroid-audio sound: snd-soc-dummy-dai <-> samsung-i2s 
> mapping ok
> [    3.123849] odroid-audio sound: multicodec <-> snd-soc-dummy-dai 
> mapping ok
> [    3.263208] ALSA device list:
> [    3.264234]   #0: Odroid-U3


Just one more thing. Here is the component list with the above patch 
applied:

[    2.970127] -----3830000.i2s : samsung-i2s
[    2.973029] -----snd-soc-dummy : (null)
[    2.976851] -----hdmi-audio-codec.0.auto : (null)
[    2.981476] -----3830000.i2s-sec : snd_dmaengine_pcm
[    2.986459] -----3830000.i2s : snd_dmaengine_pcm
[    2.991022] -----max98090.1-0010 : (null)
[    2.995065] -----snd-soc-dummy : (null)
[    2.998866] -----hdmi-audio-codec.0.auto : (null)
[    3.003523] -----max98090.1-0010 : (null)
[    3.047448] max98090 1-0010: MAX98090 REVID=0x43
[    3.052177] max98090 1-0010: use default 2.8v micbias
[    3.085090] odroid-audio sound: snd-soc-dummy-dai <-> samsung-i2s 
mapping ok
[    3.089691] odroid-audio sound: multicodec <-> snd-soc-dummy-dai 
mapping ok
[    3.099545] ------------[ cut here ]------------
[    3.099799] WARNING: CPU: 2 PID: 33 at fs/proc/generic.c:361 
proc_register+0xe4/0x118
[    3.106497] proc_dir_entry 'sub0/prealloc' already registered
[    3.112118] Modules linked in:
[    3.115162] CPU: 2 PID: 33 Comm: kworker/2:1 Not tainted 
5.2.0-rc6-next-20190624-00004-g5611edb05c36-dirty #6238
[    3.125310] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[    3.131399] Workqueue: events deferred_probe_work_func
[    3.136533] [<c0112530>] (unwind_backtrace) from [<c010e070>] 
(show_stack+0x10/0x14)
[    3.144249] [<c010e070>] (show_stack) from [<c0aa2a2c>] 
(dump_stack+0xa8/0xd4)
[    3.151447] [<c0aa2a2c>] (dump_stack) from [<c01271f4>] 
(__warn+0x10c/0x124)
[    3.158472] [<c01271f4>] (__warn) from [<c0127250>] 
(warn_slowpath_fmt+0x44/0x68)
[    3.165937] [<c0127250>] (warn_slowpath_fmt) from [<c031cf5c>] 
(proc_register+0xe4/0x118)
[    3.174094] [<c031cf5c>] (proc_register) from [<c031d23c>] 
(proc_create_data+0x38/0x4c)
[    3.182095] [<c031d23c>] (proc_create_data) from [<c07a3bb0>] 
(snd_info_register+0xe4/0x13c)
[    3.190500] [<c07a3bb0>] (snd_info_register) from [<c07a3b10>] 
(snd_info_register+0x44/0x13c)
[    3.199072] irq event stamp: 12863
[    3.202401] hardirqs last  enabled at (12871): [<c0196d60>] 
console_unlock+0x464/0x6d0
[    3.210328] hardirqs last disabled at (12888): [<c01969a4>] 
console_unlock+0xa8/0x6d0
[    3.218140] softirqs last  enabled at (12904): [<c01026fc>] 
__do_softirq+0x4fc/0x5f8
[    3.225834] softirqs last disabled at (12897): [<c012f52c>] 
irq_exit+0x160/0x16c
[    3.233242] ---[ end trace 09e9050a97457376 ]---
[    3.237863] odroid-audio sound: ASoC: failed to register soundcard -12
[    3.253458] odroid-audio sound: snd_soc_register_card() failed: -12
[    3.254216] odroid-audio: probe of sound failed with error -12

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

