Return-Path: <linux-samsung-soc+bounces-2914-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 043B08B385A
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 26 Apr 2024 15:25:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B34C1285F14
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 26 Apr 2024 13:25:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 992A0147C61;
	Fri, 26 Apr 2024 13:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qy8nSZT4"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C5513E88A
	for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 13:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714137943; cv=none; b=p5LRdJqqOI8boDzKdCf6k1MU3lwHhxsfQiNAYTz8YAwWtFEv5ipP7UBcC485KB9aTthIVsByrvASOmZrg9HQaXmTStA/5aSR/WWgAhOXhawFuh+fIHEevYjF47/wiiwS396kamjYmEYLjmPMEMcXhTg0iOxfRxjO6uLVdv/gOk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714137943; c=relaxed/simple;
	bh=PFIYOZg9K9UwEmZAr63Yumid7BZUGpat1tcH693D634=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FxtCNXYaVmeZbx1Z3BaG/YzwhyxvIppHK1xu75i9ka6zhWbJ0cPqbgjeaODp7bB6IqecUrwSDRVoBItMDEbep08YyHrX//LEmjKezHH2yan908DsZt4m0/YgkmgHYTEDY7aBuH4slqpeEvsvgzlAnfwBCB38gwwc12FzjDqvXbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qy8nSZT4; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-572229f196bso2688131a12.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Apr 2024 06:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714137940; x=1714742740; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nBlxUGhcUMlZ1NuXfj9CcDZ/kdBcHgFkVBoMJK3U+jA=;
        b=qy8nSZT4O80SLjRgGXoa5d9aDwEEY609wEpDGWUlobTUhjZCI8l/NNXZ7g5c+qVUG4
         DuihFJhcu04vX1KDZy7KQ3ZPG+cYrooeE9bNvYYpFWNhB+/xRWrsKr/dQbImIdUMxOEW
         zGDeTz/eiYhMWGTmhm+PTnesK17ENUKT24BBdGarndx2p8P5fyVDqUk5ZcSWB56eOr/y
         ujdX2mnNmaIrjXUr20qvZFgeU2054ZfGpY7Mdee8/xH11fiAi3sCZJicw2VZdF1MDvNd
         8klZRdjR7IVWexQaT1FUjJB79jy+a0dIAKMowSezDmJzg89kAMlsqdMXQa8FGIOOjIDi
         mEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714137940; x=1714742740;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nBlxUGhcUMlZ1NuXfj9CcDZ/kdBcHgFkVBoMJK3U+jA=;
        b=s0PfTQYss3qws5qSF3xj9pcfogoYVg6teW0uBilbDXjQxROv64KjoVcU+TzD6H+slJ
         aPpCwJdK2c+vtCWAJu0szDah9XOcsLNdFoy2sm1YPoTmjs6bRVThcCHKff6GK5ZB/Wx8
         Undt48yVt7Maw6bnU2aKpecriXcbuTjWS8CuGtk6LUm84V291MV1qPPLJAjeDlhkKhN+
         wDM6GLIN9kajhqMCklTPHUx+mlx8rhAgwQWuHW3BmQY2W/CGcvYCfUsa0SwI46+T/MBg
         RM2Fm8mCw7t3l2Dm+k+fh8fr7zF89XZslDwoX0WtqOPWK88e4ykja+/tdwTE+onEQ4h7
         neNA==
X-Forwarded-Encrypted: i=1; AJvYcCWTSjPLwTlu3fiNpt69fwjHXuWN/LqzyXbnTCQlt1vqThRe0Eev404cJjv74kUHWfRT8iyuuCQj2qTaFAjqSY8GMQRRkGejjiszSpFZK3CPWLw=
X-Gm-Message-State: AOJu0YzgsfefcgdGoqqbYvM1VKl5JUQErqg5TZSDRNbT9UvWBwPFeTMG
	wWhr/JHo+PEF2kiWV0XtUq1JULAMzzE7jflnS6mVULFNZPnyfXaVuDvKyGor/+o=
X-Google-Smtp-Source: AGHT+IEQnTONLpgPEpZGw72hhNVslCeV1cxppbDRTGwelsaK4CbefA+Nbhiicj5+/DF9awboRPTzfg==
X-Received: by 2002:a50:875c:0:b0:571:fc58:a8dc with SMTP id 28-20020a50875c000000b00571fc58a8dcmr1587037edv.32.1714137940104;
        Fri, 26 Apr 2024 06:25:40 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id q25-20020aa7cc19000000b0057203242f31sm6187837edt.11.2024.04.26.06.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 06:25:39 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v3 0/2] clock support for Samsung Exynos pin controller
 (Google Tensor gs101)
Date: Fri, 26 Apr 2024 14:25:13 +0100
Message-Id: <20240426-samsung-pinctrl-busclock-v3-0-adb8664b8a7e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADmrK2YC/43NQQ6CMBCF4auYrq0ZBqjVlfcwLkopMBFb0kKjI
 dzdwko3xuX/kvlmZsF4MoGddzPzJlIgZ1Pk+x3TnbKt4VSnZghYQIElD+oRJtvygawefc+rKej
 e6TvPykxjXh+FFMDS+eBNQ8+Nvt5SdxRG51/bp5it6x9ozDhweZIKAVRlhLz0ZJV3B+dbtqoRP
 yXxQ8JVqhujlaoaQPiSlmV5Azqb0aULAQAA
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

This series enables clock support on the Samsung Exynos pin controller
driver.

This is required on Socs like Google Tensor gs101, which implement
fine-grained clock control / gating, and as such a running bus clock is
required for register access to work.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v3:
- fix binding for non-gs101 platforms (Krzysztof), sorry I missed that
  initially :-(
- Link to v2: https://lore.kernel.org/r/20240426-samsung-pinctrl-busclock-v2-0-8dfecaabf020@linaro.org

Changes in v2:
- propagate clk_enable() errors in samsung_pinmux_setup(), i.e.
  struct pinmux_ops::set_mux()
- move clk_enable()/disable() outside bank->slock lock, to avoid
  possible deadlocks due to locking inversion (Krzysztof)
- fix some comments (Krzysztof)
- use 'ret' instead of 'i' in samsung_pinctrl_resume() (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20240425-samsung-pinctrl-busclock-v1-0-898a200abe68@linaro.org

---
André Draszik (2):
      dt-bindings: pinctrl: samsung: google,gs101-pinctrl needs a clock
      pinctrl: samsung: support a bus clock

 .../bindings/pinctrl/samsung,pinctrl.yaml          |  21 ++++
 drivers/pinctrl/samsung/pinctrl-exynos.c           | 112 +++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |  95 ++++++++++++++++-
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   2 +
 4 files changed, 227 insertions(+), 3 deletions(-)
---
base-commit: a59668a9397e7245b26e9be85d23f242ff757ae8
change-id: 20240425-samsung-pinctrl-busclock-151c23d76860

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


