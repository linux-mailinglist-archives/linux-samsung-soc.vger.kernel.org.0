Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 495A96E4667
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 17 Apr 2023 13:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbjDQL2Q (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 17 Apr 2023 07:28:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbjDQL2P (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 Apr 2023 07:28:15 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B93712F
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Apr 2023 04:27:29 -0700 (PDT)
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20230417100626epoutp0314fafdde8dafefba93e66b645223517d~WsOAAfpa72992929929epoutp03I
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Apr 2023 10:06:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20230417100626epoutp0314fafdde8dafefba93e66b645223517d~WsOAAfpa72992929929epoutp03I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1681725987;
        bh=N4bRYS978WWbvi4Td8kqC5I4IZs8S6hpZPe0OT27u+0=;
        h=From:To:Cc:Subject:Date:References:From;
        b=oJMJOplxahL1cnTGyUk4qLrhfktE9TotMNB+v+rhDkva6SXQuYhYy3DcMVLtJ1b+b
         VwNIIUc7kDC34DPOwY+w2MSw9zBvXpSSX2D4U2vBcNHq7mvTNCn+YYwjAyli8/ldF2
         0rn7DxIOxiUE2Hu66SAelMGCccpkN6ZyCb/3ElOc=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p4.samsung.com (KnoxPortal) with ESMTP id
        20230417100626epcas1p4e1da91fdfdff6990b7c7b43717765a1c~WsN-lGpk80682806828epcas1p4W;
        Mon, 17 Apr 2023 10:06:26 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.36.132]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4Q0N4K1N7mz4x9Py; Mon, 17 Apr
        2023 10:06:25 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
        F8.95.09668.12A1D346; Mon, 17 Apr 2023 19:06:25 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
        20230417100624epcas1p3d39ab3b88da18da0b365d67ad1062086~WsN_EEzZ31051010510epcas1p3b;
        Mon, 17 Apr 2023 10:06:24 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20230417100624epsmtrp28ad4a60101cc3657a563b183df403a94~WsN_DVVjo1396513965epsmtrp2d;
        Mon, 17 Apr 2023 10:06:24 +0000 (GMT)
X-AuditID: b6c32a36-8cbff700000025c4-6a-643d1a21c493
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        A8.E5.08279.02A1D346; Mon, 17 Apr 2023 19:06:24 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20230417100624epsmtip204cb14f9eac1089e33da00535a2e9041~WsN96j7Ep1489214892epsmtip2e;
        Mon, 17 Apr 2023 10:06:24 +0000 (GMT)
From:   Inki Dae <inki.dae@samsung.com>
To:     airlied@linux.ie, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL v2] exynos-drm-next
Date:   Mon, 17 Apr 2023 19:06:24 +0900
Message-Id: <20230417100624.35229-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrHKsWRmVeSWpSXmKPExsWy7bCmnq6ilG2KwelzHBa9504yWfzfNpHZ
        4srX92wWM87vY3Jg8dj7bQGLx/ZvD1g97ncfZ/L4vEkugCUq2yYjNTEltUghNS85PyUzL91W
        yTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMHaKWSQlliTilQKCCxuFhJ386mKL+0JFUh
        I7+4xFYptSAlp8C0QK84Mbe4NC9dLy+1xMrQwMDIFKgwITvjwMIG9oIZfBWn3naxNzB+4O5i
        5OSQEDCR+Lh6H3sXIxeHkMAORokVTT+hnE+MEj3bW5ggnG+MEpt23GKEaTm7+gNU1V5GiT2n
        70M5Xxgl+mZNZgapYhNQlZi44j4biC0CZL+d9BgszizgJvFn6VkWEFtYQE1i06X7TCA2C1DN
        33ONYHFeAUuJyfveM0Fsk5eYeek7O0RcUOLkzCcsEHPkJZq3zmYGWSwhsIldorvlF9R5LhIL
        z+yDsoUlXh3fwg5hS0l8freXDaJhMqPEnesrWCCcGYwSh39eh+owlti/dDLQag6gFZoS63fp
        Q4QVJXb+nssIsZlP4t3XHlaQEgkBXomONiGIEiWJYxdvQE2RkLiwZCIbhO0hseNVK9gzQgKx
        EsvWfWGfwCg/C8k/s5D8Mwth8QJG5lWMYqkFxbnpqcWGBUbweE3Oz93ECE54WmY7GCe9/aB3
        iJGJg/EQowQHs5II7xlXqxQh3pTEyqrUovz4otKc1OJDjKbAEJ7ILCWanA9MuXkl8YYmlgYm
        ZkbGJhaGZoZK4rxfnmqnCAmkJ5akZqemFqQWwfQxcXBKNTC1/zH/JjInuLh3Rpru6ja2HXM+
        mMboN4QWnj2zssrU3eDwHYnS3ey7ol5dKvEQ3/dnMu+vCSKPd/gs9issMV5zMXvFyUlCizY+
        m56yZ9fxoKbHywqvrrZyKl1x4q1BVcUx4ytNfus937Z8uJ+hcGOZ6kp3+Vy/rZ93CnffZN9i
        cMYpcMW/V18uX1keML2iy3fhPE1dGelbh/iu2N7L141M+OLq59tb8OLBb43E+6bW/hxcN8y9
        M2XNDyqeYHio/f2HzoGMmsM9N+8mWcj/jUyKmzNX+Z9jd9yx61kflwc5H5l+VvWk4eKnIke0
        wsz431WLsplGHvvzv53FoW0FB3v9KdXvi5XzWg57dU2dv0JEiaU4I9FQi7moOBEAyy+8rgEE
        AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJLMWRmVeSWpSXmKPExsWy7bCSvK6ClG2Kwf1dJha9504yWfzfNpHZ
        4srX92wWM87vY3Jg8dj7bQGLx/ZvD1g97ncfZ/L4vEkugCWKyyYlNSezLLVI3y6BK+PAwgb2
        ghl8FafedrE3MH7g7mLk5JAQMJE4u/oDexcjF4eQwG5GiQV9/YxdjBxACQmJLVs5IExhicOH
        iyFKPjFK/Pm8ngWkl01AVWLiivtsILaIgLrEg8sLGUFsZgEPifd7VrOD2MICahKbLt1nArFZ
        gOr/nmsE6+UVsJSYvO89E8QN8hIzL31nh4gLSpyc+YQFYo68RPPW2cwTGPlmIUnNQpJawMi0
        ilEytaA4Nz232LDAMC+1XK84Mbe4NC9dLzk/dxMjOPS0NHcwbl/1Qe8QIxMH4yFGCQ5mJRHe
        M65WKUK8KYmVValF+fFFpTmpxYcYpTlYlMR5L3SdjBcSSE8sSc1OTS1ILYLJMnFwSjUwTd2o
        M8dXTeyKlv7uu4+2MJba+yYZPPtwXK3b+thptZfznthstP9Vm/JyQVuc4d3CtU5pfNXG06at
        LDAr2iDscSAvKYA9uDiuaCW/8+l1/xqzN56o+bXA7YzT+uDwVenmwizvS9okztR8Tot9d+Kt
        ZVb3h/Bbh+MNts+JjFW8ZPrXgK1DI0F4ieq+G30cGswbJsqV7J2+fGLsLfErsy78eez9+PBV
        5aN2geLbJD0bmHo//jW8VHKvuXUvm/p1iz1qBt/c1+9P8zMLnHb1fvWvU8GnNzPOmfdluui5
        /NP7LF7KWkYsfTzD9retMgtH1s+L+qxKyg/rb8do32CU4zm9+OuRoosVM6uldBfG+2z+ocRS
        nJFoqMVcVJwIAMJ3j0GsAgAA
