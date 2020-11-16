Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77E382B4E27
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 16 Nov 2020 18:49:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387566AbgKPRmc (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 16 Nov 2020 12:42:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387630AbgKPRl2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 12:41:28 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CA60C0613D1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Nov 2020 09:41:27 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id d12so19619355wrr.13
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Nov 2020 09:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9VZRZT8daPeGmypqlkiDD/bg2WPWGzH9nAJzamvIbC4=;
        b=XIGydzF8ll59VzTwx4kHtiFKr4QqwikhLjU4KxNpkNO0xFCL6gbiHerhnJhc4VxFsA
         U6pAgqWoIzexOQ0HWONoLIorOt3ftCEcbtmeiCda3OiE6Q72KGWBPqJJQKx0hgUfEVSf
         Tokld58vv6fEOMcH9k9iiyKKM3S/RQH6KV4AGzmwzDlio0XzYHaq/AVLFHWrTM1qpnMf
         av3wkbOtgXzfr/5bc3/4hFY1W/OHs//CUW3gR4SIMavAauqcawoq2bTvMQkTrqudtJgw
         lL2/5lwSylp+ojXy4xQQQ2jyjvzJZywj1kLJnzLlJrL2RmjhIUmQOhYEIctCWcIZvDRU
         rK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9VZRZT8daPeGmypqlkiDD/bg2WPWGzH9nAJzamvIbC4=;
        b=Oyo5QumHdJ5U3VqasBFoRspSX7kP8a5C4J/sBcc0WRf+VCi8TB1M5fFCguBX2ZQF4s
         JoUeHCdKJeShgxkMmb2sZx5eEp7RHgVM8oB3Nb4xT3GF1+c0cHbhVyaG6FlqwEDmPOl1
         f5SnAmyIP2SVcOAIR12gbuf6nzu43Hwval+YwJnEaagdBhZZhxHLo+o42+D2IUZ8ZjhF
         yFEIa1YvRz1+TtHwoFXjvb4WxLH1Jh7LRUP9PhuVu+ZwjbVjYq7UQQ6q3siDu4TITjQU
         tzOojedVYEy5p0MjRHUh5RFxN7+bA0WOW1cVUQCwiDk3q92z4VtoFbfQeaqdUAJVGaOv
         quEQ==
X-Gm-Message-State: AOAM530yCDG1E8BKu6fJu54uEGzAq939QKju0b8oRMlNSNZNuf7puMyo
        AAnUN+keuqzIFKrZPnm/AGH09w==
X-Google-Smtp-Source: ABdhPJxJkSZPTj2E1cruHSDCJr8lL1DADQ2cLxDq8PU5VnhLFEqgzTcMDJzB1wObuub61ameieOo/g==
X-Received: by 2002:a5d:510a:: with SMTP id s10mr20122601wrt.402.1605548486009;
        Mon, 16 Nov 2020 09:41:26 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:41:25 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 05/42] drm/exynos/exynos_drm_fimd: Add missing description for param 'ctx'
Date:   Mon, 16 Nov 2020 17:40:35 +0000
Message-Id: <20201116174112.1833368-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/exynos/exynos_drm_fimd.c:733: warning: Function parameter or member 'ctx' not described in 'fimd_shadow_protect_win'

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index bb67cad8371f0..49a2e0c539187 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -725,6 +725,7 @@ static void fimd_win_set_colkey(struct fimd_context *ctx, unsigned int win)
 /**
  * shadow_protect_win() - disable updating values from shadow registers at vsync
  *
+ * @ctx: local driver data
  * @win: window to protect registers for
  * @protect: 1 to protect (disable updates)
  */
-- 
2.25.1

