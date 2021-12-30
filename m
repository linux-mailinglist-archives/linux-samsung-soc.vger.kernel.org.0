Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 136A048200C
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 30 Dec 2021 20:53:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240534AbhL3Txj (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 30 Dec 2021 14:53:39 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:33634
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241818AbhL3Txi (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 30 Dec 2021 14:53:38 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3BF144000E
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Dec 2021 19:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640894017;
        bh=QNADCpp7Mlh0tiTM/IZxnSD9jEJmVsO7Ez+VZPkoolk=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=FZLpCDxlQfhIZFka20t/7kQ05zL58oiE1XaQ5937izdJuHuNYZuNpECW51K5MwYIG
         j8oowMzlW2h6U0JuLxA0SeIkxq5XRylH2u/rUCFYQzkjaOvh72yE4IIG7BVSA8agF/
         upIVb+ADPdFhY2HngydEb3B9s0yiAjK81W6h0lfZB/ZjNyGwDSIP0ziD4erP8yS5GU
         LxyLCmVHvjRmUo6RpbOgQ7zpMypVKCdHwFN+2ZIRMhOFn4wDai2uqaNqlN/+cqT4wm
         DPD6vyDdnLSweKH0/d3ul8rOwtXLxjHodAYb0fmmUabEl7ZZLAUyKEBxz6BIzyb6k+
         miuCPeeaTd5eA==
Received: by mail-lf1-f70.google.com with SMTP id g2-20020a19e042000000b00425cfac0e67so5128972lfj.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 30 Dec 2021 11:53:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QNADCpp7Mlh0tiTM/IZxnSD9jEJmVsO7Ez+VZPkoolk=;
        b=HHoZwFGddCNLTVPf5/FPT5SL032rb8KN248YQwbe9PtIFhz1EF0uyAjrGuOCIF1Lji
         q9x0reLqRrn+EvSGWf1m7k4QYerBsIPW1d41noW87p8mEpED+erW9gjDnCl+7L6B7IDu
         amCErrrGgvjuJwtq2ap5JPTvHlIl5Knre8UE52IbYIHMJyFazovZzGvEeSmkV0gxiLLU
         gfq/udbg4SK369c1O2skMSrhKNlFBe55efc9qhO58N/49hSQn23UQew5HfDABIAy5WTU
         HSuOoO5sXo6GrY0AdKfdRC0B+KCAu+7ZVBxLAaRv2XRcaKYLyH1qSkANL9DlYMxkeEr3
         Qx4Q==
X-Gm-Message-State: AOAM53392iJVToUYltk9+n4qtt1xxCYqq4hi7g+KyghuWPMen0+jfFNT
        ncY1luBEwdgVAP/YUX0MsRsPs+m50LMYxLenXrD+1cuRwnfBoVwgfR3JKT/aWelyRu8RcpD0wm0
        Ba1JvaaGn4s4NPRQ1C46e/6275UMRXqUIQiG6FM8S6n6EVsMo
X-Received: by 2002:ac2:4e0f:: with SMTP id e15mr28637090lfr.352.1640894016663;
        Thu, 30 Dec 2021 11:53:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7O09tl2Ts7mTIWiy2LfEGqGyrflqLZ61fdbAegNO9XsZTDpgxdoRm8WI5V2+TWOtiW3DmOw==
X-Received: by 2002:ac2:4e0f:: with SMTP id e15mr28637080lfr.352.1640894016500;
        Thu, 30 Dec 2021 11:53:36 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id v9sm2454505lja.109.2021.12.30.11.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Dec 2021 11:53:36 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sylwester Nawrocki <snawrocki@kernel.org>, stable@vger.kernel.org
Subject: [RFT][PATCH 2/3] arm64: dts: exynos: fix WLAN pin configuration in TM2
Date:   Thu, 30 Dec 2021 20:53:24 +0100
Message-Id: <20211230195325.328220-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211230195325.328220-1-krzysztof.kozlowski@canonical.com>
References: <20211230195325.328220-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Each pin configuration in pin controller should be a node with
"samsung,pins" and other similar properties.  However the macro PIN()
(used for initial/sleep states) defines entire node, so PCIe WLAN pin
configuration node was ignored.

Fixes: 98c03b6eef3f ("arm64: dts: exynos: add the WiFi/PCIe support to TM2(e) boards")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index cbcc01a66aab..c5054c7a9c03 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -1104,8 +1104,11 @@ &pinctrl_ese {
 	pinctrl-names = "default";
 	pinctrl-0 = <&initial_ese>;
 
-	pcie_wlanen: pcie-wlanen {
-		PIN(INPUT, gpj2-0, UP, FAST_SR4);
+	pcie_wlanen: pcie-wlanen-pins {
+		samsung,pins = "gpj2-0";
+		samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
+		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
+		samsung,pin-drv = <EXYNOS5433_PIN_DRV_FAST_SR4>;
 	};
 
 	initial_ese: initial-state {
-- 
2.32.0

