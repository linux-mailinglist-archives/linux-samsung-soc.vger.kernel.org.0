Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA2902589B7
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  1 Sep 2020 09:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbgIAHzJ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 1 Sep 2020 03:55:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:46790 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727964AbgIAHzJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 1 Sep 2020 03:55:09 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 295C62083B;
        Tue,  1 Sep 2020 07:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598946908;
        bh=sJ7l/mW2vEa/FzNHcyzdJj5d6vHGsbPKkUb+agqcixg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LNYFITvpVJM8kbucSKXFQYnsgnsAdJj6GT+ccX5rMwIqGeKf3RLrPpZ7mjbFKTAjE
         4ugpO+bmZJkCLLvwpamNjgdLDMF8K7oOAeYjjI7IJadJADThI6LONCM/BE9pwf69XP
         50kOHCtDJEK2v6XDIYmyaafHPjqaGJSdrwgDp1Jc=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 10/13] ARM: dts: exynos: Silence DP HPD pinctrl dtschema warning in Exynos5250 Spring
Date:   Tue,  1 Sep 2020 09:54:14 +0200
Message-Id: <20200901075417.22481-11-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901075417.22481-1-krzk@kernel.org>
References: <20200901075417.22481-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The pin configuration of Display Port HPD GPIO emds with '-gpio' which
confuses dtschema:

  arch/arm/boot/dts/exynos5250-spring.dt.yaml: pinctrl@11400000: dp-hpd-gpio:
    {'samsung,pins': ['gpc3-0'], ... 'samsung,pin-drv': [[0]], 'phandle': [[23]]} is not of type 'array'
    From schema: lib/python3.6/site-packages/dtschema/schemas/gpio/gpio-consumer.yaml

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos5250-spring.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5250-spring.dts b/arch/arm/boot/dts/exynos5250-spring.dts
index 166a0d287633..a92ade33779c 100644
--- a/arch/arm/boot/dts/exynos5250-spring.dts
+++ b/arch/arm/boot/dts/exynos5250-spring.dts
@@ -457,7 +457,7 @@
 		samsung,pin-drv = <EXYNOS4_PIN_DRV_LV1>;
 	};
 
-	dp_hpd_gpio: dp-hpd-gpio {
+	dp_hpd_gpio: dp-hpd {
 		samsung,pins = "gpc3-0";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-- 
2.17.1

