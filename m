Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B08911357A3
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  9 Jan 2020 12:09:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730521AbgAILJH (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 9 Jan 2020 06:09:07 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:36179 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729239AbgAILJH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Jan 2020 06:09:07 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200109110905euoutp01764a4568f12fdd619747fbb4f7843c38~oM11GiueY0101201012euoutp01m
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jan 2020 11:09:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200109110905euoutp01764a4568f12fdd619747fbb4f7843c38~oM11GiueY0101201012euoutp01m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1578568145;
        bh=tism4RfoqXjIFyAn12kvdI+qYh6axaml1VxlqbIWZzA=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=ME3Z9YUL8ZXjgC4xU/XWd+iRnbAMUfzu1XWHvNCQaBhiUdrCDitW5jVeWC+muXOc7
         +d85hIG+TY3FpKgFoFeEeMyzQPFFNRhStiVMxK87zObIX7RwsdfThth9G930IDCbbK
         qLj5lVP6hdDohQJXXqy/2cC7NewbxId9APmGpKng=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200109110904eucas1p161603f6d573aeba1d98e8d2e2eaf0708~oM10wWG5E2307623076eucas1p14;
        Thu,  9 Jan 2020 11:09:04 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 97.C3.61286.0D9071E5; Thu,  9
        Jan 2020 11:09:04 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200109110904eucas1p2e41cddd985fe74c2cea897c79c62de1d~oM10QrLAM0643506435eucas1p26;
        Thu,  9 Jan 2020 11:09:04 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200109110904eusmtrp2db1a8f5de2f4722278c346c69e37b7e4~oM10PsF_a2478324783eusmtrp2W;
        Thu,  9 Jan 2020 11:09:04 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-63-5e1709d0f869
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 56.9C.08375.0D9071E5; Thu,  9
        Jan 2020 11:09:04 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200109110903eusmtip168d3934000f5ff36bd9c2b929d3437ed~oM1zpIKD52723827238eusmtip1C;
        Thu,  9 Jan 2020 11:09:03 +0000 (GMT)
Subject: Re: [PATCH 2/2] ASoC: max98090: fix lockdep warning
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     ALSA development <alsa-devel@alsa-project.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Dylan Reid <dgreid@google.com>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <83169752-ac05-d1b1-ece9-fbe1109287cf@samsung.com>
Date:   Thu, 9 Jan 2020 12:09:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CA+Px+wXkFE5b_8bLz7-c95TvEdqHGD5s-XKRYMVr40xQkqTWxQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUhTYRTHfXbv7l5qcp0rD2YmFxVSfMM+XEq0RGr1qfCboDXzopJO2Zxl
        EJiGL0PClyJdaiKEttzUzTStjGY6TfO1RFOI0QqbbuJLgYKZ16vlt985///hnP/DI8SkXXxv
        Yboyh1EpFRkUIcY7BzbGQsZFXknhFStB9KcJC49ur27l0w9tdoIe7LuL0cU1JYgeG2sT0FM9
        tQRdPdbLo/uWivn06wmH4KxY3rZWQMgbTBq5SV9KyO936JF8zeR7mZ8gjkphMtJzGVVY9DVx
        2sfCByjb7H3LZdjm56N1mRaJhECegnuLjXyWpWQzgg/LcVok3uF1BMY3I3vCGoJ6F6lFwt2B
        BbuM8zQhcNYPYlzhRND+3YixJk8yCnSGBHZWRgZC4fCrXQ9GPsVgebScxwoEGQFap5ZgWUJG
        Q9XQIGIZJ/2hd/45xvIRMhG2a17wOI8HDNXYcZZF5BVYyN/eZYw8AV3OWoxjL/hif8JjlwFp
        EUBLXRPOxYyDx53mPfYEh7VDwLEPbHfvDxQisI0aBFxRhmCqoBpxrjMwP7pJsNEw8iS09oRx
        7XNgMi8LuGdxhxmnB3eEO1R2PsK4tgRKiqScOxB0VuO/te/GJ7FyROkORNMdiKM7EEf3f28D
        wvXIi9GoM1MZdYSSuRmqVmSqNcrU0OtZmSa0852G/1hXX6Jfk8kWRAoRdVjiRh1NkvIVueq8
        TAsCIUbJJP0zOy1JiiLvNqPKuqrSZDBqCzomxCkvSWTjz0QpmarIYW4wTDaj2ld5QpF3PvIL
        eFsVmWdzyaajYkrniPivv8MvrfprKrpH4or1p+dEIc+mL1LxzS6fgdoAz41xf3Nuc/CdqW/u
        2fqMmV6bYUS2aV7q33JQ3l0pwUX0hG1xxXH+vdYtqd+4xZu1th/CYuQXAkesS7iqTPNZeVwS
        G/uD3+Jb1zrbrMIDKv2SKVydpogIwlRqxV++0pPLSgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrFIsWRmVeSWpSXmKPExsVy+t/xu7oXOMXjDK4dZrG4cvEQk8XGGetZ
        LaY+fMJmceJwI7NF+8wORovz5zewW1zeNYfNYsb5fUwWh9+0s1rsufiK3YHLY8PnJjaPBZtK
        PTat6mTz6NuyitHj8ya5ANYoPZui/NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9
        O5uU1JzMstQifbsEvYyzzVMYCzZLVbxb+5+1gfGLSBcjB4eEgInEiydAJheHkMBSRonbm3ex
        djFyAsVlJE5Oa4CyhSX+XOtigyh6zSix6tVkRpBmYQEbiVlro0BqRATUJJpP72YGsZkFVjJL
        LOkyg6jvYZK43bmbDSTBJmAo0fW2C8zmFbCTmHzyBCOIzSKgIrHvzmqwZlGBWIntmx8yQ9QI
        Spyc+YQFxOYUCJR40fCfBWKBmcQ8qBpmAXmJ7W/nQNniEreezGeawCg0C0n7LCQts5C0zELS
        soCRZRWjSGppcW56brGhXnFibnFpXrpecn7uJkZgPG479nPzDsZLG4MPMQpwMCrx8DIoicUJ
        sSaWFVfmHmKU4GBWEuE9egMoxJuSWFmVWpQfX1Sak1p8iNEU6LmJzFKiyfnAVJFXEm9oamhu
        YWlobmxubGahJM7bIXAwRkggPbEkNTs1tSC1CKaPiYNTqoGRUeas8lnzpb+Ondt826Dfm4Wh
        5UX5hNqLVwp8Lk6XLDp31+vNtAkbffQntqab2TefSPC2kZW/4Tslaolxvdv8fbHlX289f2j8
        W9qqPmBXfnDcypamrxsEJkv9vaxwocV4zxRNscSTC7lCVil1erLkJAt/Tndizt1k0nRt+/eP
        MXlrlsSnxZUpsRRnJBpqMRcVJwIANPT1iN0CAAA=
X-CMS-MailID: 20200109110904eucas1p2e41cddd985fe74c2cea897c79c62de1d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200108115027eucas1p1d3645ba53703780679c662921efbca78
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200108115027eucas1p1d3645ba53703780679c662921efbca78
References: <CGME20200108115027eucas1p1d3645ba53703780679c662921efbca78@eucas1p1.samsung.com>
        <20200108115007.31095-1-m.szyprowski@samsung.com>
        <20200108115007.31095-2-m.szyprowski@samsung.com>
        <CA+Px+wXkFE5b_8bLz7-c95TvEdqHGD5s-XKRYMVr40xQkqTWxQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi

On 09.01.2020 06:36, Tzung-Bi Shih wrote:
> On Wed, Jan 8, 2020 at 7:50 PM Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> Fix this by introducing a separate mutex only for serializing the SHDN
>> hardware register related operations.
> This fix makes less sense to me.  We used dapm_mutex intentionally
> because: both DAPM and userspace mixer control would change SHDN bit
> at the same time.
>
>> This fixes the following lockdep warning observed on Exynos4412-based
>> Odroid U3 board:
>> ======================================================
>> WARNING: possible circular locking dependency detected
>> 5.5.0-rc5-next-20200107 #166 Not tainted
>> ------------------------------------------------------
>> alsactl/1104 is trying to acquire lock:
>> ed0d50f4 (&card->dapm_mutex){+.+.}, at: max98090_shdn_save+0x1c/0x28
>>
>> but task is already holding lock:
>> edb4b49c (&card->controls_rwsem){++++}, at: snd_ctl_ioctl+0xcc/0xbb8
>>
>> which lock already depends on the new lock.
>>
>> the existing dependency chain (in reverse order) is:
>>
>> -> #1 (&card->controls_rwsem){++++}:
>>         snd_ctl_add_replace+0x3c/0x84
>>         dapm_create_or_share_kcontrol+0x24c/0x2e0
>>         snd_soc_dapm_new_widgets+0x308/0x594
>>         snd_soc_bind_card+0x80c/0xad4
>>         devm_snd_soc_register_card+0x34/0x6c
>>         odroid_audio_probe+0x288/0x34c
>>         platform_drv_probe+0x6c/0xa4
>>         really_probe+0x200/0x490
>>         driver_probe_device+0x78/0x1f8
>>         bus_for_each_drv+0x74/0xb8
>>         __device_attach+0xd4/0x16c
>>         bus_probe_device+0x88/0x90
>>         deferred_probe_work_func+0x3c/0xd0
>>         process_one_work+0x22c/0x7c4
>>         worker_thread+0x44/0x524
>>         kthread+0x130/0x164
>>         ret_from_fork+0x14/0x20
>>         0x0
>>
>> -> #0 (&card->dapm_mutex){+.+.}:
>>         lock_acquire+0xe8/0x270
>>         __mutex_lock+0x9c/0xb18
>>         mutex_lock_nested+0x1c/0x24
>>         max98090_shdn_save+0x1c/0x28
>>         max98090_put_enum_double+0x20/0x40
>>         snd_ctl_ioctl+0x190/0xbb8
>>         ksys_ioctl+0x470/0xaf8
>>         ret_fast_syscall+0x0/0x28
>>         0xbefaa564
> As the stack trace suggested: when the card was still registering,
> alsactl can see the mixer control and try to change it.

Nope. This is just a lockdep warning about possible hypothetical 
situation on the test system during the normal boot. It doesn't mean 
that the circular dependency actually happens (if so, it would end in 
deadlock). It also doesn't mean that such circular dependency can be 
really triggered, because some other dependencies that not known to 
lockdep engine might protect against it. However the easiest way to fix 
it is to use fine-grained locking instead of reusing some framework 
locks for other purposes. Such approach is also usually a good practice.

> We have a discussion on an older thread
> (https://mailman.alsa-project.org/pipermail/alsa-devel/2019-December/160454.html).
> It is weird: userspace should not see things (e.g. no controlC0) until
> snd_card_register( ).
>
> I would like to spend some time to find the root cause.  It would be a
> little challenging though (I have no real runtime to test...).


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

