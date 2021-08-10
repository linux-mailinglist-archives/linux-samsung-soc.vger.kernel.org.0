Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A39F3DC54E
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 31 Jul 2021 11:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232752AbhGaJYq (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 31 Jul 2021 05:24:46 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:59912
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229703AbhGaJYp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 31 Jul 2021 05:24:45 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 4E1903F235
        for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Jul 2021 09:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627723477;
        bh=kGo37r3WhFCeIFTyZEtB2b0clBfBYswptDUZjNvqtBo=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Pn5AM4+RTr3v2gvWU1GhJ6S64vSgytYHeNA6eItQhTIv6qNo/LWYeYVa5A/DBGcsP
         eIfLt8k1wW7JwwWG1ltx1ob2wJWvBau/4iqAfFJDKIzlW8vqIoLsvCpX9uQTr/pH59
         d3UuqaLmYqumd+msboGpIUQyo0fRwCgGqFQrUoDkOqiPuAbY3VLLA3BqPXc+zdlhuJ
         tDSwlKFreAwZUPLAXTfvwqv/alcbTp/ccKii84eaUPffFlxtsRdlhtkaARXkAmqkxL
         Dl+FfugIrK4btbosHu9Cva7YtijZUDZgGYqUTB4p9WkegXUlPKv4BXM8E4YeOwDcTY
         8AOVpOrnjb56g==
Received: by mail-ed1-f71.google.com with SMTP id p2-20020a50c9420000b02903a12bbba1ebso5853463edh.6
        for <linux-samsung-soc@vger.kernel.org>; Sat, 31 Jul 2021 02:24:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kGo37r3WhFCeIFTyZEtB2b0clBfBYswptDUZjNvqtBo=;
        b=HD+bHdPPvbfY0NHBwkLg+5kFEed428RQjJBOB5IQFjllZz7CFy8qiOJ62aojf6/4DI
         Yap/R/3JvRyzzcKxPnE9l5UcH2LjLQlVZVDKCUQ9XdJKt6LMxaZSDtqfW22JFbmggHBb
         8IQb9TPZcT0hwiUKcWVNjwnZ7Wiv3+UnnMUBIVfpP8Zv3QDY9x4TWW/QOH8+8/1jHP2l
         MzxBEntFo4xP2Gctt+4kr9vUe9OEYVxSAQCQ3dZq7Mmp65e79GkCXYvWWo9lmVyHrkag
         3eiYwDlI6Co8ng3A+z/2M5s7nNVYgGSdEUZFQG05RLvS5vi88tvt6d2v92qCF8WNcyC8
         LJWw==
X-Gm-Message-State: AOAM531UwccChCd0euOt94yNFdbnymyTGpQ+rUZTkVBHqhAy9Q1UlZuN
        NRVqw6+Wcy0xzaaG5ToRzACq2MNhywQ/0wxAraznJ/WJqEBDPSipOst18qe+lwh5iZcnfwngsIe
        Lu+IT+EoiH2K2YIh76vL246ZjKAKHT3Jf/tnfICG/vFkfrM6T
X-Received: by 2002:a05:6402:28f:: with SMTP id l15mr8056973edv.131.1627723475766;
        Sat, 31 Jul 2021 02:24:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaUYFBiBXOj/YrSnv2G1IxSRpz8mT9DY7R7LnPnM3pnBBdSPX26G/dea1pdGER5HCdqQwzig==
X-Received: by 2002:a05:6402:28f:: with SMTP id l15mr8056962edv.131.1627723475618;
        Sat, 31 Jul 2021 02:24:35 -0700 (PDT)
Received: from localhost.localdomain ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id r16sm1947693edt.15.2021.07.31.02.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jul 2021 02:24:35 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 2/8] ARM: dts: exynos: add CPU topology to Exynos4210
Date:   Sat, 31 Jul 2021 11:24:03 +0200
Message-Id: <20210731092409.31496-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210731092409.31496-1-krzysztof.kozlowski@canonical.com>
References: <20210731092409.31496-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Describe Exynos4210 CPU topology.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos4210.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 70baad9b11f0..7e7d65ce6585 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -32,6 +32,17 @@ cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+				core1 {
+					cpu = <&cpu1>;
+				};
+			};
+		};
+
 		cpu0: cpu@900 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a9";
-- 
2.27.0

