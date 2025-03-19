Return-Path: <linux-samsung-soc+bounces-7514-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8224A693AA
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 19 Mar 2025 16:37:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99E661B66518
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 19 Mar 2025 15:32:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 142711E04AD;
	Wed, 19 Mar 2025 15:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b9lEonAp"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABE001DE4E0
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Mar 2025 15:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742398240; cv=none; b=khi3Dtr+4cYksVzHW9oAvMwC3rekvsLe51M/Nqwlm+jM2+ikq1LZhCF5nNmBxp70x6Kkx6dXGBBKv4e9Gy0DNvZ/9sqpRIdUY4Nao1SjjSQilrvJX2bmQMTqEZxtSKSaGGII24SMtbul3xOLl6rGcUBMcAoTK0sdq+sLDfykgJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742398240; c=relaxed/simple;
	bh=meJ2NRXYTrgH1O0PZsicJBELBIeyADpQnFr+0uBOXCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oJRAV+f4h9mce8NLIDgakkvl4fqEPh0Rcw7tHpTM0W4T4qhgIHZx8LKPDghaQa2xcJLDLqZDPsUO0ivc8RFjg7XAGyXW576cX3x3fNvSVMUp7CRI2ib4OfKHAe/iPUbRd/H2yyEbQqiXJcdSndbmN2bQkwAkDUKU82hrosA4AbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b9lEonAp; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43690d4605dso32782475e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Mar 2025 08:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742398236; x=1743003036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x9eSGRpGRsI7cZDtS5Yy4CgMDaMHl5lqU7SxcNwGqzg=;
        b=b9lEonAp1vrqGFYKT7Z+0w/MImvPfC5wwu3Uw7msJBigEwtX9pE/D2DE2O/xxQPBUH
         D4DkeBh1GNtkmF4gm26GC+HNqgfDI+X8+f4DYLGVBQZJCqsbehNywG7wJApn5v+wIvIH
         YJHV6jUjrAZU9X88mswbpH5O6c8muVdOPWnshfngDvGqhuWXu0ZtlhBNWdXe7HZn18g2
         UnG96/yxE/pPiAIfLcQJjfhcXBOIPOexPk/blIY0nKCnR4E7kx22wFQn6PzbgNVqzv9g
         mI2lNfz/zDarcKgeNerAn1c4WSih29FTiYe86N7AVbuOpBWefmg3cFU+IS7lPKH1b0j1
         BnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742398236; x=1743003036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9eSGRpGRsI7cZDtS5Yy4CgMDaMHl5lqU7SxcNwGqzg=;
        b=aV5FUmxnVZ9P6KUQlTUHFBQ//czNSzIGtGnhzmi4wXIuWroWL5TVGOQxy94n4a41UI
         Djj5piDKSDyeXuXh8WIHb0RCGcRThpJoSMI+wJv73zrBD1ie086Wf6Hh2iUIWSsA4gqR
         T9jqEncfNd1TrmIkMQZhiJs2rkdW8x1uqSoDaEMWSkg0nkAh/D7XmHkjxSqP6DL5/Yzq
         ZSJFOO6Pssag9qE7r8OPpfyyKx18qtgWcnyTSz3T37aop1635dMu64Gg3ZzEi/pCTu3X
         sPcCvfoTXUnXkEBteH/53wLdAhQRJLCpiN/U/2a5Q9akEXFzPgRxIOeACsBhsyte9UrT
         Hr8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVXIOd19KGMBmIzFSKZflZ1OoAmwdokpAwAZh+6Y/a/IrVaxN3RwctJpGHmkAMzb7mX/a7iOfzw76CxtvjJOfORDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoKq/YUA8/RKseGJ4ezHoUOYdPL1aBWZybqcUxaxr8WiYz6gRn
	xzVZRQHYileg4gVh66sacaIu8FZKBqjcr8+KfgZk08MUud7w5rwX/3FyMv7hyfc=
X-Gm-Gg: ASbGncvCAOWCwLIDlnhAQLJ3z2niNKBhclnQHtDdKYVBkgK0UtKM3GAp9HTPQPOixN3
	PlvFZ2Ngm8C4YeT6TXIIndijF0M3JWOUkLS/vGpt1u55I7CisNtnFk26HohTkB/27kA5q7tyQpf
	RFRCO9EXjDXd/YczYQCAoLSjZxGn6Cya4Yph9fbjKzAsmHP91vNFd7u0J3BRrzwa3KVYU+8A9T3
	qZS7HJFw9/QhSRaGF6ujKJrSy0DNO8XeMZFXvqExuIj9i2kbZBm8AHrNy9Inn2t+/iTYXm/5Kyk
	n1Jr3YM51L+JoN5ua8wU8DUCotHqs+74oQ2WFwDtEspNK7+MxRjZDSCW5LKJ5JhAY0t9PzFlZ6l
	lvvpGKJ2ZAh0=
