Return-Path: <linux-samsung-soc+bounces-6381-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 478A3A13808
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 16 Jan 2025 11:35:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 714241889072
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 16 Jan 2025 10:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0A61990B7;
	Thu, 16 Jan 2025 10:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HqHF9F/G"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43441DDC0B
	for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jan 2025 10:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737023742; cv=none; b=bqjuJq7ezS5uQmEUefhvoYAjty2KrXIyewBuDdVk9Po9pwbOiicdQLmeUweoQpAIrJ/EOjQwB7ZTLOT6UV9GPxoKYU3s9CDM6E+6VOlu8+67wpg/HX8wWDf7ZILJMoLbiuqmvb8qbPh78LZTGsLDBaGovJC+85SSUCjQabdnNXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737023742; c=relaxed/simple;
	bh=6DNeYuaaCEB0QmL3/61d3YZghnfgrzyOqtsXzdxA9lg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jRPsmC/g53q/FBUbE5tC8luyHRIxFzdTdXl9NhTYiEngisPJ58ci4Vj2Z3a17rdYaXyeS3euOjOp6q6dl9Xd3LIByKr+yH5lYPAi5v75zSn7b4vXygM8j7Fsxcke7yMGEeJsj5eehSnJdy+Yq8VknE0SW3u8+qrTp3q2jtebsTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HqHF9F/G; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53e3a227b82so807161e87.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jan 2025 02:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737023739; x=1737628539; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gprmJm/Cl6p6869D60XQ3XjbtrOWLJEOxZITgqe2J5o=;
        b=HqHF9F/Go7BA24+9BcueD0XVMMvTvDq+J44+b7vfGADW5tpGa/4t+v9PQYkLyJ7LS5
         I5NTgAsY2nEYR0j3sqD5FPuOmH/8wcG8NJuA4MPptVSw8m5Y86mgZb3KIKQ5qsUSU5nc
         3/9bCOcbgHpzrOo5uAp4rzYofLkjRIFysY/p6S1pR2AGHnm1BFPBO45WcDCRgUxCMY+d
         XUrPa2H9K5v0F3YZ2HGQY14qq1RHWC01KNLbe6ELLL16xSWgSxWZ1xaloo95l8E19vDv
         LxLqCg6aE49TDSH6FHPe/0a6hRaej+LhIowvPqtUrRJa5Kv3ywpCrSx54hcEz7qp+s08
         S3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737023739; x=1737628539;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gprmJm/Cl6p6869D60XQ3XjbtrOWLJEOxZITgqe2J5o=;
        b=uGF1mKGYs3lMPiCMrbiCBHWKtwUa142L2915Umn1mbZNeuioJnA1p+3pUoomDWB0vu
         GllkSXFU6kTN9PGrFJGUgAH9EfeUGhHy4JdCNm+t0wQ4mwIUbwyUTNLhLlntNreQdDV2
         U1m3PuMxYgOHpqpH8jXiFTCQygNT7z+pmXfatoVw9Du3IpJSHA8UiCS3sJi3gfvIGQPT
         kszqP8ldkWkqwyR7+ScTO1S7Tbhu9s5qbWP4OivaW6yO6CZZvxKemyv3R8i02U8MA8Wc
         Vf6+bU7zL+RmBSlq5bR9z2eDiFqkbYcNR4u7LW1SoWERV6+xINR+RxgLyLyMjpD5nDLs
         QoRw==
X-Forwarded-Encrypted: i=1; AJvYcCX5hzBBFd/WYY4mo2Vf7qOlFSphbHkMza1bkR/a+DNye4rl+UL1MmEV6oSrUr6jBCnT7fjKKd7fi2GTGhVjFCsFdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFrA+GT9a7CUROfum5/U3+DAe9tay3D9oQFjSwLZ1YCQaBk8F1
	e8VJzCNPvEsRJVsCxgBBNoowz+zD1wR+JFphLtkOx2+M3uBDiRgRTEPwtF7gBVo=
X-Gm-Gg: ASbGncvyTTqqz33V/OOd/jt7jeVH/ohc8bGnExV3q02IQthWur6r1VDuCVxqYTGwtYw
	HPkcuW+JPhiNM84NAoojJ7oSzK2TnqLWZDVXsxPVp3dm3L4HyGfwtMFXAKmTHR90o1pXSxfujmi
	8ZSdLRKXcBidI1M5l8jVDfV9HyLk5/MvLutWi7OoUuPz5fw9R1GnhBCC6/jY/pf6OI46w4RYYCZ
	pjMqf78hWij+R235lwfyYLGz+pD8d9LauytyWTFtVVk2Gi9BgeYykeSKJ6j85p3bFDtlR4Lxh3n
	GTYegBuEGL3kZ1OBcX2hRvKSo/7b1czg0pee
