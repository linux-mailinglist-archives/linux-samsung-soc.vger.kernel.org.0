Return-Path: <linux-samsung-soc+bounces-1985-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1373F857F86
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 16 Feb 2024 15:41:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A80DCB21695
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 16 Feb 2024 14:41:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4140612F397;
	Fri, 16 Feb 2024 14:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HMBaU6me"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B1C12F363
	for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 14:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708094440; cv=none; b=AUFV5X/cPA5SVJFwDkHePZSZIVFUrOwzS9JHow7D3PucBLELkY2HaRS5swrW4X1sms3OX3G6TElCkGjVacYMmcA6VhQ568zHa7UTVvxRYM3W/1+b7tTv6dmrjitozni8DSqYva9OEnQcn/4gr11lNNNONyutSO77W+U8ZOS1gAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708094440; c=relaxed/simple;
	bh=JRNY0w7Ro2R0aulceus9kSJUlVFLy2lL65NJT4HL82U=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=T8OS5xYrTUhXoHa3/+B2ymlu37hBz7cHC49Q/0naAAv6Lpebdt/vJJzyEuCUAwvLKwegbF7799qFmHQmH2zaO0CvqNAhwTmDI96xmKRRltsZ5ZC0o0RG8Gua9ae2Ewq+IT2ndxP3+qlmriKD8AodaaDVimlmzddUOoCyTPI3ExI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HMBaU6me; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a26f73732c5so128923866b.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Feb 2024 06:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708094436; x=1708699236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=asD3ev0Cb3OxFqrbvaOTmglMW6LCxeDZuldyNVrUzqM=;
        b=HMBaU6meM0zNFQx8a9qVCgBMTlIgdLdcpZA4R7rBTUt0icL5+6V4gr4mQxSwK/cJN9
         Mbm6PDM2lU88SRDLKHL4Kop0MMe4om6ZsKAKJpHAQmczJJwxvtAZXsXQKYUUZe1Yyv/6
         VKX/RWrR6gbEb0UKEjR5L/11s0GJaOpQTQ+JG/S0ZKuc6j5qJ6tq7DYngDXf+Uj4/r3b
         Wi4r/8GYa5d+T3WQW30x1uXOHwAECEdBeg6OzhKPTdATJTqaiQhIz+oLMtsiOI4d76gU
         50/XwMAoSY7T+5as8AillwaOru1Dii7w5OAEcPdmtNoU0tMIn15dW6GfjkkzbmHvDtN2
         w0yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708094436; x=1708699236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=asD3ev0Cb3OxFqrbvaOTmglMW6LCxeDZuldyNVrUzqM=;
        b=BkmYT2+XL8acAnh+Vw9crdC0uv8RwvAYMJs+Dkl2t3f4ZYAXup1rdxxQo/foReIbNr
         Ax9qxaR+xu/iHgIOBi3taot4/j3xZGrJa2XrmZt0kaKzF9xwN/5YD+i4LgfvUVoOBRmp
         de7V58hRjNodWZuMNxS1UjNN2bWyWSOsQOJqzpiBRCqi5a0n/aFjSyXnI32946S+V4T1
         4Y3hh3ZKnEb2ojq80SjQvO5Gg9DW8Ei1H9kYht3crEdQtt8V9tb2fhHbfQEPRseqYeYV
         LzemgRocH+HHW9ibvPgwhDk1DArRehrYtG5Zlr84DgVieM9Kujf6SAXhSG6UKvs5wkEV
         VCEg==
X-Forwarded-Encrypted: i=1; AJvYcCW6vNgRAMMhExJBOJe5ysnFVIY8ycfBvnsT0frdEQ4seGeEM+XT70DXgUOUeWVOO8HKM9Cr02vB4LX2IV1bp4CIeDvlfekHfeJzWVUEAFK8QIQ=
X-Gm-Message-State: AOJu0YzfgEvi72v8siSUH4dADE4/aTWgg9BK5UtsQ59hUFmNpt+M5RLj
	4UGsemA89EuFWgA6mEsR4mf4gcKVvm6JjjU38T5gdeqPRnRb994t3lnHDrhVXkc=
X-Google-Smtp-Source: AGHT+IGCyUGN+VLUaRlt1OZxHWuQFmwSgWLlGY6S3fHlEaQRS780PIZW2GJtYg2x+OIezg266xrJrQ==
X-Received: by 2002:a17:906:7d86:b0:a3b:f054:92a2 with SMTP id v6-20020a1709067d8600b00a3bf05492a2mr3792983ejo.59.1708094436519;
        Fri, 16 Feb 2024 06:40:36 -0800 (PST)
Received: from krzk-bin.. ([78.10.207.130])
        by smtp.gmail.com with ESMTPSA id a8-20020a170906670800b00a3ce3c5b2a4sm1592942ejp.195.2024.02.16.06.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 06:40:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Clark <robdclark@gmail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	virtualization@lists.linux.dev
Subject: [PATCH 3/4] iommu: constify fwnode in iommu_ops_from_fwnode()
Date: Fri, 16 Feb 2024 15:40:26 +0100
Message-Id: <20240216144027.185959-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240216144027.185959-1-krzysztof.kozlowski@linaro.org>
References: <20240216144027.185959-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make pointer to fwnode_handle a pointer to const for code safety.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/iommu/iommu.c | 2 +-
 include/linux/iommu.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 26a31ba4f72d..a1f9bb8fa041 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2987,7 +2987,7 @@ bool iommu_default_passthrough(void)
 }
 EXPORT_SYMBOL_GPL(iommu_default_passthrough);
 
-const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode)
+const struct iommu_ops *iommu_ops_from_fwnode(const struct fwnode_handle *fwnode)
 {
 	const struct iommu_ops *ops = NULL;
 	struct iommu_device *iommu;
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index 600fc6e6f308..269ef0af7f20 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -903,7 +903,7 @@ int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode,
 		      const struct iommu_ops *ops);
 void iommu_fwspec_free(struct device *dev);
 int iommu_fwspec_add_ids(struct device *dev, const u32 *ids, int num_ids);
-const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode);
+const struct iommu_ops *iommu_ops_from_fwnode(const struct fwnode_handle *fwnode);
 
 static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device *dev)
 {
@@ -1253,7 +1253,7 @@ static inline int iommu_fwspec_add_ids(struct device *dev, u32 *ids,
 }
 
 static inline
-const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode)
+const struct iommu_ops *iommu_ops_from_fwnode(const struct fwnode_handle *fwnode)
 {
 	return NULL;
 }
-- 
2.34.1


