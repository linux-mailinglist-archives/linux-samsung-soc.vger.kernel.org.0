Return-Path: <linux-samsung-soc+bounces-1628-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 19746844907
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 31 Jan 2024 21:40:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45CE21C2120D
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 31 Jan 2024 20:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF98335F18;
	Wed, 31 Jan 2024 20:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gRx4agvr"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8BC22087
	for <linux-samsung-soc@vger.kernel.org>; Wed, 31 Jan 2024 20:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706733630; cv=none; b=q5BPlGA3oOtgoV2DnXkPvcNiqyeW0VurrWVTBo4o4KgL1EOWkU2RWhSi3xLKQBvEjJkJvm6gvTAVvysmTCH5Xc5X0BQJ5tSRNmNHlR0IW03bqPXg1PRl+Jc5yYMrSUviMlyDEALEWwiwPlUXCQSsgjzqdjZdaiSKSOFWGkzGAhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706733630; c=relaxed/simple;
	bh=DJVBdAvIZoYsFk/PD+9roTQkIgqJvDOJ/jGdKfrSxys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AV5vod1hSUlnWD/INuz6P1ctpeSdz1PsGGUQ7muKWWVv3jxB8UXwg+xRk0k0q4W8Xu5qeM5X2JsN+O4TDhpYgiJ+1iAtIGmjcKvNddqqmaqyyE9P8vz4r54LE7R7LZ7Bebs1d/MpNkYczLeKe6MNV3M1v36euge9GLyxy9Vb6P0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gRx4agvr; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1d5ce88b51cso42895ad.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 31 Jan 2024 12:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706733628; x=1707338428; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kU4YgSiD3upkHqtgFDQ2Dx1llBcFINJR/fxen+WKHRM=;
        b=gRx4agvrfTNdJAC4DVMVluI0QGJ5IOJQw1Vjgb6/2QmK0CURuZ9kF9t9hQG9HkFFX+
         OpbERC99SnwRLu62Y9IQ7gTqx6AwIFHpPur0ze7MB+Q8ePoNhoJXlCZfyehfL0FD2aAc
         nGgWV/C/T8L/IPuNT5J+uElvw/oNuE7uyvE/imYxy0V6zWe24soEaedNMRhUSBwxCxnV
         CGlPvLin8Dg3pUqGF12Dye9miGNFonDafntkFVNJbYpNcagl4gFfWGbCSQCASOS666uf
         eAyXSfoJEEqMwf7ufMH4D898myj1MOrecHZ/rGbbIeuiFhOxGgLwwQdMu1bMgjeLLwzw
         WoDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706733628; x=1707338428;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kU4YgSiD3upkHqtgFDQ2Dx1llBcFINJR/fxen+WKHRM=;
        b=ahUMYC5F+CCENHwPvg5IJEkHBk9mmvxyNC3TgXvg2hKGFU8xvqYT/ybRFfvNPUycgS
         iTVaDAOe2nw3oNX0SchNRoRUGn1KwUIwiFeW8UhFF/qhOj0Cga76lrTCHktF4b2RB2PP
         gvN3Egnq9ZBQhOd8sRIXSHsrJCSNLgishscAMeIrz2ANW2Oay4xM47HRB5xh54oAj6ef
         aIQ03X+zvai2ex/iENsyozSAPrD0OsY08DVm8+yQjSljoDe2WFpMDFd06WjbFk5Xdv/Y
         qsJcVLLlmUCVUlnZeSH+z4v4t29u9TiqFPLsKaZtge/EgcjyYFqt3l9gX2nZIOBjuSKe
         xrOg==
X-Gm-Message-State: AOJu0YzHPAzFy873uo6xyLmBf8WTEIxlYz++mR1E83GmstPRP1XyZ4tU
	EGn6db5IbZiHYvmp1wBq8brA2QBQFThJ5D1JPTFmZmiCJF50OEwTlaMgD9HMGQ==
