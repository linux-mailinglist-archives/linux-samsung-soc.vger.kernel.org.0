Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58F561FD22F
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 17 Jun 2020 18:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgFQQ3X (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 17 Jun 2020 12:29:23 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:33774 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726708AbgFQQ3U (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 17 Jun 2020 12:29:20 -0400
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
        by mailout2.samsung.com (KnoxPortal) with ESMTP id 20200617162915epoutp026c19aeac5f079b37e4c1f12bae74cd1a~ZYbDsPOCb1283312833epoutp027
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Jun 2020 16:29:15 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20200617162915epoutp026c19aeac5f079b37e4c1f12bae74cd1a~ZYbDsPOCb1283312833epoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1592411355;
        bh=pJDQ9bzgD7mDXxkITK5uC1QbmLKf2zUNC9GZ5y74iRI=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=A2r4Lazt05Kx4TtjYPmep/dn0+8ecjNjQCzC6WC0yedjYdgE3YHs011s+BzwFsrD4
         Hi2GbyNi/rGevUHQlsPd0DGSieOcu4zJEM4jOSD9rH2ImggvF4QWIZqsq0psUHIZSK
         PXq+YX8JdneaDcD+mvhZI23y/b+GqhMu2MGqKUuE=
Received: from epsmges5p2new.samsung.com (unknown [182.195.42.74]) by
        epcas5p1.samsung.com (KnoxPortal) with ESMTP id
        20200617162914epcas5p1a27f88125c976d7dca9feb3c5101cc9e~ZYbC8por22551825518epcas5p1-;
        Wed, 17 Jun 2020 16:29:14 +0000 (GMT)
Received: from epcas5p2.samsung.com ( [182.195.41.40]) by
        epsmges5p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
        87.FE.09703.AD44AEE5; Thu, 18 Jun 2020 01:29:14 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
        20200617162914epcas5p21255b4039eba27206ede0f35035dfd05~ZYbCo56qC1059410594epcas5p22;
        Wed, 17 Jun 2020 16:29:14 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200617162914epsmtrp1a2ac5034639496a17426e50445c1f59e~ZYbCoO-_41937519375epsmtrp1_;
        Wed, 17 Jun 2020 16:29:14 +0000 (GMT)
X-AuditID: b6c32a4a-4b5ff700000025e7-f5-5eea44da53da
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        22.0D.08303.AD44AEE5; Thu, 18 Jun 2020 01:29:14 +0900 (KST)
Received: from mshams01 (unknown [107.122.43.244]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20200617162911epsmtip258b7d1ac6dec4090cf9ebb61c6dd22fe~ZYbADTQEM1472814728epsmtip2g;
        Wed, 17 Jun 2020 16:29:11 +0000 (GMT)
From:   "M Tamseel Shams" <m.shams@samsung.com>
To:     "'Greg KH'" <gregkh@linuxfoundation.org>
Cc:     <kgene@kernel.org>, <krzk@kernel.org>, <jslaby@suse.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-serial@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <alim.akhtar@samsung.com>
In-Reply-To: <20200615125045.GA946844@kroah.com>
Subject: RE: [RFC PATCH] serial: samsung: Re-factors UART IRQ resource for
 various Samsung SoC
Date:   Wed, 17 Jun 2020 21:58:42 +0530
Message-ID: <000001d644c4$70180730$50481590$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQKFLyHxHkUNw6bP6pRUtYOiC7jR2QHTNgWiAz7cYJqnVpGkAA==
Content-Language: en-us
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRmVeSWpSXmKPExsWy7bCmhu4tl1dxBgsazS0ezNvGZtG8eD2b
        xZQNH5gs+h+/ZrY4f34Du8Wmx9dYLS7vmsNmMeP8PiaLM4t72R04PTat6mTz2D93DbvH5iX1
        Hn1bVjF6rN9ylcXj8ya5ALYoLpuU1JzMstQifbsEroxd16cxFqziqVjf8IClgfEPZxcjJ4eE
        gInE0wV3GEFsIYHdjBIXLrl1MXIB2Z8YJXad3cUI4XxmlJi8byc7TMf724fZIBK7GCUu9y1n
        gmh/ziix/Bg/iM0moCsx6WAbM4gtIqAj0XHmBAtIA7PAK0aJb2+esoIkOAUMJPaefQJWJCyQ
        ILF5zwowm0VAVWJNN4jNzsErYCnR7AoS5RUQlDg58wkLiM0sIC+x/e0cZoh7FCR+Pl3GCrHK
        SeLWyznsEDXiEi+PHmEHWSshsIVDYvmjI1ANLhKztyxmg7CFJV4d3wL1mJTEy/42KDtfYv68
        VVD1FRIrL7yBsu0lDlyZA3QEB9ACTYn1u/QhdvFJ9P5+wgQSlhDglehoE4KoVpT4v7sfaqK4
        xLsVU1ghbA+J9ktTWScwKs5C8tksJJ/NQvLBLIRlCxhZVjFKphYU56anFpsWGOWllusVJ+YW
        l+al6yXn525iBKcnLa8djA8ffNA7xMjEwXiIUYKDWUmE1/n3izgh3pTEyqrUovz4otKc1OJD
        jNIcLErivEo/zsQJCaQnlqRmp6YWpBbBZJk4OKUamIpb9xyL/LMiVm5L3vxKF8FL4uzVx9fN
        /tvBX+GkeeSTTmct06EvCwUW/58oHK+ctfDwEb27RTOPcTw7kNBwSbPW1Ti8u0sg6/+md178
        y9nN77koRPidiWObfI/bQeiALRvjs6UmWZwBCXPvxUxb9iHBy+aH/Wm792sTP2/avcTmFotq
        H0dNZze/0+rlh7aHCwv7xE6QCuVR7Qix+JCyomNldFDpGnNVm0uByscnaH3I4maekf4gcIN4
        b/9qpXTT4PbVeQ0v3jVZRDtct3r2zvfu15sCjkFFF9OZal8taNhZ16jIV7A8LtNA4eDr3r2b
        vfrcSw59d2/tOZUz0YbpRoH8vPpCbblzHl6cp8qVWIozEg21mIuKEwE1kINIvgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnkeLIzCtJLcpLzFFi42LZdlhJXveWy6s4g+XLFSwezNvGZtG8eD2b
        xZQNH5gs+h+/ZrY4f34Du8Wmx9dYLS7vmsNmMeP8PiaLM4t72R04PTat6mTz2D93DbvH5iX1
        Hn1bVjF6rN9ylcXj8ya5ALYoLpuU1JzMstQifbsEroxd16cxFqziqVjf8IClgfEPZxcjJ4eE
        gInE+9uH2boYuTiEBHYwStxb+54RIiEuMe3XfihbWGLlv+fsEEVPGSU6/y9gBUmwCehKTDrY
        xgxiiwjoSHScOcECUsQs8IlR4tDDWYwQHesYJabcfMQGUsUpYCCx9+wTsA5hgTiJCzv7WEBs
        FgFViTXdK4Di7By8ApYSza4gUV4BQYmTM58AVXAAzdSTaNsIdg+zgLzE9rdzmCFuU5D4+XQZ
        K8QJThK3Xs5hh6gRl3h59Aj7BEbhWUgmzUKYNAvJpFlIOhYwsqxilEwtKM5Nzy02LDDKSy3X
        K07MLS7NS9dLzs/dxAiOMy2tHYx7Vn3QO8TIxMF4iFGCg1lJhNf594s4Id6UxMqq1KL8+KLS
        nNTiQ4zSHCxK4rxfZy2MExJITyxJzU5NLUgtgskycXBKNTA1e2pslT3a+LXtkunXp8kLrHYt
        mrIxYwZb2XTGlV6i4d4CPUKNX1I13jYceTAlq+fJh/uf7W+m+RpyRp3es1V4C/P0uxt/CC1/
        UFX6/n+0mur8CUFHhG7Lddj0OnEt8nSZUH/7DNeiA7d678tnWdlu3lUaWhUy5eSWz/pvdQ/t
        6DHuqD9RfsrOp4/9sXnM5QKTn1z+jtIHt507m+wTHRLq5HVRoDyA+6ulY0TOot4/KTsSm98L
        99uydcVb867XKvPedL/jocRC7g9/Oay0dqXVTfZ8fP7p/Ckma3XyXDbFXcz+mh/+eOPqukPO
        Cxd8d5FNvvMiYo+AlsK5viu3Ys9zMJn9nrNnRpTMd1/JUDslluKMREMt5qLiRAC2bXwUIgMA
        AA==
X-CMS-MailID: 20200617162914epcas5p21255b4039eba27206ede0f35035dfd05
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CMS-RootMailID: 20200615124355epcas5p446ae2f1b63331ef87334cd7d696c3c43
References: <CGME20200615124355epcas5p446ae2f1b63331ef87334cd7d696c3c43@epcas5p4.samsung.com>
        <20200615122609.71884-1-m.shams@samsung.com>
        <20200615125045.GA946844@kroah.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Greg,
I will post the patch without RFC tag.

Thanks & Regards
Tamseel

> -----Original Message-----
> From: Greg KH <gregkh@linuxfoundation.org>
> Sent: Monday, June 15, 2020 6:21 PM
> To: Tamseel Shams <m.shams@samsung.com>
> Cc: kgene@kernel.org; krzk@kernel.org; jslaby@suse.com; linux-arm-
> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
> serial@vger.kernel.org; linux-kernel@vger.kernel.org;
> alim.akhtar@samsung.com
> Subject: Re: [RFC PATCH] serial: samsung: Re-factors UART IRQ resource for
> various Samsung SoC
> 
> On Mon, Jun 15, 2020 at 05:56:09PM +0530, Tamseel Shams wrote:
> > In few older Samsung SoCs like s3c2410, s3c2412 and s3c2440, UART IP
> > is having 2 interrupt lines.
> > However, in other SoCs like s3c6400, s5pv210, exynos5433, and
> > exynos4210 UART is having only 1 interrupt line. Due to this,
> > "platform_get_irq(platdev, 1)"
> > call in the driver gives the following warning:
> > "IRQ index 1 not found" on recent platforms.
> >
> > This patch re-factors the IRQ resources handling for each platform and
> > hence fixing the above warnings seen on some platforms.
> >
> > Signed-off-by: Tamseel Shams <m.shams@samsung.com>
> > ---
> >  drivers/tty/serial/samsung_tty.c | 20 ++++++++++++++++----
> >  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> RFC means "I do not trust this so I don't want anyone to merge it", so
I'll just
> delete it from my queue and wait for you to come up with something that
you
> feel confident with :)
> 
> thanks,
> 
> greg k-h

