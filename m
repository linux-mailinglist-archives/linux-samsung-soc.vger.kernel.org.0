Return-Path: <linux-samsung-soc+bounces-8748-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1D8AD75E7
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 12 Jun 2025 17:25:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCA483AB90F
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 12 Jun 2025 15:25:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AC2229A309;
	Thu, 12 Jun 2025 15:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="aNkS0ZO3"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C2C298CB5;
	Thu, 12 Jun 2025 15:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749741543; cv=none; b=CdcMrVGkRCEDU6Sl0gQYMbEEU1N/QpMZysbGXJkTX255Xxw0hhx/Yu58wFlSBpNlsQTF+gQcZVS3AvYAgo0iRzIMKAm0H/pNXf+YAy0zKtMrTbe3EeF6D0hxHbboqEcki1DLEzFRLYc6uWiKnYozRJyfTdaTRlgN5kE5qzDmiNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749741543; c=relaxed/simple;
	bh=UXKoXs5q4LIaUmOilU4paxb7oql8YI65SX6preoNwg4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nwlbYHy7niNySpyA1QRfd3l2o7lhqhtrK6k/KD40PqWVy0HwhtgdXJwFuptLdi2SNkO9A0NYqM38SnKxjAOd/8XIdfPfAVBVIzlPBHdimZht1wSO7P6Ddf0R3s1+S8ffJ3pi46wZ0WquYp/f7Y8sgjisRVwUvLMbnrGadZqAjtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=aNkS0ZO3; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D0C5C25C7E;
	Thu, 12 Jun 2025 17:18:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZGuRfnsPHQ0L; Thu, 12 Jun 2025 17:18:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1749741538; bh=UXKoXs5q4LIaUmOilU4paxb7oql8YI65SX6preoNwg4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=aNkS0ZO3ifYcpmDNJcPBSawttNvT2Di6sKFeJTGr9a94zpLp7xaelbDhubUkAuZhd
	 UFp8W2Yzbhek458Co+CVNAzvYMTiyvIjQOzX23llLMxa1qeQYRq1MxcnvVLscXhyEj
	 rId72V8jDP9UkAfKePS/Wr85/NsUHwxP63dSppQQNnQmgtajVAB5YyBg6pDIVsgLZ2
	 J1z8nz1troHTITUcTRwkuX+zRgpiK7aGiJyksNaexQWpYBlyKsbW5IVHBzZnfyx8oT
	 l0CKzImnBDmCtwO6PyVXHTQ4fSxyYLWmScZ56/Isly6Pz1NErqkFmJEqvGJQam2oxX
	 CX2tUR01iKFAQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 12 Jun 2025 20:48:07 +0530
Subject: [PATCH 03/12] drm/bridge: samsung-dsim: add flag to control header
 FIFO wait
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-exynos7870-dsim-v1-3-1a330bca89df@disroot.org>
References: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
In-Reply-To: <20250612-exynos7870-dsim-v1-0-1a330bca89df@disroot.org>
To: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749741499; l=3612;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=UXKoXs5q4LIaUmOilU4paxb7oql8YI65SX6preoNwg4=;
 b=G4w05gL6UJNA/3qkDrUQv2AYVQjzl3xP30/qaUrO7TKpMwcDrakJUH/z0IwTVnNuT1k6CbGmU
 VF6GS0eaAVRD6OVeNWlduTslwGKgKJTPTj0Ezp0bWN6YgBfFzCKlVJg
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=

Exynos7870's DSIM device doesn't require waiting for the header FIFO
during a MIPI DSI transfer. Add a flag in the driver data in order to
control said behavior.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 15 ++++++++++++---
 include/drm/bridge/samsung-dsim.h     |  1 +
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index e7287c289e0f8d01e295407578817801bad9d8c8..356c949aaa030a2ecc39beb43ae8608c1e6af828 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -416,6 +416,7 @@ static const struct samsung_dsim_driver_data exynos3_dsi_driver_data = {
 	.has_clklane_stop = 1,
 	.num_clks = 2,
 	.max_freq = 1000,
+	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
@@ -435,6 +436,7 @@ static const struct samsung_dsim_driver_data exynos4_dsi_driver_data = {
 	.has_clklane_stop = 1,
 	.num_clks = 2,
 	.max_freq = 1000,
+	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
@@ -452,6 +454,7 @@ static const struct samsung_dsim_driver_data exynos5_dsi_driver_data = {
 	.plltmr_reg = 0x58,
 	.num_clks = 2,
 	.max_freq = 1000,
+	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.pll_p_offset = 13,
@@ -469,6 +472,7 @@ static const struct samsung_dsim_driver_data exynos5433_dsi_driver_data = {
 	.has_clklane_stop = 1,
 	.num_clks = 5,
 	.max_freq = 1500,
+	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
 	.pll_p_offset = 13,
@@ -486,6 +490,7 @@ static const struct samsung_dsim_driver_data exynos5422_dsi_driver_data = {
 	.has_clklane_stop = 1,
 	.num_clks = 2,
 	.max_freq = 1500,
+	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
 	.pll_p_offset = 13,
@@ -503,6 +508,7 @@ static const struct samsung_dsim_driver_data imx8mm_dsi_driver_data = {
 	.has_clklane_stop = 1,
 	.num_clks = 2,
 	.max_freq = 2100,
+	.wait_for_hdr_fifo = 1,
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
 	/*
@@ -1109,6 +1115,7 @@ static void samsung_dsim_send_to_fifo(struct samsung_dsim *dsi,
 {
 	struct device *dev = dsi->dev;
 	struct mipi_dsi_packet *pkt = &xfer->packet;
+	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
 	const u8 *payload = pkt->payload + xfer->tx_done;
 	u16 length = pkt->payload_length - xfer->tx_done;
 	bool first = !xfer->tx_done;
@@ -1149,9 +1156,11 @@ static void samsung_dsim_send_to_fifo(struct samsung_dsim *dsi,
 		return;
 
 	reg = get_unaligned_le32(pkt->header);
-	if (samsung_dsim_wait_for_hdr_fifo(dsi)) {
-		dev_err(dev, "waiting for header FIFO timed out\n");
-		return;
+	if (driver_data->wait_for_hdr_fifo) {
+		if (samsung_dsim_wait_for_hdr_fifo(dsi)) {
+			dev_err(dev, "waiting for header FIFO timed out\n");
+			return;
+		}
 	}
 
 	if (NEQV(xfer->flags & MIPI_DSI_MSG_USE_LPM,
diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/samsung-dsim.h
index a50e4f521b9d9561f6a3b9fe3e174c0e140849a2..3641c57557f42fd90cd2e8c0282f69dbe36ba2de 100644
--- a/include/drm/bridge/samsung-dsim.h
+++ b/include/drm/bridge/samsung-dsim.h
@@ -60,6 +60,7 @@ struct samsung_dsim_driver_data {
 	unsigned int num_clks;
 	unsigned int min_freq;
 	unsigned int max_freq;
+	unsigned int wait_for_hdr_fifo;
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
 	unsigned int pll_p_offset;

-- 
2.49.0


