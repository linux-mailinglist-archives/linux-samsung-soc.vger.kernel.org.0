Return-Path: <linux-samsung-soc+bounces-5221-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0989B7DAA
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 31 Oct 2024 16:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCEC51C2180D
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 31 Oct 2024 15:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74EAD1CB33D;
	Thu, 31 Oct 2024 15:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GajoBQrn"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245BB1C9EC7
	for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2024 15:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730386860; cv=none; b=Kh+T0c1Y137PMrnTi0F9Ha74zM8t6gj5Qnu2AQ25Ca435OikKSdxT7+qgHgqLkCvPuwabtevAgW4lEk0qdtGEoUAQyARv3XqxE7VBiZ0v0lWAsMTtNKL8bd9UqYBpxEl1Bvgc6yijGv4XvCTMAFYo9pivsiPdpau6Squ2u9taw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730386860; c=relaxed/simple;
	bh=5/Nc/N5JqCK0IK8C8Y5crHGB82OXAuUKbGNn5MsIM4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lftvIgCDSpUArzN4WEQK5TXHs+VAggRJFz61vECLO0Vbm2L/Xduq1WTO5ZhUUwLsFZkj2eQQOj5b/ybJC7Savml6PofLOgDnlvh66wEKO/X4c4LYnvzOaV3wYHdVb/1HauOgnLJ7WS3MmorIjT80Bn716Bgnfp8rb0s1Z7np5r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GajoBQrn; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4315e62afe0so9074475e9.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2024 08:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386856; x=1730991656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNj/fO2D5WmaTEfTa8PNOYPo7uMWdpoJlT4sv1Vsh0M=;
        b=GajoBQrnTQe4R+6dOMSeEm0cXMpCBQyXb95FTxmQ0jokUoC/LC2I1mcWoroaVjVTXd
         0c/ShK7JxzjTRMR0yAG6KKUL3r/5Pw9wNlTqEV5aH1ZGYlCL4dxIb2miNls/75ZJcTlK
         IMkk5ibn3t429z8VgYS7g8LhSTBffeVpmibdJr/bXmfnc1wuGooe1Qs4rFiHVYB2IpAv
         pe0XYxFm3b6S6OC5ejC/Si70M65E7M6zD1EB1Mrfmq7POFJ2hr58DU+qTXFtUWy9h/0d
         mRqt49KVyUwHd5yz73jX+OgwEJd+Dm2SP3xgZgWRGYSMUn22wtwG9plNcmq/xkq38G5O
         r52A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386856; x=1730991656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNj/fO2D5WmaTEfTa8PNOYPo7uMWdpoJlT4sv1Vsh0M=;
        b=IcVOZ9zUFPVC4sMsRE93qz4Cygh4CefJn1f79rSvyAqtuDW9My2QhEdfD9Z6rGtB5f
         bih/WocNRk+k5eBi1EaQQd0nTtqD04TcTgk0COgniM3n+m5ABKIAYZsnVZIYuqltVkQ7
         YcYNx+ZvlSTHUbTqdgZbm4lToxj2D0fa3nvPwhtJufn1hrbztMnNtOVUqdQYoV4efgF4
         +EUGn7Y00jeVSVaZW14Ya7WM+OU0j4EncsC7kVKeVoX1CiM4tD/kxuiPvFz4TjftndY1
         L0ZJR4q7fi6nWjPz0lsF13jqT2uPmssdkBOkHED37Q5Jc3izMSJnyRFZ3c/Tzbu3Waai
         wGAw==
X-Forwarded-Encrypted: i=1; AJvYcCV9G+tHUWIgp4p7+XeJEadrMRomG/+WicPeV8c5PLEvVhucZ1BBdy6K9UkRtqZ0pux7aNLptfSPsBFO0Mw/Z2Xa9w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFaz92LmPzSHu1FtsYiYh83Pb4QhDp/QcdX2YhtPuUEIz8V5D1
	3SBJfVfmb8SXmOlu0L0HCVwSD1+W92PIRT88Vgwy3JEmfdYKFX13QoGoRlRpW7I=
