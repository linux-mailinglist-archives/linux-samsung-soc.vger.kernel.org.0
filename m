Return-Path: <linux-samsung-soc+bounces-1320-lists+linux-samsung-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2A883CCD4
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Jan 2024 20:50:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6014C1C21FA2
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 25 Jan 2024 19:50:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A526F135407;
	Thu, 25 Jan 2024 19:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S1LzMd8H"
X-Original-To: linux-samsung-soc@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60E11350C4
	for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 19:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706212222; cv=none; b=bOq3GtyERycZ0ULdY2E94Hm2YSCmcuMPWLnI2Kbcz3UBX4LgtWzRFyVjjD44K7tyHwGgfY67upPW+62lQeHXb8V6ZW0CdkPUpy9uHoXCTb+oLmwEnp8c1a2R/3U7b/v8f1sYeVtnzoi6NvF/LH7+OtP+kTWS+OHDZ3bCQIfOceI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706212222; c=relaxed/simple;
	bh=tBk4zu+lsV3XL5KjNu4RSuzuNtJ4Ta8QUiVrpKLbLbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=apc02jiQpchEkhLKhl8T1CxMErLetFB7or9eKbKzzlFvDmFtWP30BO3Cse9y0oP75VUk7MufOT0YUh/BAEgmxCZT5hEZv4f8F4t+FCWkRUvqgP6Hu2dZnNWY+AWko9U8sPqdZ43zPeW7G6SeAnBS8Tb/Ly8A0CH0hE6qhcu8mc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S1LzMd8H; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-290b37bb7deso3518462a91.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 25 Jan 2024 11:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706212220; x=1706817020; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JR7r6jZyM2WV2rpiG2kKeOnVSmGmuFbZSyqr0yy7yWw=;
        b=S1LzMd8HfLhDUAsBj6k/ERP15h2PMbjJ7rvBI9edbVZCNaFyrWVdWZMQzt18s9kxLc
         rzL58mbyAPa2SLjLZ1kKnnhNaXKxUNrlSyx9N2RCtdpy1dwcTbgFovGVVSHVaJIYRYIb
         bPlcAs8lzaUG1A6AD98hZReFzcDWii/lX8U5mY9ePRgIb9xQ5mQa1HLDKnmSBnn+LjFz
         +gzMt/3S4SRSF4e7p/Jx5AX2HvftI+qr2pH/UwuSypb9yHwDFF5Kb/twfY3e6LTMZTMB
         dHXz91FoVu07HJ+sX57VJZMM0yfbG12tqQfp32sK6OQRrvw60jc5H/Lc/FL6QW1S5YfM
         8tzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706212220; x=1706817020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JR7r6jZyM2WV2rpiG2kKeOnVSmGmuFbZSyqr0yy7yWw=;
        b=PcMERhCYD5E5J6cNYBITlo4zsGHBcY3vzJSQ/uSXox/ZIkCgc70Q+ZC5PrFX1Tv99Q
         o28v2y+kNOzDAzFSjIq7fvW/rr0j2LCdBiAb5f58DQ/FbpRag9Xqt6SqOo+TCt/LTQo1
         99PLLsJ1Yunzk5ENWouIRwRlUcz73BSyC7rCWstc5sdda3TDo0P8+/csY0tSRo8Olr/k
         Gkvu+272cCqAemSVrXElhh1npPwUEqMfzermLCi8EUNXxOcW7McwonIVwV5gVZqGlc0P
         qrndyz1K2lC3SR78B98r1H8y8Qq8xpPwhxAE9Iwu2t+BentUg6ibawBOGxVMhILvsqDh
         WfWA==
X-Gm-Message-State: AOJu0YzAHr8o3cp106jVU2oO8mW1Tz+FB+k4Wd89D05lAITlmUW1wpRG
	B7tGT6bgYQebMYvHTxKvalz50Zsbn5SMPK8eMgnBR4McVio+oOSa7d46NFwEIu1s+M5IwLBUYrP
	gUsIyYyYqc2C1EBbpUI5vnpOY+NK/+TysRSzdOw==
