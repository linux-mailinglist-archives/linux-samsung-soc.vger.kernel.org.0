Return-Path: <linux-samsung-soc+bounces-795-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F1A81D8A6
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 24 Dec 2023 11:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 571D51F21642
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 24 Dec 2023 10:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 584DF1858;
	Sun, 24 Dec 2023 10:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q/xDevEt"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813072101
	for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Dec 2023 10:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40d3bf30664so34720655e9.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Dec 2023 02:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703412664; x=1704017464; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=wUc+VGzz0e0QDKg0efGo4jVLEcAKF7vo/7r2DSKdGbE=;
        b=Q/xDevEtoDV30QWpJE0SMfHxFPbWgMNne7RaCLhhVep69xODpTeaivZk+4RPBrpHJU
         bDEaJcuoyfx3Epr3lTkkgnn0jcGV3VLaxuxRwPfW4vYdNZe+BN16lGj6KylGAWw2CHCK
         qew10FmSxEqn6mvrqeZtUMMIORTVK/AjPrMq/I7pU2GLYG0mH3OBdiOTnYTcqt2lVQpx
         q87gy35yyYT+JElB3191YiJUp230fi/sStVP333WL4ArDJjl2UNoJBj2GFd1TT/bw0V6
         KBmoeTtsdPlkNQabbe5LvFs5NPITECZb0kB3CnEpkoiY3C3ufZKQkvMlyuNPgnUPp+FH
         V4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703412664; x=1704017464;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUc+VGzz0e0QDKg0efGo4jVLEcAKF7vo/7r2DSKdGbE=;
        b=aKxq4x0D1xRfvHm5gyJnVUkJShFXxW2yogZ5pe4RL/PqjDGxM8ddYWPfZLlWVjSNmi
         p5HFCLi5uL/xc0qga3wtZQyEl0f43SYqJwq8xjvUWjYrxaO2V7M883NL/byrHR/iWTo7
         I24kiWu0e96sMOqDqtLP+b8dMb/+CUoG0Vi5zp4M7z6AjztjuJnGN9ApaCH1jVbqg7IZ
         cuAFFwauNkAnaxtkJwM0By4TQsMYZuqY/rkRIzXcdvDqzkBoX8bdXfuHx8if3593mPuf
         xmIuQDZJtFObC3a9XGMq0F1+aB4VIgqMw2j05yLAtTKasBnLerScUPyPnM0Ct29e817h
         OVoQ==
X-Gm-Message-State: AOJu0YzjXE2a+cucDK5uOXpOCuxUboNwaZXZTCk5XVTHVoMRWLb0u3iI
	5LO+n4Oyru2y+UEmCWMgXbxng9KFtibU9g==
X-Google-Smtp-Source: AGHT+IEn2GjtswEPW9gGypF7uYSa2XrydRyJvpI8CBOa06+jSFJK9r/jtx4YCtWCho2ru1s9ifkKfw==
X-Received: by 2002:a05:600c:2218:b0:40d:3bed:d868 with SMTP id z24-20020a05600c221800b0040d3bedd868mr2444837wml.14.1703412663596;
        Sun, 24 Dec 2023 02:11:03 -0800 (PST)
Received: from [192.168.0.22] ([78.10.206.178])
        by smtp.gmail.com with ESMTPSA id w25-20020a170906481900b00a26ac253486sm3191092ejq.134.2023.12.24.02.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Dec 2023 02:11:03 -0800 (PST)
Message-ID: <93da765f-44c8-4023-b416-eae617d5ed74@linaro.org>
Date: Sun, 24 Dec 2023 11:11:00 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media:fimc-capture: Fix a possible data inconsistency due
 to a data race in fimc_subdev_set_fmt()
To: Tuo Li <islituo@gmail.com>, s.nawrocki@samsung.com, mchehab@kernel.org,
 alim.akhtar@samsung.com
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 baijiaju1990@gmail.com, stable@vger.kernel.org, BassCheck <bass@buaa.edu.cn>
References: <20231223164351.3521588-1-islituo@gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231223164351.3521588-1-islituo@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23/12/2023 17:43, Tuo Li wrote:
> Accesses to ctx->s_frame.width and ctx->s_frame.height should be protected
> by the lock fimc->lock to guarantee that width and height are consistent.
> Here is an example in fimc_subdev_get_fmt():
> 
>   struct fimc_frame *ff = &ctx->s_frame; // Alias
>   mutex_lock(&fimc->lock);
>   mf->width = ff->width;
>   mf->height = ff->height;
> 
> However, ctx->s_frame.width and ctx->s_frame.height are accessed without 
> holding the lock fimc->lock in fimc_subdev_set_fmt():
> 
>   mf->width = ctx->s_frame.width;
>   mf->height = ctx->s_frame.height;

Other places setting parts of s_frame, like fimc_capture_try_format() or
fimc_capture_try_selection(), do not have mutex.


> 
> And thus a harmful data race can occur, which can make ctx->s_frame.width

Harmful how?

> inconsistent with ctx->s_frame.height, if ctx->s_frame.height is updated 
> right after ctx->s_frame.width is accessed by another thread.
> 
> This possible bug is found by an experimental static analysis tool
> developed by our team, BassCheck[1]. This tool analyzes the locking APIs
> to extract function pairs that can be concurrently executed, and then
> analyzes the instructions in the paired functions to identify possible
> concurrency bugs including data races and atomicity violations. The above
> possible bug is reported when our tool analyzes the source code of
> Linux 6.2.
> 
> To fix this possible data race, the lock operation mutex_lock(&fimc->lock)
> is moved to the front of the accesses to these two variables. With this 
> patch applied, our tool no longer reports the bug, with the kernel 
> configuration allyesconfig for x86_64. Due to the lack of associated 
> hardware, we cannot test the patch in runtime testing, and just verify it 
> according to the code logic.

You wrote long four paragraphs which have basically almost zero relevant
information, whether this locking is needed or not. Your bass
description is not relevant... or actually making things worse because I
am certain you are fixing it just to fix your report, not to fix real issue.

> 
> [1] https://sites.google.com/view/basscheck/

Instead provide the report.

> 
> Fixes: 88fa8311ee36 ("[media] s5p-fimc: Add support for ISP Writeback ...")
> Signed-off-by: Tuo Li <islituo@gmail.com>
> Cc: stable@vger.kernel.org
> Reported-by: BassCheck <bass@buaa.edu.cn>

Run checkpatch, you will see the warning.


Best regards,
Krzysztof


