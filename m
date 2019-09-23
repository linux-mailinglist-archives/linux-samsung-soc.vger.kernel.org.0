Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0728BB126
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 23 Sep 2019 11:13:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406134AbfIWJNM (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 23 Sep 2019 05:13:12 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:54949 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406104AbfIWJNM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Sep 2019 05:13:12 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190923091311euoutp019f710f6b0783baa1ca13e60da896ae50~HBlz6YCHA3080330803euoutp01q
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Sep 2019 09:13:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190923091311euoutp019f710f6b0783baa1ca13e60da896ae50~HBlz6YCHA3080330803euoutp01q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1569229991;
        bh=qIK8taltfCKWFlPoIMMxrFkgSt6/LrKqErC+DI905S8=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=aHcqw3KXIo8dgjm/vOz6DEGLIlasXI1x77rly79o146HeDKfesTpqbFJlegqrS1Ag
         VTnOfpw1NF9BRDJZ13DKEpRbJsgs3tD059nJzEnlpfDc42CqNZrhCDpWxPF0cDuSPi
         tWSQfJYDai1j4F4BYIOVsuILlLOD+8Rw8NMZyBdQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190923091311eucas1p2d2be606ea670487014c75c9ad3ad6d5e~HBlzmzCI82760427604eucas1p2V;
        Mon, 23 Sep 2019 09:13:11 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id A9.2C.04309.7AC888D5; Mon, 23
        Sep 2019 10:13:11 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190923091310eucas1p2c0661bfbcf97f525d614c305f3d9069e~HBlzPKfuK3004130041eucas1p2T;
        Mon, 23 Sep 2019 09:13:10 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190923091310eusmtrp1379bfc3dfaa0b68f652ac9cadf7cc353~HBlzOB8yp2265222652eusmtrp1w;
        Mon, 23 Sep 2019 09:13:10 +0000 (GMT)
X-AuditID: cbfec7f4-ae1ff700000010d5-68-5d888ca7f3c1
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 9C.9A.04166.6AC888D5; Mon, 23
        Sep 2019 10:13:10 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190923091310eusmtip25b8e0ba225f8520fbed0c7b717e3db16~HBlysU_ZI1815118151eusmtip2L;
        Mon, 23 Sep 2019 09:13:10 +0000 (GMT)
Subject: Re: [PATCH v2 04/10] ASoC: wm8994: Add support for MCLKn clock
 gating
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     broonie@kernel.org, krzk@kernel.org, lgirdwood@gmail.com,
        sbkim73@samsung.com, alsa-devel@alsa-project.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        m.szyprowski@samsung.com
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <91b0fc41-61e6-4650-2991-313dda4b494a@samsung.com>
Date:   Mon, 23 Sep 2019 11:13:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190923085105.GN10204@ediswmail.ad.cirrus.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRTudx+722h1XYaHJT1GUY3SZgWXSiuIWlBqURCa1a0uS3IzdrWH
        0UvztdaUHsxG0ChJG6VuiemigrU1cuVYWIQlJa2oSEu3XibZtovkf9/3ne+c8x04YlweJBXi
        fH0RZ9CzBUqRlGh79LtrYYOpKm/RULuU6Q66McZR10wyF/tCIqa73ImYK54ukgkEWijmR3cV
        xjjfvSCZusB9jLnl6aWY8NcHJFN+z0MxwcYItkqmaQmXijQd1l5K47RXizS3609oLJdHkcbc
        akeasHN6NpUjXbGXK8g/yBlSM3ZJ9/lDTdiBCHG43ObFTqLThBFJxEAvgWftI1gMy+lGBKM1
        WUYkjeIIgsGPj0UCCSO4OfCBHOsI9FlIodCAYMjUigmkH8HwLx+KuabQ2dDjex3vSKTTYNDX
        EzfhtBuDjoHn8YUiWg1nveZ4g4zOgGBjfVwn6Dlg/uISxfBUehsMvX1ICp4EeHwpFA8uodPB
        UXk/7sfpJCiN3CAFPAPu9F/GhajfKbjwR2FE4iheAx3D6wV5Cnz2tVICTgb/eRMRywZ0GQLT
        3VeUQGoRvPHZkOBaDg99QTI2CKfnQ7MrVZBXg7HXRQjzJ8HL/gQhwiQ412bBBVkGVRVywT0b
        /tgtmIAVcCY0StQipXXcYdZxx1jHHWP9v9eGCDtK4op5nZbj0/TcoRSe1fHFem3KnkKdE0Uf
        zf/XF2lHrpHdbkSLkXKi7JujMk9Osgf5Izo3AjGuTJQ5VRV5ctle9kgJZyjcaSgu4Hg3miYm
        lEmyoxPe5sppLVvE7ee4A5xhrIqJJYro12SNsnjfsrlL29TGTj/R1fK5ZMLVlmP248/Mfluz
        8b33eq4qJ2X3OlPm1qfzqivrZ277uWD7zprrh7Mnh7ZoNqz81CSzrDUt3iFSbby3RCs5VfrJ
        PXUw2LloeuoTPD09rSH590vp5ia+Th3Mz7w2y5vgOT2wiaXWZuVVv7jp0BaVKQl+H6tW4Qae
        /QduY9ZyZAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsVy+t/xe7rLejpiDe49MbC4cvEQk8XGGetZ
        LaY+fMJmcaV1E6PF/CPnWC3On9/AbvHtSgeTxabH11gtZpzfx2Sx9shddovP7/ezWrTuPcJu
        cXHFFyYHXo8Nn5vYPHbOusvusWlVJ5vH5iX1HtPn/Gf06NuyitHj8ya5APYoPZui/NKSVIWM
        /OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYzTT9YxFXxhqWhdcJSp
        gbGFpYuRk0NCwETi/MPprF2MXBxCAksZJT6t38DcxcgBlJCSmN+iBFEjLPHnWhcbRM1rRomm
        nvWMIAlhAT+J6ZvOgNkiAkYSH4/fYgIpYhY4xCRxf91aJoiOL4wSpz7fYQapYhMwlOg92gfW
        wStgJ3FxxRImEJtFQFWi780uNhBbVCBC4vCOWVA1ghInZz4BO5VTwFZiY/s+sHpmAXWJP/Mu
        MUPY4hJNX1ayQtjyEtvfzmGewCg0C0n7LCQts5C0zELSsoCRZRWjSGppcW56brGhXnFibnFp
        Xrpecn7uJkZgFG879nPzDsZLG4MPMQpwMCrx8H7Y2B4rxJpYVlyZe4hRgoNZSYR3k1ZbrBBv
        SmJlVWpRfnxRaU5q8SFGU6DnJjJLiSbnAxNMXkm8oamhuYWlobmxubGZhZI4b4fAwRghgfTE
        ktTs1NSC1CKYPiYOTqkGxgmufQ/i62/+Ed6Z3dRo0/bG+flqmRuX5We+e66vr5wwNUT556Gg
        X5NXBGz8X+Tg5n/z2+c5bKmTX3QVFl5QnBqRXuiy7NLNjXmM+zOLo4+9KI66OOdNTVNYmPr9
        Il1JzuPeYdu1Fr/YzLTxwt66BY4Kp6PiF8WkcPxZNG9R1bU+uQ09lz6e0VNiKc5INNRiLipO
        BADi7Ypi+AIAAA==
X-CMS-MailID: 20190923091310eucas1p2c0661bfbcf97f525d614c305f3d9069e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190920130317eucas1p188d724710077d704f768798c6555c741
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190920130317eucas1p188d724710077d704f768798c6555c741
References: <20190920130218.32690-1-s.nawrocki@samsung.com>
        <CGME20190920130317eucas1p188d724710077d704f768798c6555c741@eucas1p1.samsung.com>
        <20190920130218.32690-5-s.nawrocki@samsung.com>
        <20190923085105.GN10204@ediswmail.ad.cirrus.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 9/23/19 10:51, Charles Keepax wrote:
> On Fri, Sep 20, 2019 at 03:02:13PM +0200, Sylwester Nawrocki wrote:
>> As an intermediate step before covering the clocking subsystem
>> of the CODEC entirely by the clk API add handling of external CODEC's
>> master clocks in DAPM events when the AIFn clocks are sourced directly
>> from MCLKn; when FLLn are used we enable/disable respective MCLKn
>> before/after FLLn is enabled/disabled.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 
> Looks good to me:
> 
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks a lot for reviewing!
