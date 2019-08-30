Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 95FDDA3521
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 30 Aug 2019 12:45:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728008AbfH3KpZ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 30 Aug 2019 06:45:25 -0400
Received: from foss.arm.com ([217.140.110.172]:58024 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728007AbfH3KpZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Aug 2019 06:45:25 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 966FC337;
        Fri, 30 Aug 2019 03:45:24 -0700 (PDT)
Received: from localhost.localdomain (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8AA143F718;
        Fri, 30 Aug 2019 03:45:23 -0700 (PDT)
From:   Guillaume Gardet <guillaume.gardet@arm.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Guillaume Gardet <guillaume.gardet@arm.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH V3 0/4] Add GPU/Mali T604 node to arndale and snow (exynos5250)
Date:   Fri, 30 Aug 2019 12:44:57 +0200
Message-Id: <20190830104502.7128-1-guillaume.gardet@arm.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190725083433.6505-1-guillaume.gardet@arm.com>
References: <20190725083433.6505-1-guillaume.gardet@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add nodes for GPU (Mali T604) to Exynos5250.
Tested with kmscube and some glmark2* tests on Chromebook snow and
arndale board.

V3 changes:
  * change clock name from 'g3d' to 'core'
  * disable node by default in exynos5250.dtsi
  * move dt-bindings before node addition in device tree
  * enable node for arndale and snow, with mali-supply, separetly
  * add patch to fix min/max values for buck4 regulator for gpu
    on arndale board

V2 changes: 
  * move mali node as /soc sub-node
  * move gpu_opp_table as mali sub-node
  * minor style updates
  * test on arndale board
  * enable by default
  * add dt bindings, in a separate patch


Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org

Guillaume Gardet (5):
  dt-bindings: gpu: mali-midgard: Add samsung exynos5250 compatible
  arm: dts: exynos: Add GPU/Mali T604 node to exynos5250
  arm: dts: exynos: snow: Enable GPU/Mali T604 node
  arm: dts: exynos: arndale: Enable GPU/Mali T604 node
  arm: dts: exynos: arndale: Fix min/max for buck4 regulator for gpu

 .../bindings/gpu/arm,mali-midgard.txt         |  1 +
 arch/arm/boot/dts/exynos5250-arndale.dts      |  9 +++-
 arch/arm/boot/dts/exynos5250-snow-common.dtsi |  5 ++
 arch/arm/boot/dts/exynos5250.dtsi             | 47 +++++++++++++++++++
 4 files changed, 60 insertions(+), 2 deletions(-)

-- 
2.22.1

