Return-Path: <linux-samsung-soc+bounces-5616-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8189E4E80
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  5 Dec 2024 08:33:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 61009161A1E
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  5 Dec 2024 07:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CCD41B6D1F;
	Thu,  5 Dec 2024 07:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mmw9XcFW"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D481B4143
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Dec 2024 07:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733383996; cv=none; b=XOTPPl/MxKRcU++WJBZ7/VOcUKHCISRu5+Db8+HvzRb84H15FKEntXii5ocLz4aO431s2rpkU6D4Sc7XIwnmAFg4gZnlaXKwJwtt8c4Fwg8XdedFBBz+UhsvhDPbsSN+rFTajHX2W0SwfKSQeUwf/Twrpnz/EK67ipVKprn3K8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733383996; c=relaxed/simple;
	bh=RBijzRaiyQCfMRRbG6euJ9nQvKHptBuFr6E++PumUaI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S+I+IX3YMwzZG8MmeTck5amzbhomBGES/suPBtfTiSdnreoPPqL3XWDosrycR/m+ZgWQLcP2yiYQfE38egvGhwEFNNkaVd1Xw2MvFo0ij/YPVhIaGuJJjsWbguSqN0ood9Fnv1Z56YcaHqPSQ8/HyZwE0S1vno9J95k1VPNYA14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mmw9XcFW; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aa55da18f89so83187066b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Dec 2024 23:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733383993; x=1733988793; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jyPCCbXGwL2HX2ZQQ75iZPGtqkwk+FZ+xBNeL3SfQvk=;
        b=mmw9XcFWr6x7AhTvLj5uduw6VpsDlA+WuFnqA+xXjRHFyqQTX5RsdNpSiXejsZ9afJ
         hcQvWReZ63HSpRGKt2Z706b7Zt2wfkpsC2NHloNxCpI7hU/7RKNjpPoooM5Y80AVOJty
         Y9rPTjWhZy8GJkt6QiVaRUBeo/0JHw7rH6LDCDWiLzM0kB2dsf4f8m62bMUcO5vdfwxZ
         J57ear4DQwCZpUm1nR2orecNH1w2GcV8l/fTbs16w/YGwYLE26NJPkzk8aYCHQwVMPWn
         q+mcB1t1aHGI7k1Zz9eFFZ8qOPTVz9beSMvOcTUCAdOkbc3GaMNSZihnl7b3st7wb4Y4
         eRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733383993; x=1733988793;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jyPCCbXGwL2HX2ZQQ75iZPGtqkwk+FZ+xBNeL3SfQvk=;
        b=Ipd6whgVxhYB4VD9xYLANAWr49oxBbzI7RDrZ4YUzf1y4+uVxwXwps+/TeK0vP/t3i
         l/qBtBd3/oOqwTTgwuf8wvKPgD0KIsIifCkovnGfzYOhQNYCAvRt+LqRyorfnNfTfp4J
         t1P8TmMiD4NAe3kIzrD0BHoZH7YF1HDE0YdbynwWbm921WVc641QRvYDwRJZlkhoCQUG
         YDN6LpKCAP2nkOR/fVrPPdE8XCL7xQjitngJA3H/896BLdvXCdwbfun9WW96RVnsDKYg
         0fcBBJxteUE/zdTbQnCjt8Ytc+T6n3H/i6GgM/vMP77nU2i2MMUKQu9eWcGsn7qxfQ6G
         BVLw==
X-Forwarded-Encrypted: i=1; AJvYcCXtrfdpPcABezZBkd4C6CgyYsqfyl6bWiphdEdtsLqd1rakwuqWUvL+O1QWM5ppXuWd8/oIBOm7Kg4AajLQpcTRhw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTfdZcCaTCEUhPSyuGfj7fc5zaFyQ4+gF0TVkXxA7xID79YAE/
	+RcXTWAiM1tKLkTb5FHez6NUtHTvAtx1DfoeVVNYuAzyK/wb5lUf7vfYbSiNpC8=
X-Gm-Gg: ASbGnctaW6+mHAFpzMEjnlNVgiCjWNKcNXJZ1/K2SduWpJEB/YxixoLHG11sIecHGut
	+3ACp7oG+52CU2Ke3qJODikw1FM+4t7aQs509RCa2oU00QYfHfqaCZkhMhXRzK7xT+1+U27AaXM
	d95nrFrc7sYm+ng50NCOwYDUjXTTkKeeI3GxuTlN0DYEY4EgAJ8vKbVGAK74pAyQ67mlksUi3WP
	8d4OcYHpgaYawnzsMG/e2yAM4H80yla96HyknxzRcVhLGzeKhB+un6F3qvX1WOIuPiS4BJkB8ox
	9+icK4jJBlRjyCvyW4oL4wdP9bCGGqQbsQ==
