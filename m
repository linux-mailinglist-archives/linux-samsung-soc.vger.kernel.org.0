Return-Path: <linux-samsung-soc+bounces-804-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F36A81D8F5
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 24 Dec 2023 12:51:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8BBD1F21080
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 24 Dec 2023 11:51:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D56110948;
	Sun, 24 Dec 2023 11:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TL0VEmtJ"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFC7FC0A
	for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Dec 2023 11:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5537114380bso2524354a12.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Dec 2023 03:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703418570; x=1704023370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/UNgHZjW5MJWbUJfKL9ILAPKHDM87DLcYQJtFHdCq+c=;
        b=TL0VEmtJEetXuE3DFZRYNqR5MxBDNS+5EqDVYejyX5KVBAdpWLyxcfY5dlPuG/IcNB
         IchNHZ37be2QR9UjNGbIVpdt7dF67A1Tn7/I+huVZIk5cyFIfphLuLUnClFB7t8XCI50
         f47Lu+IQCMN+hF47z7rZEWD5OgGUadEeWRWSY89mvaStTePi0SFOnxBX3jOvKYZpwBpQ
         mG5hL2lclOMj3CVlYX1sN8CAogsHdcmasSaBFX1PX+DjyeCIfeNOAi+Hhw7EP3c1aKwl
         q0UPrD8gpW1wKIqxwzL0yWkbN695/i8/UXRXIvicXKaYgx57rHRrFMhhd3wCdHpU9mXg
         aASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703418570; x=1704023370;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/UNgHZjW5MJWbUJfKL9ILAPKHDM87DLcYQJtFHdCq+c=;
        b=kbiOS1Xu9PoMsCiWMBAAVL5xSE9JHPNddro3+rbsPHz+VGyxlGpi3cIV55Bx7Q9eeW
         0fH6o07znZiuq1aXqYNd7qN+1/IPPwH5NDjyWegcySRuj1XuxZz+87kZ0GA5zcvtYgM0
         7Vc7/16Muzl4iRFilYDa/bvcs1ZRop1K1261Nl8fxdTSAY3k9I9Xrch1VQORYjNyE7wZ
         yRVf82rG9VPD0bYZXkIGapg5IrIcvj5sPaKq3ERJdhlphR0V8uNDoI2cyqh9FRgPBzKW
         ZNjP2DMJDVwdDIcjSb+k4kszOV4YyLedLg90Me8cgMyxcnSQ585HmqDgLeoQna0jfY51
         w8Rw==
X-Gm-Message-State: AOJu0YzY4zdgsDl9hrNOJp6cK9kyzYaKAeZZfdxfQHUZAnBUd7HOT77T
	rQXpreH915FlXQG+CrDH+sZhi9RDYw3MUA==
X-Google-Smtp-Source: AGHT+IHLmNz0ufeZCyfQfeJmN2RbmCoqg4A6qexF52CsPVGwSCJcP3oK14zXISYHyy1twRPceNVroQ==
X-Received: by 2002:a05:6402:20e:b0:553:4eb4:c231 with SMTP id t14-20020a056402020e00b005534eb4c231mr2492744edv.28.1703418570223;
        Sun, 24 Dec 2023 03:49:30 -0800 (PST)
Received: from krzk-bin.. ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id z23-20020aa7c657000000b0054ccac03945sm4999771edr.12.2023.12.24.03.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 03:49:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/12] media: fimc-is: constify pointers to v4l2_pix_format_mplane
Date: Sun, 24 Dec 2023 12:49:13 +0100
Message-Id: <20231224114916.111433-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231224114916.111433-1-krzysztof.kozlowski@linaro.org>
References: <20231224114916.111433-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In few places functions do not modify pointed "struct
v4l2_pix_format_mplane", thus the pointer can point to const data for
additional safety and self-documenting intention of the function.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/media/platform/samsung/exynos4-is/fimc-capture.c   | 2 +-
 drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c | 2 +-
 drivers/media/platform/samsung/exynos4-is/fimc-m2m.c       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
index a3a677a3065f..7c2bcd5be933 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-capture.c
@@ -1010,7 +1010,7 @@ static int __fimc_capture_set_format(struct fimc_dev *fimc,
 {
 	struct fimc_vid_cap *vc = &fimc->vid_cap;
 	struct fimc_ctx *ctx = vc->ctx;
-	struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
+	const struct v4l2_pix_format_mplane *pix = &f->fmt.pix_mp;
 	struct fimc_frame *ff = &ctx->d_frame;
 	const struct fimc_fmt *inp_fmt = NULL;
 	int ret, i;
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c b/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c
index 8fa26969c411..06c4352562b3 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-isp-video.c
@@ -40,7 +40,7 @@ static int isp_video_capture_queue_setup(struct vb2_queue *vq,
 			unsigned int sizes[], struct device *alloc_devs[])
 {
 	struct fimc_isp *isp = vb2_get_drv_priv(vq);
-	struct v4l2_pix_format_mplane *vid_fmt = &isp->video_capture.pixfmt;
+	const struct v4l2_pix_format_mplane *vid_fmt = &isp->video_capture.pixfmt;
 	const struct fimc_fmt *fmt = isp->video_capture.format;
 	unsigned int wh, i;
 
diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c b/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
index e9023f64cfba..e5829a457f3d 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-m2m.c
@@ -316,7 +316,7 @@ static int fimc_m2m_try_fmt_mplane(struct file *file, void *fh,
 
 static void __set_frame_format(struct fimc_frame *frame,
 			       const struct fimc_fmt *fmt,
-			       struct v4l2_pix_format_mplane *pixm)
+			       const struct v4l2_pix_format_mplane *pixm)
 {
 	int i;
 
-- 
2.34.1


