Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A87E4A3106
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 29 Jan 2022 18:34:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244388AbiA2ReO (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 29 Jan 2022 12:34:14 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:35960
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241070AbiA2ReN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 29 Jan 2022 12:34:13 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 493EF3F1D1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Jan 2022 17:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643477652;
        bh=ZuEiDOWhV4/MXvSraxhDORfUTCUItaxIltcgFzmODQE=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=OsaYhI0gc6zmL8d5whKQhGM88RTgDF7yXiBeQGoJuU+K1Kzkq9eA0LkK73H7cpLn7
         eZf4wX0HydSC3cJAF0+OBJxqtb4bKGuY2n0+jgtL2GGAObP/fnZSh7B+qyJVMBlqqw
         4y7j7kkPyTzP0EqMeP2rZQWIB4XsvKDSPtwY2viY1UX3X86m0fbc7+ZDH+5FZ9OMN6
         nzjTzZSJ7umgMBHV22wiP0WXeppw1avQwftEkvrfS+pFh+xQIQP+wbhZW3Q6YUR+wA
         nNgQEKBcG2Cy5TOqMvrFguf0Ec93E5SGwUihfmcgQr3GIe1FDIwwe5H/zk9AR98Ako
         lsScWgIhM2fdQ==
Received: by mail-ed1-f71.google.com with SMTP id w3-20020a50c443000000b0040696821132so4649896edf.22
        for <linux-samsung-soc@vger.kernel.org>; Sat, 29 Jan 2022 09:34:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZuEiDOWhV4/MXvSraxhDORfUTCUItaxIltcgFzmODQE=;
        b=cMb/x6CDW5rJyos+x1tCVyZygtUktmWIE8Tw9sAzGwy0GI8zFG6ErqFOKfdw1gVpVm
         6dOQNO60dzCpRzOd7lK5HraAmjH9DPz4AV9XqGw9X52Pjtub+i9dIxE95qJdqwfjDLk9
         q8gcIqnKrC+J2VDPQUteSGCKD0DjlOKKQL9QOIajL1OY9bXLyN7G7PvmHasxjeRn+ZyG
         u7c7xMr1s0rxmt/e7SiF4E4ZlcihiN5SlPh68LbQ38X/qbaQp01FoC1YTtolDCbKAhIS
         wwNlYx8bu/nbA7enVtAIs9KyvJrhVB4cxoHecxJfD7X7xI/472MDB3ibvgtOQfI0tEgW
         8vjw==
X-Gm-Message-State: AOAM531Zd+0gsgtGEiCUwFA6Dnzxq7wMUZAGiaTP/V5r6COVFlF6bEwg
        q9UtVM478V8Jzu8XfGYls3wtIdbOM3gRsHvMSMZGAu4KSO46ihTt5y7/9qYpiOOUrD+7g1JRqrm
        Vv36kadl4RgEbv6x2r433dzBv6ZRk/UFdUI+qUWAL0L84+llu
X-Received: by 2002:a17:907:2cc7:: with SMTP id hg7mr5203859ejc.288.1643477651647;
        Sat, 29 Jan 2022 09:34:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwiwyRKb0YWVvVPEq/FWwv5yWs8r/pn2KnZovPieiPe70Duqq+TiEIpanQItvzLIpNIJNkH6w==
X-Received: by 2002:a17:907:2cc7:: with SMTP id hg7mr5203843ejc.288.1643477651452;
        Sat, 29 Jan 2022 09:34:11 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id e18sm14886981edj.85.2022.01.29.09.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 09:34:11 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     kernel test robot <lkp@intel.com>
Subject: [PATCH] clk: samsung: fix missing Tesla FSD dependency on Exynos
Date:   Sat, 29 Jan 2022 18:34:07 +0100
Message-Id: <20220129173407.278591-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Tesla FSD clock controller driver uses shared parts from Exynos
ARM64 clock drivers, so add proper dependency to fix COMPILE_TEST build
errors like:

  /usr/bin/aarch64-linux-gnu-ld: drivers/clk/samsung/clk-fsd.o: in function `fsd_cmu_probe':
  clk-fsd.c:(.init.text+0x9c): undefined reference to `exynos_arm64_register_cmu'

Reported-by: kernel test robot <lkp@intel.com>
Fixes: e3f3dc3810d3 ("clk: samsung: fsd: Add cmu_peric block clock information")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/clk/samsung/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
index 5f64c58f120f..8e8245ab3fd1 100644
--- a/drivers/clk/samsung/Kconfig
+++ b/drivers/clk/samsung/Kconfig
@@ -129,6 +129,7 @@ config S3C2443_COMMON_CLK
 config TESLA_FSD_COMMON_CLK
 	bool "Tesla FSD clock controller support" if COMPILE_TEST
 	depends on COMMON_CLK_SAMSUNG
+	depends on EXYNOS_ARM64_COMMON_CLK
 	help
 	  Support for the clock controller present on the Tesla FSD SoC.
 	  Choose Y here only if you build for this SoC.
-- 
2.32.0

