Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09F4350507
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 24 Jun 2019 11:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728169AbfFXJBa (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 24 Jun 2019 05:01:30 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45381 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728149AbfFXJBa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Jun 2019 05:01:30 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190624090129euoutp013a406600cff91704c31168add33b7ae8~rFunTFHgq1908719087euoutp01N
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Jun 2019 09:01:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190624090129euoutp013a406600cff91704c31168add33b7ae8~rFunTFHgq1908719087euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1561366889;
        bh=1tUvwV6TPThs11nN+9aGdmPaQlqKKH5f6BaMh/ss/Bw=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=GatHPGCaOPGcbbwA2rAwUNc687v8+IajG30iihPO1/14CUAUEi+4ZUgmGA+9YfkhF
         BDu8RrCJM0a2V9nMqbscQL7WJACCrkRF2/uX8uX/rv7IjfqhqX3En63e9jso7tTH3r
         7LwpsR1VdMVlntpGZB2hXKaZ3G8ikZr+Bexoa7pk=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20190624090128eucas1p1da96f3b2a68421f66b6609fb1e8c7906~rFumkFvBM2770927709eucas1p1n;
        Mon, 24 Jun 2019 09:01:28 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 18.61.04298.861901D5; Mon, 24
        Jun 2019 10:01:28 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190624090127eucas1p1b71b2427ac9880533b0c20f82537016f~rFulwKJpm1081410814eucas1p14;
        Mon, 24 Jun 2019 09:01:27 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190624090127eusmtrp120a622067f930c185b497305734827a3~rFuliGWOl1547615476eusmtrp1X;
        Mon, 24 Jun 2019 09:01:27 +0000 (GMT)
X-AuditID: cbfec7f2-f13ff700000010ca-44-5d1091688a05
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 56.DA.04140.761901D5; Mon, 24
        Jun 2019 10:01:27 +0100 (BST)
Received: from [106.120.50.25] (unknown [106.120.50.25]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190624090127eusmtip22e0282769642a7cbeba3cce3f8464e61~rFulH4ITK2745127451eusmtip2P;
        Mon, 24 Jun 2019 09:01:26 +0000 (GMT)
Subject: Re: [PATCH v2 3/4] ARM: dts: exynos: Add regulator suspend
 configuration to Odroid XU3/XU4/HC1 family
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Anand Moon <linux.amoon@gmail.com>, Kukjin Kim <kgene@kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <2f58b63e-adf1-7935-8849-f311dc991b84@samsung.com>
Date:   Mon, 24 Jun 2019 11:01:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
        Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAJKOXPeXELUjsuW9eyGuRj56067qnL-J2Lt4U42mYiyx=X+F_Q@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsWy7djP87oZEwViDf7O5bGYf+Qcq0X/49fM
        FufPb2C32PT4GqvF5V1z2CxmnN/HZLFu4y12B3aPnbPusntsWtXJ5rF5Sb3H501yASxRXDYp
        qTmZZalF+nYJXBnvVnoXLBeuePtpF2sD43r+LkZODgkBE4nzz7awdjFycQgJrGCUmPK1gQnC
        +cIosXXGIRaQKiGBz4wSD086wXT8mfaAEaJoOaPEz5MvmSGct4wSnydsYAKpEhYokOg8+pYN
        xBYR0JS4/vc72A5mgaVMEl8PNLCDJNgEDCW63naBFfEK2Em8nXSWEcRmEVCV6G98BDZIVCBG
        4uH8O1A1ghInZz4BO4lTIFBi6c8JYHFmAXmJ7W/nMEPY4hK3nswH+0FCYBW7xJJls5kh7naR
        eLN9JTuELSzx6vgWKFtG4vTkHhaIhmagP8+tZYdwehglLjfNYISospY4fPwi0A8cQCs0Jdbv
        0gcxJQQcJd5cS4Uw+SRuvBWEuIFPYtK26cwQYV6JjjYhiBlqErOOr4PbevDCJeYJjEqzkHw2
        C8k3s5B8Mwth7QJGllWM4qmlxbnpqcWGeanlesWJucWleel6yfm5mxiBaef0v+OfdjB+vZR0
        iFGAg1GJh1dgA3+sEGtiWXFl7iFGCQ5mJRHepYkCsUK8KYmVValF+fFFpTmpxYcYpTlYlMR5
        qxkeRAsJpCeWpGanphakFsFkmTg4pRoYbb2k/nFsTTLb3+GcX1cnYZEUuNPbnSHp4d9LTLZ5
        25x+rTrR0rDewfPT3O3JLe+nxH6YoPjW9OkaP7m5pzZLMfY0m/X3+3t2qbCGFd44qP7MXvls
        9/nZpbePPDl5qmfS/ozI3y4sajuqu6ZVbEyuZIj8En3fP3nznEUXX74qzJbrkE2MbYhWYinO
        SDTUYi4qTgQARj0T5jcDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBIsWRmVeSWpSXmKPExsVy+t/xe7rpEwViDX7tFreYf+Qcq0X/49fM
        FufPb2C32PT4GqvF5V1z2CxmnN/HZLFu4y12B3aPnbPusntsWtXJ5rF5Sb3H501yASxRejZF
        +aUlqQoZ+cUltkrRhhZGeoaWFnpGJpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehnvVnoXLBeu
        ePtpF2sD43r+LkZODgkBE4k/0x4wdjFycQgJLGWUuHvgCRtEQkbi5LQGVghbWOLPtS42iKLX
        jBJzWvvAEsICBRKdR9+CNYgIaEpc//udFaSIWWApk8SFU0tYITq+MElM/72PEaSKTcBQoutt
        F1gHr4CdxNtJZ8HiLAKqEv2Nj5hAbFGBGImuqT9ZIGoEJU7OfAJmcwoESiz9OQGsl1nATGLe
        5ofMELa8xPa3c6BscYlbT+YzTWAUmoWkfRaSlllIWmYhaVnAyLKKUSS1tDg3PbfYSK84Mbe4
        NC9dLzk/dxMjMNa2Hfu5ZQdj17vgQ4wCHIxKPLwCG/hjhVgTy4orcw8xSnAwK4nwLk0UiBXi
        TUmsrEotyo8vKs1JLT7EaAr03ERmKdHkfGAayCuJNzQ1NLewNDQ3Njc2s1AS5+0QOBgjJJCe
        WJKanZpakFoE08fEwSnVwBgZ4zl7v8lhqXm9e63kr1sc2HCedcJ/rSC3E2VbTV6lXV8kIv7B
        pH419/GnvLPKup5Fh3/8zMLT6vLr5XKJhon2U3x3PLzo6nvp4OLi7t1xyX6izx69tC76pRvx
        SOPh5g0f/gcY/17w5Osynr8yxYbdJmqq/xc/mmRq1W3oWLI3LZ/z3aP3M2cqsRRnJBpqMRcV
        JwIAMEpbl8sCAAA=
X-CMS-MailID: 20190624090127eucas1p1b71b2427ac9880533b0c20f82537016f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190623160226epcas2p3449814deb1faf7bf939481e6d4da2b86
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190623160226epcas2p3449814deb1faf7bf939481e6d4da2b86
References: <20190621155845.7079-1-krzk@kernel.org>
        <20190621155845.7079-3-krzk@kernel.org>
        <CGME20190623160226epcas2p3449814deb1faf7bf939481e6d4da2b86@epcas2p3.samsung.com>
        <CANAwSgTFQo8wL5s-djwPXFFOLtTHvRQif6234kFC=23PwMhuEQ@mail.gmail.com>
        <d94a2f99-fb99-c238-7011-9bbb4c0cd90f@samsung.com>
        <CAJKOXPeXELUjsuW9eyGuRj56067qnL-J2Lt4U42mYiyx=X+F_Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 2019-06-24 09:41, Krzysztof Kozlowski wrote:
> On Mon, 24 Jun 2019 at 09:20, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> On 2019-06-23 18:02, Anand Moon wrote:
>>> Thanks for this patch. Please add my
>>>
>>> Tested-by: Anand Moon <linux.amoon@gmail.com>
>>>
>>> [snip]
>>>
>>> Could you integrate below small changes into this patch.
>>> with these below changes suspend and resume work correctly at my end.
>>>
>>> [1] XU4_suspendresume.patch
>>>
>>> As per S2MPS11B PMIC 1.2.1 Regulator (Features)
>>> Fix the min max value for *Buck7* and *Buck8*
>>>
>>> -- Buck7 (VDD_1.0V_LDO) 1.5 A (1.2 V to 1.5 V, 12.5 mV step, default on 1.35 V)
>>> -- Buck8 (VDD_1.8V_LDO) 2.5 A (1.8 V to 2.1 V, 12.5 mV step, default on 2.0 V)
>> Could you elaborate why such change for Buck7 and Buck8 is needed?
> Anand has here valid point - the constraints in DTS do not match
> hardware manual. This leads to question whether voltage table in
> driver is proper... Another point is the voltage itself. The
> schematics describes them as at specific voltage (1.35 V and 2.0 V)
> but after boot they are 1.2 V and 1.85 V. Maybe this shift comes from
> the problem above.
>
>>> Also add suspend-off for *Buck9*
>>> Buck9 internally controls the power of USB hub.
>>> Adding suspend the this node help proper reset of USB hub on Odroid
>>> XU4 / HC1/ XU3
>>> during suspend and resume. Below it the logs from my testing.
>> Disabling Buck9 in suspend indeed reduces the power consumed by the
>> board during suspend-to-ram from about 80mA to as little as 7-10mA, what
>> matches the results of OdroidXU3. Thanks for the hint!
> Although I did not get what is the difference in the logs (Anand
> pasted two logs but they look the same) but the power consumption is
> reason is good enough. I would be happy to put in the changelog entire
> consumption  difference. I can measure it on XU3-Lite but can you give
> me the XU4 (before and after)?\


HC1:

next-20190620: 120mA (@5V)
this patchset: 72mA (@5V)
this patchset + fixup from Anand: 7-10mA (@5V)

XU4 (SDcard):

next-20190620: 88mA (@5V)
this patchset: 74mA (@5V), sometimes 42mA (@5V)
this patchset + fixup from Anand: 6-9mA (@5V)


XU4 (eMMC):

next-20190620: 100mA (@5V)
this patchset: 72mA (@5V), sometimes 41mA (@5V)
this patchset + fixup from Anand: 6-9mA (@5V)


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