X-Google-Smtp-Source: AGHT+IEoYnzv4m6TMB8HqQaGEVicixUI4nRLVxW6D6j9aZdE7TOuUG/TUTamd7ppdRRcNSRTBkOr9Gu1mwkxVd0vrAk=
X-Received: by 2002:a17:90a:8685:b0:28e:87a0:c05b with SMTP id
 p5-20020a17090a868500b0028e87a0c05bmr133256pjn.40.1706212220051; Thu, 25 Jan
 2024 11:50:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125145007.748295-1-tudor.ambarus@linaro.org> <20240125145007.748295-10-tudor.ambarus@linaro.org>
In-Reply-To: <20240125145007.748295-10-tudor.ambarus@linaro.org>
From: Sam Protsenko <semen.protsenko@linaro.org>
Date: Thu, 25 Jan 2024 13:50:08 -0600
Message-ID: <CAPLW+4mDM2aJdPwPRKt9yLtwx5zEHwBr6OSyYbGgZU7w9OiYkg@mail.gmail.com>
Subject: Re: [PATCH v2 09/28] spi: s3c64xx: use bitfield access macros
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: broonie@kernel.org, andi.shyti@kernel.org, arnd@arndb.de, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, linux-spi@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arch@vger.kernel.org, andre.draszik@linaro.org, 
	peter.griffin@linaro.org, kernel-team@android.com, willmcvicker@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 8:50=E2=80=AFAM Tudor Ambarus <tudor.ambarus@linaro=
.org> wrote:
>
> Use the bitfield access macros in order to clean and to make the driver
> easier to read.
>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
>  drivers/spi/spi-s3c64xx.c | 196 +++++++++++++++++++-------------------
>  1 file changed, 99 insertions(+), 97 deletions(-)
>
> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
> index 1e44b24f6401..d046810da51f 100644
> --- a/drivers/spi/spi-s3c64xx.c
> +++ b/drivers/spi/spi-s3c64xx.c
> @@ -4,6 +4,7 @@
>  //      Jaswinder Singh <jassi.brar@samsung.com>
>
>  #include <linux/bits.h>
> +#include <linux/bitfield.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/dma-mapping.h>
> @@ -18,91 +19,91 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/spi/spi.h>
>
> -#define MAX_SPI_PORTS          12
> -#define S3C64XX_SPI_QUIRK_CS_AUTO      (1 << 1)
> -#define AUTOSUSPEND_TIMEOUT    2000
> +#define MAX_SPI_PORTS                          12
> +#define S3C64XX_SPI_QUIRK_CS_AUTO              BIT(1)
> +#define AUTOSUSPEND_TIMEOUT                    2000
>
>  /* Registers and bit-fields */
>
> -#define S3C64XX_SPI_CH_CFG             0x00
> -#define S3C64XX_SPI_CLK_CFG            0x04
> -#define S3C64XX_SPI_MODE_CFG           0x08
> -#define S3C64XX_SPI_CS_REG             0x0C
> -#define S3C64XX_SPI_INT_EN             0x10
> -#define S3C64XX_SPI_STATUS             0x14
> -#define S3C64XX_SPI_TX_DATA            0x18
> -#define S3C64XX_SPI_RX_DATA            0x1C
> -#define S3C64XX_SPI_PACKET_CNT         0x20
> -#define S3C64XX_SPI_PENDING_CLR                0x24
> -#define S3C64XX_SPI_SWAP_CFG           0x28
> -#define S3C64XX_SPI_FB_CLK             0x2C
> -
> -#define S3C64XX_SPI_CH_HS_EN           (1<<6)  /* High Speed Enable */
> -#define S3C64XX_SPI_CH_SW_RST          (1<<5)
> -#define S3C64XX_SPI_CH_SLAVE           (1<<4)
> -#define S3C64XX_SPI_CPOL_L             (1<<3)
> -#define S3C64XX_SPI_CPHA_B             (1<<2)
> -#define S3C64XX_SPI_CH_RXCH_ON         (1<<1)
> -#define S3C64XX_SPI_CH_TXCH_ON         (1<<0)
> -
> -#define S3C64XX_SPI_CLKSEL_SRCMSK      (3<<9)
> -#define S3C64XX_SPI_CLKSEL_SRCSHFT     9
> -#define S3C64XX_SPI_ENCLK_ENABLE       (1<<8)
> -#define S3C64XX_SPI_PSR_MASK           0xff
> -
> -#define S3C64XX_SPI_MODE_CH_TSZ_BYTE           (0<<29)
> -#define S3C64XX_SPI_MODE_CH_TSZ_HALFWORD       (1<<29)
> -#define S3C64XX_SPI_MODE_CH_TSZ_WORD           (2<<29)
> -#define S3C64XX_SPI_MODE_CH_TSZ_MASK           (3<<29)
> -#define S3C64XX_SPI_MODE_BUS_TSZ_BYTE          (0<<17)
> -#define S3C64XX_SPI_MODE_BUS_TSZ_HALFWORD      (1<<17)
> -#define S3C64XX_SPI_MODE_BUS_TSZ_WORD          (2<<17)
> -#define S3C64XX_SPI_MODE_BUS_TSZ_MASK          (3<<17)
> +#define S3C64XX_SPI_CH_CFG                     0x00
> +#define S3C64XX_SPI_CLK_CFG                    0x04
> +#define S3C64XX_SPI_MODE_CFG                   0x08
> +#define S3C64XX_SPI_CS_REG                     0x0C
> +#define S3C64XX_SPI_INT_EN                     0x10
> +#define S3C64XX_SPI_STATUS                     0x14
> +#define S3C64XX_SPI_TX_DATA                    0x18
> +#define S3C64XX_SPI_RX_DATA                    0x1C
> +#define S3C64XX_SPI_PACKET_CNT                 0x20
> +#define S3C64XX_SPI_PENDING_CLR                        0x24
> +#define S3C64XX_SPI_SWAP_CFG                   0x28
> +#define S3C64XX_SPI_FB_CLK                     0x2C
> +
> +#define S3C64XX_SPI_CH_HS_EN                   BIT(6)  /* High Speed Ena=
ble */
> +#define S3C64XX_SPI_CH_SW_RST                  BIT(5)
> +#define S3C64XX_SPI_CH_SLAVE                   BIT(4)
> +#define S3C64XX_SPI_CPOL_L                     BIT(3)
> +#define S3C64XX_SPI_CPHA_B                     BIT(2)
> +#define S3C64XX_SPI_CH_RXCH_ON                 BIT(1)
> +#define S3C64XX_SPI_CH_TXCH_ON                 BIT(0)
> +
> +#define S3C64XX_SPI_CLKSEL_SRCMSK              GENMASK(10, 9)
> +#define S3C64XX_SPI_ENCLK_ENABLE               BIT(8)
> +#define S3C64XX_SPI_PSR_MASK                   GENMASK(15, 0)

