Return-Path: <linux-samsung-soc+bounces-3035-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5CF8B94FE
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  2 May 2024 09:03:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50BDB28305E
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  2 May 2024 07:03:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0858D2421D;
	Thu,  2 May 2024 07:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tC4XrcGp"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45744224F6
	for <linux-samsung-soc@vger.kernel.org>; Thu,  2 May 2024 07:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714633398; cv=none; b=BrdXsfvh9eIIL2WST4pKGCKbOsUioBTNXUdiMkkfeEXqrj60B1YyvuImeb8mxeszOyTsPZhdnNa3ZHEfWwOoQNZ5Pe9JXXTEfceeAfc085q4RItorG2qZYYyoWwUR+OI+ED3A8xZrL58t5CoaFGHDhEyZWd4SyXd6crCbAZZiEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714633398; c=relaxed/simple;
	bh=HioLiSxaTT3L9jLeBVE08Icv/6BMDP4b5Tqu4usekps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OOXRXD645K8liSX58+LnDmaf7OliKVFplaMCBrsxA8pJb+So29NnJWZqoOzWG6xK3yJATiLzLS7gIN+lWQ1MyVaXu6SoPzUuY2/Sbyc0kNMhjcP+OP7xrVsQBy2K1hQKKEH79vxsKbR33GIuDY1yqkqlvjJQpXUWklRMB6D2VIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tC4XrcGp; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-56e48d0a632so11716497a12.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 May 2024 00:03:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714633395; x=1715238195; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gT0wZEscSYeblV//UK2U7Db5HieDrFtfc03MYGL1w1I=;
        b=tC4XrcGpXLmDW5X+LEYIKp2hmfXHghh3p+yP+5Vm9YjUqNGm9MnPlBJWj1Qm45DsfW
         22dvCvctBtpXlV4AXA0e/o4z14zC5u+PgoZlDVfvG9IQr91DR96i+iG04yu67Y8TrNoQ
         8X06HRunxGrT1JX+XbFQnVRnwraavdNiN42w7v8V0jX29EO0Jl9jmufenxq+Yr5bfJ7F
         SZkqKSedGjdPPDA4Z9srZYKhAoGMMv6GruGsF6b2shZh0MLeJHJZVDOiWxgXgvhZfv3V
         wUWGSD0NKkW9q+NUU2kA+jIY4cWMda8uK4CySJO2grmS1jmfb1vDPsmtbe05MLW0m83k
         lVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714633395; x=1715238195;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gT0wZEscSYeblV//UK2U7Db5HieDrFtfc03MYGL1w1I=;
        b=PXWCnPlJ4NLc+9uNHWnSy/ppt5aToA0cLqWa2VU2SoVAVgRUDh40N25fjVel6y3edo
         lA6UjMuViwtisoAeBD5Ks4u1lbMhvbar9vUpnePmwrKVJNkO0xuahL0bXD1ZvAqJ0Fet
         MQFDk2t7cjeP3BIZoYxm8Wd8q0Wp2dQReGps/7oiHHzk5c8YNtilXTURKPVlbkjrCgS4
         RAE3X1NaAHZrDWl0C9A8OYp2EcXMMmpHonV5NRqIv94AstvGPIyIaBaV0kNZZhkBNlRf
         RdbAeCOvHmaLU+EU+w3S3WVrsXz8cXpNRyidX+3yBNY/zZ4uK7E+EraSWKrFWL6Lq8Vf
         LZSA==
X-Forwarded-Encrypted: i=1; AJvYcCW3xzA7ZLUAz0Qa4Od23xup5lcvAaYHR9XNnVYLgr1RlTcA/KgpqrP7HeYnvHJ+vNXgUm/ZFZ8B9Cy7rH535x1lC9QZ8Dleeb5LahMMUj3RoZk=
X-Gm-Message-State: AOJu0YyRr4rM9tWpI1A6EXJeAhNaHqPbPFdz2KqvbNjKDwohJIV+cZ96
	c2I5mn1pOgKZb0+EEZ3rfwUyRtpXdv25avk2KeyAQXbb9f54FwJ4O/cCP9vzr+U=
X-Google-Smtp-Source: AGHT+IHFpFEqlXM3zz6rJKm3I8vjCOOz+uryNLLCBIGYAJc6l96B5NrBVV8YYabtH9jAVna9mDuoZA==
X-Received: by 2002:a50:cc9b:0:b0:572:637b:c7e1 with SMTP id q27-20020a50cc9b000000b00572637bc7e1mr1146508edi.21.1714633395016;
        Thu, 02 May 2024 00:03:15 -0700 (PDT)
Received: from [172.20.10.10] ([213.233.85.172])
        by smtp.gmail.com with ESMTPSA id d25-20020aa7ce19000000b00572a7127cb0sm182422edv.50.2024.05.02.00.03.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 May 2024 00:03:13 -0700 (PDT)
Message-ID: <b3621642-485f-42d4-a9d2-0ccca63e219b@linaro.org>
Date: Thu, 2 May 2024 08:03:10 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: samsung: gs101: mark some apm UASC and XIU clocks
 critical
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com
References: <20240430-gs101-apm-clocks-v1-1-b2e2335e84f5@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240430-gs101-apm-clocks-v1-1-b2e2335e84f5@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 4/30/24 10:54, André Draszik wrote:
> The system hangs when any of these clocks are turned off.
> 
> With the introduction of pinctrl clock support [1], the approach taken
> in this clock driver for the APM clocks to rely solely on the
> clk_ignore_unused kernel command line option does not work anymore and
> the system hangs during boot.
> 
> gout_apm_func is a parent clock to the clocks that are going to be
> handled by the pinctrl driver [2], namely
> gout_apm_apbif_gpio_alive_pclk and gout_apm_apbif_gpio_far_alive_pclk.
> It also is the parent to the clocks marked as critical in this commit
> here (and some others that aren't relevant for this commit)). This
> means that once the pinctrl driver decides to turn off clocks, the
> clock framework will subsequently turn off parent clocks of those
> pinctrl clocks if they have no (apparent) user. Since gout_apm_func is
> the parent, and since no drivers are hooked up to it or any of its
> other children, gout_apm_func will be turned off. This will cause the
> system to hang, as the clocks marked as critical in this commit stop
> having an input.
> 
> We might have to add a driver for these clocks, but in the meantime
> let's just ensure they stay on even if siblings are turned off.

It's sane, yes.

> 
> For the avoidance of doubt: This commit doesn't mean that we can boot
> with clk_ignore_unused.
> 

s/with/without. Because there are still other clocks that are not yet
handled/marked as critical where needed. There's still work to do.

With the typo addressed:
Reviewed-by: Tudor Ambarus <tudor.ambarus@linaro.org>

