Return-Path: <linux-samsung-soc+bounces-7430-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BBBA5DBC1
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 12 Mar 2025 12:41:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2082217A0DD
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 12 Mar 2025 11:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03CF823F36D;
	Wed, 12 Mar 2025 11:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j7ONB6CC"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4183D1E8327
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Mar 2025 11:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741779669; cv=none; b=Kgj1rXG2BP0MbkV/Sl4S0bli4/xY94U1znpH66S7gvj5cfWsAuyNskJt1+DutifgGK37ivhbk5mqrGD631uO02Ghm6L8mVD8cY9ggV9sJhkPg0JxGqQXMmNB0uzTMimo6ANhTNLJO8aLBqW2IP+Fbsoq5ejqhL82wzjwnSLfAXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741779669; c=relaxed/simple;
	bh=BoyRVgku7EChH42bDwzZAFPngPMwwosKhAXjk4aoYAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lArpJZmEbgb3hHrrfaLdvpR7nfq3cSLWUBKgF+TLd6NvSHuToykVV396sPgTktaBbtlcwKSyTqomXfml1CNHirC1XRbgBoTbUgGRauYQAI2UTqYJbE7Zeyk7ypI9m3eTHpo5guXqwWER/tP+yyx49WHGH3N/BjC6SsZqmffLj/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j7ONB6CC; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3f3f4890596so3435790b6e.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Mar 2025 04:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741779667; x=1742384467; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BoyRVgku7EChH42bDwzZAFPngPMwwosKhAXjk4aoYAY=;
        b=j7ONB6CCbuvks9c0xdPVkFYaWmfkmXCHj1CLgF2nBNWa4+IjkWEI7PczAsSbz0Z13Q
         QCg5vUcxLxh+/9DV805Nn2jASqWjvviBgOZCcWT/8X20cfTkGHg/NPlGN2QfRXN9gDCL
         ihqvz5syShS+YkwhdEJAfJ95urMtZIdN0BEzD1jEeBV2ClXRsCPtsbDhcNl1pkOEoGTx
         BvdMHgdxD8NURC5KLw8SAbc/rjGyysyXS4BVwAaDS0OAunghZi/9m09kuCkLI9YTCq0R
         uC/F/mqbXOg1fnjVX7oAwoZEJDe6ErP0YcAadHBHfoenOBh/FRhXSvk93UBH5C8M0WFe
         GcGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741779667; x=1742384467;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BoyRVgku7EChH42bDwzZAFPngPMwwosKhAXjk4aoYAY=;
        b=NuLwHNidLjo3sg/rmD32g16tn3Fj5z3hd7uv1bSG4n3JwyFeLPMgJrxoEf8sboE55j
         IeiXz3oJmbTQSxO/BK17hRj71OS7Lo4yIUWH9rKaWCChUOA4KS7f1C/BEata9CJ6mKUy
         p4gI8dH/kRq2OkumWBOkbd0ZTf4sq7d8GEJ8yWawQkcH5fcbKZP1ocemPALDuy5wWJgf
         lT6cMT7uR17o+af6A4v/Of4TA3hCvkXNqE0gary/6FiH5UMnlSoxl5cx57TKUmi8Xvs2
         BaNmY0m4KnOXXHw2yh4rAz3HDIfO1H7KUC2IL5SlbHCgcFjpZVwPjQVXNoc2AScsswzq
         xBKA==
X-Forwarded-Encrypted: i=1; AJvYcCVzFAJvPk4P//Q6XTma/vhxWgc4UuBTzbpX92SqEAoNAT7oHaL37qcgM6+IP4jzMltBqckrsjybHj0mzUTpbjfcPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSnJkfJ23qp92/bncSk6Ofv5fT9+cRY+HDq3r/UQE3iDpwppET
	QzkGAyZ72rDDXaboYAKfvWlRvk4j4yI/Sg/nZezo67dKCdpfAOZkgnCfXiGF3IlhUKLd5fZZsbG
	CEaMv/iF4xUKwUkTOiaZZ4z8p6kxnYSEzVyxzPg==
X-Gm-Gg: ASbGncvIsrIQBh3E/79BQ1VvDD60BpAO9//KOqKe8Ey96RQ+FsYMNCts0qWgPH6aToK
	7/8S8x2LiIYB1tCLJrfIQH0PdaJB4I59yqC+u51R7U2fCaUwUIS1uanWWRhoIkcl1dF3WatOSCE
	YSsp58/VLtv59S73oKOkjVL8SYYHZa
X-Google-Smtp-Source: AGHT+IGaTcw1nD7VE9rPLBX0yt54Qbx8fd0Q6JwdK4QExiQp0aQKu5cOr0s66LDn5WLcu2ofBIiUC2KaC5xcYi4Kn9k=
X-Received: by 2002:a05:6808:13c3:b0:3fc:219:c620 with SMTP id
 5614622812f47-3fc0219cb8fmr496004b6e.23.1741779667314; Wed, 12 Mar 2025
 04:41:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250307-pinctrl-fltcon-suspend-v4-0-2d775e486036@linaro.org>
 <20250307-pinctrl-fltcon-suspend-v4-2-2d775e486036@linaro.org> <c2e2c78c-e85e-406a-90a7-07d5b4fa82a6@kernel.org>
In-Reply-To: <c2e2c78c-e85e-406a-90a7-07d5b4fa82a6@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Mar 2025 11:40:56 +0000
X-Gm-Features: AQ5f1JqdFxSd55M07UVZhyjzfxW8ipmSisfDvd1eSlj0E3xpeK33pLmIlqctOpA
Message-ID: <CADrjBPp9suYGifVR405k5KWqmGRnO1W5A6J28sWJVT2nGut1ag@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] pinctrl: samsung: add dedicated SoC eint
 suspend/resume callbacks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andre.draszik@linaro.org, 
	tudor.ambarus@linaro.org, willmcvicker@google.com, semen.protsenko@linaro.org, 
	kernel-team@android.com, jaewon02.kim@samsung.com
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks for the review feedback.

On Tue, 11 Mar 2025 at 19:32, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 07/03/2025 11:29, Peter Griffin wrote:
> > gs101 needs it's own suspend/resume callbacks to use the newly
> > added eint_fltcon_offset for saving & restoring fltcon0 & fltcon1
> > registers. It also differs to previous SoCs in that fltcon1
> > register doesn't always exist for each bank.
> >
> > exynosautov920 also has dedicated logic for using eint_con_offset
> > and eint_mask_offset for saving & restoring it's registers.
> >
> > Refactor the existing platform specific suspend/resume callback
> > so that each SoC variant has their own callback containing the
> > SoC specific logic.
> >
>
>
> > Additionally we now call drvdata->suspend() & drvdata->resume()
> > from within the loop that iterates the banks in
> > samsung_pinctrl_suspend() and samsung_pinctrl_resume().
> >
> > This simplifies the logic, and allows us to remove the
> > clk_enable() and clk_disable() from the callbacks.
>
> Can you make this a separate commit? This would be nicely self-contained
> and without any functional impact.

Sure I can split it out into two commits.

Thanks,

Peter

>
> Getting own suspend/resume would be the next commit.
>
>
> Best regards,
> Krzysztof

