Return-Path: <linux-samsung-soc+bounces-5208-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7478E9B7D7C
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 31 Oct 2024 16:00:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2ABAC281A48
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 31 Oct 2024 15:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62BA01A0BFF;
	Thu, 31 Oct 2024 15:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QnzReAcv"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E193C196C6C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2024 15:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730386841; cv=none; b=FBeBFfJVZoFkmBa4LS53SrzSEyCld/KdW7ucr9M68zxEAxXB3OrfyW5uULHr5Yh5GcxiVHQUNDa778N/H6j9o0unTkCiy00decmrn6Lak+HEqj+72fPag63jtMw3PeElbgXSOFH6cqwEFYnyoQeZkHuP6QPmoYx06qFn6cEcw1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730386841; c=relaxed/simple;
	bh=R14f0vSyUxSrXBZKBLtQzco/Z6fxcSPip85uSlqjDW8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PAofb8NKNOUmDmqsw0x69uZh6rpUslklCgz952qpxLTvxutHoKgyVeGeQcKtMt5M5uNbT22BqQeHandebz7HiUoVlu9oQJYNatcYfBVY1yyqXyz9MIF5vT7mQiPNOUQkt3LSOmjjYvFtsJpx+TB2L4ZDtvrxcIlJZa6Ys8s6wsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QnzReAcv; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43155abaf0bso8688895e9.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 31 Oct 2024 08:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730386837; x=1730991637; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iCEaeDborMpChWpG+09oPpilTDmpwNme21uFJErGw+s=;
        b=QnzReAcvLo+bqJUydzUTVM4Udr5mznlj3Rb2rZP+R3qMRPzYpgdfOuPqN/czBXzT9Y
         1+X5hnR2Pn4h99xCLqrJyknMUNuDoudE9yPlGQiKGmylRaHorqhTgwR9Ec9QDPFOf5lL
         SwKbtmKnoVxtD1YAOQA/BfW8G8biar+92CyuRt8f7DDg3+NsJ5UgAXTqQBXp+ve2pKMc
         yxcDXhe9czFTllOFwayOyaOcljQv04atlA7Cg0BtdvRVJ4viIjSMVvTfo2ttCEdffHF+
         fGL/1VVJMCMPk+FqrYgvBXGRyqugDVnXx/saJGDaN7h6fG3IR7HUbZr1oNzZ+1V11r3k
         RWJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730386837; x=1730991637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iCEaeDborMpChWpG+09oPpilTDmpwNme21uFJErGw+s=;
        b=awiVQ08yyahjevNulL9qXpZx/n4yv651z1p6L6nif5HPz5yDoypAjebyorU5lipOW5
         H9gYCVeAn3FyjoiOLJk0vm2jROdbNpmyRp53nxHMdWxEYlBCkhqYcVff7rsQsz7qYaYP
         6MTbBnb9X0lUf6Nxy9V1ZQrLymBv1Yw64dhWLGwwqOGAsqxdUvYpFdacY/HXiWeCrPqG
         TmirkEnKu9a4apaXkkN9BDFVnsXfMgLqimr/gqgSt3CzIQnxexHJbMag6sfmvoqrvv/Z
         Jx7VYVGfRMUs0TI+K/1EU5ZrSWPTJjGIzZaGjJWmuZuknnCp5OXFl6VpKJIRX5JCW2fe
         mWtw==
X-Forwarded-Encrypted: i=1; AJvYcCWB0nHVZDyjLIEb8KCWfKKmR7LE/nmMBFJsNS44yXDyI6HYgkP8QCA+hNpkUv1i5JdAhSfnprLz5S2Q+cnozhPL+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzc5UwmlyadwRKNl5xvyOeJGECFTu4ICh0YFtCNEicy1JkMUvZo
	+evbIX/FfmooAMNavOZluTEygW7dZBYZK0bc91srfXm+nX0ET3H8tzQrS5vGo5g=
X-Google-Smtp-Source: AGHT+IH+HfNSNGik5mKCBBG/5S6M1R2AxyBfXCc47oa7MI7ol35//vP5TNbBTsLrmHg9i1EHWx9Okw==
X-Received: by 2002:a05:600c:4f14:b0:42b:a7c7:5667 with SMTP id 5b1f17b1804b1-4328327ec52mr1208565e9.25.1730386836669;
        Thu, 31 Oct 2024 08:00:36 -0700 (PDT)
