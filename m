Return-Path: <linux-samsung-soc+bounces-2591-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E188987B0
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  4 Apr 2024 14:32:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21C601F2390B
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  4 Apr 2024 12:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD62813281A;
	Thu,  4 Apr 2024 12:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iHEm/hhw"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C589C126F2F
	for <linux-samsung-soc@vger.kernel.org>; Thu,  4 Apr 2024 12:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712233632; cv=none; b=s/gh0Tg8lznMNMdkTych0PX29riz3D7UAZ/obNNW7gvOadMQdInzJ0rltAIn0aOdo4wtdym+RRYzHa3lx7PTSq2UoNOI2Kvth2x0jZitttxY437c4dDGJ4bpSpBL5itdyDBdIY+jpSzX19gDyXYCf4y+E+NcCkNejSoJSxZe72k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712233632; c=relaxed/simple;
	bh=+YrjQuYkzpbkgTiZ02L9PWnth+bzJpI7fMpasghCuJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YhhMOsAV/p7ulYSCscGPizBT9+Qo8FVxQpqh2FcjiYUwNN9P978Wb9a1ioYg0sJewTZx/h7g0Z3XbHUUo1RPcsktGVQzpYZpebJb84h7Q4p7oSnDsOjmkP2l9PjNhjRlC4afwBiaBfwg+FGHc+C4/wK7jTX7zr7KIGnspAOIAlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iHEm/hhw; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-343892ca0a7so544798f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 04 Apr 2024 05:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712233629; x=1712838429; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgPBPMCw5GyB+aBTeOfPQm+FcgAEUC59VhTOSS1AQpE=;
        b=iHEm/hhwhFUabC3vWuoap0Q5J4Qkg9YTP01ea0hefX4RgVjaRDb8H/DIvNKLxv6o9m
         2+me1ZQrqfeBBXHR/0zkO2oWVXSpL34SICX9n3hNWZESFuNfeyEz4NbZKLS0pi4jIyUy
         mTAvr3LakJE9Pt6eGODLQgvTnjtFHJzU9o35s02EXNSZa9/E5KZI6yeQqibwbXqItxY3
         Po0+HUyW7gOHWAQ5wZ12u976m+lkYaNhGrkRwJHI+xtytJWi0zO9OJpu/2G6mL2CPuR7
         cpxDICCXmjZFRX0joYTbnpsxrdWwrLYLsdwe7taZPeC5Bn0uy9Yrx0x3rz3MNmtMmWe1
         Q/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712233629; x=1712838429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JgPBPMCw5GyB+aBTeOfPQm+FcgAEUC59VhTOSS1AQpE=;
        b=B52x82x7V7geUqeHFBvizPK26HXYXwjdJ5tGzd6qfbbiBfTBdwmHNw4VcFkTV9znnp
         4v20TgvU4iTeNXc4Ut3ofkBIkZm2YjQBGXSNNKVrEre6tgZmfdvuCGBwsHpFuVYEkPHF
         RjBFqllm6H6sfW2ukTlsiFLebpWy12b0vPGvwrHyGxz9IegqNwsrL+WHMmbH2Kr17ajA
         r/uQniQoZLh4pFohlLWHfeURspmGK5r8YqHmr+5g2psf11A7zNsq2hBkuAJQSDqqx+pm
         tqPYvxSqFhJmbCMESs1y5yVr7x8BuDpL5Oqi5aOvC5xgyVMlv0HiJdtpIqWtVT8/2Rw/
         jktw==
X-Forwarded-Encrypted: i=1; AJvYcCWj6g9JPKZmWFU7G05x65eVnK8OLmaLNbQWf9OgwwLW6FKKL5pGIHfnvSr2Wz0X57fyuECX4R6OxcVLlmXp5hpFDoDZNJXsVOUxulmKVDKHgyo=
X-Gm-Message-State: AOJu0YxI8uOsyh990X+bzUR/fiHgZ2prl6SWglJIrbeusZpXsrWEXrV1
	SBZM9WDkwHRQmzChJxWMQZ3V1mfYYW5RMiSSAJ/lq/+i5RjLBr8MOHPKAgwrz2c=
X-Google-Smtp-Source: AGHT+IGScuD3FBSROdWx9E6Axce9tMgIrVnBexnpdwLykG2zLE0tclwNZaj4pPDNauwOIO5TTuXZBg==
X-Received: by 2002:a5d:42c4:0:b0:343:7228:f70f with SMTP id t4-20020a5d42c4000000b003437228f70fmr2132667wrr.61.1712233629256;
        Thu, 04 Apr 2024 05:27:09 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([148.252.128.204])
        by smtp.gmail.com with ESMTPSA id bu14-20020a056000078e00b003434b41c83fsm12106303wrb.81.2024.04.04.05.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 05:27:08 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	s.nawrocki@samsung.com,
	cw00.choi@samsung.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	chanho61.park@samsung.com,
	ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH 10/17] phy: samsung-ufs: ufs: Add SoC callbacks for calibration and clk data recovery
Date: Thu,  4 Apr 2024 13:25:52 +0100
Message-ID: <20240404122559.898930-11-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
In-Reply-To: <20240404122559.898930-1-peter.griffin@linaro.org>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some SoCs like gs101 don't fit in well with the existing pll lock and
clock data recovery (CDR) callback used by existing exynos platforms.

