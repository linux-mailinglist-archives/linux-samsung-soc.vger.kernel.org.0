Return-Path: <linux-samsung-soc+bounces-484-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6FAB80B6B1
	for <lists+linux-samsung-soc@lfdr.de>; Sat,  9 Dec 2023 23:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 92D63281011
	for <lists+linux-samsung-soc@lfdr.de>; Sat,  9 Dec 2023 22:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70381DA4C;
	Sat,  9 Dec 2023 22:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="khakoc0C"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFDC911D
	for <linux-samsung-soc@vger.kernel.org>; Sat,  9 Dec 2023 14:04:13 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-67a91751ba8so20055176d6.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 09 Dec 2023 14:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702159453; x=1702764253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDeZCYtXqn2cs2JrwzvomIoxvwFGKvb0D6cCKP3KGx0=;
        b=khakoc0Cvcr0Ldg58PpaEygTdHWRtTnX8olUjpvUMXkvg0qL+g0/kMMeym6TQROgwV
         NcajvFh0m++/TJoFoMGrJk4IX7rQQ6Qsulljepzl/4HJyQZ+FCUYgiebbcdC2yb2F/7m
         oFJrLFPEms7v/FrtYkSbwwl2MdfIlAb9oCUjekWj2LEezJjVBlBrQxq5M32QbEikZRn7
         PFkE74JYiG3PZF92iLkYBS2eGLj9MFByASo0saDBKZv/5iUmsvQ4xAM2JLyiZY3GZjxD
         qHsXYcR31sDY6WsPXiAtH2vXAu+RxQaBaOs1id0CfBgg1Uys+EQgnKuRSA1ij1aR3+8D
         iu8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702159453; x=1702764253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDeZCYtXqn2cs2JrwzvomIoxvwFGKvb0D6cCKP3KGx0=;
        b=jVcluRciTWeQz+sarMt9L1YxDIx1e2lY5DVtXPGeASuQrvfm5rIV16V1wEYAp0ouuV
         zyTaDApNR8ZVIhWRWPwnaNXkZGJsxjurHwGzMSJWHmUCD/cvT/RCmh7Zqqps0VJjs0v4
         aPfUfKS/N6VKuvJJ1D+kY3IeGDXI6tXLj6lPNVZEqiXIZU/SCbMh6tTT4Ct+GZyGJMSB
         Iu5+/ATSe5H41nXkiqWzjur/6t3b2SCFPoiG+qzc/gu7yCNebbG7E0bSVeysAEc404jK
         +v7iAs1HCLepwu8s5+DvrmUqIld2LZRS1PJZlRDbAL3rNzwchQycndQyJ5JvQLYbyGqE
         c/FA==
X-Gm-Message-State: AOJu0Yxllk5ykQf+UvdFrww1DcxFyrqDjQmXGn78y3RN5dDRg2MUEVHR
	IZLgr3KOZu3Wcd2iUILS9KKtVBLM4RP1mD9oEye+Jw==
X-Google-Smtp-Source: AGHT+IGShvGwLPhyao8X9Dj8VhmyqZQEkFRbj4Ak+KHDxcWKcLLYf+Q6tnP2alm19gFUubHvpWgjIuI0akR6N4sAeiY=
X-Received: by 2002:a0c:c782:0:b0:67a:21aa:6505 with SMTP id
 k2-20020a0cc782000000b0067a21aa6505mr2131602qvj.45.1702159452795; Sat, 09 Dec
 2023 14:04:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
 <20231201160925.3136868-20-peter.griffin@linaro.org> <CAPLW+4mOmQM+Hy-kUKn9onU25-ycgj4CWfAK+-vZVH+yw=FhtQ@mail.gmail.com>
