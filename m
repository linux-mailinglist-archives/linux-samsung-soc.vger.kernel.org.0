Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F1DE2AA57E
	for <lists+linux-samsung-soc@lfdr.de>; Sat,  7 Nov 2020 14:39:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728130AbgKGNjo (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 7 Nov 2020 08:39:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbgKGNjn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 7 Nov 2020 08:39:43 -0500
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 940E2C0613CF;
        Sat,  7 Nov 2020 05:39:42 -0800 (PST)
Received: by mail-lf1-x136.google.com with SMTP id 126so5846293lfi.8;
        Sat, 07 Nov 2020 05:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lAR/h1wV/mVrmRlM3JEvsi3/vv0tMjOOYCctIjXs1fA=;
        b=AhDiTzaqcIBZB/kD/hlamzvzQ/LFTFLzK2Ti4G+IBZg9/+yDi5Mw2INNbxyzhei+lu
         G0EvTSygiRODFHWPQJW70UBEGeCEGtL7TOXZR85U6Sl65Pc/wZmfY2Gs/iOsbyZ9toOg
         26gI68BDpXhyRpQMGhGLDbOmvAJgFk76xSeRhYTq4zn2FPR1lH8lGm4tbIjNoBrDmGZN
         nBdkXRqVyK9qa73nHLG8TPyaoeT4isYOR1iT6cQnJXzUPGpz8EytJH+zgtgH6E6vlXCR
         UjXKSLU/vFpGAmi46NVNjgH2Sn5kyi0do8wkLWim659Op9OS3hIJYOXUdQaU/TY3lSH5
         1DrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lAR/h1wV/mVrmRlM3JEvsi3/vv0tMjOOYCctIjXs1fA=;
        b=fOn8M6iIvLFKLGVGYn660Kdr+GsrQnp0iZLA7XEpOpMxFI0FXxA+bwNKYDlCyBKZ9T
         0MEsOTmW7Pt8WPXBiJNKvVGGsJa3awK4JNyoeKuWx7Bs0nhD6hJDKDbfY/dmn3YBpxJl
         0M9a7krsnIdjySElzOfsHamqLoOmoHHXreAN8EnpdeJ9RYuzg4WaaY8qcR8GpFXAUXwi
         ezXrxlRjYq+yuLw/yEVstzLSwuK6sKjrNUUdPIhTFuVDYDPLwpIR+TDoRnPZBTPCVeqB
         aZJ79XAHbBYK5of/jEuSVujEtu8fY7CZJ6+mGJGTACMXPgJ7rR+VrLVMtASMkovKXXsm
         nUyg==
X-Gm-Message-State: AOAM5304d96C0Vy3j699ArS1QAsd3rtYAvjH06zPR61wTRP+YLB6Iksc
        3pmGn7VE4WlELJkciQSDD/E=
X-Google-Smtp-Source: ABdhPJxGEb/igDJY7FFYn1Atx88+hv86yhzhEjECh4F4QIcwxm/ZUYV/HiIyeNiwwYfb9+TtVWFh0w==
X-Received: by 2002:ac2:533b:: with SMTP id f27mr2495942lfh.57.1604756381108;
        Sat, 07 Nov 2020 05:39:41 -0800 (PST)
Received: from localhost.localdomain ([2a02:a315:5445:5300:d646:fcbb:9c5e:1da1])
        by smtp.googlemail.com with ESMTPSA id y27sm524189ljm.74.2020.11.07.05.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2020 05:39:40 -0800 (PST)
From:   =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
To:     kgene@kernel.org, krzk@kernel.org, alim.akhtar@samsung.com
Cc:     robh+dt@kernel.org, a.kesavan@samsung.com,
        naveenkrishna.ch@gmail.com, thomas.ab@samsung.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH v2 2/2] arm64: dts: exynos: Correct psci compatible used on Exynos7
Date:   Sat,  7 Nov 2020 14:39:26 +0100
Message-Id: <20201107133926.37187-2-pawel.mikolaj.chmiel@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201107133926.37187-1-pawel.mikolaj.chmiel@gmail.com>
References: <20201107133926.37187-1-pawel.mikolaj.chmiel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

It's not possible to reboot or poweroff Exynos7420 using PSCI. Instead
we need to use syscon reboot/poweroff drivers, like it's done for other
Exynos SoCs. This was confirmed by checking vendor source and testing it
on Samsung Galaxy S6 device based on this SoC.

To be able to use custom restart/poweroff handlers instead of PSCI
functions, we need to correct psci compatible. This also requires us to
provide function ids for CPU_ON and CPU_OFF.

Fixes: fb026cb65247 ("arm64: dts: Add reboot node for exynos7")
Fixes: b9024cbc937d ("arm64: dts: Add initial device tree support for exynos7")
Signed-off-by: Paweł Chmiel <pawel.mikolaj.chmiel@gmail.com>
---
Changes from v1:
  - Split into two separate patches.
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 723f5d5fcf00..fff383206545 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -117,8 +117,10 @@ cpu_atlas3: cpu@3 {
 	};
 
 	psci {
-		compatible = "arm,psci-0.2";
+		compatible = "arm,psci";
 		method = "smc";
+		cpu_off = <0x84000002>;
+		cpu_on = <0xC4000003>;
 	};
 
 	soc: soc@0 {
-- 
2.27.0

