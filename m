Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40A15B79B7
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 19 Sep 2019 14:49:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389564AbfISMtC (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 19 Sep 2019 08:49:02 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44249 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387520AbfISMtC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 08:49:02 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20190919124900euoutp0278c476e4a4edf18422d34a4060ca70b5~F19GmvxBR2727627276euoutp025
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Sep 2019 12:49:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20190919124900euoutp0278c476e4a4edf18422d34a4060ca70b5~F19GmvxBR2727627276euoutp025
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1568897340;
        bh=J22Qpfy7n8Y1XcaV/gdgpvRYNyZpeC/UESeqfLD2sEM=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=NoGkTjPLIGcnAWh377fCEaNMPcpjLizEIiyoh9OuDHhNDxa6fSEAIyKLVuzxM87Rf
         8gWqcLxe7l+k/o3UXL62WOJhy3HcsO2A/AkHaPbcx0KChfGDnts4plGBDJlJK07E/F
         AKJxRwAeYddikBQmDvCwEfR3BGp923EWIhezSUEc=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190919124859eucas1p291f22b7c17376e4bf10628a6f54e12a6~F19FpudbC1013810138eucas1p2l;
        Thu, 19 Sep 2019 12:48:59 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id CB.5A.04374.B39738D5; Thu, 19
        Sep 2019 13:48:59 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190919124858eucas1p2cb801bef09b778fba0e4b5a83fef7203~F19E6YY6M2105921059eucas1p2B;
        Thu, 19 Sep 2019 12:48:58 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190919124858eusmtrp24513783b173cc557bd84222d9ba5e919~F19EsHn330718807188eusmtrp2H;
        Thu, 19 Sep 2019 12:48:58 +0000 (GMT)
X-AuditID: cbfec7f5-4f7ff70000001116-0d-5d83793bc4d6
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 44.77.04117.A39738D5; Thu, 19
        Sep 2019 13:48:58 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190919124857eusmtip20c1e572b804df4737ffb2072e0598532~F19EGM0Ab0452004520eusmtip2Z;
        Thu, 19 Sep 2019 12:48:57 +0000 (GMT)
Subject: Re: [PATCH v1 2/9] mfd: wm8994: Add support for MCLKn clock control
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com,
        b.zolnierkie@samsung.com, sbkim73@samsung.com,
        patches@opensource.cirrus.com, lgirdwood@gmail.com,
        robh+dt@kernel.org, broonie@kernel.org,
        linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <420d3c8a-a31e-1edf-3112-b9800beace1e@samsung.com>
Date:   Thu, 19 Sep 2019 14:48:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190919075924.GB13195@pi3>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sa0hTYRjHfc/Z2Tlax16n5ZOG1iro5o0KDlmSEDhJunyISrFc7aCW07F5
        SYMyxVBT0WBNl+A+dLFVqMvM7jFXIwvnZagVmrc+VIroNJFM23aI/PZ7/s//fZ7nDy9DSjqp
        ACY1PZNXp8vTpGIvUcu7+Y6QyNzCxPDW4TWcvctMcE3VDRSnHR4Tc/YiE+LqLB0UZ7M10twv
        ezHBmUZ7Ka7a9orgHloGaM4x+Zriil5aaK6rfobYz8oaHQVi2VP9AC0zGUvEske3Lst0tUtI
        VtFsRDKHKegIHe+1V8GnpWbz6rCoJK+Ub4uRqk76Qv6khcpH5eJS5MkA3gUPtCNkKfJiJLge
        wRvbFUIoZhDcflRDuFwS7EDwe/D4vxdaR7lIMN1FMPFpjhKKCQTG0TaRy+WL40Cbv+je4Ye3
        Qt8fwUTibgI+Gz8iV0OMI6D8bYWTGYbFUTBflOiSRXgzjLwtpVy8Gp+A6aE2N7PYB97XjLnn
        ezpnfu+2upnE/lAwc48SOBieTNSSwqVTNDTpVgl8AAxTfyiBfeGHtZkWeB0sPa1zRwZciKDs
        +RdaKCoRfLUakOCKhDZrF+U6lHRubngWJsjR0F7RT7hkwN7QP+Ej3OAN11t0pCCzUHxVIrg3
        wW+jjhA4AK6NLYkqkVS/LJl+WRr9sjT6/3sNSGRE/nyWRpnMa3am8zmhGrlSk5WeHHo2Q2lC
        zn/2YdE624peLZwxI8wg6Up2fU5hooSSZ2tylWYEDCn1Y2t3FyRKWIU8N49XZ5xWZ6XxGjMK
        ZERSf/aix1CCBCfLM/nzPK/i1f+6BOMZkI8OVZ28OTy7hYvvCd74Zf7K47Smiu0Jg3te8nOz
        dzKN2Wf6TpbHbsh7UWKOaG8JKb3UVz+u8GBw57SdCp+6EVgXW/X1ErtQeDSKW6Ea1+XtaFdV
        xhmUa31Tv2kV5+Kiv7PTSVNNPzueD/TuiwnKkAefus8drPHpWTgWU0bTyWWHF6UiTYo8Yhup
        1sj/AmOlecpjAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xe7pWlc2xBheXKltcuXiIyWLjjPWs
        FlMfPmGzuNK6idFi/pFzrBbnz29gt/h2pYPJYtPja6wWM87vY7JYe+Quu8Xn9/tZLVr3HmG3
        uLjiC5MDr8eGz01sHjtn3WX32LSqk81j85J6j+lz/jN69G1ZxejxeZNcAHuUnk1RfmlJqkJG
        fnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsbTf9YFF9grGt4fYW1g
        7GXrYuTkkBAwkZj6uZeli5GLQ0hgKaPEtontrF2MHEAJKYn5LUoQNcISf651sUHUvGaUmDPt
        FiNIQljAR2Jqwz+wQSICmhLX/35nBSliFrjEJDH/zU5GiI57jBJ3HhxgAqliEzCU6D3axwiy
        gVfATuJnayxImEVAVeLR0S5WEFtUIELi8I5ZYAt4BQQlTs58wgJicwIteHnpOJjNLKAu8Wfe
        JWYIW1yi6ctKVghbXmL72znMExiFZiFpn4WkZRaSlllIWhYwsqxiFEktLc5Nzy020itOzC0u
        zUvXS87P3cQIjOBtx35u2cHY9S74EKMAB6MSD69CeXOsEGtiWXFl7iFGCQ5mJRHeOaZNsUK8
        KYmVValF+fFFpTmpxYcYTYGem8gsJZqcD0wueSXxhqaG5haWhubG5sZmFkrivB0CB2OEBNIT
        S1KzU1MLUotg+pg4OKUaGG3lGjVnaS4tabthbaak6MLWp5/PPmuaQmPr7G9s6k2CTifefj9v
        aX30vLzPmoRE9TU5K1PfOR307vf9H1R3NuRHwt3nOqkJAcUJcv/+bdxt7XBLtSB1w7Yddi8j
        bjYXHLn7kun56yUHlnXedr/1q2VPc8HphLxN05iCt31jNHrQzRLPajTrnhJLcUaioRZzUXEi
        AGE/0KD2AgAA
X-CMS-MailID: 20190919124858eucas1p2cb801bef09b778fba0e4b5a83fef7203
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
        <CGME20190918104656eucas1p1d9cad1394b08d05a99151c4fbc9425ce@eucas1p1.samsung.com>
        <20190918104634.15216-3-s.nawrocki@samsung.com> <20190919075924.GB13195@pi3>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 9/19/19 09:59, Krzysztof Kozlowski wrote:
> On Wed, Sep 18, 2019 at 12:46:27PM +0200, Sylwester Nawrocki wrote:
>> The WM1811/WM8994/WM8958 audio CODEC DT bindings specify two optional
>> clocks: "MCLK1", "MCLK2". Add code for getting those clocks in the MFD
>> part of the wm8994 driver so they can be further handled in the audio
>> CODEC part.
>
> I think these are needed only for the codec so how about getting them in
> codec's probe?

The clocks are specified in the (I2C slave device) DT node which corresponds
to the device as a whole and to which binds the MFD driver.  AFAICT those
clocks are only needed by the CODEC sub-driver but in general such clocks
could be used to provide device's system clock used by other functionalities 
than audio.  We are doing something similar for other MFD drivers already
and I would rather stick to one pattern. IMHO it's clearer to see what
device the clocks belong to that way.

-- 
Regards,
Sylwester