Allow SoCs to specifify and implement their own calibration and CDR
functions that can be called by the generic samsung phy code.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/phy/samsung/phy-exynos7-ufs.c      |  1 +
 drivers/phy/samsung/phy-exynosautov9-ufs.c |  1 +
 drivers/phy/samsung/phy-fsd-ufs.c          |  1 +
 drivers/phy/samsung/phy-samsung-ufs.c      | 13 ++++++++++---
 drivers/phy/samsung/phy-samsung-ufs.h      |  5 +++++
 5 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/samsung/phy-exynos7-ufs.c b/drivers/phy/samsung/phy-exynos7-ufs.c
index a982e7c128c5..15eec1d9e0e0 100644
--- a/drivers/phy/samsung/phy-exynos7-ufs.c
+++ b/drivers/phy/samsung/phy-exynos7-ufs.c
@@ -82,4 +82,5 @@ const struct samsung_ufs_phy_drvdata exynos7_ufs_phy = {
 	.clk_list = exynos7_ufs_phy_clks,
 	.num_clks = ARRAY_SIZE(exynos7_ufs_phy_clks),
 	.cdr_lock_status_offset = EXYNOS7_EMBEDDED_COMBO_PHY_CDR_LOCK_STATUS,
+	.wait_for_cdr = samsung_ufs_phy_wait_for_lock_acq,
 };
diff --git a/drivers/phy/samsung/phy-exynosautov9-ufs.c b/drivers/phy/samsung/phy-exynosautov9-ufs.c
index 49e2bcbef0b4..9c3e030f07ba 100644
--- a/drivers/phy/samsung/phy-exynosautov9-ufs.c
+++ b/drivers/phy/samsung/phy-exynosautov9-ufs.c
@@ -71,4 +71,5 @@ const struct samsung_ufs_phy_drvdata exynosautov9_ufs_phy = {
 	.clk_list = exynosautov9_ufs_phy_clks,
 	.num_clks = ARRAY_SIZE(exynosautov9_ufs_phy_clks),
 	.cdr_lock_status_offset = EXYNOSAUTOV9_EMBEDDED_COMBO_PHY_CDR_LOCK_STATUS,
+	.wait_for_cdr = samsung_ufs_phy_wait_for_lock_acq,
 };
diff --git a/drivers/phy/samsung/phy-fsd-ufs.c b/drivers/phy/samsung/phy-fsd-ufs.c
index d36cabd53434..f2361746db0e 100644
--- a/drivers/phy/samsung/phy-fsd-ufs.c
+++ b/drivers/phy/samsung/phy-fsd-ufs.c
@@ -60,4 +60,5 @@ const struct samsung_ufs_phy_drvdata fsd_ufs_phy = {
 	.clk_list = fsd_ufs_phy_clks,
 	.num_clks = ARRAY_SIZE(fsd_ufs_phy_clks),
 	.cdr_lock_status_offset = FSD_EMBEDDED_COMBO_PHY_CDR_LOCK_STATUS,
+	.wait_for_cdr = samsung_ufs_phy_wait_for_lock_acq,
 };
diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
index c567efafc30f..f57a2f2a415d 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.c
+++ b/drivers/phy/samsung/phy-samsung-ufs.c
@@ -46,7 +46,7 @@ static void samsung_ufs_phy_config(struct samsung_ufs_phy *phy,
 	}
 }
 
-static int samsung_ufs_phy_wait_for_lock_acq(struct phy *phy)
+int samsung_ufs_phy_wait_for_lock_acq(struct phy *phy, u8 lane)
 {
 	struct samsung_ufs_phy *ufs_phy = get_samsung_ufs_phy(phy);
 	const unsigned int timeout_us = 100000;
@@ -98,8 +98,15 @@ static int samsung_ufs_phy_calibrate(struct phy *phy)
 		}
 	}
 
-	if (ufs_phy->ufs_phy_state == CFG_POST_PWR_HS)
-		err = samsung_ufs_phy_wait_for_lock_acq(phy);
+	for_each_phy_lane(ufs_phy, i) {
+		if (ufs_phy->ufs_phy_state == CFG_PRE_INIT &&
+		    ufs_phy->drvdata->wait_for_cal)
+			err = ufs_phy->drvdata->wait_for_cal(phy, i);
+
+		if (ufs_phy->ufs_phy_state == CFG_POST_PWR_HS &&
+		    ufs_phy->drvdata->wait_for_cdr)
+			err = ufs_phy->drvdata->wait_for_cdr(phy, i);
+	}
 
 	/**
 	 * In Samsung ufshci, PHY need to be calibrated at different
diff --git a/drivers/phy/samsung/phy-samsung-ufs.h b/drivers/phy/samsung/phy-samsung-ufs.h
index e122960cfee8..7de6b574b94d 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.h
+++ b/drivers/phy/samsung/phy-samsung-ufs.h
@@ -112,6 +112,9 @@ struct samsung_ufs_phy_drvdata {
 	const char * const *clk_list;
 	int num_clks;
 	u32 cdr_lock_status_offset;
+	/* SoC's specific operations */
+	int (*wait_for_cal)(struct phy *phy, u8 lane);
+	int (*wait_for_cdr)(struct phy *phy, u8 lane);
 };
 
 struct samsung_ufs_phy {
@@ -139,6 +142,8 @@ static inline void samsung_ufs_phy_ctrl_isol(
 			   phy->isol.mask, isol ? 0 : phy->isol.en);
 }
 
+int samsung_ufs_phy_wait_for_lock_acq(struct phy *phy, u8 lane);
+
 extern const struct samsung_ufs_phy_drvdata exynos7_ufs_phy;
 extern const struct samsung_ufs_phy_drvdata exynosautov9_ufs_phy;
 extern const struct samsung_ufs_phy_drvdata fsd_ufs_phy;
-- 
2.44.0.478.gd926399ef9-goog


