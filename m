Return-Path: <linux-samsung-soc+bounces-372-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EE88027CF
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  3 Dec 2023 22:32:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 69268B20806
	for <lists+linux-samsung-soc@lfdr.de>; Sun,  3 Dec 2023 21:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE2E7199A7;
	Sun,  3 Dec 2023 21:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dGb8DE/H"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 151D6D3
	for <linux-samsung-soc@vger.kernel.org>; Sun,  3 Dec 2023 13:31:54 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4254853d4d6so9246491cf.0
        for <linux-samsung-soc@vger.kernel.org>; Sun, 03 Dec 2023 13:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701639113; x=1702243913; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G02u0sdxnFAEWbNN9nRUil1ZtXJaIE05IGNFhr9iJSA=;
        b=dGb8DE/Ha8y2tMZKwY7e55pB2iCbFw6dKq1sGjeeyTxWnjOt6BEfH8I4g9JbOLrPL8
         ENLnaHInyTQiEFGPyIAd3PFkC5HgzVzscJ0X7epy+NW4beYxO5LwaictflB/ipOWZD+H
         MDcsU15rDyA7WAke96kbhUoWzqRSvkCLgspQyFHC4vAIxizQc2k4ANgxjflwvtQ+V3kQ
         FWOj9fWlUZztxf0EiZrQFK8DyzdX3n4Z4n6YAfWdruGbimif1N30TcqPuQ+h4rlCk7YG
         r3qc17C9GcXp9Z9w3ux34NJkLUjuR861mAyRJKIvp8pjGlSwqnZ2fr68ktIW4uSqR3N3
         c66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701639113; x=1702243913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G02u0sdxnFAEWbNN9nRUil1ZtXJaIE05IGNFhr9iJSA=;
        b=BIUW4OCddoGJ1IZ3FDmCgX0/gS55yFGqHpO2EhzpJwnOqgyn4W2iePyZFxw1B1/P6X
         Of5lVEcZ05cvmAhGmSu79Jvct4qj8Uo2w/yECgmBEPHyA3PDWhygDWLpDjMLZdRSYcO0
         FOc3dfIZRpBrkvG9X1u0Eac+mUAtvZxwLq31TFy4hcg6mYEdVI3OogCf6wBTbBiIlF62
         LnTzz+bSeq8OTnaQWXxX8c1F8QOkTBb4NhB/XuC359NPubOEka4Mkmgtfdh9yOARm1st
         KaazXM6l52xQ3b9j+NdYm6EbUN2F+Thu1V016ooVHbnDxPmDbeu9R9Eis86yiqvmlVla
         /hOQ==
X-Gm-Message-State: AOJu0YzmxnhFC7VdLPuqOWlW1/r7GyUMlzVhaVaO5Ytm5iHoc4kEZ3Gz
	7796/s9cPzFNWJFiEyKDSAm7024gpvQl6nFdz96LFg==
X-Google-Smtp-Source: AGHT+IGNohdhuUx6qw41RjMk55NiBYO1sgpsNCtd4DXi5RmzCel7FKuFM65wkoSHPpohcTc4yi+ZokTYRVrg0YEEWT8=
X-Received: by 2002:a0c:f7d0:0:b0:67a:bb7f:ebd7 with SMTP id
 f16-20020a0cf7d0000000b0067abb7febd7mr1547835qvo.61.1701639113122; Sun, 03
 Dec 2023 13:31:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-10-peter.griffin@linaro.org> <59b949a0-5aeb-4f01-8789-cb305513b626@app.fastmail.com>
In-Reply-To: <59b949a0-5aeb-4f01-8789-cb305513b626@app.fastmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 3 Dec 2023 21:31:41 +0000
Message-ID: <CADrjBPoeLLcoDuLdkVhO4C_8qFAvFSu2igNPP09RXagiJpPsig@mail.gmail.com>
Subject: Re: [PATCH v5 09/20] dt-bindings: serial: samsung: Make
 samsung,uart-fifosize required property
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org, 
	Michael Turquette <mturquette@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Sam Protsenko <semen.protsenko@linaro.org>, saravanak@google.com, 
	William McVicker <willmcvicker@google.com>, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-watchdog@vger.kernel.org, 
	kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Fri, 1 Dec 2023 at 16:39, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Dec 1, 2023, at 17:09, Peter Griffin wrote:
> >
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            enum:
> > +              - google,gs101-uart
> > +    then:
> > +      required:
> > +        - samsung,uart-fifosize
> > +
>
> Is there a way to reverse the list and make the property
> required for anything that is not explicitly enumerated?

I'm not aware of a way to do that, but I'm by no means an expert with
json schema. Krzysztof or Rob may know of a way.

I presume your rationale is any newly added platform would get a DTC
warning if they didn't add the samsung,uart-fifosize property?

Krzysztof and Rob also had concerns in the previous series about ABI
breakage on existing platforms, which is why this was only made
required for google,gs101-uart.

regards,

Peter

