Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AEB61F8646
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 14 Jun 2020 05:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726636AbgFNDBW (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 13 Jun 2020 23:01:22 -0400
Received: from mta-p8.oit.umn.edu ([134.84.196.208]:35846 "EHLO
        mta-p8.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726486AbgFNDBT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 13 Jun 2020 23:01:19 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-p8.oit.umn.edu (Postfix) with ESMTP id 49kzkQ5dn5z9vZx9
        for <linux-samsung-soc@vger.kernel.org>; Sun, 14 Jun 2020 03:01:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id aoK-CsFgUtIW for <linux-samsung-soc@vger.kernel.org>;
        Sat, 13 Jun 2020 22:01:18 -0500 (CDT)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 49kzkQ3vHZz9vZx3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jun 2020 22:01:18 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 49kzkQ3vHZz9vZx3
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 49kzkQ3vHZz9vZx3
Received: by mail-io1-f69.google.com with SMTP id x2so3525680iof.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 13 Jun 2020 20:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=cOgHpCEAAAGqQDbbixnX7uhIWd2KMk0lv565gUU7esU=;
        b=khudvC7kbksJLnNR3xG6AAZ5VFW/9CNcXYYV/ulZ976gfAAaipmqB15w7jO76lIoMJ
         YB9I982kBR9w2M2joRO5CDUZTExYtrIB+V0LlC2Clx8qohj4QgvSR4xKCR1+jz+K5P50
         iRItj7gd4U5cgYXpFEh+c3c7xRYl7BDUXe9DZOV0IrWnVv0ODucjWYIR8kkFp+dMI3Bu
         lvJssg30dL9Ac1IdAuA+cU0zeb5i61gOVz4dwY/txEbznKi7gXL0wmZKFE9PDWid04Jf
         oeIBsk5tqxN5gI3+uj7e2wd8txqTd7SolqocLPy6eZg/QKXgxQ7oqulCFVCuO/Xp4QM3
         FP6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cOgHpCEAAAGqQDbbixnX7uhIWd2KMk0lv565gUU7esU=;
        b=Wsv9XaCkzSl0ARd1XHzbijehMFm8FG0YP6bExUVRNIsJGAC08FDfQvYEKD1VS9DnFE
         XkV21qeh34qN4OX50+2FtydJBYDxi82LXutYuAEIHjgQu2/fGzDTLGUPX4rfhJG0r+tf
         OGx1p4fDZiHamSUPYBGaxkDcR0NFgCjLkUfYkaDAPsvGEwGq5jQkSF6qzIFx/snMdtsM
         zXVE5EH28fnROeuJzxnDZFjQnU6VHcH+m6IllE0xBKZn7oKJj9lnfUkWUQSRHn2Ofn8n
         nc9EsVcLIBhWcK+FHwtF0K86NpYEjyD2eiRntp6WCgfpYFpDAquzH+kKflzCwWIzwCZI
         REPA==
X-Gm-Message-State: AOAM533gDWjuhclOz7Ad9gK5w9xOMsIqXUcTuiLha7wQ2OZlNNNele41
        SCBFtvuERrkbr1hcSyCVUPYFoEXR85udajQGwTz8IsEDUgTJLLY/9pg6LgqL79iFkfzPvY/tfJV
        R3ZFe8b0A0aaQl6GwD7EhM4KDKNJcFudDz8k=
X-Received: by 2002:a92:d112:: with SMTP id a18mr19876652ilb.3.1592103678097;
        Sat, 13 Jun 2020 20:01:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTFVu29soAQKwJchdpgwjpKebLlBpdEM/Z/hVt5TRB+tZ1yqGgKWvSgKXVBGcdcozs35SC4w==
X-Received: by 2002:a92:d112:: with SMTP id a18mr19876632ilb.3.1592103677826;
        Sat, 13 Jun 2020 20:01:17 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
        by smtp.gmail.com with ESMTPSA id q5sm5656947ile.37.2020.06.13.20.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2020 20:01:17 -0700 (PDT)
From:   wu000273@umn.edu
To:     kjlu@umn.edu
Cc:     wu000273@umn.edu, Kyungmin Park <kyungmin.park@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: exynos4-is: Fix a reference count leak
Date:   Sat, 13 Jun 2020 22:01:11 -0500
Message-Id: <20200614030111.28843-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Qiushi Wu <wu000273@umn.edu>

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code, causing incorrect ref count if
pm_runtime_put_noidle() is not called in error handling paths.
Thus call pm_runtime_put_noidle() if pm_runtime_get_sync() fails.

Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/media/platform/exynos4-is/mipi-csis.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/exynos4-is/mipi-csis.c b/drivers/media/platform/exynos4-is/mipi-csis.c
index 540151bbf58f..1aac167abb17 100644
--- a/drivers/media/platform/exynos4-is/mipi-csis.c
+++ b/drivers/media/platform/exynos4-is/mipi-csis.c
@@ -510,8 +510,10 @@ static int s5pcsis_s_stream(struct v4l2_subdev *sd, int enable)
 	if (enable) {
 		s5pcsis_clear_counters(state);
 		ret = pm_runtime_get_sync(&state->pdev->dev);
-		if (ret && ret != 1)
+		if (ret && ret != 1) {
+			pm_runtime_put_noidle(&state->pdev->dev);
 			return ret;
+		}
 	}
 
 	mutex_lock(&state->lock);
-- 
2.17.1

