Return-Path: <linux-samsung-soc+bounces-748-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B30818FA3
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 19 Dec 2023 19:19:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FF281C25176
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 19 Dec 2023 18:19:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 026DB3B195;
	Tue, 19 Dec 2023 18:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gJdvYJgy"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5067405FA
	for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Dec 2023 18:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3365424df34so3471044f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Dec 2023 10:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703009834; x=1703614634; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U5+/YEXsrPbbkR396pSZpoZgLbak9X4jZQSn1ikhDZ0=;
        b=gJdvYJgyzoF0mB5pAECEB+QJuZavOSpKucdwHc0Ty3pCCSHQ5KELOv6y+4Q4p2T5dc
         j5Dz6ghIIzNQJ2j0UTZAkIpL+n/gQqkAUxPJEWSEgaYKB9Zg+LiHLJ+3/bF8FMXs8Dek
         UAqGF+S3Eb4foCSUwnMwd9p1JBpbGARglj3PwmZQcOPZ8cjtD4P1pc54dNtZ+r5emU9d
         cv5E4+j2uiywa+zPfmnZEKYYIVHWuzKDDsJoyYY16C6P5ZacNGP8PABYR5opW+QOaywV
         I/CAbp82Vn4AYWTOejLDxv56NAHuLSeypea0IqNQXJhzWNUN+4FCV56jIRSbss/gp5qc
         D3sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703009834; x=1703614634;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U5+/YEXsrPbbkR396pSZpoZgLbak9X4jZQSn1ikhDZ0=;
        b=VEC03PmeSjbdXvtP+CdRi4AyOFS5RQoTcMFoctchpUm++hzuEkso0nkXmRxS+Y6kSE
         cxnLHzyv0J73WF5T96snCP6sphZTnhudb6JBqIiqWMz3oL/w4NwNdRopqBsxerkmUxeE
         ViNSU5g/MzfC50tgb11LuzPf7qcTTHRAlI2ZnG376MX7BYBGQrky7tpvmkfKRw+USizo
         MaUDyril5msUqkGHAszbux4OZaEjrwohmAabIeAp3VkY1G76ko7Im5l6xZosjmZmZuPG
         A+nNIlaqvW8+kHVREzFQxzNp6AgvpoVT7f1H7eX70+UITj8HreshajjCdITT3P3LZCBf
         OyoQ==
X-Gm-Message-State: AOJu0YyHZ8sWTvco6uiPmKpW5w8Cxrh6vaM/olYH3txdvFu/smuLuO9s
	3F0jds7otqp3nVgYCGf9o7VvMQ==
X-Google-Smtp-Source: AGHT+IFcNDfUU2vQH560I9HCoCIGOh5tkvBA6RjgmzVGKzkXpkzHXpd7F/sDbAYIuHYfyRGowRWdsA==
X-Received: by 2002:a5d:6c67:0:b0:336:6dd3:bfcf with SMTP id r7-20020a5d6c67000000b003366dd3bfcfmr2158204wrz.121.1703009834114;
        Tue, 19 Dec 2023 10:17:14 -0800 (PST)
Received: from [192.168.10.46] ([37.170.14.102])
        by smtp.googlemail.com with ESMTPSA id d13-20020a056000114d00b00336726bcc8dsm2260162wrx.7.2023.12.19.10.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 10:17:13 -0800 (PST)
Message-ID: <dfed0e9b-f84c-4627-9540-a240d3724f21@linaro.org>
Date: Tue, 19 Dec 2023 19:17:11 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/9] Improve Exynos thermal driver
Content-Language: en-US
To: Mateusz Majewski <m.majewski2@samsung.com>, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Dan Carpenter <dan.carpenter@linaro.org>
References: <CGME20231201095637eucas1p25e14bd24e05ae61eb12dee18af2a1dc5@eucas1p2.samsung.com>
 <20231201095625.301884-1-m.majewski2@samsung.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20231201095625.301884-1-m.majewski2@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/12/2023 10:56, Mateusz Majewski wrote:
> This work improves Exynos thermal driver in various ways. This is
> related to the discussion in
> https://lore.kernel.org/all/97201878-3bb8-eac5-7fac-a690322ac43a@linaro.org/
> 
> The primary issue being fixed is a lockdep warning, which is fixed by
> the thermal: exynos: use set_trips patch. We also simplify the code in
> general.
> 

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