But it was 0xff (7:0) originally, and here you extend it up to 15:0.
Was it intentional? If so, I'd advice to keep non-functional changes
as a separate patch, and pull all functional changes like these into
another one, probably with an explanation why it's needed.

> +
> +#define S3C64XX_SPI_MODE_CH_TSZ_MASK           GENMASK(30, 29)
> +#define S3C64XX_SPI_MODE_CH_TSZ_BYTE           0
> +#define S3C64XX_SPI_MODE_CH_TSZ_HALFWORD       1
> +#define S3C64XX_SPI_MODE_CH_TSZ_WORD           2
> +#define S3C64XX_SPI_MAX_TRAILCNT_MASK          GENMASK(28, 19)
> +#define S3C64XX_SPI_MODE_BUS_TSZ_MASK          GENMASK(18, 17)
> +#define S3C64XX_SPI_MODE_BUS_TSZ_BYTE          0
> +#define S3C64XX_SPI_MODE_BUS_TSZ_HALFWORD      1
> +#define S3C64XX_SPI_MODE_BUS_TSZ_WORD          2
>  #define S3C64XX_SPI_MODE_RX_RDY_LVL            GENMASK(16, 11)
> -#define S3C64XX_SPI_MODE_RX_RDY_LVL_SHIFT      11
> -#define S3C64XX_SPI_MODE_SELF_LOOPBACK         (1<<3)
> -#define S3C64XX_SPI_MODE_RXDMA_ON              (1<<2)
> -#define S3C64XX_SPI_MODE_TXDMA_ON              (1<<1)
> -#define S3C64XX_SPI_MODE_4BURST                        (1<<0)
> -
> -#define S3C64XX_SPI_CS_NSC_CNT_2               (2<<4)
> -#define S3C64XX_SPI_CS_AUTO                    (1<<1)
> -#define S3C64XX_SPI_CS_SIG_INACT               (1<<0)
> -
> -#define S3C64XX_SPI_INT_TRAILING_EN            (1<<6)
> -#define S3C64XX_SPI_INT_RX_OVERRUN_EN          (1<<5)
> -#define S3C64XX_SPI_INT_RX_UNDERRUN_EN         (1<<4)
> -#define S3C64XX_SPI_INT_TX_OVERRUN_EN          (1<<3)
> -#define S3C64XX_SPI_INT_TX_UNDERRUN_EN         (1<<2)
> -#define S3C64XX_SPI_INT_RX_FIFORDY_EN          (1<<1)
> -#define S3C64XX_SPI_INT_TX_FIFORDY_EN          (1<<0)
> -
> -#define S3C64XX_SPI_ST_RX_OVERRUN_ERR          (1<<5)
> -#define S3C64XX_SPI_ST_RX_UNDERRUN_ERR         (1<<4)
> -#define S3C64XX_SPI_ST_TX_OVERRUN_ERR          (1<<3)
> -#define S3C64XX_SPI_ST_TX_UNDERRUN_ERR         (1<<2)
> -#define S3C64XX_SPI_ST_RX_FIFORDY              (1<<1)
> -#define S3C64XX_SPI_ST_TX_FIFORDY              (1<<0)
> -
> -#define S3C64XX_SPI_PACKET_CNT_EN              (1<<16)
> +#define S3C64XX_SPI_MODE_SELF_LOOPBACK         BIT(3)
> +#define S3C64XX_SPI_MODE_RXDMA_ON              BIT(2)
> +#define S3C64XX_SPI_MODE_TXDMA_ON              BIT(1)
> +#define S3C64XX_SPI_MODE_4BURST                        BIT(0)
> +
> +#define S3C64XX_SPI_CS_NSC_CNT_MASK            GENMASK(9, 4)
> +#define S3C64XX_SPI_CS_NSC_CNT_2               2
> +#define S3C64XX_SPI_CS_AUTO                    BIT(1)
> +#define S3C64XX_SPI_CS_SIG_INACT               BIT(0)
> +
> +#define S3C64XX_SPI_INT_TRAILING_EN            BIT(6)
> +#define S3C64XX_SPI_INT_RX_OVERRUN_EN          BIT(5)
> +#define S3C64XX_SPI_INT_RX_UNDERRUN_EN         BIT(4)
> +#define S3C64XX_SPI_INT_TX_OVERRUN_EN          BIT(3)
> +#define S3C64XX_SPI_INT_TX_UNDERRUN_EN         BIT(2)
> +#define S3C64XX_SPI_INT_RX_FIFORDY_EN          BIT(1)
> +#define S3C64XX_SPI_INT_TX_FIFORDY_EN          BIT(0)
> +
> +#define S3C64XX_SPI_ST_RX_OVERRUN_ERR          BIT(5)
> +#define S3C64XX_SPI_ST_RX_UNDERRUN_ERR         BIT(4)
> +#define S3C64XX_SPI_ST_TX_OVERRUN_ERR          BIT(3)
> +#define S3C64XX_SPI_ST_TX_UNDERRUN_ERR         BIT(2)
> +#define S3C64XX_SPI_ST_RX_FIFORDY              BIT(1)
> +#define S3C64XX_SPI_ST_TX_FIFORDY              BIT(0)
> +
> +#define S3C64XX_SPI_PACKET_CNT_EN              BIT(16)
>  #define S3C64XX_SPI_PACKET_CNT_MASK            GENMASK(15, 0)
>
> -#define S3C64XX_SPI_PND_TX_UNDERRUN_CLR                (1<<4)
> -#define S3C64XX_SPI_PND_TX_OVERRUN_CLR         (1<<3)
> -#define S3C64XX_SPI_PND_RX_UNDERRUN_CLR                (1<<2)
> -#define S3C64XX_SPI_PND_RX_OVERRUN_CLR         (1<<1)
> -#define S3C64XX_SPI_PND_TRAILING_CLR           (1<<0)
> +#define S3C64XX_SPI_PND_TX_UNDERRUN_CLR                BIT(4)
> +#define S3C64XX_SPI_PND_TX_OVERRUN_CLR         BIT(3)
> +#define S3C64XX_SPI_PND_RX_UNDERRUN_CLR                BIT(2)
> +#define S3C64XX_SPI_PND_RX_OVERRUN_CLR         BIT(1)
> +#define S3C64XX_SPI_PND_TRAILING_CLR           BIT(0)
>
> -#define S3C64XX_SPI_SWAP_RX_HALF_WORD          (1<<7)
> -#define S3C64XX_SPI_SWAP_RX_BYTE               (1<<6)
> -#define S3C64XX_SPI_SWAP_RX_BIT                        (1<<5)
> -#define S3C64XX_SPI_SWAP_RX_EN                 (1<<4)
> -#define S3C64XX_SPI_SWAP_TX_HALF_WORD          (1<<3)
> -#define S3C64XX_SPI_SWAP_TX_BYTE               (1<<2)
> -#define S3C64XX_SPI_SWAP_TX_BIT                        (1<<1)
> -#define S3C64XX_SPI_SWAP_TX_EN                 (1<<0)
> +#define S3C64XX_SPI_SWAP_RX_HALF_WORD          BIT(7)
> +#define S3C64XX_SPI_SWAP_RX_BYTE               BIT(6)
> +#define S3C64XX_SPI_SWAP_RX_BIT                        BIT(5)
> +#define S3C64XX_SPI_SWAP_RX_EN                 BIT(4)
> +#define S3C64XX_SPI_SWAP_TX_HALF_WORD          BIT(3)
> +#define S3C64XX_SPI_SWAP_TX_BYTE               BIT(2)
> +#define S3C64XX_SPI_SWAP_TX_BIT                        BIT(1)
> +#define S3C64XX_SPI_SWAP_TX_EN                 BIT(0)
>
> -#define S3C64XX_SPI_FBCLK_MSK                  (3<<0)
> +#define S3C64XX_SPI_FBCLK_MASK                 GENMASK(1, 0)
>
>  #define FIFO_LVL_MASK(i) ((i)->port_conf->fifo_lvl_mask[i->port_id])
>  #define S3C64XX_SPI_ST_TX_DONE(v, i) (((v) & \
> @@ -112,18 +113,13 @@
>                                         FIFO_LVL_MASK(i))
>  #define FIFO_DEPTH(i) ((FIFO_LVL_MASK(i) >> 1) + 1)
>
> -#define S3C64XX_SPI_MAX_TRAILCNT       0x3ff
> -#define S3C64XX_SPI_TRAILCNT_OFF       19
> -
> -#define S3C64XX_SPI_TRAILCNT           S3C64XX_SPI_MAX_TRAILCNT
> -
>  #define S3C64XX_SPI_POLLING_SIZE       32
>
>  #define msecs_to_loops(t) (loops_per_jiffy / 1000 * HZ * t)
>  #define is_polling(x)  (x->cntrlr_info->polling)
>
> -#define RXBUSY    (1<<2)
> -#define TXBUSY    (1<<3)
> +#define RXBUSY    BIT(2)
> +#define TXBUSY    BIT(3)
>
>  struct s3c64xx_spi_dma_data {
>         struct dma_chan *ch;
> @@ -342,8 +338,9 @@ static void s3c64xx_spi_set_cs(struct spi_device *spi=
, bool enable)
>                 } else {
>                         u32 ssel =3D readl(sdd->regs + S3C64XX_SPI_CS_REG=
);
>
> -                       ssel |=3D (S3C64XX_SPI_CS_AUTO |
> -                                               S3C64XX_SPI_CS_NSC_CNT_2)=
;
> +                       ssel |=3D S3C64XX_SPI_CS_AUTO |
> +                               FIELD_PREP(S3C64XX_SPI_CS_NSC_CNT_MASK,
> +                                          S3C64XX_SPI_CS_NSC_CNT_2);
>                         writel(ssel, sdd->regs + S3C64XX_SPI_CS_REG);
>                 }
>         } else {
> @@ -666,16 +663,22 @@ static int s3c64xx_spi_config(struct s3c64xx_spi_dr=
iver_data *sdd)
>
>         switch (sdd->cur_bpw) {
>         case 32:
> -               val |=3D S3C64XX_SPI_MODE_BUS_TSZ_WORD;
> -               val |=3D S3C64XX_SPI_MODE_CH_TSZ_WORD;
> +               val |=3D FIELD_PREP(S3C64XX_SPI_MODE_BUS_TSZ_MASK,
> +                                 S3C64XX_SPI_MODE_BUS_TSZ_WORD) |
> +                      FIELD_PREP(S3C64XX_SPI_MODE_CH_TSZ_MASK,
> +                                 S3C64XX_SPI_MODE_CH_TSZ_WORD);
>                 break;
>         case 16:
> -               val |=3D S3C64XX_SPI_MODE_BUS_TSZ_HALFWORD;
> -               val |=3D S3C64XX_SPI_MODE_CH_TSZ_HALFWORD;
> +               val |=3D FIELD_PREP(S3C64XX_SPI_MODE_BUS_TSZ_MASK,
> +                                 S3C64XX_SPI_MODE_BUS_TSZ_HALFWORD) |
> +                      FIELD_PREP(S3C64XX_SPI_MODE_CH_TSZ_MASK,
> +                                 S3C64XX_SPI_MODE_CH_TSZ_HALFWORD);
>                 break;
>         default:
> -               val |=3D S3C64XX_SPI_MODE_BUS_TSZ_BYTE;
> -               val |=3D S3C64XX_SPI_MODE_CH_TSZ_BYTE;
> +               val |=3D FIELD_PREP(S3C64XX_SPI_MODE_BUS_TSZ_MASK,
> +                                 S3C64XX_SPI_MODE_BUS_TSZ_BYTE) |
> +                      FIELD_PREP(S3C64XX_SPI_MODE_CH_TSZ_MASK,
> +                                 S3C64XX_SPI_MODE_CH_TSZ_BYTE);

I don't know. Maybe it's me, but using this FIELD_PREP() macro seems
to only making the code harder to read. At least in cases like this. I
would vote against its usage, to keep the code compact and easy to
read.

>                 break;
>         }
>
> @@ -801,7 +804,7 @@ static int s3c64xx_spi_transfer_one(struct spi_contro=
ller *host,
>
>                         val =3D readl(sdd->regs + S3C64XX_SPI_MODE_CFG);
>                         val &=3D ~S3C64XX_SPI_MODE_RX_RDY_LVL;
> -                       val |=3D (rdy_lv << S3C64XX_SPI_MODE_RX_RDY_LVL_S=
HIFT);
> +                       val |=3D FIELD_PREP(S3C64XX_SPI_MODE_RX_RDY_LVL, =
rdy_lv);
>                         writel(val, sdd->regs + S3C64XX_SPI_MODE_CFG);
>
>                         /* Enable FIFO_RDY_EN IRQ */
> @@ -1074,8 +1077,8 @@ static void s3c64xx_spi_hwinit(struct s3c64xx_spi_d=
river_data *sdd)
>         writel(0, regs + S3C64XX_SPI_INT_EN);
>
>         if (!sdd->port_conf->clk_from_cmu)
> -               writel(sci->src_clk_nr << S3C64XX_SPI_CLKSEL_SRCSHFT,
> -                               regs + S3C64XX_SPI_CLK_CFG);
> +               writel(FIELD_PREP(S3C64XX_SPI_CLKSEL_SRCMSK, sci->src_clk=
_nr),
> +                      regs + S3C64XX_SPI_CLK_CFG);
>         writel(0, regs + S3C64XX_SPI_MODE_CFG);
>         writel(0, regs + S3C64XX_SPI_PACKET_CNT);
>
> @@ -1091,8 +1094,7 @@ static void s3c64xx_spi_hwinit(struct s3c64xx_spi_d=
river_data *sdd)
>
>         val =3D readl(regs + S3C64XX_SPI_MODE_CFG);
>         val &=3D ~S3C64XX_SPI_MODE_4BURST;
> -       val &=3D ~(S3C64XX_SPI_MAX_TRAILCNT << S3C64XX_SPI_TRAILCNT_OFF);

Doesn't it change the behavior?

> -       val |=3D (S3C64XX_SPI_TRAILCNT << S3C64XX_SPI_TRAILCNT_OFF);
> +       val |=3D S3C64XX_SPI_MAX_TRAILCNT_MASK;
>         writel(val, regs + S3C64XX_SPI_MODE_CFG);
>
>         s3c64xx_flush_fifo(sdd);
> --
> 2.43.0.429.g432eaa2c6b-goog
>

