Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E79B3A490D
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  1 Sep 2019 14:06:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbfIAMGZ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 1 Sep 2019 08:06:25 -0400
Received: from mail-pg1-f182.google.com ([209.85.215.182]:42157 "EHLO
        mail-pg1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726260AbfIAMGZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 1 Sep 2019 08:06:25 -0400
Received: by mail-pg1-f182.google.com with SMTP id p3so5824220pgb.9
        for <linux-samsung-soc@vger.kernel.org>; Sun, 01 Sep 2019 05:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=nB/K4fFCOmhRTBELx0mrWczJtN91X4L47iUtpc1Dn5U=;
        b=ZQ/uvY81mcA/CqiG7bgF3OOfTCLK0bVAlFEMHNrBoUUjO8aIwroAQ5ehw14o2lRqeK
         XqA9ZMYmVShfB3QHrNJO4jeq6N+H3Cv7ZQRSS4IlG4mnzX1KPtckhrRk/v/R17aJTJcV
         JOC17U645BQY9fiZCOp+gcIPGXWsM+1oYvB4rtIltktOkqVWzyUDWmcLAp1/2oEb0/BR
         hp8uFpxlT2J8a4kMLwSiLyI5z2SPXqwXRkKSPuJL+H38hGNqRMqNad9s5JOdbtXoZtFh
         P+cqkg4Y22x8t2Sui/NpO0KkiSfBEj1KiDlWL9vKPIoOHcyR9ULjaupq4nAtU/3Rvqhe
         5+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=nB/K4fFCOmhRTBELx0mrWczJtN91X4L47iUtpc1Dn5U=;
        b=dGjrA0BP9r1kJowCfd392F9DMiev51AtuaWJ/nIKCCXP3iKMY/eTKH2OW9Wm1pHjbc
         IqfQ15vN1E+BzblhYCwRJK0Jv4fsQ12u2bylQLZhEcOnAdXTzSYRdIyD1tHNkuQ+bPiK
         RP+pDiQqR6kuUITRLNAJcKIEqNCU56YdqAzIRKBYAkzh+gfvxN3TA0KhKtieb6OzVpIS
         dRe4UNp4pyMbuL+Z/BbEkrIRX2xCDDaifHZG84le0794QV1Iaaiwxip82hAMAewrlr3T
         jD+Q0bUamKgfwNeIrck23fbe/dYFz9pX5/cS20vdfzzBvL6yivSpxiaKxVSHdAO+804F
         OClg==
X-Gm-Message-State: APjAAAWWD6LQahw23zVFD4M2C8+K1+lyC/Byle4QCS2qDzz97SsUaQeC
        EFClSpWxAhdvvLu0fE0vEZo=
X-Google-Smtp-Source: APXvYqySHThX8Km3wN6rbbaMlbzLhS/eo0kCnWMSQXxIyvf7bgSza0WqR/n8eynbCVmfIoGxyDr0Nw==
X-Received: by 2002:a62:7d0d:: with SMTP id y13mr27898710pfc.150.1567339584021;
        Sun, 01 Sep 2019 05:06:24 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
        by smtp.gmail.com with ESMTPSA id m4sm11273538pgs.71.2019.09.01.05.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2019 05:06:23 -0700 (PDT)
From:   Inki Dae <daeinki@gmail.com>
To:     airlied@linux.ie
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next
Date:   Sun,  1 Sep 2019 21:06:19 +0900
Message-Id: <20190901120619.3992-1-daeinki@gmail.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Dave,

   Just one patch which drops the use of drmP.h header file.

   Please kindly let me know if there is any problem.

Thanks,
INki Dae

The following changes since commit 578d2342ec702e5fb8a77983fabb3754ae3e9660:

  Merge tag 'drm-next-5.4-2019-08-23' of git://people.freedesktop.org/~agd5f/linux into drm-next (2019-08-27 17:22:15 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-v5.4

for you to fetch changes up to 226024b16685522ef8a97d881cffb90500ef1903:

  drm/exynos: drop use of drmP.h (2019-09-01 20:55:12 +0900)

----------------------------------------------------------------
- JUst one cleanup which drops the use of drmP.h header file.

----------------------------------------------------------------
Sam Ravnborg (1):
      drm/exynos: drop use of drmP.h

 drivers/gpu/drm/exynos/exynos_drm_drv.c     | 8 ++++++++
 drivers/gpu/drm/exynos/exynos_drm_fimc.c    | 2 ++
 drivers/gpu/drm/exynos/exynos_drm_gsc.c     | 2 ++
 drivers/gpu/drm/exynos/exynos_drm_ipp.c     | 5 ++++-
 drivers/gpu/drm/exynos/exynos_drm_ipp.h     | 2 --
 drivers/gpu/drm/exynos/exynos_drm_rotator.c | 2 ++
 drivers/gpu/drm/exynos/exynos_drm_scaler.c  | 1 +
 7 files changed, 19 insertions(+), 3 deletions(-)
