Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 064866668E7
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 12 Jan 2023 03:26:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235746AbjALC0h (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 11 Jan 2023 21:26:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236007AbjALC0g (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 11 Jan 2023 21:26:36 -0500
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D26DFA1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Jan 2023 18:26:26 -0800 (PST)
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20230112022623epoutp03a52c4061c5e4172388b860547d5099c7~5bqMvSMiz1078810788epoutp03Y
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Jan 2023 02:26:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20230112022623epoutp03a52c4061c5e4172388b860547d5099c7~5bqMvSMiz1078810788epoutp03Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1673490383;
        bh=C9JCoMCJFRlE1FRTJDTOm6ZjSbIhAtw1LFr6jJACP6U=;
        h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
        b=odgwn0FqvHQdiAxpLlvdDmJrMBpbzv5NU4YbxYS3eOyeQb7wxITiXs8/zmVC1XNtk
         al3nng7OR/FbqyqzV0HT+GlsPp7o7Yh3QbTZoMociKyGGLTI6YBmLSs+fzInNu7iMx
         LpUMRuEjKjcjf/PdeOy4SxaFsBqgtkbaqaND92Kc=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTP id
        20230112022623epcas1p3bdab95860467983f3b9900b55f2afcd2~5bqMPyR4H0298102981epcas1p3E;
        Thu, 12 Jan 2023 02:26:23 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.36.134]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4NspML2HKNz4x9QG; Thu, 12 Jan
        2023 02:26:22 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        AB.F5.02461.ECF6FB36; Thu, 12 Jan 2023 11:26:22 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20230112022621epcas1p1c430de038d4afd28c46772ca9bfd0d2d~5bqLCWP--0365103651epcas1p1L;
        Thu, 12 Jan 2023 02:26:21 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20230112022621epsmtrp1e15ee3ec69a7b2a2fdb345a989d30897~5bqLBcwpb0591005910epsmtrp11;
        Thu, 12 Jan 2023 02:26:21 +0000 (GMT)
X-AuditID: b6c32a37-873ff7000000099d-12-63bf6fcecca8
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        4B.89.10542.DCF6FB36; Thu, 12 Jan 2023 11:26:21 +0900 (KST)
Received: from inkidae002 (unknown [10.113.221.213]) by epsmtip2.samsung.com
        (KnoxPortal) with ESMTPA id
        20230112022621epsmtip2bdad0c3b43ca557b30109378004618f4~5bqK0VKcy2948629486epsmtip2C;
        Thu, 12 Jan 2023 02:26:21 +0000 (GMT)
From:   =?utf-8?B?64yA7J246riwL1RpemVuIFBsYXRmb3JtIExhYihTUikv7IK87ISx7KCE7J6Q?= 
        <inki.dae@samsung.com>
To:     "'Jagan Teki'" <jagan@amarulasolutions.com>,
        "'Marek Szyprowski'" <m.szyprowski@samsung.com>,
        "'Seung-Woo Kim'" <sw0312.kim@samsung.com>,
        "'Kyungmin Park'" <kyungmin.park@samsung.com>,
        "'Neil Armstrong'" <narmstrong@linaro.org>,
        "'Robert Foss'" <robert.foss@linaro.org>,
        "'Andrzej Hajda'" <andrzej.hajda@intel.com>,
        "'Sam Ravnborg'" <sam@ravnborg.org>, <thierry.reding@gmail.com>
Cc:     "'Marek Vasut'" <marex@denx.de>,
        <linux-samsung-soc@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>,
        "'linux-amarula'" <linux-amarula@amarulasolutions.com>
In-Reply-To: <CAMty3ZDGu-acuZ9Bhp_=JcTYn5YWKVZnEUf3nC28Spm8v4+KQg@mail.gmail.com>
Subject: RE: [PATCH v11 0/3] drm: exynos: dsi: Restore the bridge chain
Date:   Thu, 12 Jan 2023 11:26:21 +0900
Message-ID: <000001d9262d$42bc49c0$c834dd40$@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIgyi8WHi+AM2s4a5bnyovkxHh4sgE7ee16AjPDcKOt70kPgA==
Content-Language: ko
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLJsWRmVeSWpSXmKPExsWy7bCmvu65/P3JBvN38VjcX/yZxeLK1/ds
        Fl82TWCzONv0ht1i+YR9bBYzzu9jslh75C67xZu2RkaLS1MOs1l8mvWQ2WLFz62MFjMmv2Sz
        +LlrHosDr8faj/dZPebNOsHisXPWXXaPxXteMnncubaHzeN+93EmjyXTrrJ59G1ZxejxeZNc
        AGdUtk1GamJKapFCal5yfkpmXrqtkndwvHO8qZmBoa6hpYW5kkJeYm6qrZKLT4CuW2YO0OFK
        CmWJOaVAoYDE4mIlfTubovzSklSFjPziElul1IKUnALTAr3ixNzi0rx0vbzUEitDAwMjU6DC
        hOyMSacfMBas4qqYt2w5WwPjHo4uRk4OCQETiZ+T5jF1MXJxCAnsYJSYvfA/K4TziVHi3ooZ
        LCBVQgKfGSXWvsyC6di08SZU0S5GieX7N7JAOC8ZJaYeuwXWwSaQLvGy6zJYQkSgk1ni3Z5G
        sBZmgeWMEkvbHjCBVHEKBEr8+7WAGcQWFnCXWDptJiOIzSKgKjHt2BFWEJtXwFJizueFbBC2
        oMTJmU/ANjALyEtsfzuHGeImBYmfT5eB1YsIOEm8nHmUDaJGRGJ2ZxszyGIJgRccEueuzWSF
        aHCReNH8nh3CFpZ4dXwLlC0l8bK/jR2iYTKjxJ3rK1ggnBmMEod/XmeEqDKW2L90MtALHEAr
        NCXW79KHCCtK7Pw9lxFiM5/Eu689rCAlEgK8Eh1tQhAlShLHLt6AmiIhcWHJRLYJjEqzkPw2
        C8lvs5D8MAth2QJGllWMYqkFxbnpqcWGBcbwCE/Oz93ECE7XWuY7GKe9/aB3iJGJg/EQowQH
        s5IIr4r//mQh3pTEyqrUovz4otKc1OJDjKbA0J7ILCWanA/MGHkl8YYmlgYmZkbGJhaGZoZK
        4rw2EeuShQTSE0tSs1NTC1KLYPqYODilGpi4lohu/c08JWnD1MUCXyJyF65o3u7L43WOYXrj
        k/T5a/wMg44ev7i8a12ZzlPXsA0P3+nlefutuaAz8920Jr9jvdYfeJxX1PSdjpbs/bSs/IjB
        Qr2uZZtXuttvcfC9edzvmZYsi+mhxpCf09s/z2xJTEhp0Xyx4V2EUL/I7a+nzC31th91e3a1
        Ve/st97s+h73C/ePvnapubzm2TUV/XuXl37f6XVcI120sraAc3VAhbVG2uM9FVv4Fi8SfeNz
        1+zpIu7naySmnPr3fd+P3rPTNmQwlDtGXws0Xqp5JMikLlqX965G3Ou/miYKp2ocfb227bEW
        +K41YcIEp+NHuximN1wPzL8quS98utDlbx9eK7EUZyQaajEXFScCAI0uMj9gBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrKIsWRmVeSWpSXmKPExsWy7bCSvO7Z/P3JBhNnGVrcX/yZxeLK1/ds
        Fl82TWCzONv0ht1i+YR9bBYzzu9jslh75C67xZu2RkaLS1MOs1l8mvWQ2WLFz62MFjMmv2Sz
        +LlrHosDr8faj/dZPebNOsHisXPWXXaPxXteMnncubaHzeN+93EmjyXTrrJ59G1ZxejxeZNc
        AGcUl01Kak5mWWqRvl0CV8ak0w8YC1ZxVcxbtpytgXEPRxcjJ4eEgInEpo03WbsYuTiEBHYw
        Suz+OImli5EDKCEhsWUrB4QpLHH4cDFEyXNGiR37j4OVsAmkSrxeXQcSFxHoZ5bY9XAyM4jD
        LLCSUWLd6q1MEB3XGCXuTFvBBLKNUyBQ4t+vBcwgtrCAu8TSaTMZQWwWAVWJaceOsILYvAKW
        EnM+L2SDsAUlTs58wgJiMwtoSzy9+RTKlpfY/nYOM8QHChI/ny4D6xURcJJ4OfMoG0SNiMTs
        zjbmCYzCs5CMmoVk1Cwko2YhaVnAyLKKUTK1oDg3PbfYsMAoL7Vcrzgxt7g0L10vOT93EyM4
        ZrW0djDuWfVB7xAjEwfjIUYJDmYlEV4V//3JQrwpiZVVqUX58UWlOanFhxilOViUxHkvdJ2M
        FxJITyxJzU5NLUgtgskycXBKNTBp5czPvsh8xP+M9dk/Xef03M1v/bu4zeRhjGSNlJx73D/W
        W3dCwo30v58SmZJVKN+24vn0VOmTPJvnado4TPJgVdfYpxXFdilequYRw+ez0Xyp3d7F06w9
        i9mTuJ2Ul07VkNx4VbCVx1Tn3uMas9dzVpVODf27O1IvSHvbvGXaV1f0VhkFP/ZYI+Uy5Xd9
        drY2R/o50f+zV+/X0pl1QNlipyxHuPK78ov3kuJL3657FpPw0tRPcuI//3OaQseudf1cYKb9
        tM/mcfFymwbDFQIZP9w9nOZdeMs93dezwXdZ2OLJEfuyLn3LWXOGO+fd/8MXdDzyXubu3pOZ
        KPWK4dUnkSW/20JiD9dox0jsua/EUpyRaKjFXFScCACquJkxSAMAAA==
X-CMS-MailID: 20230112022621epcas1p1c430de038d4afd28c46772ca9bfd0d2d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230106175722epcas1p152dacb511ee08d563c51bb8a8deb0bfe
References: <20221212182923.29155-1-jagan@amarulasolutions.com>
        <CGME20230106175722epcas1p152dacb511ee08d563c51bb8a8deb0bfe@epcas1p1.samsung.com>
        <CAMty3ZDGu-acuZ9Bhp_=JcTYn5YWKVZnEUf3nC28Spm8v4+KQg@mail.gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Jagan Teki,

Sorry for late.

> -----Original Message-----
> From: Jagan Teki <jagan@amarulasolutions.com>
> Sent: Saturday, January 7, 2023 2:56 AM
> To: Marek Szyprowski <m.szyprowski@samsung.com>; Inki Dae
> <inki.dae@samsung.com>; Seung-Woo Kim <sw0312.kim@samsung.com>; Kyungmin Park
> <kyungmin.park@samsung.com>; Neil Armstrong <narmstrong@linaro.org>; Robert
> Foss <robert.foss@linaro.org>; Andrzej Hajda <andrzej.hajda@intel.com>; Sam
> Ravnborg <sam@ravnborg.org>
> Cc: Marek Vasut <marex@denx.de>; linux-samsung-soc@vger.kernel.org; dri-
> devel@lists.freedesktop.org; linux-amarula <linux-
> amarula@amarulasolutions.com>
> Subject: Re: [PATCH v11 0/3] drm: exynos: dsi: Restore the bridge chain
> 
> On Mon, Dec 12, 2022 at 11:59 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > Split the Exynos DSI bridge chain update patches from Samsung DSIM
> > bridge driver for easy to apply.
> >
> > Changes for v11:
> > - enable bridge.pre_enable_prev_first
> > Changes for v10:
> > - collect Marek.V Review tag
> 
> Any update on this?
> 

Added Thierry Reding who is a maintainer of DRM panel drivers.

I will pick this patch series - including panel and bride patches - up.

Thierry and Andrzej, please let me know if any problem.

Thanks,
Inki Dae

> Jagan.

