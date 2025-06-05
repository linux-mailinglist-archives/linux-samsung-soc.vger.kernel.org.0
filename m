Return-Path: <linux-samsung-soc+bounces-8647-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E01ACEFCF
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  5 Jun 2025 15:00:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 896883AD1E9
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  5 Jun 2025 13:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95C68215F42;
	Thu,  5 Jun 2025 13:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v7VVaFSd"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04AA13D24D
	for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Jun 2025 13:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749128429; cv=none; b=HHvfgpo7KUiRoriyhdCZC+unWkOAvsb5xBTE3E3mxIhFGV+5Lxcwfks6EPGOsH6OJTJ29w3GEmfzGDlSqYCi0iS0VzJ3BZXWjioF7OXpTVuioEeXw0tzwAtYM0nbpR5MoIuLCBTgB91Rz8EYPryjOvstKcjmTzCPAaPyWAXFCao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749128429; c=relaxed/simple;
	bh=XKGDl2rsu8Cx+jAKtsKp4abHlLIqnz3Sddb7IIBINuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=huSWaSF4maUEKOIZXnfcpdxRsM1DRfOSc94ihVYz6NT1uz0/jEta6bUvyko1w56mS5GAjv+9O72RDNFfjQrksZZPbGASW0KTuLuTT9gnqLANCNw4ObGtpBMlZ+rBjBXqyk3BLOmsVk6ep35ZnGr45klNTLfPL87//y1TrjejkRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v7VVaFSd; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-60b8a9be972so275935eaf.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Jun 2025 06:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749128427; x=1749733227; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ecAphYkfEdsn3BUh426paPfp1MReJf3vodIqrsyJcGQ=;
        b=v7VVaFSd1PcNQqYS7Yb31UacYoBZHikNlksRsAP6cIRpMETOuiQjr9qwz3UkaH+aRr
         sO8JDX2fAOvGqj34fUv34LWiX0eXQINK1NogdAOnZiSk9j9c7vbKxLOXqeDQnwxrXJfC
         gckOd5Qs+VYYFontRpoe1Zg+wLQQgLw47xoWG49agFcZglKkWfOm9ncmREnsH0KDAZIc
         62qRC5cnumNsoPhzTmnrB0NIM77ihS04bukI5ftvspwoOvciHz4icc9K2PU2jwYm9LKM
         EigAEQTPyp9dNHLF7mDyLZ9noT+9X39AysJ8pte9EtsYjCSD3Pbo9UMfH5gX0v9X7xzm
         G2kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128427; x=1749733227;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ecAphYkfEdsn3BUh426paPfp1MReJf3vodIqrsyJcGQ=;
        b=kSFoXN0kZ5k0oz/WcWqsmFkqfb3n/H4lWkk6Q+L3frLzg7uWnwDvmnDhYGZN+1XMpl
         viHz9fsDgcDeOAbsOIWLLJPI7E2jXm6/HziI3VlwVV0Bb4Oi9gk0cRmxGeFqznYIwvn6
         t51G5jDWcwXRJe/2fUrLExawhEu8ncV6mHqutuFCu+XeKhkOokFf2RsD+HMW+Yrnsi2U
         jLT+Zf8Y163BYO7WpXNYXvICkqcHNHlv9/XKRC4jqNW9Nha1n3X2EsGU25CHuw6j8am4
         hWdLuIEvTSuXbO3ZQWkH85dIxtT51dohgCg/2ZHiurme0rPT50NALjjMz4T1XLGh4Qcr
         bJyA==
X-Forwarded-Encrypted: i=1; AJvYcCUuDK9Q3F4T9SM9aheIQ/7ugpioM9ELQ3LyNwRIVjUcT8wxi49hFeefMPMcMMlOTY2BtWcioLZXYz3zfGNk7TRjkg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwEXVqsFdPRul0gt2AkE6PYqJn9UsvKo2f66TLwZDnuMqNmKtQD
	RH+V3UTAvhx4zeOmGSjUOL8vIfmVCap7bqkPu6d3qQy1JAQrCoRjn0OwjcTsYn/3gBEldPlOkcs
	8yeYclB8NAqL2tzpZfv/2uJ4s9Ld5kB0OP6USTgkzgA==
