Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4FBA1F8652
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 14 Jun 2020 05:11:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726535AbgFNDLH (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 13 Jun 2020 23:11:07 -0400
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:36586 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbgFNDLG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 13 Jun 2020 23:11:06 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 49kzxj06HMz9vYfC
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Jun 2020 03:11:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8wwc5R4_QzMa for <linux-samsung-soc@vger.kernel.org>;
        Sat, 13 Jun 2020 22:11:04 -0500 (CDT)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com [209.85.166.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 49kzxh5ZlTz9vYdP
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jun 2020 22:11:04 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p7.oit.umn.edu 49kzxh5ZlTz9vYdP
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p7.oit.umn.edu 49kzxh5ZlTz9vYdP
Received: by mail-io1-f72.google.com with SMTP id t23so8960386iog.21
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jun 2020 20:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Tvzr1gexpz+XRT9cgNKtj6wgeM1vIvcw44KBepZR6D4=;
        b=dY/qYHxSJdD8wAPz5h0FzAjVdWnVxvU72g1FCz0rJabbboMQPb4mkbyhXsW3/U4OSd
         tG2GxLxvsYxVLnaDmrBSXbveACEyS381htloR096Mv2VmnZieGOW6NKYkZ7fWrV2iVFk
         ax3PGuCq8fIkqEk843jjTIsJ4uPPnzUNyn6t6ba2w1u0gGl4RmuUKDXBMpwPCLXMCWh+
         N6oaBSFszaA35qXd8F4iEDmVlLuXUaCgV9poTt2R1spjs+/ORhl5sK88oF3W7oNshyca
         4x61BV8RjdvWh4c0DA1qre73dHxLnFLqeAI/J9rO+n3zIU3l8b9sM3TSvclk+yocs9kT
         KvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Tvzr1gexpz+XRT9cgNKtj6wgeM1vIvcw44KBepZR6D4=;
        b=sHqGjqrgq845jlD064x51Z1iw0UFTO77xvZmH73feWfM8Ew03cVOHyMXyZ4HYEVVqd
         L8v26iRJ93Y8aP5tRG9b6TlIeNzHPln3qlNVRQrMnIReu9jVZP4I13fKHMRnFUBd6seR
         iOtQBIFZ0gDqqU7ooHHTOnv3Dqme01eCoBrYs906y0xQxhTc4jDiI0AA1v+IDX1hTvXg
         CWZ7yjwNyIdzH+4kLzMseDUMrgUR8INNfvxq9jpHtZOZQ8RKXMeDgSsxyTRxu6ObohfC
         D6vllUX48YgkVwmDCEMij39jQrZNCbCzqwUAtUUCAsqyM916DhC5U70LTr87EVumz8be
         iv1g==
X-Gm-Message-State: AOAM531KHGG90aR2NOy8T6gi6lf/7+nnWjjoStpGNQ8OtnT40e7/FgD8
        3Mncj9XU3Pxl7Uy69HQQ7dB1wLBH6No9pRXdP892fZRsPlhy54dT5/whC4PLUFE1kc/XiSMZqJH
        /pjCwF9bfSsD8Gr/C2pkHtmlok0tmFfg92gY=
X-Received: by 2002:a92:2906:: with SMTP id l6mr20963410ilg.105.1592104264295;
        Sat, 13 Jun 2020 20:11:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfPqC77rIfEaxFBW9gjDsioh8PzhonurOjVS/5EVI+YZOFekhI0LDWSnL9wCyzLaBMx6s77Q==
X-Received: by 2002:a92:2906:: with SMTP id l6mr20963390ilg.105.1592104264017;
        Sat, 13 Jun 2020 20:11:04 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
        by smtp.gmail.com with ESMTPSA id x12sm5667765ilm.48.2020.06.13.20.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 20:11:03 -0700 (PDT)
From:   wu000273@umn.edu
To:     kjlu@umn.edu
Cc:     wu000273@umn.edu, Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: exynos4-is: Fix a reference count leak due to pm_runtime_get_sync
Date:   Sat, 13 Jun 2020 22:10:58 -0500
Message-Id: <20200614031058.30161-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

On calling pm_runtime_get_sync() the reference count of the device
is incremented. In case of failure, decrement the
reference count before returning the error.

Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/media/platform/exynos4-is/media-dev.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/exynos4-is/media-dev.c b/drivers/media/platform/exynos4-is/media-dev.c
index 9aaf3b8060d5..cfb6891180b0 100644
--- a/drivers/media/platform/exynos4-is/media-dev.c
+++ b/drivers/media/platform/exynos4-is/media-dev.c
@@ -484,8 +484,10 @@ static int fimc_md_register_sensor_entities(struct fimc_md *fmd)
 		return -ENXIO;
 
 	ret = pm_runtime_get_sync(fmd->pmf);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put(fmd->pmf);
 		return ret;
+	}
 
 	fmd->num_sensors = 0;
 
-- 
2.17.1

