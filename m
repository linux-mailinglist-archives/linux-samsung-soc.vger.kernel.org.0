Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51C3E5627B
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 26 Jun 2019 08:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725797AbfFZGlu (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 26 Jun 2019 02:41:50 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:44043 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725379AbfFZGlu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Jun 2019 02:41:50 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190626064148euoutp01af0c9dc63f6dd04349001ca5d62e8db3~rrHO8YGEW1836618366euoutp01h
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Jun 2019 06:41:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190626064148euoutp01af0c9dc63f6dd04349001ca5d62e8db3~rrHO8YGEW1836618366euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1561531308;
        bh=yIoJJvc6Eb5peEiRvNcUCDkcOBErMHu2ZBzdO7RV82I=;
        h=Subject:To:From:Date:In-Reply-To:References:From;
        b=Cy2Z4bFobCyrmRv7ziQkBCo9iriMZfjGoLXr6znhNwza95nMgbOZOxTjrFA4Axtba
         xdH6Sa+gvDGWR0VnwJsf5sfPHeBi5lxzbu3uJ1EqLBIR6lI/+ZEAQABs18ivWtAwQh
         rZJeNohCqX7u8eG1eYtk5Lbj2qRrWIbVJBm5Ubcc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190626064147eucas1p29c55bcfcad997445d92529b9d891ee83~rrHN_Vitx3245732457eucas1p2T;
        Wed, 26 Jun 2019 06:41:47 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 7B.AE.04325.BA3131D5; Wed, 26
        Jun 2019 07:41:47 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190626064146eucas1p178edbb9f0719427d5c80a51cf64c086f~rrHNINdHu1064210642eucas1p1z;
        Wed, 26 Jun 2019 06:41:46 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190626064146eusmtrp115c870f06030884bf2f981d187db5fdd~rrHM6GVZB1523615236eusmtrp1y;
        Wed, 26 Jun 2019 06:41:46 +0000 (GMT)
X-AuditID: cbfec7f5-b75ff700000010e5-b9-5d1313ab635e
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id FD.3A.04146.AA3131D5; Wed, 26
        Jun 2019 07:41:46 +0100 (BST)
Received: from [106.120.50.25] (unknown [106.120.50.25]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190626064146eusmtip1cdd0655a2dc87129e6fc7e987e468eb2~rrHMismUL0903009030eusmtip1n;
        Wed, 26 Jun 2019 06:41:46 +0000 (GMT)
Subject: Re: [alsa-devel] [PATCH resend 25/47] ASoC: samsung: snow: don't
 select unnecessary Platform
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <7a96b050-4ad7-0a9f-41a1-adf27704bf61@samsung.com>
Date:   Wed, 26 Jun 2019 08:41:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <87a7e5ywqs.wl-kuninori.morimoto.gx@renesas.com>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsWy7djPc7qrhYVjDS68ULK4cvEQk8XUh0/Y
        LM6f38Bu8erwLkaLGef3MVkcftPO6sDmseFzE5vHplWdbB7fzkxk8ejbsorR4/MmuQDWKC6b
        lNSczLLUIn27BK6M+Q86mAtOK1VcbNVoYJwp28XIwSEhYCKx6HlUFyMXh5DACkaJtuMnWCCc
        L4wSux6sYoVwPjNKfLu6hrmLkROs48+2u1CJ5YwSLxdOZYdw3jJKTDzwgg2kSlggXaKj8yPY
        LBGBaUwSK188BGtnEzCU6HrbBVbEK2AnMevLfDCbRUBVYurPTWC2qECMxMP5d6BqBCVOznzC
        AmJzCthKdH9/ywRiMwvISzRvnc0MYYtL3HoynwnivOnsEiduCUPYLhLTT2yCOltY4tXxLewQ
        tozE6ck9YMdJCDQzSjw8t5YdwulhlLjcNIMRospa4vDxi6ygYGIW0JRYv0sfIuwo8e7+XjZI
        6PFJ3HgrCHEDn8SkbdOZIcK8Eh1tQhDVahKzjq+DW3vwwiWoczwk7nybzTiBUXEWki9nIfls
        FpLPZiHcsICRZRWjeGppcW56arFxXmq5XnFibnFpXrpecn7uJkZg4jn97/jXHYz7/iQdYhTg
        YFTi4W2QF4oVYk0sK67MPcQowcGsJMK7NFEgVog3JbGyKrUoP76oNCe1+BCjNAeLkjhvNcOD
        aCGB9MSS1OzU1ILUIpgsEwenVAMjp3BNu3noDb03rTKdVx592LPgQE2D5MX+c+E1Tjo7oj/N
        fxns6TWvWPdCAGdar+Sb9ies6Xfr3cLrTM2NNi7x9CrdGthvpr/crH7egf9dXYtOP9P9Lfpx
        sp/g4/7Tyg/WOtuu5zw7cfUNF46F/qd8XBOlGXWPvg5MzVv5brFkjXXP0bIFJw8qsRRnJBpq
        MRcVJwIA3fdFlzgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRmVeSWpSXmKPExsVy+t/xu7qrhIVjDe58Ure4cvEQk8XUh0/Y
        LM6f38Bu8erwLkaLGef3MVkcftPO6sDmseFzE5vHplWdbB7fzkxk8ejbsorR4/MmuQDWKD2b
        ovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2M+Q86mAtO
        K1VcbNVoYJwp28XIySEhYCLxZ9td1i5GLg4hgaWMEvcPrmWFSMhInJzWAGULS/y51sUGUfSa
        UaK1/zcLSEJYIF2io/MjC0hCRGAGk8T0K0egRq1jkXjX/pcRpIpNwFCi6y1IOycHr4CdxKwv
        88FsFgFViak/N4HZogIxEl1Tf7JA1AhKnJz5BMzmFLCV6P7+lgnEZhYwk5i3+SEzhC0v0bx1
        NpQtLnHryXymCYyCs5C0z0LSMgtJyywkLQsYWVYxiqSWFuem5xYb6hUn5haX5qXrJefnbmIE
        RtW2Yz8372C8tDH4EKMAB6MSD2+DvFCsEGtiWXFl7iFGCQ5mJRHepYkCsUK8KYmVValF+fFF
        pTmpxYcYTYGem8gsJZqcD4z4vJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFCAumJJanZqakFqUUw
        fUwcnFINjAbrpz6OifRwkpL/wbg5STYlyeto17VWHy/ROyeSE5l+L8n7Ujndjst7u90PlmDB
        a+0Ba7PPeE+22331lPCRRoZ1/zazqllN0MiZdFpzzcXwSZ5dV6TPdf2cIc814fdkUdVbHwR3
        mWg7xD203Jo0+QD3lYApU3LyTWs75WcLZnId6PTl6BG4r8RSnJFoqMVcVJwIAOanSHzAAgAA
X-CMS-MailID: 20190626064146eucas1p178edbb9f0719427d5c80a51cf64c086f
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
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Kuninori,

On 2019-06-26 03:15, Kuninori Morimoto wrote:
> Hi Marek, again
>
>> Thank you for your test.
>> And so sorry to bother you.
>> I will fixup this issue.
>>
>>>>>> I have no idea so far, but one capability is that if your system
>>>>>> used / based dummy platform, and if your CPU driver didn't use/have
>>>>>> snd_soc_set_runtime_hwparams() / snd_pcm_lib_ioctl,
>>>>>> it might be happen, but this patch seems not related to it...
>>>>> Reverting this patch fixes the issue, so it is definitely related somehow.
>>>> Ahh... OK now I think I could understand your issue.
>>>> Your CPU is using devm_snd_dmaengine_pcm_register() with same *dev.
>>>> In such case, indeed this patch breaks sound card.
> I'm now negotiating to Mark to reverting issue patches.
> But, as alternative idea, I think below patch can solve this issue.
> Can you please test it ?
>
> ----------------------
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 358f1fb..79b9cc4 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -931,9 +931,11 @@ static int soc_bind_dai_link(struct snd_soc_card *card,
>   	rtd->codec_dai = rtd->codec_dais[0];
>   
>   	/* Find PLATFORM from registered PLATFORMs */
> +	/* CPU driver might has both DAI and PLATFORM */
>   	for_each_component(component) {
>   		if (!snd_soc_is_matching_component(dai_link->platforms,
> -						   component))
> +						   component) &&
> +		    !snd_soc_is_matching_component(dai_link->cpus, component))
>   			continue;
>   
>   		snd_soc_rtdcom_add(rtd, component);
> ----------------------

Yes, the above change fixes the issue on Samsung Snow, Peach-Pit and 
Peach-Pi Chromebooks, but causes regression on the other boards, for 
example here is the log from Odroid U3:

max98090 1-0010: MAX98090 REVID=0x43
max98090 1-0010: use default 2.8v micbias
odroid-audio sound: snd-soc-dummy-dai <-> samsung-i2s mapping ok
odroid-audio sound: multicodec <-> snd-soc-dummy-dai mapping ok
------------[ cut here ]------------
WARNING: CPU: 3 PID: 88 at fs/proc/generic.c:361 proc_register+0xf8/0x12c
proc_dir_entry 'sub0/prealloc' already registered
Modules linked in:
CPU: 3 PID: 88 Comm: kworker/3:1 Not tainted 
5.2.0-rc6-next-20190624-00004-g5611edb05c36-dirty #6233
Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
Workqueue: events deferred_probe_work_func
[<c0112548>] (unwind_backtrace) from [<c010e004>] (show_stack+0x10/0x14)
usb 1-3: new high-speed USB device number 3 using exynos-ehci
[<c010e004>] (show_stack) from [<c0aa63bc>] (dump_stack+0x98/0xc4)
[<c0aa63bc>] (dump_stack) from [<c01274d8>] (__warn+0x10c/0x124)
[<c01274d8>] (__warn) from [<c0127534>] (warn_slowpath_fmt+0x44/0x68)
[<c0127534>] (warn_slowpath_fmt) from [<c031f8b8>] 
(proc_register+0xf8/0x12c)
[<c031f8b8>] (proc_register) from [<c031fb88>] (proc_create_data+0x38/0x44)
[<c031fb88>] (proc_create_data) from [<c07a88a4>] 
(snd_info_register+0xe4/0x13c)
[<c07a88a4>] (snd_info_register) from [<c07a8804>] 
(snd_info_register+0x44/0x13c)
irq event stamp: 12923
hardirqs last  enabled at (12941): [<c01976a8>] console_unlock+0x4b8/0x6a8
hardirqs last disabled at (12958): [<c01972bc>] console_unlock+0xcc/0x6a8
softirqs last  enabled at (12956): [<c01026d8>] __do_softirq+0x4f0/0x5e0
softirqs last disabled at (12977): [<c012f6f8>] irq_exit+0x160/0x16c
---[ end trace 9e0864d90e2e08ab ]---
odroid-audio sound: ASoC: failed to register soundcard -12
odroid-audio sound: snd_soc_register_card() failed: -12
odroid-audio: probe of sound failed with error -12

here is the component list reported by your previous patch for that board:

[    3.012781] -----3830000.i2s : samsung-i2s
[    3.015736] -----snd-soc-dummy : (null)
[    3.019588] -----3830000.i2s : snd_dmaengine_pcm
[    3.024122] -----snd-soc-dummy : (null)
[    3.027991] -----hdmi-audio-codec.0.auto : (null)
[    3.032620] -----max98090.1-0010 : (null)
[    3.078865] max98090 1-0010: MAX98090 REVID=0x43
[    3.085038] max98090 1-0010: use default 2.8v micbias
[    3.113438] odroid-audio sound: snd-soc-dummy-dai <-> samsung-i2s 
mapping ok
[    3.123849] odroid-audio sound: multicodec <-> snd-soc-dummy-dai 
mapping ok
[    3.263208] ALSA device list:
[    3.264234]   #0: Odroid-U3

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

