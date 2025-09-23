Return-Path: <linux-samsung-soc+bounces-11163-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6568FB95A81
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 23 Sep 2025 13:27:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19C193A7E3E
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 23 Sep 2025 11:27:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B7F532276C;
	Tue, 23 Sep 2025 11:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UxRtRGp0"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41FF3218DB;
	Tue, 23 Sep 2025 11:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758626837; cv=none; b=sExbbX0YxNBcdhfWAkfMkoR/Po319c2IkQKDF1h5sj92jkJystrsa4w5sxT80D+n/PySQTok+mHSUaFZpC5wPP1XWwjmGuGlVlrIb2y+koA8rALjRwbHu3YWBlubTTr31N4UdUtiK9KzaxoRxv8glNl9oQ+DD64eSL9XID2lWTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758626837; c=relaxed/simple;
	bh=Q2ZPEdzb2gnORGVGeGO0IjeJe1l44gLt8XXnAyUuDs8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S27+JcBDweGWrdOAJC2la6EBWvLZv0+mBy5KI6tVAugcIJmEv+MSM9S4LFjfqcYIVpavarKv8lhF4PsMgCyb+hA53GCQNtPf33Z57IltB1rLIb6YKLwlvpEkDT11ZZmDREbumN1Alc8i/xT2YQFEgXibrhShs2vq4CsBmBkMGH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UxRtRGp0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0099FC4CEF5;
	Tue, 23 Sep 2025 11:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758626835;
	bh=Q2ZPEdzb2gnORGVGeGO0IjeJe1l44gLt8XXnAyUuDs8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UxRtRGp0z2xiTUUUBesIglAe4niKZKHngVBoyIw1OLjXZASD0/gfb/9uUh3qYLF+f
	 I+OSFxsO0MM/oKN2Y0M0bJ4CL/duS1RDbQpITlg+xF+IqPDWqAzJ87l7nIcYq9zU4N
	 L6LBN0l5aQ/JGBf22gIflpZsEOat4+1e/YoJdR9v8mUTd4wu02nu4jCOovCQZyjwyO
	 BfnrGSyxliKgtCyfHqCRx7c44rCN1hRg6utdmQMAq7CfL3KeHjQOdnOEono7sG1M1i
	 LhKDYe4SM0SbPg87LBVmfHGn+6k+1RP61sq+giwLdc1SF5LpjUgDrwxkAERN1kbVJ5
	 oDNT6UT7kYyoA==
From: Manivannan Sadhasivam <mani@kernel.org>
Date: Tue, 23 Sep 2025 16:56:53 +0530
Subject: [PATCH v10 3/4] PCI: qcom: Prepare for the DWC ECAM enablement
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250923-controller-dwc-ecam-v10-3-e84390ba75fa@kernel.org>
References: <20250923-controller-dwc-ecam-v10-0-e84390ba75fa@kernel.org>
In-Reply-To: <20250923-controller-dwc-ecam-v10-0-e84390ba75fa@kernel.org>
To: Jingoo Han <jingoohan1@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Jonathan Chocron <jonnyc@amazon.com>
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5560; i=mani@kernel.org;
 h=from:subject:message-id; bh=ollTmHdc+LRKjxsyHOHDxETPk2GcR9fbJFLU7EjwZyE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBo0oP+ERpPcf1S7vPHdvG9W21uHfJMNRjASUUzA
 ipFx2XcwvOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaNKD/gAKCRBVnxHm/pHO
 9WY5B/9wApen9liIm5MjwGfbgjrWAUdg6N4ans9uzmaEz7ZJDErDwNWt2pzQKs5uIj4REIOoJLV
 K0nmecB67wCHl92/nL2A8Kbdufyj/9sY9C2njmqAAXsiUgLapYZIBYvBuA4tMF/mksJYlnLiDrB
 RpRyZSBHoN04M8YM9k4r3l03XOABh1r+ZnJTt6h7tIox1Flvt80Cq3upYYae94M2OQN/R84xuVX
 ybbU2jFc7D1q5PAIIoANGUXGXQS9k7B0Nr08Q0W2UaErot8KP8cXEDleAPkxWRHATHlYq19J7di
 +8iHLaf5WgBTjiQaoYse59r0XpcJLXuNHzBXvnc7woEDmMDR
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

To support the DWC ECAM mechanism, prepare the driver by performing below
configurations:

  1. Since the ELBI region will be covered by the ECAM 'config' space,
     override the 'elbi_base' with the address derived from 'dbi_base' and
     the offset from PARF_SLV_DBI_ELBI register.

  2. Block the transactions from the host bridge to devices other than Root
     Port on the root bus to return all F's. This is required when the 'CFG
     Shift Feature' of iATU is enabled.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
[mani: code split, reworded subject/description and comments]
Signed-off-by: Manivannan Sadhasivam <mani@kernel.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 68 ++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index c48a20602d7fa4c50056ccf6502d3b5bf0a8287f..e6d2a6b0c087151781ddaf6bf7612f87e2445d17 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -55,6 +55,7 @@
 #define PARF_AXI_MSTR_WR_ADDR_HALT_V2		0x1a8
 #define PARF_Q2A_FLUSH				0x1ac
 #define PARF_LTSSM				0x1b0
+#define PARF_SLV_DBI_ELBI			0x1b4
 #define PARF_INT_ALL_STATUS			0x224
 #define PARF_INT_ALL_CLEAR			0x228
 #define PARF_INT_ALL_MASK			0x22c
