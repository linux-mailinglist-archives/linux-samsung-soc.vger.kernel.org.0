Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 521939FCD8
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 28 Aug 2019 10:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbfH1IWn (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 28 Aug 2019 04:22:43 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:49674 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726292AbfH1IWm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Aug 2019 04:22:42 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190828082241euoutp0182731082533840712c48b6fc5159dbb4~-CISmkyHC0760507605euoutp01F
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Aug 2019 08:22:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190828082241euoutp0182731082533840712c48b6fc5159dbb4~-CISmkyHC0760507605euoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1566980561;
        bh=ezN90ha61wMUtzkxioQJBYo3kcbKcHVJc2ZzvthJ9CM=;
        h=From:Subject:To:Cc:Date:In-Reply-To:References:From;
        b=ncVsqjrKpwY7WZBgIh9/WYJ21/Gd5/ztex6kLh+yRGUMXg3Zeu9rjHKUmphMxvLn+
         RyD1kcU63rcE5Ub1XTosW6B7HOgur0lXgSpceb2KnkztP9pjXzixhep4fVyay7TXVY
         SMbjGZSCRHdN32S5B533BbqrIYGnnTzm70KjH1TU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190828082240eucas1p1d9d51125f5315e2c4c051be78ed62045~-CISHcS801983319833eucas1p1S;
        Wed, 28 Aug 2019 08:22:40 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 4B.AA.04374.0D9366D5; Wed, 28
        Aug 2019 09:22:40 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190828082239eucas1p28be9c8ec6002f12d646cd3364d79dfba~-CIRRTY5U0583105831eucas1p2F;
        Wed, 28 Aug 2019 08:22:39 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190828082239eusmtrp220e751afd1ae4c07a1e5dd654db64c30~-CIRDS4Fy1794617946eusmtrp25;
        Wed, 28 Aug 2019 08:22:39 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-11-5d6639d06381
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 30.22.04166.FC9366D5; Wed, 28
        Aug 2019 09:22:39 +0100 (BST)
Received: from [106.120.50.63] (unknown [106.120.50.63]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190828082239eusmtip22e934fdac1fd2df51bea9d848310a617~-CIQtceI22322823228eusmtip21;
        Wed, 28 Aug 2019 08:22:39 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 2/2] ARM: exynos: Enable support for ARM architected
 timers
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Message-ID: <1ade54c6-aaf9-f536-484e-a2a50f443a03@samsung.com>
Date:   Wed, 28 Aug 2019 10:22:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <d286053b6f4b4783d0638dc2dbd5858e@www.loen.fr>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprPKsWRmVeSWpSXmKPExsWy7djP87oXLNNiDdo3iFlsnLGe1eL6l+es
        FufPb2C32PT4GqvFjPP7mCx2zjnJ6sDmsWlVJ5vH5iX1Hn1bVjF6fN4kF8ASxWWTkpqTWZZa
        pG+XwJXx4a5fwXPximcrjzA1MB4R7mLk5JAQMJH4++UiSxcjF4eQwApGiYPfjjNCOF8YJTZM
        /8YM4XxmlFi6aTtTFyMHWMuvliKI+HJGiR8tjewQzltGiWPPjzCCzGUTMJToetvFBmILC4RI
        zN56lgXEFhFQlPh04STYCmaBS4wS+w5OA2vgFbCT+LdkM5jNIqAqMa+llx3EFhWIkdj5pocZ
        okZQ4uTMJ2CDOAWsJY58fQlWwywgL7H97RxmCFtc4taT+UwQzy1jl/i61gbCdpGYdPsBC4Qt
        LPHq+BZ2CFtG4v9OkHouILuZUeLhubXsEE4Po8TlphmMEFXWEoePX2QF+Z9ZQFNi/S59iLCj
        xObNHeyQYOGTuPFWEOIGPolJ26YzQ4R5JTrahCCq1SRmHV8Ht/bghUvMExiVZiH5bBaSb2Yh
        +WYWwt4FjCyrGMVTS4tz01OLjfNSy/WKE3OLS/PS9ZLzczcxApPN6X/Hv+5g3Pcn6RCjAAej
        Eg9vB39qrBBrYllxZe4hRgkOZiUR3kcqQCHelMTKqtSi/Pii0pzU4kOM0hwsSuK81QwPooUE
        0hNLUrNTUwtSi2CyTBycUg2MtTy9x/ml/dzmP9Odd+OO95n1cYsNtPa/nVNo/elyreCzGS+N
        ix0LV156efqK9v7Nn/bkNV+Kqn561IjjlFtYReSnmKg1On8nfhWofJJS80B4jobsrT0RpzcX
        Se7esG/N9Dbde/GH7psoXp+7f3rLnJPL+S+d1LrnE+Zit1j96r7MlfYHBXM3CyixFGckGmox
        FxUnAgB6/kP+MgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRmVeSWpSXmKPExsVy+t/xe7rnLdNiDQ59k7HYOGM9q8X1L89Z
        Lc6f38BusenxNVaLGef3MVnsnHOS1YHNY9OqTjaPzUvqPfq2rGL0+LxJLoAlSs+mKL+0JFUh
        I7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/jw12/gufiFc9WHmFq
        YDwi3MXIwSEhYCLxq6Woi5GLQ0hgKaPEw3WzmbsYOYHiMhInpzWwQtjCEn+udbFBFL1mlNi2
        +jAbSIJNwFCi620XmC0sECIxe+tZFhBbREBR4tOFk4wgDcwCVxglJt/bwg6SEBL4wijx7VMV
        iM0rYCfxb8lmRhCbRUBVYl5LL1iNqECMxL4z29khagQlTs58AjaUU8Ba4sjXl2BxZgEziXmb
        HzJD2PIS29/OgbLFJW49mc80gVFoFpL2WUhaZiFpmYWkZQEjyypGkdTS4tz03GJDveLE3OLS
        vHS95PzcTYzA6Np27OfmHYyXNgYfYhTgYFTi4e3gT40VYk0sK67MPcQowcGsJML7SAUoxJuS
        WFmVWpQfX1Sak1p8iNEU6LmJzFKiyfnAyM8riTc0NTS3sDQ0NzY3NrNQEuftEDgYIySQnliS
        mp2aWpBaBNPHxMEp1cA465LT45d5l4LaGqff3JqltKrlS73v/NBbxgqdXk4ycvm/l15JWRhY
        JXxq3nuOUA9VF83WgLOHemXOxSTcu+6cIH+77dWiJTWz3y4vjNTaoaSyY17/ZL1d+lxWP/0/
        T+ZatfzE/ls8GRVf5+Tcr2CN0NS8p37p4JlvO33XTd61yG5l10m7hw93K7EUZyQaajEXFScC
        ALNA9JnEAgAA
X-CMS-MailID: 20190828082239eucas1p28be9c8ec6002f12d646cd3364d79dfba
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190826103203eucas1p2d67b0ef44758eb06252b340f7751701a
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190826103203eucas1p2d67b0ef44758eb06252b340f7751701a
References: <20190826103142.3477-1-m.szyprowski@samsung.com>
        <CGME20190826103203eucas1p2d67b0ef44758eb06252b340f7751701a@eucas1p2.samsung.com>
        <20190826103142.3477-4-m.szyprowski@samsung.com>
        <d286053b6f4b4783d0638dc2dbd5858e@www.loen.fr>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Marc,

On 2019-08-26 12:49, Marc Zyngier wrote:
> On 2019-08-26 11:31, Marek Szyprowski wrote:
>> ARM architected timer can be used together with Exynos MultiCore Timer
>> driver, so enable support for it. Support for ARM architected timers is
>> essential for enabling proper KVM support.
>
> How can you say that this is to "enable KVM support", while in the 
> previous
> patch, you set "arm,cpu-registers-not-fw-configured" which implies 
> that you're
> booting in secure mode with the timer's CP15 registers left to 
> undefined values?

Thanks for asking a good question!

I've did my KVM research mainly on Exynos5422-based OdroidXU3/XU4 boards 
family. After some recently merged patches they all now boot correctly 
in HYP mode.

On all of those boards arch timers are indeed partially not configured 
(CNTFRQ is zero). I was convinced that this also requires adding 
"arm,cpu-registers-not-fw-configured" property to make timers fully 
operational, but it looks that this only disables VDSO on arm32 and 
switches to phys timers if booted in SVC mode.

I've checked and KVM works fine on the mentioned boards regardless of 
the "arm,cpu-registers-not-fw-configured" property. The only issue is 
the lack of proper value in CNTFRQ register, what requires patching 
timer node by adding "clock-frequency = <24000000>" property also to the 
guest dtb.

I've did my test of KVM with QEMU emulator version 3.1.0 (Debian 
1:3.1+dfsg-8) virtualizing vexpress-a15 machine, with patched 
vexpress-v2p-ca15-tc1.dtb and the following command line on OdroidXU3:

