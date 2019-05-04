Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECAB913A0C
	for <lists+linux-samsung-soc@lfdr.de>; Sat,  4 May 2019 15:24:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbfEDNYQ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 4 May 2019 09:24:16 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:43546 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726631AbfEDNYQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 4 May 2019 09:24:16 -0400
Received: by mail-ed1-f65.google.com with SMTP id w33so7118100edb.10
        for <linux-samsung-soc@vger.kernel.org>; Sat, 04 May 2019 06:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arista.com; s=googlenew;
        h=from:to:cc:subject:date:message-id;
        bh=iyAAdc/hWRW2hoexYmZRWuZhkprGVEqqGQbkYpxS37k=;
        b=G3KCFm0fbzzI5F1zvOaRO7d1l4ziZIc3CASA+uBY+RtDmidxSUQwWdeXFWtJOGLvYw
         a8yXmR1xI+Y2k53XMjmr8di4aBIt0In+/ytHYBL5TqUrHglv98FG0Eh0Vd6bmRsYYwYU
         mgxtUdE4nyACk972b901w9YsVjxBsYQseAlIOI3Cy43lAcovNGZEFC8Ba71/Oj//FiL5
         awp0y5M0274CBiGPuUoOAsJisrUXDjTUNJ9Xc3jnQTtRfUxSI/JI+U/AQGIARS0k91zP
         0kA1mk/UoQLSxxaLwLNPvd2A9TNRXxzX7bCEEg5Nrb8THmWNUI1ZqCSYcwSs94pbbFFl
         Zptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=iyAAdc/hWRW2hoexYmZRWuZhkprGVEqqGQbkYpxS37k=;
        b=p8537kCIH8MGlggd71XeUC88jGROFIBLydy6gg7/p15NfV1jUuqqi7mXutSw147d0i
         cguSjSjIxXt55VGeOBTZlKdCAudEI7uKlJo4AY8fH3dGk+KLfTmo5xTgH6C2htvjrIqv
         yfLArgYTfVOVdOrICxuVPl6q4v1ZeWxKcHeriIpRfpblh/ehpcER8WVD2Be5tmT1dY2P
         BEPWr+ATgWA9eRTN5xxz7mdVml9yHtk9X/d1MBofpBvQbvvde32zp12NCh0iN9M577lb
         R5nO2WGflS2QMFcgapLNf8eLD0n+wt84hRpKUbUngXQZRHoI38pniaq/2uuaLK2NjMJH
         CByA==
X-Gm-Message-State: APjAAAXY1Kk0g2EprYtEJrZvDoz6S68ZiRZfP1RIW+iPY+zenXOFhQ+H
        7rJhlFFMaOCgd78IkhiSoh9kyw==
X-Google-Smtp-Source: APXvYqz4LGJhruC7j3NhOPSVnefUenYnUMxbvpiMSoAHKZ2baaSBXg9l+vRLGrvk4q5MJKcE05cUbQ==
X-Received: by 2002:a50:b68b:: with SMTP id d11mr13947835ede.42.1556976254830;
        Sat, 04 May 2019 06:24:14 -0700 (PDT)
Received: from localhost.localdomain ([79.97.203.116])
        by smtp.gmail.com with ESMTPSA id s53sm1391106edb.20.2019.05.04.06.24.13
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 May 2019 06:24:14 -0700 (PDT)
From:   Tom Murphy <tmurphy@arista.com>
To:     iommu@lists.linux-foundation.org
Cc:     murphyt7@tcd.ie, Tom Murphy <tmurphy@arista.com>,
        Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will.deacon@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <andy.gross@linaro.org>,
        David Brown <david.brown@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Alex Williamson <alex.williamson@redhat.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org, kvm@vger.kernel.org
Subject: [RFC 0/7] Convert the Intel iommu driver to the dma-ops api
Date:   Sat,  4 May 2019 14:23:16 +0100
Message-Id: <20190504132327.27041-1-tmurphy@arista.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Convert the intel iommu driver to the dma-ops api so that we can remove a bunch of repeated code.

This patchset depends on the "iommu/vt-d: Delegate DMA domain to generic iommu" and
"iommu/amd: Convert the AMD iommu driver to the dma-iommu api" patch sets which haven't
yet merged so this is just a RFC to get some feedback before I do more testing.

Tom Murphy (7):
  iommu/vt-d: Set the dma_ops per device so we can remove the
    iommu_no_mapping code
  iommu/vt-d: Remove iova handling code from non-dma ops path
  iommu: improve iommu iotlb flushing
  iommu/dma-iommu: Handle freelists in the dma-iommu api path
  iommu/dma-iommu: add wrapper for iommu_dma_free_cpu_cached_iovas
  iommu/vt-d: convert the intel iommu driver to the dma-iommu ops api
  iommu/vt-d: Always set DMA_PTE_READ if the iommu doens't support zero
    length reads

 drivers/iommu/Kconfig           |   1 +
 drivers/iommu/amd_iommu.c       |  14 +-
 drivers/iommu/arm-smmu-v3.c     |   3 +-
 drivers/iommu/arm-smmu.c        |   2 +-
 drivers/iommu/dma-iommu.c       |  48 ++-
 drivers/iommu/exynos-iommu.c    |   3 +-
 drivers/iommu/intel-iommu.c     | 605 +++++---------------------------
 drivers/iommu/iommu.c           |  21 +-
 drivers/iommu/ipmmu-vmsa.c      |   2 +-
 drivers/iommu/msm_iommu.c       |   2 +-
 drivers/iommu/mtk_iommu.c       |   3 +-
 drivers/iommu/mtk_iommu_v1.c    |   3 +-
 drivers/iommu/omap-iommu.c      |   2 +-
 drivers/iommu/qcom_iommu.c      |   2 +-
 drivers/iommu/rockchip-iommu.c  |   2 +-
 drivers/iommu/s390-iommu.c      |   3 +-
 drivers/iommu/tegra-gart.c      |   2 +-
 drivers/iommu/tegra-smmu.c      |   2 +-
 drivers/vfio/vfio_iommu_type1.c |   3 +-
 include/linux/dma-iommu.h       |   3 +
 include/linux/intel-iommu.h     |   1 -
 include/linux/iommu.h           |  24 +-
 22 files changed, 175 insertions(+), 576 deletions(-)

-- 
2.17.1

