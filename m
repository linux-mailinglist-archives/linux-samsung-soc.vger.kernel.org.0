Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F22F9775184
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  9 Aug 2023 05:45:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230100AbjHIDp3 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 8 Aug 2023 23:45:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230007AbjHIDp2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 23:45:28 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED52173A;
        Tue,  8 Aug 2023 20:45:27 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.53])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RLGBh4Rl9zmXD6;
        Wed,  9 Aug 2023 11:44:12 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 9 Aug
 2023 11:45:22 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
        <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>,
        <airlied@gmail.com>, <daniel@ffwll.ch>, <harry.wentland@amd.com>,
        <sunpeng.li@amd.com>, <Rodrigo.Siqueira@amd.com>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <inki.dae@samsung.com>,
        <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>,
        <krzysztof.kozlowski@linaro.org>, <alim.akhtar@samsung.com>,
        <robdclark@gmail.com>, <quic_abhinavk@quicinc.com>,
        <dmitry.baryshkov@linaro.org>, <sean@poorly.run>,
        <marijn.suijten@somainline.org>, <bskeggs@redhat.com>,
        <kherbst@redhat.com>, <lyude@redhat.com>, <kraxel@redhat.com>,
        <gurchetansingh@chromium.org>, <olvaffe@gmail.com>,
        <paulo.miguel.almeida.rodenas@gmail.com>, <wenjing.liu@amd.com>,
        <haoping.liu@amd.com>, <Charlene.Liu@amd.com>,
        <chiahsuan.chung@amd.com>, <george.shen@amd.com>,
        <sancchen@amd.com>, <tony.tascioglu@amd.com>,
        <jaehyun.chung@amd.com>, <tales.aparecida@gmail.com>,
        <drv@mailo.com>, <aurabindo.pillai@amd.com>,
        <quic_vpolimer@quicinc.com>, <jiasheng@iscas.ac.cn>,
        <noralf@tronnes.org>, <jose.exposito89@gmail.com>,
        <javierm@redhat.com>, <mairacanal@riseup.net>,
        <davidgow@google.com>, <arthurgrillo@riseup.net>,
        <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <freedreno@lists.freedesktop.org>,
        <nouveau@lists.freedesktop.org>,
        <virtualization@lists.linux-foundation.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next 1/7] drm/amdkfd: Remove unnecessary NULL values
Date:   Wed, 9 Aug 2023 11:44:39 +0800
Message-ID: <20230809034445.434902-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230809034445.434902-1-ruanjinjie@huawei.com>
References: <20230809034445.434902-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The NULL initialization of the pointers assigned by kzalloc() first is
not necessary, because if the kzalloc() failed, the pointers will be
assigned NULL, otherwise it works as usual. so remove it.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
index 863cf060af48..d01bb57733b3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_mqd_manager.c
@@ -48,7 +48,7 @@ int pipe_priority_map[] = {
 
 struct kfd_mem_obj *allocate_hiq_mqd(struct kfd_node *dev, struct queue_properties *q)
 {
-	struct kfd_mem_obj *mqd_mem_obj = NULL;
+	struct kfd_mem_obj *mqd_mem_obj;
 
 	mqd_mem_obj = kzalloc(sizeof(struct kfd_mem_obj), GFP_KERNEL);
 	if (!mqd_mem_obj)
@@ -64,7 +64,7 @@ struct kfd_mem_obj *allocate_hiq_mqd(struct kfd_node *dev, struct queue_properti
 struct kfd_mem_obj *allocate_sdma_mqd(struct kfd_node *dev,
 					struct queue_properties *q)
 {
-	struct kfd_mem_obj *mqd_mem_obj = NULL;
+	struct kfd_mem_obj *mqd_mem_obj;
 	uint64_t offset;
 
 	mqd_mem_obj = kzalloc(sizeof(struct kfd_mem_obj), GFP_KERNEL);
-- 
2.34.1

