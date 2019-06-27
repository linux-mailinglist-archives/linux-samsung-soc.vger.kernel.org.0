Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 62F1A5846E
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 27 Jun 2019 16:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726431AbfF0O2s (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 27 Jun 2019 10:28:48 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36887 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbfF0O2s (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 27 Jun 2019 10:28:48 -0400
Received: by mail-ot1-f66.google.com with SMTP id s20so2485969otp.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Jun 2019 07:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=GiyIGq67JTc5+DUdTknNYEojZgMQWAxjL9dXZ+msxU8=;
        b=Tkj0vYxUiVB8nL6HdWhzNIWi5RQqPkAFBHlNdJRD85cBv2evrXMRFb25XKjj/fep+Y
         WOQrEwbfzw3qCJrgZXCpgVLbFmnB6hgQFDcijCPWwjvEkCKuDQ7LT4yTKFtDGWoMT56o
         24y4HXItJuoXAFm90WGxfTraR9EUK4FbhGI/5Wo7+eXPYDZMAQ8FPVggiGWWJlTrV3WO
         Q6vCOpPGtrbUIIfJhyMvqDmNPciTanLBCOr/dwtM8sfIPNq0goClxpRHSErj02f86+PM
         ud1TwOWG8ns6EMTqwbLmH5NUmlu2E9E5MsEnUcSsB0SH8uS8eN8D7XOxBOINbzu6mWOe
         /Uxw==
X-Gm-Message-State: APjAAAXb/zd2NMz7tw1L+6qY2ejuBUrbH4CclxV+gL3KUTttyZIL4W9j
        xdV8LX3tKaD4vm/LDyI+T0qejkS5iaMGDhd14QU=
X-Google-Smtp-Source: APXvYqz6Pu3O7LTBddy/VnhjJPjq4a0DMGVKe8qLWg88EII4dc9RSakNvMdyFFgPvcjaqwuQHedlknzR3n5tjxJKd1Y=
X-Received: by 2002:a9d:66c8:: with SMTP id t8mr3694400otm.94.1561645727487;
 Thu, 27 Jun 2019 07:28:47 -0700 (PDT)
MIME-Version: 1.0
From:   Inki Dae <inki.dae@samsung.com>
Date:   Thu, 27 Jun 2019 23:28:11 +0900
Message-ID: <CAAQKjZMdBdD8oEa0cNv78FjrpOqu20ozTTvuPEm_XnVo2gRhCQ@mail.gmail.com>
Subject: [GIT PULL] exynos-drm-next
To:     Dave Airlie <airlied@linux.ie>
Cc:     DRI mailing list <dri-devel@lists.freedesktop.org>,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Dave,

   Just two cleanups - one is to drop drmP.h header, and other is to add
   COMPILE_TEST flag for increasing build test coverage.

   Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 14808a12bdbdc21143eba70ea07830197b3a04ff:

  Merge tag 'drm-next-5.3-2019-06-25' of
git://people.freedesktop.org/~agd5f/linux into drm-next (2019-06-27
12:33:57 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos
tags/exynos-drm-next-for-v5.3

for you to fetch changes up to 156bdac99061b4013c8e47799c6e574f7f84e9f4:

  drm/exynos: trigger build of all modules (2019-06-27 22:30:56 +0900)

----------------------------------------------------------------
- Drop the use of drmP.h header file
   drmP.h header file has been deprecated so this patch drops the use of
   this header, and instead includes appropriate header files required.
 - Add COMPILE_TEST flag
   This patch adds COMPILE_TEST dependency to exynos drm driver to
   increase build test coverage. And also, it includes vmalloc.h
   header file to fix one build warning which is introduced when
   building the Linux kernel using sh.

----------------------------------------------------------------
Sam Ravnborg (2):
      drm/exynos: drop drmP.h usage
      drm/exynos: trigger build of all modules

 drivers/gpu/drm/exynos/Kconfig                |  6 ++--
 drivers/gpu/drm/exynos/exynos5433_drm_decon.c |  7 +++--
 drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  8 ++++--
 drivers/gpu/drm/exynos/exynos_dp.c            | 13 ++++-----
 drivers/gpu/drm/exynos/exynos_drm_crtc.c      |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_dma.c       |  6 ++--
 drivers/gpu/drm/exynos/exynos_drm_dpi.c       |  8 +++---
 drivers/gpu/drm/exynos/exynos_drm_drv.c       | 12 ++++----
 drivers/gpu/drm/exynos/exynos_drm_drv.h       |  8 +++++-
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 21 +++++++-------
 drivers/gpu/drm/exynos/exynos_drm_fb.c        |  6 ++--
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c     |  8 ++++--
 drivers/gpu/drm/exynos/exynos_drm_fimc.c      | 15 +++++-----
 drivers/gpu/drm/exynos/exynos_drm_fimd.c      | 14 +++++----
 drivers/gpu/drm/exynos/exynos_drm_g2d.c       | 11 ++++---
 drivers/gpu/drm/exynos/exynos_drm_gem.c       |  7 +++--
 drivers/gpu/drm/exynos/exynos_drm_gsc.c       | 13 +++++----
 drivers/gpu/drm/exynos/exynos_drm_ipp.c       |  3 +-
 drivers/gpu/drm/exynos/exynos_drm_mic.c       | 22 +++++++-------
 drivers/gpu/drm/exynos/exynos_drm_plane.c     |  4 +--
 drivers/gpu/drm/exynos/exynos_drm_rotator.c   | 10 +++----
 drivers/gpu/drm/exynos/exynos_drm_scaler.c    | 12 ++++----
 drivers/gpu/drm/exynos/exynos_drm_vidi.c      |  9 +++---
 drivers/gpu/drm/exynos/exynos_hdmi.c          | 41 +++++++++++++--------------
 drivers/gpu/drm/exynos/exynos_mixer.c         | 31 ++++++++++----------
 25 files changed, 158 insertions(+), 139 deletions(-)
