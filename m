Return-Path: <linux-samsung-soc+bounces-9737-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F8EB1CBA5
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  6 Aug 2025 20:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF43218C44D4
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  6 Aug 2025 18:07:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3CFB1D47B4;
	Wed,  6 Aug 2025 18:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="y7LOpm7S"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1511114
	for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Aug 2025 18:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754503620; cv=none; b=sX14Pls/Mvc8o0E8HsD1aorBuMvnKCUdou+btVe5kYOwvueCXga3T+wcEWq6gmII/VaNIUs+oBmUYkUmZUgQJPiB21uvJ3h0qDWiaJUGUU2eCYs4ntm2QKHJWbLHalC9f2ZY942mgnix8aQ50DU2IKT6b4c8U2rUN1YhB5P9ClU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754503620; c=relaxed/simple;
	bh=NlUNT/FYaSKabfIetxwRs86eAKwLyl3xNP7yv81IoQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hHCogOIS/CyJggEIQYFwu+MTAQg4nFc4B8XVAIH0QtYuC+sdHXtFamflmLtoLi4DH2kKdgI30F6SDfKevhv05W1xw21YFiurlPABgkXiYtJVHXem53E6OmBhXb4+4j2IbGb2k73HgVIugqP279W7nFc9rcxwmeDmXzWUt60OizE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=y7LOpm7S; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-71b6703ba32so1038937b3.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Aug 2025 11:06:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754503618; x=1755108418; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQaJG8cyIXtb8JtDrWV4xH4gE5fz/4xlgqKKsovQNWE=;
        b=y7LOpm7S1K6HoUGDyAeo+A4LOyKBp/7KN/o6ywY3DfnpNFY7U+fS6ZO4dJtKgK4zTH
         BtDgXp+hAH6Tt3AC6o+ayqHBFjTT2/Sirc76TLtM8DLqYm0r/bQ6AsBwPTBZ43LpRfJ5
         2ELMtvqv6eKTUCWRBJ7EtsRn0UIBr6vwg8T7Qact0YPKKLnvhXXWuQN2VkhjjWYIvcFE
         +bNEz6vue57PGloWURJofevokST+TGJ234bLIWf85tWybd3GkDCg2Qdm474irZFtt1r7
         fPCHkt/rNCnuCXMydXCGk4KNS6EkrW4Jlki8JZ8OGXX+WlKCDjfjsZqIEjs61CcFyjvN
         2dcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754503618; x=1755108418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQaJG8cyIXtb8JtDrWV4xH4gE5fz/4xlgqKKsovQNWE=;
        b=wAvEh1GV7qk4Tdobx5TBkzVwI9DaAAXfIB1xJLLweyriYx3ntICl4DokxICWVls0Gz
         TaRaepCoZrkjavW3p3RNqQAZvKENRVFHduiNQBDDSJZXzuCKzlsSm/1PG69PiLnsrbLZ
         q9slHMucgDfxfyt98ZOWcmmWWjgnUYRYnglLN8Jk+UJ2FhuOkb922NdL60H9QrwLElft
         Agebd3QZuGAfV2WQ97dByp2l5BwOXH5fboQU4EhhNk09/YYZTcYr8xnaBZG4HNeSoAI4
         pUlLVKQKmdkqpQ+c2ef50U2iPZZTXl0qN6UVvN0XerDsNa3QfgpRuu6t2iAkckKAK3T1
         zsSA==
X-Forwarded-Encrypted: i=1; AJvYcCWELUZdzKjMS6teOdNXQ2d9rG21E9+LmBSkUF8QzD3n7poZnm4HUwO+RTJVXuIx1ThmS4i5X/CsBrdiKC15XH6nuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9gpA+g9XdyOkSI4yX4s3lDHJTe33wahyp8DTpfkmKCLxXB2z1
	mx4gCWHc7X4oiVjcBsoYn2cjOeYklKB1sYSHjErTHr+mRmH/s1GZ90IU0c6rznHVLm5qp1h/6N2
	tc7XPXUwJXLHj2vbUmXhTW3zT/pzVK3TyaZGq34wUuQ==
X-Gm-Gg: ASbGncu7l6kPw8ZDxN3732rn+q/bLr1j2G323WR0ymWiWIM2YT0bz2ICYynmV0bT48r
	vEAGRgoC5zmRXhZPFgecINncchkjhIHU+N0lMS6xUDL0IVQblc5r0kMmAYhLCcsUfNaNBy+6fOi
	Ytpgc6UENFv2R9FgCmX0scQGp+Az00mSDrap4QjfF2ATloZacNjAgmmwYViJjuzIRFQxiVY+IDO
	yyZlw==
