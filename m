Return-Path: <linux-samsung-soc+bounces-2786-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3C28A8D19
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 17 Apr 2024 22:40:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CD981C2170F
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 17 Apr 2024 20:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3479347F7E;
	Wed, 17 Apr 2024 20:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MSnjzqB7"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D058244C94;
	Wed, 17 Apr 2024 20:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713386432; cv=none; b=kIwKZZ+1vXYo+nEmdIm/Qu6DNV8lAGUCjbKqNqzriLUPNU62kjre5aucBdOXKx0Rrbsf1aNgFqLcFlvTnI5Mx9dHBBQvUHEY/A7ZB82TWWrwYw1XoYTBJ3f6yVeFxd9VnxYG5PyYPCdwGFSOpPoHh4SUtHVLgPKFIdlFPG3p2Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713386432; c=relaxed/simple;
	bh=x2emqiikXbyTIzoc3xfHSQRQQAprN87tbl3TSNncyvo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dKrkZ6OmB0vUYeZvHUiOynPAIi1tx0BpwIMl5+pCKxfH/pFlXpA3RzGvUJU/3KAD3DuzqrR7+AGJlgQmtVoSi+pkZ22U9ohMEpaV3sBKn0MsIF9FtjDCsSHr+omjuVA54I4In9V3hhtAFA2PW9m94xu7hM+K4ZBifBslC63YwVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MSnjzqB7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A49FC116B1;
	Wed, 17 Apr 2024 20:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713386431;
	bh=x2emqiikXbyTIzoc3xfHSQRQQAprN87tbl3TSNncyvo=;
	h=From:List-Id:To:Cc:Subject:Date:From;
	b=MSnjzqB7n97Bw022rvsHegoMlVlxcpk8wjTq5CjNr0PiyOiqZgC1MoCuwlA6FtoUn
	 UU3uERtdh/A5pR4UX4HB7gv3PBFPn0PeGXVwrlEyZ4T8mQ8oXymsOueCpaWO8VQn19
	 8x+8vCR9aUhfo3Tl0iBbKIgz6HFFDAEG3LMcA+Q8+manndsbrDXj0WZBjuNL3347X1
	 Un1nqNvzj2a8zTBLfJ5jr5VaZgGJjTcCeQY7pQHQCtxXAh00sjoacNW3n/j8HMAfog
	 L5WHmWfgHeOeStxIrFaNbEncRWZFGFFSAEG7jGXfk1ng2wQV5YFbnACv4fZbSzwLF6
	 kYinHnoIGQ2gQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: soc@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Tsahee Zidenberg <tsahee@annapurnalabs.com>,
	Antoine Tenart <atenart@kernel.org>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Robert Richter <rric@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-fsd@tesla.com,
	Michal Simek <michal.simek@amd.com>
Cc: devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-realtek-soc@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2] arm/arm64: dts: Drop "arm,armv8-pmuv3" compatible usage
Date: Wed, 17 Apr 2024 15:38:47 -0500
Message-ID: <20240417203853.3212103-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The "arm,armv8-pmuv3" compatible is intended only for s/w models. Primarily,
it doesn't provide any detail on uarch specific events.

There's still remaining cases for CPUs without any corresponding PMU
definition and for big.LITTLE systems which only have a single PMU node
(there should be one per core type).

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Sudeep Holla <sudeep.holla@arm.com>
Acked-by: Dinh Nguyen <dinguyen@kernel.org>
Acked-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
Acked-by: Alim Akhtar <alim.akhtar@samsung.com>
---
SoC Maintainers, Can you please apply this directly.

v2:
 - Drop QCom sdm630 change
