Return-Path: <linux-samsung-soc+bounces-3394-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC30290B6E1
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 17 Jun 2024 18:46:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 622121F21FB5
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 17 Jun 2024 16:46:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29CDF16A934;
	Mon, 17 Jun 2024 16:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NS3EuuR5"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F8E1662FC
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2024 16:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718642719; cv=none; b=UkGcJrN9NwvS67vwtwwFNu5jbZb9xCWMW/v4EKRpZGUJfgT3/HSOLLo0QzNeKlu313V5QwhDRAiAJvfA6hA3Ec+POlJYZeCn/GZ9UKxR9SgsTQdwCSuXWp/W+fSZPJ9+1sh5PT39Qis6tSnGiOSZFalbnotRaFVdMTXPMRDGhLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718642719; c=relaxed/simple;
	bh=2lb24xdXqq8W3OG76waV8gzU9JFiuTWLGIOJdhqJT7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tBtv3Hfjb57uqEDqZKyUUeIwOZiGP31m0Tk36p/eoGxjtXEpBxG3pgKyeDum22+9GjD/A/mODKy48UwVmnqMS/3+kYOnByjuxgKOZcmfBXzJOzpZmTwABv+Qp55/tVI3NgNyyWmWVb44HowcJIFOVdbocsuWOdi8tOrWzE1NNw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NS3EuuR5; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a6f176c5c10so543067866b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2024 09:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718642714; x=1719247514; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZhdhb4rmqBa4poOONSAD2uld3E8ituenuLQCyMLX/0=;
        b=NS3EuuR5GeCcejOhoXM3eAy5cAkmjIMudGAblIw+iBqfzBJ4xD7UPA6WmL9wuzuwbO
         wNZXdBM885N2nhZa4hQVdMTPcjmvaIEFvewkQlMU6446LxRJ685BofV5w5BuygokhKC+
         UB2IDem7lvX2tq6NrRR+dYdZ7QdnPUj3ttPOK5xpUJUBavjMrLAH1z86orzc4ubz+Wpl
         yhVgbs+/ZWFJrZCMpFRK3QOZU02eOQ5xTtwsZ0bu3vj0eMMTZVzyWCR+nP+liF09eLPR
         DAKI/VOGgfkv8TWVn+n9vuCF1lxnFKdPXZCFz4lBzDuYk121WGdqOorCe681p+CwlrCR
         9Sow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718642714; x=1719247514;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DZhdhb4rmqBa4poOONSAD2uld3E8ituenuLQCyMLX/0=;
        b=bo72drDgmVuRjH/LVLDIOsoebLzHAHjnEFOJTBpTcEDvqTRJOkd/bSCX6SUhKMWf7s
         hjN+OBnWs4J2T8c3pMKSOcnbm5tX7D5r6U1LwuDfqemgDUShZaXKd9hKgReiBD6J4lAx
         9/I/mINO42Y+taTj5ZL0cp789Nn/W7GmQP04jx1BIepciN3JoID1E9I8fsE5o2N5Op1h
         eKMmhVV5D8BllBhU3gnQt+szA80/vFFpopcu7tHnujtvYTTtR84XfqlEGish8KxRB+3Y
         5chY9LSX4E0NhCzwmg7S7RY3/PCPjgGYqgn6BAh2dN6LCuA+pbfsQPpg/LN3H6CxUha2
         gdyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPCeLejUe4mmTlaOBlD3ogPXUrQ0nyx5kymHyDKcbYzQNYXaBKuZpPMigP3cN9gUPJpnb/dXYouSCbSPohhYvSzArKDuXIjyFOaNhJZ4OvXKA=
X-Gm-Message-State: AOJu0Yw1VbjH3Hr6l2dvG+0wuqDLR3sSr62PPU8VTXIyrTY7PmJr5za8
	RAoyn/q7KKuQ1JrPQLbbZO+TEY6eazSLdStdI1+WeSyqBJoExrm3t4AvnSQMQ9k=
X-Google-Smtp-Source: AGHT+IFyiujBmbbm3gbxHfCJFIPGVX4E+fY3vvSXp5MF/RGOoRY2gXPP8Uy5YLzj4fVGzDlhpWxpHg==
X-Received: by 2002:a17:906:a013:b0:a6f:4954:30f8 with SMTP id a640c23a62f3a-a6f60dc8940mr738825266b.51.1718642714486;
        Mon, 17 Jun 2024 09:45:14 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f4170bsm527139966b.157.2024.06.17.09.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 09:45:14 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 17 Jun 2024 17:44:47 +0100
Subject: [PATCH v3 6/6] phy: exynos5-usbdrd: support Exynos USBDRD 3.1
 combo phy (HS & SS)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240617-usb-phy-gs101-v3-6-b66de9ae7424@linaro.org>
References: <20240617-usb-phy-gs101-v3-0-b66de9ae7424@linaro.org>
In-Reply-To: <20240617-usb-phy-gs101-v3-0-b66de9ae7424@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Add support for the Exynos USB 3.1 DRD combo phy, as found in Exynos 9
SoCs like Google GS101. It supports USB SS, HS and DisplayPort.

In terms of UTMI+, this is very similar to the existing Exynos850
support in this driver. The difference is that this combo phy supports
both UTMI+ (HS) and PIPE3 (SS). It also supports DP alt mode.

The number of ports for UTMI+ and PIPE3 can be determined using the
LINKPORT register (which also exists on Exynos E850).

For SuperSpeed (SS) a new SS phy is in use and its PIPE3 interface is
new compared to Exynos E850, and also very different from the existing
support for older Exynos SoCs in this driver.

The SS phy needs a bit more configuration work and register tuning for
signal quality to work reliably, presumably due to the higher
frequency, e.g. to account for different board layouts. Additionally,
power needs to be enabled before writing to the SS phy registers.

This commit adds the necessary changes for USB HS and SS to work.
DisplayPort is out of scope in this commit.

Notes:
* For the register tuning, exynos5_usbdrd_apply_phy_tunes() has been
  added with the appropriate data structures to support tuning at
  various stages during initialisation. Since these are hardware
  specific, the platform data is supposed to be populated accordingly.
  The implementation is loosely modelled after the Samsung UFS PHY
  driver.

  There is one tuning state for UTMI+, PTS_UTMI_POSTINIT, to execute
  after init and generally intended for HS signal tuning, as done in
  this commit.

  PTS_PIPE3_PREINIT PTS_PIPE3_INIT PTS_PIPE3_POSTINIT
  PTS_PIPE3_POSTLOCK are tuning states for PIPE3. In the downstream
  driver, preinit differs by Exynos SoC, and postinit and postlock
  are different per board. The latter haven't been implemented for
  gs101 here, because downstream doesn't use them on gs101 either.