In-Reply-To: <CAPLW+4mOmQM+Hy-kUKn9onU25-ycgj4CWfAK+-vZVH+yw=FhtQ@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sat, 9 Dec 2023 22:04:01 +0000
Message-ID: <CADrjBPqWimgbPUZoW1cTs0grL2Kv3rpNMhz=z-c+MUx6h6mTAQ@mail.gmail.com>
Subject: Re: [PATCH v5 19/20] arm64: dts: exynos: google: Add initial
 Oriole/pixel 6 board support
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org, 
	tomasz.figa@gmail.com, s.nawrocki@samsung.com, linus.walleij@linaro.org, 
	wim@linux-watchdog.org, linux@roeck-us.net, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, cw00.choi@samsung.com, alim.akhtar@samsung.com, 
	tudor.ambarus@linaro.org, andre.draszik@linaro.org, saravanak@google.com, 
	willmcvicker@google.com, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, kernel-team@android.com, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Sat, 2 Dec 2023 at 02:28, Sam Protsenko <semen.protsenko@linaro.org> wro=
te:
>
> On Fri, Dec 1, 2023 at 10:11=E2=80=AFAM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > Add initial board support for the Pixel 6 phone code named Oriole. This
> > has been tested with a minimal busybox initramfs and boots to a shell.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  arch/arm64/boot/dts/exynos/Makefile           |   2 +
> >  arch/arm64/boot/dts/exynos/google/Makefile    |   4 +
> >  .../boot/dts/exynos/google/gs101-oriole.dts   | 105 ++++++++++++++++++
> >  3 files changed, 111 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/exynos/google/Makefile
> >  create mode 100644 arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> >
> > diff --git a/arch/arm64/boot/dts/exynos/Makefile b/arch/arm64/boot/dts/=
exynos/Makefile
> > index 6e4ba69268e5..44c24a8ad9e1 100644
> > --- a/arch/arm64/boot/dts/exynos/Makefile
> > +++ b/arch/arm64/boot/dts/exynos/Makefile
> > @@ -1,4 +1,6 @@
> >  # SPDX-License-Identifier: GPL-2.0
> > +subdir-y +=3D google
> > +
> >  dtb-$(CONFIG_ARCH_EXYNOS) +=3D \
> >         exynos5433-tm2.dtb              \
> >         exynos5433-tm2e.dtb             \
> > diff --git a/arch/arm64/boot/dts/exynos/google/Makefile b/arch/arm64/bo=
ot/dts/exynos/google/Makefile
> > new file mode 100644
> > index 000000000000..0a6d5e1fe4ee
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/exynos/google/Makefile
> > @@ -0,0 +1,4 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +
> > +dtb-$(CONFIG_ARCH_EXYNOS) +=3D \
> > +       gs101-oriole.dtb \
> > diff --git a/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts b/arch/=
arm64/boot/dts/exynos/google/gs101-oriole.dts
> > new file mode 100644
> > index 000000000000..6abd00fa337e
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/exynos/google/gs101-oriole.dts
> > @@ -0,0 +1,105 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Oriole Device Tree
> > + *
> > + * Copyright 2021-2023 Google,LLC
>
> Space after comma. Maybe also make this line consistent for all added
> files. Checking existing files, it's usually spelled "Copyright (C)
> <years>, Google LLC."

I've made it match the other files I've added in v6 (by removing the
,). There seems to be a lot of variation upstream as to whether a . is
used at the end or not so I've left that as it was.
>
> Btw, I forgot to mention in my review for PATCH #18: please double
> check the commit message, there are some issues with punctuation
> there.

Ok, I will check it.

>
> > + * Copyright 2023 Linaro Ltd - <peter.griffin@linaro.org>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/input/input.h>
> > +#include "gs101-pinctrl.h"
> > +#include "gs101.dtsi"
> > +
> > +/ {
> > +       model =3D "Oriole";
> > +       compatible =3D "google,gs101-oriole", "google,gs101";
> > +
> > +       aliases {
> > +               serial0 =3D &serial_0;
> > +       };
> > +
> > +       chosen {
> > +               /* Bootloader expects bootargs specified otherwise it c=
rashes */
>
> Just wanted to say: I think you are doing a great job with this
> platform, and I can only imagine how hard it can be when you can't
> actually tinker with the bootloader source code. But I do appreciate
> that you was able to minimize stuff like earlycon, ect, etc :) And
> this one actually LGTM.
>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

Thanks, much appreciated!

regards,

Peter.

