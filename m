Return-Path: <linux-samsung-soc+bounces-794-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A24181D788
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 24 Dec 2023 03:01:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9781B1F21528
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 24 Dec 2023 02:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E51AA3C;
	Sun, 24 Dec 2023 02:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qHFqtvDR"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70429807
	for <linux-samsung-soc@vger.kernel.org>; Sun, 24 Dec 2023 02:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7b71e389fb2so158406339f.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 23 Dec 2023 18:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703383257; x=1703988057; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lPu9Fli201JAuiG39K2q49j/kuGYFdL9b7eb+AA0dxY=;
        b=qHFqtvDRIuVFvXvDq35vawcLK4ajdiTrpgMHi9i7cL/znfIOowrhcPASqqFHhzsX8q
         sid2fe3SkzoXP3ko8St7uWspjJ7xRBBy8uFaxfHYZq+ADBgpuX9n46aKe6OyJgSOFDte
         GkM1LU9WH8RKLUU8cj5GeQ9DgK7ckTo8iGFTYdItueaJi8nUCtEx9+lc9xKrpVOwJCL6
         Y7aDVkr86P2+FEviXz9hqdhvk+GrFZoC7VpGcsMiCjEpcmZUNZ7yrhMY9mDRQxzXuzzc
         rVjDbP9YYrXxuBXwXO2PqDATpse/EmG0Q7SI6u32d7hNth6KZqXaTwY9N76rGyU94NtS
         BGfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703383257; x=1703988057;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lPu9Fli201JAuiG39K2q49j/kuGYFdL9b7eb+AA0dxY=;
        b=eHCrjTfqhiiS+Oqy92oaIij4Zpwq6u3J1ku0xqNPNQQqsSXugjY+dNvB/ULFw+xru6
         eWMn2L2ozcB+Bkbzo5+2oBiFHPz71xuybbDcWZohpsAX/Njaa7cWyiGDatBhYBMR+y2O
         jfHDRFH1i0xtYOuA0/LxwrJb1GADUwdERqmFrxPdTdEgtHKTOaz8nXCkz2m/Kt9VbWUV
         Rg/rs+ekrrrCaI1vki08apU2RlHqeXatHHdV2gvi+z7eZUpDUvz6yef2TvtnvTvn32wp
         hrmkL//bpU5L33PwnQ3BEtMobQx6n0lk8Z2dKAeWTQtrTFBWwszLbsh1kBYBjNZpm+l1
         oBog==
X-Gm-Message-State: AOJu0YyR+nJZQdYhskWazoPQOwJZpdE2uHj2fGpvLo4rbrVzwEhbI/uR
	9Pff/TvvuvhpOeLq9P8Z8hlZkuw7IiMh5phN3xYLbfN3HRdWNg==
X-Google-Smtp-Source: AGHT+IHJOQx47Y7T63pXq2ZxfJTeB8LIB3R8j6eZocwS6UBxAlJOxEP1XchULIRVai+GuPvBbDJqj66h2AxQZ3KKw30=
X-Received: by 2002:a05:6e02:1b02:b0:35f:ac66:e863 with SMTP id
 i2-20020a056e021b0200b0035fac66e863mr6301362ilv.50.1703383257581; Sat, 23 Dec
 2023 18:00:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231223191902.22857-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20231223191902.22857-1-krzysztof.kozlowski@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Sat, 23 Dec 2023 20:00:46 -0600
Message-ID: <CAPLW+4na0s6D_BOYBCuT70FtMGSmhi2bApHxOd1H0CoJRqz9Kw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: constify iomem pointers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 23, 2023 at 1:19=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Constify few pointers to iomem, where the destination memory is not
> modified, for code safety and readability.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>  drivers/pinctrl/samsung/pinctrl-exynos.c  | 4 ++--
>  drivers/pinctrl/samsung/pinctrl-samsung.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pinctrl/samsung/pinctrl-exynos.c b/drivers/pinctrl/s=
amsung/pinctrl-exynos.c
> index d3d4b5d036c8..871c1eb46ddf 100644
> --- a/drivers/pinctrl/samsung/pinctrl-exynos.c
> +++ b/drivers/pinctrl/samsung/pinctrl-exynos.c
> @@ -693,7 +693,7 @@ static void exynos_pinctrl_suspend_bank(
>                                 struct samsung_pin_bank *bank)
>  {
>         struct exynos_eint_gpio_save *save =3D bank->soc_priv;
> -       void __iomem *regs =3D bank->eint_base;
> +       const void __iomem *regs =3D bank->eint_base;
>
>         save->eint_con =3D readl(regs + EXYNOS_GPIO_ECON_OFFSET
>                                                 + bank->eint_offset);
> @@ -714,7 +714,7 @@ static void exynosauto_pinctrl_suspend_bank(struct sa=
msung_pinctrl_drv_data *drv
>                                             struct samsung_pin_bank *bank=
)
>  {
>         struct exynos_eint_gpio_save *save =3D bank->soc_priv;
> -       void __iomem *regs =3D bank->eint_base;
> +       const void __iomem *regs =3D bank->eint_base;
>
>         save->eint_con =3D readl(regs + bank->pctl_offset + bank->eint_co=
n_offset);
>         save->eint_mask =3D readl(regs + bank->pctl_offset + bank->eint_m=
ask_offset);
> diff --git a/drivers/pinctrl/samsung/pinctrl-samsung.c b/drivers/pinctrl/=
samsung/pinctrl-samsung.c
> index dbf38767f15f..ed07e23e0912 100644
> --- a/drivers/pinctrl/samsung/pinctrl-samsung.c
> +++ b/drivers/pinctrl/samsung/pinctrl-samsung.c
> @@ -565,7 +565,7 @@ static void samsung_gpio_set(struct gpio_chip *gc, un=
signed offset, int value)
>  /* gpiolib gpio_get callback function */
>  static int samsung_gpio_get(struct gpio_chip *gc, unsigned offset)
>  {
> -       void __iomem *reg;
> +       const void __iomem *reg;
>         u32 data;
>         struct samsung_pin_bank *bank =3D gpiochip_get_data(gc);
>         const struct samsung_pin_bank_type *type =3D bank->type;
> @@ -1204,7 +1204,7 @@ static int __maybe_unused samsung_pinctrl_suspend(s=
truct device *dev)
>
>         for (i =3D 0; i < drvdata->nr_banks; i++) {
>                 struct samsung_pin_bank *bank =3D &drvdata->pin_banks[i];
> -               void __iomem *reg =3D bank->pctl_base + bank->pctl_offset=
;
> +               const void __iomem *reg =3D bank->pctl_base + bank->pctl_=
offset;
>                 const u8 *offs =3D bank->type->reg_offset;
>                 const u8 *widths =3D bank->type->fld_width;
>                 enum pincfg_type type;
> --
> 2.34.1
>
>

