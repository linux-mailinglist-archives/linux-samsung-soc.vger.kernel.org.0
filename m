Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68BB7B78CA
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 19 Sep 2019 14:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388639AbfISMAW (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 19 Sep 2019 08:00:22 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:47023 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388613AbfISMAW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 08:00:22 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20190919120021euoutp018c67bd62f9a27a9f6f697e3a7ab5dbe6~F1SnwUMkR0969509695euoutp016
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Sep 2019 12:00:21 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20190919120021euoutp018c67bd62f9a27a9f6f697e3a7ab5dbe6~F1SnwUMkR0969509695euoutp016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1568894421;
        bh=DerDbGAWoiR6Y2JqjtLtX7C9VItryXDf729+0qeS3uY=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=dqYn92odx2yP0HzliXFh0DCn6rXMML3tGhR4UgBel1lHgeUbR2nGJ6FySBqqNTq6l
         lBiP9xRe+RiCaPrUu8gXxey3r7E+MTSZe/+RuyYwoYZWfK38cZXUvwln1dtpAsBPW+
         b6e5z2VekeOygVnMTQbUyAFNKpKFLjfo/T4fcXn0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190919120020eucas1p20bc03814d56763aea29ff973422e227b~F1Sm98Znp1387613876eucas1p2R;
        Thu, 19 Sep 2019 12:00:20 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 5E.62.04374.4DD638D5; Thu, 19
        Sep 2019 13:00:20 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20190919120019eucas1p10c2b11d19c92a1b1000e085a43abaece~F1SmTnfar0334803348eucas1p1Y;
        Thu, 19 Sep 2019 12:00:19 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20190919120019eusmtrp1271d47a0355dd49e526ba8a51b2d8db1~F1Sl6L4XO1335613356eusmtrp1B;
        Thu, 19 Sep 2019 12:00:19 +0000 (GMT)
X-AuditID: cbfec7f5-4ddff70000001116-56-5d836dd4de89
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id E8.F9.04166.2DD638D5; Thu, 19
        Sep 2019 13:00:18 +0100 (BST)
Received: from [106.120.51.75] (unknown [106.120.51.75]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20190919120018eusmtip1912f25e61f8d362b50fbaf09a381e6e3~F1SkxAugH1163111631eusmtip1T;
        Thu, 19 Sep 2019 12:00:18 +0000 (GMT)
Subject: Re: [PATCH v1 7/9] ASoC: samsung: arndale: Add support for WM1811
 CODEC
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com,
        sbkim73@samsung.com, patches@opensource.cirrus.com,
        broonie@kernel.org, lgirdwood@gmail.com, krzk@kernel.org,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        m.szyprowski@samsung.com
From:   Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-ID: <342d08ce-d14a-02b2-a590-13b28c8c5154@samsung.com>
Date:   Thu, 19 Sep 2019 14:00:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
        Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190918144553.GJ10204@ediswmail.ad.cirrus.com>
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0hTcRTud+/uQ21ynZYnC8NlRUaaWXKhkgqpS0FPetqwqReNnMqmlmkU
        LkvNQrLSppCrIDM2bZlapuU01wMd1gwxMkXRXA6rrYe93a6R/33nfN95fIdD45IXhB99MCmV
        VybJE6Wku6i2bbxjiUWhli3VWT1YS6cRY2+XVBHsxf5BkrXkGBB7pbWDYM3maor9YsnFWMPA
        K4ItMTdhrK71DcXaxx4SbE5jK8V2VjiwNWKu2p5Ncvc0byjOUJlHcneuH+eKy/4g7lxNJeLs
        Bv+t1D73VXF84sF0XhkSccA9oWvoGpkyho48abyAn0CNKB/RNDDLoXRkZj5ypyVMBYKe/hFc
        CBwISi1FmBDYEVw2GycYN1eFbtSInFjC3ECgHZgniGwICs9qSSfhzWwH7fdnmBP7MMvgo6nH
        1QlnjBgMD3YRToJkQuHs43OuTmImAnof9LoKRMx8eNvc5tLMYPbAp74WQtB4wdPLgyIndmNW
        Q17OGdcwnPGFbMdNQsBzoc5W5vIAjI2C8eZ8TFg7ErrL1ZPYG6ymGkrAc+B5UYFIKFAjKGh4
        TQlBIYK3pnIkqFZCi6mTcJ4MZxZB1f0QIb0WjPpSXLikJ3TbvIQlPOF8bfFkWgy5pySCOhB+
        VBZPruAHZwb/iAqRVDPFmmaKHc0UO5r/c8uRqBL58mkqRTyvCkviDwer5ApVWlJ8cGyywoAm
        Pu35b9PnetT0M8aIGBpJp4u/LcyWSQh5uipDYURA41IfcdmKiZQ4Tp5xlFcmRyvTEnmVEc2m
        RVJfcea0vigJEy9P5Q/xfAqv/MditJvfCdS+/lTD7oDhqA+PdmT1rjNbZ3KB+/SjMbF7v264
        lTyceax+S5uj1xI5rF6cOrRJv3GsS+ujC29OizgZsm7OL3Xd/Ok79fs9/FfmkLWS8OrTGb/1
        J9t3vZ/1clx6KTJFl8xprXtksooF5VeDZL8stbEBR95Fs4HbwoqIsLubuz9lhUdJRaoEeWgQ
        rlTJ/wK48vSOZQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsVy+t/xu7qXcptjDS516lpcuXiIyWLjjPWs
        FlMfPmGzuNK6idFi/pFzrBbnz29gt/h2pYPJYtPja6wWM87vY7JYe+Quu8Xn9/tZLVr3HmG3
        uLjiC5MDr8eGz01sHjtn3WX32LSqk81j85J6j+lz/jN69G1ZxejxeZNcAHuUnk1RfmlJqkJG
        fnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsbVZ4vZCt4zVpzYO4W5
        gXEvYxcjJ4eEgInE2jeHgGwuDiGBpYwSb5fvYe9i5ABKSEnMb1GCqBGW+HOtiw2i5jWjxM4j
        bUwgCWGBIImFv06B2SICRhIfj99iAiliFjjEJPHmw3J2iI4vjBILri8Aq2ITMJToPdoHtppX
        wE7i3p57YHEWAVWJ+wePsYLYogIREod3zIKqEZQ4OfMJC4jNKWAr0dnazQZiMwuoS/yZd4kZ
        whaXaPqykhXClpfY/nYO8wRGoVlI2mchaZmFpGUWkpYFjCyrGEVSS4tz03OLDfWKE3OLS/PS
        9ZLzczcxAqN427Gfm3cwXtoYfIhRgINRiYf3h3pTrBBrYllxZe4hRgkOZiUR3jmmQCHelMTK
        qtSi/Pii0pzU4kOMpkDPTWSWEk3OByaYvJJ4Q1NDcwtLQ3Njc2MzCyVx3g6BgzFCAumJJanZ
        qakFqUUwfUwcnFINjJlqCWJp58wdpfOvN7Nw/F3s/Ytdr+HAmw/34u87h0fva2KYecB/huPv
        XA9tvb1fDHKYgr1qa16vmanXoz19p4TNyxfB4XKrsmb2dzCpr2WcELDru5XYXHmRVxfvC/1t
        PdbwK3uKvPy03YoTH9ubr1rG2vH/83rzHotd2/z/Z7Esu3P3r+zDvUosxRmJhlrMRcWJAB51
        dOn4AgAA
X-CMS-MailID: 20190919120019eucas1p10c2b11d19c92a1b1000e085a43abaece
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190918104705eucas1p1c01dc05bff199188677915e2bb8f7472
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190918104705eucas1p1c01dc05bff199188677915e2bb8f7472
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
        <CGME20190918104705eucas1p1c01dc05bff199188677915e2bb8f7472@eucas1p1.samsung.com>
        <20190918104634.15216-8-s.nawrocki@samsung.com>
        <20190918144553.GJ10204@ediswmail.ad.cirrus.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 9/18/19 16:45, Charles Keepax wrote:
> If your removing the of_match_ptr below I think the
> __maybe_unused should be removed as well.

Good point, I will remove the now unneeded __maybe_unused as well.

--
Thanks,
Sylwester

