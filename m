Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC117A9931
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  5 Sep 2019 06:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729253AbfIEEFD (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 5 Sep 2019 00:05:03 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:16125 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725290AbfIEEFC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Sep 2019 00:05:02 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20190905040459epoutp02e185875ab40482e27997d7735f722eea~BbxlbNIvm1435414354epoutp02S
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Sep 2019 04:04:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20190905040459epoutp02e185875ab40482e27997d7735f722eea~BbxlbNIvm1435414354epoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1567656300;
        bh=K2/L3a67lmCW4CI8SwDbcv/qzJsPHLctvMI62bYOUBc=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=U0Dqw6yERvV0rfvYA7RUeGzWcV7otPADwU920CT5+M6xN6v4uxKo6yx2yaQHCPsDT
         pNYRKkA3SWYnyGJXig9SwT5uyPjUfcvD1Sk69RSz23XdCv3bHbD4WQ1tK5jNR6x7dM
         trCfPOZ5u0Q90UlaFyr3obqfZXPpjUQY4GX/p5yA=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
        epcas5p2.samsung.com (KnoxPortal) with ESMTP id
        20190905040459epcas5p243a1a657ed94b326ba394d3cd83f2f00~BbxlMDeaB3088230882epcas5p2V;
        Thu,  5 Sep 2019 04:04:59 +0000 (GMT)
Received: from epcas5p4.samsung.com ( [182.195.41.42]) by
        epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
        28.F1.04318.B69807D5; Thu,  5 Sep 2019 13:04:59 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
        20190905040459epcas5p2ff3c684f1616ac4550ada066f2bdac0f~BbxkwT3G13088230882epcas5p2U;
        Thu,  5 Sep 2019 04:04:59 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190905040459epsmtrp250c0c80b9e43fe8c42cc3d1f507391a0~BbxkvaJeT2779427794epsmtrp2W;
        Thu,  5 Sep 2019 04:04:59 +0000 (GMT)
X-AuditID: b6c32a4b-d9dff700000010de-e2-5d70896b7239
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        EF.38.03706.B69807D5; Thu,  5 Sep 2019 13:04:59 +0900 (KST)
Received: from [107.108.73.28] (unknown [107.108.73.28]) by
        epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190905040458epsmtip1ffde31be4022a4fd2b8071027157a9e4~BbxkEi37T3199031990epsmtip1X;
        Thu,  5 Sep 2019 04:04:58 +0000 (GMT)
Subject: Re: [PATCH] arm64: dts: exynos: Propagate address/size cell change
 to /memory node
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Alim Akhtar <alim.akhtar@samsung.com>
Message-ID: <ff14598e-04b4-fce6-0d83-0e6ad092973d@samsung.com>
Date:   Thu, 5 Sep 2019 09:12:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJKOXPdPm1kUSzTKRmEyu1E3oh0ZwJGGH0++wMMeET6V=vv-SQ@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprCKsWRmVeSWpSXmKPExsWy7bCmlm52Z0GsQec8LYuNM9azWpw/v4Hd
        Ysb5fUwWa4/cZXdg8di0qpPNo2/LKkaPz5vkApijuGxSUnMyy1KL9O0SuDL2PdzPUrCBreLK
        m6eMDYw9rF2MnBwSAiYSq2Y8Ze9i5OIQEtjNKLH37XI2COcTo8SkDT+gMt8YJWbNmw7X8uFw
        ByNEYi+jxMSfS1kgnLeMEl3XFrOAVAkLxEpc2fUNqIqDQ0QgQmL7SrBJzALNjBL/Xv1hB6lh
        E9CWuDt9CxOIzStgJ9HxeBnYBhYBFYmvP2+AzREF6v304DArRI2gxMmZT8DinAKBEtcXrwCb
        wywgLnHryXwmCFteYvvbOcwgyyQEDrBJLDrTxgRxtovEjZ29jBC2sMSr41vYIWwpic/v9rKB
        HCohkC3Rs8sYIlwjsXTeMRYI217iwJU5LCAlzAKaEut36UOs4pPo/f2ECaKTV6KjTQiiWlWi
        +d1VqE5piYnd3dBw85Bom3+RCRJUh5gk7k/+zjqBUWEWks9mIflmFpJvZiFsXsDIsopRMrWg
        ODc9tdi0wDgvtVyvODG3uDQvXS85P3cTIzitaHnvYNx0zucQowAHoxIP74O5+bFCrIllxZW5
        hxglOJiVRHhD9+TECvGmJFZWpRblxxeV5qQWH2KU5mBREuedxHo1RkggPbEkNTs1tSC1CCbL
        xMEp1cBY8bricUldlVLJ/mm/2iUfzd3X/DKwe0bUW/G30iXZ38ODkqMbgo3mbuBd476tw33+
        uTWF/f9XLvziuOjY5Q2FvEVBWx7Ez03IMLjBr2OTpL2lQS7AoVeQKXtRutmPw/XXLt15lqgy
        /8i2PQEG6qt3l3P5FRptn3Fh18rAxer+rttF9p3c7zxZiaU4I9FQi7moOBEAfgpYxScDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrFLMWRmVeSWpSXmKPExsWy7bCSnG52Z0GswddFfBYbZ6xntTh/fgO7
        xYzz+5gs1h65y+7A4rFpVSebR9+WVYwenzfJBTBHcdmkpOZklqUW6dslcGXse7ifpWADW8WV
        N08ZGxh7WLsYOTkkBEwkPhzuYASxhQR2M0oseicOEZeWuL5xAjuELSyx8t9zdoia14wS/ceq
        uxg5OIQFYiXufDcECYsIREi8vnOPpYuRi4NZoJlRYum7uYwgjpDAISaJ3bdugi1gE9CWuDt9
        CxOIzStgJ9HxeBnYESwCKhJff95gAbFFgSYd3jGLEaJGUOLkzCdgcU6BQInri1eAHcEsYCYx
        b/NDZghbXOLWk/lMELa8xPa3c5gnMArNQtI+C0nLLCQts5C0LGBkWcUomVpQnJueW2xYYJiX
        Wq5XnJhbXJqXrpecn7uJERwDWpo7GC8viT/EKMDBqMTD+2BufqwQa2JZcWXuIUYJDmYlEd7Q
        PTmxQrwpiZVVqUX58UWlOanFhxilOViUxHmf5h2LFBJITyxJzU5NLUgtgskycXBKNTBOblRe
        v2H7zL+CWwy9npRFSFqsjr+W6CS5tJLZdd8Ji/dbrszOubvR4f3b+RfD3+1cr230RjVqy5OP
        x5i6Fofur5j19qfxfe7FejcizhoXFRhfufeWwadtr/T53ln97mL33dlCTmpP+12hJq2Zs+yi
        HuvKM3NV2MstaxJilzpNPbI38IWZQWiDEktxRqKhFnNRcSIANCFbQH0CAAA=
X-CMS-MailID: 20190905040459epcas5p2ff3c684f1616ac4550ada066f2bdac0f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20190904084834eucas1p20aff0f98a90b9c6939d9113932919aff
References: <CGME20190904084834eucas1p20aff0f98a90b9c6939d9113932919aff@eucas1p2.samsung.com>
        <20190904084829.23944-1-m.szyprowski@samsung.com>
        <9b603476-ade2-d718-b0ba-ec69303405c1@samsung.com>
        <dd8050e7-1dc4-8fbe-8717-9601740e2f70@samsung.com>
        <CAJKOXPdPm1kUSzTKRmEyu1E3oh0ZwJGGH0++wMMeET6V=vv-SQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org



On 9/4/19 8:36 PM, Krzysztof Kozlowski wrote:
> On Wed, 4 Sep 2019 at 16:44, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>
>> Hi Alim,
>>
>> On 2019-09-04 16:06, Alim Akhtar wrote:
>>> Thanks Marek,
>>> This fixes the booting issue on exyno7-espresso board.
>>> Probably this should be CCed to -stable.
>>
>> The patch has 'Fixes' tag, so it will be automatically selected for all
>> stable kernels, which includes the mentioned commit.
> 
> The autosel will pick it up but AFAIK the general process did not
> change - still patch should be Cc-stable tagged. At least this is
> still written in Documentation/process/stable-kernel-rules.rst.
> I can add the tag while applying so no need to resend.
> 
Thanks Marek and Krzystof for the information.

> Best regards,
> Krzysztof
> 
> 
