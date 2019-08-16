Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6A5A6905D5
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 16 Aug 2019 18:33:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726522AbfHPQav (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 16 Aug 2019 12:30:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:52018 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726469AbfHPQav (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Aug 2019 12:30:51 -0400
Received: from localhost.localdomain (unknown [194.230.155.124])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BB00720665;
        Fri, 16 Aug 2019 16:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565973050;
        bh=bDKLgHOhZqF4s7OBfQaY2Jv5cHcLwf9e2NERN0UJfBM=;
        h=From:To:Cc:Subject:Date:From;
        b=LREVkLwtWXZAjtv4NdF17RfjRlBesDm5DZclZlPCJ2gxyISS1Gz2vXsnf10ahbLUX
         bxdXGX/0J50FMiHOG/d/DCRgxF4sCfcXqG4PkdpNDf5m9B7mhgZVOMXep7NZitwu5A
         0+lTov/NbUaXVUBZMaDhR1vym7IWNwtjHtyaP6sA=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL 1/3] soc: samsung: Exynos for v5.4
Date:   Fri, 16 Aug 2019 18:30:40 +0200
Message-Id: <20190816163042.6604-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-5.4

for you to fetch changes up to 40d8aff614f71ab3cab20785b4f213e3802d4e87:

  soc: samsung: chipid: Convert exynos-chipid driver to use the regmap API (2019-08-15 20:25:25 +0200)

----------------------------------------------------------------
Samsung soc drivers changes for v5.4

Add Exynos Chipid driver for identification of product IDs and SoC
revisions.  The driver also exposes chipid regmap, later to be used by
Exynos Adaptive Supply Voltage driver (adjusting voltages to different
revisions of same SoC).

----------------------------------------------------------------
Pankaj Dubey (1):
      soc: samsung: Add exynos chipid driver support

Sylwester Nawrocki (1):
      soc: samsung: chipid: Convert exynos-chipid driver to use the regmap API

 drivers/soc/samsung/Kconfig               |   5 ++
 drivers/soc/samsung/Makefile              |   2 +
 drivers/soc/samsung/exynos-chipid.c       | 101 ++++++++++++++++++++++++++++++
 include/linux/soc/samsung/exynos-chipid.h |  52 +++++++++++++++
 4 files changed, 160 insertions(+)
 create mode 100644 drivers/soc/samsung/exynos-chipid.c
 create mode 100644 include/linux/soc/samsung/exynos-chipid.h