---
 arch/arm/boot/dts/broadcom/bcm2711.dtsi              | 4 ++--
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi    | 2 +-
 arch/arm64/boot/dts/amazon/alpine-v2.dtsi            | 2 +-
 arch/arm64/boot/dts/apm/apm-storm.dtsi               | 2 +-
 arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts | 2 +-
 arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi     | 2 +-
 arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi  | 2 +-
 arch/arm64/boot/dts/cavium/thunder-88xx.dtsi         | 2 +-
 arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi        | 2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi       | 2 +-
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi       | 2 +-
 arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi       | 7 +++++++
 arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi       | 7 +++++++
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi       | 5 -----
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi           | 2 +-
 arch/arm64/boot/dts/intel/keembay-soc.dtsi           | 2 +-
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi        | 2 +-
 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi        | 2 +-
 arch/arm64/boot/dts/marvell/armada-37xx.dtsi         | 2 +-
 arch/arm64/boot/dts/mediatek/mt8516.dtsi             | 2 +-
 arch/arm64/boot/dts/nvidia/tegra210.dtsi             | 2 +-
 arch/arm64/boot/dts/qcom/qcm2290.dtsi                | 2 +-
 arch/arm64/boot/dts/qcom/qdu1000.dtsi                | 2 +-
 arch/arm64/boot/dts/qcom/sdx75.dtsi                  | 2 +-
 arch/arm64/boot/dts/realtek/rtd16xx.dtsi             | 2 +-
 arch/arm64/boot/dts/rockchip/rk3368.dtsi             | 2 +-
 arch/arm64/boot/dts/sprd/sc9860.dtsi                 | 2 +-
 arch/arm64/boot/dts/sprd/sc9863a.dtsi                | 2 +-
 arch/arm64/boot/dts/synaptics/berlin4ct.dtsi         | 2 +-
 arch/arm64/boot/dts/tesla/fsd.dtsi                   | 2 +-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi               | 2 +-
 31 files changed, 43 insertions(+), 34 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
index 22c7f1561344..926f87b86590 100644
--- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
@@ -432,8 +432,8 @@ emmc2: mmc@7e340000 {
 		};
 	};
 
