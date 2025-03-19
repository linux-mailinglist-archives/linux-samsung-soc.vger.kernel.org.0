Return-Path: <linux-samsung-soc+bounces-7510-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 690E2A69383
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 19 Mar 2025 16:34:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8744172919
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 19 Mar 2025 15:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3E1E1D89E9;
	Wed, 19 Mar 2025 15:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b9hbaBie"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB551D47C3
	for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Mar 2025 15:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742398234; cv=none; b=oO7HworO9Hcc9GjV/6u3gYd4xvdpbIdFFjMHJUAkDWLzrUAH8UtmFE/dfPb3FOmL1uCfctkhhTFHM6cx9Q13JOaedz/3lB3SrD6TfAXsPsu7tJizJ1eqX8GrhEB4dbsvWhFZ6JJVyjaySzKQb2wJEYMGwLUX+SvCKRRYwxomN8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742398234; c=relaxed/simple;
	bh=03nXe96Gz68DXY2H0Ujds8952wDZmWtW9nwe7BZ34Ws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PuTu/PGGAvzlN9YqdqKf9VpiEVNhSKO6gbEbLXQJZNiNMXNubI3Uax/1AcV3x63XB6fm+q+NNgtCrrMKQzu81tWm8/0T0SqJ6AdjOAokKDKOuxUccQvnvHI49IcEW1nFdW0SRperM3XbggiF7M4QQ3UYi9tV18Z93f9MtH70UuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b9hbaBie; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so6249375e9.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 19 Mar 2025 08:30:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742398230; x=1743003030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwjbmevRcW4yMfkA4dX1AKUxaSG8vNc+QBgPKteOh5Q=;
        b=b9hbaBieY6xkd24eowA06DhvK10O67DQdqezVgbHDd+/Kj1B5+9tBgw9jK5mN179F9
         kx7MLSV0TS87JFRaaNAWdBEn9DxzjB5rrMMplxKKCTX7F7f6Uh6kd/ky1Iwr+5KTwspo
         jBmjuFm48pYN7xfgaz5e6+emtoVepUWesYYrFKtSQwVTI7blnXQ1xHpEtxja8sHOajNg
         eogcGTgkNeUX00hyf6X10yF6Qxj8NBosoHTZ1fuEnd+LRI8tVuKD7zh3vf7S6DAe1kyc
         9w2+2wSYHiseokhx36iiCmicFKjshzGkRVJeSm8M0cWNgax45YqBjZ1M0Detes+SEhD2
         tg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742398230; x=1743003030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwjbmevRcW4yMfkA4dX1AKUxaSG8vNc+QBgPKteOh5Q=;
        b=qd8u6u1yiDoND2Ct5ppPsU4sthPduSwFP9svbrxR7dx112WJsiUVyCje0uHlnOmoat
         N6BEksWAB7K11lwUqlcOgNU+cvJR70/fyJIB/2rcDX3KoRN3eKN4MeYiC/HMGqgeDpTX
         CkwBbudvA+UdwTarH2i7A3yG66V2C4ycPYAQKb0wR1y0aJN24Nb9zHvlsPXWlILtkZMF
         L8yEmJEQ+Rqbi59BwNTPJgu2F5oh31i5ID2Nv0IXQKVzi5AqzlgxCws89xsXPlgCUa/5
         q9wye5+VfZrbvaBCif7AjlsiIv5yeBujT0kr8PlY+/OVA5pps0kpyAF2LIetPO9h+QVA
         g3vA==
X-Forwarded-Encrypted: i=1; AJvYcCWaNUWUo0x4qTI3KZIKUnYbRL4+oNbziaY3chceSBv9e1hH+kHDk4qCjMnCGSRhv47y7t9vNpSRnDRQ4o+aJvmkPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAiYWOqY/XVQ6UEGDGJwRqGNMiPGOybkUkUeBnZOySDcMXNKoH
	yHfc1GzBowt/EzppN0mEszfsDHqhF2q7dkjv/eVlnVboE7s+XmImCw3BdtMlqmI=
X-Gm-Gg: ASbGncudpx5Sb9c4HqxKOrjKqv0IC8hTGbsiTAS2t5zDHffOsPybLAKyEBieMxRAalt
	/ShLo9ww3p4cdzAqyjGbHS32iUDnlpcMzC/Zb21vR+PVzbLg95MLX8iWM+TN0zgrxbdv/KsxEwZ
	vPYdNl665Lqx5qhrmHiQkVk9M9rPBrR0DpaVzwHDHasPYkSplm9JzH1B+2DMTqRFrfm2tzIaf28
	6YrpyMFe1pNi7IJAH7UHamh1IN+HgjtJszdp22nNl7o9Ebp290yaexkRG0+R6Oq4evKy7QDGUng
	rupF93gnJatrz7QCYDw0M9E7V62fLlv1i7IP2ctiKlnCwX2Ivmm9BJWiJ4JEJKcG896HHLuXYi+
	tlVPymm54qtM=
