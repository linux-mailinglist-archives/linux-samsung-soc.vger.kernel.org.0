Return-Path: <linux-samsung-soc+bounces-3735-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D970A92B6E9
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  9 Jul 2024 13:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9174F281D7E
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  9 Jul 2024 11:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F281555E4C;
	Tue,  9 Jul 2024 11:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wgpqyzm5"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5534D15534D
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Jul 2024 11:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720523886; cv=none; b=h3zhxOUH/XU6a7bgRak518wf5UCYtnAc+u4an0hwNiouWF0kwRaR0VzwDnGXOlQEJ6bgjLwfcnsEr4SIK3Lh7qDF3s6NY+DPuPcWcIeTaTNFbiqa+YOmZQI+USo3otKIpWcZvbug4UOu8zQB/529/ylHvE4wvQeFMK0TtGN75Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720523886; c=relaxed/simple;
	bh=q4IZnwro1hysVr+IKysyM+k1ocYPSAwKdXkEuBCYQgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pw+up/EkBVvx6o0up7HplnL/FLeySrCKkeYGQAaGZkiIYdN8xxqxyBU2rfoyMbAgrmdGslAk0AY/maSnFVDLVWtOrBAJ1U1hJoP9tuotYgz6SFzbXQyYxPHv+ZNRM9JlJ1Mn5XGxila0jET+2Vwz9uULM4xGdPHi5o/jrS2Bapk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wgpqyzm5; arc=none smtp.client-ip=209.85.161.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5c66909738fso1219088eaf.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Jul 2024 04:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720523884; x=1721128684; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/kYqs1Q+xI1eSls+p+PjTZV9wRnUsY1aUqXWiCZsXW4=;
        b=wgpqyzm5uc0nEdrlRqzzE/1SKmc7N6Aij23eWD7uOQCP//TKxO4jkzQa3qtdjjHyKc
         8DMgdCLt55McWVev+PmlXfcBszHBacVzuQbKHFkh2FikIJF+iAQBaiMffDr8ywXs9I8s
         zvKow8P7hHF9ijep8anf2ouI2QdEYEER1r6hu0TpKchjfDykkon37Kyw1F3nvwyaSRwp
         oghe2xrlr/GiSN3HebbeHtyPTeh43D0d6aL9a5KWRW5J5Z3AmTcVObAqV/YJ6YrDgaHF
         SwvhxP7fI5kZbGWmwtKXOcWTdJdCjwrmpmjb6FK0V00ZzZ4yNWx+UVqv5lx+mDAKObdb
         lqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720523884; x=1721128684;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/kYqs1Q+xI1eSls+p+PjTZV9wRnUsY1aUqXWiCZsXW4=;
        b=lCkBON+UBOTlJ+UV6JSSpK2dbFqSvH84dMWpRA8kSDgkOsNsHfRyjfxHRFkxVRrVS5
         FqL+ofI99USbv6hEqjIimoyrEL7zQwsLCxQKkrHXl7OCSVwpYRCPFL47Tnd2gSNUP5NN
         g+lNRQD0fZq/m0YfaL/wRCP/deRWj+uOhG3Uq9f5rf1UK1ReWdE46hDVMlXRd1MnUrzV
         zMnhTfONXABHOv5NQZK764JmoaRsQRHLU0JE6B9v4AtZjTCpP+vV88sjxvTg1ryTJjRh
         vPpJpBKW4o3c6B+MdUpBZh8SMTzJng3XIXtri7y3LwEn52MDfoNWFPHX8yErRNCDUQS5
         jPyw==
X-Forwarded-Encrypted: i=1; AJvYcCV1DNkRlBloIedm3VvltAbV7SoM/oa4oove5zDZseIXjX4qXCas3HAQ8Lbi46Trjga5ywHuHfRN/szUF8zjAPmKsox46eRxvkmybSTgap4k5Wg=
X-Gm-Message-State: AOJu0Yw5wfrJTCE8j8klkbg6knC/Divzo2YJyjn7uNWK1RTWtwlrzEJc
	k3x6I1JxmEBArac8ONo3G/JCZS3adAK/3yVrJEPT/QoGESnY6JetZGyH9EzMnBLHXeZZQd0pO78
	JFfIgDu83JlEyYOZ7HZNiDjfSom2LR26JAIPbZcu49qk6v4PmzII=
