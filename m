Return-Path: <linux-samsung-soc+bounces-7839-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B59A7D4FE
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  7 Apr 2025 09:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 886F6188EE56
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  7 Apr 2025 07:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C1B7225765;
	Mon,  7 Apr 2025 07:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wxCh1Dli"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69142221561
	for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Apr 2025 07:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744009769; cv=none; b=A3JmLeDIk/1+MgGMcfu55AaTqLaFWGJvXmTAfT5m633dXQUc5va/jUYdZFZ3psVZRgJZzG1oMiJv1fI/w5Qye4y1Xc750AcDh0fwaeQrPOEB2Pb6eKuqSeXhLL+NvHntScJpkXJYS1l4HMWo03jcl31fcukuIm2WSKJoezhPo24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744009769; c=relaxed/simple;
	bh=oCmtcQ3XuI+cx4a64CkUUMq51aBbMji8srIW/rMRtig=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NCjf71BkwtCbAEn9rJAb1wElkCVq8J/j+BJIi8EsF5oOcO8/4yUq5HySJeuayBEVFpL1d3yRePOF7I44Vo63nMts8/0IpseWpFEhdQT8AXzSWrJSoepO/7IPNgacZpAUwB23BuI1AktiFCk4EiveFjU7ufJs2Sk6cjUlH7Suw8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wxCh1Dli; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c1efc457bso2192219f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Apr 2025 00:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009766; x=1744614566; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+RNn5SAyspBzcMxDZ2Rf29ksnCDKjgLyQJRVVyZXvxw=;
        b=wxCh1DlikLRYr++nmUZtIonhFQV5cK5y5wy6kz9cHr9EFIrOS4OW0tmnYJiqaFNdWB
         Gsf1mh4fB+8kWiRAgKcbLQ0Tj2p9VobSxzvGmf55/yWgUyQU/Izh+xgYtyWo7ZJgwR9q
         G4SBfyI70bW4VPj9Kf+uL8FkJUhHB4FMeqXnZb4y5NW2uBgUYsf3S15R7XV7D4UU+CUn
         BlHJmd+h1zHaR24vqCVdcey1QDxnpe8wPQson+OydoMEDMCQYawmTTnBJXkb8zW+k4sw
         N9tlwvgwiNQc1KOFyGUi5N/7nJJdcmT5n4VwRqWW4BGh4IMrxWC73OWnyMU0vUpv7tZP
         p9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009766; x=1744614566;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+RNn5SAyspBzcMxDZ2Rf29ksnCDKjgLyQJRVVyZXvxw=;
        b=gt6ODQX6Gbvu4HyGvhQlXdw749oHtQaDOgNMZdgcoxrnNaEHyXT+oJ4T2nChzO7hLA
         K9re1y7i/QkUFwcsXGAHuL1DxZpagoUqFmCYjqqf1llYH5STOjvfU45Cg8k2XEKdB7zo
         wJUGoJlRFAllzArdgW3jsxOxJpGdcu4h9RA4O8mVsgwndBxTlSxp4bs97XB/nC9Kk+Ry
         jAZ5LDmUmximTENqiKYa7id44gYupnTiGhdIZSiCsEI7GzYzV1NXdkZqVn5FF/PxU0D+
         5CdPMoa1ZVXy8fD7v948+d+4/u6M5E2Ko82dwSmG1OiEzqJjwbPAzqo+EaRIKwE/7/PU
         4qqw==
X-Forwarded-Encrypted: i=1; AJvYcCVGqFhH9sKbI1zbT9CsNUTi0bcXkVsM8BsNl1mMwfz1uo3Ow3j/Pypf9MtkR+4KXJEdnaUJIUsxEpkgxb9Qe85hHQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp3xQr+gzhFAmZMim1NP7ClNElpjlUh5vlWtcLytkp/+DiReLX
	7Xl1h/rwPd3TfWMeCqLwP39lCYqzIrcF0U1Y5j90/vE45O2baCjEIwhpqX8EIEE=
