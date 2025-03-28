Return-Path: <linux-samsung-soc+bounces-7696-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4111EA74D81
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 28 Mar 2025 16:15:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0288B189CBF1
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 28 Mar 2025 15:15:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413F11D5AB2;
	Fri, 28 Mar 2025 15:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GII7KUtn"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41DB1B87E2
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 15:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743174926; cv=none; b=R2c4+mFncvN9rTC9qzjEzQONOsDh0CIRrUkOCZhWulTvf4vTDUrt48uUQRfV+v3SXoPZEW3w/rTdpLfWRar2lEZ/Ha+Y5LX5EHzsMyqUyXw55Nwpe6O9oJV7cwwh8ahQ2bbGCDI1WXiJ3BcUsHb6zq9HKxacHyY7RkG53Pureik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743174926; c=relaxed/simple;
	bh=LbrjVDuqcQ+iJXIRRIvMyE403IP8vZQPi2Qzf0eMaKo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S5YrNRctoa/n9KwAh+bCyYDRW3WF5+30uNLF8uB7ipXx/f3ysfVuMYF5uqJ5VVgWDESpeOvrOs8Qf/iWOEkOaq6NKlnn81aQXXwTESTgayNLljCqWiNy0qIimX60cFoXFvP77VvZBqJ9K+7RhSXq1AUixkrlNV3jhC0WP95IeY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GII7KUtn; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac2c663a3daso439871366b.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 08:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743174921; x=1743779721; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CTb/6m+cqxX8FWirPINl0MalDPq0y5qkx5epBIXmSTQ=;
        b=GII7KUtnOJJIpKDV2bom+1EiSjVTlu7/ZgGV8xWmMR174LSUwc5YppJfFFBOKx7dtV
         sPr+aJRiiQbK7dKzAvCJVWbcjy9Jm1uDgUC9FNiFf4A6b4EzbiLEDee6OrKThNH2cN4i
         zfgMvrqPclWaC8K4iNLQHX/TO611aKdaoohvmn4BzpQzO+dV7Ytm0bEkhpQ/7QkRwO1Z
         padjk4wGtYyPGdhDI/RNUmsmvubzb9j0ntlKztBMB5ILI4LOojfJ0Ekcm/3Hol5ujWkH
         dbmkeWwHLNkNjxWnwYrRu56m/ynsXg6MHh38yKq3bjNAj9BKemEJu2dOLcT6qqH8FAi1
         AKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743174921; x=1743779721;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CTb/6m+cqxX8FWirPINl0MalDPq0y5qkx5epBIXmSTQ=;
        b=OF5aP3LCPIEAkDQHl5DrhjrE1OZdRK73pkkfW0hNy84EBYoXlMBH1Iu1vFYZqxQEBk
         ypPXeFCGyNJpUyLqCH9ExaAdfc6pAFcfO/c8USSB4BhxRISnbw1Kl7XDcBQ6otgKEfFw
         +8NNbHWO5rFVrcOyVBUf2yveaBw1BufKtGb8AzM3INcB1QI8FSd4sM4mq+ZlhA5sHQpo
         KKuyEGnMlQx9VywomNWwItYq37bAr/RP9Xy2IUGttPiZhFIqMMn5R25UOziSbGGjelOk
         T8OpPZEOckODjaXn2uF9yX4FT/BuCttNV4SYUQWyE3yhhL3OYo5KFuYTZs4pwk61Ltaf
         IZ9g==
X-Forwarded-Encrypted: i=1; AJvYcCWdCXqkUnLCZwEN6hgXHGVoXnb1XkN90DXwVhybSwgfvU5UflDzlqDFQswa/tfMGJjJKZFdXaS8rIICDW7SRNB4LQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyolQQvuWu65kt6XZgDau2ZxSzEX7sKnuIu1Y6k0fqPmI4ZUhRV
	Lo9kWVdIW1PKMWaJUKkcgi9vs2DSuRMcrHJzYB7CvPlp3SphUqfp+QaqeIEbQ0Y=
X-Gm-Gg: ASbGnct3xgS2OxSSrwaosGZf9E4QeUftWht99IFjLEeJq/gDKgXkLorywjM1qZaEkZw
	/zK/hXHbEZD5vH2UjlE8ZztTnwp3m3Tr7xzLNzpk0e4IdrDdfx4RO2uwELmfD68lsd8Z0JBoawl
	18Q485W/dVt83EligIBW1G1rB6NJ0jtP0cOOWeEPLr8ueVS2B64rewznAZvOSX8Q0jfVaik3gEd
	UUeXBhx6npkf43plP5RzAIv4tkHnwl7vDT3vgqaaCqs50SAmhmzi4UvZIRd3ncv8y5CHWYWE88o
	m1AGgq/nVBNvvGkIAWhD0mP0UZ6dlBeYFfsE3CXuwOSnDQN7c/vpiexUGrWAk6Inju03MTRJHB/
	uEkeQ+mz3LAbQpM/JEQPROesVRCHe
