Return-Path: <linux-samsung-soc+bounces-8966-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F02AE941B
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 26 Jun 2025 04:37:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66F313BA03F
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 26 Jun 2025 02:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4F1D2036E9;
	Thu, 26 Jun 2025 02:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="LFbSOWBd"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C364201278
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jun 2025 02:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750905427; cv=none; b=n6opFs350Mr5hMSM/oi4o1nYZxZOQuupBJZDO0As2BdDOO+vr9L4g8V4KNV0MU08zV48i+WeMCbJCqGTHHmvJ9vgFYSmZN88mNCv7ri50djulySvxjouuYaOP9BWNiA34q16GUQWLw4eDbCwXvgtaPj+UK1i83r0VAX6+KdDRtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750905427; c=relaxed/simple;
	bh=7fkpDVXhr5mCKUsy3ewXya/3bUrPWvyCh1WjxnDKQwo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=N+puQwWo2pM/O7OAgXWYAvGBOmZiNcUqF40Qz4D+Uncy0xojAmitZDgOiM0/2gb2zZfU+RI8UHhdtRg4WCInqQQ1Lvg/NZjNVJ/4Fi4Ctl2k0wPO/aB86QP8+nX+Bs/h7bkUvc1yo7jZGWVxWNExKslS77YQ2pVNX1CkScmjE/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=LFbSOWBd; arc=none smtp.client-ip=203.254.224.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250626023658epoutp035a00907776f0b4248fd013b34fe93135~MdzOE0xXq1785717857epoutp034
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jun 2025 02:36:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250626023658epoutp035a00907776f0b4248fd013b34fe93135~MdzOE0xXq1785717857epoutp034
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750905418;
	bh=uDMB1Z9AjVBe8c2zXxGE4Co7kt+hAiHK3QF5M3qdFBQ=;
	h=From:To:Cc:Subject:Date:References:From;
	b=LFbSOWBdPiv/5Afw4wRBYQ5xMdOgj7HY4Kd2lrrBUIQLvbHXm8DgL8SUU19H7OvDv
	 S4Z+ZWdfxahT7zGXF8uhFrdphvPuEmYY5mtkKCOuCG07z16Y4WpWAv4hv/mGY+QXFI
	 i9YcQhaqMfrzMbDHU/uOvsAcZki2a8dwoIXL9NRY=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250626023657epcas5p4a4a1cf57a1aa0c4c264120eec35ec18a~MdzNWH9ju2563825638epcas5p4e;
	Thu, 26 Jun 2025 02:36:57 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.183]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bSN9z4Sl6z6B9mC; Thu, 26 Jun
	2025 02:36:55 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250625165241epcas5p471ca039a776513c4da7ee2a0955de5c2~MV1EnqnFE0913509135epcas5p4d;
	Wed, 25 Jun 2025 16:52:41 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250625165238epsmtip2a96f05e6c212ccb6164b2e3fc64e727e~MV1B4OmR01741117411epsmtip2L;
	Wed, 25 Jun 2025 16:52:38 +0000 (GMT)
From: Shradha Todi <shradha.t@samsung.com>
To: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-fsd@tesla.com
Cc: manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de,
	m.szyprowski@samsung.com, jh80.chung@samsung.com, pankaj.dubey@samsung.com,
	Shradha Todi <shradha.t@samsung.com>
Subject: [PATCH v2 00/10] Add PCIe support for Tesla FSD SoC
Date: Wed, 25 Jun 2025 22:22:19 +0530
Message-ID: <20250625165229.3458-1-shradha.t@samsung.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250625165241epcas5p471ca039a776513c4da7ee2a0955de5c2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250625165241epcas5p471ca039a776513c4da7ee2a0955de5c2
References: <CGME20250625165241epcas5p471ca039a776513c4da7ee2a0955de5c2@epcas5p4.samsung.com>

FSD platform has three instances of DesignWare based PCIe IP,
one is in FSYS0 block and other two in FSYS1 block.
This patch series add required DT binding, DT file modifications,
Controller driver support and PHY driver support for the same.

To keep single PCIe controller driver for all Samsung
manufactured SoC, we have made changes to Exynos file to extend
support for FSD platform and other Samsung manufactured SoCs which
shall be upstreamed soon.

First a version was posted as a separate driver file:
https://lore.kernel.org/lkml/20221121105210.68596-1-shradha.t@samsung.com/
This was rejected and request was made to add the support in exynos file
itself.

Then another patchset was posted to refactor existing exynos file:
https://lore.kernel.org/lkml/649a8d88-0504-5aa9-d167-d25d394f3f26@linaro.org/T/
This requested some major changes

Taking both these reviews into consideration, I have posted a fresh
patchset where both changes to exynos framework and addition of new FSD
support is present.

v2:
 - Reordered patches for removing unused MACROs and renaming them
 - Fixed all incomplete DT bindings
 - Modified PHY driver code to adopt better design
 - Removed patch to add alignment data in PCI endpoint test driver
 - Added dts changes in the patchset itself

v1: https://lore.kernel.org/lkml/20250518193152.63476-1-shradha.t@samsung.com/ 

Shradha Todi (10):
  PCI: exynos: Remove unused MACROs in exynos PCI file
  PCI: exynos: Change macro names to exynos specific
  PCI: exynos: Reorder MACROs to maintain consistency
  PCI: exynos: Add platform device private data
  PCI: exynos: Add structure to hold resource operations
  dt-bindings: PCI: Add bindings support for Tesla FSD SoC
  dt-bindings: phy: Add PHY bindings support for FSD SoC
  phy: exynos: Add PCIe PHY support for FSD SoC
  PCI: exynos: Add support for Tesla FSD SoC
  arm64: dts: fsd: Add PCIe support for Tesla FSD SoC

 .../bindings/pci/samsung,exynos-pcie.yaml     | 121 ++--
 .../bindings/pci/tesla,fsd-pcie-ep.yaml       |  91 +++
 .../bindings/phy/samsung,exynos-pcie-phy.yaml |  25 +-
 arch/arm64/boot/dts/tesla/fsd-evb.dts         |  36 ++
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi    |  65 ++
 arch/arm64/boot/dts/tesla/fsd.dtsi            | 147 +++++
 drivers/pci/controller/dwc/pci-exynos.c       | 568 +++++++++++++++---
 drivers/phy/samsung/phy-exynos-pcie.c         | 317 +++++++++-
 8 files changed, 1240 insertions(+), 130 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/tesla,fsd-pcie-ep.yaml

-- 
2.49.0


