Return-Path: <linux-samsung-soc+bounces-2471-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A7B892D07
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 30 Mar 2024 21:33:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A00031C2089C
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 30 Mar 2024 20:33:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A9034D5BF;
	Sat, 30 Mar 2024 20:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pj7/dySe"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612F847F5B
	for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Mar 2024 20:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711830806; cv=none; b=tloqoYD+e774ikfvBBaqRRnQs/aPtiapQmhIkjKuriNztTNV6raMoeXqvhbp/bZ2FJ/nvVqVwZ2be3NKvfF4Kff5sVPGK5gSk19lpTn2zAggJGCLZ1EI4OWfz2x2HeuHlRaHvrP+RLYYTghRNmf0HDhLYAesEyaXadJg3tsmbbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711830806; c=relaxed/simple;
	bh=u4iw+tXf5NJS/1BtLNSIfV6mW+a49y5mz2WIaW7YV50=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kQSd7kfoUgQMjQy/WZoUpjSQ1HYqzOiJcSZP2GvYSA0WkoovHvRezFINWtihlsoZV2HnQuvJAudtY/B2yTVdCFeSd86W7S9RQ0W8sWXVVC1OWu4tl5LJxar+z3714EYpxUZ9GUpGaUfKLzSu/CrdtdBiXA5T9VKxQfrhcktJltc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pj7/dySe; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-341ccef5058so2103523f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Sat, 30 Mar 2024 13:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711830803; x=1712435603; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OB+mZPgEXqLavq1JG1IoHeYm+GeMKprho4AeMvxB8yU=;
        b=pj7/dySe/AzzetTiVh2gazimvmQSSwqumqdJujiOofPsaYHbwFPv05kHmeNXQ1cMNA
         IH6oth5AKaz0FaIAVhDrKP+dWGfZNSX9g8YIYK5nBlr9Hh7jHYvXSfkhxnMCphFfhaZU
         1WO/snc58ytjjy2mE5cCxOdtVroPrbwMaaXYE6AObpVXEdVuYZ4LYqsnSV2UxQtnmz5I
         Wl8E6PkX5teC1XJOmc978K3wlk0TAjHNvSHrKRWk8geXN0nFkt/4Il+U1SDK0Y/Tl7mG
         rK3sEaAxTqa85bppSioazZs4jL0KJyQlyBDwT7oKH2jhV09VC0thWWuxyTezJnhBzdCU
         Hw2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711830803; x=1712435603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OB+mZPgEXqLavq1JG1IoHeYm+GeMKprho4AeMvxB8yU=;
        b=QG0hEpgyAs2FYpW0Bn4wnWjBzOlesTk29Soqw7Fko7Wr+AE+G2dHHGuLuWPxcB6bnY
         VQqe6tcPA0DSN6Mv+kLIHWtj/thsgeE05x8F/CXhcmHHj0BWspp0mRKucWi2QoQGCj2o
         ElNrVTJVYXulqrE9lNqlOy4Uj+MM5uOnSh+LeRN7A+gj9lv1N++9L3ZzYwxMEHgV/ltv
         gDD5ubZ6epp1vftmXsQEiWvM4zzbGu2JrxGpXdKRiBp7+xMlELeUE5dctReUaCle20zD
         McaBmGxQzcHnbxQegtxNH95AD5o1PORwtpVNCt0aYCYJ8jen9yHGGdWbZ97X/yG+MJBF
         XUnA==
X-Forwarded-Encrypted: i=1; AJvYcCVUnFocDJbS//pFr1e0+xRUmP4pCBY+wKUfvS93BX1vSHcZ9t582wRnZWRxaMI27adLO/QD3cPG+2yACjKoMJbgMgj+ukesjD9mNtqyFgHH3XQ=
X-Gm-Message-State: AOJu0Yw5+CQrcD5hRsfq677fXuaLkLh8WfyQg8k4Qk55gHwhYqnOq2/D
	1AhL4JYppbI4DDZyIbCgJSJokuP228wxbzMFonEvzsSlQRTwLyAJr3EiJh9uXyU=
X-Google-Smtp-Source: AGHT+IEDpegVoUKkaUUQrTQUvyjhtCNbHQ+2hYwRm+4WVlURQe9DBtLxRYGOSBLUUid7iPnBug5tuQ==
X-Received: by 2002:a5d:590e:0:b0:33e:dd4:ca5c with SMTP id v14-20020a5d590e000000b0033e0dd4ca5cmr3926086wrd.45.1711830802860;
        Sat, 30 Mar 2024 13:33:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id f14-20020adfc98e000000b0033b48190e5esm7209315wrh.67.2024.03.30.13.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Mar 2024 13:33:22 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:33:06 +0100
Subject: [PATCH 02/11] drm/exynos: fimd: drop driver owner initialization
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-exynos-v1-2-3fa30e2c7e5a@linaro.org>
References: <20240330-b4-module-owner-drm-exynos-v1-0-3fa30e2c7e5a@linaro.org>
In-Reply-To: <20240330-b4-module-owner-drm-exynos-v1-0-3fa30e2c7e5a@linaro.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=849;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=u4iw+tXf5NJS/1BtLNSIfV6mW+a49y5mz2WIaW7YV50=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHcFZKqSKNTGk39UoWnSoKLPHD7OASNRcGAlP
 Qu1wkB8jqeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh3BQAKCRDBN2bmhouD
 16v3D/4sGgIwlyPOlxLxPdzgi6X5NUzD2At20YM0rC7vZgynK+D1tIt+4o/3vMMuY02yX3lkmOD
 tGZz+BsUla/KYDkk7wHvoDm/L5p0LKM+oMy5813CBjk9HYDLmTExh8mUDn+Q4da49KoqLOGTnJW
 baOyetFOh62lmUgS5QXNDmzrKcgwbgQKmYADSCfazpkUU4rgpYtUUDkDTki0PHVdK1ivQUaHodK
 rhPWh62Gya3orWcQEj/0GZRA7Gr6+u0aNxhm8QRR6p1+sqOcVEa3PqwPi6alY8bPn2kBp1hcELr
 2eTKFPoX2xrgscvVbB5SlmO9uiOvAXu4SPmJZA+mpAXDMvOQ+ptIsxxmW21auu0FxnJs+luO+GW
 S1EH26vybJdMsb8Oi60ya2q/LxphjEyB5DPdzE/eJWIE+cJ2MBA+pcT7a9lGlwH6yCOMP89Bs9N
 wLr4ac9DUl2ESjf0TH63DrwAW0LEEoHX5xVcOE7fKFoDhYyeSu/kSaBsv2+k6tj6jVzwp0Q/d5/
 X4mSAQ9zt6v6TBqJ1+8IONpejRsZqPAyg1T/NSpQIApr1KPeM4yezAoied5+KBe50DtEDrnwkst
 Ljg23vH1f5TpUKVqTtSQrJutqrC5TLGIC9n6Sdzdn1yry7N9Ent1h7f4c+3MHbQ2pk3ZkKvD/Wd
 SJVJFC1uvzHHpkQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index f2145227a1e0..f57df8c48139 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -1326,7 +1326,6 @@ struct platform_driver fimd_driver = {
 	.remove_new	= fimd_remove,
 	.driver		= {
 		.name	= "exynos4-fb",
-		.owner	= THIS_MODULE,
 		.pm	= pm_ptr(&exynos_fimd_pm_ops),
 		.of_match_table = fimd_driver_dt_match,
 	},

-- 
2.34.1


