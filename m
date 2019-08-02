Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B38807EF54
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  2 Aug 2019 10:31:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729068AbfHBIbc (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 2 Aug 2019 04:31:32 -0400
Received: from mailout3.samsung.com ([203.254.224.33]:58152 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727738AbfHBIbc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 04:31:32 -0400
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20190802083128epoutp035df530d833577b121c28ab344301bdc8~3DeitcLjg1383713837epoutp030
        for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Aug 2019 08:31:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20190802083128epoutp035df530d833577b121c28ab344301bdc8~3DeitcLjg1383713837epoutp030
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1564734688;
        bh=yqpuOWzrDPMFoZJsbFTNx74DMDad0yREIqUb6smTkoM=;
        h=From:To:Cc:Subject:Date:References:From;
        b=Uow61PUCBKS1r1H9wJwmJO6nETFZiHLwdI5h1vtekzrBiKd7+XX/69cQwEh/EcwBI
         DwZDHeWFAwdoj5nMFNfOinz9A4uvK8bJQDgTpGHSrz/KUbAIzfxlf4gVuYs+N3hg5U
         5OPsvbv51slumZX60I6jbesqOffRyyd4qMjdr71c=
Received: from epsnrtp2.localdomain (unknown [182.195.42.163]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTP id
        20190802083128epcas1p22cb261f98be8d12fb6aa730514709b97~3Deic7FqU1853418534epcas1p2H;
        Fri,  2 Aug 2019 08:31:28 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.153]) by
        epsnrtp2.localdomain (Postfix) with ESMTP id 460L3d6CpXzMqYkg; Fri,  2 Aug
        2019 08:31:25 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
        epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
        2F.17.04066.AD4F34D5; Fri,  2 Aug 2019 17:31:22 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
        epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20190802083122epcas1p298fb8295a77e3adfa839eec619318591~3DedD7ft02569325693epcas1p2B;
        Fri,  2 Aug 2019 08:31:22 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20190802083122epsmtrp2b3eab5e99ef77855b0a72f82709d8ff3~3Dec68GBg2981529815epsmtrp2r;
        Fri,  2 Aug 2019 08:31:22 +0000 (GMT)
X-AuditID: b6c32a37-e3fff70000000fe2-12-5d43f4da43a7
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        5D.8F.03706.AD4F34D5; Fri,  2 Aug 2019 17:31:22 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.211]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20190802083122epsmtip2b37799ed9cda0981c2a7fef097fcacd1~3DecxKIVK0621006210epsmtip2H;
        Fri,  2 Aug 2019 08:31:22 +0000 (GMT)
