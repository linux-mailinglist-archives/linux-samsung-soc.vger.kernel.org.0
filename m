Return-Path: <linux-samsung-soc+bounces-4651-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 499F89792D9
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 14 Sep 2024 20:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2978B22A28
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 14 Sep 2024 18:06:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54CB51D223D;
	Sat, 14 Sep 2024 18:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="RbAqrqcm"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AD71D1726;
	Sat, 14 Sep 2024 18:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726337136; cv=none; b=Om5mP6xjUFnZW9c+SYlNM4bFiUBaVSXUovcjb4pvjhp3iUuEcDPd5q0EMpgHc85Zg7ChszuLBJj6aSONdOEY6WlayNQrxcdmGm5Tif8iwzYJJAL5RGOddZfZ0ondFd8mZOJ8xnRCzNXBVqqBWFG56HtZEc8oBb38mvY/mqj/Wf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726337136; c=relaxed/simple;
	bh=3muyT9X92PcA9kU13x/WqK9DhbUrh5gBlt2HSvkCVgs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E/8AjZnms4HTnUnJos32t9bq0whr/nIUMcQJMCPAW6QxrSdztGrlqUcJuGa3qqter8vigCsE873doEdQoRL1RT6DckwLewHxcL2/2SDO5IRIETpNb+oT7z9x4ghoFHUWHrWEJ8RubOeuQ+XMmoYi9tWjl5SdrIPdkgabcAhlCaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=RbAqrqcm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1726337132;
	bh=3muyT9X92PcA9kU13x/WqK9DhbUrh5gBlt2HSvkCVgs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RbAqrqcmtU/7FKhKxF1SNp32+Av4HgrUsjsOkQFJUl9t4sUymWbNzmAv+eiQX7lNZ
	 BcZ473sYUReWgjDUKFmPb1IYwXAabmFOSuGplcz/QBqZNCMFpwKaFsBZnV84fP074L
	 OXujDH2OfFAsbuykYA8nlkL+6PQBeGiDfKk1EHJ42bHVv+uLpAFgN/OBI7HVeyTMmM
	 lbOx2AsSaZ5ZUVlIfh39bMVS+o+TWZK6kSKZACfxjet2uCM/pbbMC7SEW62dVM1D5t
	 61VxPVxuOzM0BFoBxJFlg1ZFJpaXwzLk4RrxB5XXhdm21jd59XQzVFZl4yQDWILkqT
	 KJEkiyGsqVo7w==
Received: from localhost (unknown [188.27.55.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9E6B617E360C;
	Sat, 14 Sep 2024 20:05:32 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Sat, 14 Sep 2024 21:04:56 +0300
Subject: [PATCH 3/4] PCI: exynos: Switch to devm_clk_bulk_get_all_enabled()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240914-clk_bulk_ena_fix-v1-3-ce3537585c06@collabora.com>
References: <20240914-clk_bulk_ena_fix-v1-0-ce3537585c06@collabora.com>
In-Reply-To: <20240914-clk_bulk_ena_fix-v1-0-ce3537585c06@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jingoo Han <jingoohan1@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org
X-Mailer: b4 0.14.1

The helper devm_clk_bulk_get_all_enable() is partially broken and will
be dropped since it missed to return the number of clocks stored in the
clk_bulk_data table referenced by the clks argument.

Use the newly introduced devm_clk_bulk_get_all_enabled() variant
instead, which is consistent with devm_clk_bulk_get_all() in terms of
the returned value:

 > 0 if one or more clocks have been stored
 = 0 if there are no clocks
 < 0 if an error occurred

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/pci/controller/dwc/pci-exynos.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index fa45da28a218..056cebd4e0ba 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -300,7 +300,7 @@ static int exynos_pcie_probe(struct platform_device *pdev)
 	if (IS_ERR(ep->elbi_base))
 		return PTR_ERR(ep->elbi_base);
 
-	ret = devm_clk_bulk_get_all_enable(dev, &ep->clks);
+	ret = devm_clk_bulk_get_all_enabled(dev, &ep->clks);
 	if (ret < 0)
 		return ret;
 

-- 
2.46.0