@@ -64,6 +65,16 @@
 #define PARF_DBI_BASE_ADDR_V2_HI		0x354
 #define PARF_SLV_ADDR_SPACE_SIZE_V2		0x358
 #define PARF_SLV_ADDR_SPACE_SIZE_V2_HI		0x35c
+#define PARF_BLOCK_SLV_AXI_WR_BASE		0x360
+#define PARF_BLOCK_SLV_AXI_WR_BASE_HI		0x364
+#define PARF_BLOCK_SLV_AXI_WR_LIMIT		0x368
+#define PARF_BLOCK_SLV_AXI_WR_LIMIT_HI		0x36c
+#define PARF_BLOCK_SLV_AXI_RD_BASE		0x370
+#define PARF_BLOCK_SLV_AXI_RD_BASE_HI		0x374
+#define PARF_BLOCK_SLV_AXI_RD_LIMIT		0x378
+#define PARF_BLOCK_SLV_AXI_RD_LIMIT_HI		0x37c
+#define PARF_ECAM_BASE				0x380
+#define PARF_ECAM_BASE_HI			0x384
 #define PARF_NO_SNOOP_OVERRIDE			0x3d4
 #define PARF_ATU_BASE_ADDR			0x634
 #define PARF_ATU_BASE_ADDR_HI			0x638
@@ -87,6 +98,7 @@
 
 /* PARF_SYS_CTRL register fields */
 #define MAC_PHY_POWERDOWN_IN_P2_D_MUX_EN	BIT(29)
+#define PCIE_ECAM_BLOCKER_EN			BIT(26)
 #define MST_WAKEUP_EN				BIT(13)
 #define SLV_WAKEUP_EN				BIT(12)
 #define MSTR_ACLK_CGC_DIS			BIT(10)
@@ -134,6 +146,9 @@
 /* PARF_LTSSM register fields */
 #define LTSSM_EN				BIT(8)
 
+/* PARF_SLV_DBI_ELBI */
+#define SLV_DBI_ELBI_ADDR_BASE			GENMASK(11, 0)
+
 /* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
 #define PARF_INT_ALL_LINK_UP			BIT(13)
 #define PARF_INT_MSI_DEV_0_7			GENMASK(30, 23)
@@ -312,6 +327,47 @@ static void qcom_ep_reset_deassert(struct qcom_pcie *pcie)
 	qcom_perst_assert(pcie, false);
 }
 
+static void qcom_pci_config_ecam(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	u64 addr, addr_end;
+	u32 val;
+
+	writel_relaxed(lower_32_bits(pci->dbi_phys_addr), pcie->parf + PARF_ECAM_BASE);
+	writel_relaxed(upper_32_bits(pci->dbi_phys_addr), pcie->parf + PARF_ECAM_BASE_HI);
+
+	/*
+	 * The only device on the root bus is a single Root Port. If we try to
+	 * access any devices other than Device/Function 00.0 on Bus 0, the TLP
+	 * will go outside of the controller to the PCI bus. But with CFG Shift
+	 * Feature (ECAM) enabled in iATU, there is no guarantee that the
+	 * response is going to be all F's. Hence, to make sure that the
+	 * requester gets all F's response for accesses other than the Root
+	 * Port, configure iATU to block the transactions starting from
+	 * function 1 of the root bus to the end of the root bus (i.e., from
+	 * dbi_base + 4KB to dbi_base + 1MB).
+	 */
+	addr = pci->dbi_phys_addr + SZ_4K;
+	writel_relaxed(lower_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_WR_BASE);
+	writel_relaxed(upper_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_WR_BASE_HI);
+
+	writel_relaxed(lower_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_RD_BASE);
+	writel_relaxed(upper_32_bits(addr), pcie->parf + PARF_BLOCK_SLV_AXI_RD_BASE_HI);
+
+	addr_end = pci->dbi_phys_addr + SZ_1M - 1;
+
+	writel_relaxed(lower_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_WR_LIMIT);
+	writel_relaxed(upper_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_WR_LIMIT_HI);
+
+	writel_relaxed(lower_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_RD_LIMIT);
+	writel_relaxed(upper_32_bits(addr_end), pcie->parf + PARF_BLOCK_SLV_AXI_RD_LIMIT_HI);
+
+	val = readl_relaxed(pcie->parf + PARF_SYS_CTRL);
+	val |= PCIE_ECAM_BLOCKER_EN;
+	writel_relaxed(val, pcie->parf + PARF_SYS_CTRL);
+}
+
 static int qcom_pcie_start_link(struct dw_pcie *pci)
 {
 	struct qcom_pcie *pcie = to_qcom_pcie(pci);
@@ -1284,6 +1340,7 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	u16 offset;
 	int ret;
 
 	qcom_ep_reset_assert(pcie);
@@ -1292,6 +1349,17 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 	if (ret)
 		return ret;
 
+	if (pp->ecam_enabled) {
+		/*
+		 * Override ELBI when ECAM is enabled, as when ECAM is enabled,
+		 * ELBI moves under the 'config' space.
+		 */
+		offset = FIELD_GET(SLV_DBI_ELBI_ADDR_BASE, readl(pcie->parf + PARF_SLV_DBI_ELBI));
+		pci->elbi_base = pci->dbi_base + offset;
+
+		qcom_pci_config_ecam(pp);
+	}
+
 	ret = qcom_pcie_phy_power_on(pcie);
 	if (ret)
 		goto err_deinit;

-- 
2.48.1


