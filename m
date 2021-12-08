Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D15046D5ED
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  8 Dec 2021 15:42:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235289AbhLHOpg (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 8 Dec 2021 09:45:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229611AbhLHOpf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Dec 2021 09:45:35 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 396F2C0617A1
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Dec 2021 06:42:03 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id k37so6068363lfv.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Dec 2021 06:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xNnl/bq9XM/DC6ymRmm5/FHnKK1n0tNt9MfNZG44+LA=;
        b=mKOXC6iPF0/Xtg4TshGCe/sCxmgR+Ts9zEiwqmhydToDUrBTPLal+G8YHzgVGdPvEo
         zP0LN73heWTPQiCVje1xUJb2399SG2prnlZ8OOl5LrW515XDmTz6ZR+kjN/v1bQClKhS
         PHGDEi5hUm2vkQQ/00nHTOZ1nXpB7uqOBjrwI+YPQ94EQSp2g+Ga/ZYReKLtnOXAxlZp
         +F5VAApv3cYsdt1EWGtFHPxLrglt1AFPE0J+32FB+AYiZQbkhU9M1l3Aej0bV/ciHOd8
         tZ/6631KTDujlbyYNmEpZfyMoDbc0dnnH+gf430BAvIZzlCvRNLD+5Y/IcU4ToPqtcJI
         sYMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xNnl/bq9XM/DC6ymRmm5/FHnKK1n0tNt9MfNZG44+LA=;
        b=u5TXvd19oNNTYaU4niHC6Xiyp+sFlCELWCKt4dnDvD5O7IvnacllvvhK4tiBiE27zy
         Jdy/zfScR1BhCnGyYpBN/mkCohY5gFtntpZdTNF3UQAQRZ+xSgkkG7xvQGRH1h/J5WXQ
         DwVro691VfmuWPGRSaDMW9lgqiMMLmETg7Vr/bM5G3QZCuET2wjGqscRLXizUcx4BWKH
         OlQby8kfLTcCJuuIRc+koOL3WBgFB0hGg/OaPZnvu2k1YZrO2C8mnwZxOUdyNuZDXue9
         y0jZbHzeu13x4AEacujvIMSASo5sl/4gT5KTMQmSJNiRa+wO2r6/6usz6V9ob4S5OZcj
         TB3w==
X-Gm-Message-State: AOAM530vbESgTtf2q8gFsRmC+qGvJFfCY3oMLN3JAYGJevTxzyIaa2cq
        dF9tVjWhgCJlIrd6ZjMYwjyXkfnyxo9XH/USEBhTJg==
X-Google-Smtp-Source: ABdhPJwnNWxiVQyM5jyoLCnaX5WsUlHB+5BzUKtHT3LR9ora7p9fYWTM4XzioYjqYEeyc3N3H4B3mbNUkBkfn0e/4hE=
X-Received: by 2002:a05:6512:3e04:: with SMTP id i4mr48946228lfv.167.1638974521403;
 Wed, 08 Dec 2021 06:42:01 -0800 (PST)
MIME-Version: 1.0
References: <20211206142929.26729-1-marten.lindahl@axis.com> <20211206142929.26729-4-marten.lindahl@axis.com>
In-Reply-To: <20211206142929.26729-4-marten.lindahl@axis.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 8 Dec 2021 15:41:24 +0100
Message-ID: <CAPDyKFqB9EV9ZGwnJ+dddJGMXUpv8OpvgY5ta_a_=_An=Ca2SQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] mmc: dw_mmc: Add quirk for extended data read timeout
To:     =?UTF-8?Q?M=C3=A5rten_Lindahl?= <marten.lindahl@axis.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Doug Anderson <dianders@google.com>, kernel@axis.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 6 Dec 2021 at 15:29, M=C3=A5rten Lindahl <marten.lindahl@axis.com> =
wrote:
>
> Current dw_mci driver supports a TMOUT register which consists of a 24
> bit field (TMOUT[31:8]) for the DATA_TIMEOUT. The maximum value of this
> field is 0xFFFFFF, which with a 200MHz clock will give a full DRTO of:
>
> 0xFFFFFF / 200000000 =3D> ~84 ms
>
> However, the ARTPEC-8 SoC DWMMC IP version has a TMOUT register with an
> extended DATA_TIMEOUT field, which supports longer timers for the DRTO.
> In this version the DATA_TIMEOUT field is split into two, which with the
> same 200MHz clock as above will allow a maximum timeout of:
>
> ((TMOUT[10:8] -1) * 0xFFFFFF + TMOUT[31:11] * 8) / 200000000 =3D> ~587 ms
>
> Add a quirk to support this. The quirk is enabled for ARTPEC-8 SoCs.
>
> Signed-off-by: M=C3=A5rten Lindahl <marten.lindahl@axis.com>
> ---
>
> v2:
>  - Removed unnecessary comment
>  - Change 1<<0 to BIT(0)
>
>  drivers/mmc/host/dw_mmc-exynos.c |  5 +++++
>  drivers/mmc/host/dw_mmc.c        | 33 ++++++++++++++++++++++++++++----
>  drivers/mmc/host/dw_mmc.h        |  6 ++++++
>  3 files changed, 40 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/dw_mmc-exynos.c b/drivers/mmc/host/dw_mmc-e=
xynos.c
> index 86486e6659de..1b625642c5b4 100644
> --- a/drivers/mmc/host/dw_mmc-exynos.c
> +++ b/drivers/mmc/host/dw_mmc-exynos.c
> @@ -127,6 +127,11 @@ static int dw_mci_exynos_priv_init(struct dw_mci *ho=
st)
>                                 DQS_CTRL_GET_RD_DELAY(priv->saved_strobe_=
ctrl);
>         }
>
> +       if (priv->ctrl_type =3D=3D DW_MCI_TYPE_ARTPEC8) {
> +               /* Quirk needed for ARTPEC-8 SoCs */
> +               host->quirks |=3D DW_MMC_QUIRK_EXTENDED_TMOUT;
> +       }
> +
>         host->bus_hz /=3D (priv->ciu_div + 1);
>
>         return 0;
> diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
> index f2a14a434bef..45ea9fd97a6a 100644
> --- a/drivers/mmc/host/dw_mmc.c
> +++ b/drivers/mmc/host/dw_mmc.c
> @@ -1289,6 +1289,7 @@ static void dw_mci_set_data_timeout(struct dw_mci *=
host,
>  {
>         u32 clk_div, tmout;
>         u64 tmp;
> +       unsigned int tmp2;
>
>         clk_div =3D (mci_readl(host, CLKDIV) & 0xFF) * 2;
>         if (clk_div =3D=3D 0)
> @@ -1301,10 +1302,28 @@ static void dw_mci_set_data_timeout(struct dw_mci=
 *host,
>         tmout =3D 0xFF; /* Set maximum */
>
>         /* TMOUT[31:8] (DATA_TIMEOUT) */
> -       if (!tmp || tmp > 0xFFFFFF)
> -               tmout |=3D (0xFFFFFF << 8);
> -       else
> -               tmout |=3D (tmp & 0xFFFFFF) << 8;
> +       if (host->quirks & DW_MMC_QUIRK_EXTENDED_TMOUT) {

Adding an option for dealing with quirks, should be avoided if
possible. That's because we want to avoid sprinkling common dw_mmc
code with variant specific code, as it will sooner or later turn into
a nightmare to maintain.

In this case, I suggest you look into extending the struct
dw_mci_drv_data with some new callback (perhaps ->set_data_timeout())
and then implement it for your variant.
If that callback is present, it should take precedence over the
generic dw_mci_set_data_timeout(), if you get what I mean.

Moreover, if some common dw_mmc code needs to be called from your
callback, I suggest we make that code available through exported
dw_mmc library functions instead.

> +               /*
> +                * Extended HW timer (max =3D 0x6FFFFF2):
> +                * ((TMOUT[10:8] - 1) * 0xFFFFFF + TMOUT[31:11] * 8)
> +                */
> +               if (!tmp || tmp > 0x6FFFFF2)
> +                       tmout |=3D (0xFFFFFF << 8);
> +               else {
> +                       /* TMOUT[10:8] */
> +                       tmp2 =3D (((unsigned int)tmp / 0xFFFFFF) + 1) & 0=
x7;
> +                       tmout |=3D tmp2 << 8;
> +
> +                       /* TMOUT[31:11] */
> +                       tmp =3D tmp - ((tmp2 - 1) * 0xFFFFFF);
> +                       tmout |=3D (tmp & 0xFFFFF8) << 8;
> +               }
> +       } else {
> +               if (!tmp || tmp > 0xFFFFFF)
> +                       tmout |=3D (0xFFFFFF << 8);
> +               else
> +                       tmout |=3D (tmp & 0xFFFFFF) << 8;
> +       }
>
>         mci_writel(host, TMOUT, tmout);
>         dev_dbg(host->dev, "timeout_ns: %u =3D> TMOUT[31:8]: 0x%#08x",
> @@ -2005,9 +2024,15 @@ static void dw_mci_set_drto(struct dw_mci *host)
>         if (drto_div =3D=3D 0)
>                 drto_div =3D 1;
>
> +       if (host->quirks & DW_MMC_QUIRK_EXTENDED_TMOUT)
> +               drto_clks =3D (((drto_clks & 0x7) - 1) * 0xFFFFFF) +
> +                       ((drto_clks & 0xFFFFF8));
> +
>         drto_ms =3D DIV_ROUND_UP_ULL((u64)MSEC_PER_SEC * drto_clks * drto=
_div,
>                                    host->bus_hz);
>
> +       dev_dbg(host->dev, "drto_ms: %u\n", drto_ms);
> +
>         /* add a bit spare time */
>         drto_ms +=3D 10;
>
> diff --git a/drivers/mmc/host/dw_mmc.h b/drivers/mmc/host/dw_mmc.h
> index 771d5afa3136..3b6510d4a684 100644
> --- a/drivers/mmc/host/dw_mmc.h
> +++ b/drivers/mmc/host/dw_mmc.h
> @@ -118,6 +118,7 @@ struct dw_mci_dma_slave {
>   * @part_buf: Simple buffer for partial fifo reads/writes.
>   * @push_data: Pointer to FIFO push function.
>   * @pull_data: Pointer to FIFO pull function.
> + * @quirks: Set of quirks that apply to specific versions of the IP.
>   * @vqmmc_enabled: Status of vqmmc, should be true or false.
>   * @irq_flags: The flags to be passed to request_irq.
>   * @irq: The irq value to be passed to request_irq.
> @@ -223,6 +224,8 @@ struct dw_mci {
>         void (*push_data)(struct dw_mci *host, void *buf, int cnt);
>         void (*pull_data)(struct dw_mci *host, void *buf, int cnt);
>
> +       u32                     quirks;
> +
>         bool                    vqmmc_enabled;
>         unsigned long           irq_flags; /* IRQ flags */
>         int                     irq;
> @@ -274,6 +277,9 @@ struct dw_mci_board {
>         struct dma_pdata *data;
>  };
>
> +/* Support for longer data read timeout */
> +#define DW_MMC_QUIRK_EXTENDED_TMOUT            BIT(0)
> +
>  #define DW_MMC_240A            0x240a
>  #define DW_MMC_280A            0x280a
>

Kind regards
Uffe