X-Google-Smtp-Source: AGHT+IHawplYNXt0Xk96mNtSAEAp52yUSKjVefDzMRnwkFSkTZcoaKk+ZYugied/egHWgCi9PaKRpIxtR3J4UeIUxyo=
X-Received: by 2002:a05:690c:7202:b0:71b:69fd:2571 with SMTP id
 00721157ae682-71bdbcfb84fmr3438637b3.32.1754503617394; Wed, 06 Aug 2025
 11:06:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20250806070030epcas2p24cc79e6dd3e505afd980fc05ee9e4f19@epcas2p2.samsung.com>
 <20250806065514.3688485-1-sw617.shin@samsung.com> <20250806065514.3688485-4-sw617.shin@samsung.com>
In-Reply-To: <20250806065514.3688485-4-sw617.shin@samsung.com>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Wed, 6 Aug 2025 13:06:46 -0500
X-Gm-Features: Ac12FXzzprozXvP76pSORFyQ-L_jvtIZlH-PiTmfaMmvcTJCzW2IyjQ268pBDg4
Message-ID: <CAPLW+4n=H3cPe=XqMfUJKqpPJdot9t0j_kBMkNY3W+x9buokTg@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] watchdog: s3c2410_wdt: Increase max timeout value
 of watchdog
To: Sangwook Shin <sw617.shin@samsung.com>
Cc: krzk@kernel.org, alim.akhtar@samsung.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, dongil01.park@samsung.com, khwan.seo@samsung.com, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 6, 2025 at 2:00=E2=80=AFAM Sangwook Shin <sw617.shin@samsung.co=
m> wrote:
>
> Increase max_timeout value from 55s to 3665038s (1018h 3min 58s) with
> 38400000 frequency system if the system has 32-bit WTCNT register.
>
> cat /sys/class/watchdog/watchdog0/max_timeout
> 3665038
>
> [    0.330082] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: count=3D1099=
511400000, timeout=3D3665038, freq=3D300000
> [    0.330087] s3c2410-wdt 10060000.watchdog_cl0: Heartbeat: timeout=3D36=
65038, divisor=3D256, count=3D1099511400000 (fffffc87)
> [    0.330127] s3c2410-wdt 10060000.watchdog_cl0: starting watchdog timer
> [    0.330134] s3c2410-wdt 10060000.watchdog_cl0: Starting watchdog: coun=
t=3D0xfffffc87, wtcon=3D0001ff39
> [    0.330319] s3c2410-wdt 10060000.watchdog_cl0: watchdog active, reset =
enabled, irq disabled
>
> If the system has a 32-bit WTCNT, add QUIRK_HAS_32BIT_CNT to its quirk fl=
ags,
> and it will operate with a 32-bit counter. If not, it will operate with a=
 16-bit
