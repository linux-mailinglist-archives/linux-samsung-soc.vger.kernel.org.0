Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2DA0103FC2
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 20 Nov 2019 16:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730652AbfKTPqV (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 20 Nov 2019 10:46:21 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45084 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732471AbfKTPp6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Nov 2019 10:45:58 -0500
Received: by mail-pf1-f193.google.com with SMTP id z4so14387375pfn.12
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Nov 2019 07:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=NSg5zBP2bkEtgf/AJ9lwtdlcJh9mMI+s8A/QE9EBrqI=;
        b=pyfzMEiXET5WNLh0lbzWH2k8Ma4kL/gchA2TSfgf9FOt77Ipge3tgeetL+B/eMQ3nQ
         qK74PRyKA6Xzfhp8SDKE8IDOG9FnvPqI6zAxyvVWg6TQP7y92eClE7VPgn5EQgevKmTn
         31isyeVwYrt/63T3W7c/7GYIA5cpiXc/FjWnfRx3+zoDJBZViOljMLADxrUxQ7RA6vsu
         R4P0FAggkEapQV9P/JrJvCvOqiJCr2EcBVxIorboYb7NdrqFEAaI3ZrbK10/PJQHQdmL
         XAbs0VUQKIfNCfpp8OueO+3Wys7vJrR6BqL9ZgscME+PrmMK7xFCfeyBCRbpBj9pzPrW
         baSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=NSg5zBP2bkEtgf/AJ9lwtdlcJh9mMI+s8A/QE9EBrqI=;
        b=omLcVOY0IVHq86uqCMG7/yL8SkQEjR8OUhaTIe0gEt0scnbAQuKxEvMiMub4D8kWhY
         6i06CE1PnJLToo98uKszHk5haS+8BVudEIQIpxUW3htYpWh3ImUdN7TlEBIkMdkeLNGm
         4Yp2vwQKo3Ck9yFXc3ExRhSory19RSD0r3icnCdVbw/T8noEnIxd/p5BgLaZBpzEtkO7
         tm+eQ7SlovSEQk+fiva8EotEPklfsyqQAkgw/qtpGkCdohAcQrTKc+ddLOfHJQVu6NYO
         Wmt0peDp014jVEJP5a3fT8lu9+iQ931rK4iX1VTTSfia9LM+7HNTSSto8hXgxjalH7iD
         u/ag==
X-Gm-Message-State: APjAAAW2drStzvXU2dRlNWRKiKYhaTp1uCfVptl1jWs9RVZOe986V/cp
        lxYe0JFqBwagKWQZASh9XJKV7Q==
X-Google-Smtp-Source: APXvYqzJUD458tw9LKLIOVTpzUVrazVeldBx+3/BvF6tmCLBMY2h07OohUoX/CJQd6M8piZEF0jNfw==
X-Received: by 2002:aa7:8b08:: with SMTP id f8mr4854182pfd.92.1574264757863;
        Wed, 20 Nov 2019 07:45:57 -0800 (PST)
Received: from localhost ([14.96.110.98])
        by smtp.gmail.com with ESMTPSA id 125sm29559387pfu.136.2019.11.20.07.45.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2019 07:45:57 -0800 (PST)
From:   Amit Kucheria <amit.kucheria@linaro.org>
To:     linux-kernel@vger.kernel.org, edubezval@gmail.com,
        Amit Daniel Kachhap <amit.kachhap@gmail.com>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Guillaume La Roque <glaroque@baylibre.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Javi Merino <javi.merino@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jun Nie <jun.nie@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>
Cc:     linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 08/11] thermal: samsung: Appease the kernel-doc deity
Date:   Wed, 20 Nov 2019 21:15:17 +0530
Message-Id: <1ded1697c6e5eff11b034b3302b9c79e88fa9c42.1574242756.git.amit.kucheria@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1574242756.git.amit.kucheria@linaro.org>
References: <cover.1574242756.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1574242756.git.amit.kucheria@linaro.org>
References: <cover.1574242756.git.amit.kucheria@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fix up the following warning when compiled with make W=1:

linux.git/drivers/thermal/samsung/exynos_tmu.c:141: warning: bad
line:         driver
linux.git/drivers/thermal/samsung/exynos_tmu.c:203: warning: Function
parameter or member 'tzd' not described in 'exynos_tmu_data'
linux.git/drivers/thermal/samsung/exynos_tmu.c:203: warning: Function
parameter or member 'tmu_set_trip_temp' not described in
'exynos_tmu_data'
linux.git/drivers/thermal/samsung/exynos_tmu.c:203: warning: Function
parameter or member 'tmu_set_trip_hyst' not described in
'exynos_tmu_data'

Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 drivers/thermal/samsung/exynos_tmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/thermal/samsung/exynos_tmu.c b/drivers/thermal/samsung/exynos_tmu.c
index fb2c55123a99..8193b66a3f83 100644
--- a/drivers/thermal/samsung/exynos_tmu.c
+++ b/drivers/thermal/samsung/exynos_tmu.c
@@ -138,7 +138,7 @@ enum soc_type {
 
 /**
  * struct exynos_tmu_data : A structure to hold the private data of the TMU
-	driver
+ *			    driver
  * @id: identifier of the one instance of the TMU controller.
  * @base: base address of the single instance of the TMU controller.
  * @base_second: base address of the common registers of the TMU controller.
@@ -162,8 +162,11 @@ enum soc_type {
  *	0 < reference_voltage <= 31
  * @regulator: pointer to the TMU regulator structure.
  * @reg_conf: pointer to structure to register with core thermal.
+ * @tzd: pointer to thermal_zone_device structure
  * @ntrip: number of supported trip points.
  * @enabled: current status of TMU device
+ * @tmu_set_trip_temp: SoC specific method to set trip (rising threshold)
+ * @tmu_set_trip_hyst: SoC specific to set hysteresis (falling threshold)
  * @tmu_initialize: SoC specific TMU initialization method
  * @tmu_control: SoC specific TMU control method
  * @tmu_read: SoC specific TMU temperature read method
-- 
2.20.1

