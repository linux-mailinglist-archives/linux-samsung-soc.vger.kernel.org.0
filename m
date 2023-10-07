Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 358327BC2D1
	for <lists+linux-samsung-soc@lfdr.de>; Sat,  7 Oct 2023 01:09:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233889AbjJFXJK (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 6 Oct 2023 19:09:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233627AbjJFXJJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Oct 2023 19:09:09 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA6F0AD
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Oct 2023 16:09:07 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-27927d37ec7so2044650a91.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Oct 2023 16:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696633747; x=1697238547; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JKCPevQdWMrH5vc0wDcfZ2KA+4K1iwOe4iMtlXw/26Y=;
        b=zLD7e00ElumdjCBLzH2bm191GIuo0Ac7k1yVW46Eys7dHvRWXEBXmutQsZFH1MJh/G
         HK7LiugSdCHXpiV4MPXk0LHvEIsBHD7XhzvEWrLSO55zV0SpeNn3v6sxQpE6JOaHpSX0
         vc7MU3ATg5bxDKeCwjv+o6/aHSykLC3Pvzru1Afx84Ugi/wc4zZI5nDdRN8kcETZScYt
         pPtlzYMB0x0f5qyvb3KgzHpEvZkY/zg7LbVS5+rfCUPSNIdzJQH9yGo6rEaYGdzKRT/n
         XEjb/u9zpljTDxXm38fLFvO1fv/R5zhZk1Zfmkh2cnaJzj/uEVjCU4vm8PqQSNJiTmTa
         /ZtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696633747; x=1697238547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JKCPevQdWMrH5vc0wDcfZ2KA+4K1iwOe4iMtlXw/26Y=;
        b=mDfJTy3F9ww2GXSCjHpyTEmLmYzNiXtAd5j11fMMjgWueh9CHunMlH02MkzgwQVB07
         nLB7vP/EZqd2/s6GKMrhuIHI+j3drTDUKJMN1lZioei9u1vygcKGjHIaO5yhH6zj+/5x
         +gfB7I4/G6wttwU4/doUK0lMNQAxkX/SXKRknwlQOyg0TnUlLYH/3DLHrZvl6Yv5MseE
         eFQ2xWZrEogusO9aB5HpYFGWOjJciueNXeunAmmfoViAjVrvZX8tPv924Qag3Wbw6bIm
         LUl83BzIs4NX8lQcc+3ookJ+B0R37Rp6xXl3TVdEMNjzQHrye4BcowzxD1/DbXxqL14q
         uqaw==
X-Gm-Message-State: AOJu0Ywvone8Tc6lH9QIzIO61pJbjinPAjyPLf58ffIz/b/Sd55KIW30
        ElTtj6l3M4tRE6vfdYMaMpLeF/2vCdd8cMe+JW9QcQ==
X-Google-Smtp-Source: AGHT+IHFefEJnLOC7cu9e6k1ys7L/97M/gKyxa07g0PpIPFXxRIMwzDDnKrduULXOutkLjFBCqZ/dfu1ajhxYd4O1N0=
X-Received: by 2002:a17:90a:c218:b0:26b:24ed:e0d9 with SMTP id
 e24-20020a17090ac21800b0026b24ede0d9mr9251288pjt.33.1696633747066; Fri, 06
 Oct 2023 16:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20231006090014.277448-1-tudor.ambarus@linaro.org>
In-Reply-To: <20231006090014.277448-1-tudor.ambarus@linaro.org>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Fri, 6 Oct 2023 18:08:55 -0500
Message-ID: <CAPLW+4==D1OVB+rY92NVEmfv08=0FBF0LJ07xoHh4YZZPOneXQ@mail.gmail.com>
Subject: Re: [PATCH] soc: samsung: usi: remove superfluous parameter
To:     Tudor Ambarus <tudor.ambarus@linaro.org>
Cc:     krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        peter.griffin@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Oct 6, 2023 at 4:00=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro.=
org> wrote:
>
> exynos_usi_set_sw_conf() has a single caller, exynos_usi_configure,
> which called it with exynos_usi_set_sw_conf(usi, usi->mode). Since the
> mode is already defined in struct exynos_usi, remove the superfluous
> pass of the mode parameter. While in exynos_usi_set_sw_conf(), remove the
> reinitialization of usi->mode with its same value.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---

This driver was designed with the easiness of its further possible
extension in mind. For example, passing the "mode" into
exynos_usi_set_sw_conf() allows one to implement some sysfs nodes for
switching USI configuration manually, just by passing the user's mode
into exynos_usi_set_sw_conf(). Other things which might also appear as
over-engineered, make it easy to add USI_V1 implementation, as we
discussed that possibility at the time. So yeah, it was done for a
reason, and I'd prefer to leave it as is.

>  drivers/soc/samsung/exynos-usi.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/soc/samsung/exynos-usi.c b/drivers/soc/samsung/exyno=
s-usi.c
> index 114352695ac2..269ed930c5a9 100644
> --- a/drivers/soc/samsung/exynos-usi.c
> +++ b/drivers/soc/samsung/exynos-usi.c
> @@ -95,14 +95,14 @@ MODULE_DEVICE_TABLE(of, exynos_usi_dt_match);
>  /**
>   * exynos_usi_set_sw_conf - Set USI block configuration mode
>   * @usi: USI driver object
> - * @mode: Mode index
>   *
>   * Select underlying serial protocol (UART/SPI/I2C) in USI IP-core.
>   *
>   * Return: 0 on success, or negative error code on failure.
>   */
> -static int exynos_usi_set_sw_conf(struct exynos_usi *usi, size_t mode)
> +static int exynos_usi_set_sw_conf(struct exynos_usi *usi)
>  {
> +       size_t mode =3D usi->mode;
>         unsigned int val;
>         int ret;
>
> @@ -115,8 +115,7 @@ static int exynos_usi_set_sw_conf(struct exynos_usi *=
usi, size_t mode)
>         if (ret)
>                 return ret;
>
> -       usi->mode =3D mode;
> -       dev_dbg(usi->dev, "protocol: %s\n", exynos_usi_modes[usi->mode].n=
ame);
> +       dev_dbg(usi->dev, "protocol: %s\n", exynos_usi_modes[mode].name);
>
>         return 0;
>  }
> @@ -164,7 +163,7 @@ static int exynos_usi_configure(struct exynos_usi *us=
i)
>  {
>         int ret;
>
> -       ret =3D exynos_usi_set_sw_conf(usi, usi->mode);
> +       ret =3D exynos_usi_set_sw_conf(usi);
>         if (ret)
>                 return ret;
>
> --
> 2.42.0.609.gbb76f46606-goog
>
