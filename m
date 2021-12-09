Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE97346F562
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  9 Dec 2021 21:59:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232177AbhLIVCe (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 9 Dec 2021 16:02:34 -0500
Received: from smtp2.axis.com ([195.60.68.18]:28277 "EHLO smtp2.axis.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229505AbhLIVCe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Dec 2021 16:02:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1639083540;
  x=1670619540;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QmD3AuY/nFM7k+lgLyZOUw4foDKoYXZZ/7XSpW0mJrM=;
  b=VhuE9x8IEFxqAce6yvuxridl8YsxRCGpMSRUsHbtL6vufm5y6IPE3YiL
   hG6Uue01FIg/0htCEjP5FnV3qVmip4CXq6OJgIZ+m22RWbKyfRSNSTnUb
   I7gDRwrO1+cjVyMpwj0jtVayRthQ6vnIfT7HOR/iMUBIJygjvGBZ23GCm
   WbuaIeUDBMMxwgLTT2wbZEEM9WJSjI0DiT9bo/8oYpuDaWHiRuUERCqs0
   U5rbV6obqH4vUOcSSsTuxN5VOLAHOWhdkn1GIF+9IkLKvucsdvMPP7jbN
   x3U54dLQ1+kzCTJFR8Ei1QpqIV+zl731cjtLemZi0OdUDBAaLvszvRtra
   A==;
From:   =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jaehoon Chung <jh80.chung@samsung.com>
CC:     Doug Anderson <dianders@google.com>, <kernel@axis.com>,
        <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        =?UTF-8?q?M=C3=A5rten=20Lindahl?= <marten.lindahl@axis.com>
Subject: [PATCH v4 1/4] dt-bindings: mmc: exynos-dw-mshc: Add support for ARTPEC-8
Date:   Thu, 9 Dec 2021 21:54:53 +0100
Message-ID: <20211209205456.11027-2-marten.lindahl@axis.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211209205456.11027-1-marten.lindahl@axis.com>
References: <20211209205456.11027-1-marten.lindahl@axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The ARTPEC-8 SoC has a DWMMC controller that is compatible with the
Exynos 7 version v2.70a. The main differences from Exynos 7 is that it
does not support HS400 and has extended data read timeout.

Add compatibility string "axis,artpec8-dw-mshc" for ARTPEC-8.

Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---

v2:
 - Change compatible string vendor prefix

v3 -> v4:
 - Add Krzysztof's Reviewed-by tag

 Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt b/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
index 0419a63f73a0..753e9d7d8956 100644
--- a/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
+++ b/Documentation/devicetree/bindings/mmc/exynos-dw-mshc.txt
@@ -22,6 +22,8 @@ Required Properties:
 	  specific extensions.
 	- "samsung,exynos7-dw-mshc-smu": for controllers with Samsung Exynos7
 	  specific extensions having an SMU.
+	- "axis,artpec8-dw-mshc": for controllers with ARTPEC-8 specific
+	  extensions.
 
 * samsung,dw-mshc-ciu-div: Specifies the divider value for the card interface
   unit (ciu) clock. This property is applicable only for Exynos5 SoC's and
-- 
2.20.1

