Return-Path: <linux-samsung-soc+bounces-373-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97797802805
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  3 Dec 2023 22:40:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 401101F211FD
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  3 Dec 2023 21:40:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25FD81A598;
	Sun,  3 Dec 2023 21:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N5L7AweH"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50652B8
	for <linux-samsung-soc@vger.kernel.org>; Sun,  3 Dec 2023 13:39:55 -0800 (PST)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-67a89ca347aso23732576d6.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 03 Dec 2023 13:39:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701639594; x=1702244394; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7gO8de0lce7HaKv0/P/qdh9+Js5noC/xSOjvtz3e/WM=;
        b=N5L7AweHBYhyJpgx6fgGw3aIrBLFOzeVEu3xxmSMt+OkZY/WQLPG6/SZ1PtvvquNPO
         DAgQmu7nqLc9pzD4GF4X+Us6KppvuMh76rIOa5puv8WAk5lBqru+2x+rhV269rfqBpsP
         afSCFGYwSfth18SQA59kBvmBvhlqXOKE2c4bZu9coSn8Yqof2c/XbsBatJw2Xb1rQ88i
         XZuxXxA0NKFDaSmfK6PufcA9vABx22hUNOpEkXyQN5I45Uth/hy6Xz2pkXrIcJ5aRrGU
         WAgtLd7juIiMtZTJUWvwzpIHk+oltqJpN7yRm39NMC/iGU9H+HuSVVRPeHOMDTiuD9Y6
         n8rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701639594; x=1702244394;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7gO8de0lce7HaKv0/P/qdh9+Js5noC/xSOjvtz3e/WM=;
        b=KEGjmWE0c8x/0rotGuqW7o+wffMWEICqGFtwIRE78RMZeRToN3l5K+rrf1YfWkfkgo
         pFPsmBDKfVaxtUyCuKRwIhfLpzcsabcAxrO/BWB6QppC7PwCqA5HADMprTiIz/63M1Pf
         RTy0p0SaqioQOBz44D++iQlYj2+WVXAuap1e20X+qmujX3jQOcbmBK8tYv6BdXnzRrJn
         0MtUQKxkcd4D4IVq+EguWUPrgxWdCoZhpoWioyk7XVQRH8vamIeqF2RHj0IFYpx9g4n5
         zAPjQI2to8651Iq2iW07jq5OSgWXln1T7425c84AEA3T4AaZ9rJwBVOqy33mBy0sFUxz
         LCIg==
X-Gm-Message-State: AOJu0YwPuKXKsri/559K0G/rhtkGIZ9JnZgjMcvvah2OubxuU6We/zZH
	r6+q4yeQqad7Q6yrOJEf72Wu6ej4GOp5M+ZvYJF0Kg==
X-Google-Smtp-Source: AGHT+IGU7r7x9r9+baipwfFC2Z6LHKfOwxTcuFhaimGYhCIcueT+DijNUTVWF4dXUB1M1ZX2RA1n39vU5/gLge1bopA=
X-Received: by 2002:a0c:e94b:0:b0:67a:a394:e20c with SMTP id
 n11-20020a0ce94b000000b0067aa394e20cmr4222616qvo.38.1701639594412; Sun, 03
 Dec 2023 13:39:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-10-peter.griffin@linaro.org> <b4e710c0-dddb-4217-9979-21bdc20ee302@linaro.org>
In-Reply-To: <b4e710c0-dddb-4217-9979-21bdc20ee302@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 3 Dec 2023 21:39:43 +0000
Message-ID: <CADrjBPpcknRifds+WpuwmdzGxxFq-osLf7_Rn1ENjoRcXwCRxw@mail.gmail.com>
Subject: Re: [PATCH v5 09/20] dt-bindings: serial: samsung: Make
 samsung,uart-fifosize required property
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, 
	semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com, 
	soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Sun, 3 Dec 2023 at 15:11, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 01/12/2023 17:09, Peter Griffin wrote:
> > Specifying samsung,uart-fifosize in both DT and driver static data is error
> > prone and relies on driver probe order and dt aliases to be correct.
> >
> > Additionally on many Exynos platforms these are (USI) universal serial
> > interfaces which can be uart, spi or i2c, so it can change per board.
> >
> > For google,gs101-uart and exynosautov9-uart make samsung,uart-fifosize a
> > required property. For these platforms fifosize now *only* comes from DT.
>
> I don't see ExynosAutov9 compatible in your patch.

I dropped exynosautov9-uart compatible from this patch due to the ABI
breakage. It seems I forgot to update the commit wording though. Will
fix.

Peter.
>
> >
> > It is hoped other Exynos platforms will also switch over time.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  .../devicetree/bindings/serial/samsung_uart.yaml       | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/serial/samsung_uart.yaml b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> > index ccc3626779d9..65d5d361e8f4 100644
> > --- a/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> > +++ b/Documentation/devicetree/bindings/serial/samsung_uart.yaml
> > @@ -133,6 +133,16 @@ allOf:
> >              - const: uart
> >              - const: clk_uart_baud0
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - google,gs101-uart
> Best regards,
> Krzysztof
>