X-Google-Smtp-Source: AGHT+IGMbhvAoKZ5MZTSGuKQwWBy+XHvI6tDwhUHbcw9eJrBgGY8SFOMgUHG77gsUcqyh9kE5lpXWA==
X-Received: by 2002:a05:600c:5856:b0:43b:bfa7:c7d with SMTP id 5b1f17b1804b1-43d3b95f76fmr61386045e9.2.1742398229831;
        Wed, 19 Mar 2025 08:30:29 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([212.105.145.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43fdaca8sm22590635e9.28.2025.03.19.08.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 08:30:29 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 19 Mar 2025 15:30:18 +0000
Subject: [PATCH v2 1/7] scsi: ufs: exynos: ensure pre_link() executes
 before exynos_ufs_phy_init()
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250319-exynos-ufs-stability-fixes-v2-1-96722cc2ba1b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1417;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=03nXe96Gz68DXY2H0Ujds8952wDZmWtW9nwe7BZ34Ws=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBn2uMQZlA3NYaC9iaL3h/pGHUSlEutMRvCD5thM
 9WKscPfzzGJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCZ9rjEAAKCRDO6LjWAjRy
 ugjPD/97aGZqjPkj2/fwPbyQRgsv1vpdcmhpXOfwtWmb1QyfOW6/ACBPRX1BjM4Fb32yZ7mz8hW
 qS5ca003v2iZhlO/pxyOsaJswTIzUNpY+/X51cAEjIOA3eizjndOKzl5Sa/+pmuXvoW0MU2D64Z
 0fDE2rkK6C63xBtMv9vSyeGWP0xMGtjrXH28QjH7O7OUgpBpAlQIlDY2W+3ywbWDpvBLPObLiki
 f4RVMFgRf1mT43lig0UDqf4IKyDyAQClKCXMF7Ml7QKnYjorn0i5eFd/MjJGhXkOyxRcsBqsw8v
 UlR92f8uBwlQDtgiV2odpELxZUNQyspLFbzlzx1nXCS3J7tBuwmnyfipWMKB5d1UwL4Ccaj4yMa
 PsVfbR33+4w6vVl0q/0GCouG4KaeM9Ps6fgUpUh5t/C0RHhKTDQeru7yf2LKcTLOoy1L2mrvsLA
 XKBSjaQkfMctqQlBP6o8k9iViVBtn0ulX9Ug4dGcjyXzpOZl2QAuIAKvLFTK55Vem54BuYf+mL0
 1O00+Y3F/x6U3qLelrsYoQtxfVD/X7Tmh4nxSPO5iMorpfIwCHe+aIrkjFL/VJWRDvzZP8nmkjv
 fgC4v4xpypP3/70b6R/Pii7WMujV8WGTIpmoTrbE9XvBnkcEwQdB3o0Iu8VZouSWkgm2P5J/9cl
 LX5cV3J9ueEAxVw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

Ensure clocks are enabled before configuring unipro. Additionally move the
pre_link() hook before the exynos_ufs_phy_init() calls. This means the
register write sequence  more closely resembles the ordering of the
downstream driver.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index d7539cda97da5023ec8a2852ff3f5191642ffd37..0c8c2e41e851cdbefc80a66d87273b7e8fcf9d4d 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -1049,9 +1049,14 @@ static int exynos_ufs_pre_link(struct ufs_hba *hba)
 	exynos_ufs_config_intr(ufs, DFES_DEF_L4_ERRS, UNIPRO_L4);
 	exynos_ufs_set_unipro_pclk_div(ufs);
 
+	exynos_ufs_setup_clocks(hba, true, PRE_CHANGE);
+
 	/* unipro */
 	exynos_ufs_config_unipro(ufs);
 
+	if (ufs->drv_data->pre_link)
+		ufs->drv_data->pre_link(ufs);
+
 	/* m-phy */
 	exynos_ufs_phy_init(ufs);
 	if (!(ufs->opts & EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR)) {
@@ -1059,11 +1064,6 @@ static int exynos_ufs_pre_link(struct ufs_hba *hba)
 		exynos_ufs_config_phy_cap_attr(ufs);
 	}
 
-	exynos_ufs_setup_clocks(hba, true, PRE_CHANGE);
-
-	if (ufs->drv_data->pre_link)
-		ufs->drv_data->pre_link(ufs);
-
 	return 0;
 }
 

-- 
2.49.0.rc1.451.g8f38331e32-goog