X-Google-Smtp-Source: AGHT+IFk2eCgQm8YNMTKlqq1iucR50hnkbAH1iMz8u+bWLPGYs3QFvnZ+3u+58W5gWdqPaK2uS9iZg==
X-Received: by 2002:a05:600c:4e46:b0:430:52ec:1e2b with SMTP id 5b1f17b1804b1-4319ad2b89emr185435505e9.29.1730386854912;
        Thu, 31 Oct 2024 08:00:54 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:53 -0700 (PDT)
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
Subject: [PATCH v3 13/14] scsi: ufs: exynos: gs101: enable clock gating with hibern8
Date: Thu, 31 Oct 2024 15:00:32 +0000
Message-ID: <20241031150033.3440894-14-peter.griffin@linaro.org>
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

Enable clock gating and hibern8 capabilities for gs101. This
leads to a significantly cooler phone when running the upstream
kernel.

The exynos_ufs_post_hibern8() hook is also updated to remove the
UIC_CMD_DME_HIBER_EXIT code path as this causes a hang on gs101.

The code path is removed rather than re-factored as no other SoC
in ufs-exynos driver sets UFSHCD_CAP_HIBERN8_WITH_CLK_GATING
capability. Additionally until the previous commit the hibern8
callbacks were broken anyway as they expected a bool.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/ufs/host/ufs-exynos.c | 24 ++++--------------------
 1 file changed, 4 insertions(+), 20 deletions(-)

diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
index 9b6c4cfd7665..91827b3e582b 100644
--- a/drivers/ufs/host/ufs-exynos.c
+++ b/drivers/ufs/host/ufs-exynos.c
@@ -224,6 +224,9 @@ static int gs101_ufs_drv_init(struct exynos_ufs *ufs)
 	/* Enable WriteBooster */
 	hba->caps |= UFSHCD_CAP_WB_EN;
 
+	/* Enable clock gating and hibern8 */
+	hba->caps |= UFSHCD_CAP_CLK_GATING | UFSHCD_CAP_HIBERN8_WITH_CLK_GATING;
+
 	/* set ACG to be controlled by UFS_ACG_DISABLE */
 	reg = hci_readl(ufs, HCI_IOP_ACG_DISABLE);
 	hci_writel(ufs, reg & (~HCI_IOP_ACG_DISABLE_EN), HCI_IOP_ACG_DISABLE);
@@ -1563,26 +1566,7 @@ static void exynos_ufs_post_hibern8(struct ufs_hba *hba, enum uic_cmd_dme cmd)
 {
 	struct exynos_ufs *ufs = ufshcd_get_variant(hba);
 
-	if (cmd == UIC_CMD_DME_HIBER_EXIT) {
-		u32 cur_mode = 0;
-		u32 pwrmode;
-
-		if (ufshcd_is_hs_mode(&ufs->dev_req_params))
-			pwrmode = FAST_MODE;
-		else
-			pwrmode = SLOW_MODE;
-
-		ufshcd_dme_get(hba, UIC_ARG_MIB(PA_PWRMODE), &cur_mode);
-		if (cur_mode != (pwrmode << 4 | pwrmode)) {
-			dev_warn(hba->dev, "%s: power mode change\n", __func__);
-			hba->pwr_info.pwr_rx = (cur_mode >> 4) & 0xf;
-			hba->pwr_info.pwr_tx = cur_mode & 0xf;
-			ufshcd_config_pwr_mode(hba, &hba->max_pwr_info.info);
-		}
-
-		if (!(ufs->opts & EXYNOS_UFS_OPT_SKIP_CONNECTION_ESTAB))
-			exynos_ufs_establish_connt(ufs);
-	} else if (cmd == UIC_CMD_DME_HIBER_ENTER) {
+	if (cmd == UIC_CMD_DME_HIBER_ENTER) {
 		ufs->entry_hibern8_t = ktime_get();
 		exynos_ufs_gate_clks(ufs);
 		if (ufs->opts & EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL)
-- 
2.47.0.163.g1226f6d8fa-goog


