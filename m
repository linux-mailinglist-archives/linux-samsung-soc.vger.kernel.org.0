Return-Path: <linux-samsung-soc+bounces-3327-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD586904E6C
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 12 Jun 2024 10:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD12F1C22A61
	for <lists+linux-samsung-soc@lfdr.de>; Wed, 12 Jun 2024 08:47:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AF9616D9A7;
	Wed, 12 Jun 2024 08:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="H22nylHd"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE5A16D4E3
	for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2024 08:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718182045; cv=none; b=nV51TnsEJFtEznXx+HkTJE/52d47PfpckNw7CQLH+fVEnXais/DBMWQiRLPNOR3IPPE6ESRl6SngV8XdiN3a9MujocW/WSVNpk8swRrmSnug8hgS37k6zbIe3/nzm7VuGUIocC1NRmtd785jWgoZiQjPSVOazlZk8ZECRa/RPqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718182045; c=relaxed/simple;
	bh=thEY5o/ShqkcdWv9f38FwQGucHRsZQowS1ike3Px+EU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QvoyrbLgXd2Z1PnAWO1+wDxZvYvaN1nY845qgSxsqAIhEQBVWl3tJl/QZDywO4ZyQqz+DVnXut9rTjCa9gWuGnqyVEPmGHkqeGPOdttbDKVijvfanFVty8I8yTsaLEHUc4LTFMhIezZ5LGorCL/qidepNu0eXj4cbBjKk/wjxK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=H22nylHd; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-35f090093d8so3748851f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2024 01:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718182042; x=1718786842; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpYxsqepRZpn/4oxNpupSBAJdfrKtBfgkfp6t0rsS5g=;
        b=H22nylHd2+1k7I9MAfh0w+tRHiz7xiNXxRCFJiVuORvYH5SFjAoHkjdngaH7B5yERn
         cQmgOoN31+7IV4df4Ef35rbNFy4aUOxZB7MZCWoLqHh9Pq1kAKfA0jHueSGzI9U36Sfi
         THpzPHn4Ns8B8d6jmpkKSzdPEWEuZTjDy+8cUmxEDodI0IJxXDW7nRuxjtINN35d/m6o
         +KDIklvLdjn5lg9YIhdtKcGSFKZZtQv1kJDUDKjJL5FN8jqfXvJuvJsLSiFJ4Si5duyf
         hHBX8nhmet8jJSYmGpZjgkZ6j6N3da83ghPbiKN2u3p67Fuh79C8r8g55ZXU2BkkyNFO
         ILKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718182042; x=1718786842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hpYxsqepRZpn/4oxNpupSBAJdfrKtBfgkfp6t0rsS5g=;
        b=vFYdgz5dZSbGNQfxq7hA/NYkYFS42oUKoHdeK26GnK9kxBRPDfYXv3cCpvSBfiLt65
         rDFsNjzUosfT7N6GJS9FVq0UXgGFxjYhn1+TM7ELHCmGbCiGhgeYcY8AohVWgCjzU4PK
         M+gzPT7n+rnKGdLgUvO1hRXA8JbeYJk3dBp2Hb1AguE5jn7aOBR2NCKncws/OlFRxkDg
         yZCVyqlU0uMi7saMB9e1BUkqNry4bHDjLU+skqG8mazTigLSbUdnK+01fue11eW1N2PX
         OklppwiZK1jTpbi4XGO1+h/Ihjsa1pDf86w81nOs1/Sdd52plGi3MIlzc9CDThySK/pM
         TOpA==
X-Forwarded-Encrypted: i=1; AJvYcCUp2tEguMi2MsGOkNeq8Y/TgpVTaUY6hiemPsySRd0c/z/6Gz6OSEakasFyzFEzibuBGj4wjBbPIKtARVKh9d8bp6qPY2rKB0kB9Cmk0GFuAZo=
X-Gm-Message-State: AOJu0YzDd7RGyynHm74vWy1KWBGlQKJeOc7QRwELX/MvdXQ6bHKsOATh
	Onn6s+roRlABgn1EtnyWIHYvCI7VU7cBQQkZRvVUpQ3YG1fHViJ7y/JFy2K2FyDxSpzaOCAo01K
	VPr/AGycNNcJQyLqrpbyEhl5l3zibTcS+mg9RB+7PBUA5TmoN1W4=
X-Google-Smtp-Source: AGHT+IGKboPzIxB9BeyAEWGYtdD8T8bNkpToXsBx4DoZghmZUY5/VvCBH45JS7ImHQeNexbYdraUIv+ahM0YJb35NXg=
X-Received: by 2002:a50:96cf:0:b0:57c:4867:6738 with SMTP id
 4fb4d7f45d1cf-57ca973f532mr916036a12.2.1718182021586; Wed, 12 Jun 2024
 01:47:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240507-samsung-usb-phy-fixes-v1-0-4ccba5afa7cc@linaro.org> <20240507-samsung-usb-phy-fixes-v1-3-4ccba5afa7cc@linaro.org>
In-Reply-To: <20240507-samsung-usb-phy-fixes-v1-3-4ccba5afa7cc@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Wed, 12 Jun 2024 09:46:49 +0100
Message-ID: <CADrjBPqAEbbJ7PKgbUSWCP_AgLcz6uxvKsvc9VzOSD9jXK+scg@mail.gmail.com>
Subject: Re: [PATCH 3/5] phy: exynos5-usbdrd: make phy_isol() take a bool for clarity
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

On Tue, 7 May 2024 at 15:14, Andr=C3=A9 Draszik <andre.draszik@linaro.org> =
wrote:
>
> on / not on is just a boolean flag and is a bit misleading as currently
> on=3D=3D1 means to turn off the power, and on=3D=3D0 to turn power on.
>
> Rename the flag and make it a bool to avoid confusion of future readers
> of this code. No functional change.
>
> While at it, fix a whitespace issue in nearby comment.
>
> No functional change.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
> ---

Reviewed-by:  Peter Griffin <peter.griffin@linaro.org>

regards,

Peter

[..]

