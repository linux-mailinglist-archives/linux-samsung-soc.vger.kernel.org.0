Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08DCF5E97D6
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 26 Sep 2022 04:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232938AbiIZCHd (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 25 Sep 2022 22:07:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230128AbiIZCHb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 25 Sep 2022 22:07:31 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E90FC275DA
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Sep 2022 19:07:28 -0700 (PDT)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220926020726epoutp03fcfad6a053aacf80df7e0b24e3243999~YRu0dNjBr0353603536epoutp03i
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Sep 2022 02:07:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220926020726epoutp03fcfad6a053aacf80df7e0b24e3243999~YRu0dNjBr0353603536epoutp03i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1664158046;
        bh=Mpg7/mwmu0u6sTXfXsAp22NnBHYNU7QE+pyJNfOWwgA=;
        h=From:To:Cc:Subject:Date:References:From;
        b=chDxqVEix78NG4sTOfQLQhg/6TK1rjDYX9DpkGGQes23ZahUL0dDJErpXNiSWStCb
         FO/+D+Rmr+Ky1+neeOCWlGrTsqEWHlT+xe54kYr09nsZF9lz94NG/xXlgcxv5wPOnI
         fgFLxc2I0P/vUSX4jxQpOEUk3a/U82CkZQrTo8yU=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20220926020726epcas1p25325023c5392e3a8cf4708e01ec1da79~YRu0OZFoL1800118001epcas1p2g;
        Mon, 26 Sep 2022 02:07:26 +0000 (GMT)
Received: from epsmges1p4.samsung.com (unknown [182.195.36.136]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 4MbR3J6CTZz4x9Q9; Mon, 26 Sep
        2022 02:07:24 +0000 (GMT)
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
        epsmges1p4.samsung.com (Symantec Messaging Gateway) with SMTP id
        46.2E.07691.B5901336; Mon, 26 Sep 2022 11:07:23 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20220926020723epcas1p29e968d4d47ae3b95211c219fcd045d02~YRuxc9QJ41838818388epcas1p2H;
        Mon, 26 Sep 2022 02:07:23 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20220926020723epsmtrp2d5f11098fe15e0994e4410a84e0c342b~YRuxcIiqq2290722907epsmtrp2G;
        Mon, 26 Sep 2022 02:07:23 +0000 (GMT)
X-AuditID: b6c32a38-0cdff70000021e0b-42-6331095b2442
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        B4.47.14392.B5901336; Mon, 26 Sep 2022 11:07:23 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220926020723epsmtip2e3a17d1cc687976c3ebc4ebeb5bb6543~YRuxRY_o70998709987epsmtip2T;
        Mon, 26 Sep 2022 02:07:23 +0000 (GMT)
From:   Inki Dae <inki.dae@samsung.com>
To:     airlied@linux.ie, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next
Date:   Mon, 26 Sep 2022 11:07:23 +0900
Message-Id: <20220926020723.270065-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLKsWRmVeSWpSXmKPExsWy7bCmnm40p2GywdJ7yha9504yWfzfNpHZ
        4srX92wWM87vY3Jg8dj7bQGLx/ZvD1g97ncfZ/L4vEkugCUq2yYjNTEltUghNS85PyUzL91W
        yTs43jne1MzAUNfQ0sJcSSEvMTfVVsnFJ0DXLTMHaKWSQlliTilQKCCxuFhJ386mKL+0JFUh
        I7+4xFYptSAlp8C0QK84Mbe4NC9dLy+1xMrQwMDIFKgwITvjwYZbbAWLuSuezljJ3MB4hrOL
        kZNDQsBE4uOHBrYuRi4OIYEdjBLPXv9jhXA+MUocaWpkhHC+MUp8aFrCAtMy89IBFojEXkaJ
        xhnPoKq+MEqcvf2LEaSKTUBVYuKK+2wgtgiQ/XbSY2YQm1nATeLP0rNgk4QFlCV2X9/HCmKz
        ANV8fbOKqYuRg4NXwEriy2dLiGXyQMu+s4PYvAKCEidnPmGBGCMv0bx1NjPIXgmBTewSX798
        ZYJocJE4s+g5M4QtLPHq+BZ2CFtK4vO7vWwQDZMZJe5cX8EC4cxglDj88zojRJWxxP6lk8Gu
        YBbQlFi/Sx8irCix8/dcRojNfBLvvvawgpRICPBKdLQJQZQoSRy7eANqioTEhSUT2SBsD4mV
        U+aB3SAkECuxbepklgmM8rOQ/DMLyT+zEBYvYGRexSiWWlCcm55abFhgAo/W5PzcTYzgdKdl
        sYNx7tsPeocYmTgYDzFKcDArifCmXNRNFuJNSaysSi3Kjy8qzUktPsRoCgzgicxSosn5wISb
        VxJvaGJpYGJmZGxiYWhmqCTO2zBDK1lIID2xJDU7NbUgtQimj4mDU6qBaUZ6mNTdPH7llAPa
        2Q2MZzUeT9rgsrksd96VhNsHr8YujP5dO0eqzlfv4IziaH/hJWt7tqi99XouZhq1R71u0hcn
        nqTA3ERPxoqd/3dFdXjxO2e945obt7W87tEqLhU+Wy/j9K4zJ0r4l3vZnZruuu2d1L+9aSXB
        sqnpbYuuPw9x3nopaIpw2qqLEru3tXeVZAp1uGhEiKT9+vhoSr21RIyBYP+JGbGnjulwPxWo
        cnkZzcUmsoOjpWXrDcZ9T5SC+lcsuP9L5UphrPDlA8zuHRXe14veNZrEL928vk5XlZ+Z821U
        7V9vcyGdHU8PXPq8Y/4lh7BCc1nmcxP23t1bG1Rr6XntjHROwNcduxcosRRnJBpqMRcVJwIA
        /Rc6OAAEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBLMWRmVeSWpSXmKPExsWy7bCSvG40p2GyweI9PBa9504yWfzfNpHZ
        4srX92wWM87vY3Jg8dj7bQGLx/ZvD1g97ncfZ/L4vEkugCWKyyYlNSezLLVI3y6BK+PBhlts
        BYu5K57OWMncwHiGs4uRk0NCwERi5qUDLF2MXBxCArsZJWZ+mMHWxcgBlJCQ2LKVA8IUljh8
        uBii5BOjxM8XU9lBetkEVCUmrrjPBmKLCKhLPLi8kBHEZhbwkHi/ZzVYjbCAssTu6/tYQWwW
        oPqvb1YxgczkFbCS+PLZEuIEeaATvoOV8woISpyc+YQFYoy8RPPW2cwTGPlmIUnNQpJawMi0
        ilEytaA4Nz232LDAMC+1XK84Mbe4NC9dLzk/dxMjOPC0NHcwbl/1Qe8QIxMH4yFGCQ5mJRHe
        lIu6yUK8KYmVValF+fFFpTmpxYcYpTlYlMR5L3SdjBcSSE8sSc1OTS1ILYLJMnFwSjUwiUmk
        vltyM0binIdb6eVzVRymVUHrF0lUr1fftmRxi53w9IVmjRF/PXNm6RZvmO/pxR6+IzPvy0vZ
        vbeddrzcY3pIaMncl+f8n39IvbE1dY26SOP7rcHK7IwzFEzvbd46e4fUMRejtrZJAcVrV+oG
        V97v64tnlglteHL6S9bS6pela+UO83N6c14+YvP3bAHD28vP5z2IS5i24/WWybmurtkrGAP3
        T9Gd+dz4pcOS4iUdyVM9zRRXCj5Yoa1kbLUrvqwnfe15k8ees6UVDs93+Tzb79PfpqgHvqZP
        VBt1yuyPxAlNsql3zXKVMuzUPcJQtu1BvlLvT67kZsFVgvn94ubP9mbKrGaauGnmi47FSizF
        GYmGWsxFxYkAFWDBE6sCAAA=
X-CMS-MailID: 20220926020723epcas1p29e968d4d47ae3b95211c219fcd045d02
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220926020723epcas1p29e968d4d47ae3b95211c219fcd045d02
References: <CGME20220926020723epcas1p29e968d4d47ae3b95211c219fcd045d02@epcas1p2.samsung.com>
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Dave and Daniel,

   Sorry for late. Just one cleanup and fixup which corrects return type.

Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 320305923c88258ce50c75bf721e9bf2e420ab27:

  Merge tag 'du-next-20220907' of git://linuxtv.org/pinchartl/media into drm-next (2022-09-23 03:52:08 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v6.1

for you to fetch changes up to 1261255531088208daeca818e2b486030b5339e5:

  drm/exynos: Fix return type for mixer_mode_valid and hdmi_mode_valid (2022-09-26 10:13:00 +0900)

----------------------------------------------------------------
Cleanup
- Use drm_display_info.is_hdmi instead of drm_detect_hdmi_monitor()
  for efficiency.
Fixup
- Correct return type of mixer_mode_valid and hdmi_mode_valid functions.
  This was reported by Dan Carpenter, https://github.com/ClangBuiltLinux/linux/issues/1703

----------------------------------------------------------------
Nathan Huckleberry (1):
      drm/exynos: Fix return type for mixer_mode_valid and hdmi_mode_valid

hongao (1):
      drm/exynos: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi

 drivers/gpu/drm/exynos/exynos_hdmi.c  | 6 +++---
 drivers/gpu/drm/exynos/exynos_mixer.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)