X-Google-Smtp-Source: AGHT+IG9lKVl9ggOk268CWWDmgKFxbPbR+Kt9zHqmVimmqFce/v8krfj/anJNbYuVt/uhkH4oSO4OA==
X-Received: by 2002:a05:600c:a00e:b0:43d:2230:303b with SMTP id 5b1f17b1804b1-43d43815fb5mr29107145e9.20.1742398235982;
        Wed, 19 Mar 2025 08:30:35 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([212.105.145.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43fdaca8sm22590635e9.28.2025.03.19.08.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 08:30:35 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 19 Mar 2025 15:30:22 +0000
Subject: [PATCH v2 5/7] scsi: ufs: exynos: Enable PRDT pre-fetching with
 UFSHCD_CAP_CRYPTO
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-exynos-ufs-stability-fixes-v2-5-96722cc2ba1b@linaro.org>
References: <20250319-exynos-ufs-stability-fixes-v2-0-96722cc2ba1b@linaro.org>
In-Reply-To: <20250319-exynos-ufs-stability-fixes-v2-0-96722cc2ba1b@linaro.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Chanho Park <chanho61.park@samsung.com>
Cc: linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Eric Biggers <ebiggers@kernel.org>, Bart Van Assche <bvanassche@acm.org>, 
 willmcvicker@google.com, kernel-team@android.com, tudor.ambarus@linaro.org, 
 andre.draszik@linaro.org, Peter Griffin <peter.griffin@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1888;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=meJ2NRXYTrgH1O0PZsicJBELBIeyADpQnFr+0uBOXCw=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn2uMRE20Q5ANasCRwuFnlZzMwCdJvDbk0vH/NI
 8dr9BquauWJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ9rjEQAKCRDO6LjWAjRy
 ui5vEACXBq0bqFMkUCLc92+siadp/QAjpVDOeVSbJHwT+Cmk7B9ZsJZTrROLNYvOfzD8gBNB5PN
 zzYuFEYIUSQchIQGiwl62xCh3YJ2vvxH+L2FuqiILWVx9aztYZ4vgv/xjQbJiwXMDYNfOKppURe
 T4hKRWySn2olNQ5K5tL+at0tIES0oYCOl1gMe3i5F6EdHDkauNsACg0x9cp49mwNTvaHXoKG1+K
 HdH9Y1VAmkF6xfCM+He7BlylF5t4hLDLhraMjf1avMM8+6JSZdEzvYWwbxW/htvWeS4ebKh9MsT
 sH6lwEDjT+XeErUt+BFGQdsxVTb0xxbuC3vEqsJtbCbH+RC6Qb28ksiN+zhSSGtldjO8Eid2dc8
 4P1y5ijkVlVQF+aOw+/AjmYq+DhbQfVAORWLzGiDSz/4xUVbceDx8J2DHEHBGO/Y8PxkPpwpOwp
 OSaxshVmG8YagyrVTpc2ZaSC5Ryso+cgXsNzObgLUS1Oj91x+q1EpG1p2OwLXsmpxJCpPjKq/Ak
 xWC3tqrFD1Qx7uoWwEXlLiSduuX3aRzE6uwScIig984D0O2VDipXBrx8t/CF78Mu8vZoJ2JcqtG
 gDF6rMO2dbXrlY7PxeeBA7cPioGiCPg3+RZm2GgQV6pTO9rNqSHlw7KcCFccM2etD+g4CNlOBmS
 w63Hm9SJISK8soQ==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

PRDT_PREFETCH_ENABLE[31] bit should be set when desctype field of
fmpsecurity0 register is type2 (double file encryption) or type3
(support for file and disk encryption). Setting this bit enables
PRDT pre-fetching on both TXPRDT and RXPRDT.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes since v1:
* Update PRDT_PREFECT_EN to PRDT_PREFETCH_EN (Bart)
* Update commit description for desctype type 3 (Eric)
---
 drivers/ufs/host/ufs-exynos.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 34e16e198830d086cbdb6cb0b027ca92687b2ae6..f6980f05bd5555b351070fe33d0afda469fe498c 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -34,7 +34,7 @@
  * Exynos's Vendor specific registers for UFSHCI
  */
 #define HCI_TXPRDT_ENTRY_SIZE	0x00
-#define PRDT_PREFECT_EN		BIT(31)
+#define PRDT_PREFETCH_EN	BIT(31)
 #define HCI_RXPRDT_ENTRY_SIZE	0x04
 #define HCI_1US_TO_CNT_VAL	0x0C
 #define CNT_VAL_1US_MASK	0x3FF
@@ -1098,12 +1098,17 @@ static int exynos_ufs_post_link(struct ufs_hba *hba)
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
 	struct phy *generic_phy = ufs->phy;
 	struct exynos_ufs_uic_attr *attr = ufs->drv_data->uic_attr;
+	u32 val = ilog2(DATA_UNIT_SIZE);
 
 	exynos_ufs_establish_connt(ufs);
 	exynos_ufs_fit_aggr_timeout(ufs);
 
 	hci_writel(ufs, 0xa, HCI_DATA_REORDER);
-	hci_writel(ufs, ilog2(DATA_UNIT_SIZE), HCI_TXPRDT_ENTRY_SIZE);
+
+	if (hba->caps & UFSHCD_CAP_CRYPTO)
+		val |= PRDT_PREFETCH_EN;
+	hci_writel(ufs, val, HCI_TXPRDT_ENTRY_SIZE);
+
 	hci_writel(ufs, ilog2(DATA_UNIT_SIZE), HCI_RXPRDT_ENTRY_SIZE);
 	hci_writel(ufs, (1 << hba->nutrs) - 1, HCI_UTRL_NEXUS_TYPE);
 	hci_writel(ufs, (1 << hba->nutmrs) - 1, HCI_UTMRL_NEXUS_TYPE);

-- 
2.49.0.rc1.451.g8f38331e32-goog


