Return-Path: <linux-samsung-soc+bounces-4033-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC3E946F56
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  4 Aug 2024 16:45:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCFCB1C20983
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  4 Aug 2024 14:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F9343BB21;
	Sun,  4 Aug 2024 14:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C0J6pKcd"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3985B28DC3
	for <linux-samsung-soc@vger.kernel.org>; Sun,  4 Aug 2024 14:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722782721; cv=none; b=nYnKCYIhiCkFBKbGYyx6F07MrbChPyUgS1aQTz1WGkhuTY/hJGDRKkItg96ebJX9gcN0DkxEnM/Xu53Tdj1nfuih6F0ck3SEC9BR8dTmkW09Zx5h8BB4LfDyedenI3dzq+dNSIJiUMqPcwJy5bpuoUNuOJ3bZj38SzMmIHlrqbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722782721; c=relaxed/simple;
	bh=ja/WRY7qWEdFokc+854bwjOG9bPcZWoeywCeMuOVl0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ndkMcjmtxkQ6q2Db/Fdzc6D1BX02peEMyVVc26AYGq9sCzgT/fy7DXK4zf+plDIodpatYzd/yhQMbsIAR2AqNPjDu/Q1l4RWGsifvjNRfKyYU5LUvPLvx800JcsnD3L5SEC7uLUYQiuGLNzYqv1/uKRBz8WNuHT+SQQ/gvx0a+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C0J6pKcd; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2eeb1ba0481so149229341fa.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Aug 2024 07:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722782718; x=1723387518; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uveUaKWiRIu/1q5oQg+yRhQp6pVwq0OEl+VifrCXN44=;
        b=C0J6pKcdNviCS/Q0zb05o0ZKhLSgdxXHAzxj1fF3Fh/TcdnfkDfvffiZ1Z0Zrj+iap
         ZgLOMb/dr+g3SW73aW/yykAcdBV/YLjxUC0C64Mag2gi26sytftwM4/PoqJInDGNnZVj
         61Nar63rsfhMqgNYrjA4UJ7zq6vDuL6Ol3sm3ImQBbf+pDJJ83Dtr6UcsmiR5GaewMZ5
         hNheat8ATYRdiYdy5K0SBSgVudy0mge2kX19NsMewbGP3DXmyrflQcEPenA+RabbJw/b
         bzxlCTkT3CiWF2WqSCHkw8BQBNnKYwHvvXu2PJ81Nw2X/076GbVMK/wSHBMB07byyXES
         9/HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722782718; x=1723387518;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uveUaKWiRIu/1q5oQg+yRhQp6pVwq0OEl+VifrCXN44=;
        b=Nrw9RxZmKR1hZYyQbZAu758Q+GEZ9SBlwGTlkP4c9ABFwGMwRtYtC3tej1sIm40dex
         5TU/g+g69Tn/46SQq1mntwO0ok5jxLputMdfhzZz2XMRhICP7XQeg+kaLiKYZYqzuUmt
         Q49/TBkhkXjRme6GbqSKz4de4t1xLoW4VI9lExPfTW39ATSLtmGpKiHVeb3Ux30nB1QF
         7KrVpbTYhV6fYN6qG/7f3MMrvtL3MqldSTvDFDyzNt8lJJ1exMN08sXz09PXubrcXyGe
         ygwtDCmfu8Kd8Y84CsslQldDJ5IgLanLLGrTfRxWiiVliHqjDbg5esFocTRWOahJ9tHM
         mDkw==
X-Forwarded-Encrypted: i=1; AJvYcCVfZfWFotVUJcqbUADOkGKUMPIOwJ8jTFi4t0V9hRePwUnK/IMAQuEcEVl5QNMC3Sf7eIDVnQ4aMJgmKu5LsrSe7w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfueiL5J/bTGQLnjrXlxo0gqEqcJoY09Pzfbg/nm5LPHRyEt2X
	+QsmiX9WF+zoLIAJcbvmKpNH21Wu0OpWLnp2p6cSMIwWCxelvUoqcVR/tEOzK9A=
X-Google-Smtp-Source: AGHT+IFMEO0GkKF1j6HJbZQl4lCU8LhHH9oPTp4LSqjlAaGRsc94dzplAAfOLGynJHT11AUyLre0Yw==
X-Received: by 2002:a2e:8696:0:b0:2ef:228a:1b86 with SMTP id 38308e7fff4ca-2f15aabd05fmr59048221fa.21.1722782718050;
        Sun, 04 Aug 2024 07:45:18 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282baba5f2sm164586765e9.26.2024.08.04.07.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Aug 2024 07:45:17 -0700 (PDT)
Message-ID: <e9963fb7-b963-49b4-96a3-3637f9892784@linaro.org>
Date: Sun, 4 Aug 2024 16:45:15 +0200
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] pinctrl: samsung: Add support for pull-up and
 pull-down
To: Vishnu Reddy <vishnu.reddy@samsung.com>, s.nawrocki@samsung.com,
 alim.akhtar@samsung.com, linus.walleij@linaro.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 pankaj.dubey@samsung.com, ravi.patel@samsung.com, gost.dev@samsung.com
References: <CGME20240729154736epcas5p111a53e297c7f8c3122bf491cabaf74b8@epcas5p1.samsung.com>
 <20240729153631.24536-1-vishnu.reddy@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20240729153631.24536-1-vishnu.reddy@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/07/2024 17:36, Vishnu Reddy wrote:
> Gpiolib framework has the implementation of setting up the
> PUD configuration for GPIO pins but there is no driver support.
> 
> Add support to handle the PUD configuration request from the
> userspace in samsung pinctrl driver.
> 
> Signed-off-by: Vishnu Reddy <vishnu.reddy@samsung.com>
> ---

Where is the changelog? What happened with this patch?

Best regards,
Krzysztof


