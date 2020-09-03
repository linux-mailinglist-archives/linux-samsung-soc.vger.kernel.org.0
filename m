Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4682325CAA6
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  3 Sep 2020 22:34:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729633AbgICUeS (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 3 Sep 2020 16:34:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:40754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729621AbgICUdN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Sep 2020 16:33:13 -0400
Received: from localhost.localdomain (unknown [194.230.155.106])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3FD7420678;
        Thu,  3 Sep 2020 20:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599165193;
        bh=6z3I61UrsqdEOlJteYcY9hQ+jdgGM1aWxnw3gt+fAgU=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=hL9jVygnF3BMdbkCrhqqbkhnCtKbgKYLMxqnpnapF/MU1/gThkESEQcXzOu1V05dq
         sFTDQW7vwIUvfi610Ad/C+0SpRzBbkHs/GvT6SOj8T+TWnIvjYnzEhuRon666IxCp1
         9uH7c96wyX9z+KX/KoBZNVTfSiWe66DJPEaUQnLM=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Kukjin Kim <kgene@kernel.org>, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: exynos: Remove undocumented i2s properties in Exynos5433
Date:   Thu,  3 Sep 2020 22:32:49 +0200
Message-Id: <20200903203250.19830-3-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200903203250.19830-1-krzk@kernel.org>
References: <20200903203250.19830-1-krzk@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Few I2S device node properties were not documented and not used by any
of the drivers.  Remove them to fix dtbs_check warning:

  arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: i2s@14d60000:
    Additional properties are not allowed ('samsung,supports-rstclr', 'samsung,supports-tdm',
    'samsung,supports-6ch', 'samsung,supports-low-rfs' were unexpected)

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 9651bb9fdadc..8eb4576da8f3 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1460,10 +1460,6 @@
 				 <&cmu_peric CLK_SCLK_I2S1>;
 			clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
 			#clock-cells = <1>;
-			samsung,supports-6ch;
-			samsung,supports-rstclr;
-			samsung,supports-tdm;
-			samsung,supports-low-rfs;
 			#sound-dai-cells = <1>;
 			status = "disabled";
 		};
-- 
2.17.1