X-Gm-Gg: ASbGnctrAsWaUc2QRL8Zb+dqwFQB1qX+uUlkYIgBZX9ZOxy/3XtSRhak5PavETFSrRr
	ZPuvGoQhKdxHpAtDCDLLA005MVQ/yD0MeR7uCBwM/SAaoy3RVhUeqk8xINqhdkEkxxTvL/OGIFD
	wiWB2SjVLfIZecNV28QqyaquiVihsZv1dh8hejMuID2sG4c/HDFTONktvxzj2/ui+X7m4wj0hh7
	vYItPIUmFUsbsiHRsY/qHoZG6wbTTI1CDbRT6ON7I4gqwoeQPxXQsaI7rJJPgGHALAInGJd87CQ
	kBtC0+GWI1LE+un/AIn+1ybNbGRsikIhZ4+5Ig==
X-Google-Smtp-Source: AGHT+IFsqC1d8hUahT2wAGNxMelgG0ITSws4TQAzfYlVRfWzJHmehfuM8/9lVQue9+N1lHyMNtizRA==
X-Received: by 2002:a05:6000:290d:b0:391:2e6a:30fe with SMTP id ffacd0b85a97d-39cba93333emr8618200f8f.39.1744009765319;
        Mon, 07 Apr 2025 00:09:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1663060sm124622795e9.14.2025.04.07.00.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:09:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 0/4] ARM: convert board-file GPIO chips to using new value
 setters
Date: Mon, 07 Apr 2025 09:09:17 +0200
Message-Id: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB1682cC/x3MMQqAMAxA0atIZgM2tYpeRRzExppBLamIIN7d4
 viG/x9IrMIJ+uIB5UuSHHuGKQuY12kPjOKzgSpylaUaQ5RjXiVi4hP1wkk3bJaaWuM7R2whl1F
 5kfu/DuP7fqYalfplAAAA
To: Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=oCmtcQ3XuI+cx4a64CkUUMq51aBbMji8srIW/rMRtig=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83ojKJ4eRLXH81clnfKezriaN1CLisDQ3rqzk
 JzFkrrZruKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N6IwAKCRARpy6gFHHX
 cn37EADA08bCYfZqeBjZXtU0G2h35f8c4btZsNDcBJ50euRl4+vHxdgj3v3AMhDWTGMak4M29wI
 mqwP3NcSrUPXLqTTyFkkPeKbvEP7ZdsPTmNJ+8pn3TikB97L4abj+HREE5sYr6wL6Q8CvqGpamO
 U4LHlghdIhxtpetGhz5GkamZ0KXJU6IKSossfIsCRLABd49qWLHXQthEByton/kQovIW8vntk2w
 DH+ySfLHgMUmSaRP9iCpwPMFIvRiRPwpl8HURtr030oYgufHYVTo+Xixu+xTm9w2r3gJaHgxLwr
 jdgUedVvYMuR2LyiPPxv2eX+M8IH3BMjlLWxQiw97tLhXfrBFy+7FCze/L2zIKgDedkThxWhr/n
 u7A+bgXLWfR2Z7DC0RNkkBk9oEKtSk6l8CUZ5MhS4mqgf6UaGgD8Zjd5FYEtlEb7j/YZ3aqHFT5
 fEkp5mg9spn8dunvorQSGSAagKX1TLrKxjWDAdmOdz2tgvn4+81SEhHtuZewsvjqAuoQMx7+RTr
 bPjQAvLINEk9+8vNTJ6vABE73WQZxRgmyPa9byuNWianYti/rAX3TOxpHAQrHfgk32JYLme9ITi
 lPbmshT65lPcnXMXjeeaXuZtMPL3okPYm3U+RCo7Qg53ZX2RHb+j/ESgG/8Ud5PFrh7Qqfe8ZzF
 y7ZKh0TnWVrqazw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. We're in the process of
converting all GPIO drivers to using the new API. This series converts
all ARM board-file level controllers.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
Bartosz Golaszewski (4):
      ARM: orion/gpio: use new line value setter callbacks
      ARM: sa1100/gpio: use new line value setter callbacks
      ARM: scoop/gpio: use new line value setter callbacks
      ARM: s3c/gpio: use new line value setter callbacks

 arch/arm/common/sa1111.c         | 6 ++++--
 arch/arm/common/scoop.c          | 7 +++++--
 arch/arm/mach-s3c/gpio-samsung.c | 8 +++++---
 arch/arm/plat-orion/gpio.c       | 6 ++++--
 4 files changed, 18 insertions(+), 9 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250324-gpiochip-set-rv-arm-6f4271d952e3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


