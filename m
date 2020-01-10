Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82412136954
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 10 Jan 2020 10:02:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbgAJJCJ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 10 Jan 2020 04:02:09 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:56966 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726641AbgAJJCJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Jan 2020 04:02:09 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200110090207euoutp014869453f08a2d666561492c41f7e471b~oewRIdYXW1828518285euoutp01C
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Jan 2020 09:02:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200110090207euoutp014869453f08a2d666561492c41f7e471b~oewRIdYXW1828518285euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1578646927;
        bh=dwV4Npw9r6qPc6ttr4WwQa903LZlPCh9eDq1TvJ49kI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=mT8F6V8rSiqVfvf6c2YlyO/ILxgqUeAzaJB7RWQ/dANxnr+r5wKD+GCui3jx96beg
         9IFrm3ylmm/84LB/YiMAUvr/C98ghmn6t7hA8TUtl2FY9RD5TZVmyN5RWS//E7f+GI
         HNkV4KTY+ekN5UOvN0vOMBpBX9FjBCNAFft65f1U=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200110090207eucas1p17dd6d50d9482c5e7243e681c1abf8bd3~oewQtJVVk1764817648eucas1p1z;
        Fri, 10 Jan 2020 09:02:07 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id CD.67.60679.F8D381E5; Fri, 10
        Jan 2020 09:02:07 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200110090206eucas1p2ae6ed03009d68fe9bc3f247af911f07d~oewQZSUq00534305343eucas1p27;
        Fri, 10 Jan 2020 09:02:06 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200110090206eusmtrp2de6d0820bcfb4326677bc986e8185dae~oewQYnF140591305913eusmtrp2b;
        Fri, 10 Jan 2020 09:02:06 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-b3-5e183d8f38df
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 73.45.08375.E8D381E5; Fri, 10
        Jan 2020 09:02:06 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200110090206eusmtip19212741310764cd95be15a7a05d5fbf4~oewPzck_S1722517225eusmtip1h;
        Fri, 10 Jan 2020 09:02:06 +0000 (GMT)
Subject: Re: Applied
 "ASoC: max98090: fix incorrect helper in max98090_dapm_put_enum_double()" to
 the asoc tree
To:     Mark Brown <broonie@kernel.org>
Cc:     alsa-devel@alsa-project.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Dylan Reid <dgreid@google.com>,
        Jimmy Cheng-Yi Chiang <cychiang@google.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tzung-Bi Shih <tzungbi@google.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <77e524c5-f0a4-1996-2bf5-cbb7395f7c25@samsung.com>
Date:   Fri, 10 Jan 2020 10:02:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <applied-20200108115007.31095-1-m.szyprowski@samsung.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUhTYRj13d3urqtrr1Pbk4nhLCkpzQy5VFqDkBFI0Z9K0lp6UfGzXWda
        f9TEqX0YYbUtM7HwY1BOUdtMizQ/StNMJRETLKG0ltCkDy3N7Wr575zznMNzHngoQtos8qQS
        UtJZdYoqSU5KhE2dv/p2FIdC9M5LBS7M0ECbgKnT1YqYGxOTJNPdnkMwWn0BYvr7TWJmsLmU
        ZHT9TwRM+xetiGkZmBYfkChNtlxSWV6vUdYbC0nl1QYjUtrqvY+IIiX7YtmkhAxWHRh2WhL/
        ccCE0rTyTOPwHMpGFq8i5EwB3g2PK7tREZJQUlyNYHxsVsSTWQR1Q+NintgQmEtaiJVI7c2y
        ZVcVgivmRpInVgQjMzaHyw1zkFf+HdmxO/aF4R+tQruJwB8EYOleENoHJA6CImvRUpqiaBwG
        T4cS7bIQbwFdT4nD4oGjYFHfKLBjGrvCC/2kQ3fG4TDRoHdgAm+CR9ZSgscyGJ28K7DvAtwp
        htGXk4ivfRAsQ4ViHrvBdFfDMvaCRctK4CKCib4HYp5cRjCYq1tO74WxvjlHUwJvg9rmQF5W
        QMnXV4RdBuwCI1ZXvoQLXG+6tSzTUJAv5d1+YOh6+G/ts9dviGtIblh1mmHVOYZV5xj+7y1H
        QiOSsRouOY7ldqWw5wI4VTKnSYkLiElNrkdLH9Wz0DVrRs2/z7QhTCH5WjreTRYtFakyuKzk
        NgQUIXenO0bWR0vpWFXWeVadekqtSWK5NrSREspldHDFVJQUx6nS2USWTWPVK1MB5eyZjbz+
        OM0XH75XdbbKqh2u9XHui83qVQy2T8k+R9SsmVHEdEV0h64T3K/afvx2ZmlN2MxWD0tlmfed
        E5KKXjTmPmPbExWysPmTBB81zJOt3971nHR6W3pIEelnznGj4f0Yk5/nG6fXmILJn1khx3w6
        aHOo//jzDX77XfMDL4QrnKrlQi5eFeRPqDnVX1rD70BNAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRmVeSWpSXmKPExsVy+t/xu7p9thJxBvubjSyuXDzEZLFxxnpW
        i6kPn7BZnDjcyGzRPrOD0eL8+Q3sFpd3zWGzmHF+H5PF4TftrBZ7Lr5id+Dy2PC5ic1jwaZS
        j02rOtk8+rasYvT4vEkugDVKz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng81srIVEnf
        ziYlNSezLLVI3y5BL+P5xQ2MBe1KFauu/mJsYNwp08XIySEhYCKxfto8VhBbSGApo8S0A94Q
        cRmJk9MaWCFsYYk/17rYuhi5gGpeM0psnXqCHSQhLFAo8WPuGmYQW0RAWeLq970sIEXMAs+Z
        JB5tWsUC0TETqGPRKyaQKjYBQ4mutyCjODh4Bewk9l/JBgmzCKhKzDg9hQXEFhWIldi++SHY
        UF4BQYmTM5+AxTkF3CQebpkJZjMLmEnMg6phFpCX2P52DpQtLnHryXymCYxCs5C0z0LSMgtJ
        yywkLQsYWVYxiqSWFuem5xYb6hUn5haX5qXrJefnbmIERuS2Yz8372C8tDH4EKMAB6MSD+8B
        UfE4IdbEsuLK3EOMEhzMSiK8R2+IxQnxpiRWVqUW5ccXleakFh9iNAV6biKzlGhyPjBZ5JXE
        G5oamltYGpobmxubWSiJ83YIHIwREkhPLEnNTk0tSC2C6WPi4JRqYKwp5Pngx35pw73C/0UR
        4gd/T933w+nhvfWb/+Sem74vqW6BN9DKH/M4dFxDZCxO7TTdWbpoosUs86iFqh53Vpg9qlg4
        Nc32tEreGoNZbgEqhYzXkp5NTO1qz9tzr2+9ed3v4mWmxfKnjr8JEZUL7bjSP+Ppv7tRISt4
        Mj9q2HDGsaf9ejTNXImlOCPRUIu5qDgRAFI/SNneAgAA
