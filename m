Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDC056D3887
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  2 Apr 2023 16:47:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbjDBOre (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 2 Apr 2023 10:47:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbjDBOre (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 2 Apr 2023 10:47:34 -0400
Received: from out-43.mta1.migadu.com (out-43.mta1.migadu.com [IPv6:2001:41d0:203:375::2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F1676A4C
        for <linux-samsung-soc@vger.kernel.org>; Sun,  2 Apr 2023 07:47:31 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
        t=1680446849;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=qPfc+eCKh1pSOYkXvXBQlJIfH+6a3ZfZffRcrpKqr+g=;
        b=glTzsPBQQ1wYWXTkdnagOD0wXM6S3zhULf6kyX6Tckw5gAMDK3kTrFl4r+o6XBlQ4Lry7F
        UnG0YvFGfFbFtlnJGRJdxR/5I6xeWD4I8S0U4vvyKO5h0TbwA101cbutWW1E5WabyybA7C
        6wbLk9W8z5xx00Zdckwdm20l9nME17g=
From:   Henrik Grimler <henrik@grimler.se>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        alim.akhtar@samsung.com, m.szyprowski@samsung.com,
        jenneron@protonmail.com, markuss.broks@gmail.com,
        martin.juecker@gmail.com, virag.david003@gmail.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        replicant@osuosl.org
Cc:     Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v7 0/2] ARM: dts: add mmc aliases for Exynos devices
Date:   Sun,  2 Apr 2023 16:47:22 +0200
Message-Id: <20230402144724.17839-1-henrik@grimler.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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

Changes since v6:
* Fix syntax error in patch 2

Changes since v5:
* Make mmc index numbering linear per default (that is, always use 0,
  1, 2 instead of for example 0, 2, 3) for devices where no documentation
  or schematics are available that use other numbering.
* Drop Marek's test tag for patch 2 since mmc numbering has been updated
* Add mmc0 alias to exynos5422-samsung-k3g, was accidentally dropped in v5

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

 arch/arm/boot/dts/exynos3250-artik5-eval.dts        | 4 ++++
 arch/arm/boot/dts/exynos3250-artik5.dtsi            | 6 ++++++
 arch/arm/boot/dts/exynos3250-monk.dts               | 2 ++
 arch/arm/boot/dts/exynos3250-rinato.dts             | 3 +++
 arch/arm/boot/dts/exynos3250.dtsi                   | 3 ---
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
 arch/arm/boot/dts/exynos5422-samsung-k3g.dts        | 5 +++++
 arch/arm/boot/dts/exynos5800-peach-pi.dts           | 4 ++++
 36 files changed, 156 insertions(+), 11 deletions(-)


base-commit: 0e84f3493a37d50f2f629dbea670135b8a8ee391
-- 
2.30.2

