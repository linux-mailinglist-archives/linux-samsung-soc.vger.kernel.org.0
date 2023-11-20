Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 431967F208B
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 20 Nov 2023 23:46:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229781AbjKTWqQ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 20 Nov 2023 17:46:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbjKTWqQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Nov 2023 17:46:16 -0500
Received: from mail-qv1-xf31.google.com (mail-qv1-xf31.google.com [IPv6:2607:f8b0:4864:20::f31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C36B2CB
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Nov 2023 14:46:09 -0800 (PST)
Received: by mail-qv1-xf31.google.com with SMTP id 6a1803df08f44-677f974b72bso14738546d6.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Nov 2023 14:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700520369; x=1701125169; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=njoGUAO/aKU6y+B0kYXrWx9rr0gLschtaZIB6sJvVdU=;
        b=Cf0r6khSUB9nvaHf3+ily/2Rp8cWMG0TRIv6aMoSEBXFCdaSl8WzpWnoUsvv0Lv8h8
         NpVUd1YnZ0HDpnXRKVLLeh/IPV2/IJLJNoucia/xr9s0nb/Dg6BW6wrK1i0T3zKJ2Bmq
         t1ooAhxtjKC5kwQyUayLVY1CoIL3Lt06p2NaX16HCfd+cGX32BFqEUcH8PNab/pRGaaM
         jbVi/RBIhpMhN3gTKWbOX+YhHmVVs7EjGEI0zUpaKhtnk+PuOFH+Vq+Bo9hQtal5rHme
         GaG5Qh2NcDlp1P9RtKSYA9pIPIs2tubVY6O01ZytGMSGYYLWKY86NtFaodeWfi2El788
         ToXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700520369; x=1701125169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njoGUAO/aKU6y+B0kYXrWx9rr0gLschtaZIB6sJvVdU=;
        b=w3E+2anVmhl+GXfkN0yud+/l4CXU/P5Nw3j7QM+DoGjG18bnd38CK/Uxmx0tlpIN5P
         wzYpcgU4pWDZO7R2MUf/PODW40Xpp1cNNjV07ES+a8S9i82Sxv3mgdnnXHAwPE3q/Ub8
         ye6Aa0PlWRDggysTiy+AJIjd124P2vtxPF68LahDNxoWVsIDSlCAbASQ9s2nfZ96dIo6
         QcX8PiBm8boP/seqDR1qKU+gmcGBi9vIbRjJTDfbO9GXRTgPMMJSyB4FE/8zB4VOG2z6
         X1XbstLFpmA3lxrSKd+pyz+8cPhHUVbVYgmJ9urOyT4ZRHUGnQQcok550FpF5mvk5eTq
         dmSA==
X-Gm-Message-State: AOJu0YyohICRpuoYN1ZaHk1jworvD+K1R449UffjcafKN+mwOMv1tqJz
        ht44AySaVqTVZ4cEMI4ovxjf7an0jYBxGd2xPGOPrg==
X-Google-Smtp-Source: AGHT+IG/+m3xt7ccY8eDIleAiRsOAh79Ehhifx5D3WhBv4fQmrHh9AAauod19bUGyqw4eilwyZq13diIFEILCwXsTac=
X-Received: by 2002:ad4:4ea9:0:b0:679:e195:b071 with SMTP id
 ed9-20020ad44ea9000000b00679e195b071mr3321524qvb.9.1700520368792; Mon, 20 Nov
 2023 14:46:08 -0800 (PST)
MIME-Version: 1.0
References: <20231120212037.911774-1-peter.griffin@linaro.org>
 <20231120212037.911774-16-peter.griffin@linaro.org> <5ee955e4-4c22-4696-8001-1e4f24952eeb@roeck-us.net>
In-Reply-To: <5ee955e4-4c22-4696-8001-1e4f24952eeb@roeck-us.net>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Mon, 20 Nov 2023 22:45:57 +0000
Message-ID: <CADrjBPoHYTZiMCFKBtdaT6hFp9QO=GMzn5yE2k3Dg_mcBhrvkA@mail.gmail.com>
Subject: Re: [PATCH v4 15/19] watchdog: s3c2410_wdt: Add support for WTCON
 register DBGACK_MASK bit
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de,
        olof@lixom.net, gregkh@linuxfoundation.org, jirislaby@kernel.org,
        cw00.choi@samsung.com, alim.akhtar@samsung.com,
        tudor.ambarus@linaro.org, andre.draszik@linaro.org,
        semen.protsenko@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Guenter,

Thanks for the review.

On Mon, 20 Nov 2023 at 22:00, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 11/20/23 13:20, Peter Griffin wrote:
> > The WDT uses the CPU core signal DBGACK to determine whether the SoC
> > is running in debug mode or not. If the DBGACK signal is asserted and
> > DBGACK_MASK is enabled, then WDT output and interrupt is masked.
> >
> > Presence of the DBGACK_MASK bit is determined by adding a new
> > QUIRK_HAS_DBGACK_BIT quirk. Currently only gs101 SoC is known to have
> > the DBGACK_MASK bit so add the quirk to drv_data_gs101_cl1 and
> > drv_data_gs101_cl1 quirks.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >   drivers/watchdog/s3c2410_wdt.c | 32 +++++++++++++++++++++++++++-----
> >   1 file changed, 27 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> > index 08b8c57dd812..ed561deeeed9 100644
> > --- a/drivers/watchdog/s3c2410_wdt.c
> > +++ b/drivers/watchdog/s3c2410_wdt.c
> > @@ -34,9 +34,10 @@
> >
> >   #define S3C2410_WTCNT_MAXCNT        0xffff
> >
> > -#define S3C2410_WTCON_RSTEN  (1 << 0)
> > -#define S3C2410_WTCON_INTEN  (1 << 2)
> > -#define S3C2410_WTCON_ENABLE (1 << 5)
> > +#define S3C2410_WTCON_RSTEN          (1 << 0)
> > +#define S3C2410_WTCON_INTEN          (1 << 2)
> > +#define S3C2410_WTCON_ENABLE         (1 << 5)
> > +#define S3C2410_WTCON_DBGACK_MASK    (1 << 16)
> >
> >   #define S3C2410_WTCON_DIV16 (0 << 3)
> >   #define S3C2410_WTCON_DIV32 (1 << 3)
> > @@ -107,12 +108,16 @@
> >    * %QUIRK_HAS_PMU_CNT_EN: PMU block has some register (e.g. CLUSTERx_NONCPU_OUT)
> >    * with "watchdog counter enable" bit. That bit should be set to make watchdog
> >    * counter running.
> > + *
> > + * %QUIRK_HAS_DBGACK_BIT: WTCON register has DBGACK_MASK bit. Enables masking
> > + * WDT interrupt and reset request according to CPU core DBGACK signal.
>
> This is a bit difficult to understand. I _think_ it means that the DBGACK_MASK bit
> has to be set to be able to trigger interrupt and reset requests.

Not quite, it is a bit that controls masking the watchdog outputs when the SoC
is in debug mode.

> "masking" normally refers to disabling something (at least in interrupt context).
> "Enables masking WDT interrupt" sounds like the bit has to be set in order to
> be able to disable interupts, and the code below suggests that the bit has to be
> set for the driver to work. Is that the case ? It might make sense to explain this
> a bit further.

Maybe I explained it more clearly in the commit message than the comment

"The WDT uses the CPU core signal DBGACK to determine whether the SoC
is running in debug mode or not. If the DBGACK signal is asserted and
DBGACK_MASK is enabled, then WDT output and interrupt is masked."

Is that any clearer? Or maybe simpler again

"Enabling DBGACK_MASK bit masks the watchdog outputs when the SoC is
in debug mode. Debug mode is determined by the DBGACK CPU signal."

Let me know what you think is the clearest and most succinct and I can
update the comment.

>
> >    */
> >   #define QUIRK_HAS_WTCLRINT_REG                      (1 << 0)
> >   #define QUIRK_HAS_PMU_MASK_RESET            (1 << 1)
> >   #define QUIRK_HAS_PMU_RST_STAT                      (1 << 2)
> >   #define QUIRK_HAS_PMU_AUTO_DISABLE          (1 << 3)
> >   #define QUIRK_HAS_PMU_CNT_EN                        (1 << 4)
> > +#define QUIRK_HAS_DBGACK_BIT                 (1 << 5)
> >
> >   /* These quirks require that we have a PMU register map */
> >   #define QUIRKS_HAVE_PMUREG \
> > @@ -279,7 +284,7 @@ static const struct s3c2410_wdt_variant drv_data_gs101_cl0 = {
> >       .cnt_en_reg = GS_CLUSTER0_NONCPU_OUT,
> >       .cnt_en_bit = 8,
> >       .quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
> > -               QUIRK_HAS_WTCLRINT_REG,
> > +               QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT,
> >   };
> >
> >   static const struct s3c2410_wdt_variant drv_data_gs101_cl1 = {
> > @@ -291,7 +296,7 @@ static const struct s3c2410_wdt_variant drv_data_gs101_cl1 = {
> >       .cnt_en_reg = GS_CLUSTER1_NONCPU_OUT,
> >       .cnt_en_bit = 7,
> >       .quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET | QUIRK_HAS_PMU_CNT_EN |
> > -               QUIRK_HAS_WTCLRINT_REG,
> > +               QUIRK_HAS_WTCLRINT_REG | QUIRK_HAS_DBGACK_BIT,
> >   };
> >
> >   static const struct of_device_id s3c2410_wdt_match[] = {
> > @@ -408,6 +413,21 @@ static int s3c2410wdt_enable(struct s3c2410_wdt *wdt, bool en)
> >       return 0;
> >   }
> >
> > +static void s3c2410wdt_mask_dbgack(struct s3c2410_wdt *wdt, bool mask)
>
> I think I must be missing something. This is only ever called with mask==true,
> meaning the bit, if present, is always set.
>
> Why not call the function s3c2410wdt_set_dbgack() and drop the unnecessary
> parameter ?

I can update like you suggest, it would simplify the logic a little bit.

regards,

Peter.