X-Google-Smtp-Source: AGHT+IGx/OKAyGwvOZBy0ZMKJFwNxxrxi+pIE6CmLb9aaW4fvxERRLfNh9G8DBj8v5e+gDV9fv4WjQ==
X-Received: by 2002:a17:907:7f0f:b0:abf:6e6a:885c with SMTP id a640c23a62f3a-ac6faf14d75mr574320366b.23.1743174921074;
        Fri, 28 Mar 2025 08:15:21 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71927b742sm178789266b.65.2025.03.28.08.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 08:15:20 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v4 0/3] support Linux reboot modes in syscon-reboot on
 gs101 (Google Pixel)
Date: Fri, 28 Mar 2025 15:15:18 +0000
Message-Id: <20250328-syscon-reboot-reset-mode-v4-0-77ba57703ace@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAa95mcC/43OywrCMBAF0F8pWRvJo3nUlf8hLpJ02ga0kaQES
 +m/m3alCOJquAP3zCwoQfSQ0KlaUITskw9jCfWhQm4wYw/YtyUjRpggjEmc5uTCiCPYEKYyEkz
 4HlrAQkqhtdW1AopK/RGh88+dvlxLHnyaQpz3S5lu2z/QTDHBDXXUSkalNHC++dHEcAyxR5ua2
 b8SK1KnidaSK2Kt+pL4u6R+SHz7STTGCe441+ZDWtf1BevceLhVAQAA
X-Change-ID: 20250226-syscon-reboot-reset-mode-566588b847e1
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

This series updates syscon-reboot to support warm/soft and soft/hard
reboot on gs101-based boards (Google Pixel 6 and Pixel 6 Pro).

Linux supports a couple different reboot modes, but syscon-reboot
doesn't distinguish between them and issues the same syscon register
write irrespective of the reboot mode requested by the kernel.

This is a problem when platforms want to do a cold reboot most of the
time, which could e.g. wipe RAM etc, but also want to support rebooting
while keeping RAM contents in certain cases.

On gs101, this can be implemented using different syscon register
writes.

As Rob pointed out in [1], register access shouldn't be encoded into
DT, though. At the same time, at least on gs101, the difference is just
different register values in different registers. Therefore these
patches:

    * add a specific binding for gs101 reset
    * update the generic syscon reset driver to support this new
      compatible 'google,gs101-reboot'. In this case, and as suggested
      in [1], the syscon writes are then deducted from the compatible,
      rather than parsing them from DT.

The existing generic syscon-reboot driver seems like a suitable place
to add support for that, given all of this is straight forward and
simple and similar to the existing code. If the preference is to have a
separate driver copying much of the existing generic syscon-reboot
driver code instead, please let me know.

Link: https://lore.kernel.org/all/20250227132644.GA1924628-robh@kernel.org/ [1]

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v4:
- Rob:
  - don't add more properties to existing 'syscon-reboot' compatible /
    binding
  - add specific binding for 'google,gs101-reboot' compatible and
    related driver changes
- Link to v3: https://lore.kernel.org/r/20250227-syscon-reboot-reset-mode-v3-0-959ac53c338a@linaro.org

Changes in v3:
- support <reset-mode>-reg in driver, not just in binding, doh...
- correctly parse <reset-mode>-offset
- add a comment for all the BUILD_BUG_ON() checks
- Link to v2: https://lore.kernel.org/r/20250226-syscon-reboot-reset-mode-v2-0-f80886370bb7@linaro.org

Changes in v2:
- fix whitespace issues in binding
- Link to v1: https://lore.kernel.org/r/20250226-syscon-reboot-reset-mode-v1-0-91c1b62166ae@linaro.org

---
André Draszik (3):
      dt-bindings: power: reset: google,gs101-reboot: add Google GS101 specific reset
      dt-bindings: soc: samsung: exynos-pmu: update reset for gs101
      power: reset: syscon-reboot: add gs101-specific reset

 .../bindings/power/reset/google,gs101-reboot.yaml  | 32 +++++++
 .../bindings/soc/samsung/exynos-pmu.yaml           | 21 +++++
 MAINTAINERS                                        |  1 +
 drivers/power/reset/syscon-reboot.c                | 98 +++++++++++++++++-----
 4 files changed, 131 insertions(+), 21 deletions(-)
---
base-commit: db8da9da41bced445077925f8a886c776a47440c
change-id: 20250226-syscon-reboot-reset-mode-566588b847e1

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