X-Google-Smtp-Source: AGHT+IEQ9kzUHbR1gBbXXP7izJdEFiG4U52pBXGa8KT7QcUkwLTd1MGDwwCyxR5oZ7xdLEiq7TCBKMzfOJTI2/fJdRA=
X-Received: by 2002:a05:6870:3288:b0:25e:fca:e689 with SMTP id
 586e51a60fabf-25eaf94c51emr846195fac.10.1720523884328; Tue, 09 Jul 2024
 04:18:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240708235330.103590-1-ebiggers@kernel.org> <20240708235330.103590-7-ebiggers@kernel.org>
In-Reply-To: <20240708235330.103590-7-ebiggers@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 9 Jul 2024 12:17:53 +0100
Message-ID: <CADrjBPq4sEamwD3+wT2p481en-J2Ee7G0f+UbXG3g3RqUMiv3w@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] scsi: ufs: exynos: Add support for Flash Memory
 Protector (FMP)
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-fscrypt@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	William McVicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Eric,

On Tue, 9 Jul 2024 at 00:55, Eric Biggers <ebiggers@kernel.org> wrote:
>
> From: Eric Biggers <ebiggers@google.com>
>
> Add support for Flash Memory Protector (FMP), which is the inline
> encryption hardware on Exynos and Exynos-based SoCs.
>
> Specifically, add support for the "traditional FMP mode" that works on
> many Exynos-based SoCs including gs101.  This is the mode that uses
> "software keys" and is compatible with the upstream kernel's existing
> inline encryption framework in the block and filesystem layers.  I plan
> to add support for the wrapped key support on gs101 at a later time.
>
> Tested on gs101 (specifically Pixel 6) by running the 'encrypt' group of
> xfstests on a filesystem mounted with the 'inlinecrypt' mount option.
>
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

and

Tested-by: Peter Griffin <peter.griffin@linaro.org>

Tested by running the encrypt group of xfstests on my Pixel 6, using
the Yocto development env described here
https://git.codelinaro.org/linaro/googlelt/pixelscripts

Notes on testing, in addition to above README.

1. Enabled following additional kernel configs gs101_config.fragment
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_INLINE_CRYPT=y
CONFIG_SCSI_UFS_CRYPTO=y
CONFIG_BLK_INLINE_ENCRYPTION=y
CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK=y
CONFIG_CRYPTO_HCTR2=y

2. Add meta-security layer to bblayers.conf and relevant packages to local.conf
BBLAYERS += "/yocto-builds/yocto/meta-security"
IMAGE_INSTALL:append = " xfstests ecryptfs-utils fscryptctl keyutils
cryptmount "

3. Rebuild/reflash Yocto rootfs

bitbake virtual/kernel core-image-full-cmdline
fastboot flash userdata core-image-full-cmdline-google-gs.rootfs.ext4

4. On the device ran the following

mkfs.ext4 -O encrypt /dev/sda26
mkfs.ext4 -O encrypt /dev/sda20
mkdir -p /mnt/scratchdev
mkdir -p /mnt/testdev
mount /dev/sda20 -o inlinecrypt /mnt/testdev
mount /dev/sda26 -o inlinecrypt /mnt/scratchdev
export TEST_DEV=/dev/sda20
export TEST_DIR=/mnt/testdev
export SCRATCH_DEV=/dev/sda26
export SCRATCH_MNT=/mnt/scratchdev
cd /usr/xfstests
check -g encrypt

All 28 tests passed

<snip>
Ran: ext4/024 generic/395 generic/396 generic/397 generic/398
generic/399 generic/419 generic/421 generic/429 generic/435
generic/440 generic/548 generic/549 generic/550 generic/576
generic/580 gener9
Not run: generic/399 generic/550 generic/576 generic/584 generic/613
Passed all 28 tests

kind regards,

Peter

[..]

