Return-Path: <linux-samsung-soc+bounces-7966-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CF3A8392D
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 10 Apr 2025 08:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 481764A017D
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 10 Apr 2025 06:27:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9387A2036F0;
	Thu, 10 Apr 2025 06:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="diOq5bPQ"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE7C1D5AC2
	for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Apr 2025 06:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744266441; cv=none; b=mx00RqWz+aYF8Ka/trIEm6B+dhFxWKZwW1gWWtbQkrNJ3xPof/qf8tyoIauis8VYGyGTckUtQe86Xbl4WFeJNgWwBU+02vhZoHU78yg9ER765nGPccIaV5+0WLmYH66X3CoCY9R+J6E08lb5SaVgIvqVX4lYrwwXH9ULru0jwVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744266441; c=relaxed/simple;
	bh=DbAUYbu5Va2xJQiy7VvKkV4e/4jPiHlqCkXhEFbYoL0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=taPdmm9u+TSY+nsWwTVzvZW+J02Khk+q8a4R8bPWetbwyZgsEzrIq8xnvFQNOAjkuTT7IJInBQlbPV/pTJy2UhanIikCNB4RCBAsyy322bNsTmVkGz03DaFQ74pCEcQNWxm8gttfztJYTDUo72iCwGrtlzlsQwYjYSBS+LnzWB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=diOq5bPQ; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d0953d3e1so449285e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Apr 2025 23:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744266438; x=1744871238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VvT2Gppf3uxd/yxNywWCnYiGlORidfrwioHAQ0OTxgU=;
        b=diOq5bPQ41tWsiC7hQG9OTkhh5pHHEMaAnADGSF/ewK7twX/K/8M4iV+MSyqXKM7fd
         UESkRuyOxvcKWybN6KtU9tR309fUL53knl4hJ5oDUrpdKr8JWPLqIj3iSL/ChhbV13Xl
         vFoFpj4m+sut8p8h6HmV+EYnnS5nDvuSp+iRZpHPUog0pooI/ZJdfgcwW4HCud+y5q6x
         Vv0/3Iz6/gZoO87oUhU1eUd14DfdSRcEup/Sj67qpeEDbI8B/W599isJosvoAgul0wqm
         ksRfFe9iNLvGKGUg3pYFCJoLqws7QFpIjz0bFfqT7Q2vyYtKv66Qgz1CvfozWqHYL5WF
         V3vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744266438; x=1744871238;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VvT2Gppf3uxd/yxNywWCnYiGlORidfrwioHAQ0OTxgU=;
        b=kt+urU6rmPCTiCl2TqKGYAZrxy8W63iaaxbpE3rP/sS5d+Sn/xNqDMvLDT718EGAR6
         mDckzSB3eUcipIefk5mCO48hxEajRfrHr7Ls84feRVSF5ezBNKEjVP/FvWqzG12yZiE7
         ViBloIuYt5FnIoUxAOcte300zuXkn4kdqCr2z3v6wQwezzkGIWGI+MtIJfG3kmUUd5P4
         Qb+TYuHT/BgNprcMeIaJHbwW8XtFjFLl5sO16UpEruESkLaknyh6x8gxbbKk2kshRp82
         uxH4Ot7pKxG8fXb8VAL9yzGBYmcAQkYVLWehyocSMny4SQJnHOv56JvSdGw2BYxTrnB8
         bAWA==
X-Forwarded-Encrypted: i=1; AJvYcCWiVxKmXVflurvgVb++wz0W4L+A9TASc2ZQUhW2eDX04WllhT0v7/cVUjbgU1P/4xAigXFMbGEMZRFvPPhHnWUg1w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyW81nsnklJKEyiluXXZEiKTAKw15Yl48fV+ZWshglysnX2q5QK
	a2umjkMOjsLigpD/ZFpPrOZSsEC7DUt3P/9grpv9l/SKeRPzK3Lm7CZhRU0Qdqw=
X-Gm-Gg: ASbGnctsr9y0+T+fZZCfXx9N9HXA6MUTKwy8qrFGPxZeADp66vkdjxkR0liBKA8ZWe9
	d4veM5IlFBf381OsIWll4UM/+3peQfHnaqv5L8EL9o3c9FDPyQXjp6fni2T5qpo7dcod+ZO1+od
	0mwYJMlKVEn3zEhkfYjrGqCcnC5/iXBhNxfyQ8pADjL4F0fvuV7h2ImrR27/aYo/MNgtT8Wi1SB
	fW1Tfr1gpglODvCzH8atbsMDvDUcrLJ6PLA93AlLFjr6ugaN+GKCXedv1ETVxzj3ewGKOx+CH6k
	DQQtmWSYqiHdHv/L+XZSy2YRvwJZVcBeqmPn8YM/gTfu0FLLV7HLi0DPf0s=
X-Google-Smtp-Source: AGHT+IFVRI+eHYzRePN86bPROJmtppmFeI/4qAEBjgxUHImff0Q+A3BjR9d8MWHmWJZEinQXV/yX6g==
X-Received: by 2002:a05:600c:c87:b0:439:94f8:fc7b with SMTP id 5b1f17b1804b1-43f1eae40f4mr18061085e9.0.1744266437939;
        Wed, 09 Apr 2025 23:27:17 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233c8219sm39520695e9.21.2025.04.09.23.27.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 23:27:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
In-Reply-To: <20250409-s2mpg10-v4-3-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
 <20250409-s2mpg10-v4-3-d66d5f39b6bf@linaro.org>
Subject: Re: (subset) [PATCH v4 03/32] dt-bindings: firmware:
 google,gs101-acpm-ipc: add PMIC child node
Message-Id: <174426643614.15856.3555538804191184531.b4-ty@linaro.org>
Date: Thu, 10 Apr 2025 08:27:16 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2


On Wed, 09 Apr 2025 21:37:24 +0100, André Draszik wrote:
> The PMIC is supposed to be a child of ACPM, add it here to describe the
> connection.
> 
> 

Applied, thanks!

[03/32] dt-bindings: firmware: google,gs101-acpm-ipc: add PMIC child node
        https://git.kernel.org/krzk/linux/c/935e5bd95df2c79404630a691caf42c3d7bc3a93

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