-	arm-pmu {
-		compatible = "arm,cortex-a72-pmu", "arm,armv8-pmuv3";
+	pmu {
+		compatible = "arm,cortex-a72-pmu";
 		interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
 			<GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>,
 			<GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index 072fe20cfca0..cbbc53c47921 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -79,7 +79,7 @@ fpga-region {
 	};
 
 	pmu {
-		compatible = "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a53-pmu";
 		interrupts = <0 170 4>,
 			     <0 171 4>,
 			     <0 172 4>,
diff --git a/arch/arm64/boot/dts/amazon/alpine-v2.dtsi b/arch/arm64/boot/dts/amazon/alpine-v2.dtsi
index dbf2dce8d1d6..dbe21d88a29e 100644
--- a/arch/arm64/boot/dts/amazon/alpine-v2.dtsi
+++ b/arch/arm64/boot/dts/amazon/alpine-v2.dtsi
@@ -106,7 +106,7 @@ timer {
 		};
 
 		pmu {
-			compatible = "arm,armv8-pmuv3";
+			compatible = "arm,cortex-a57-pmu";
 			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/apm/apm-storm.dtsi b/arch/arm64/boot/dts/apm/apm-storm.dtsi
index 988928c60f15..ee3f838b4904 100644
--- a/arch/arm64/boot/dts/apm/apm-storm.dtsi
+++ b/arch/arm64/boot/dts/apm/apm-storm.dtsi
@@ -122,7 +122,7 @@ timer {
 	};
 
 	pmu {
-		compatible = "apm,potenza-pmu", "arm,armv8-pmuv3";
+		compatible = "apm,potenza-pmu";
 		interrupts = <1 12 0xff04>;
 	};
 
diff --git a/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts b/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts
index 8db4243a4947..9115c99d0dc0 100644
--- a/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts
+++ b/arch/arm64/boot/dts/arm/vexpress-v2f-1xv7-ca53x2.dts
@@ -102,7 +102,7 @@ timer {
 	};
 
 	pmu {
-		compatible = "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 	};
diff --git a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
index 896d1f33b5b6..cfd9fd23a1c2 100644
--- a/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
+++ b/arch/arm64/boot/dts/broadcom/northstar2/ns2.dtsi
@@ -102,7 +102,7 @@ IRQ_TYPE_LEVEL_LOW)>,
 	};
 
 	pmu {
-		compatible = "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a57-pmu";
 		interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
index d8516ec0dae7..857fa427e195 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
@@ -142,7 +142,7 @@ psci {
 	};
 
 	pmu {
-		compatible = "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a72-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
diff --git a/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi b/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi
index 8ad31dee11a3..4c9f1f808427 100644
--- a/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi
+++ b/arch/arm64/boot/dts/cavium/thunder-88xx.dtsi
@@ -361,7 +361,7 @@ timer {
 	};
 
 	pmu {
-		compatible = "cavium,thunder-pmu", "arm,armv8-pmuv3";
+		compatible = "cavium,thunder-pmu";
 		interrupts = <1 7 4>;
 	};
 
diff --git a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi b/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
index 3419bd252696..68cb3d01187a 100644
--- a/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
+++ b/arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi
@@ -83,7 +83,7 @@ timer {
 	};
 
 	pmu {
-		compatible = "brcm,vulcan-pmu", "arm,armv8-pmuv3";
+		compatible = "brcm,vulcan-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>; /* PMU overflow */
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
index fe9093b3c02e..a0f7bbd691a0 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
@@ -81,7 +81,7 @@ timer {
 	};
 
 	pmu {
-		compatible = "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a53-pmu";
 		interrupts = <0 106 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index d333b773bc45..8ee6d8c0ef61 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -276,7 +276,7 @@ timer {
 	};
 
 	pmu {
-		compatible = "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a53-pmu";
 		interrupts = <0 106 0x4>,
 			     <0 107 0x4>,
 			     <0 95 0x4>,
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
index 1aa38ed09aa4..8352197cea6f 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2080a.dtsi
@@ -12,6 +12,13 @@
 #include <dt-bindings/clock/fsl,qoriq-clockgen.h>
 #include "fsl-ls208xa.dtsi"
 
+/ {
+	pmu {
+		compatible = "arm,cortex-a57-pmu";
+		interrupts = <1 7 0x8>; /* PMU PPI, Level low type */
+	};
+};
+
 &cpu {
 	cpu0: cpu@0 {
 		device_type = "cpu";
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi
index 8581ea55d254..245bbd615c81 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls2088a.dtsi
@@ -12,6 +12,13 @@
 #include <dt-bindings/clock/fsl,qoriq-clockgen.h>
 #include "fsl-ls208xa.dtsi"
 
+/ {
+	pmu {
+		compatible = "arm,cortex-a72-pmu";
+		interrupts = <1 7 0x8>; /* PMU PPI, Level low type */
+	};
+};
+
 &cpu {
 	cpu0: cpu@0 {
 		device_type = "cpu";
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
index 0b7292835906..ccba0a135b24 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -247,11 +247,6 @@ timer: timer {
 			     <1 10 4>; /* Hypervisor PPI, active-low */
 	};
 
-	pmu {
-		compatible = "arm,armv8-pmuv3";
-		interrupts = <1 7 0x8>; /* PMU PPI, Level low type */
-	};
-
 	psci {
 		compatible = "arm,psci-0.2";
 		method = "smc";
diff --git a/arch/arm64/boot/dts/freescale/imx8dxl.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
index a0674c5c5576..b8abd98bdc43 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
@@ -104,7 +104,7 @@ dsp_reserved: dsp@92400000 {
 	};
 
 	pmu {
-		compatible = "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a35-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
diff --git a/arch/arm64/boot/dts/intel/keembay-soc.dtsi b/arch/arm64/boot/dts/intel/keembay-soc.dtsi
index 781761d2942b..ae00e9e54e82 100644
--- a/arch/arm64/boot/dts/intel/keembay-soc.dtsi
+++ b/arch/arm64/boot/dts/intel/keembay-soc.dtsi
@@ -70,7 +70,7 @@ timer {
 	};
 
 	pmu {
-		compatible = "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 0x7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index 76aafa172eb0..2a5eeb21da47 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -80,7 +80,7 @@ fpga-region {
 	};
 
 	pmu {
-		compatible = "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
index 5591939e057b..75377c292bcb 100644
--- a/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi
@@ -68,7 +68,7 @@ timer {
 	};
 
 	pmu {
-		compatible = "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 12 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
diff --git a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
index 1cc3fa1c354d..9603223dd761 100644
--- a/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-37xx.dtsi
@@ -68,7 +68,7 @@ timer {
 	};
 
 	pmu {
-		compatible = "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
index 9cbd6dd8f671..d0b03dc4d3f4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
@@ -165,7 +165,7 @@ timer {
 	};
 
 	pmu {
-		compatible = "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a35-pmu";
 		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_SPI 5 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_SPI 6 IRQ_TYPE_LEVEL_LOW>,
diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
index 47f8268e46bf..882b1d1f4ada 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
@@ -2004,7 +2004,7 @@ L2: l2-cache {
 	};
 
 	pmu {
-		compatible = "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a57-pmu";
 		interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/qcom/qcm2290.dtsi b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
index 89beac833d43..d3cd68190a17 100644
--- a/arch/arm64/boot/dts/qcom/qcm2290.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcm2290.dtsi
@@ -165,7 +165,7 @@ memory@40000000 {
 	};
 
 	pmu {
-		compatible = "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 6 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
diff --git a/arch/arm64/boot/dts/qcom/qdu1000.dtsi b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
index 832f472c4b7a..f2a5e2e40461 100644
--- a/arch/arm64/boot/dts/qcom/qdu1000.dtsi
+++ b/arch/arm64/boot/dts/qcom/qdu1000.dtsi
@@ -177,7 +177,7 @@ memory@80000000 {
 	};
 
 	pmu {
-		compatible = "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 7dbdf8ca6de6..b74cf4baedd6 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -224,7 +224,7 @@ memory@80000000 {
 	};
 
 	pmu {
-		compatible = "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
 	};
 
diff --git a/arch/arm64/boot/dts/realtek/rtd16xx.dtsi b/arch/arm64/boot/dts/realtek/rtd16xx.dtsi
index 34802cc62983..e57317a17aa9 100644
--- a/arch/arm64/boot/dts/realtek/rtd16xx.dtsi
+++ b/arch/arm64/boot/dts/realtek/rtd16xx.dtsi
@@ -109,7 +109,7 @@ timer {
 	};
 
 	arm_pmu: pmu {
-		compatible = "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
 		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>,
 			<&cpu3>, <&cpu4>, <&cpu5>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3368.dtsi b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
index 62af0cb94839..734f87db4d11 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368.dtsi
@@ -141,7 +141,7 @@ cpu_b3: cpu@103 {
 	};
 
 	arm-pmu {
-		compatible = "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/sprd/sc9860.dtsi b/arch/arm64/boot/dts/sprd/sc9860.dtsi
index e27eb3ed1d47..6bfdbdb0e1cd 100644
--- a/arch/arm64/boot/dts/sprd/sc9860.dtsi
+++ b/arch/arm64/boot/dts/sprd/sc9860.dtsi
@@ -165,7 +165,7 @@ timer {
 	};
 
 	pmu {
-		compatible = "arm,cortex-a53-pmu", "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/sprd/sc9863a.dtsi b/arch/arm64/boot/dts/sprd/sc9863a.dtsi
index 22d81ace740a..53e5b77d70b5 100644
--- a/arch/arm64/boot/dts/sprd/sc9863a.dtsi
+++ b/arch/arm64/boot/dts/sprd/sc9863a.dtsi
@@ -134,7 +134,7 @@ timer {
 	};
 
 	pmu {
-		compatible = "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a55-pmu";
 		interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/synaptics/berlin4ct.dtsi b/arch/arm64/boot/dts/synaptics/berlin4ct.dtsi
index 53d616c3cfed..71e4bfcc9e81 100644
--- a/arch/arm64/boot/dts/synaptics/berlin4ct.dtsi
+++ b/arch/arm64/boot/dts/synaptics/berlin4ct.dtsi
@@ -88,7 +88,7 @@ osc: osc {
 	};
 
 	pmu {
-		compatible = "arm,cortex-a53-pmu", "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_SPI 23 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/tesla/fsd.dtsi b/arch/arm64/boot/dts/tesla/fsd.dtsi
index 047a83cee603..690b4ed9c29b 100644
--- a/arch/arm64/boot/dts/tesla/fsd.dtsi
+++ b/arch/arm64/boot/dts/tesla/fsd.dtsi
@@ -304,7 +304,7 @@ CPU_SLEEP: cpu-sleep {
 	};
 
 	arm-pmu {
-		compatible = "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a72-pmu";
 		interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 25d20d803230..34d0e0be3fe6 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -169,7 +169,7 @@ dcc: dcc {
 	};
 
 	pmu {
-		compatible = "arm,armv8-pmuv3";
+		compatible = "arm,cortex-a53-pmu";
 		interrupt-parent = <&gic>;
 		interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
 			     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.43.0