* Signal lock acquisition for SS depends on the orientation of the
  USB-C plug. Since there currently is no infrastructure to chain
  connector events to both the USB DWC3 driver and this phy driver, a
  work-around has been added in
  exynos5_usbdrd_usbdp_g2_v4_pma_check_cdr_lock() to check both
  registers if it failed in one of the orientations.

* Equally, we can only establish SS speed in one of the connector
  orientations due to programming differences when selecting the lane
  mux in exynos5_usbdrd_usbdp_g2_v4_pma_lane_mux_sel(), which really
  needs to be dynamic, based on the orientation of the connector.

* As is, we can establish a HS link using any cable, and an SS link in
  one orientation of the plug, falling back to HS if the orientation is
  reversed to the expectation.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
* implement handling of regulators
* enable power rails and bypass PMU isolatation during struct
  phy_ops::init() before writing registers and not in ::power_on(),
  which is too late. Without power register access doesn't work
  obviously, and the bootloader enables enables PMU isolation in
  certain cases.
* set unused callback pointers to NULL in gs101_tunes[] (I had stripped
  out too much during original preparation of v1 for submission :-(
* add missing postlock tunes from downstream
* move PTS_UTMI_POSTINIT utmi phy tuning to before completion of POR
  sequence, as per datasheet
* group gs101 related symbols closer to each other
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c    | 668 +++++++++++++++++++++++++++-
 include/linux/soc/samsung/exynos-regs-pmu.h |   4 +
 2 files changed, 667 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 2d2ce06765c4..df52b78a120b 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -134,11 +134,27 @@
 
 /* Exynos850: USB DRD PHY registers */
 #define EXYNOS850_DRD_LINKCTRL			0x04
+#define LINKCTRL_FORCE_RXELECIDLE		BIT(18)
+#define LINKCTRL_FORCE_PHYSTATUS		BIT(17)
+#define LINKCTRL_FORCE_PIPE_EN			BIT(16)
 #define LINKCTRL_FORCE_QACT			BIT(8)
 #define LINKCTRL_BUS_FILTER_BYPASS(_x)		((_x) << 4)
 
+#define EXYNOS850_DRD_LINKPORT			0x08
+#define LINKPORT_HOST_NUM_U3			GENMASK(19, 16)
+#define LINKPORT_HOST_NUM_U2			GENMASK(15, 12)
+
 #define EXYNOS850_DRD_CLKRST			0x20
+/*
+ * On versions without SS ports (like E850), bit 3 is for the 2.0 phy (HS),
+ * while on versions with (like gs101), bits 2 and 3 are for the 3.0 phy (SS)
+ * and bits 12 & 13 for the 2.0 phy.
+ */
+#define CLKRST_PHY20_SW_POR			BIT(13)
+#define CLKRST_PHY20_SW_POR_SEL			BIT(12)
+#define CLKRST_LINK_PCLK_SEL			BIT(7)
 #define CLKRST_PHY_SW_RST			BIT(3)
+#define CLKRST_PHY_RESET_SEL			BIT(2)
 #define CLKRST_PORT_RST				BIT(1)
 #define CLKRST_LINK_SW_RST			BIT(0)
 
@@ -160,12 +176,173 @@
 #define HSP_EN_UTMISUSPEND			BIT(9)
 #define HSP_COMMONONN				BIT(8)
 
+#define EXYNOS850_DRD_HSPPARACON		0x58
+#define HSPPARACON_TXVREF			GENMASK(31, 28)
+#define HSPPARACON_TXRISE			GENMASK(25, 24)
+#define HSPPARACON_TXRES			GENMASK(22, 21)
+#define HSPPARACON_TXPREEMPPULSE		BIT(20)
+#define HSPPARACON_TXPREEMPAMP			GENMASK(19, 18)
+#define HSPPARACON_TXHSXV			GENMASK(17, 16)
+#define HSPPARACON_TXFSLS			GENMASK(15, 12)
+#define HSPPARACON_SQRX				GENMASK(10, 8)
+#define HSPPARACON_OTG				GENMASK(6, 4)
+#define HSPPARACON_COMPDIS			GENMASK(2, 0)
+
 #define EXYNOS850_DRD_HSP_TEST			0x5c
 #define HSP_TEST_SIDDQ				BIT(24)
 
+/* Exynos9 - GS101 */
+#define EXYNOS850_DRD_SECPMACTL			0x48
+#define SECPMACTL_PMA_ROPLL_REF_CLK_SEL		GENMASK(13, 12)
+#define SECPMACTL_PMA_LCPLL_REF_CLK_SEL		GENMASK(11, 10)
+#define SECPMACTL_PMA_REF_FREQ_SEL		GENMASK(9, 8)
+#define SECPMACTL_PMA_LOW_PWR			BIT(4)
+#define SECPMACTL_PMA_TRSV_SW_RST		BIT(3)
+#define SECPMACTL_PMA_CMN_SW_RST		BIT(2)
+#define SECPMACTL_PMA_INIT_SW_RST		BIT(1)
+#define SECPMACTL_PMA_APB_SW_RST		BIT(0)
+
+/* PMA registers */
+#define EXYNOS9_PMA_USBDP_CMN_REG0008		0x0020
+#define CMN_REG0008_OVRD_AUX_EN			BIT(3)
+#define CMN_REG0008_AUX_EN			BIT(2)
+
+#define EXYNOS9_PMA_USBDP_CMN_REG00B8		0x02e0
+#define CMN_REG00B8_LANE_MUX_SEL_DP		GENMASK(3, 0)
+
+#define EXYNOS9_PMA_USBDP_CMN_REG01C0		0x0700
+#define CMN_REG01C0_ANA_LCPLL_LOCK_DONE		BIT(7)
+#define CMN_REG01C0_ANA_LCPLL_AFC_DONE		BIT(6)
+
+/* these have similar register layout, for lanes 0 and 2 */
+#define EXYNOS9_PMA_USBDP_TRSV_REG03C3			0x0f0c
+#define EXYNOS9_PMA_USBDP_TRSV_REG07C3			0x1f0c
+#define TRSV_REG03C3_LN0_MON_RX_CDR_AFC_DONE		BIT(3)
+#define TRSV_REG03C3_LN0_MON_RX_CDR_CAL_DONE		BIT(2)
+#define TRSV_REG03C3_LN0_MON_RX_CDR_FLD_PLL_MODE_DONE	BIT(1)
+#define TRSV_REG03C3_LN0_MON_RX_CDR_LOCK_DONE		BIT(0)
+
+/* TRSV_REG0413 and TRSV_REG0813 have similar register layout */
+#define EXYNOS9_PMA_USBDP_TRSV_REG0413		0x104c
+#define TRSV_REG0413_OVRD_LN1_TX_RXD_COMP_EN	BIT(7)
+#define TRSV_REG0413_OVRD_LN1_TX_RXD_EN		BIT(5)
+
+#define EXYNOS9_PMA_USBDP_TRSV_REG0813		0x204c
+#define TRSV_REG0813_OVRD_LN3_TX_RXD_COMP_EN	BIT(7)
+#define TRSV_REG0813_OVRD_LN3_TX_RXD_EN		BIT(5)
+
+/* PCS registers */
+#define EXYNOS9_PCS_NS_VEC_PS1_N1		0x010c
+#define EXYNOS9_PCS_NS_VEC_PS2_N0		0x0110
+#define EXYNOS9_PCS_NS_VEC_PS3_N0		0x0118
+#define NS_VEC_NS_REQ				GENMASK(31, 24)
+#define NS_VEC_ENABLE_TIMER			BIT(22)
+#define NS_VEC_SEL_TIMEOUT			GENMASK(21, 20)
+#define NS_VEC_INV_MASK				GENMASK(19, 16)
+#define NS_VEC_COND_MASK			GENMASK(11, 8)
+#define NS_VEC_EXP_COND				GENMASK(3, 0)
+
+#define EXYNOS9_PCS_OUT_VEC_2			0x014c
+#define EXYNOS9_PCS_OUT_VEC_3			0x0150
+#define PCS_OUT_VEC_B9_DYNAMIC			BIT(19)
+#define PCS_OUT_VEC_B9_SEL_OUT			BIT(18)
+#define PCS_OUT_VEC_B8_DYNAMIC			BIT(17)
+#define PCS_OUT_VEC_B8_SEL_OUT			BIT(16)
+#define PCS_OUT_VEC_B7_DYNAMIC			BIT(15)
+#define PCS_OUT_VEC_B7_SEL_OUT			BIT(14)
+#define PCS_OUT_VEC_B6_DYNAMIC			BIT(13)
+#define PCS_OUT_VEC_B6_SEL_OUT			BIT(12)
+#define PCS_OUT_VEC_B5_DYNAMIC			BIT(11)
+#define PCS_OUT_VEC_B5_SEL_OUT			BIT(10)
+#define PCS_OUT_VEC_B4_DYNAMIC			BIT(9)
+#define PCS_OUT_VEC_B4_SEL_OUT			BIT(8)
+#define PCS_OUT_VEC_B3_DYNAMIC			BIT(7)
+#define PCS_OUT_VEC_B3_SEL_OUT			BIT(6)
+#define PCS_OUT_VEC_B2_DYNAMIC			BIT(5)
+#define PCS_OUT_VEC_B2_SEL_OUT			BIT(4)
+#define PCS_OUT_VEC_B1_DYNAMIC			BIT(3)
+#define PCS_OUT_VEC_B1_SEL_OUT			BIT(2)
+#define PCS_OUT_VEC_B0_DYNAMIC			BIT(1)
+#define PCS_OUT_VEC_B0_SEL_OUT			BIT(0)
+
+#define EXYNOS9_PCS_TIMEOUT_0			0x0170
+
+#define EXYNOS9_PCS_TIMEOUT_3			0x017c
+
+#define EXYNOS9_PCS_EBUF_PARAM			0x0304
+#define EBUF_PARAM_SKP_REMOVE_TH_EMPTY_MODE	GENMASK(29, 24)
+
+#define EXYNOS9_PCS_BACK_END_MODE_VEC		0x030c
+#define BACK_END_MODE_VEC_FORCE_EBUF_EMPTY_MODE	BIT(1)
+#define BACK_END_MODE_VEC_DISABLE_DATA_MASK	BIT(0)
+
+#define EXYNOS9_PCS_RX_CONTROL			0x03f0
+#define RX_CONTROL_EN_BLOCK_ALIGNER_TYPE_B	BIT(22)
+
+#define EXYNOS9_PCS_RX_CONTROL_DEBUG		0x03f4
+#define RX_CONTROL_DEBUG_EN_TS_CHECK		BIT(5)
+#define RX_CONTROL_DEBUG_NUM_COM_FOUND		GENMASK(3, 0)
+
+#define EXYNOS9_PCS_LOCAL_COEF			0x040c
+#define LOCAL_COEF_PMA_CENTER_COEF		GENMASK(21, 16)
+#define LOCAL_COEF_LF				GENMASK(13, 8)
+#define LOCAL_COEF_FS				GENMASK(5, 0)
+
+#define EXYNOS9_PCS_HS_TX_COEF_MAP_0		0x0410
+#define HS_TX_COEF_MAP_0_SSTX_DEEMP		GENMASK(17, 12)
+#define HS_TX_COEF_MAP_0_SSTX_LEVEL		GENMASK(11, 6)
+#define HS_TX_COEF_MAP_0_SSTX_PRE_SHOOT		GENMASK(5, 0)
+
+
 #define KHZ	1000
 #define MHZ	(KHZ * KHZ)
 
+#define PHY_TUNING_ENTRY_PHY(o, m, v) {	\
+		.off = (o),		\
+		.mask = (m),		\
+		.val = (v),		\
+		.region = PTR_PHY	\
+	}
+
+#define PHY_TUNING_ENTRY_PCS(o, m, v) {	\
+		.off = (o),		\
+		.mask = (m),		\
+		.val = (v),		\
+		.region = PTR_PCS	\
+	}
+
+#define PHY_TUNING_ENTRY_PMA(o, m, v) {	\
+		.off = (o),		\
+		.mask = (m),		\
+		.val = (v),		\
+		.region = PTR_PMA,	\
+	}
+
+#define PHY_TUNING_ENTRY_LAST { .region = PTR_INVALID }
+
+#define for_each_phy_tune(tune) \
+	for (; (tune)->region != PTR_INVALID; ++(tune))
+
+struct exynos5_usbdrd_phy_tuning {
+	u32 off;
+	u32 mask;
+	u32 val;
+	char region;
+#define PTR_INVALID	0
+#define PTR_PHY		1
+#define PTR_PCS		2
+#define PTR_PMA		3
+};
+
+enum exynos5_usbdrd_phy_tuning_state {
+	PTS_UTMI_POSTINIT,
+	PTS_PIPE3_PREINIT,
+	PTS_PIPE3_INIT,
+	PTS_PIPE3_POSTINIT,
+	PTS_PIPE3_POSTLOCK,
+	PTS_MAX,
+};
+
 enum exynos5_usbdrd_phy_id {
 	EXYNOS5_DRDPHY_UTMI,
 	EXYNOS5_DRDPHY_PIPE3,
@@ -184,6 +361,7 @@ struct exynos5_usbdrd_phy_config {
 
 struct exynos5_usbdrd_phy_drvdata {
 	const struct exynos5_usbdrd_phy_config *phy_cfg;
+	const struct exynos5_usbdrd_phy_tuning **phy_tunes;
 	const struct phy_ops *phy_ops;
 	const char * const *clk_names;
 	int n_clks;
@@ -200,6 +378,8 @@ struct exynos5_usbdrd_phy_drvdata {
  * struct exynos5_usbdrd_phy - driver data for USB 3.0 PHY
  * @dev: pointer to device instance of this platform device
  * @reg_phy: usb phy controller register memory base
+ * @reg_pcs: usb phy physical coding sublayer register memory base
+ * @reg_pma: usb phy physical media attachment register memory base
  * @clks: clocks for register access
  * @core_clks: core clocks for phy (ref, pipe3, utmi+, ITP, etc. as required)
  * @drv_data: pointer to SoC level driver data structure
@@ -212,6 +392,8 @@ struct exynos5_usbdrd_phy_drvdata {
 struct exynos5_usbdrd_phy {
 	struct device *dev;
 	void __iomem *reg_phy;
+	void __iomem *reg_pcs;
+	void __iomem *reg_pma;
 	struct clk_bulk_data *clks;
 	struct clk_bulk_data *core_clks;
 	const struct exynos5_usbdrd_phy_drvdata *drv_data;
@@ -358,6 +540,45 @@ exynos5_usbdrd_utmi_set_refclk(struct phy_usb_instance *inst)
 	return reg;
 }
 
+static void
+exynos5_usbdrd_apply_phy_tunes(struct exynos5_usbdrd_phy *phy_drd,
+			       enum exynos5_usbdrd_phy_tuning_state state)
+{
+	const struct exynos5_usbdrd_phy_tuning *tune;
+
+	tune = phy_drd->drv_data->phy_tunes[state];
+	if (!tune)
+		return;
+
+	for_each_phy_tune(tune) {
+		void __iomem *reg_base;
+		u32 reg = 0;
+
+		switch (tune->region) {
+		case PTR_PHY:
+			reg_base = phy_drd->reg_phy;
+			break;
+		case PTR_PCS:
+			reg_base = phy_drd->reg_pcs;
+			break;
+		case PTR_PMA:
+			reg_base = phy_drd->reg_pma;
+			break;
+		default:
+			dev_warn_once(phy_drd->dev,
+				      "unknown phy region %d\n", tune->region);
+			continue;
+		}
+
+		if (~tune->mask) {
+			reg = readl(reg_base + tune->off);
+			reg &= ~tune->mask;
+		}
+		reg |= tune->val;
+		writel(reg, reg_base + tune->off);
+	}
+}
+
 static void exynos5_usbdrd_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
 {
 	u32 reg;
@@ -373,6 +594,129 @@ static void exynos5_usbdrd_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
 	writel(reg, phy_drd->reg_phy + EXYNOS5_DRD_PHYTEST);
 }
 
+static void
+exynos5_usbdrd_usbdp_g2_v4_ctrl_pma_ready(struct exynos5_usbdrd_phy *phy_drd)
+{
+	void __iomem *regs_base = phy_drd->reg_phy;
+	u32 reg;
+
+	/* link pipe_clock selection to pclk of PMA */
+	reg = readl(regs_base + EXYNOS850_DRD_CLKRST);
+	reg |= CLKRST_LINK_PCLK_SEL;
+	writel(reg, regs_base + EXYNOS850_DRD_CLKRST);
+
+	reg = readl(regs_base + EXYNOS850_DRD_SECPMACTL);
+	reg &= ~SECPMACTL_PMA_REF_FREQ_SEL;
+	reg |= FIELD_PREP_CONST(SECPMACTL_PMA_REF_FREQ_SEL, 1);
+	/* SFR reset */
+	reg |= (SECPMACTL_PMA_LOW_PWR | SECPMACTL_PMA_APB_SW_RST);
+	reg &= ~(SECPMACTL_PMA_ROPLL_REF_CLK_SEL |
+		 SECPMACTL_PMA_LCPLL_REF_CLK_SEL);
+	/* PMA power off */
+	reg |= (SECPMACTL_PMA_TRSV_SW_RST | SECPMACTL_PMA_CMN_SW_RST |
+		SECPMACTL_PMA_INIT_SW_RST);
+	writel(reg, regs_base + EXYNOS850_DRD_SECPMACTL);
+
+	udelay(1);
+
+	reg = readl(regs_base + EXYNOS850_DRD_SECPMACTL);
+	reg &= ~SECPMACTL_PMA_LOW_PWR;
+	writel(reg, regs_base + EXYNOS850_DRD_SECPMACTL);
+
+	udelay(1);
+
+	/* release override */
+	reg = readl(regs_base + EXYNOS850_DRD_LINKCTRL);
+	reg &= ~LINKCTRL_FORCE_PIPE_EN;
+	writel(reg, regs_base + EXYNOS850_DRD_LINKCTRL);
+
+	udelay(1);
+
+	/* APB enable */
+	reg = readl(regs_base + EXYNOS850_DRD_SECPMACTL);
+	reg &= ~SECPMACTL_PMA_APB_SW_RST;
+	writel(reg, regs_base + EXYNOS850_DRD_SECPMACTL);
+}
+
+static void
+exynos5_usbdrd_usbdp_g2_v4_pma_lane_mux_sel(struct exynos5_usbdrd_phy *phy_drd)
+{
+	void __iomem *regs_base = phy_drd->reg_pma;
+	u32 reg;
+
+	/* lane configuration: USB on all lanes */
+	reg = readl(regs_base + EXYNOS9_PMA_USBDP_CMN_REG00B8);
+	reg &= ~CMN_REG00B8_LANE_MUX_SEL_DP;
+	writel(reg, regs_base + EXYNOS9_PMA_USBDP_CMN_REG00B8);
+
+	/*
+	 * FIXME: below code supports one connector orientation only. It needs
+	 * updating once we can receive connector events.
+	 */
+	/* override of TX receiver detector and comparator: lane 1 */
+	reg = readl(regs_base + EXYNOS9_PMA_USBDP_TRSV_REG0413);
+	reg &= ~TRSV_REG0413_OVRD_LN1_TX_RXD_COMP_EN;
+	reg &= ~TRSV_REG0413_OVRD_LN1_TX_RXD_EN;
+	writel(reg, regs_base + EXYNOS9_PMA_USBDP_TRSV_REG0413);
+
+	/* lane 3 */
+	reg = readl(regs_base + EXYNOS9_PMA_USBDP_TRSV_REG0813);
+	reg |= TRSV_REG0813_OVRD_LN3_TX_RXD_COMP_EN;
+	reg |= TRSV_REG0813_OVRD_LN3_TX_RXD_EN;
+	writel(reg, regs_base + EXYNOS9_PMA_USBDP_TRSV_REG0813);
+}
+
+static int
+exynos5_usbdrd_usbdp_g2_v4_pma_check_pll_lock(struct exynos5_usbdrd_phy *phy_drd)
+{
+	static const unsigned int timeout_us = 40000;
+	static const unsigned int sleep_us = 40;
+	static const u32 locked = (CMN_REG01C0_ANA_LCPLL_LOCK_DONE |
+				   CMN_REG01C0_ANA_LCPLL_AFC_DONE);
+	u32 reg;
+	int err;
+
+	err = readl_poll_timeout(
+			phy_drd->reg_pma + EXYNOS9_PMA_USBDP_CMN_REG01C0,
+			reg, (reg & locked) == locked, sleep_us, timeout_us);
+	if (err)
+		dev_err(phy_drd->dev,
+			"timed out waiting for PLL lock: %#.8x\n", reg);
+
+	return err;
+}
+
+static void
+exynos5_usbdrd_usbdp_g2_v4_pma_check_cdr_lock(struct exynos5_usbdrd_phy *phy_drd)
+{
+	static const unsigned int timeout_us = 40000;
+	static const unsigned int sleep_us = 40;
+	static const u32 locked =
+		(TRSV_REG03C3_LN0_MON_RX_CDR_AFC_DONE
+		 | TRSV_REG03C3_LN0_MON_RX_CDR_CAL_DONE
+		 | TRSV_REG03C3_LN0_MON_RX_CDR_FLD_PLL_MODE_DONE
+		 | TRSV_REG03C3_LN0_MON_RX_CDR_LOCK_DONE);
+	u32 reg;
+	int err;
+
+	err = readl_poll_timeout(
+			phy_drd->reg_pma + EXYNOS9_PMA_USBDP_TRSV_REG03C3,
+			reg, (reg & locked) == locked, sleep_us, timeout_us);
+	if (!err)
+		return;
+
+	dev_err(phy_drd->dev,
+		"timed out waiting for CDR lock (l0): %#.8x, retrying\n", reg);
+
+	/* based on cable orientation, this might be on the other phy port */
+	err = readl_poll_timeout(
+			phy_drd->reg_pma + EXYNOS9_PMA_USBDP_TRSV_REG07C3,
+			reg, (reg & locked) == locked, sleep_us, timeout_us);
+	if (err)
+		dev_err(phy_drd->dev,
+			"timed out waiting for CDR lock (l2): %#.8x\n", reg);
+}
+
 static void exynos5_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 {
 	u32 reg;
@@ -705,10 +1049,29 @@ static const struct phy_ops exynos5_usbdrd_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static void
+exynos5_usbdrd_usb_v3p1_pipe_override(struct exynos5_usbdrd_phy *phy_drd)
+{
+	void __iomem *regs_base = phy_drd->reg_phy;
+	u32 reg;
+
+	/* force pipe3 signal for link */
+	reg = readl(regs_base + EXYNOS850_DRD_LINKCTRL);
+	reg &= ~LINKCTRL_FORCE_PHYSTATUS;
+	reg |= LINKCTRL_FORCE_PIPE_EN | LINKCTRL_FORCE_RXELECIDLE;
+	writel(reg, regs_base + EXYNOS850_DRD_LINKCTRL);
+
+	/* PMA disable */
+	reg = readl(regs_base + EXYNOS850_DRD_SECPMACTL);
+	reg |= SECPMACTL_PMA_LOW_PWR;
+	writel(reg, regs_base + EXYNOS850_DRD_SECPMACTL);
+}
+
 static void exynos850_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 {
 	void __iomem *regs_base = phy_drd->reg_phy;
 	u32 reg;
+	u32 ss_ports;
 
 	/*
 	 * Disable HWACG (hardware auto clock gating control). This will force
@@ -719,8 +1082,16 @@ static void exynos850_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	reg |= LINKCTRL_FORCE_QACT;
 	writel(reg, regs_base + EXYNOS850_DRD_LINKCTRL);
 
+	reg = readl(regs_base + EXYNOS850_DRD_LINKPORT);
+	ss_ports = FIELD_GET(LINKPORT_HOST_NUM_U3, reg);
+
 	/* Start PHY Reset (POR=high) */
 	reg = readl(regs_base + EXYNOS850_DRD_CLKRST);
+	if (ss_ports) {
+		reg |= CLKRST_PHY20_SW_POR;
+		reg |= CLKRST_PHY20_SW_POR_SEL;
+		reg |= CLKRST_PHY_RESET_SEL;
+	}
 	reg |= CLKRST_PHY_SW_RST;
 	writel(reg, regs_base + EXYNOS850_DRD_CLKRST);
 
@@ -773,6 +1144,10 @@ static void exynos850_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	}
 	writel(reg, regs_base + EXYNOS850_DRD_SSPPLLCTL);
 
+	if (phy_drd->drv_data->phy_tunes)
+		exynos5_usbdrd_apply_phy_tunes(phy_drd,
+					       PTS_UTMI_POSTINIT);
+
 	/* Power up PHY analog blocks */
 	reg = readl(regs_base + EXYNOS850_DRD_HSP_TEST);
 	reg &= ~HSP_TEST_SIDDQ;
@@ -781,6 +1156,10 @@ static void exynos850_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	/* Finish PHY reset (POR=low) */
 	fsleep(10); /* required before doing POR=low */
 	reg = readl(regs_base + EXYNOS850_DRD_CLKRST);
+	if (ss_ports) {
+		reg |= CLKRST_PHY20_SW_POR_SEL;
+		reg &= ~CLKRST_PHY20_SW_POR;
+	}
 	reg &= ~(CLKRST_PHY_SW_RST | CLKRST_PORT_RST);
 	writel(reg, regs_base + EXYNOS850_DRD_CLKRST);
 	fsleep(75); /* required after POR=low for guaranteed PHY clock */
@@ -789,6 +1168,9 @@ static void exynos850_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
 	reg = readl(regs_base + EXYNOS850_DRD_HSP);
 	reg &= ~HSP_FSV_OUT_EN;
 	writel(reg, regs_base + EXYNOS850_DRD_HSP);
+
+	if (ss_ports)
+		exynos5_usbdrd_usb_v3p1_pipe_override(phy_drd);
 }
 
 static int exynos850_usbdrd_phy_init(struct phy *phy)
@@ -853,6 +1235,85 @@ static const struct phy_ops exynos850_usbdrd_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static void exynos5_usbdrd_gs101_pipe3_init(struct exynos5_usbdrd_phy *phy_drd)
+{
+	void __iomem *regs_pma = phy_drd->reg_pma;
+	void __iomem *regs_phy = phy_drd->reg_phy;
+	u32 reg;
+
+	exynos5_usbdrd_usbdp_g2_v4_ctrl_pma_ready(phy_drd);
+
+	/* force aux off */
+	reg = readl(regs_pma + EXYNOS9_PMA_USBDP_CMN_REG0008);
+	reg &= ~CMN_REG0008_AUX_EN;
+	reg |= CMN_REG0008_OVRD_AUX_EN;
+	writel(reg, regs_pma + EXYNOS9_PMA_USBDP_CMN_REG0008);
+
+	exynos5_usbdrd_apply_phy_tunes(phy_drd, PTS_PIPE3_PREINIT);
+	exynos5_usbdrd_apply_phy_tunes(phy_drd, PTS_PIPE3_INIT);
+	exynos5_usbdrd_apply_phy_tunes(phy_drd, PTS_PIPE3_POSTINIT);
+
+	exynos5_usbdrd_usbdp_g2_v4_pma_lane_mux_sel(phy_drd);
+
+	/* reset release from port */
+	reg = readl(regs_phy + EXYNOS850_DRD_SECPMACTL);
+	reg &= ~(SECPMACTL_PMA_TRSV_SW_RST | SECPMACTL_PMA_CMN_SW_RST |
+		 SECPMACTL_PMA_INIT_SW_RST);
+	writel(reg, regs_phy + EXYNOS850_DRD_SECPMACTL);
+
+	if (!exynos5_usbdrd_usbdp_g2_v4_pma_check_pll_lock(phy_drd))
+		exynos5_usbdrd_usbdp_g2_v4_pma_check_cdr_lock(phy_drd);
+}
+
+static int exynos5_usbdrd_gs101_phy_init(struct phy *phy)
+{
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+	int ret;
+
+	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI) {
+		/* Power-on PHY ... */
+		ret = regulator_bulk_enable(phy_drd->drv_data->n_regulators,
+					    phy_drd->regulators);
+		if (ret) {
+			dev_err(phy_drd->dev,
+				"Failed to enable PHY regulator(s)\n");
+			return ret;
+		}
+	}
+	/*
+	 * ... and ungate power via PMU. Without this here, we get an SError
+	 * trying to access PMA registers
+	 */
+	exynos5_usbdrd_phy_isol(inst, false);
+
+	return exynos850_usbdrd_phy_init(phy);
+}
+
+static int exynos5_usbdrd_gs101_phy_exit(struct phy *phy)
+{
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+	int ret;
+
+	if (inst->phy_cfg->id != EXYNOS5_DRDPHY_UTMI)
+		return 0;
+
+	ret = exynos850_usbdrd_phy_exit(phy);
+	if (ret)
+		return ret;
+
+	exynos5_usbdrd_phy_isol(inst, true);
+	return regulator_bulk_disable(phy_drd->drv_data->n_regulators,
+				      phy_drd->regulators);
+}
+
+static const struct phy_ops gs101_usbdrd_phy_ops = {
+	.init		= exynos5_usbdrd_gs101_phy_init,
+	.exit		= exynos5_usbdrd_gs101_phy_exit,
+	.owner		= THIS_MODULE,
+};
+
 static int exynos5_usbdrd_phy_clk_handle(struct exynos5_usbdrd_phy *phy_drd)
 {
 	int ret;
@@ -1011,8 +1472,186 @@ static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
 	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
+static const struct exynos5_usbdrd_phy_config phy_cfg_gs101[] = {
+	{
+		.id		= EXYNOS5_DRDPHY_UTMI,
+		.phy_isol	= exynos5_usbdrd_phy_isol,
+		.phy_init	= exynos850_usbdrd_utmi_init,
+	},
+	{
+		.id		= EXYNOS5_DRDPHY_PIPE3,
+		.phy_isol	= exynos5_usbdrd_phy_isol,
+		.phy_init	= exynos5_usbdrd_gs101_pipe3_init,
+	},
+};
+
+static const struct exynos5_usbdrd_phy_tuning gs101_tunes_utmi_postinit[] = {
+	PHY_TUNING_ENTRY_PHY(EXYNOS850_DRD_HSPPARACON,
+			     (HSPPARACON_TXVREF | HSPPARACON_TXRES |
+			      HSPPARACON_TXPREEMPAMP | HSPPARACON_SQRX |
+			      HSPPARACON_COMPDIS),
+			     (FIELD_PREP_CONST(HSPPARACON_TXVREF, 6) |
+			      FIELD_PREP_CONST(HSPPARACON_TXRES, 1) |
+			      FIELD_PREP_CONST(HSPPARACON_TXPREEMPAMP, 3) |
+			      FIELD_PREP_CONST(HSPPARACON_SQRX, 5) |
+			      FIELD_PREP_CONST(HSPPARACON_COMPDIS, 7))),
+	PHY_TUNING_ENTRY_LAST
+};
+
+static const struct exynos5_usbdrd_phy_tuning gs101_tunes_pipe3_preinit[] = {
+	/* preinit */
+	/* CDR data mode exit GEN1 ON / GEN2 OFF */
+	PHY_TUNING_ENTRY_PMA(0x0c8c, -1, 0xff),
+	PHY_TUNING_ENTRY_PMA(0x1c8c, -1, 0xff),
+	PHY_TUNING_ENTRY_PMA(0x0c9c, -1, 0x7d),
+	PHY_TUNING_ENTRY_PMA(0x1c9c, -1, 0x7d),
+	/* improve EDS distribution */
+	PHY_TUNING_ENTRY_PMA(0x0e7c, -1, 0x06),
+	PHY_TUNING_ENTRY_PMA(0x09e0, -1, 0x00),
+	PHY_TUNING_ENTRY_PMA(0x09e4, -1, 0x36),
+	PHY_TUNING_ENTRY_PMA(0x1e7c, -1, 0x06),
+	PHY_TUNING_ENTRY_PMA(0x1e90, -1, 0x00),
+	PHY_TUNING_ENTRY_PMA(0x1e94, -1, 0x36),
+	/* improve LVCC */
+	PHY_TUNING_ENTRY_PMA(0x08f0, -1, 0x30),
+	PHY_TUNING_ENTRY_PMA(0x18f0, -1, 0x30),
+	/* LFPS RX VIH shmoo hole */
+	PHY_TUNING_ENTRY_PMA(0x0a08, -1, 0x0c),
+	PHY_TUNING_ENTRY_PMA(0x1a08, -1, 0x0c),
+	/* remove unrelated option for v4 phy */
+	PHY_TUNING_ENTRY_PMA(0x0a0c, -1, 0x05),
+	PHY_TUNING_ENTRY_PMA(0x1a0c, -1, 0x05),
+	/* improve Gen2 LVCC */
+	PHY_TUNING_ENTRY_PMA(0x00f8, -1, 0x1c),
+	PHY_TUNING_ENTRY_PMA(0x00fc, -1, 0x54),
+	/* Change Vth of RCV_DET because of TD 7.40 Polling Retry Test */
+	PHY_TUNING_ENTRY_PMA(0x104c, -1, 0x07),
+	PHY_TUNING_ENTRY_PMA(0x204c, -1, 0x07),
+	/* reduce Ux Exit time, assuming 26MHz clock */
+	/* Gen1 */
+	PHY_TUNING_ENTRY_PMA(0x0ca8, -1, 0x00),
+	PHY_TUNING_ENTRY_PMA(0x0cac, -1, 0x04),
+	PHY_TUNING_ENTRY_PMA(0x1ca8, -1, 0x00),
+	PHY_TUNING_ENTRY_PMA(0x1cac, -1, 0x04),
+	/* Gen2 */
+	PHY_TUNING_ENTRY_PMA(0x0cb8, -1, 0x00),
+	PHY_TUNING_ENTRY_PMA(0x0cbc, -1, 0x04),
+	PHY_TUNING_ENTRY_PMA(0x1cb8, -1, 0x00),
+	PHY_TUNING_ENTRY_PMA(0x1cbc, -1, 0x04),
+	/* RX impedance setting */
+	PHY_TUNING_ENTRY_PMA(0x0bb0, 0x03, 0x01),
+	PHY_TUNING_ENTRY_PMA(0x0bb4, 0xf0, 0xa0),
+	PHY_TUNING_ENTRY_PMA(0x1bb0, 0x03, 0x01),
+	PHY_TUNING_ENTRY_PMA(0x1bb4, 0xf0, 0xa0),
+
+	PHY_TUNING_ENTRY_LAST
+};
+
+static const struct exynos5_usbdrd_phy_tuning gs101_tunes_pipe3_init[] = {
+	/* init */
+	/* abnormal common pattern mask */
+	PHY_TUNING_ENTRY_PCS(EXYNOS9_PCS_BACK_END_MODE_VEC,
+			     BACK_END_MODE_VEC_DISABLE_DATA_MASK, 0),
+	/* de-serializer enabled when U2 */
+	PHY_TUNING_ENTRY_PCS(EXYNOS9_PCS_OUT_VEC_2, PCS_OUT_VEC_B4_DYNAMIC,
+			     PCS_OUT_VEC_B4_SEL_OUT),
+	/* TX Keeper Disable, Squelch on when U3 */
+	PHY_TUNING_ENTRY_PCS(EXYNOS9_PCS_OUT_VEC_3, PCS_OUT_VEC_B7_DYNAMIC,
+			     PCS_OUT_VEC_B7_SEL_OUT | PCS_OUT_VEC_B2_SEL_OUT),
+	PHY_TUNING_ENTRY_PCS(EXYNOS9_PCS_NS_VEC_PS1_N1, -1,
+			     (FIELD_PREP_CONST(NS_VEC_NS_REQ, 5) |
+			      NS_VEC_ENABLE_TIMER |
+			      FIELD_PREP_CONST(NS_VEC_SEL_TIMEOUT, 3))),
+	PHY_TUNING_ENTRY_PCS(EXYNOS9_PCS_NS_VEC_PS2_N0, -1,
+			     (FIELD_PREP_CONST(NS_VEC_NS_REQ, 1) |
+			      NS_VEC_ENABLE_TIMER |
+			      FIELD_PREP_CONST(NS_VEC_SEL_TIMEOUT, 3) |
+			      FIELD_PREP_CONST(NS_VEC_COND_MASK, 2) |
+			      FIELD_PREP_CONST(NS_VEC_EXP_COND, 2))),
+	PHY_TUNING_ENTRY_PCS(EXYNOS9_PCS_NS_VEC_PS3_N0, -1,
+			     (FIELD_PREP_CONST(NS_VEC_NS_REQ, 1) |
+			      NS_VEC_ENABLE_TIMER |
+			      FIELD_PREP_CONST(NS_VEC_SEL_TIMEOUT, 3) |
+			      FIELD_PREP_CONST(NS_VEC_COND_MASK, 7) |
+			      FIELD_PREP_CONST(NS_VEC_EXP_COND, 7))),
+	PHY_TUNING_ENTRY_PCS(EXYNOS9_PCS_TIMEOUT_0, -1, 112),
+	/* Block Aligner Type B */
+	PHY_TUNING_ENTRY_PCS(EXYNOS9_PCS_RX_CONTROL, 0,
+			     RX_CONTROL_EN_BLOCK_ALIGNER_TYPE_B),
+	/* Block align at TS1/TS2 for Gen2 stability (Gen2 only) */
+	PHY_TUNING_ENTRY_PCS(EXYNOS9_PCS_RX_CONTROL_DEBUG,
+		RX_CONTROL_DEBUG_NUM_COM_FOUND,
+		(RX_CONTROL_DEBUG_EN_TS_CHECK |
+		 /*
+		  * increase pcs ts1 adding packet-cnt 1 --> 4
+		  * lnx_rx_valid_rstn_delay_rise_sp/ssp :
+		  * 19.6us(0x200) -> 15.3us(0x4)
+		  */
+		 FIELD_PREP_CONST(RX_CONTROL_DEBUG_NUM_COM_FOUND, 4))),
+	/* Gen1 Tx DRIVER pre-shoot, de-emphasis, level ctrl */
+	PHY_TUNING_ENTRY_PCS(EXYNOS9_PCS_HS_TX_COEF_MAP_0,
+		(HS_TX_COEF_MAP_0_SSTX_DEEMP | HS_TX_COEF_MAP_0_SSTX_LEVEL |
+		 HS_TX_COEF_MAP_0_SSTX_PRE_SHOOT),
+		(FIELD_PREP_CONST(HS_TX_COEF_MAP_0_SSTX_DEEMP, 8) |
+		 FIELD_PREP_CONST(HS_TX_COEF_MAP_0_SSTX_LEVEL, 0xb) |
+		 FIELD_PREP_CONST(HS_TX_COEF_MAP_0_SSTX_PRE_SHOOT, 0))),
+	/* Gen2 Tx DRIVER level ctrl */
+	PHY_TUNING_ENTRY_PCS(EXYNOS9_PCS_LOCAL_COEF,
+		LOCAL_COEF_PMA_CENTER_COEF,
+		FIELD_PREP_CONST(LOCAL_COEF_PMA_CENTER_COEF, 0xb)),
+	/* Gen2 U1 exit LFPS duration : 900ns ~ 1.2us */
+	PHY_TUNING_ENTRY_PCS(EXYNOS9_PCS_TIMEOUT_3, -1, 4096),
+	/* set skp_remove_th 0x2 -> 0x7 for avoiding retry problem. */
+	PHY_TUNING_ENTRY_PCS(EXYNOS9_PCS_EBUF_PARAM,
+		EBUF_PARAM_SKP_REMOVE_TH_EMPTY_MODE,
+		FIELD_PREP_CONST(EBUF_PARAM_SKP_REMOVE_TH_EMPTY_MODE, 0x7)),
+
+	PHY_TUNING_ENTRY_LAST
+};
+
+static const struct exynos5_usbdrd_phy_tuning gs101_tunes_pipe3_postlock[] = {
+	/* Squelch off when U3 */
+	PHY_TUNING_ENTRY_PCS(EXYNOS9_PCS_OUT_VEC_3, PCS_OUT_VEC_B2_SEL_OUT, 0),
+
+	PHY_TUNING_ENTRY_LAST
+};
+
+static const struct exynos5_usbdrd_phy_tuning *gs101_tunes[PTS_MAX] = {
+	[PTS_UTMI_POSTINIT] = gs101_tunes_utmi_postinit,
+	[PTS_PIPE3_PREINIT] = gs101_tunes_pipe3_preinit,
+	[PTS_PIPE3_INIT] = gs101_tunes_pipe3_init,
+	[PTS_PIPE3_POSTLOCK] = gs101_tunes_pipe3_postlock,
+};
+
+static const char * const gs101_clk_names[] = {
+	"phy", "ctrl_aclk", "ctrl_pclk", "scl_pclk",
+};
+
+static const char * const gs101_regulator_names[] = {
+	"pll",
+	"dvdd-usb20", "vddh-usb20", "vdd33-usb20",
+	"vdda-usbdp", "vddh-usbdp",
+};
+
+static const struct exynos5_usbdrd_phy_drvdata gs101_usbd31rd_phy = {
+	.phy_cfg			= phy_cfg_gs101,
+	.phy_tunes			= gs101_tunes,
+	.phy_ops			= &gs101_usbdrd_phy_ops,
+	.pmu_offset_usbdrd0_phy		= GS101_PHY_CTRL_USB20,
+	.pmu_offset_usbdrd0_phy_ss	= GS101_PHY_CTRL_USBDP,
+	.clk_names			= gs101_clk_names,
+	.n_clks				= ARRAY_SIZE(gs101_clk_names),
+	.core_clk_names			= exynos5_core_clk_names,
+	.n_core_clks			= ARRAY_SIZE(exynos5_core_clk_names),
+	.regulator_names		= gs101_regulator_names,
+	.n_regulators			= ARRAY_SIZE(gs101_regulator_names),
+};
+
 static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	{
+		.compatible = "google,gs101-usb31drd-phy",
+		.data = &gs101_usbd31rd_phy
+	}, {
 		.compatible = "samsung,exynos5250-usbdrd-phy",
 		.data = &exynos5250_usbdrd_phy
 	}, {
@@ -1051,16 +1690,35 @@ static int exynos5_usbdrd_phy_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, phy_drd);
 	phy_drd->dev = dev;
 
-	phy_drd->reg_phy = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(phy_drd->reg_phy))
-		return PTR_ERR(phy_drd->reg_phy);
-
 	drv_data = of_device_get_match_data(dev);
 	if (!drv_data)
 		return -EINVAL;
-
 	phy_drd->drv_data = drv_data;
 
+	if (of_property_present(dev->of_node, "reg-names")) {
+		void __iomem *reg;
+
+		reg = devm_platform_ioremap_resource_byname(pdev, "phy");
+		if (IS_ERR(reg))
+			return PTR_ERR(reg);
+		phy_drd->reg_phy = reg;
+
+		reg = devm_platform_ioremap_resource_byname(pdev, "pcs");
+		if (IS_ERR(reg))
+			return PTR_ERR(reg);
+		phy_drd->reg_pcs = reg;
+
+		reg = devm_platform_ioremap_resource_byname(pdev, "pma");
+		if (IS_ERR(reg))
+			return PTR_ERR(reg);
+		phy_drd->reg_pma = reg;
+	} else {
+		/* DTB with just a single region */
+		phy_drd->reg_phy = devm_platform_ioremap_resource(pdev, 0);
+		if (IS_ERR(phy_drd->reg_phy))
+			return PTR_ERR(phy_drd->reg_phy);
+	}
+
 	ret = exynos5_usbdrd_phy_clk_handle(phy_drd);
 	if (ret)
 		return ret;
diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index aa840ed043e1..6765160eaab2 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -657,4 +657,8 @@
 #define EXYNOS5433_PAD_RETENTION_UFS_OPTION			(0x3268)
 #define EXYNOS5433_PAD_RETENTION_FSYSGENIO_OPTION		(0x32A8)
 
+/* For GS101 */
+#define GS101_PHY_CTRL_USB20					0x3eb0
+#define GS101_PHY_CTRL_USBDP					0x3eb4
+
 #endif /* __LINUX_SOC_EXYNOS_REGS_PMU_H */

-- 
2.45.2.627.g7a2c4fd464-goog