taskset 0x30 qemu-system-arm -M vexpress-a15 -smp 2 -cpu host 
-enable-kvm -m 512 -kernel zImage -dtb vexpress-v2p-ca15-tc1.dtb -append 
"console=ttyAMA0 root=/dev/vda rw rootwait" -serial stdio -display none 
-monitor null -device virtio-blk-device,drive=virtio-blk -drive 
file=rootfs.raw,id=virtio-blk,if=none,format=raw -netdev user,id=user 
-device virtio-net-device,netdev=user

Then I've checked other boards that are capable of running in HYP mode. 
Exynos5250 Arndale board with mainline uboot boots to HYP fine. 
Exynos5250-based Snow Chromebook with stock bootloader boots only to SVC 
mode. There exists a way to upgrade uboot to enable HYP, but this 
requires HW fix to enable write access to nvram. Both boards however 
also don't configure CNTFRQ register, but otherwise the arch timer 
registers seems to be configured fine (virt counters are in sync between 
CPUs).

The last group of boards are Exynos5420-based Pit and Exynos5800-based 
Pi Chromebooks. In theory they are capable in running HYP mode with a 
patched bootloader, but stock bootloader boots only to SVC. They also 
truly don't have arch timer registers correctly configured, as virt 
timers are out of sync between CPUs.

I will send v3 with "arm,cpu-registers-not-fw-configured" property moved 
from the timer nodes in dtsi files to respective effected boards.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

