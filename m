Return-Path: <linux-samsung-soc+bounces-477-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8474480AD45
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  8 Dec 2023 20:43:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39D7C1F20F91
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  8 Dec 2023 19:43:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ACC44F5E0;
	Fri,  8 Dec 2023 19:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qz2LBg36"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 746471716
	for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Dec 2023 11:43:27 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-332fd78fa9dso2267136f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Dec 2023 11:43:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702064606; x=1702669406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEJCryZOY7/zM8uMtAIXnTjj+RgXAZj+NQh24K145R8=;
        b=qz2LBg36Un/64fIiuA/Z/wdRszfRJvtGyGInuxsx9eZKL4kFKaWF9i9TzUiecFv3ab
         WhCVp6aFBsUzSqwQ1IAPXzOUrrzaE/Efvz7VBOZt/0qwY8ZT39GxjTk6dIX6fh1Fb4ST
         CbqxA+w/MMIUanHCx2/R7xFpWf8bZKsgXtfByRzqkPKq7sTTquX4SPuH6g61Na0SzMrY
         /IkFXlAzbftUZ4SMZChI9zEGrCer+oXzN5n1+mDlLRll5j2/NTCRGiB4XjGGcpOGYxb4
         ldfgr3crGeikCq9LECRQSGfTDDN/wCFFeMUgPBHSBvKpdcK7okFSgJxppXpleZstA31s
         5TiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702064606; x=1702669406;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vEJCryZOY7/zM8uMtAIXnTjj+RgXAZj+NQh24K145R8=;
        b=IMG65CDHnPNeTizqEuHQ2z27vUGg2ThT3f2CLpeUnf02ZJiIyMVAF+EEHy4HwDswgz
         7JIBLN3EDFQauB8Pwgl9vt3nuiP9IprcIwCbFA05enKxkdGw8x8HTAJ78h6nya9YT+T7
         10ya10g/Lq5Z3H/XMI+kp9NdwlhcXMrMf8OHbx6XK8Ve57LtEe721LnbAOhqbhOct0+F
         cfbr6aTHz8dikY+9ONoob7T+iuHAZQ6NJ/NPGxAfM9IWwpSpfVNIVHWVQviNwZkBZCNt
         h8qKWmcKAaOZhYz5qqlZBzTDl94STROAyhQv8Nv9vdirhGgBH3i1WgrSw9iGXZKE3s6N
         pqbA==
X-Gm-Message-State: AOJu0YwLYYL8BoYDzhan6XKGrEyQ07FfgktQh7DmmLLShVsUrktzRafK
	d7SQAPDiZPIhRsj8NzAyukj2nQ==
X-Google-Smtp-Source: AGHT+IGUZ0M5XfwQtXVfb2fFWHIXJ8eCSwRd4AUrMyT3otXdE/VM8Wxvk+NVq9q1AibYzcHmtCgkGA==
X-Received: by 2002:adf:ee0d:0:b0:333:58eb:8d6d with SMTP id y13-20020adfee0d000000b0033358eb8d6dmr136808wrn.103.1702064605915;
        Fri, 08 Dec 2023 11:43:25 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id o10-20020a5d58ca000000b0033338c3ba42sm2653920wrf.111.2023.12.08.11.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 11:43:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Paul Cercueil <paul@crapouillou.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20231206221556.15348-1-paul@crapouillou.net>
References: <20231206221556.15348-1-paul@crapouillou.net>
Subject: Re: [PATCH 0/3] ARM: dts: samsung: exynos4210-i9100 updates
Message-Id: <170206460423.126390.6462198989409881978.b4-ty@linaro.org>
Date: Fri, 08 Dec 2023 20:43:24 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3


On Wed, 06 Dec 2023 23:15:53 +0100, Paul Cercueil wrote:
> Here a small patchset with a fix and some improvements to the DTS for
> the Galaxy S2 (aka. i9100) phone.
> 
> The first patch unconditionally enables a regulator, which seems to be
> needed for the phone to boot properly. I do not know what it is
> connected to.
> 
> [...]

Applied, thanks!

[1/3] ARM: dts: samsung: exynos4210-i9100: Unconditionally enable LDO12
      https://git.kernel.org/krzk/linux/c/84228d5e29dbc7a6be51e221000e1d122125826c
[2/3] ARM: dts: samsung: exynos4210-i9100: Add node for touch keys
      https://git.kernel.org/krzk/linux/c/6e73b11062b2e3e873666ba35577437502cf1dd2
[3/3] ARM: dts: samsung: exynos4210-i9100: Add accelerometer node
      https://git.kernel.org/krzk/linux/c/50c7cdc9a4d2d21373c1ab52c131109ab30c53f5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


