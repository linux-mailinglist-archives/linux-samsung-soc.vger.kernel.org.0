Return-Path: <linux-samsung-soc+bounces-1670-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0DC847339
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  2 Feb 2024 16:33:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E8A11B256D6
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  2 Feb 2024 15:32:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FDA3146907;
	Fri,  2 Feb 2024 15:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LV1xYAjH"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71D49604B0
	for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Feb 2024 15:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706887968; cv=none; b=OmA8pBVVfsAAFaCLt2953HokBTxQNqIjmRg1XEWanoHr/oJe6Ftv/DayguwGYSxI0wIqcuoSCtCcyiWXxezdFiO3oJbcrYwMZKM8aUQO1jlUI+sPtmglakKL0HjpesOLsr5RuzJ+Ord9EPc8ngDJZH9XrxI5w7ijdwiF2ppW8LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706887968; c=relaxed/simple;
	bh=llo9v5dlf0lttbOBDd47InlVIFg3+gHSG0VvLxhgPM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JX5np97u+d/qlZNPBXkQcm+b+GvbDJC3Q0e/fPw2q7+MPPdqyAyhhmENpD6jbMAsLDUwxnbJ6fXwsomoSrl7liLg6idzPxawdSl+NKH6IGGK+Sg+HowR6M7i+bKxG3/AGJgI/7InhWOGkmWPkDmJW4iEFupPLnZc7ZtHQ0k4Ync=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LV1xYAjH; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a364b5c5c19so372216166b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Feb 2024 07:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706887963; x=1707492763; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vhxs4lm4Zm3GUt/u/0z+FFoLShcYcrfs1PTgE9TLbHI=;
        b=LV1xYAjH9XstlfnO+efyylh072BBXoPgD7lnTkEXfXnZEYRVyfrWQMd0aqtyFL+Nsu
         e8Jb/rS7Uc1JtLZ2Kgu8JC8P7djjDcUASWEbQPAP3JiNGAGa1Ic2rhmiZHES8KPKpQf2
         86VEESh33lsLiUt2rdHNECsHteGL9lOq7lQCDjq1svtj7uXIXE1czmMGjrwt/aBUqnlq
         BW51/7pCNNypVJSv4AmxBG6iL0tG2F1uY857eXGjG1JSpKdJ0GPo/s3YF9Yh3Gn9JQdL
         ilsaltVMQMgFwGORCuQXxddpYSTi5CSy7AXsYv9KyWvqIpIAsBUDrSk/NFf54eo64/y4
         mylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706887963; x=1707492763;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vhxs4lm4Zm3GUt/u/0z+FFoLShcYcrfs1PTgE9TLbHI=;
        b=AedoWCWu8T1xpUgASCmmh3kLjcyiiKZmEIeJgdSt0OEjM/G5fBS0vFM2qFgfc65LXu
         UHEv1l0ndcGZUC3NoNRUSZBp9avLwN5az8rwQcEbfWlVVePVZro7VcU75QhTkIKe3W8j
         9tCU22+SokOA8IPrGLcBf52Qc+vW9aoC+YsZWp56pqLJU52M2DUJnIjNw18SOdfR/kJT
         k2c8HivDPP6jjDgjXEPdii4VHbx5rvPgU6A8sa1F98TLsmKgp9SnyvBYfzAnNmZK9Lue
         8OFxSzylZpLsooRjBfIxrfanOOI3k8WZo6ZgRMyT0ZRHE13CkBvAiJxDvPZBZABlTxpd
         9pWg==
X-Gm-Message-State: AOJu0YwRx6E6DwJ1HqZevWNJ9WlN5J922seC9giPSH/ORV/OdUcEnnIL
	rZefsLAIF/F+5wdfrm6S2KX2YXa536/tnf3lc5Hp+LVGIpfAQOVWiatX8m2113s=
X-Google-Smtp-Source: AGHT+IE0YTilMWQ5BkYhpxH5R82oRau86mQNpJ3i5lFHGNpRFDGfhV7HLRXbba8kX0LxeiCkPlBlqg==
X-Received: by 2002:a17:906:68ca:b0:a35:a9e8:b281 with SMTP id y10-20020a17090668ca00b00a35a9e8b281mr7009656ejr.69.1706887963692;
        Fri, 02 Feb 2024 07:32:43 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWIcJ0/0LweMcswJ5oZx4ua7bMoWTuoTdMzBtbnuKfMToOzAz1fwsvTGh1vPwYCwiEjjvFEnkk6gMB9G8m4sxxDVi5bVzyrSZxr//d1S4uYwP3YjRgxfE/NEYXUACI4Dlrf8MjZpvsZqZnfhjkvx9H7G8y6giQhEn0F3tkdp2xnmBW9+GIx6/CoLHb1x6DLVTIoGhPrfspPAwi2MXcBcwqbFifJHrV97AxQC1MnFqX5H8uGuldIpS6E47+N2jP8aVnTmsEuCqbGnEAGmJ2DzrBCuTVwbwGuaOK72HjXrxdIAFrSGjkh
Received: from [192.168.1.20] ([178.197.222.62])
        by smtp.gmail.com with ESMTPSA id m18-20020a170906235200b00a36802ac18fsm983580eja.30.2024.02.02.07.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Feb 2024 07:32:43 -0800 (PST)
Message-ID: <3cf997d1-e178-4162-a5b7-4c2a3ddeffd6@linaro.org>
Date: Fri, 2 Feb 2024 16:32:41 +0100
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tty: serial: samsung: Remove superfluous braces in macro
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <20240202010507.22638-1-semen.protsenko@linaro.org>
 <bed3d775-2d80-445f-bf28-b28a17a6370c@linaro.org>
 <CAPLW+4nPnPywwsjkeJE70GzyBL=smEo5_=0usGwmnaPRgZwdrQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <CAPLW+4nPnPywwsjkeJE70GzyBL=smEo5_=0usGwmnaPRgZwdrQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02/02/2024 15:54, Sam Protsenko wrote:
> On Fri, Feb 2, 2024 at 1:49 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 02/02/2024 02:05, Sam Protsenko wrote:
>>> Commit 59f37b7370ef ("tty: serial: samsung: Remove USI initialization")
>>> removes parameters from EXYNOS_COMMON_SERIAL_DRV_DATA() macro, but
>>> leaves unnecessary empty braces. Remove those to fix the style. No
>>> functional change.
>>>
>>> Fixes: 59f37b7370ef ("tty: serial: samsung: Remove USI initialization")
>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>> ---
>>>  drivers/tty/serial/samsung_tty.c | 8 ++++----
>>
>> I am pretty sure you did the patch on some old tree, not mainline rc1.
>> Please work on maintainers tree (or linux-next).
>>
> 
> Hi Krzysztof,
> 
> I worked on linux-next, and rebased it on top of the latest linux-next
> yesterday, right before submitting. I distinctly remember solving a
> conflict while rebasing, due to the new commit 0b87a9fd670a ("tty:
> serial: samsung: set UPIO_MEM32 iotype for gs101") which just got into
> linux-next yesterday. Please let me know if you want me to rebase it
> on another tree and re-submit.
> 

Hmm... Almost two months ago GS101 was applied which also uses
EXYNOS_COMMON_SERIAL_DRV_DATA, so should be in the hunks here, but
maybye it's gone now?

Best regards,
Krzysztof