X-Gm-Gg: ASbGncsgB4WYpV0q67F+msEsNXGem+NwfeB6EJ+8XLWGzZGPxOg8KTrQSiSmSNE7t17
	oIVFty3NeDG0KIZ8XxnDMtTfRAjha5f0AT8jXGrdHnJdkFCq4Yw8ajGFlFct4rm1z+jCCHSosGn
	lOWA9hz5/JpgXm/K0hPP7DzaZ4UgT9rA+poGY=
X-Google-Smtp-Source: AGHT+IG+FTUmGJ+/COgbGtwp15niG+cd9riFL26aortlN2WN5OKeL0bGxpdnRDnCKPZKQj5eRuIFsDW+Z69953+bUJA=
X-Received: by 2002:a05:6820:2686:b0:60f:9d6:bd08 with SMTP id
 006d021491bc7-60f0c7333b0mr4096808eaf.3.1749128425365; Thu, 05 Jun 2025
 06:00:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523-b4-gs101_max77759_fg-v4-0-b49904e35a34@uclouvain.be> <20250523-b4-gs101_max77759_fg-v4-5-b49904e35a34@uclouvain.be>
In-Reply-To: <20250523-b4-gs101_max77759_fg-v4-5-b49904e35a34@uclouvain.be>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 5 Jun 2025 14:00:14 +0100
X-Gm-Features: AX0GCFsta0Lv7B_0omf8fUD6lFICgS_5x_1K74aulND6HJZCGnhF0KZN-f9c7f0
Message-ID: <CADrjBPr4QNQPBddcFBe8V4u7G9YW0vs=8jyxEuQ1gVDt1zcfiA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: exynos: gs101-oriole: enable Maxim
 max77759 fuel gauge
To: t.antoine@uclouvain.be
Cc: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dimitri Fedrau <dima.fedrau@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

Thanks for your patch and work to enable fuel gauge on Pixel 6!

On Fri, 23 May 2025 at 13:52, Thomas Antoine via B4 Relay
<devnull+t.antoine.uclouvain.be@kernel.org> wrote:
>
> From: Thomas Antoine <t.antoine@uclouvain.be>
>
> Add the node for the Maxim MAX77759 fuel gauge as a slave of the i2c.
>
> The TODO is still applicable given there are other slaves on the
> bus (e.g. PCA9468, other MAX77759 functions and the MAX20339 OVP).
>
> Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
> ---
>  arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> index b25230495c64dce60916b7cd5dcb9a7cce5d0e4e..84fc10c3562958ab1621f24644709e85a9433b9b 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
> @@ -10,6 +10,7 @@
>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/usb/pd.h>
>  #include "gs101-pinctrl.h"
>  #include "gs101.dtsi"
> @@ -188,6 +189,15 @@ usbc0_role_sw: endpoint {
>                         };
>                 };
>         };
> +
> +       fuel-gauge@36 {
> +               compatible = "maxim,max77759-fg";
> +               reg = <0x36>;
> +               reg-names = "m5";
> +               interrupt-parent = <&gpa9>;
> +               interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> +               shunt-resistor-micro-ohms = <5000>;
> +       };
>  };
>

If gpa-9-3 is being used for the interrupt I think we should also add
the pinctrl configuration for it. Taking a look at downstream the pin
is defined as

&pinctrl_0 {
/* [MAX77759: FG_INTB] > FG_INT_L > [XEINT_23 : SC59845XWE] */
        if_pmic_fg_irq: if-pmic-fg-irq {
                samsung,pins = "gpa9-3"; /* XEINT_23 */
                samsung,pin-function = <EXYNOS_PIN_FUNC_EINT>;
                samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
                samsung,pin-drv = <GS101_PIN_DRV_2_5_MA>;
        };
};

and then the fuel-gauge node declares

/* FG_INT_L -> XEINT_23 */
pinctrl-names = "default";
pinctrl-0 = <&if_pmic_fg_irq>;

regards,

Peter

