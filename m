Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3EB92B4E02
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 16 Nov 2020 18:48:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387704AbgKPRlh (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 16 Nov 2020 12:41:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387632AbgKPRl0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 16 Nov 2020 12:41:26 -0500
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D99B1C0613D2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Nov 2020 09:41:25 -0800 (PST)
Received: by mail-wr1-x441.google.com with SMTP id k2so19701004wrx.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 16 Nov 2020 09:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OKxekprTcNWz9+T5s0dM8zcd4eG/OHSFQB40CDP13bg=;
        b=K0L/9SHj1TE4qgK/G74Ybc4BmPXgT70P/+LQzzWk7FqljjPYxDyFVBlO0hyHH3Eok5
         WcZKuIqWcNwV8S4EUwH8l7RzxNih5aR0EM9Hs7pODYsYMs9n9Ayv2dDmr2WyL5Hr0Nld
         dK8/Amdzuk+cPNmMGrkSlM8MIBabHVMUy5c81Qg4eiMjJsSH2tSlQAKiNc57EqDo4THe
         F8MYpIg2VS50N2/OpByLFDpRhEJA99set0DNg+4TdqFgqNC3Fh+c+vyJfI12wmxxqxyF
         VZsyoC+ZHhP+ZbBgejKK9jahMArlb3Rd3uDqr691znFoNLsleg8+x+2A6ar0ZLvs1tAK
         9g+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OKxekprTcNWz9+T5s0dM8zcd4eG/OHSFQB40CDP13bg=;
        b=sjSo+gPakouh7+zGu04whiMqucNwgNvBSnPDbvCRT5vk3cZu/d03G9SV4XSECTjjoZ
         T057FDsOKARGoKBWIkwuhYUfzeQX+twNigCgTNoU50e5lwXQAeXH1bk1rUwn8uaL3fzs
         h8cz2Avd2wpXvWKKLcWPLBAdpQ+QhSSdRgjIkBv4cZTmgKmqOhrq6EtV2coJYmBB4IIP
         NOb/ZYoZMaUfl2Iqv9IG8AB2yMeAJyAqs6o7QwbYo+DsgAJ4wM51Ic2kXtVDm2lT21+y
         mER/HjpPAdo2InWhjlQJp2QG9IqKQ50YQL32mM80KnTg80JZjXlc6R2yiLY0S0b3H6a0
         tTjg==
X-Gm-Message-State: AOAM533eSryb6nG5XrGLlj0WG4oIKoEDHjW6LRIdbAdRknr+s8qFOsvp
        msLR/lUp56n8H8+YfxTnBL7zyg==
X-Google-Smtp-Source: ABdhPJyumUoV2OiCGOmwstnxb6PtqFSofQ2hgjkU4IZojdi/6zntKSiyOYzsOrC7hc8z/Pjmvb2eVw==
X-Received: by 2002:a05:6000:110c:: with SMTP id z12mr20265161wrw.214.1605548484458;
        Mon, 16 Nov 2020 09:41:24 -0800 (PST)
Received: from dell.default ([91.110.221.159])
        by smtp.gmail.com with ESMTPSA id n10sm24667224wrx.9.2020.11.16.09.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 09:41:23 -0800 (PST)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Akshu Agarwal <akshua@gmail.com>,
        Ajay Kumar <ajaykumar.rs@samsung.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 04/42] drm/exynos/exynos7_drm_decon: Supply missing description for  param 'ctx'
Date:   Mon, 16 Nov 2020 17:40:34 +0000
Message-Id: <20201116174112.1833368-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201116174112.1833368-1-lee.jones@linaro.org>
References: <20201116174112.1833368-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/exynos/exynos7_drm_decon.c:354: warning: Function parameter or member 'ctx' not described in 'decon_shadow_protect_win'

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Akshu Agarwal <akshua@gmail.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/exynos/exynos7_drm_decon.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/exynos/exynos7_drm_decon.c b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
index f2d87a7445c73..431c5d32f9a47 100644
--- a/drivers/gpu/drm/exynos/exynos7_drm_decon.c
+++ b/drivers/gpu/drm/exynos/exynos7_drm_decon.c
@@ -346,6 +346,7 @@ static void decon_win_set_colkey(struct decon_context *ctx, unsigned int win)
 /**
  * shadow_protect_win() - disable updating values from shadow registers at vsync
  *
+ * @ctx: display and enhancement controller context
  * @win: window to protect registers for
  * @protect: 1 to protect (disable updates)
  */
-- 
2.25.1

