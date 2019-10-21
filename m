Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 521CDDF4C6
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 21 Oct 2019 20:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730030AbfJUSFX (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 21 Oct 2019 14:05:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:38204 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729968AbfJUSFX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Oct 2019 14:05:23 -0400
Received: from localhost.localdomain (unknown [194.230.155.217])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 118BD214AE;
        Mon, 21 Oct 2019 18:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571681122;
        bh=ivLMp577gO6IQFjad9juA1B2PNCjhzK67v3fdxzOU+k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o8jcXh+8S2m2b0cwD4Ey95j+hhEGTPiZhlt+kt0o/ia4DG2nCoCI05trF8p3fGV4l
         4eHZetUTR1vrPWqUjcqb0bxdttorrB/1mHkmBGv2w4ejioIjHq5VQG67sb4pNjjtvh
         NMBkDGqU6IFfTRmmlWSoqkCD0+0vtQnltcB7vkwo=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL 5/5] arm64: dts: exynos: Stuff for v5.5
Date:   Mon, 21 Oct 2019 20:04:52 +0200
Message-Id: <20191021180453.29455-5-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191021180453.29455-1-krzk@kernel.org>
References: <20191021180453.29455-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.5

for you to fetch changes up to 9f17f839fe9cfee2615f03f9f4a1b34ae1f1a040:

  arm64: dts: exynos: Rename Multi Core Timer node to "timer" on Exynos5433 (2019-10-01 21:04:47 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.5

1. Fix boot of Exynos7 due to wrong address/size of memory node,
2. Move GPU under /soc node,
3. Minor of DT bindings.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      arm64: dts: exynos: Rename Multi Core Timer node to "timer" on Exynos5433

Maciej Falkowski (2):
      arm64: dts: exynos: Swap clock order of sysmmu on Exynos5433
      arm64: dts: exynos: Split phandle in dmas property on Exynos5433

Marek Szyprowski (3):
      arm64: dts: exynos: Move GPU under /soc node for Exynos5433
      arm64: dts: exynos: Move GPU under /soc node for Exynos7
      arm64: dts: exynos: Revert "Remove unneeded address space mapping for soc node"

 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 168 ++++++++++++++---------------
 arch/arm64/boot/dts/exynos/exynos7.dtsi    |  28 ++---
 2 files changed, 98 insertions(+), 98 deletions(-)
