Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1843A29C001
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 27 Oct 2020 18:12:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1816800AbgJ0RJz (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 27 Oct 2020 13:09:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:37886 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1816706AbgJ0RJz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 27 Oct 2020 13:09:55 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9784820809;
        Tue, 27 Oct 2020 17:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603818594;
        bh=z6UP311joMNUI2Y3DIxTjxExmn5RPbWIOQuoidt8y3A=;
        h=From:To:Cc:Subject:Date:From;
        b=1EMpNevVP5VuU3SS+WHzSzlR907CFo3D6f+K6/WjVq2QOv7V6kDucG91wER8FN2T3
         wjrxO3HCDQi4+FdCHIujO5z+6CHDGRm7APM3gV15AOEDb2ip1WL85TbTdVmuUkCVJ6
         H4Km3kJy2XRokOtNhLzYpWuZ+fsBg+8bpbzAaYos=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v2 00/12] ARM: dts: samsung: minor node name cleanups
Date:   Tue, 27 Oct 2020 18:09:35 +0100
Message-Id: <20201027170947.132725-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi All,

Changes since v1
================
1. Use names proposed by Marek (light-sensor, audio-codec, image-sensor,
   power-sensor),
2. Use amplifier in max98504 node name.

Description
===========
A new Exynos4412 board was recently submitted and it (as expected)
copied all not-the-best patterns from existing DTSes.  Let's fix few of
them so any new boards will not copy old choices.

Best regards,
Krzysztof

Krzysztof Kozlowski (12):
  ARM: dts: exynos: adjust node names to DT spec in Exynos3250 boards
  ARM: dts: exynos: adjust node names to DT spec in Exynos4210 boards
  ARM: dts: exynos: override GPIO keys node by label in Exynos4412
    Odroid family
  ARM: dts: exynos: adjust node names to DT spec in Exynos4412 boards
  ARM: dts: exynos: remove redundant status=okay in Exynos4412 boards
  ARM: dts: exynos: adjust node names to DT spec in Exynos5250 boards
  ARM: dts: exynos: adjust node names to DT spec in Odroid XU
  ARM: dts: exynos: adjust node names to DT spec in Exynos542x boards
  ARM: dts: s5pv210: adjust node names to DT spec
  arm64: dts: exynos: adjust node names to DT spec in Exynos5433 TM2
  arm64: dts: exynos: adjust node names to DT spec in Exynos7 Espresso
  arm64: dts: exynos: remove redundant status=okay in Exynos5433 TM2

 arch/arm/boot/dts/exynos3250-artik5.dtsi      |  2 +-
 arch/arm/boot/dts/exynos3250-monk.dts         |  8 +++---
 arch/arm/boot/dts/exynos3250-rinato.dts       |  8 +++---
 arch/arm/boot/dts/exynos4210-i9100.dts        |  6 ++--
 arch/arm/boot/dts/exynos4210-origen.dts       |  4 +--
 arch/arm/boot/dts/exynos4210-smdkv310.dts     | 22 +++++++--------
 arch/arm/boot/dts/exynos4210-trats.dts        |  4 +--
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi   |  9 +++---
 arch/arm/boot/dts/exynos4412-itop-elite.dts   |  2 +-
 .../boot/dts/exynos4412-itop-scp-core.dtsi    |  2 +-
 arch/arm/boot/dts/exynos4412-midas.dtsi       | 17 +++++------
 arch/arm/boot/dts/exynos4412-n710x.dts        |  2 +-
 .../boot/dts/exynos4412-odroid-common.dtsi    | 10 +++----
 arch/arm/boot/dts/exynos4412-odroidx.dts      | 28 +++++++++----------
 arch/arm/boot/dts/exynos4412-origen.dts       | 14 +++++-----
 arch/arm/boot/dts/exynos4412-smdk4412.dts     | 20 ++++++-------
 arch/arm/boot/dts/exynos5250-arndale.dts      |  6 ++--
 arch/arm/boot/dts/exynos5250-smdk5250.dts     |  4 +--
 arch/arm/boot/dts/exynos5250-snow-common.dtsi |  4 +--
 arch/arm/boot/dts/exynos5250-snow-rev5.dts    |  2 +-
 arch/arm/boot/dts/exynos5250-snow.dts         |  2 +-
 arch/arm/boot/dts/exynos5250-spring.dts       |  2 +-
 arch/arm/boot/dts/exynos5410-odroidxu.dts     |  2 +-
 arch/arm/boot/dts/exynos5420-arndale-octa.dts |  4 +--
 arch/arm/boot/dts/exynos5420-peach-pit.dts    |  6 ++--
 arch/arm/boot/dts/exynos5420-smdk5420.dts     |  2 +-
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi |  2 +-
 .../boot/dts/exynos5422-odroidxu3-audio.dtsi  |  2 +-
 .../boot/dts/exynos5422-odroidxu3-common.dtsi |  4 +--
 arch/arm/boot/dts/exynos5422-odroidxu3.dts    |  8 +++---
 arch/arm/boot/dts/exynos5800-peach-pi.dts     |  4 +--
 arch/arm/boot/dts/s5pv210-aquila.dts          | 12 ++++----
 arch/arm/boot/dts/s5pv210-aries.dtsi          |  4 +--
 arch/arm/boot/dts/s5pv210-goni.dts            | 14 +++++-----
 arch/arm/boot/dts/s5pv210-smdkv210.dts        | 20 ++++++-------
 .../dts/exynos/exynos5433-tm2-common.dtsi     | 11 ++++----
 .../boot/dts/exynos/exynos7-espresso.dts      |  2 +-
 37 files changed, 135 insertions(+), 140 deletions(-)

-- 
2.25.1

