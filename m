Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E62DA993F
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  5 Sep 2019 06:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726088AbfIEEJt (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 5 Sep 2019 00:09:49 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:18579 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726107AbfIEEJt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Sep 2019 00:09:49 -0400
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20190905040946epoutp0246adf959667454e37ba167ae6958ef03~Bb1wX9xRC1911919119epoutp02g
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Sep 2019 04:09:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20190905040946epoutp0246adf959667454e37ba167ae6958ef03~Bb1wX9xRC1911919119epoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1567656586;
        bh=w/qESNcdY0jXOzxglYbgY5q2CEFMmkRk5jEqtzxeUuQ=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Ho8NUAdmswG/gDPigjp7teOkXX98bn19Q5SkEfpd/KB1+CpQT3I3XU8xDnj1fyn12
         hIXqUZeUBvDTqvRc9c0++TIojC0NdyQ915MV+HWgItEBBVfzapwso2jHyOmrWdxqF6
         t1+IuB6pJLejZuQVhBYWghjWkfrz3IFGySpLL7y4=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
        epcas5p2.samsung.com (KnoxPortal) with ESMTP id
        20190905040945epcas5p274ff922c0b153d0fc95d85835a810a89~Bb1vSsmOM1754417544epcas5p2j;
        Thu,  5 Sep 2019 04:09:45 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
        epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        86.B7.04150.98A807D5; Thu,  5 Sep 2019 13:09:45 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
        20190905040944epcas5p3efabb390433ccb037b5ace2d42e58985~Bb1uKPHW51871218712epcas5p3N;
        Thu,  5 Sep 2019 04:09:44 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190905040944epsmtrp1abbcd911cb701047725086c30e725889~Bb1uIGXxg0391403914epsmtrp1c;
        Thu,  5 Sep 2019 04:09:44 +0000 (GMT)
X-AuditID: b6c32a49-a43ff70000001036-a2-5d708a890c52
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        A5.98.03706.88A807D5; Thu,  5 Sep 2019 13:09:44 +0900 (KST)
Received: from [107.108.73.28] (unknown [107.108.73.28]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190905040943epsmtip2248fb9bbfd6056a0653a52aeff5cc459~Bb1tZwYzc2301123011epsmtip2T;
        Thu,  5 Sep 2019 04:09:43 +0000 (GMT)
Subject: Re: [PATCH 0/3] arm64: dts: exynos: A few more fixes
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Alim Akhtar <alim.akhtar@samsung.com>
Message-ID: <0daa77d5-13cf-94ed-9b16-5f999097f82a@samsung.com>
Date:   Thu, 5 Sep 2019 09:17:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904092442.26260-1-m.szyprowski@samsung.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprEKsWRmVeSWpSXmKPExsWy7bCmpm5nV0Gswa3vohYbZ6xntTh/fgO7
        xYzz+5gs1h65y+7A4rFpVSebR9+WVYwenzfJBTBHcdmkpOZklqUW6dslcGWs6dYs2Mle8eH1
        D7YGxg+sXYycHBICJhL3t85m62Lk4hAS2M0osefCbCYI5xOjRNPC28wQzjdGiZ/v+1lgWu6+
        XcIIkdjLKNH+bDWU85ZR4tzbuWwgVcICthJb558Es0UEQiTuP30BtpBZIFGiac10JhCbTUBb
        4u70LWA2r4CdxK1pz9hBbBYBFYkVa54wgtiiAhESnx4cZoWoEZQ4OfMJ2BWcQPX7d71jhJgp
        LnHryXwmCFteYvvbOWBnSwjsYZP4cOQLUAMHkOMi0XwjA+IDYYlXx7ewQ9hSEi/729ghSrIl
        enYZQ4RrJJbOOwb1sL3EgStzwKYwC2hKrN+lD7GJT6L39xMmiE5eiY42IYhqVYnmd1ehOqUl
        JnZ3Q0PaQ+LvxW52SEhNZJQ4uOsP0wRGhVlIHpuF5JlZSJ6ZhbB5ASPLKkbJ1ILi3PTUYtMC
        w7zUcr3ixNzi0rx0veT83E2M4JSi5bmDcdY5n0OMAhyMSjy8D+bmxwqxJpYVV+YeYpTgYFYS
        4Q3dkxMrxJuSWFmVWpQfX1Sak1p8iFGag0VJnHcS69UYIYH0xJLU7NTUgtQimCwTB6dUA+PB
        jSrBtrYPZ0zpU1s6b7/chZMHuT71/JNk9L5kvKxKZr9WpWlYyZz2BU69l8P2KP6q985+sfaR
        m9bEJXX710UfWbpAmEdYxp+j9fp8ncRkv5Sg6EZZRa/PH7NtlZt7en+5XRP64qRqt4d34XXV
        xP1LXnO8l9syJ+vZ3DMde38EcD77xVLLOkuJpTgj0VCLuag4EQCGLGR7JQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrJLMWRmVeSWpSXmKPExsWy7bCSvG5HV0GsQdchdouNM9azWpw/v4Hd
        Ysb5fUwWa4/cZXdg8di0qpPNo2/LKkaPz5vkApijuGxSUnMyy1KL9O0SuDLWdGsW7GSv+PD6
        B1sD4wfWLkZODgkBE4m7b5cwdjFycQgJ7GaUeHrsFFRCWuL6xgnsELawxMp/z8FsIYHXjBLf
        vhmB2MICthJb559k62Lk4BARCJFY+F4PJMwskChxa8IkVoiZExklJj46wAaSYBPQlrg7fQsT
        iM0rYCdxa9ozsJksAioSK9Y8YQSxRQUiJA7vmMUIUSMocXLmExYQmxOofv+ud4wQC8wk5m1+
        yAxhi0vcejKfCcKWl9j+dg7zBEahWUjaZyFpmYWkZRaSlgWMLKsYJVMLinPTc4sNCwzzUsv1
        ihNzi0vz0vWS83M3MYIjQEtzB+PlJfGHGAU4GJV4eB/MzY8VYk0sK67MPcQowcGsJMIbuicn
        Vog3JbGyKrUoP76oNCe1+BCjNAeLkjjv07xjkUIC6YklqdmpqQWpRTBZJg5OqQbGwrx662fB
        uTUGJ+ISc9yamyq4KzfInT95/6Dlj+clO68tkwmYbMh6e+vM3eKvf8kfOLX6/pkL720m3X78
        tvOdyk+dgx5R0iUbD192nvbWdOdJL4+vj4z+/wzLiXvNuEtpfe1Smd9Z7F3lNmF2nZKrP3HX
        Sy1fNu3V/Aa5SFvbd95LLlreUPz8WImlOCPRUIu5qDgRAFD/xZN8AgAA
X-CMS-MailID: 20190905040944epcas5p3efabb390433ccb037b5ace2d42e58985
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20190904092449eucas1p28ec98275a95882948f4d298f15c15325
References: <CGME20190904092449eucas1p28ec98275a95882948f4d298f15c15325@eucas1p2.samsung.com>
        <20190904092442.26260-1-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hello Marek,

On 9/4/19 2:54 PM, Marek Szyprowski wrote:
> Dear All,
> 
> While fixing the issue reported by Alim Akhtar, I've noticed a few more
> issues in arm64/exynos dts files. This patchset fixes them.
> 
> Best regards
> Marek Szyprowski
> Samsung R&D Institute Poland
> 
> 
> Patch summary:
> 
> Marek Szyprowski (3):
>    arm64: dts: exynos: Move GPU under /soc node for Exynos5433
>    arm64: dts: exynos: Move GPU under /soc node for Exynos7
>    arm64: dts: exynos: Remove useless #address-cells property for GIC
>      node
> 
Thanks for the patches.
This series looks good to me
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
for exynos7 boot tested on v5.3-rc7
Tested-by: Alim Akhtar <alim.akhtar@samsung.com>

>   arch/arm64/boot/dts/exynos/exynos5433.dtsi | 102 ++++++++++-----------
>   arch/arm64/boot/dts/exynos/exynos7.dtsi    |  23 +++--
>   2 files changed, 62 insertions(+), 63 deletions(-)
> 
