Return-Path: <linux-samsung-soc+bounces-10699-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC7DB41ED8
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  3 Sep 2025 14:23:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CCBC3A3F91
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  3 Sep 2025 12:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 145D527A916;
	Wed,  3 Sep 2025 12:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="ME4IxtqY"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDA32E7F20
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Sep 2025 12:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756902235; cv=none; b=G9kiOcjXU3rvnHRmMvfAkCpERGSkloh5orQI0ZYcyzUIqN6kqNPfaF4qiuL+DGMK4htJlYwBG+gMH1QBN+r7JPp4Z50v5RSEi7yWbYAYNWWSA5IfolIw+YtjfylghcHQxfKGjtJHfynw6d0ipnnrLdwMdtdqap646LSgNhB0g78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756902235; c=relaxed/simple;
	bh=IOTbcYwoFyQaIRv47aJvA/ATOIBrIIjZbIeEHBJYZgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=doVf4ouAzGeCssZgT8LjxSkAxFhnIR9ozFDnXXZpbfNL7G4YPUscwlUXO4mNMa2IZLnV36s/qnDyK7uJd9HY9GhWxar3vraPc6F/FiBRJRLJADOaKqGkC9yFL6X1tfETA/3M/0QfBGoMyKGusgsBKyQ+gQW1NkbNgZg8pUJ0wB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=ME4IxtqY; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9E4DF4E40BFA
	for <linux-samsung-soc@vger.kernel.org>; Wed,  3 Sep 2025 12:23:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6CEA1606C3;
	Wed,  3 Sep 2025 12:23:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 353941C228A5D;
	Wed,  3 Sep 2025 14:23:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756902228; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=YumEJQKSlit0DjdeGbyizHywaHYlUT5ic7rTLQ6f/ZI=;
	b=ME4IxtqY4zsA7nARb5WTtl/57ejoK707NoScjwGP8BjdNjLqBWTBbcsJnGgGTD2/QLqllY
	IpuLP+RCXQuA+980APJpCicHcygVXaOazGdR+v5ZcGezBekFDLkpIwHiQccijqFiRLztNb
	j+AjWQ3s7X7WWpaCKf2kX8BP2IJS/LknssX+FhDjckW1emX/HRQp9OYQkpAeT6Xh6fMWHX
	VOht6KPTL7XQMwWerrED25vhQVSewbM++XggxIxlodm9CCsalY7B9dpMn3+VcbltBy0K6x
	HhgsW0OTFAx0BkHuQSQoTaalcCKYJD4fzQc0N1ltyu21zUXnU0k0JgfsGWyZcw==
Date: Wed, 3 Sep 2025 14:23:42 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Devang Tailor <dev.tailor@samsung.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	alim.akhtar@samsung.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, faraz.ata@samsung.com
Subject: Re: [PATCH v2 0/3] On-chip RTC support for ExynosAutov9
Message-ID: <20250903122342a2996825@mail.local>
References: <CGME20250710082533epcas5p111be26bea2ccc08718eebcb12929bbbf@epcas5p1.samsung.com>
 <20250710083434.1821671-1-dev.tailor@samsung.com>
 <000001dc1cc7$6bfee9d0$43fcbd70$@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000001dc1cc7$6bfee9d0$43fcbd70$@samsung.com>
X-Last-TLS-Session-Version: TLSv1.3

On 03/09/2025 17:09:32+0530, Devang Tailor wrote:
> 
> Hi,
> 
> 
> > -----Original Message-----
> > From: Devang Tailor <dev.tailor@samsung.com>
> > Sent: 10 July 2025 14:05
> > To: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > alim.akhtar@samsung.com; alexandre.belloni@bootlin.com;
> > devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
> > samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org; linux-
> > rtc@vger.kernel.org; faraz.ata@samsung.com
> > Cc: Devang Tailor <dev.tailor@samsung.com>
> > Subject: [PATCH v2 0/3] On-chip RTC support for ExynosAutov9
> > 
> > Enable on-chip RTC support. The on-chip RTC of this SoC is similar to the
> > previous versions of Samsung SoC. So re-use the existing RTC driver with
> > applicable call-backs for initialization and IRQ handling.
> > Add a separate call-back for disabling RTC since existing '.disable'
> > call-backs updates additional bit not valid for RTC of ExynosAutov9.
> > 
> > Setting and getting hardware clock has been tested using 'hwclock'
> > and 'date' utilities.
> > 
> > Alarm interrupt has been checked with incrementing interrupt count via "cat
> > /proc/interrupts | grep rtc" for 10sec wakeup time via "echo +10 >
> > /sys/class/rtc/rtc0/wakealarm"
> > 
> > changelog
> > ---
> > Changes in v2:
> > - Fixed the review comment of v1 for mis-aligmnent & asymmetry bit logic.
> > - link for v1 : https://lore.kernel.org/linux-rtc/20250702052426.2404256-1-
> > dev.tailor@samsung.com/
> > 
> 
> Reminder!
> Can you please help to identify if anything is pending in this patch series ? I see all three patches are reviewed.
> 

You have actions after those reviews:

https://lore.kernel.org/all/20250711-shapeless-adorable-lobster-d2efbf@krzk-bin/

> > 
> > Devang Tailor (3):
> >   dt-bindings: rtc: s3c-rtc: add compatible for exynosautov9
> >   rtc: s3c: support for exynosautov9 on-chip RTC
> >   arm64: dts: exynosautov9: add RTC DT node
> > 
> >  .../devicetree/bindings/rtc/s3c-rtc.yaml       |  1 +
> >  .../boot/dts/exynos/exynosautov9-sadk.dts      |  4 ++++
> >  arch/arm64/boot/dts/exynos/exynosautov9.dtsi   | 10 ++++++++++
> >  drivers/rtc/rtc-s3c.c                          | 18 ++++++++++++++++++
> >  4 files changed, 33 insertions(+)
> > 
> > 
> > base-commit: 58ba80c4740212c29a1cf9b48f588e60a7612209
> > --
> > 2.34.1
> 
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