From:   Inki Dae <inki.dae@samsung.com>
To:     airlied@linux.ie
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-fixes
Date:   Fri,  2 Aug 2019 17:33:11 +0900
Message-Id: <1564734791-745-1-git-send-email-inki.dae@samsung.com>
X-Mailer: git-send-email 2.7.4
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUhTYRTGeXfddv3YuN5ZnSRFrxopTHed06toiYpI+YcUBAlrXtxlmvtq
        d36FkUJEmZWzAikqLQ3TwNA+NFR0QpKhJRiZCqaFqYFF6pBMavMq9d+Pc57nPIf3PThGdosD
        8UKznbOZWSMl8fF6PhipVE6upmtVixtJzJXR1yJmfO27hKl/2ydKxbJeuD6Js2YuD4myVjqC
        c7DcouQCjtVzthDOnG/RF5oNKdSRY7p0nSZeRSvpRCaBCjGzJi6FysjOUWYWGt1BVEgJayx2
        l3JYnqdiDibbLMV2LqTAwttTKM6qN1oTrdE8a+KLzYbofIspiVapYjVuYV5RwVTbNGZ1yssG
        Zz9LK9G6bzXyxoGIgyqHS1yNfHCS6ELQNHxX7GmQxE8EjzoMArsQfJs7sWOY37gmFQy9CBbO
        N2+7VxH01NVKPSoJEQGOlhmJhwOIABh6uLnFGJEJv5tHvKoRjiuIcOh3yD1lL7e8tX5J5GEZ
        kQbXnUtiISwYPo5ewjzzgXgvhsrbw1KhkQELN50igRWwNPR0ux4IK8u9EoFLYX55fisLiApw
        3SkTUA1jLXoPYkQktL+MEcSh0L1xBwlLymF5rUYsqGVw8QIpSCh4NTaBBAZ41+TYzsmCxaVZ
        qUdOElpob8urRUG3/s1vQKgV7easvMnA8bRV/f//dKCts4lK6EJPRrOdiMAR5Sdr+ZKmJcVs
        CV9uciLAMSpAdlWWriVlerb8DGez6GzFRo53Io375RxY4K58i/sIzXYdrYlVq9VMHB2voWlq
        j6xxndGShIG1c0UcZ+VsOz4R7h1Yiex+0xsPhvclr9+AuIjjfQ3IqGr0jWUWD0zVGFyKQWZi
        7+AI9qtNcS6ookHdfzIsYyA5/DAdprLypD3ufuXAIU7UUoViNaXhdR9GvzqXg9c2zypOy+ti
        cv88ji7p/HFK1/Rm9Si237/pXu9cT6fyWap/aBurWGCCIrIn5eOI8uILWDoKs/HsX/ewn1lM
        AwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNJMWRmVeSWpSXmKPExsWy7bCSvO6tL86xBnN28Fn0njvJZHHl63s2
        ixnn9zE5MHts//aA1eN+93Emj8+b5AKYo7hsUlJzMstSi/TtErgybq++w1xwiK/i8MPH7A2M
        P7i7GDk5JARMJJ797mfvYuTiEBLYzSgxZ/slxi5GDqCEhMSWrRwQprDE4cPFECWfGCUOtsxg
        AellE1CVmLjiPhuILSIgInF82V8wm1nAQ+L9ntXsIL3CAioSBybygYRZgMpXzXjFBGLzCjhJ
        TD70ihXiBDmJm+c6mScw8ixgZFjFKJlaUJybnltsWGCYl1quV5yYW1yal66XnJ+7iREcBFqa
        OxgvL4k/xCjAwajEwxtQ4RwrxJpYVlyZe4hRgoNZSYS3jxcoxJuSWFmVWpQfX1Sak1p8iFGa
        g0VJnPdp3rFIIYH0xJLU7NTUgtQimCwTB6dUA2OC0CHNxu/ighNmNp5tiZhXKMUmbeLw0kCI
        O17b7YJKqvq5FP0s7l7O2+dVMzyNI65Zb9dbrxec/6NIXmySwP41HG6S735Ye71YE67uy/G1
        yvp61P/Ys06tplNnLFaxfiJiP4mBP+6qnKWw/M7JCasCV6x6e0ZuR4AGn+nLdrvTk1ersr8y
        UmIpzkg01GIuKk4EADd7ITX+AQAA
X-CMS-MailID: 20190802083122epcas1p298fb8295a77e3adfa839eec619318591
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20190802083122epcas1p298fb8295a77e3adfa839eec619318591
References: <CGME20190802083122epcas1p298fb8295a77e3adfa839eec619318591@epcas1p2.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Dave,

   Just two fixups which fixes undefined reference error with NOMMU
   configuration and potential infinite issue of scaler module,
   and two trivial cleanups.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit f8981e0309e9004c6e86d218049045700c79d740:

  Merge tag 'msm-fixes-2019_08_01' of https://gitlab.freedesktop.org/drm/msm into drm-fixes (2019-08-02 10:17:25 +1000)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-fixes-for-v5.3-rc3

for you to fetch changes up to 1bbbab097a05276e312dd2462791d32b21ceb1ee:

  drm/exynos: fix missing decrement of retry counter (2019-08-02 16:50:18 +0900)

----------------------------------------------------------------
- Two cleanup patches
  . use dev_get_drvdata for readability instead of platform_get_drvdata
  . remove redundant assignment to node.
- Two fixup patches
  . fix undefined reference to 'vmf_insert_mixed' with NOMMU configuration.
  . fix potential infinite spin issue by decrementing 'retry' variable in
    scaler_reset function of exynos_drm_scaler.c

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/exynos: add CONFIG_MMU dependency

Colin Ian King (2):
      drm/exynos: remove redundant assignment to pointer 'node'
      drm/exynos: fix missing decrement of retry counter

Fuqian Huang (1):
      drm/exynos: using dev_get_drvdata directly

 drivers/gpu/drm/exynos/Kconfig             | 1 +
 drivers/gpu/drm/exynos/exynos_drm_fimc.c   | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_g2d.c    | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_gsc.c    | 2 +-
 drivers/gpu/drm/exynos/exynos_drm_scaler.c | 4 ++--
 5 files changed, 6 insertions(+), 5 deletions(-)
