Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB890285D20
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Oct 2020 12:47:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728136AbgJGKrQ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 7 Oct 2020 06:47:16 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55732 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727449AbgJGKrP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Oct 2020 06:47:15 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201007104713euoutp01aaedf7948f87468e5054f0ab2a5e2715~7sAYugBcu2208022080euoutp01o
        for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Oct 2020 10:47:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201007104713euoutp01aaedf7948f87468e5054f0ab2a5e2715~7sAYugBcu2208022080euoutp01o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1602067633;
        bh=E5XERvvgz2kHeHngJGLKNS1MxI488JkYoBjaEOnm4F0=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=LWM9hhbFLBQZw9NeZcCu74FRkXPQ+DXk1L64bWyE0gfQavvukQ3aK7nEY6+oeK2+r
         F3FU/ubHqVIWc3Y1KacSRmxqrhIP8kgA2Q46SEaukpDsDjpgZA0TUTe0DK41CQfvTK
         Gid85XkZ852hx3oQWRrs9b80m6f2nRITktStiISE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201007104712eucas1p15a76d78779d57144160e51c36d83d24e~7sAYLFOLh3224932249eucas1p1I;
        Wed,  7 Oct 2020 10:47:12 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id ED.76.06456.0BC9D7F5; Wed,  7
        Oct 2020 11:47:12 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201007104711eucas1p1a1b0945d6b12e3260b210dfcb5756ab9~7sAXtthzZ0030400304eucas1p11;
        Wed,  7 Oct 2020 10:47:11 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201007104711eusmtrp1487b9ffe41a58ec6aaec5d6c86578d4d~7sAXs58Da2859428594eusmtrp1b;
        Wed,  7 Oct 2020 10:47:11 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-2a-5f7d9cb05c38
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 66.4B.06314.FAC9D7F5; Wed,  7
        Oct 2020 11:47:11 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201007104710eusmtip191849209bf06805c0437d3901896f954~7sAWmUm-z2861128611eusmtip1e;
        Wed,  7 Oct 2020 10:47:10 +0000 (GMT)
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Jason Gunthorpe <jgg@ziepe.ca>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Hubbard <jhubbard@nvidia.com>,
        =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
        Jan Kara <jack@suse.cz>,
        Dan Williams <dan.j.williams@intel.com>,
        Linux MM <linux-mm@kvack.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Pawel Osciak <pawel@osciak.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>, Oded Gabbay <oded.gabbay@gmail.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <d2f8e8a7-614d-18c8-9e2a-c604e5e54ce6@samsung.com>
