Return-Path: <linux-samsung-soc+bounces-3708-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA13929FC9
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  8 Jul 2024 12:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C9CF21C224FC
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  8 Jul 2024 10:02:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7428574076;
	Mon,  8 Jul 2024 10:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gxny2AqM"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98B4446B4
	for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Jul 2024 10:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720432919; cv=none; b=VGmuJ1qpNhdAEuAuT2hVHm4GASEv+/hQE54k/IVAH1X+9TJo26o9WuC4qeKfkrxpWa2EHz5XeB0oeNwLNe3Kgl/encIi+1zGmxdUEOFIkBvRpcOopE0/74N0id3AP+5et/jOwfAwFYro5d3xakSbSMWDIafrdr+d+wWmrV/wQzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720432919; c=relaxed/simple;
	bh=SVihhqPsjw1aby9Mnriupbd1CRSchBT64K5CWP/L6Hk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EDpSsIDzD3WRh1CulYAmmC6cA1dO5Z7auAsI88LDZB+InQW5g73m/F47DU+tX/AcTjao6novmGYajMew/0IhkyOEshsdbJ/6CEbjTntWpLtAc+aMrNbH0u6nqlJlYCZcjOJsG3rO/Y2QdQUetfrYBjawALp+9juRuYBkSa0x9U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gxny2AqM; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5c661519bc2so1234757eaf.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Jul 2024 03:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720432917; x=1721037717; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6qk7Fc3i9dd3OlZuL04X6Rue/WRCbHYH2AlZY6gbT1k=;
        b=Gxny2AqMbwE1d+LxjEoKIm/ybDX9dE1fcvgo710lEpPeUFAr7F0Ak4xAURbzAtKwYB
         PpS7tcT2pBnTI+EeYQGsyw9LcoC9o902B2SHRGDoXSjoPkmWX1siZhXK6j9Fqa3K0ZN4
         RdRUycV42/AOFeaUvTggmcNesWaioRj2pO9Yuek19EmnKkCJlegbIGI96bkeo0EPSetf
         vhOteFXR33w0fDso1UUofW9IfFL5J35zG2QEiaqzTyoyO0WeCNCBUEwrx3qlF4nDQlZ2
         wyIq3KCeD6Uw1+ABjbcczLIgORnPdU3jSbWfrcDYBXm7DBoiuhaj8h/6mbgeu4F3b8YB
         1Tyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720432917; x=1721037717;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6qk7Fc3i9dd3OlZuL04X6Rue/WRCbHYH2AlZY6gbT1k=;
        b=MdLfWDj64XVMDW0fipEAy5dmHvOZkADrci4oSzTmEqRU67Ztf0bg4Hf6TSCOXyHBA6
         OUkey/s5dk1GOZiYiUwnW5CkHkG4He56I746KJ85kHnettS2lRhRSwVJ9GhCMlVp0/Ws
         AZ5aUCVRGG6/swSanrP3th/NTLIvufLBOTUy2IRhg2fqAGsUomEmwsTpEqN8VCO7co+l
         GlvZKa+fMasst5fCQsCErl5yTBZMbqFO3WBEX6Dyi/w8p8c6/NiKSW5Vrc/ls9MU1nVS
         jpHhAd6mEE59iO/aVBOaWjSEPjrwQNoeVX8DpwrfU/5OXeJN4t1Tni2VmEEr2/L8EFTv
         oa/g==
X-Forwarded-Encrypted: i=1; AJvYcCWqVrlFsLn91njQpWYT1TLcRMwi4r7qpJOGgHqqb4VMfUxV22rH8/Ae3zUrI3MLwoSB0SYVS2d8FzHfNZQDjsTT5BDuacreENLdA/qLxbaqjXc=
X-Gm-Message-State: AOJu0Yx7QbXD9RSX+fRPyyUWXL2kn6mHXkubM4ytbQFMYIpfpOK/D0mU
	+EDintKJGfCKspQo2DkUwRyKiJlrvz7/+eOYWGKqdECpZ6wTySEcutwYxjTH9Mf9yT/c264pR62
	lcSVR58TSxfS5dXEctac2G9U7XG/WGWBFSOKQng==
X-Google-Smtp-Source: AGHT+IF3h2FT1NdyCnJBUlwrVg0fkKLI6Bw9BPSqTY3LI5E43LkfcHgkqRxr3+bNUcKY9t3hgY9B887bEbhhWArf5iw=
X-Received: by 2002:a05:6870:2195:b0:25e:24b:e65b with SMTP id
 586e51a60fabf-25e2bec9856mr9419383fac.42.1720432916918; Mon, 08 Jul 2024
 03:01:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240702072510.248272-1-ebiggers@kernel.org> <20240702072510.248272-6-ebiggers@kernel.org>
In-Reply-To: <20240702072510.248272-6-ebiggers@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 8 Jul 2024 11:01:45 +0100
Message-ID: <CADrjBPqrdoDzBesV7e=paz4mj3VDnZTynjPYD6kCV=xe9aszbQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] scsi: ufs: core: Add UFSHCD_QUIRK_KEYS_IN_PRDT
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-fscrypt@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	William McVicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Eric,

On Tue, 2 Jul 2024 at 08:28, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Since the nonstandard inline encryption support on Exynos SoCs requires
> that raw cryptographic keys be copied into the PRDT, it is desirable to
> zeroize those keys after each request to keep them from being left in
> memory.  Therefore, add a quirk bit that enables the zeroization.
>
> We could instead do the zeroization unconditionally.  However, using a
> quirk bit avoids adding the zeroization overhead to standard devices.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---

Reviewed-by:  Peter Griffin <peter.griffin@linaro.org>

[..]

regards,

Peter

