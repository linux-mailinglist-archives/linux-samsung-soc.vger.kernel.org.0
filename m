Return-Path: <linux-samsung-soc+bounces-7799-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A456A79F6D
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  3 Apr 2025 11:03:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10C43175781
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  3 Apr 2025 09:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D34243369;
	Thu,  3 Apr 2025 08:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xnmhaCd9"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EF924C67F
	for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Apr 2025 08:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743670770; cv=none; b=FHVfpTbq1heTeI0bWIZr00v1hmJRbY6wpbDsB+OZNAoRtajqse02UJn0V0V0B8/cbQ01IgNCS7kSkAoi84pfFLbhYs5SlQYOWtP0iUcmHHEarnuwXZO/p5owlitmYu1GD4p927sF1+phrprNtBm9QcWI/GpnurlbvG9HOT0OwOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743670770; c=relaxed/simple;
	bh=oM7nIChVy6AnX102peSIS6No2vZfRMNewLZjt/WfrE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JG11l3IizozHoOysE8Bm2aCVIrWVjbLSHlFxUKHBgBrBcJb9rXGiPkyDmF9EyXna9mhfETxfQ/jXO71Ei4WFwDKCVJxTrbHn5E3K29GZ6y+Wtl0S8NvVFJp4txbNl21vFdzvzYkiB50rizO//QCcFdyFly/z5Z1Lxy90WWz87ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xnmhaCd9; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5c9662131so1125220a12.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Apr 2025 01:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743670758; x=1744275558; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31t2yEGURbHN+dYzF9A6q02DZ3VBH6YOfFo8ts0pTFs=;
        b=xnmhaCd9Zm5KVsU5ibOL1l6D3ybGyd/eToDjJmQT5PDvMGfSd++pD138Ee+e7c6AnE
         PrQO2B2imaSLq/6GihlyV6wQHVAHrH6pO7KtpEbpQ8ZYRP2wm6RtQ284Gc+91DR+hcvV
         CLhaEMocZTXuQeDi9dCAcBXJZHxlg+TRAfaotPV/Nj+Yh+3inN6eEgLoA98Sv/+Xzbal
         bVc0/DoClIL1mqzeOmFd0JFa2UjruYi1p7J6JvZ1G+27kCpVi89RAUkyeFumJtofu1FV
         +SQlFzBpWsj0q5C3n2rRHSNCquYbhdkDctbSt7fXnz5Trj3I0Q03JjTYTDSOjJpz6ktu
         qBaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743670758; x=1744275558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=31t2yEGURbHN+dYzF9A6q02DZ3VBH6YOfFo8ts0pTFs=;
        b=rtE5sPlcnJze09yk/J4u4cZubtcOW5k3I1ceg/Bonz9/9g3xXwXf6GbjkhoQTPUxa6
         +zZXTKPxhkirkxLsYCeaQcOlhVJmZlRN4HNnzwTW2yQG3D8m32vriHihBQwveSM+Mmdf
         XEKJL63ITILw6xI94XG7ENTh+jMIEQG+E8Ncr9S/hcqhTFltwqT3FZtovDSh3U3heypV
         E6eX6ugNXJgXbx5PeKDHax7cmUaZwtfC3bGpMsHg0vMFqh0QFy1fAbiuAk1T3L7/qYJI
         g4jxS2iw6gT3ytlkkAWNQmkaFdlHg5O+ZzK1QZ5e02vOEotDeehygiMM5eblQ33u6pg4
         wKrg==
X-Forwarded-Encrypted: i=1; AJvYcCVa+QL63mUAv+2leSJIfdqWqt0+prPo3N9IGqh789E3El2GueKMEKhNe/KWeNCi+8S2UIqJq1MaYlJoN3iS9B5WsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoqlrqVAcANSXWhhx2L9/IIjCKnBkcinPoWfxhJ1EfuX0bXVBa
	AhZkJsjsHdtxIfgrCNTxu34mbiZ9tAu3mGhtY1VIcEFalHV+5TJ/TOGYg/50kuk=
X-Gm-Gg: ASbGnctygcnL3vlNy/vkh5BueEJfJL9t33fgG4XMKmnkKbOLhn783ZAwBgN62xnxsZz
	U3jbQO5MaBZp30+HqgBNrDbdPnAYRjzKZPQVpKnPvW2ETZTE+QmYb33KeJE1G2SHDZs5vVsFAvL
	cIYjI+jj9d7tUO3VgCgKJbl8Gfm4L5W5CXhqfP82VnfSzP0zpb5o+OuYHrQJhtD+sbeYSlXrzwo
	8kMxsX4cMdcFd03P5ffSKh+JF4EtFMGtxebNwsNTjCElzisQMW7rDI4EiLhWdCeB3M+E6xW9s9a
	Q12k2hcKL3EgbBqtU1eI4wL7vEBkWUFttHuRXLXdBxNavBtxjBAAYtKhTO0qLBYfLoi6xWIOxYn
	gEmPpcRbtOcEmatTR4Nfi3H3aj6Mu
X-Google-Smtp-Source: AGHT+IFEc5fuLq8ADhguEhOTmTcH3HLdnlMJdU+ak+pq0TlS6iw1Do8PDAk7ua5/zSdVwdumNPkJLg==
X-Received: by 2002:a05:6402:40c6:b0:5ec:f769:db07 with SMTP id 4fb4d7f45d1cf-5edfde2199fmr15498579a12.29.1743670758300;
        Thu, 03 Apr 2025 01:59:18 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a535fsm637614a12.80.2025.04.03.01.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 01:59:17 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 03 Apr 2025 09:59:22 +0100
Subject: [PATCH v3 30/32] rtc: s5m: replace regmap_update_bits with
 regmap_clear/set_bits
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250403-s2mpg10-v3-30-b542b3505e68@linaro.org>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The regmap_clear_bits() and regmap_set_bits() helper macros state the
intention a bit more obviously.

Use those.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index e8e442c503064eb4e570af5bf7dcff6bfa7f4656..fb65a8e439d72d9070751c00f5826a403ac0b416 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -338,8 +338,8 @@ static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 
 	/* On S2MPS13 the AUDR is not auto-cleared */
 	if (info->device_type == S2MPS13X)
-		regmap_update_bits(info->regmap, info->regs->udr_update,
-				   S2MPS13_RTC_AUDR_MASK, 0);
+		regmap_clear_bits(info->regmap, info->regs->udr_update,
+				  S2MPS13_RTC_AUDR_MASK);
 
 	return ret;
 }
@@ -351,10 +351,8 @@ static int s5m_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	int ret;
 
 	if (info->regs->read_time_udr_mask) {
-		ret = regmap_update_bits(info->regmap,
-				info->regs->udr_update,
-				info->regs->read_time_udr_mask,
-				info->regs->read_time_udr_mask);
+		ret = regmap_set_bits(info->regmap, info->regs->udr_update,
+				      info->regs->read_time_udr_mask);
 		if (ret) {
 			dev_err(dev,
 				"Failed to prepare registers for time reading: %d\n",

-- 
2.49.0.472.ge94155a9ec-goog