Received: from gpeter-l.lan ([145.224.65.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd8e8524sm59163225e9.5.2024.10.31.08.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 08:00:36 -0700 (PDT)
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
Subject: [PATCH v3 00/14] UFS cleanups and enhancements to ufs-exynos for gs101
Date: Thu, 31 Oct 2024 15:00:19 +0000
Message-ID: <20241031150033.3440894-1-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This series provides a few cleanups, bug fixes and feature enhancements for
the ufs-exynos driver, particularly for gs101 SoC.

Regarding cleanup we remove some unused phy attribute data that isn't
required when EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR is not set.

Regarding bug fixes the check for EXYNOS_UFS_OPT_UFSPR_SECURE is moved
inside exynos_ufs_config_smu() which fixes a Serror in the resume path
for gs101.

Regarding feature enhancements:
* Gear 4 is enabled which has higher speeds and better power management.
* WriteBooster capability is enabled for gs101 which increases write
  performance.
* Clock gating and hibern8 capabilities are enabled for gs101. This leads
  to a significantly cooler phone when running the upstream kernel on
  Pixel 6. Approximately 10 degrees cooler after 20 minutes at a shell
  prompt.
* AXI bus on gs101 is correctly configured for write line unique transactions
* ACG is set to be controlled by UFS_ACG_DISABLE for gs101

Additionally in v3 I've added 2 minor cleanup patches from Tudor and also
an update to MAINTAINERS to add myself as a reviewer and the linux-samsung-soc
list.

Note: In v1 I mentioned the phy hibern8 series in [1] that is still under
discussion however further testing reveals hibern8 feature still works without
the additional UFS phy register writes done in [1]. So this series can be merged
as is and has no runtime dependencies on [1] to be functional.

[1] https://lore.kernel.org/linux-arm-kernel/20241002201555.3332138-3-peter.griffin@linaro.org/T/

regards,

Peter

Changes since v1:
 - Remove superfluous struct device parameter to exynos_ufs_shareability() (Peter)
 - Add patches 8-11 (hibern8 fixes, WLU support etc)

Changes since v2:
 - Add 2 cleanup patches from Tudor to the series and rebase (Tudor)
 - Fixup various commit messages as per Tudors review feedback (Tudor)
 - Collect up reviewed-by tags, and CC stable where appropriate (Peter)
 - Add myself as a reviewer in MAINTAINERS for ufs-exynos driver
   and add linux-samsung-soc list. (Peter)
 - Added blank line and split hs_tx_gear/hs_rx_gear into separate lines (Tudor)

Peter Griffin (12):
  scsi: ufs: exynos: Allow UFS Gear 4
  scsi: ufs: exynos: add check inside exynos_ufs_config_smu()
  scsi: ufs: exynos: gs101: remove EXYNOS_UFS_OPT_BROKEN_AUTO_CLK_CTRL
  scsi: ufs: exynos: Add EXYNOS_UFS_OPT_SKIP_CONFIG_PHY_ATTR check
  scsi: ufs: exynos: gs101: remove unused phy attribute fields
  scsi: ufs: exynos: remove tx_dif_p_nsec from exynosauto_ufs_drv_init()
  scsi: ufs: exynos: add gs101_ufs_drv_init() hook and enable
    WriteBooster
  scsi: ufs: exynos: enable write line unique transactions on gs101
  scsi: ufs: exynos: set ACG to be controlled by UFS_ACG_DISABLE
  scsi: ufs: exynos: fix hibern8 notify callbacks
  scsi: ufs: exynos: gs101: enable clock gating with hibern8
  MAINTAINERS: Update UFS Exynos entry

Tudor Ambarus (2):
  scsi: ufs: exynos: remove empty drv_init method
  scsi: ufs: exynos: remove superfluous function parameter

 MAINTAINERS                   |   2 +
 drivers/ufs/host/ufs-exynos.c | 136 ++++++++++++++++++----------------
 drivers/ufs/host/ufs-exynos.h |   2 +-
 3 files changed, 76 insertions(+), 64 deletions(-)

-- 
2.47.0.163.g1226f6d8fa-goog