X-Google-Smtp-Source: AGHT+IHfI+UCHItr2vvHKPBrNf3u5if9tiRttGFiL6E80p15Kq2YgAQozShUjLutF89S1nrAwt0aIw==
X-Received: by 2002:a17:907:1ded:b0:aa5:2d9a:1528 with SMTP id a640c23a62f3a-aa5f7f40800mr661936566b.60.1733383993082;
        Wed, 04 Dec 2024 23:33:13 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260888casm53371766b.133.2024.12.04.23.33.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 23:33:12 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v3 0/8] USB31DRD phy updates for Google Tensor gs101
 (orientation & DWC3 rpm)
Date: Thu, 05 Dec 2024 07:33:11 +0000
Message-Id: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADdXUWcC/43NQQqDMBQE0KtI1k35+QatXXmP0kVMogYkkURCR
 bx7v25KV+1yBubNxpKNziZ2LzYWbXbJBU+hvBRMj8oPljtDmSGgFAJrPiQBgs/jyiflbeKB5n5
 RC+3OFhuDoCtzkwYZKXO0vXudD48n5dGlJcT1PMziaP+3s+DARVf32qJsKujayXkVwzXEgR14x
 g+IUP4GkUAJRvekVjWYL3Df9zelo8+vIAEAAA==
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0

Hi,

This series enables USB3 Type-C lane orientation detection and
configuration on platforms that support this (Google gs101), and it
also allows the DWC3 core to enter runtime suspend even when UDC is
active.

For lane orientation, this driver now optionally (based on DT)
subscribes to the TCPC's lane orientation notifier and remembers the
orientation to later be used during phy_init().

To enable DWC3 runtime suspend, the gadget needs to inform the core via
dwc3_gadget_interrupt() with event type == DWC3_DEVICE_EVENT_DISCONNECT
of a cable disconnect. For that to allow to happen, this driver
therefore needs to stop forcing the Vbus and bvalid signals to active
and instead change their state based on actual conditions. The same
TCPC notifier is used to detect this, and program the hardware
accordingly.

That signal state is based on advice given by Thinh in
https://lore.kernel.org/all/20240813230625.jgkatqstyhcmpezv@synopsys.com/

Both changes together now allow cable orientation detection to work, as
the DWC3 will now call phy_exit() on cable disconnect, and we can
reprogram the lane mux in phy_init().

On top of that, there are some small related cleanup patches.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v3:
- patches 1 & 2: update as per Rob's suggestions
- patch 7 & 8: drop init to -1 of phy_drd->orientation (Vinod)
- patch 7: avoid an #ifdef 
- Link to v2: https://lore.kernel.org/r/20241203-gs101-phy-lanes-orientation-phy-v2-0-40dcf1b7670d@linaro.org

Changes in v2:
- squash patches #2 and #3 from v1 to actually disallow
  orientation-switch on !gs101 (not just optional) (Conor)
- update bindings commit message to clarify that the intention for the
  driver is to work with old and new DTS (Conor)
- add cc-stable and fixes tags to power gating patch (Krzysztof)
- fix an #include and typo (Peter)
- Link to v1: https://lore.kernel.org/r/20241127-gs101-phy-lanes-orientation-phy-v1-0-1b7fce24960b@linaro.org

---
André Draszik (8):
      dt-bindings: phy: samsung,usb3-drd-phy: add blank lines between DT properties
      dt-bindings: phy: samsung,usb3-drd-phy: gs101: require Type-C properties
      phy: exynos5-usbdrd: convert to dev_err_probe
      phy: exynos5-usbdrd: fix EDS distribution tuning (gs101)
      phy: exynos5-usbdrd: gs101: ensure power is gated to SS phy in phy_exit()
      phy: exynos5-usbdrd: gs101: configure SS lanes based on orientation
      phy: exynos5-usbdrd: subscribe to orientation notifier if required
      phy: exynos5-usbdrd: allow DWC3 runtime suspend with UDC bound (E850+)

 .../bindings/phy/samsung,usb3-drd-phy.yaml         |  21 +-
 drivers/phy/samsung/Kconfig                        |   1 +
 drivers/phy/samsung/phy-exynos5-usbdrd.c           | 215 ++++++++++++++++-----
 3 files changed, 190 insertions(+), 47 deletions(-)
---
base-commit: c245a7a79602ccbee780c004c1e4abcda66aec32
change-id: 20241127-gs101-phy-lanes-orientation-phy-29d20c6d84d2

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


