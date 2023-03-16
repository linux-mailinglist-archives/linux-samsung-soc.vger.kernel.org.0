Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBDA06BDAB1
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 16 Mar 2023 22:16:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbjCPVQR (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 16 Mar 2023 17:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbjCPVQQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Mar 2023 17:16:16 -0400
X-Greylist: delayed 85661 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 16 Mar 2023 14:16:13 PDT
Received: from out-36.mta0.migadu.com (out-36.mta0.migadu.com [91.218.175.36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2EB6CB06A
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Mar 2023 14:16:13 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
        t=1679001371;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=v+zHbSGmRfs2ThNPQvpaczg/D7f0u+ssXZGE4jrt+LQ=;
        b=kcwb2UHIK0yMluFgLREHfuWvlpPNkwMl3KTjNs1WIDOkVtMHHy6x66ZN399UI8ty8COx7v
        VgxQsWQ7fXxaHEqkmqzER9gYEu9wqaYR1WnJRwWcnilN7VF4LgbQh07qGjdyYVBcKWNW2K
        5+L+KdFlu5lgxT4UTbtoazOD2gCUliw=
From:   Henrik Grimler <henrik@grimler.se>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        alim.akhtar@samsung.com, m.szyprowski@samsung.com,
        jenneron@protonmail.com, markuss.broks@gmail.com,
        martin.juecker@gmail.com, virag.david003@gmail.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Cc:     Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v5 0/2]  ARM: dts: add mmc aliases for Exynos devices
Date:   Thu, 16 Mar 2023 22:15:56 +0100
Message-Id: <20230316211558.8526-1-henrik@grimler.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

It is convenient to have fixed mmcblk numbering of the eMMC and sdcard
so that assigned numbers will not change from boot-to-boot or
depending on if storage devices are actually attached or not.

Anton Bambura has done the work for the chromebooks while I have
looked at the other devices.  On the chromebooks, mmc0 is used for
eMMC and mmc1 for sdcard, while mmc0 is used for eMMC and mmc2 for
sdcard on the other boards, simply because Anton and I had different
preferences.

Also drop mshc aliases while we are at it and instead add mmc
capabilities to the individual device trees (right now they are added
depending on alias index).  I have tested the changes on
exynos4412-odroid-u2 and exynos5422-odroid-xu4: the MMC_CAP_1_8V_DDR
and MMC_CAP_8_BIT_DATA caps are set correctly (meaning they are set
for mshc_0/mmc_0 but not mshc_2/mmc_2) both before and after this
patchset.

---

Changes since v4:
* Do not set mmc-ddr-1_8v for sdhci_0 on Exynos 4210,
  following Marek's tests
* Collect tags

Changes since v3:
* Skip sorting of nodes, to not make reviewing impossible (and I need
  to read up on preferred style)
* Move two mmc alias additions from patch 1 to patch 2

Changes since v2:
* Set mmc-ddr-1_8v in device trees so that MMC_CAP_1_8V_DDR is set
  also after removal of mshc0 alias.  Issue was pointed out by Krzysztof
  and David.
* Fix whitespace issue in patch 2 which was pointed out by Krzysztof
* Reword commit message of patch 2 after Rob's comment

Changes since v1:
* Move mshc alias cleanup to a separate commit
* Use mmc0 and mmc1 (instead of mmc0 and mmc2) for eMMC and sdcard on
  chromebooks
* Address Krzysztof's review comments:
 - Make changes per device rather than in soc dtsi

Henrik Grimler (2):
  ARM: dts: exynos: replace mshc0 alias with mmc-ddr-1_8v property
  ARM: dts: exynos: add mmc aliases

 arch/arm/boot/dts/exynos3250-artik5-eval.dts        | 5 +++++
 arch/arm/boot/dts/exynos3250-artik5.dtsi            | 6 ++++++
 arch/arm/boot/dts/exynos3250-monk.dts               | 2 ++
 arch/arm/boot/dts/exynos3250-rinato.dts             | 3 +++
 arch/arm/boot/dts/exynos4210-i9100.dts              | 6 ++++++
 arch/arm/boot/dts/exynos4210-origen.dts             | 5 +++++
 arch/arm/boot/dts/exynos4210-smdkv310.dts           | 4 ++++
 arch/arm/boot/dts/exynos4210-trats.dts              | 6 ++++++
 arch/arm/boot/dts/exynos4210-universal_c210.dts     | 6 ++++++
 arch/arm/boot/dts/exynos4412-itop-elite.dts         | 4 ++++
 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi     | 5 +++++
 arch/arm/boot/dts/exynos4412-midas.dtsi             | 4 ++++
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi     | 6 ++++++
 arch/arm/boot/dts/exynos4412-origen.dts             | 6 ++++++
 arch/arm/boot/dts/exynos4412-p4note.dtsi            | 7 +++++++
 arch/arm/boot/dts/exynos4412-smdk4412.dts           | 4 ++++
 arch/arm/boot/dts/exynos4412-tiny4412.dts           | 4 ++++
 arch/arm/boot/dts/exynos4412.dtsi                   | 1 -
 arch/arm/boot/dts/exynos5250-arndale.dts            | 6 ++++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts           | 3 +++
 arch/arm/boot/dts/exynos5250-snow-common.dtsi       | 4 ++++
 arch/arm/boot/dts/exynos5250-spring.dts             | 6 ++++++
 arch/arm/boot/dts/exynos5250.dtsi                   | 4 ----
 arch/arm/boot/dts/exynos5260-xyref5260.dts          | 6 ++++++
 arch/arm/boot/dts/exynos5410-odroidxu.dts           | 3 +++
 arch/arm/boot/dts/exynos5410-smdk5410.dts           | 6 ++++++
 arch/arm/boot/dts/exynos5420-arndale-octa.dts       | 6 ++++++
 arch/arm/boot/dts/exynos5420-galaxy-tab-common.dtsi | 6 ++++++
 arch/arm/boot/dts/exynos5420-peach-pit.dts          | 4 ++++
 arch/arm/boot/dts/exynos5420-smdk5420.dts           | 6 ++++++
 arch/arm/boot/dts/exynos5420.dtsi                   | 3 ---
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi       | 4 ++++
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi  | 5 +++++
 arch/arm/boot/dts/exynos5422-samsung-k3g.dts        | 1 +
 arch/arm/boot/dts/exynos5800-peach-pi.dts           | 4 ++++
 35 files changed, 153 insertions(+), 8 deletions(-)


base-commit: 0e84f3493a37d50f2f629dbea670135b8a8ee391
-- 
2.30.2