X-CMS-MailID: 20230417100624epcas1p3d39ab3b88da18da0b365d67ad1062086
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20230417100624epcas1p3d39ab3b88da18da0b365d67ad1062086
References: <CGME20230417100624epcas1p3d39ab3b88da18da0b365d67ad1062086@epcas1p3.samsung.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Dave and Daniel,

   Sorry for late. Just one patch series which converts Exynos's fbdev code
   to struct drm_client.

Please let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit e82c98f2ca439356d5595ba8c9cd782f993f6f8c:

  Merge tag 'amd-drm-next-6.4-2023-04-14' of https://gitlab.freedesktop.org/agd5f/linux into drm-next (2023-04-17 10:54:59 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v6.4-2

for you to fetch changes up to 49953b70e7d38dd714f4cf22224e8a7ce14f3c48:

  drm/exynos: Implement fbdev emulation as in-kernel client (2023-04-17 16:47:55 +0900)

----------------------------------------------------------------
A patch series for implementing fbdev emulation as in-kernel client.

- This patch series refactors fbdev callbacks to DRM client functions and
  simplifies fbdev emulation initialization including some code cleanups.
  The changes make fbdev emulation behave like a regular DRM client.

----------------------------------------------------------------
Thomas Zimmermann (5):
      drm/exynos: Remove exynos_gem from struct exynos_drm_fbdev
      drm/exynos: Remove struct exynos_drm_fbdev
      drm/exynos: Remove fb_helper from struct exynos_drm_private
      drm/exynos: Initialize fbdev DRM client
      drm/exynos: Implement fbdev emulation as in-kernel client

 drivers/gpu/drm/exynos/exynos_drm_drv.c   |  13 +--
 drivers/gpu/drm/exynos/exynos_drm_drv.h   |   2 -
 drivers/gpu/drm/exynos/exynos_drm_fb.c    |   2 -
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c | 174 +++++++++++++++---------------
 drivers/gpu/drm/exynos/exynos_drm_fbdev.h |  20 +---
 5 files changed, 94 insertions(+), 117 deletions(-)
