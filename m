Return-Path: <linux-samsung-soc+bounces-1422-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E60D83E882
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 27 Jan 2024 01:37:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3FD06B217D6
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 27 Jan 2024 00:37:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC75186E;
	Sat, 27 Jan 2024 00:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VRplKrZJ"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2717E2
	for <linux-samsung-soc@vger.kernel.org>; Sat, 27 Jan 2024 00:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706315828; cv=none; b=ti7QZsIBtLBGYhjn0Q56ycgvFBr+xaGGYantcile93tMhfnAEAIyeNfIj6f5EejuwG+OQV2mlN/XygcSBPcR1g1RV8CUwO8yqEwm/DQrJ0AL24jMZ8/ZUGAVwnog0TuKR80tpYxIX67jtNrPYXba9bCkVp9mQlulN3K6fJbRzDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706315828; c=relaxed/simple;
	bh=7mFQ2Sp6CaIqeHrP9eaRjtzUktjvoRpJ+ySFpau5l0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z9VLCo6yiWJeGGcN8U/iGkshetprwl0oSmgQNzjAyAMpJDfvqL2VWuyI1TcHVdQcaXBe9RVJdsAtQ/pfGoT4CpxH7wyaxi92uOPDFT/VJcaQSgBO1gKNs7LY1/W9n6Zw/l+P8v80JiwkB25/YZ6Ydky21Hpe4AbNrTDGFGQ3A/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VRplKrZJ; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a3510d79ae9so66414966b.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Jan 2024 16:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706315825; x=1706920625; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OEuX2u9xZxa9H/kOkuaGTOBQEZ702dhTtekxS4cUQE8=;
        b=VRplKrZJq0cM0MCL0HIS4UWF86Mblj5yWm6ffubLbM8PM5IZNAg54zpJjENdHr1MRK
         +D0aPKQop+aFzSq1aDbV1lRnCPIlffDawSS6mPwBM3oe+rJrsFSR4thZcfcjgsjTpajU
         VDZU14NxrOxSKMWT/3qzP12SHyZRs/lt6Ye64EPD5kTnYj/4kjRqEbuR+mr32sWJpkdG
         YhdJJyJnP7VyyP6mZj3ocAudSEzJcM3yWzZHsGGl9Wn1KUM/uamsFBO1GRRUDv41RASk
         IQBwdiKDuUpqZDZqLEN3dnMHzLZw9ZC58kxvLcaXtyjxCp+PWjlUPiSdJOyffyoavmow
         yDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706315825; x=1706920625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OEuX2u9xZxa9H/kOkuaGTOBQEZ702dhTtekxS4cUQE8=;
        b=ZiXRt8eGYU1F29kB6FDaAD0Gue/VqvuPxE0m/khAw28XRDYbJ87NeqNxVzyPmkm98R
         uy6cqsof36dpGthIk3/QMfDzJ+nWDYKpt7bFlqmrDxXv7fdcQUq38ANpJ9K4+8Lt0zkq
         iCKAf/MxdMszHAgMKy+4dd1Z6QUPbg+Z8EekTGMIZ0hMvlwyiNxfr8YfPYzvHFMJmiHr
         RnsBQF0UNnhAfAtG6L6jy8ooaAyaiaDkfuzv2XPv1aprhJw9daIAFq5YQDYyqNmrgRe2
         t7mRzBalBlcL3SfBlme2ZUBaBxNO9rRpm4eebIKFKg4eHFqghtOwLpui37t2RlQ5cKpG
         Ucgw==
X-Gm-Message-State: AOJu0YwAasJbSssHx3Uxy1UX0DFWhOZN4qnftKVi4OtxpbN/dUUXuKpu
	QCGQc4hpugN7KuJDcGy3ptxxY4sTBd6olFeZzFldqaFIWCUSX1XB20HpxbLRSfI=
X-Google-Smtp-Source: AGHT+IHjfGheZyV2ZBT3VN27rpnKEmCPMQFKGEPt8gQ33V8m4RIxz59dLoYVueBDi2EAIs/NbD3HjA==
X-Received: by 2002:a17:906:c343:b0:a2e:70b4:28b0 with SMTP id ci3-20020a170906c34300b00a2e70b428b0mr358260ejb.3.1706315824712;
        Fri, 26 Jan 2024 16:37:04 -0800 (PST)
Received: from puffmais.c.googlers.com.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id vi1-20020a170907d40100b00a2f48a43c3esm1152235ejc.7.2024.01.26.16.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 16:37:04 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>
To: peter.griffin@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@android.com,
	tudor.ambarus@linaro.org,
	willmcvicker@google.com,
	semen.protsenko@linaro.org,
	alim.akhtar@samsung.com,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com,
	cw00.choi@samsung.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: gs101 oriole: peripheral block 0 (peric0) fixes    
Date: Sat, 27 Jan 2024 00:35:49 +0000
Message-ID: <20240127003607.501086-1-andre.draszik@linaro.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

While working on peric1, I've noticed a few issues in the peric0 area
and these patches are the result. They should all be pretty
self-explanatory.

Cheers,
Andre'

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 9 +++++----
 drivers/clk/samsung/clk-gs101.c              | 8 +++-----
 2 files changed, 8 insertions(+), 9 deletions(-)


