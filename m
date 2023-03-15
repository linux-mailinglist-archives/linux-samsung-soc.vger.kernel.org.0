Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA8526BBF0B
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 15 Mar 2023 22:28:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232648AbjCOV2p (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 15 Mar 2023 17:28:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231246AbjCOV2o (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Mar 2023 17:28:44 -0400
Received: from out-55.mta0.migadu.com (out-55.mta0.migadu.com [IPv6:2001:41d0:1004:224b::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCBD01165E
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Mar 2023 14:28:34 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
        t=1678915711;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=2y/+iimD/3GoKfoWgAHErvbVxiAm/Znj5RRYd/ecU6Q=;
        b=d+ZpqSi1HEtakMQIHSt34V+n7FHuzRV9rmGmlD0VjHjWAphmhhkip5rU2LmtTF6+dUlYcS
        1yrz9tEFpmNNX3L/ilGjv6PdqpTk4mNyrxKXL323Hc7lVROsaaxZslZ2TaMxo4a/kSHs4A
        eott3K8+0pjs26sG6IZf4qkEXyO2soQ=
From:   Henrik Grimler <henrik@grimler.se>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        alim.akhtar@samsung.com, m.szyprowski@samsung.com,
        virag.david003@gmail.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Cc:     Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v2 0/2] arm64: dts: add mmc aliases for Exynos devices
Date:   Wed, 15 Mar 2023 22:28:12 +0100
Message-Id: <20230315212814.15908-1-henrik@grimler.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

It is convenient to have fixed mmcblk numbering of the eMMC and sdcard
so that assigned numbers will not change from boot-to-boot or
depending on if storage devices are actually attached or not.

Also drop mshc aliases while we are at it and instead add mmc
capabilities to the individual device trees (right now they are added
depending on alias index).

---

Changes since v1:
* Set mmc-ddr-1_8v in device trees so that MMC_CAP_1_8V_DDR is set
  also after removal of mshc0 alias.  Issue was pointed out by
  Krzysztof and David.


Henrik Grimler (2):
  arm64: dts: exynos: drop mshc aliases
  arm64: dts: exynos: add mmc aliases

 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 5 +++--
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts       | 5 +++--
 arch/arm64/boot/dts/exynos/exynos7885-jackpotlte.dts  | 1 +
 3 files changed, 7 insertions(+), 4 deletions(-)


base-commit: 35ade1eb465438cfd16fdc3a4905dd82f658fdce
-- 
2.30.2

