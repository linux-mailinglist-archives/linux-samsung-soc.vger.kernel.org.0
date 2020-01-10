Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D28251374B2
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 10 Jan 2020 18:24:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726618AbgAJRYB (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 10 Jan 2020 12:24:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:38814 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726477AbgAJRYA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 10 Jan 2020 12:24:00 -0500
Received: from localhost.localdomain (unknown [83.218.167.187])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F05B2206ED;
        Fri, 10 Jan 2020 17:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578677040;
        bh=WbF1AEdeIfupUSzrl+6OSHyHQZVRtMKt2d/fK42OGXM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=0ZcL9cBX5k3yEjeklZ2idTBQF3CNRiH/eqb65dih0hS2PjXHmrnJoyETHi1HwUaSy
         ERaE2D36LvbN/MLeyggbk0V5p7AV7SNJAbz/zlguidesHdUxdnSR9HIJXzuIPGoaye
         FSVZKNNQbYFOezyQVNokvVyVZ6rpTD43meaqQSdc=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL 1/3] soc: samsung: Pull for v5.6
Date:   Fri, 10 Jan 2020 18:23:30 +0100
Message-Id: <20200110172334.4767-2-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110172334.4767-1-krzk@kernel.org>
References: <20200110172334.4767-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit e42617b825f8073569da76dc4510bfa019b1c35a:

  Linux 5.5-rc1 (2019-12-08 14:57:55 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-5.6

for you to fetch changes up to 0536309373e3e0e4c558f45dad272fcfb8b48fa9:

  memory: samsung: Rename Exynos to lowercase (2020-01-07 20:46:32 +0100)

----------------------------------------------------------------
Samsung soc drivers changes for v5.6

1. Convert to managed (devm_x()) versions,
2. Cleanups (Samsung and Exynos names).

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      soc: samsung: Rename Samsung and Exynos to lowercase
      memory: samsung: Rename Exynos to lowercase

Yangtao Li (2):
      soc: samsung: exynos-pmu: Convert to devm_platform_ioremap_resource
      memory: samsung: exynos5422-dmc: Convert to devm_platform_ioremap_resource

 drivers/memory/samsung/Kconfig              |  2 +-
 drivers/memory/samsung/exynos-srom.c        |  2 +-
 drivers/memory/samsung/exynos5422-dmc.c     |  7 ++-----
 drivers/soc/samsung/Kconfig                 |  2 +-
 drivers/soc/samsung/exynos-chipid.c         |  2 +-
 drivers/soc/samsung/exynos-pmu.c            |  6 ++----
 drivers/soc/samsung/exynos-pmu.h            |  2 +-
 drivers/soc/samsung/exynos3250-pmu.c        |  2 +-
 drivers/soc/samsung/exynos4-pmu.c           |  2 +-
 drivers/soc/samsung/exynos5250-pmu.c        |  2 +-
 drivers/soc/samsung/exynos5420-pmu.c        |  2 +-
 include/linux/soc/samsung/exynos-pmu.h      |  2 +-
 include/linux/soc/samsung/exynos-regs-pmu.h | 16 ++++++++--------
 13 files changed, 22 insertions(+), 27 deletions(-)
