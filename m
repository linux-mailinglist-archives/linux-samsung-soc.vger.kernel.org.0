Return-Path: <linux-samsung-soc+bounces-2839-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BFC8AF88D
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 23 Apr 2024 22:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A56EC1C2414A
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 23 Apr 2024 20:54:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584F3149001;
	Tue, 23 Apr 2024 20:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yrnYyhEn"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839C5148851
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 20:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713905443; cv=none; b=Hta6lvxq4PG32uXH9DOPP/EcZBRYIsT1x5odJND5zKM87zxQQLkOQxQNncuCwTnBXYNYkjNmI5ZPpS0buevZA4ualguAnWjAOgXFlfIieoDYbLKVOyELXq+OGTSyn1GfxZ7+psrwFs37eGFcGeaLnMOgN71yEpYamgImzmcWtEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713905443; c=relaxed/simple;
	bh=n9yKBX8qjigC7/F1M8bGWOMSsRVeFv1nqroVB06gU6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V37euGJmUfEpAbBea1d7afP2xsvzFTYGeM28LEMPnIoql8vtDh4n791bFz1XlcT27IHIHHCg5IxMyVtQtQnVVD9fwUf8rCp/klODWTUi3oSxmzoZMZBKBO06PGcmuqguIVGuy9kX7qZIYpkpd91tOfgSdy4wsSSrqw8gK3TBKPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yrnYyhEn; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-41a5b68ed4fso21758745e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 13:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713905440; x=1714510240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbXwx/HNBBmagZEhDQ/BaLCRVM/2fRQKE1iroB24Qwo=;
        b=yrnYyhEnOKtUI5APqUrLIGkdaBVwqLwltxjoo3rEiYHgDy3vtzPGG1JIAcv/jCkHHX
         Y1JqXXX1hARwF4/LAlhpQxGFsEQMtlE2RFyDr3Hkhg7e0BF5bmT2f3eqUrCb9aXzYjZv
         XwPaefIT5P3cJ2XRUMXZGoxTht1r9dTIDiocRCavryAE0CU+gAEM879+Qh9lFYlLkFUA
         cmae8l/0gwlfmP8b/W34RHnNRqp6qofVyOnd1BiVULbsFxijJCzR2qsusSjiyYizaC04
         xc2vViHYI5+YPGqlp3QQEteAeqHsO+spp8M0nJKvQEtmaynBPagEOeTNqU5m30RQljNz
         0pgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713905440; x=1714510240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbXwx/HNBBmagZEhDQ/BaLCRVM/2fRQKE1iroB24Qwo=;
        b=WS45DpS8nIFf/KryPeilWs0enjrpEbnIxNYFwAuraqqp6yvzV+Zh0W3OYBdCoPlXgc
         EXkLg3+U9K84K0S6AnpnomL5egHELVt9ag+iO1tktpTBxzKKZKABbjKJX5opvsnwaUYj
         ULWIB2ZjT55j+j1Fl0EQx0wbXMXAms+DwI4YmBJms18qpK4gV2I32kQBABAdQFgzNQNh
         l00wNIM549nbTewvHcvK1nQkk7pZxGqiQoRU/DLO61nM+sPt9AcPl3HEmiTTNHdCqKO9
         0VNuDZoZrCiMS1jKL8vpCK9rlAdlIzk3J17Cp0nOnl5GeC4d5O+cWo19pvuDVA5oj75E
         pmsA==
X-Forwarded-Encrypted: i=1; AJvYcCVjbsjgz+xFgtkXK4Ozdxnv/Dqg7QwwLrvrQuaaADxFfg08A+DOT9vC3fr1kFcApY1aAxvZ4Vb/KEdpFecS3NlyVkEtd2WmbGesHu7P5U2OLGI=
X-Gm-Message-State: AOJu0YwlLMdc8PGTsD88xZ7ORQKzeeGM8iZJlXN7iBdv6XgSqL3axFwk
	i5l2epFR8OuAG7uZjUhELbSZ3vU0xUOLLlc6j5fJwtwlHYb65CCmLxjihBGpLTU=
X-Google-Smtp-Source: AGHT+IHSIqtxInKq6iiYNFNJ3kqmhV16rsXVp7brkjqIWHMJnipiSbohaGIAsxP3Imlg1RbkqgCLdA==
X-Received: by 2002:a05:600c:35c4:b0:417:ee98:dfac with SMTP id r4-20020a05600c35c400b00417ee98dfacmr271852wmq.34.1713905440049;
        Tue, 23 Apr 2024 13:50:40 -0700 (PDT)
Received: from gpeter-l.lan ([2a0d:3344:2e8:8510:4269:2542:5a09:9ca1])
        by smtp.gmail.com with ESMTPSA id bg5-20020a05600c3c8500b00419f419236fsm13065443wmb.41.2024.04.23.13.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 13:50:39 -0700 (PDT)
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
	James.Bottomley@HansenPartnership.com,
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
Subject: [PATCH v2 14/14] phy: samsung-ufs: ufs: exit on first reported error
Date: Tue, 23 Apr 2024 21:50:06 +0100
Message-ID: <20240423205006.1785138-15-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
In-Reply-To: <20240423205006.1785138-1-peter.griffin@linaro.org>
References: <20240423205006.1785138-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To preserve the err value, exit the loop immediately if an error
is returned.

Fixes: f2c6d0fa197a ("phy: samsung-ufs: use exynos_get_pmu_regmap_by_phandle() to obtain PMU regmap")
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/phy/samsung/phy-samsung-ufs.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/samsung/phy-samsung-ufs.c b/drivers/phy/samsung/phy-samsung-ufs.c
index ffc46c953ed6..6c5d41552649 100644
--- a/drivers/phy/samsung/phy-samsung-ufs.c
+++ b/drivers/phy/samsung/phy-samsung-ufs.c
@@ -99,12 +99,18 @@ static int samsung_ufs_phy_calibrate(struct phy *phy)
 
 	for_each_phy_lane(ufs_phy, i) {
 		if (ufs_phy->ufs_phy_state == CFG_PRE_INIT &&
-		    ufs_phy->drvdata->wait_for_cal)
+		    ufs_phy->drvdata->wait_for_cal) {
 			err = ufs_phy->drvdata->wait_for_cal(phy, i);
+			if (err)
+				goto out;
+		}
 
 		if (ufs_phy->ufs_phy_state == CFG_POST_PWR_HS &&
-		    ufs_phy->drvdata->wait_for_cdr)
+		    ufs_phy->drvdata->wait_for_cdr) {
 			err = ufs_phy->drvdata->wait_for_cdr(phy, i);
+			if (err)
+				goto out;
+		}
 	}
 
 	/**
-- 
2.44.0.769.g3c40516874-goog


