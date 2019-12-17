Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A9F0122E60
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 17 Dec 2019 15:18:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728656AbfLQOSn (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 17 Dec 2019 09:18:43 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:51860 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728546AbfLQOSn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Dec 2019 09:18:43 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20191217141840euoutp01546529031dad57c25498be9deb5c9c2a~hLlzQ_YNi0398203982euoutp019
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Dec 2019 14:18:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20191217141840euoutp01546529031dad57c25498be9deb5c9c2a~hLlzQ_YNi0398203982euoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1576592320;
        bh=1s1Slf9ccB+OcGbIvFpqDKWcfakW9qQvQDw6GdUOUig=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=p4J54AiHoIDbKvzZxwd56Q7SRF0kFYTs4LjS4vqNiznb2P+tDlTdXLwBEYstUru1N
         N6Sr76y0k/LMLf/uI7voRLU+VLesTW65T1VyAR5Lepy1h5wT2HS5mDCbcdizdtFvk1
         lnG1Rp8RAj+yc3wRBblLn4y6Xz8SRKAbCLA3U8Ik=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20191217141840eucas1p1a88133f0eb43637a68feeb7ce74146a0~hLly5Syug0596705967eucas1p12;
        Tue, 17 Dec 2019 14:18:40 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id EC.7F.60698.0C3E8FD5; Tue, 17
        Dec 2019 14:18:40 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20191217141839eucas1p1726ad57cc8389bc3aadf0b8e32e99d5a~hLlyiHekh0598705987eucas1p1D;
        Tue, 17 Dec 2019 14:18:39 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20191217141839eusmtrp129f474eee400c77e400d90fd5d159170~hLlyhgAw_3246532465eusmtrp1C;
        Tue, 17 Dec 2019 14:18:39 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-00-5df8e3c0ec19
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 4A.9F.08375.FB3E8FD5; Tue, 17
        Dec 2019 14:18:39 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20191217141839eusmtip110c702f147eac744cfc35dc17202ef5c~hLlyFnJvY2896128961eusmtip1L;
        Tue, 17 Dec 2019 14:18:39 +0000 (GMT)
Subject: Re: [alsa-devel] [PATCH v2] ASoC: max98090: save and restore SHDN
 when changing sensitive registers
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     Mark Brown <broonie@kernel.org>,
        ALSA development <alsa-devel@alsa-project.org>,
        Dylan Reid <dgreid@google.com>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <901df54d-96ad-b25a-fc0d-5901076f6c09@samsung.com>
Date:   Tue, 17 Dec 2019 15:18:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CA+Px+wXPa_cwdZUQfCx4jAhhj4Q9b7bNABUGazLKOJ7U5ae-mA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHe3e2s+No9rpZPpiZDBUSvGHFoUSS+jDoQxeiD9XQlQcV3ZTN
        aXYh75clJZWpy1C8pCznZV6x1HTlCsVblpeYJYqRuL5skVJazqPlt9/zf/4vz/8PL0WIDDx3
        KlaZxKiU8ngJKeC2D6wO+7+aX5EF1deI6Ymxfg5dNLdA0m9N6QSdW5qH6JGRJj5dMtLDoU3L
        uTz65dgS/wQlbbJlkNIKo0Zq1OeT0nuteiS1GT3P8i4JQqOY+NhkRhUYFimIqe6t4iVOeV23
        t82gNNTtrkVOFODDMFBuIRwswnUIRttus2xHMNQVrkWCDbYhWO40ou0H1koLyS5qEVQtNvPZ
        wYqg6XX+pkuMldBX/Zx0sCv2hczBF4TDROAWDuSUmfiOBYmDQWvVbpqEOAwmG3s3dS72AX3x
        KkeLKGovlkFebQxrcYF3pQtcBzvhc/DdYtlkAh+EDmsZwbIbzCyUc9ik7Xx4VhPJ8ilomW3m
        syyGJXPrFnvA4MMCriMb4EwEc8MGPjsUIHifUbLV+TiYzGM8RyACH4LGrkBWDocnszbCIQN2
        himrC5vBGR60F2/JQsjLEbFuX9CZG/6d7RsdJwqRRLejmW5HG92ONrr/dysQV4/cGI1aEc2o
        Q5RMSoBarlBrlNEB1xIURrTxiQbXzT86Uc/vq/0IU0iyWwhJP2UinjxZnaroR0AREldhp9eG
        JIySp95gVAkRKk08o+5H+ymuxE0YUvlNJsLR8iQmjmESGdX2lkM5uaehGvIA2RGQ/uuMz6Ns
        v+h1j8qL3dMrTz8US73nPadU/uLzcW3klZNrtyyfjzmlLNIG2YXQ8aLH+qChrPrquzfve5OV
        n45ofOs+eoYK9btW9d531kx7skylpyO+FFmsDc6q3prpr9bsN0c7JjkT9pL6fbjlT86aIXNw
        btheeLl8OlvCVcfIg/0IlVr+F8wo0XFAAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrEIsWRmVeSWpSXmKPExsVy+t/xu7r7H/+INdj639jiysVDTBZTHz5h
        szhxuJHZon1mB6PF+fMb2C1mnN/HZHH4TTurxZ6Lr9gdODw2fG5i81iwqdRj06pONo++LasY
        PT5vkgtgjdKzKcovLUlVyMgvLrFVija0MNIztLTQMzKx1DM0No+1MjJV0rezSUnNySxLLdK3
        S9DLWLJ/MWvBDYWKL1tvMTYw7pXqYuTkkBAwkXi76C5bFyMXh5DAUkaJWw/b2SESMhInpzWw
        QtjCEn+udUEVvWaU+N+3jREkISyQJ3FwyWo2EFtEQE2i+fRuZhCbWWArk0TLLz+Ihg4miZW7
        XrGAJNgEDCW63naBNfAK2ElcX78fbBuLgKrEquk/mUBsUYFYie8rPzFC1AhKnJz5BKyXUyBQ
        4t3duywQC8wk5m1+CLVMXmL72zlQtrjErSfzmSYwCs1C0j4LScssJC2zkLQsYGRZxSiSWlqc
        m55bbKhXnJhbXJqXrpecn7uJERh/24793LyD8dLG4EOMAhyMSjy8EiXfY4VYE8uKK3MPMUpw
        MCuJ8O5QAArxpiRWVqUW5ccXleakFh9iNAV6biKzlGhyPjA15JXEG5oamltYGpobmxubWSiJ
        83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYLRYu+9d2SuOV1++GPiUPtSS4hd5NldIsfXAatEn
        n7b0Mug//dvyQPHYl+2lr3ptf3Gv8vJe4PM9bflR/pSFi558PnF99tPSxuTXvO9+Gaq3/y45
        Ytde+6lZNu16436pW8bJ96447Tm2Xc9w6bGfqz7P5X7EZZL/sVm3s8ao8aL87ded++Zw7olS
        YinOSDTUYi4qTgQAvklEZtUCAAA=
X-CMS-MailID: 20191217141839eucas1p1726ad57cc8389bc3aadf0b8e32e99d5a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c
References: <CGME20191128152110epcas3p2b205b4b55f6d8bfac42fcb8faaade93c@epcas3p2.samsung.com>
        <20191128151908.180871-1-tzungbi@google.com>
        <8aceb9ec-aa6e-1fa4-cee9-e22084c141e8@samsung.com>
        <CA+Px+wXPa_cwdZUQfCx4jAhhj4Q9b7bNABUGazLKOJ7U5ae-mA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi All,

On 12.12.2019 19:05, Tzung-Bi Shih wrote:
> On Thu, Dec 12, 2019 at 10:09 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> -> #1 (&card->controls_rwsem){++++}:
>>          snd_ctl_add_replace+0x3c/0x84
>>          dapm_create_or_share_kcontrol+0x24c/0x2e0
>>          snd_soc_dapm_new_widgets+0x308/0x594
>>          snd_soc_bind_card+0x80c/0xac8
>>          devm_snd_soc_register_card+0x34/0x6c
>>          asoc_simple_probe+0x244/0x4a0
>>          platform_drv_probe+0x6c/0xa4
>>          really_probe+0x200/0x490
>>          driver_probe_device+0x78/0x1f8
>>          bus_for_each_drv+0x74/0xb8
>>          __device_attach+0xd4/0x16c
>>          bus_probe_device+0x88/0x90
>>          deferred_probe_work_func+0x3c/0xd0
>>          process_one_work+0x22c/0x7c4
>>          worker_thread+0x44/0x524
>>          kthread+0x130/0x164
>>          ret_from_fork+0x14/0x20
>>          0x0
> A key observation here is: the card registration got deferred.

Right. The deferred probe is caused by missing regulator on the first try.

>> -> #0 (&card->dapm_mutex){+.+.}:
>>          lock_acquire+0xe8/0x270
>>          __mutex_lock+0x9c/0xb18
>>          mutex_lock_nested+0x1c/0x24
>>          max98090_shdn_save+0x1c/0x28
>>          max98090_put_enum_double+0x20/0x40
>>          snd_ctl_ioctl+0x190/0xbb8
>>          do_vfs_ioctl+0xb0/0xab0
>>          ksys_ioctl+0x34/0x5c
>>          ret_fast_syscall+0x0/0x28
>>          0xbe9094dc
> And this is an ioctl( ) on a control (e.g. controlC0).
>
> I have no enough resources to test and trace the code temporarily.
> But is it possible:
> - snd_card_new( ) succeed in snd_soc_bind_card( ), so that userspace
> can see the control
> - code in later snd_soc_bind_card( ) decided to defer the probe
> - soc_cleanup_card_resources( ) may forget to clean the control?  (not
> sure about this)
> Then, when the card is instantiating next time, some userspace program
> tries to ioctl( ) to get the deadlock possibility and the NULL
> dereference.

I've tried to debug this issue, but without much progress.

Here is what I've noticed:

1. This NULL ptr dereference happens on snd_ctl_elem_write(), with a 
valid (at least previously registered) kcontrol object.

2. The kcontrol ->put method is routed to 
max98090_dapm_put_enum_double(), in which the function 
snd_soc_kcontrol_component() returns random/buggy component pointer, 
what then causes the NULL ptr dereference.

3. The component object has been registered via the following function call:

(snd_ctl_add) from [<c0829030>] (dapm_create_or_share_kcontrol+0x24c/0x2e0)
(dapm_create_or_share_kcontrol) from [<c08293cc>] 
(snd_soc_dapm_new_widgets+0x308/0x594)
(snd_soc_dapm_new_widgets) from [<c0820a64>] (snd_soc_bind_card+0x80c/0xac8)
(snd_soc_bind_card) from [<c083217c>] (devm_snd_soc_register_card+0x34/0x6c)
(devm_snd_soc_register_card) from [<c084772c>] 
(odroid_audio_probe+0x288/0x34c)
(odroid_audio_probe) from [<c05e2b68>] (platform_drv_probe+0x6c/0xa4)
(platform_drv_probe) from [<c05e02f0>] (really_probe+0x200/0x490)
(really_probe) from [<c05e0754>] (driver_probe_device+0x78/0x1f8)
(driver_probe_device) from [<c05de1fc>] (bus_for_each_drv+0x74/0xb8)
(bus_for_each_drv) from [<c05e0050>] (__device_attach+0xd4/0x16c)
(__device_attach) from [<c05df1c0>] (bus_probe_device+0x88/0x90)
(bus_probe_device) from [<c05df6d8>] (deferred_probe_work_func+0x3c/0xd0)
(deferred_probe_work_func) from [<c0149824>] (process_one_work+0x22c/0x7c4)
(process_one_work) from [<c0149e00>] (worker_thread+0x44/0x524)
(worker_thread) from [<c0150dbc>] (kthread+0x130/0x164)
(kthread) from [<c01010b4>] (ret_from_fork+0x14/0x20)

4. kcontrol->id.name during the registration is "LBENL Mux".

5. It looks that the max98090 related kcontrols are registered in the 
system only once, so it doesn't look like an issue with stale object 
from the previous probe() try.

I hope that the above observations helps a bit. The ASoC framework is so 
complex, that I've never ever tried to learn its basic concepts.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

