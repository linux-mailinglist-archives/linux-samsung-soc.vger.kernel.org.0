Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E3AEC165A9B
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 20 Feb 2020 10:56:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbgBTJ44 (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 20 Feb 2020 04:56:56 -0500
Received: from foss.arm.com ([217.140.110.172]:39210 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726771AbgBTJ4z (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 20 Feb 2020 04:56:55 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D16A530E;
        Thu, 20 Feb 2020 01:56:54 -0800 (PST)
Received: from e123648.arm.com (unknown [10.37.12.146])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 624A33F703;
        Thu, 20 Feb 2020 01:56:51 -0800 (PST)
From:   Lukasz Luba <lukasz.luba@arm.com>
To:     linux-kernel@vger.kernel.org, kgene@kernel.org, krzk@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
Cc:     myungjoo.ham@samsung.com, kyungmin.park@samsung.com,
        cw00.choi@samsung.com, robh+dt@kernel.org, mark.rutland@arm.com,
        b.zolnierkie@samsung.com, lukasz.luba@arm.com,
        dietmar.eggemann@arm.com
Subject: [RESEND PATCH v2 0/2] Enable Odroid-XU3/4 to use Energy Model and Energy Aware Scheduler 
Date:   Thu, 20 Feb 2020 09:56:34 +0000
Message-Id: <20200220095636.29469-1-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi all,

This is just a resend, now with proper v2 in the patches subject.

The Odroid-XU4/3 is a decent and easy accessible ARM big.LITTLE platform,
which might be used for research and development.

This small patch set provides possibility to run Energy Aware Scheduler (EAS)
on Odroid-XU4/3 and experiment with it. 

The patch 1/2 provides 'dynamic-power-coefficient' in CPU DT nodes, which is
then used by the Energy Model (EM).
The patch 2/2 enables SCHED_MC (which adds another level in scheduling domains)
and enables EM making EAS possible to run (when schedutil is set as a CPUFreq
governor).

1. Test results

Two types of different tests have been executed. The first is energy test
case showing impact on energy consumption of this patch set. It is using a
synthetic set of tasks (rt-app based). The second is the performance test
case which is using hackbench (less time to complete is better).
In both tests schedutil has been used as cpufreq governor. In all tests
PROVE_LOCKING has not been compiled into the kernels.

1.1 Energy test case

10 iterations of 24 periodic rt-app tasks (16ms period, 10% duty-cycle)
with energy measurement. The cpufreq governor - schedutil. Unit is Joules.
The energy is calculated based on hwmon0 and hwmon3 power1_input.
The goal is to save energy, lower is better.

+-----------+-----------------+------------------------+
|           | Without patches | With patches           |
+-----------+--------+--------+----------------+-------+
| benchmark |  Mean  | RSD*   | Mean           | RSD*  |
+-----------+--------+--------+----------------+-------+
| 24 rt-app |  21.56 |  1.37% |  19.85 (-9.2%) | 0.92% |
|    tasks  |        |        |                |       |
+-----------+--------+--------+----------------+-------+

1.2 Performance test case

10 consecutive iterations of hackbench (hackbench -l 500 -s 4096),
no delay between two successive executions.
The cpufreq governor - schedutil. Units in seconds.
The goal is to see not regression, lower completion time is better.

+-----------+-----------------+------------------------+
|           | Without patches | With patches           |
+-----------+--------+--------+----------------+-------+
| benchmark | Mean   | RSD*   | Mean           | RSD*  |
+-----------+--------+--------+----------------+-------+
| hackbench |  8.15  | 2.86%  |  7.95 (-2.5%)  | 0.60% |
+-----------+--------+--------+----------------+-------+

*RSD: Relative Standard Deviation (std dev / mean)

Changes:
v2:
- changed dynamic power coeffcient to 90 for A7, which prevents odd
  behaviour for some low utilisation and at low OPPs;
  now, the power ratio is ~3x between big an LITTLE core;
  it's better aligned with [1]; probably due to measurement noise
  at lower OPPs the values obtained from hwmon0|3 were different
  from reality; some synthetic workloads showed this differences
- cleaned commit messages (no measurements in commit message)
- merged configs into one patch and re-ordered patches
- provided energy measurmements in the cover letter
- measurements focused on comparing similar setup - with schedutil governor,
  to compare apples with apples

The v1 can be found in [2].
The patch set is on top of Krzysztof's tree, branch 'next/dt' [3] and has 
been tested on Odroid-XU3 rev0.2 20140529.

Regards,
Lukasz Luba

[1] https://www.cl.cam.ac.uk/~rdm34/big.LITTLE.pdf
[2] https://lore.kernel.org/linux-arm-kernel/20200127215453.15144-1-lukasz.luba@arm.com/T/
[3] https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/log/?h=next/dt


Lukasz Luba (2):
  ARM: dts: exynos: Add dynamic-power-coefficient to Exynos5422 CPUs
  ARM: exynos_defconfig: Enable SCHED_MC and ENERGY_MODEL

 arch/arm/boot/dts/exynos5422-cpus.dtsi | 8 ++++++++
 arch/arm/configs/exynos_defconfig      | 2 ++
 2 files changed, 10 insertions(+)

-- 
2.17.1

