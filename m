Return-Path: <linux-samsung-soc+bounces-7366-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9083FA56B75
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  7 Mar 2025 16:15:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B2BE179711
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  7 Mar 2025 15:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCD7E221561;
	Fri,  7 Mar 2025 15:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uWjUvTN6"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF8C221540
	for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Mar 2025 15:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741360248; cv=none; b=kwUHytyIWwr8BsIqx4qmAm6fV1Upz0wE33aaiH6TvZ7EWXPzTjUqDBMsDUpeIW23y2zbYdsfgqc6yyLz5zwLh1LM5SEURjxdDxJsJJNGu9kwSPRJTa8Co1mvezpBcDvRGynpK1XguhBVW1VOnbWDqM2TZmH8II6uwjvb2QqGpaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741360248; c=relaxed/simple;
	bh=7vPM66wrqA8ItOal1m7QS909J6dZMJbGOzOQwE8gVyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YjJ4gHwFEY8uQYEDv5h0tLGzKLl2oXsZ6C0JjMlnQpZHFTpKBjRCixf3X+SE/3695zC+0BbH+0CFwOAcK+1NQTm8Fbrj0o5AA90HbJI5CCD5wQW8hM9KLMw1jzZDbMO9bcKWSC88Ef+t3TlK74HiiAZgkKVG2KXq1+VdviiFqxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uWjUvTN6; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5fe8759153dso739019eaf.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 07 Mar 2025 07:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741360246; x=1741965046; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GaMH1NOSXXEyX+4I+PnYIXnBgRaLQ5ST8GTB4hff2uQ=;
        b=uWjUvTN6EX4c+P6aUMdpQ43KsDrmqLeNu4sCncwPyem00Z1g+HI/xWEBkr4dFJdHpK
         TNH0hXx0f3UoH43rXHSDalHKIXhUHAC3ENvuawUDmEus0ME5Xub6k9ZGTHGYrCIXPhrX
         89wAD6qQsx0sS9L3mwOHeQg0PE0ZPNktI0SWmt9BZek3zMTGVFdUDs9V5PPKsPDP8Lt5
         0Q3CtQlbPPa7a9N2dFgnArlZ/85+krAiwR6eFfidcqh8KJScz3g9hkivLPdwGkye3LTE
         lYYnUm45dF+wNyEBujgUNWIXn8AjDMak/HwScGunaYFpyrOsRWcJN/VPoYycb2cZ2MlD
         x27A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741360246; x=1741965046;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaMH1NOSXXEyX+4I+PnYIXnBgRaLQ5ST8GTB4hff2uQ=;
        b=jUsn+wEwB0ocS6vsNzzkFQskFtZ1mlzyzfS65RCJBqccwm0Knrg2WmcU/xuSFEwp3m
         PGBreud6VNBXYALZ/P+lswUYOwOcnU1AojZ47CFWSkvI+nFAyPAhlTfttWSW/Ph90Ikg
         xU/v6+Fc/uNhTHGNfOCYiadYJMLgBn9VdXGK9nSmID+YeYV41KCE6FkHyo61napvWFzG
         SiyPS1sw3vlioBf3jMm87XkIT9XMJ5btb5axj2956qhzfUy8krSrN/eJsAzkYMl2xois
         HFxJHu4icZpNsvQuYLtN/nqDi1Pf8glpDN8+d6lpHNnfSa/ZPDyudO++vrrqs3fOoSlh
         Z+3A==
X-Forwarded-Encrypted: i=1; AJvYcCXR4pp5RVYnPOPY/R7YHNzXVRQavP9Oh0ZQb0Na30k5RIm2Be5+mmaUb3zn/7KgFlB+r0909gFWRZZsiP4R04g8rw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf/PtQpxfiBomU28Kjj8dPnTrKnC05K3EX5kW1tju/cG/Yextw
	ijCR3qjT7WIk7Ovr4QjfyAY8nE4mkj+b38xRiPmwGdxHDgMhkg8TCOJCE7ZRRJcN6xCI7wXRQHV
	TuQk2/99B++emNLJtPJwYu1LomvHE+WL/iTUrKQ==
X-Gm-Gg: ASbGncvYLH6i4fT9+U0RzjL6PmLnHhGY1Vz09H4iBlq1K0dVWdkCnm+sqSZTKK5bKEJ
	Qa4Sfsupi9an3+UROQ6nHvytvFtCB0yWuPMr93lPAAgdpr9wJ24LTxQudE7Tqkoiq5sazcVGfre
	wFco1WGU3KUZoPbGvFYB+2mOOggpk=
X-Google-Smtp-Source: AGHT+IGmSI6uKhyqp0Lz6umulak1/qdCrknOZ1BwGtVXVr7Hw1ALnj7JKNyxJ8z0WKOu5JKZrR6BgmZGuCc1usZ1pxU=
X-Received: by 2002:a4a:ec46:0:b0:5fc:f3b8:78c2 with SMTP id
 006d021491bc7-6004aaf90aemr2063696eaf.3.1741360244995; Fri, 07 Mar 2025
 07:10:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250226220414.343659-1-peter.griffin@linaro.org>
 <20250226220414.343659-5-peter.griffin@linaro.org> <20250305024020.GC20133@sol.localdomain>
In-Reply-To: <20250305024020.GC20133@sol.localdomain>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 7 Mar 2025 15:10:33 +0000
X-Gm-Features: AQ5f1JrG484DP9qv6Qb4pGd14bkBMzxvaPSxEwh5c_p71wnvCQXfRvFkoiXZo_U
Message-ID: <CADrjBPpju3MmZbNy1uaPzAWTWrmNHx0nT+03DmkM3p5qFEUHdA@mail.gmail.com>
Subject: Re: [PATCH 4/6] scsi: ufs: exynos: Enable PRDT pre-fetching with UFSHCD_CAP_CRYPTO
To: Eric Biggers <ebiggers@kernel.org>
Cc: alim.akhtar@samsung.com, James.Bottomley@hansenpartnership.com, 
	martin.petersen@oracle.com, krzk@kernel.org, linux-scsi@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, willmcvicker@google.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, bvanassche@acm.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Eric,

Thanks for your review feedback.

On Wed, 5 Mar 2025 at 02:40, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Wed, Feb 26, 2025 at 10:04:12PM +0000, Peter Griffin wrote:
> > PRDT_PREFETCH_ENABLE[31] bit should be set when desctype field of
> > fmpsecurity0 register is type2 (double file encryption) or type3
> > (file and disk excryption). Setting this bit enables PRDT
> > pre-fetching on both TXPRDT and RXPRDT.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
>
> I assume you mean that desctype 3 provides "support for file and disk
> encryption"?

Yes, the PRDT_PREFETCH_ENABLE description in the commit message I
copied from the datasheet. But I can re-word it like you suggest if
you think that it's clearer? I notice now there is also a typo with
the word 'encryption' which I can also fix.

This patch came about whilst comparing UFS SFR register dumps of
upstream and downstream drivers. I noticed that PRDT_PREFETCH_ENABLE
is enabled downstream but not upstream, and after checking the
datasheet description it seemed like we should set this if
exynos_ufs_fmp_init() completed and set CFG_DESCTYPE_3.

> The driver does use desctype 3, but it only uses the "file
> encryption".  So this confused me a bit.  (BTW, in FMP terminology, "file
> encryption" seems to mean "use the key provided in the I/O request", and "disk
> encryption" seems to mean "use some key the firmware provided somehow".  They
> can be cascaded, and the intended use cases are clearly file and disk encryption
> respectively, but they don't necessarily have to be used that way.)

Thanks for the additional context :)

Peter

