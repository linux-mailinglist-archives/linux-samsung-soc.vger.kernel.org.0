Return-Path: <linux-samsung-soc+bounces-2717-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1FE789E47C
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  9 Apr 2024 22:35:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18D511C20DDF
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  9 Apr 2024 20:35:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4821586DC;
	Tue,  9 Apr 2024 20:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1GXL1JG9"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7F1158209
	for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Apr 2024 20:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712694925; cv=none; b=ggY2RHMuaD+9JUc+Jp9z7Vp7V4BhjOTmrI8xC4foe8aJLQdbVYaYUPQ3rkh3c0nZZnmgE8r88YyqKABVMasHY9RLbWumgw9DQ1KIvUbNSv4Z4g8gC99i65pFSKQf+48nshGqRZj005ZqgJpD7r/r+RAhxM9D8VyThzj2QvIRhm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712694925; c=relaxed/simple;
	bh=fZIg5v37kdpa59dSYgf0jUUNlNvt5/x5mDHHcsopdy0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PwfNm8EXBF8G/IJFUlhFhjUSqqug7TKlGMYYX9F1d5t7q1EIlS3z3EnoVkERDzQwdFS6/sE7Jjj+f/MmhlREPLjpCMld1Y/qH7oOYYIbU5FZTrmZoL3ZyGhFNTfwonOF0zHTUITjs/RGkEuSmg4VlgfD6BSnSGrrZmVFd34JdoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1GXL1JG9; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1e42a6158d5so11835ad.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Apr 2024 13:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712694923; x=1713299723; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sbzjIXGi8MY3xAo287kFRCnEJlxM2VAYg6QbjiGNyVw=;
        b=1GXL1JG9il10PRtnmWEJLy5yDYGGY6Uxuosvozq1CtR7hCoEgUSFRP25meTsDcfh/T
         twrazkt22lAR3rGT1pFLOApdSlN074hnGRTabcOA/9DI88SN0IYh7aDCnj6G2H44914G
         pYgvWaLJ2QbGZN5VVdq1CsOwgVtZKt915peJodlfQ1xU40p5hokE9lkt5p0rf9/BkmBr
         6EZqP3LDcPpXm6KHTUqgn2qLwuoCAG2jwCSz6qtdlkS9h/AQwnsdQwVyiq7Ub4OkR97J
         iunFgSm5I3vm4Nb3lVbVpsbIS5sGkspZkYVwH8BRng6udCb3bi9o1USqYpYNvRWZW28o
         B6Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712694923; x=1713299723;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbzjIXGi8MY3xAo287kFRCnEJlxM2VAYg6QbjiGNyVw=;
        b=lX1MjweIVOUffq2GU+Wuh1OT4ZS5auaYc1LstAOwlYkzgq7KGRb9kZB711aPljLpCO
         2L4QHBKqo6iiQ4HQOdh9jKu0ec+I7aEpz5e6UL6MUmzPpDOEDerXx+CI+1au9JMZnNcF
         dsuBmC7SPdVFVcqWX89S4F5g2Guco7QmvUyO3MGp8tzlI0zR23H9PI+DWjARNi1sq0F2
         ajVIYcmM2Bs/mklWRmTZA8UokoWVY8xW/CmIVKwE6sjku2oUpDfcTzYas+G9uJL3Glfo
         ENE7jxYfLXbNvp6lrnj1tr/CcDsxjQtRBOHN0sMq9G8AElM60J9SuprHfNgWJ7RobBEG
         +2kw==
X-Forwarded-Encrypted: i=1; AJvYcCXp5cENAEFC1eST2GcwSQYY02AeMuCVvQF3aPbOauX1h4E4F3IgJD1YE4T3+6ct/JvE+vdUrycobLO43YOOWmS8DlqAL9EodFCcvtEtJoEnX28=
X-Gm-Message-State: AOJu0Yx2sYj9boMlm/3tplFCyB4tSRpQpPeQDXHPI1C0ElmCavhVL1v2
	+NmOZwu2tu9E92W0Wum5WcXHbntexbjhvC1Yfz0IbwuLp3Nn37x5+PgzXMKP3A==
X-Google-Smtp-Source: AGHT+IFbAgqRaIQQnQohL03A2IR6pwfXasIyq+0yEDQ6FgLyJnqBCuWghjNFqobOCKa2d0RR48njlA==
X-Received: by 2002:a17:902:9a87:b0:1e4:32ec:7679 with SMTP id w7-20020a1709029a8700b001e432ec7679mr2786plp.19.1712694922933;
        Tue, 09 Apr 2024 13:35:22 -0700 (PDT)
Received: from google.com (201.215.168.34.bc.googleusercontent.com. [34.168.215.201])
        by smtp.gmail.com with ESMTPSA id j5-20020a170902da8500b001e424ccf438sm4564732plx.97.2024.04.09.13.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 13:35:22 -0700 (PDT)
Date: Tue, 9 Apr 2024 13:35:19 -0700
From: William McVicker <willmcvicker@google.com>
To: Peter Griffin <peter.griffin@linaro.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, vkoul@kernel.org,
	kishon@kernel.org, alim.akhtar@samsung.com, avri.altman@wdc.com,
	bvanassche@acm.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	jejb@linux.ibm.com, martin.petersen@oracle.com,
	chanho61.park@samsung.com, ebiggers@kernel.org,
	linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, tudor.ambarus@linaro.org,
	andre.draszik@linaro.org, saravanak@google.com
Subject: Re: [PATCH 15/17] scsi: ufs: host: ufs-exynos: add some pa_dbg_
 register offsets into drvdata
Message-ID: <ZhWmh1NUmj2h02Ua@google.com>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
 <20240404122559.898930-16-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240404122559.898930-16-peter.griffin@linaro.org>

On 04/04/2024, Peter Griffin wrote:
> This allows these registers to be at different offsets or not
> exist at all on some SoCs variants.
> 
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Tested-by: Will McVicker <willmcvicker@google.com>

I tested this patch series on a Pixel 6 device. I was able to successfully
mount two of the Android ext4 partitions -- efs and metadata.

  root@google-gs:~# mount | grep /dev/sda
  /dev/sda5 on /mnt/efs type ext4 (rw,relatime)
  /dev/sda8 on /mnt/metadata type ext4 (rw,relatime)

Regards,
Will

