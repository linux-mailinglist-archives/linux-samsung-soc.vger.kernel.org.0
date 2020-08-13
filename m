Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E228243605
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 13 Aug 2020 10:36:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726144AbgHMIgx (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 13 Aug 2020 04:36:53 -0400
Received: from mx2.suse.de ([195.135.220.15]:58510 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726048AbgHMIgx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 13 Aug 2020 04:36:53 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 66D85AF99;
        Thu, 13 Aug 2020 08:37:13 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     alexander.deucher@amd.com, christian.koenig@amd.com,
        airlied@linux.ie, daniel@ffwll.ch, linux@armlinux.org.uk,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        l.stach@pengutronix.de, christian.gmeiner@gmail.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        kgene@kernel.org, krzk@kernel.org, patrik.r.jakobsson@gmail.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, chunkuang.hu@kernel.org,
        p.zabel@pengutronix.de, matthias.bgg@gmail.com,
        robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com,
        tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com,
        heiko@sntech.de, thierry.reding@gmail.com, jonathanh@nvidia.com,
        rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
        oleksandr_andrushchenko@epam.com, hyun.kwon@xilinx.com,
        laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
        sumit.semwal@linaro.org, evan.quan@amd.com, Hawking.Zhang@amd.com,
        tianci.yin@amd.com, marek.olsak@amd.com, hdegoede@redhat.com,
        andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com,
        xinhui.pan@amd.com, aaron.liu@amd.com, nirmoy.das@amd.com,
        chris@chris-wilson.co.uk, matthew.auld@intel.com,
        abdiel.janulgue@linux.intel.com, tvrtko.ursulin@linux.intel.com,
        andi.shyti@intel.com, sam@ravnborg.org, miaoqinglang@huawei.com,
        emil.velikov@collabora.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        etnaviv@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 00/20] Convert all remaining drivers to GEM object functions
Date:   Thu, 13 Aug 2020 10:36:24 +0200
Message-Id: <20200813083644.31711-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The GEM and PRIME related callbacks in struct drm_driver are deprecated in
favor of GEM object functions in struct drm_gem_object_funcs. This patchset
converts the remaining drivers to object functions and removes most of the
obsolete interfaces.

Patches #1 to #18 convert DRM drivers to GEM object functions, one by one.
Each patch moves existing callbacks from struct drm_driver to an instance
of struct drm_gem_object_funcs, and sets these funcs when the GEM object is
initialized. The expection is .gem_prime_mmap. There are different ways of
how drivers implement the callback, and moving it to GEM object functions
requires a closer review for each.

Patch #19 converts xlnx to CMA helper macros. There's no apparent reason
why the driver does the GEM setup on it's own. Using CMA helper macros
adds GEM object functions implicitly.

With most of the GEM and PRIME moved to GEM object functions, related code
in struct drm_driver and in the DRM core/helpers is being removed by patch
#20.

Further testing is welcome. I tested the drivers for which I have HW
available, which are gma500, i915, nouveau, radeon and vc4. The console,
Weston and Xorg apparently work with the patches applied.

Thomas Zimmermann (20):
  drm/amdgpu: Introduce GEM object functions
  drm/armada: Introduce GEM object functions
  drm/etnaviv: Introduce GEM object functions
  drm/exynos: Introduce GEM object functions
  drm/gma500: Introduce GEM object functions
  drm/i915: Introduce GEM object functions
  drm/mediatek: Introduce GEM object functions
  drm/msm: Introduce GEM object funcs
  drm/nouveau: Introduce GEM object functions
  drm/omapdrm: Introduce GEM object functions
  drm/pl111: Introduce GEM object functions
  drm/radeon: Introduce GEM object functions
  drm/rockchip: Convert to drm_gem_object_funcs
  drm/tegra: Introduce GEM object functions
  drm/vc4: Introduce GEM object functions
  drm/vgem: Introduce GEM object functions
  drm/vkms: Introduce GEM object functions
  drm/xen: Introduce GEM object functions
  drm/xlnx: Initialize DRM driver instance with CMA helper macro
  drm: Remove obsolete GEM and PRIME callbacks from struct drm_driver

 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  6 --
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 12 +++
 drivers/gpu/drm/armada/armada_drv.c           |  3 -
 drivers/gpu/drm/armada/armada_gem.c           | 12 ++-
 drivers/gpu/drm/armada/armada_gem.h           |  2 -
 drivers/gpu/drm/drm_gem.c                     | 35 ++------
 drivers/gpu/drm/drm_gem_cma_helper.c          |  6 +-
 drivers/gpu/drm/drm_prime.c                   | 17 ++--
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         | 13 ---
 drivers/gpu/drm/etnaviv/etnaviv_drv.h         |  1 -
 drivers/gpu/drm/etnaviv/etnaviv_gem.c         | 19 ++++-
 drivers/gpu/drm/exynos/exynos_drm_drv.c       | 10 ---
 drivers/gpu/drm/exynos/exynos_drm_gem.c       | 15 ++++
 drivers/gpu/drm/gma500/framebuffer.c          |  2 +
 drivers/gpu/drm/gma500/gem.c                  | 18 +++-
 drivers/gpu/drm/gma500/gem.h                  |  3 +
 drivers/gpu/drm/gma500/psb_drv.c              |  9 --
 drivers/gpu/drm/gma500/psb_drv.h              |  2 -
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  9 +-
 drivers/gpu/drm/i915/i915_drv.c               | 10 ++-
 drivers/gpu/drm/i915/i915_drv.h               |  1 +
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  3 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  5 --
 drivers/gpu/drm/mediatek/mtk_drm_gem.c        | 11 +++
 drivers/gpu/drm/msm/msm_drv.c                 | 13 ---
 drivers/gpu/drm/msm/msm_drv.h                 |  1 -
 drivers/gpu/drm/msm/msm_gem.c                 | 19 ++++-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  9 --
 drivers/gpu/drm/nouveau/nouveau_gem.c         | 13 +++
 drivers/gpu/drm/nouveau/nouveau_gem.h         |  2 +
 drivers/gpu/drm/nouveau/nouveau_prime.c       |  2 +
 drivers/gpu/drm/omapdrm/omap_drv.c            |  9 --
 drivers/gpu/drm/omapdrm/omap_gem.c            | 16 +++-
 drivers/gpu/drm/omapdrm/omap_gem.h            |  1 -
 drivers/gpu/drm/pl111/pl111_drv.c             | 28 +++++-
 drivers/gpu/drm/radeon/radeon_drv.c           | 23 +----
 drivers/gpu/drm/radeon/radeon_object.c        | 26 ++++++
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  5 --
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   | 10 +++
 drivers/gpu/drm/tegra/drm.c                   |  4 -
 drivers/gpu/drm/tegra/gem.c                   |  8 ++
 drivers/gpu/drm/vc4/vc4_bo.c                  | 21 ++++-
 drivers/gpu/drm/vc4/vc4_drv.c                 | 12 ---
 drivers/gpu/drm/vc4/vc4_drv.h                 |  1 -
 drivers/gpu/drm/vgem/vgem_drv.c               | 21 +++--
 drivers/gpu/drm/vkms/vkms_drv.c               |  8 --
 drivers/gpu/drm/vkms/vkms_gem.c               | 13 +++
 drivers/gpu/drm/xen/xen_drm_front.c           | 12 +--
 drivers/gpu/drm/xen/xen_drm_front.h           |  2 +
 drivers/gpu/drm/xen/xen_drm_front_gem.c       | 15 ++++
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c           | 14 +--
 include/drm/drm_drv.h                         | 85 +------------------
 52 files changed, 311 insertions(+), 306 deletions(-)

--
2.28.0