Date:   Wed, 7 Oct 2020 12:47:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SaUwTURSF8zrTmQEtPiqGqxKXxrglinXLSzSKxujERKO/XBLBKiOgbLaA
        4EpoIIDgAhpqqYJ1QQgIomBFWUQUTZFVCSg7GIuxIosaIUEZxoV/3z333LxzksdRSjMzg/ML
        DBG0gRp/FeNIF774WbMkz3TKa1lk6XRiys1mSMrlWkSud7ZSJKPqLkXefOtjSFL7BZqkpuhl
        5IrhJRojm4zc+2Bmia2tjiavoz6zJL+7UU4aikwMScgrkJO27F9yYqgpkZFa23s5uWT/yRJD
        ci9DBqNHGY9pfGpkHc0Xf0+n+UfGVpa/8aRXxucPJLH8S8MIzbefrZTx92+e4RP1Xxi+e7iX
        4ftK3jL8uQdZiK9Kr2D5wfxZfMHge3rHlL2Oa70Ff78wQeu+br+j7+OWbCbY5hB+se08FYls
        bDxy4ACvhAR92Tgr8R0EjRkh8chxjIcQxNSflUnDIILE6tx/Fz3vfsilRQaCFx+LaWnoQ/BQ
        3ywXXVMxgetpMTKRXfBWiK2IQaKJwo8YKLRYkLhgsBri7fGMyAq8DtqtDWM6x9F4HtRYtovy
        NHwArLVRrGRxhldXemiRHfBOiEpLGWcKz4aHdhMlsSu860kbjw24g4O8iq+MFHsTFNuj//BU
        +FT54E8dN7AmJ9DSgR5BZ3UOKw0JCBqiDEhyrYGW6mFGTEfhRZBb5C7JG+BW3Be5KAN2gia7
        sxTCCZIKUyhJVkBsjFJyzwdj5d1/zz6tracuIJVxQjXjhDrGCXWM/99NR3QWchVCdQE+gk4d
        KBxbqtME6EIDfZYeDArIR2M/1zpaOWBB3+oPlCPMIdVkxe6jJ72Uck2YLiKgHAFHqVwUG19b
        PZUKb03EcUEb5KUN9Rd05WgmR6tcFSvMvfuU2EcTIhwRhGBB+3cr4xxmRKLV3W1Tou1pTudP
        +F6zHfQwx3kbB0jpzT0FJnbmClwRFPR8zq9VpV1Xk3e5Z4282eaxwHvhJxfr6by49YdGh04l
        VrcOdI34hlS5po9oLNrwV2a1Z//KnOW7Gz22qDuDyyZ9z/g8fLipcXP/nLlF/V0dzW63N1vK
        rHa/iMy6Dz53nmXWq2idr0a9mNLqNL8BDaTifLUDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHec9tZ9HwOBXfLMpGFATNjtfXsBHSh0NUdPmQZbVO86Cic7kz
        7ULR0jKZt7SLOpfaxSKTypndtCjTVNR0XioyJ6XFDE1ILO1iba7Abz+e5/97Hh54aFx+l/Sj
        45MMgj6JT1RQ84i2meaBVbctx9Sr+yqCkeV2FYUKz3cBdOn9AI6ut9/CUe/kOIUKBs8QqKQw
        HUPFRS3ASQ4MVX+8LEEOu41AHWmjEmQdekWinkcWCmXfqSWRveoPiYo6n2Coy9FPonNj0xJU
        dHaEQhOnZqh1PlyJ0UZwj7+VE9xD84CEu1I/gnHWrwUSrqXoJ8ENZjVjXM3V41xO+heKG/ox
        QnHjT/ooLvduJeDayxsl3IR1MVc70U9s8diljNDrUgyCf5xONKxVRLMoUMmGI2VgcLiSDQrb
        syYwRBGgiogREuNTBX2Aap8yru5dFXXAIT2Ub8/DjcAhMQEpDZlgOPz2O+liOVMB4NNyhbu+
        CLZeMJJu9oK/XpkoE5jnzIwB6Lj4YbbhxSB4qSwDc7E3swFmNmYAVwhn6ig4bc0j3UYhDjOs
        pbPrKIaFpjHXKCktY1RwsK3HadA0wSyDnQ82u8o+zH6Y1X0Oc0c8YWvxMOFiKbMVppUVzjLO
        hMLSmve4m5fA+2OWf+wL3w6XYWeA3DxHN89RzHMU8xylHBCVwFtIEbWxWpFVirxWTEmKVWp0
        Witwfsy9F9M1D0B39fYGwNBAMV8WlXxULSf5VPGwtgFAGld4yyI72vbKZTH84SOCXqfWpyQK
        YgMIcd6Wj/v5aHTO/0syqNkQNgyFs2FBYUGhSOEry2Se7ZYzsbxBSBCEA4L+v4fRUj8jKMOW
        V7/ceXr0yuqhqZtRibaVGt1v+/aKutSa+uiWiNxk1vuNZ8ynnX6PgNC7bbDFH2V0LjU2Fay3
        TUleF7ffODFu8+nY9PxzzlXNpKGY68/NTI5G+fwCu/9JS1ZIQnZTdT3/zmOjSbbwmCovUkoc
        VHVPi1Ats15P6F2huWbfoSDEOJ5dietF/i8Y0zPsRwMAAA==
X-CMS-MailID: 20201007104711eucas1p1a1b0945d6b12e3260b210dfcb5756ab9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201003094038eucas1p12aaafe0f52a7747bc2ba95ccb91d1651
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201003094038eucas1p12aaafe0f52a7747bc2ba95ccb91d1651
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
        <20201002175303.390363-2-daniel.vetter@ffwll.ch>
        <20201002180603.GL9916@ziepe.ca>
        <CAKMK7uGF+y-r4swLXmodhduRMy0NPa=ASBY8JOXS_g=9Rq9XQw@mail.gmail.com>
        <20201002233118.GM9916@ziepe.ca>
        <CGME20201003094038eucas1p12aaafe0f52a7747bc2ba95ccb91d1651@eucas1p1.samsung.com>
        <CAKMK7uFP-XQHUPYeRhPx7tjvjARQiF-os9z9jx6WANV6sgSf6g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Daniel,

On 03.10.2020 11:40, Daniel Vetter wrote:
>> After he three places above should use pin_user_pages_fast(), then
>> this whole broken API should be moved into videobuf2-memops.c and a
>> big fat "THIS DOESN'T WORK" stuck on it.
>>
>> videobuf2 should probably use P2P DMA buf for this instead.
> Yup this should be done with dma_buf instead, and v4l has that.

Yes, V4L2 has dma_buf support NOW. That days, using so called V4L2 
USERPTR method was the only way to achieve zero copy buffer sharing 
between devices, so this is just a historical baggage. I've been 
actively involved in implementing that. I've tried to make it secure as 
much as possible assuming the limitation of that approach. With a few 
assumptions it works fine. Buffers are refcounted both by the 
vm_ops->open or by incrementing the refcount of the vm->file. This 
basically works with any sane driver, which doesn't free the mmaped 
buffer until the file is released. This is true for V4L2 and FBdev devices.

This API is considered as deprecated in V4L2 world, so I think 
supporting this hack can be removed one day as nowadays userspace should 
use dma buf.

 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

