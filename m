Return-Path: <linux-samsung-soc+bounces-7515-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 077D8A69398
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 19 Mar 2025 16:35:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50C42887C3D
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 19 Mar 2025 15:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BF561E0DF5;
	Wed, 19 Mar 2025 15:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bqGEeb7F"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8895C1DF24D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Mar 2025 15:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742398241; cv=none; b=B7ZdgOiX9BuK5x5TR6YUQurq2PW5teB2amz5QJ9gdjKFIiXeJ338MO0EB28qKZEGi2ycGEXlR6z+zp4y9H/rAsMi99f/4KkAbFFELt6i/hQZM+n2PYa3nbFZSgmn/aDX5xXOAH25mYK3IOS8M1iAAztjOmDjDsmbfOqPGKxspOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742398241; c=relaxed/simple;
	bh=7s8ZG7rjsKFwjxleGe/WV0LjRuAvxIjVXT4DqwU66xo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RekKR/IHV++/dmcC6ltwFel1M/IcpcZx5pJfDttcdbcgqTccmeUYam/PECdQK5L2i69AOVh3bMSDuBuV/F0Hqi9ZeJXI6c1CyMImTllZzB4J2KQElLTtynPpiGh5tymIhwEvi1XRztkAkwjUtViZxVHs9eMYPh0cB1/uELCroYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bqGEeb7F; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cebe06e9eso34141915e9.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Mar 2025 08:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742398238; x=1743003038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AjZnmCYHxYj5r8o21deMPmCGzUUBOqv2gFKI29/i6QI=;
        b=bqGEeb7FN5igMVZoq3oBECyI2rjLfn6F6icrO66PL+ZcuLS5yQJl/bJB+tY5XkSRKF
         p+U/aF/mCtLgYfXn+lQsnLX9CmItyDR6Yc9IPnOU6KSy76KHo17GFupGHTi0hSQ+TC10
         eRmcsUfLmuQ+14iPSk1jSwN9H4B6CknbODCGWrMA0ViZnPcmcYWJuIYNFsKglijYkl9F
         jMstYTQLUlpyvkMflg0279bRTfdl9YMl6qfSZeW7V5pRdXsXaEXcmKBrvOGFJ9TahUuC
         VVNNMr3PukK1PEPGG02VvnwtVwjU414SkEIfVNTU+A8ndHoAZe3hGQXegcv9gAlkjypw
         rObg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742398238; x=1743003038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AjZnmCYHxYj5r8o21deMPmCGzUUBOqv2gFKI29/i6QI=;
        b=VvemIXeY8VI5xGScECxgo3I8sqkIOqn9+tKPvaBuw9jdQOmtMx2hC+ZqXY+qDRX0S5
         rD/jzmFSqHhJyl02hJyKaI5PfQbTFLG2oUgMQSPzO35kuP12WQz+RgbGjRZMgKbfMxbY
         o9H80WkcqQoVmI+yi6d2YrC94vlOUiFwDKe3p+uVEpjFvdA0+Bp0GOJNlN0Ot41+Na5/
         vTl1OR0ZiLZk1GO8O0P3ZAJ7niPJqGWWC/i46OezGjhpXHdFDIr5H2pFZsr2MVcKHiut
         X7RBamo9WMxTEzjSh8+xHh5dg0CKoUQiDEmauCEMX7UgS+lABCDz4BxZPKGrFmaPMYtj
         EjKA==
X-Forwarded-Encrypted: i=1; AJvYcCXinp/vHR2ggpUEkLTos3Lbw15CcCCn6F3nVXCYvNInSDif3iP5S/+fhOLUzbohXn611qA40KwLiq75N/oaVzrnYA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwaix9/2NuYXZVTm4ctwO5yL50W9H4SULdQBCvGVSq28SrU1Aa
	sOveiTsWYEBe++RK9uYOd8toMLkb/5Ospj6V/XJFEpQaASNcTBDySCF5S56+bLI=
X-Gm-Gg: ASbGncs3XI2hipmTyoSJE4XHXGjJCLLENOsF95qkSzuZ/5Z9g38kZlrkSfOHtooWJp2
	+7PZPerqx+teWX/Tt0gZy4kQj731avqyT7qrZTh0wL1DHKJs1fgucs0ArDEQZq7rCIeCx0KaDa0
	u6HLTIEfOQsFeWCMGnWDKUBRywLlqZkgB6uynC5sTkDLyit6JuSDoJgS8ddTVhMn1Co9Bj4BsU7
	N7UwpUn6jVwUn4E1ZwD38PbArmpPYq+Cp3JHZe0onf/fTXdBjnWOjqPhkXQhEAZTFS1rmnepyhq
	9dpYutKPEwXScdPgKBD0cWe2a0GBPfD0BwO5KsFgtwkJCFtUJYEoA3qdbeEvoS87FOmkFcXvaZm
	X
