Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60A8226B333
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 16 Sep 2020 01:01:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726146AbgIOXB0 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 15 Sep 2020 19:01:26 -0400
Received: from mx2.suse.de ([195.135.220.15]:36394 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726900AbgIOPB1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 11:01:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 1F328AE4B;
        Tue, 15 Sep 2020 15:00:22 +0000 (UTC)
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
        tvrtko.ursulin@linux.intel.com, andi.shyti@intel.com,
        sam@ravnborg.org, miaoqinglang@huawei.com,
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
Subject: [PATCH v2 06/21] drm/i915: Introduce GEM object functions
Date:   Tue, 15 Sep 2020 16:59:43 +0200
Message-Id: <20200915145958.19993-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915145958.19993-1-tzimmermann@suse.de>
References: <20200915145958.19993-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

GEM object functions deprecate several similar callback interfaces in
struct drm_driver. This patch replaces the per-driver callbacks with
per-instance callbacks in i915.

v2:
	* move object-function instance to i915_gem_object.c (Jani)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/i915/gem/i915_gem_object.c    | 21 ++++++++++++++++---
 drivers/gpu/drm/i915/gem/i915_gem_object.h    |  3 ---
 drivers/gpu/drm/i915/i915_drv.c               |  4 ----
 .../gpu/drm/i915/selftests/mock_gem_device.c  |  3 ---
 4 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.c b/drivers/gpu/drm/i915/gem/i915_gem_object.c
index c8421fd9d2dc..3389ac972d16 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.c
@@ -39,9 +39,18 @@ static struct i915_global_object {
 	struct kmem_cache *slab_objects;
 } global;
 
+static const struct drm_gem_object_funcs i915_gem_object_funcs;
+
 struct drm_i915_gem_object *i915_gem_object_alloc(void)
 {
-	return kmem_cache_zalloc(global.slab_objects, GFP_KERNEL);
+	struct drm_i915_gem_object *obj;
+
+	obj = kmem_cache_zalloc(global.slab_objects, GFP_KERNEL);
+	if (!obj)
+		return NULL;
+	obj->base.funcs = &i915_gem_object_funcs;
+
+	return obj;
 }
 
 void i915_gem_object_free(struct drm_i915_gem_object *obj)
@@ -101,7 +110,7 @@ void i915_gem_object_set_cache_coherency(struct drm_i915_gem_object *obj,
 		!(obj->cache_coherent & I915_BO_CACHE_COHERENT_FOR_WRITE);
 }
 
-void i915_gem_close_object(struct drm_gem_object *gem, struct drm_file *file)
+static void i915_gem_close_object(struct drm_gem_object *gem, struct drm_file *file)
 {
 	struct drm_i915_gem_object *obj = to_intel_bo(gem);
 	struct drm_i915_file_private *fpriv = file->driver_priv;
@@ -264,7 +273,7 @@ static void __i915_gem_free_work(struct work_struct *work)
 	i915_gem_flush_free_objects(i915);
 }
 
-void i915_gem_free_object(struct drm_gem_object *gem_obj)
+static void i915_gem_free_object(struct drm_gem_object *gem_obj)
 {
 	struct drm_i915_gem_object *obj = to_intel_bo(gem_obj);
 	struct drm_i915_private *i915 = to_i915(obj->base.dev);
@@ -403,6 +412,12 @@ int __init i915_global_objects_init(void)
 	return 0;
 }
 
+static const struct drm_gem_object_funcs i915_gem_object_funcs = {
+	.free = i915_gem_free_object,
+	.close = i915_gem_close_object,
+	.export = i915_gem_prime_export,
+};
+
 #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
 #include "selftests/huge_gem_object.c"
 #include "selftests/huge_pages.c"
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index d46db8d8f38e..eaf3d4147be0 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -38,9 +38,6 @@ void __i915_gem_object_release_shmem(struct drm_i915_gem_object *obj,
 
 int i915_gem_object_attach_phys(struct drm_i915_gem_object *obj, int align);
 
-void i915_gem_close_object(struct drm_gem_object *gem, struct drm_file *file);
-void i915_gem_free_object(struct drm_gem_object *obj);
-
 void i915_gem_flush_free_objects(struct drm_i915_private *i915);
 
 struct sg_table *
diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
index 94e00e450683..011a3fb41ece 100644
--- a/drivers/gpu/drm/i915/i915_drv.c
+++ b/drivers/gpu/drm/i915/i915_drv.c
@@ -1750,12 +1750,8 @@ static struct drm_driver driver = {
 	.lastclose = i915_driver_lastclose,
 	.postclose = i915_driver_postclose,
 
-	.gem_close_object = i915_gem_close_object,
-	.gem_free_object_unlocked = i915_gem_free_object,
-
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_export = i915_gem_prime_export,
 	.gem_prime_import = i915_gem_prime_import,
 
 	.dumb_create = i915_gem_dumb_create,
diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
index f127e633f7ca..9244b5d6fb01 100644
--- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
+++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
@@ -87,9 +87,6 @@ static struct drm_driver mock_driver = {
 	.name = "mock",
 	.driver_features = DRIVER_GEM,
 	.release = mock_device_release,
-
-	.gem_close_object = i915_gem_close_object,
-	.gem_free_object_unlocked = i915_gem_free_object,
 };
 
 static void release_dev(struct device *dev)
-- 
2.28.0

