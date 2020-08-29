Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2909256832
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 29 Aug 2020 16:27:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728197AbgH2OZd (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 29 Aug 2020 10:25:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:52958 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728182AbgH2OZ2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 29 Aug 2020 10:25:28 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2B56520CC7;
        Sat, 29 Aug 2020 14:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598711127;
        bh=YSbg7h0ayxjgdw2GfgjcOo+KBfEvxXNZdlQ7lo+NGaI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H/iSmhB41HnMRqEmJuAab+DnQg2/mMdh08DrD9dyzzsng8ajygUtoNK8lCnTXJJ9g
         cLd3Lk3Tfj5nHnX3cHKjFbrOImlQcnYnj3E5xFOeaV2msHbL0KnrmsXdnkCwroEqBK
         Ati+ucwx75Lb6+3+FDAdcqz4vG3fZ8iG0lTz2oiw=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Lee Jones <lee.jones@linaro.org>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        alsa-devel@alsa-project.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>
Subject: [PATCH 03/10] dt-bindings: timer: exynos4210-mct: Use unevaluatedProperties
Date:   Sat, 29 Aug 2020 16:24:54 +0200
Message-Id: <20200829142501.31478-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200829142501.31478-1-krzk@kernel.org>
References: <20200829142501.31478-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Additional properties actually might appear (e.g. clocks) so use
unevaluatedProperties to fix dtbs_check warnings like:

  arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: timer@101c0000:
    'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../devicetree/bindings/timer/samsung,exynos4210-mct.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
index 37bd01a62c52..f46373fca95a 100644
--- a/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
+++ b/Documentation/devicetree/bindings/timer/samsung,exynos4210-mct.yaml
@@ -52,7 +52,7 @@ required:
   - interrupts
   - reg
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.17.1