X-Google-Smtp-Source: AGHT+IE0imvyWtevoay+Nl/n+MDQ7Wc9dHAjRMpT6TT9WUssTSaTHXR2b/vx1TkCs65IxfQ/y6FOaA==
X-Received: by 2002:a05:600c:5250:b0:43c:f8fc:f69a with SMTP id 5b1f17b1804b1-43d437822abmr34547135e9.4.1742398237671;
        Wed, 19 Mar 2025 08:30:37 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([212.105.145.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43fdaca8sm22590635e9.28.2025.03.19.08.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 08:30:37 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 19 Mar 2025 15:30:23 +0000
Subject: [PATCH v2 6/7] scsi: ufs: exynos: Move phy calls to .exit()
 callback
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-exynos-ufs-stability-fixes-v2-6-96722cc2ba1b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2041;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=7s8ZG7rjsKFwjxleGe/WV0LjRuAvxIjVXT4DqwU66xo=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn2uMSf5uvm/FpEyh5swIHxpa/LmHezM6/OP2QY
 9MVZvxOExKJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ9rjEgAKCRDO6LjWAjRy
 usXDD/964vJN7mBdCt96LUDow36KDCH5cAm1CeGbPUFo3LIj1nznxlwic31P+sgdl6J5xOMvwII
 o0eYSKMGFDWNfQdX3FfNxw+PZVH1OA0egJvAGXyexEqQOYurjEDOIc8sRRrvIwEjKWh6MnR8E+n
 m/QjkL4SExk/7n4wBVcXoaXRTdru6lc5aPBhD+yMLnL458WalOljyLsQbiR2/GPFARN1aOQDStE
 pqxmX4ZZYgXEsbOAyLbJ8NVtW4Kg+rXLu/O0xyLiya/XuDVHxwHo2GsbdfEBO8JI8k45lOPNv6w
 L+CLx4JGdpyDyqHLQdkgIJ98a2+jlptKgutUToX8hJ+SsUVseDZ4YRZimfoS/OCXPesRhk+5RV3
 WBkh2zeaQAYssWGALYLYsloNK4aZVJLjOnw2KkT6X6Zc9BjY/hxcl91iaq0tkjMPnyCUHa6ZfpU
 hPtucZXsPnrYWGm0rTAWhFxV33fa5FAbwWyKBEnMtqwUzfheLVvYTSa5Cxxs3D8566pYJ8Ec/QC
 z4wTcwnW+EWOjF3B023GowJ5sPoTjN0Dlg7p9ogQsMsIr4hX49/QLEqyiDo10nb7sspJf+Az+Rh
 NuX49wWgzfYuvxpS6Z0VQmWrfWY98RRjqrtI9Ul3478tgvm5yJCJTKIEDIMxAOAw0RkeLgsobwK
 kXo7n/Z9gZNzzBg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

ufshcd_pltfrm_remove() calls ufshcd_remove(hba) which in turn calls
ufshcd_hba_exit().

By moving the phy_power_off() and phy_exit() calls to the newly created
.exit callback they get called by ufshcd_variant_hba_exit() before
ufshcd_hba_exit() turns off the regulators. This is also similar flow
to the ufs-qcom driver.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes since v1:
* Remove superfluous blank line (Bart)
---
 drivers/ufs/host/ufs-exynos.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index f6980f05bd5555b351070fe33d0afda469fe498c..81a1f04411c0426d6fae931e75db5f4c8693daca 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1523,6 +1523,14 @@ static int exynos_ufs_init(struct ufs_hba *hba)
 	return ret;
 }
 
+static void exynos_ufs_exit(struct ufs_hba *hba)
+{
+	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
+
+	phy_power_off(ufs->phy);
+	phy_exit(ufs->phy);
+}
+
 static int exynos_ufs_host_reset(struct ufs_hba *hba)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
@@ -1978,6 +1986,7 @@ static int gs101_ufs_pre_pwr_change(struct exynos_ufs *ufs,
 static const struct ufs_hba_variant_ops ufs_hba_exynos_ops = {
 	.name				= "exynos_ufs",
 	.init				= exynos_ufs_init,
+	.exit				= exynos_ufs_exit,
 	.hce_enable_notify		= exynos_ufs_hce_enable_notify,
 	.link_startup_notify		= exynos_ufs_link_startup_notify,
 	.pwr_change_notify		= exynos_ufs_pwr_change_notify,
@@ -2016,13 +2025,7 @@ static int exynos_ufs_probe(struct platform_device *pdev)
 
 static void exynos_ufs_remove(struct platform_device *pdev)
 {
-	struct ufs_hba *hba =  platform_get_drvdata(pdev);
-	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
-
 	ufshcd_pltfrm_remove(pdev);
-
-	phy_power_off(ufs->phy);
-	phy_exit(ufs->phy);
 }
 
 static struct exynos_ufs_uic_attr exynos7_uic_attr = {

-- 
2.49.0.rc1.451.g8f38331e32-goog


