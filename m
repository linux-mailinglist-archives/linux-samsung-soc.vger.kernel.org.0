Return-Path: <linux-samsung-soc+bounces-1780-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F9B84C5D2
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Feb 2024 08:52:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D117289161
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  7 Feb 2024 07:52:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C8241F959;
	Wed,  7 Feb 2024 07:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lKElovff"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B551F947
	for <linux-samsung-soc@vger.kernel.org>; Wed,  7 Feb 2024 07:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707292370; cv=none; b=sin5+DLvlZSV7rdmel2g5OGyffqFfO1hjA4EVsgcuaczNj+Pls/8AKac6a0Jbt1E+ltV0+cRhs4k7/rPY3Gs+iwyjH0bxk0jg6WjQjIzC1vFEjP5LWdhEhUFcPCsiuzGwwwvDYqDJcB6nWe+uyfQFqDJ5gLnB0fguejIJN6f2DM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707292370; c=relaxed/simple;
	bh=JlVEwPHVfMeMwvk0a6YivuZGsYLF2ha+DYx2BYky9oc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mu+5oC0oJXGQMyH0gbF98ZFnjAaWSwfO1Oh2sQmFuiGQSZLLEDmvcPvGzH8BLZaPOCo7SpURo8YYngxMedkyJy5hUFEHZ0RiQ6mvWgtD9ZIVSV7Zh7mvTvy/BqaId6/0lv25mkI1C2CQqo8oD1gTyBvEL8ag2tjOOcWNse62l40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lKElovff; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-40fe79f199bso2320045e9.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Feb 2024 23:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707292367; x=1707897167; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JlVEwPHVfMeMwvk0a6YivuZGsYLF2ha+DYx2BYky9oc=;
        b=lKElovff0vgtcK9ygg4mlcEhNnu0w6mouQYeS3+n22k0+jn1SEa1snq+MCpF7553mK
         kpum02oki5hudIE/Fgsc2yFOpxO8usijizZekGhcKWR0qP4zvhc0eTssx2XGs178PuRB
         l10GAvrxCGRCKbrIrbwg07ZIB39MmggIZq0cXiT4JJsQB6MCawvQaYPhNRPq2H+iQtZy
         VBge9x05rwE2YDph8lrIGhLjnMjfpdIWGLJ3HNn24dJmtt4IhWewSwpnl7q5SXrt+YJU
         Pkw67+sBheKN5uMlAlxK3fEgm8peth1HYg1TsK3g5PzdyeqxK4xQbze+1zkkcj/ydSUe
         4HRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707292367; x=1707897167;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JlVEwPHVfMeMwvk0a6YivuZGsYLF2ha+DYx2BYky9oc=;
        b=iImsLpPTJpjxL91UN3K48nwg8YHwtkOoHnw5dbeQoH8h2dEXaJWTAdMDRI5t3XCCsV
         hX5WrAt90TEmKoMUusQ4pmvCW15aIWUzRyzHhIxjLWe1bgkhZl/47+shIzyT9LegDkWw
         oMGUeM1/wWPkkYsexdUG+K+p3zC3w1e4tOSI6HicKwwlsPfbkc9dstM4jAmzcSmwi9YT
         P+Fmke+r0nowp9ofevrz9xnj6d739eixeNQaSfmwesQDFZDhw9C+RrsNWTBo6/ritgXu
         dPFg/2TnYeLuQk0F30sI0tw/Us03u0PDED0fO+KX/L4/xHrXcKSn8wNvyDMr6uHIKksu
         f7Zg==
X-Gm-Message-State: AOJu0Yw3eWtGTiyUN0YBjEx+g1jJ8ix6hfamqFC97fO1e5z68mC5fq8N
	EXqAlwJ6p8laNc2w+ImUXbPQLZYWwak8/BwvD0g82h9Y3eVjcGiBOKbgP4pxxEw=
X-Google-Smtp-Source: AGHT+IHeSiwuGNsTeFQbBrGKw2OEON10xV5chvkbSmAO8n1HwgW5d5GXc8gOG4sH3GEYneCzi4DeVA==
X-Received: by 2002:a05:600c:12c2:b0:40e:55ca:5a48 with SMTP id v2-20020a05600c12c200b0040e55ca5a48mr3987735wmd.16.1707292367508;
        Tue, 06 Feb 2024 23:52:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWA8UreBGYKheyKusCdvRcTpT+JSdj5LcovOrXKohjQ1Vyql9hm9ip/dwl46vCFoUQCIszW/M3Yudtvi+PX+K684YheHnas9oqUn+7bime0DJeb0UvkK6BqAq86sgJwyKfs7yVlE9g2/+j/6fJlHWKlJZ4EEfwo/R03B3F+RXaSpSHfVQLUsGfRJyARTYXvG3reBFxVgAgkt4G9FcTxq48ZA3O6jaR5jjERUM+sDaGbcLrJWFJwhjd2S08Cwf2Y9rhdJixAcsam6dj2Trg5sn3dl9GOGZ+GU/gguj4gC/kL5KHG1oZmoMy7dCnBKesdovYH1M7UQGYl6Qgq0pfUy0r9XsYRrEWiQAYT2ojVUKdGM7fmRB8fJCH7mw8WWHySrvNTND7z45jQ8zlCmbfrJNDaHdwhxKfVNnlK1YpxzmHkCxU1oBVOPs13jhscDbjXW5fbXihBFnUkDDppgxFqEsZHB8Y=
Received: from [192.168.0.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id l37-20020a05600c1d2500b0040ee8765901sm1164739wms.43.2024.02.06.23.52.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Feb 2024 23:52:47 -0800 (PST)
Message-ID: <555a3600-8669-4733-b89c-ec0b5c6a2c6e@linaro.org>
Date: Wed, 7 Feb 2024 07:52:45 +0000
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/16] spi: s3c64xx: straightforward cleanup
Content-Language: en-US
To: broonie@kernel.org, andi.shyti@kernel.org, semen.protsenko@linaro.org
Cc: krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
 linux-spi@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 andre.draszik@linaro.org, peter.griffin@linaro.org, kernel-team@android.com,
 willmcvicker@google.com
References: <20240205124513.447875-1-tudor.ambarus@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20240205124513.447875-1-tudor.ambarus@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Mark,

Please don't queue this yet, I'll come up with the gs101 patches first,
as Sam suggests. I'll then add this patch set on top of gs101.

ta