X-Google-Smtp-Source: AGHT+IH3G1Mnr8k23AF5/dIs7iAuJyOHJCwOMDmvWc4umnN+swRWG+FLBCp9QsFSdvm1xDWFrQeEdg==
X-Received: by 2002:a05:6512:3d27:b0:540:20a9:9ab5 with SMTP id 2adb3069b0e04-54284824476mr9777793e87.50.1737023738809;
        Thu, 16 Jan 2025 02:35:38 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be49d6esm2261466e87.50.2025.01.16.02.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 02:35:37 -0800 (PST)
Date: Thu, 16 Jan 2025 12:35:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org, 
	virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Andy Yan <andyshrk@163.com>, Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <xz5ncq67bgmdase2jg3cfvyaxpiwhol2eqpfzow6dqpauvslo5@2w3rw27lhnxo>
References: <f3ba05c7-6e49-4641-a3f9-ba418ebdb7c3@ideasonboard.com>
 <c6735280-7c32-4319-8ca9-a7305d8117c3@suse.de>
 <d67adb03-5cd0-4ac9-af58-cf4446dacee3@ideasonboard.com>
 <0ea6be58-0e04-4172-87cd-064a3e4a43bc@suse.de>
 <f35cb350-6be9-48ca-ad7e-e9dd418281d5@ideasonboard.com>
 <4af0b6a7-c16a-4187-bbf5-365a9c86de21@suse.de>
 <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
 <a2bbeb47-2569-4ee0-9265-92bab139bdc6@suse.de>
 <f3833771-fcd7-45dc-9019-1525fef34429@ideasonboard.com>
 <CAMuHMdXxYa+Na3XxpLTy=-eUL_zQ9kAiUKYu-E04u3KWApusSA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdXxYa+Na3XxpLTy=-eUL_zQ9kAiUKYu-E04u3KWApusSA@mail.gmail.com>

On Thu, Jan 16, 2025 at 11:17:50AM +0100, Geert Uytterhoeven wrote:
> On Thu, Jan 16, 2025 at 11:03 AM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
> > On 16/01/2025 10:09, Thomas Zimmermann wrote:
> > > Am 15.01.25 um 15:20 schrieb Tomi Valkeinen:
> > > [...]
> > >>
> > >> My point is that we have the current UAPI, and we have userspace using
> > >> it, but we don't have clear rules what the ioctl does with specific
> > >> parameters, and we don't document how it has to be used.
> > >>
> > >> Perhaps the situation is bad, and all we can really say is that
> > >> CREATE_DUMB only works for use with simple RGB formats, and the
> > >> behavior for all other formats is platform specific. But I think even
> > >> that would be valuable in the UAPI docs.
> > >
> > > To be honest, I would not want to specify behavior for anything but the
> > > linear RGB formats. If anything, I'd take Daniel's reply mail for
> > > documentation as-is. Anyone stretching the UAPI beyond RGB is on their own.
> > >
> > >> Thinking about this, I wonder if this change is good for omapdrm or
> > >> xilinx (probably other platforms too that support non-simple non-RGB
> > >> formats via dumb buffers): without this patch, in both drivers, the
> > >> pitch calculations just take the bpp as bit-per-pixels, align it up,
> > >> and that's it.
> > >>
> > >> With this patch we end up using drm_driver_color_mode_format(), and
> > >> aligning buffers according to RGB formats figured out via heuristics.
> > >> It does happen to work, for the formats I tested, but it sounds like
> > >> something that might easily not work, as it's doing adjustments based
> > >> on wrong format.
> > >>
> > >> Should we have another version of drm_mode_size_dumb() which just
> > >> calculates using the bpp, without the drm_driver_color_mode_format()
> > >> path? Or does the drm_driver_color_mode_format() path provide some
> > >> value for the drivers that do not currently do anything similar?
> > >
> > > With the RGB-only rule, using drm_driver_color_mode_format() makes
> > > sense. It aligns dumb buffers and video=, provides error checking, and
> > > overall harmonizes code. The fallback is only required because of the
> > > existing odd cases that already bend the UAPI's rules.
> >
> > I have to disagree here.
> >
> > On the platforms I have been using (omap, tidss, xilinx, rcar) the dumb
> > buffers are the only buffers you can get from the DRM driver. The dumb
> > buffers have been used to allocate linear and multiplanar YUV buffers
> > for a very long time on those platforms.
> >
> > I tried to look around, but I did not find any mentions that CREATE_DUMB
> > should only be used for RGB buffers. Is anyone outside the core
> > developers even aware of it?
> >
> > If we don't use dumb buffers there, where do we get the buffers? Maybe
> > from a v4l2 device or from a gpu device, but often you don't have those.
> > DMA_HEAP is there, of course.
> 
> Why can't there be a variant that takes a proper fourcc format instead of
> an imprecise bpp value?

Backwards compatibility. We can add an IOCTL for YUV / etc. But
userspace must be able to continue allocating YUV buffers through
CREATE_DUMB.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
With best wishes
Dmitry