X-CMS-MailID: 20200110090206eucas1p2ae6ed03009d68fe9bc3f247af911f07d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200109212932eucas1p17a0066e1b426db3d4fdbd89632ea5130
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200109212932eucas1p17a0066e1b426db3d4fdbd89632ea5130
References: <CGME20200109212932eucas1p17a0066e1b426db3d4fdbd89632ea5130@eucas1p1.samsung.com>
        <applied-20200108115007.31095-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Mark

On 09.01.2020 22:29, Mark Brown wrote:
> The patch
>
>     ASoC: max98090: fix incorrect helper in max98090_dapm_put_enum_double()
>
> has been applied to the asoc tree at
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6
>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.

Something went wrong :/.

This patch has been applied twice. First time for the 
max98090_dapm_put_enum_double() function (as it has been designed), 
second time for max98090_put_enum_double(), what is completely wrong 
thing (it does exactly the opposite thing).

Mark, please revert/drop 4e93c1294f4b051d574d6bc59755d2863286990e commit.


>
> Thanks,
> Mark
>
> >From 4e93c1294f4b051d574d6bc59755d2863286990e Mon Sep 17 00:00:00 2001
> From: Marek Szyprowski <m.szyprowski@samsung.com>
> Date: Wed, 8 Jan 2020 12:50:06 +0100
> Subject: [PATCH] ASoC: max98090: fix incorrect helper in
>   max98090_dapm_put_enum_double()
>
> Commit 62d5ae4cafb7 ("ASoC: max98090: save and restore SHDN when changing
> sensitive registers") extended the code for handling "LTENL Mux", "LTENR
> Mux", "LBENL Mux" and "LBENR Mux" controls by adding a custom
> max98090_dapm_put_enum_double() function to them. However that function
> used incorrect helper to get its component object. Fix this by using the
> proper snd_soc_dapm_* helper.
>
> This fixes the following NULL pointer exception observed on
> Exynos4412-based Odroid U3 board:
> 8<--- cut here ---
> Unable to handle kernel NULL pointer dereference at virtual address 000000b0
> pgd = (ptrval)
> [000000b0] *pgd=00000000
> Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> Modules linked in:
> CPU: 0 PID: 1104 Comm: alsactl Not tainted 5.5.0-rc5-next-20200107 #166
> Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
> PC is at __mutex_lock+0x54/0xb18
> LR is at ___might_sleep+0x3c/0x2e0
> ...
> Process alsactl (pid: 1104, stack limit = 0x(ptrval))
> ...
> [<c0b49630>] (__mutex_lock) from [<c0b4a110>] (mutex_lock_nested+0x1c/0x24)
> [<c0b4a110>] (mutex_lock_nested) from [<c0839b3c>] (max98090_shdn_save+0x1c/0x28)
> [<c0839b3c>] (max98090_shdn_save) from [<c083a4f8>] (max98090_dapm_put_enum_double+0x20/0x40)
> [<c083a4f8>] (max98090_dapm_put_enum_double) from [<c080d0e8>] (snd_ctl_ioctl+0x190/0xbb8)
> [<c080d0e8>] (snd_ctl_ioctl) from [<c02cafec>] (ksys_ioctl+0x470/0xaf8)
> [<c02cafec>] (ksys_ioctl) from [<c0101000>] (ret_fast_syscall+0x0/0x28)
> ...
> ---[ end trace 0e93f0580f4b9241 ]---
>
> Fixes: 62d5ae4cafb7 ("ASoC: max98090: save and restore SHDN when changing sensitive registers")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> Link: https://lore.kernel.org/r/20200108115007.31095-1-m.szyprowski@samsung.com
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   sound/soc/codecs/max98090.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
> index c01ce4a3f86d..ede03663cbed 100644
> --- a/sound/soc/codecs/max98090.c
> +++ b/sound/soc/codecs/max98090.c
> @@ -98,7 +98,7 @@ static int max98090_put_enum_double(struct snd_kcontrol *kcontrol,
>   	struct snd_ctl_elem_value *ucontrol)
>   {
>   	struct snd_soc_component *component =
> -		snd_soc_kcontrol_component(kcontrol);
> +		snd_soc_dapm_kcontrol_component(kcontrol);
>   	struct max98090_priv *max98090 =
>   		snd_soc_component_get_drvdata(component);
>   	int ret;

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

