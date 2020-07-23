Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6DBD22AF3E
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 23 Jul 2020 14:27:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728867AbgGWMY7 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 23 Jul 2020 08:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728863AbgGWMY6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 23 Jul 2020 08:24:58 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BB8DC0619E2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jul 2020 05:24:58 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id g10so6397207wmc.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 23 Jul 2020 05:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iSQMgw7xYhZP3UZf5+lasa+UwlT/7rt+vW8/trm4LDo=;
        b=TEW85Fn3KvlR1/ox+9FOgeQrHl+00ZEyopmW1JEMK9KRKelWc5NrGfaJxN3lqQocjt
         /+ShTwf5bTX2B+t6pqrYrI0KFMv9Dy23MZNTSixscwlbOkK3Ho1pyXLoFWHN2C+ljKrq
         b88pJwHa3bXMFQivxA9BDoKSj78A328Fg4ZDi4/iXLEOi7kBWi31zoh1V9xLfyCXG4dZ
         ikvg9Gybxxno9+ZFPsTJsZxt8wucOKmp51JMFPFHcTNOlIxGRxLbe+aSTfm78e+cFxCK
         aRAMxjv/PwVmKYVTywGo+sOkMNKX0GngEhlkJgd6OCBvWN5t7Enh9PZTm+CaZezzer93
         veOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iSQMgw7xYhZP3UZf5+lasa+UwlT/7rt+vW8/trm4LDo=;
        b=HIISy8MefeIlZXY+f3lYfg25xlGgwcB+40/CEY3mSgrIBHyCIGx9zaPcN5cdi63sml
         32AJyafnbPASVqsDYzJ3ari9KWm6OmxsA/uA63L3itcOjGg0Gvmu3v4XIQk4ZVlz+CSS
         OFfpvUTV+0zy9zdW3GGIy5oRjtL5sJI6N7bUf416kBhG8kLMrmqrKenLbEzrMxpLO0Xo
         von/qDpeY/B5iOOVvue4iuDV46vq09OKk4dXg4WikX5DGkp1xmPtMoy+Hs1tGqByaiG6
         zt1NjQWmLOWuUpU9cvSgz8INAHFvYVQWIYwEYoz+tFd548saIpcuTYcAxSUkT9/1hYoR
         2nXQ==
X-Gm-Message-State: AOAM531xZ3mGv+3O5nH/N9T0FkFaXYHrsZT+eOqpG5aevsnDFQFfMhPg
        qukAMSgr2jkoPd+oDhTJKHAYuA==
X-Google-Smtp-Source: ABdhPJx+PZHTVIJ+E7nFbXTBN0DlXtTyzH9UQgfnehGYyyVKdjsGVbuV9soY3017Ateok39CNTwCIw==
X-Received: by 2002:a1c:7719:: with SMTP id t25mr4164471wmi.144.1595507097059;
        Thu, 23 Jul 2020 05:24:57 -0700 (PDT)
Received: from localhost.localdomain ([2.27.167.73])
        by smtp.gmail.com with ESMTPSA id j5sm3510651wma.45.2020.07.23.05.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 05:24:56 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     jejb@linux.ibm.com, martin.petersen@oracle.com
Cc:     linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Seungwon Jeon <essuuj@gmail.com>,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 06/40] scsi: ufs: ufs-exynos: Demote seemingly unintentional kerneldoc header
Date:   Thu, 23 Jul 2020 13:24:12 +0100
Message-Id: <20200723122446.1329773-7-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200723122446.1329773-1-lee.jones@linaro.org>
References: <20200723122446.1329773-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This is the only use of kerneldoc in the source file and no
descriptions are provided.

Fixes the following W=1 kernel build warning(s):

In file included from  drivers/scsi/ufs/ufs-exynos.c:23:
 drivers/scsi/ufs/ufs-exynos.c:234: warning: Function parameter or member 'ufs' not described in 'exynos_ufs_auto_ctrl_hcc'
 drivers/scsi/ufs/ufs-exynos.c:234: warning: Function parameter or member 'en' not described in 'exynos_ufs_auto_ctrl_hcc'

Cc: Alim Akhtar <alim.akhtar@samsung.com>
Cc: Avri Altman <avri.altman@wdc.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Seungwon Jeon <essuuj@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/scsi/ufs/ufs-exynos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufs-exynos.c b/drivers/scsi/ufs/ufs-exynos.c
index 3c0a50b7e3560..9151c7455acda 100644
--- a/drivers/scsi/ufs/ufs-exynos.c
+++ b/drivers/scsi/ufs/ufs-exynos.c
@@ -224,7 +224,7 @@ static int exynos7_ufs_post_pwr_change(struct exynos_ufs *ufs,
 	return 0;
 }
 
-/**
+/*
  * exynos_ufs_auto_ctrl_hcc - HCI core clock control by h/w
  * Control should be disabled in the below cases
  * - Before host controller S/W reset
-- 
2.25.1

