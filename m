Return-Path: <linux-samsung-soc+bounces-6880-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C31C9A38C98
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 17 Feb 2025 20:42:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E7C917139C
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 17 Feb 2025 19:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AAAE2376EA;
	Mon, 17 Feb 2025 19:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="lV84h0Em"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0B722B5A3
	for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Feb 2025 19:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739821337; cv=none; b=Xj2FQWU460J0vJSdCvxJFXSiQpCqWevteM4a4yFRqx7YDj4GSD8sQkV9QnBVwlfPSkgauCU9bSnOfbg6t8l9LPLt5gOTRKI3xODPVWYcqepoupBhoy37NcY30YJTgQqQ3H/41L3YZtcYXSYIF41eIJ8wpVSHpG5iA2FcLD2eeg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739821337; c=relaxed/simple;
	bh=yYX/SR79Dqqvmyu22HwNz7TvqcDwF99ty5EMBfajVJ8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=o49YTqrTy4KRrgn5xEqM6nIo/92RqelImi31i4KTKvEJFWpBqNdWzT+UtUtaOnk77IlX3it46eabCXA++woa9Gjc6Sriw25EpghsZxJ29SLFii+mXtrGWSDRw2UbndM+8BA7w/T3wYONwS7v9LoSjoTAUulo/i/NnHdZY9mrRxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=lV84h0Em; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=lV84h0Em5ss0x1cbUHkV9HfjfNbc7ITWw815Cn+d5bkyDMCBn1w8amYBUCiORLxa/A3A7DKFELl9AjTM2c56k8sRH0lTWKWVvPamC3tNTp4hN85EAzjX/X0Ljr3o0P6N6A1mQ8L/vqp6klsd57+6q4zo0dVvK5cJAxxG7PNyAJPsBPaNQMiTx/zeeEHWrMOzoCm1Ql30ALtXwiC0enryFJh6a8YVGHKL1iXeUbHTMXb1V3i4IBmEiJFvPiXe5WHDnpSFTwVgARsgcRjjcn1z7Nj0K8aK4ssNenRZntLdeJnhiPQSfT7JM34rBw6rRpZS0AQ3rUikmPAHlBvNL7jDMQ==; s=purelymail3; d=purelymail.com; v=1; bh=yYX/SR79Dqqvmyu22HwNz7TvqcDwF99ty5EMBfajVJ8=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-samsung-soc@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1182872981;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 17 Feb 2025 19:41:34 +0000 (UTC)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Feb 2025 20:41:32 +0100
Message-Id: <D7UZ6BSEU6DD.2QRKZBTKMPD9F@mentallysanemainliners.org>
Cc: "Krzysztof Kozlowski" <krzk@kernel.org>,
 <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH 0/2] watchdog: Exynos990 WDT enablement
From: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
To: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>, "Wim Van
 Sebroeck" <wim@linux-watchdog.org>, "Guenter Roeck" <linux@roeck-us.net>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>
X-Mailer: aerc 0.20.0
References: <20250217-exynos990-wdt-v1-0-9b49df5256b0@mentallysanemainliners.org>
In-Reply-To: <20250217-exynos990-wdt-v1-0-9b49df5256b0@mentallysanemainliners.org>

On Mon Feb 17, 2025 at 8:05 PM CET, Igor Belwon wrote:
> Hi all!
> This series enables the two clusters of the Exynos990 watchdog timer
> to be used. Weirdly enough, this SoC is missing the cl1 cluster, it has
> the cl0 cluster and then jumps over to cl2. As such, new cluster index
> code has been added to accomodate this oddity.
>
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
> Igor Belwon (2):
>       dt-bindings: watchdog: samsung-wdt: Add exynos990-wdt compatible
>       watchdog: s3c2410_wdt: Add exynos990-wdt compatible data
>
>  .../devicetree/bindings/watchdog/samsung-wdt.yaml  |  9 +++--
>  drivers/watchdog/s3c2410_wdt.c                     | 39 ++++++++++++++++=
+++++-
>  2 files changed, 44 insertions(+), 4 deletions(-)
> ---
> base-commit: 253c82b3a2cec22bf9db65645f934fbe095899a3
> change-id: 20250217-exynos990-wdt-0e9100ec5f99
>
> Best regards,

Please ignore this patchset. I did not test the bindings with my device
tree changes - as such, I did not account for the cluster-index being
more than 1. I will send a fixed v2 shortly. My apologies.

