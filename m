Return-Path: <linux-samsung-soc+bounces-612-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 277B080F6FB
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 12 Dec 2023 20:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFEAA1F2165E
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 12 Dec 2023 19:40:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FE36358F;
	Tue, 12 Dec 2023 19:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cDh0hBRv"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5470EBD
	for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Dec 2023 11:39:41 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40c41df5577so30060755e9.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Dec 2023 11:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702409980; x=1703014780; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YxAzDX9JXlerGjW9sliLNg1VqSbKZo+v7TiUYRAOW8s=;
        b=cDh0hBRv5sWuUMxRCoVH4b/mckOBT+1uRU6WuOLmBKQUYSE8k10q/YxlzZgom2LEc9
         s/5WjhqmSY14ZhwDPsiBBfxpakUgcdvpP36KIK3fdqYberpULJw6mV5XOhmSwB7+ySMz
         jK/24L6JF+wWH+iLVeAYL0dPgkU745YX8vqPw8UxpqtaefTW3niO0YL7AQVgm1mUhU9q
         Hyti8oMeI2j/hT1w8jheR8V3QufydnoDM31u374JHtZRzPY+sUU/5OGaZFXFyJY7WULz
         zm0xY8yOU7rL7ceB4HHaCRYumFCkNBCz3HGW6ekJog6Gf8c8/eZnVFJcx9CSAE7mLkfh
         wyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702409980; x=1703014780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YxAzDX9JXlerGjW9sliLNg1VqSbKZo+v7TiUYRAOW8s=;
        b=g2v67vIbRLJsRIHQIIpALRY76ZbNzvxyi/kFTfZL3/fv2gwzVHMOG+T4Evc2QPFkYi
         324iepI5I/KtFxTqVO/DpUUzICVL5X9tzNcsklKbhH1gBmnVVK45ZYyCMmhCiyp8O8xC
         iBuiR8KYRa1IvzEon2jT98T5LbsbhWGgtxhbdKa1kYseiPAbO6tyLZ22It5hjPKadPCJ
         PJBBpMKUnk4orBMseFUO6Ajgqa1HTRHAMk3V16RP3AZcqaEt7c3tLU9AzUGstV24RGUW
         hg5UkmW/JermRC3vh8ZJ+PV1lq+FxG4Lr+UozFmyTLjsGF9Mg0oAJqaGqqj1chguur08
         yURQ==
X-Gm-Message-State: AOJu0YwEUHbT6ow3Ol65rbeosFGzD9XRvchHyvFLyKOP1Qk65mCzBRV7
	9MuBLPNiRqKwdzxD/5e5flXldg==
X-Google-Smtp-Source: AGHT+IEfRC4TinznPMBUka4PyGE92KOat9ON7LxpFk3J1KfTrqntMs1dCJLWbdbcFiI3FdFisklHVw==
X-Received: by 2002:a05:600c:2948:b0:40c:333a:8ad with SMTP id n8-20020a05600c294800b0040c333a08admr1631510wmd.149.1702409979887;
        Tue, 12 Dec 2023 11:39:39 -0800 (PST)
Received: from krzk-bin.. ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id i9-20020a05600c354900b003fee6e170f9sm17345530wmq.45.2023.12.12.11.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 11:39:39 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: Re: (subset) [PATCH v7 08/16] clk: samsung: clk-gs101: Add cmu_top, cmu_misc and cmu_apm support
Date: Tue, 12 Dec 2023 20:39:17 +0100
Message-Id: <170240988142.242356.6873777616992390636.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211162331.435900-9-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org> <20231211162331.435900-9-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 11 Dec 2023 16:23:23 +0000, Peter Griffin wrote:
> cmu_top is the top level clock management unit which contains PLLs, muxes,
> dividers and gates that feed the other clock management units.
> 
> cmu_misc clocks IPs such as Watchdog and cmu_apm clocks ips part of the
> APM module.
> 
> 
> [...]

Applied, thanks!

Dropped the header, pointed out by Rob.

[08/16] clk: samsung: clk-gs101: Add cmu_top, cmu_misc and cmu_apm support
        https://git.kernel.org/krzk/linux/c/2c597bb7d66a55f2af2fff9bf4629dd07b3b9a1e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