X-Google-Smtp-Source: AGHT+IE8JDW6cmjtkcuqkNWtjhotrYww4lpIUfSL247EMiN6Fpdc5IY02gFACJ8x+SufzSA45BnJNQ==
X-Received: by 2002:a17:902:c643:b0:1d8:ffbe:82d0 with SMTP id s3-20020a170902c64300b001d8ffbe82d0mr61161pls.12.1706733628126;
        Wed, 31 Jan 2024 12:40:28 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVLs69w31bi/Uo8ob8CB6NrDyhxo1gpXRC+kzNsnUNj3U0KghkgIJ8JohP8D0UINvEpLtb2UUDkOlN+oZDw8AoANCYfKImzfwRHb+efaRpcjTlr9k1zPb39F1HGpbhHNc94RvBQyMTCGj8jSZUO9f2zxl4LWE27458pCt+YtSYxnJefFqj8O/rV66iJJeEAlA3x8c0vn0z/nv1/JsMZGG7ksE1CKrQslrrqK1uwdbBxSkFnOcrCPDOuYLesYB0qFK97bRilvCT1Th/xabF6neww068PU1KIIlQxt+U9S4627Qq9ERrgWp1dcqp525jpIRQj4bHUwsl6O1yPOS4bprnuOYogamT+gSG0lAyEF+LwckxjRMn/syx85/IxAklFHXdSRg1kY01P3lfL90eP5p0kFOXGpkdhqyEPW4R8fOO+q72+5t3ewQn+gjGFUHPXxwZFqeIfrtzNx0XEE29PZa5kja0Z264=
Received: from google.com (69.8.247.35.bc.googleusercontent.com. [35.247.8.69])
        by smtp.gmail.com with ESMTPSA id x30-20020a056a00189e00b006dcba485ef6sm10217220pfh.111.2024.01.31.12.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 12:40:27 -0800 (PST)
Date: Wed, 31 Jan 2024 12:40:24 -0800
From: William McVicker <willmcvicker@google.com>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com,
	tudor.ambarus@linaro.org, semen.protsenko@linaro.org,
	alim.akhtar@samsung.com, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: exynos: gs101: add stable i2c aliases for
 gs101-oriole
Message-ID: <ZbqwOKSsGWB9QREM@google.com>
References: <20240130233700.2287442-1-andre.draszik@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240130233700.2287442-1-andre.draszik@linaro.org>

Hi Andre,

On 01/30/2024, Andr� Draszik wrote:
> Now that we have more than i2c interface, add aliases to ensure
> deterministic bus number assignment.
> 
> So as to keep compatibility with existing Pixel userspace builds, use
> the same bus numbers for hsi2c_8 and hsi2c_12 as the downstream
> drivers with the intention to eventually add all the earlier busses as
> well.
> 
> Suggested-by: Will McVicker <willmcvicker@google.com>
> Signed-off-by: Andr� Draszik <andre.draszik@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

> 
> ---
> Note, this patch should only be applied after series
> "[PATCH v3 0/7] gs101 oriole: peripheral block 1 (peric1) and i2c12 support"
> https://lore.kernel.org/all/20240129174703.1175426-1-andre.draszik@linaro.org/
> ---
>  arch/arm64/boot/dts/exynos/google/gs101-oriole.dts | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> index 6ccade2c8cb4..23314ed78c96 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> @@ -18,6 +18,8 @@ / {
>  	compatible = "google,gs101-oriole", "google,gs101";
>  
>  	aliases {
> +		i2c7 = &hsi2c_8;
> +		i2c8 = &hsi2c_12;
>  		serial0 = &serial_0;
>  	};
>  
> -- 
> 2.43.0.429.g432eaa2c6b-goog
> 

I verified this works on my device:

  # ls -l /sys/bus/i2c/devices/
  total 0
  <snip> 7-0050 -> ../../../devices/platform/soc@0/109700c0.usi/10970000.i2c/i2c-7/7-0050
  <snip> i2c-7 -> ../../../devices/platform/soc@0/109700c0.usi/10970000.i2c/i2c-7
  <snip> i2c-8 -> ../../../devices/platform/soc@0/10d500c0.usi/10d50000.i2c/i2c-8


Thanks,
Will