> counter like in the previous version.
>
> Signed-off-by: Sangwook Shin <sw617.shin@samsung.com>
> ---
>  drivers/watchdog/s3c2410_wdt.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wd=
t.c
> index 0a4c0ab2a3d6..673ab6768688 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -34,7 +34,8 @@
>  #define S3C2410_WTCNT          0x08
>  #define S3C2410_WTCLRINT       0x0c
>
> -#define S3C2410_WTCNT_MAXCNT   0xffff
> +#define S3C2410_WTCNT_MAXCNT_16        0xffff
> +#define S3C2410_WTCNT_MAXCNT_32        0xffffffff
>
>  #define S3C2410_WTCON_RSTEN            BIT(0)
>  #define S3C2410_WTCON_INTEN            BIT(2)
> @@ -124,6 +125,10 @@
>   * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Setting th=
e
>   * DBGACK_MASK bit disables the watchdog outputs when the SoC is in debu=
g mode.
>   * Debug mode is determined by the DBGACK CPU signal.
> + *
> + * %QUIRK_HAS_32BIT_CNT: WTDAT and WTCNT are 32-bit registers. With thes=
e
> + * 32-bit registers, larger values will be set, which means that larger =
timeouts
> + * value can be set.
>   */
>  #define QUIRK_HAS_WTCLRINT_REG                 BIT(0)
>  #define QUIRK_HAS_PMU_MASK_RESET               BIT(1)
> @@ -131,6 +136,7 @@
>  #define QUIRK_HAS_PMU_AUTO_DISABLE             BIT(3)
>  #define QUIRK_HAS_PMU_CNT_EN                   BIT(4)
>  #define QUIRK_HAS_DBGACK_BIT                   BIT(5)
> +#define QUIRK_HAS_32BIT_CNT                    BIT(6)
>
>  /* These quirks require that we have a PMU register map */
>  #define QUIRKS_HAVE_PMUREG \
> @@ -199,6 +205,7 @@ struct s3c2410_wdt {
>         struct notifier_block   freq_transition;
>         const struct s3c2410_wdt_variant *drv_data;
>         struct regmap *pmureg;
> +       u32 max_cnt;
>  };
>
>  static const struct s3c2410_wdt_variant drv_data_s3c2410 =3D {
> @@ -412,7 +419,7 @@ static inline unsigned int s3c2410wdt_max_timeout(str=
uct s3c2410_wdt *wdt)
>  {
>         const unsigned long freq =3D s3c2410wdt_get_freq(wdt);
>         //(S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV =3D 0x8=
000
> -       u64 t_max =3D div64_ul((u64)S3C2410_WTCNT_MAXCNT * 0x8000, freq);
> +       u64 t_max =3D div64_ul((u64)wdt->max_cnt * 0x8000, freq);
>

If you rework the hard-coded 0x8000 value w.r.t. my comments for the
previous patch, this should be changed accordingly too. So either:

    u32 div_max =3D (S3C2410_WTCON_PRESCALE_MAX + 1) * S3C2410_WTCON_MAXDIV=
;
    u64 t_max =3D div64_ul((u64)wdt->max_cnt * div_max, freq);

...or...

    u32 cnt_max =3D (u64)wdt->max_cnt * (S3C2410_WTCON_PRESCALE_MAX + 1) *
                  S3C2410_WTCON_MAXDIV;
    u64 t_max =3D div64_ul(cnt_max, freq);

Apart from that, looks good to me:

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>         if (t_max > UINT_MAX)
>                 t_max =3D UINT_MAX;
> @@ -571,7 +578,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_d=
evice *wdd,
>  {
>         struct s3c2410_wdt *wdt =3D watchdog_get_drvdata(wdd);
>         unsigned long freq =3D s3c2410wdt_get_freq(wdt);
> -       unsigned int count;
> +       unsigned long count;
>         unsigned int divisor =3D 1;
>         unsigned long wtcon;
>
> @@ -581,7 +588,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_d=
evice *wdd,
>         freq =3D DIV_ROUND_UP(freq, 128);
>         count =3D timeout * freq;
>
> -       dev_dbg(wdt->dev, "Heartbeat: count=3D%d, timeout=3D%d, freq=3D%l=
u\n",
> +       dev_dbg(wdt->dev, "Heartbeat: count=3D%lu, timeout=3D%d, freq=3D%=
lu\n",
>                 count, timeout, freq);
>
>         /* if the count is bigger than the watchdog register,
> @@ -589,8 +596,8 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_d=
evice *wdd,
>            actually make this value
>         */
>
> -       if (count >=3D 0x10000) {
> -               divisor =3D DIV_ROUND_UP(count, 0xffff);
> +       if (count > wdt->max_cnt) {
> +               divisor =3D DIV_ROUND_UP(count, wdt->max_cnt);
>
>                 if (divisor > S3C2410_WTCON_PRESCALE_MAX + 1) {
>                         dev_err(wdt->dev, "timeout %d too big\n", timeout=
);
> @@ -598,7 +605,7 @@ static int s3c2410wdt_set_heartbeat(struct watchdog_d=
evice *wdd,
>                 }
>         }
>
> -       dev_dbg(wdt->dev, "Heartbeat: timeout=3D%d, divisor=3D%d, count=
=3D%d (%08x)\n",
> +       dev_dbg(wdt->dev, "Heartbeat: timeout=3D%d, divisor=3D%d, count=
=3D%lu (%08lx)\n",
>                 timeout, divisor, count, DIV_ROUND_UP(count, divisor));
>
>         count =3D DIV_ROUND_UP(count, divisor);
> @@ -806,6 +813,11 @@ static int s3c2410wdt_probe(struct platform_device *=
pdev)
>         if (IS_ERR(wdt->src_clk))
>                 return dev_err_probe(dev, PTR_ERR(wdt->src_clk), "failed =
to get source clock\n");
>
> +       if (wdt->drv_data->quirks & QUIRK_HAS_32BIT_CNT)
> +               wdt->max_cnt =3D S3C2410_WTCNT_MAXCNT_32;
> +       else
> +               wdt->max_cnt =3D S3C2410_WTCNT_MAXCNT_16;
> +
>         wdt->wdt_device.min_timeout =3D 1;
>         wdt->wdt_device.max_timeout =3D s3c2410wdt_max_timeout(wdt);
>
> --
> 2.25.1
>

