Return-Path: <linux-samsung-soc+bounces-5211-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD689B7D86
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 31 Oct 2024 16:01:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACCCA1C21804
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 31 Oct 2024 15:01:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 762AA1B07AE;
	Thu, 31 Oct 2024 15:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MAoPwGM6"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC861A3BDA
	for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2024 15:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730386845; cv=none; b=OB4gg7RZWbC8j5rTnotrpwKdZctaDC9mGclO8OUtwt2384SV7+gpuNnKWm91K8swjAtnnw3HiqHlsWjniw9Ky3wWepva5PHooFiHh0J/Y/2vp/J91BZHr6ojMs50Y3kWCMCHrr9vXKeYJakD4h2cjb0jnuRH8iAS4A1KEtTj9z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730386845; c=relaxed/simple;
	bh=pDiyAomO3/GYTe+FrPpcIqBq334elIL2TdUV+2JQNqo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZwYwjvReDGU0Qd15ekp490FZ7clUPNSZoNmreLNBFVF0MVfWfnI/qgmyaW9zK2LoDq9PWXuv6hbTABkwqNmLcQ0PeqRoQt2vKN2Zgz5kGftwd++lpikzR4j+TSXHTeOn+W74bPDBsawhCw78rG79pSWVtpOrJjjzSudU4PbqXHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MAoPwGM6; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d63a79bb6so714680f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2024 08:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386841; x=1730991641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2Vb0OX4E/WTGDIc/yOnji+pIDApby9HKvJHMTYprvI=;
        b=MAoPwGM67d3eTdS4i2uXNTIKbyUDmu/Au9Xr4mYJn8tFDMY2hcZWERva92+5mbywcE
         iFGj3Inv4sxk9doQMvx4slQ9DCMdq6a0AiMIAQqJnscDoei+/IIjTX05Z+DbXZQJk6jy
         EeNEmpd3GkJ5KM33XayCKJEODrYOSy1vWyvAVLAN9X+5VoJgOG+appz1WSV1BDGNnC70
         iINb8t/cTGdbbRYpkASHo/wEe3rnbFQUozs5lFESqfXoiSgdtPgDEWDwaGSK4MQlOCMe
         ADHO17MY3375MuCZmyr8/uD7ooch5Ei9BgqjBgBEanHBEapI/Be7gDP+WVjSVql8IX2e
         DqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386841; x=1730991641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y2Vb0OX4E/WTGDIc/yOnji+pIDApby9HKvJHMTYprvI=;
        b=juVgbXlkYQvjx2TYEt06VSOcIdhC8+WtVosC48C5bjmuBQGAtXL5NqVoayBp7clmDu
         QGkB90qRDpe96GUWep3rXF3/m6qfwbVDf6MQPkQ/TbUK6VlnB7zfU+n2PpuXNkHVOPin
         3EATXtfm3OvKBU7E6jIBIbNnjPTHOj8aCEpFao7brTOX1aIq0Q3+v5u6J1YTMJ96Gt4z
         0DYSUgqQ5xWst5YiH06GpSKhjtGeQGs7AS2hlnFA/04+2/FpZC8s5DTrMFDtpqjzjGYa
         KwiFatzhXcqsWy1f4qphFhNOF4fw0/9SUlFimv8CaKHZwYHE0lnNocuxWGtwMkXE18X2
         hnTA==
X-Forwarded-Encrypted: i=1; AJvYcCXpKtdHRKXQTWAHyOMmxJhqryPOVYU46M4v398zix91cgnGgSJUbBfZMVsJr50vOBffyY62rfAsZirLHCsiEQyGoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCAKfg+ocPd9RuOq0mS/O2+evy1jcs/l671AeT4homengzkBLo
	Mzrzh6oUey9L/cs7XozaQj1nUb7m1Hb12NSE/+HGXtPvLggvlEhY2WyeGbjsMrE=
X-Google-Smtp-Source: AGHT+IGXtCtOp+k+YpkFkrrnLo8FdCOGm8rJP9u1NXSvYnnTVw6wLqsMEn/qZwk48etVCRMN23bvZg==
X-Received: by 2002:a05:6000:1a85:b0:37d:4125:5cba with SMTP id ffacd0b85a97d-381be7d8c46mr2818779f8f.32.1730386840477;
        Thu, 31 Oct 2024 08:00:40 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:40 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
To: alim.akhtar@samsung.com,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	krzk@kernel.org
Cc: tudor.ambarus@linaro.org,
	ebiggers@kernel.org,
	andre.draszik@linaro.org,
	kernel-team@android.com,
	willmcvicker@google.com,
	linux-scsi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v3 03/14] scsi: ufs: exynos: Allow UFS Gear 4
Date: Thu, 31 Oct 2024 15:00:22 +0000
Message-ID: <20241031150033.3440894-4-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241031150033.3440894-1-peter.griffin@linaro.org>
References: <20241031150033.3440894-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

UFS Gear 4 offers faster speeds, and better power usage so lets
enable it.

Currently ufshcd_init_host_params() sets UFS_HS_G3 as a default,
so even if the device supports G4 we end up negotiating down to
G3.

For SoCs like gs101 which have a UFS major controller version
of 3 or above advertise Gear 4. This then allows a Gear 4 link
on Pixel 6.

For earlier controller versions keep the current default behaviour
of reporting G3.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v3: Added blank line and split hs_tx_gear/hs_rx_gear into separate lines (Tudor)
---
 drivers/ufs/host/ufs-exynos.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 7e381ab1011d..33de7ff747a2 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -766,6 +766,21 @@ static void exynos_ufs_config_sync_pattern_mask(struct exynos_ufs *ufs,
 	exynos_ufs_disable_ov_tm(hba);
 }
 
+#define UFS_HW_VER_MAJOR_MASK   GENMASK(15, 8)
+
+static u32 exynos_ufs_get_hs_gear(struct ufs_hba *hba)
+{
+	u8 major;
+
+	major = FIELD_GET(UFS_HW_VER_MAJOR_MASK, hba->ufs_version);
+
+	if (major >= 3)
+		return UFS_HS_G4;
+
+	/* Default is HS-G3 */
+	return UFS_HS_G3;
+}
+
 static int exynos_ufs_pre_pwr_mode(struct ufs_hba *hba,
 				struct ufs_pa_layer_attr *dev_max_params,
 				struct ufs_pa_layer_attr *dev_req_params)
@@ -783,6 +798,10 @@ static int exynos_ufs_pre_pwr_mode(struct ufs_hba *hba,
 
 	ufshcd_init_host_params(&host_params);
 
+	/* This driver only support symmetric gear setting e.g. hs_tx_gear == hs_rx_gear */
+	host_params.hs_tx_gear = exynos_ufs_get_hs_gear(hba);
+	host_params.hs_rx_gear = exynos_ufs_get_hs_gear(hba);
+
 	ret = ufshcd_negotiate_pwr_params(&host_params, dev_max_params, dev_req_params);
 	if (ret) {
 		pr_err("%s: failed to determine capabilities\n", __func__);
-- 
2.47.0.163.g1226f6d8fa-goog


