Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73C807C6D97
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 12 Oct 2023 14:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343918AbjJLMHO (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 12 Oct 2023 08:07:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234148AbjJLMHM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 12 Oct 2023 08:07:12 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B11C9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Oct 2023 05:07:05 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 3f1490d57ef6-d9a6b21d1daso962440276.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 12 Oct 2023 05:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697112424; x=1697717224; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRmCoQd3Oq9RNOHVhy1ujcGBy+u8IR5dYM6AT3Q6bG0=;
        b=DrLrQlWpSNMQMtS9D3eVUTnSGRoqBjVdvY3yTfzkHH2hKXcwpsQVrQs9Jk6KezAJY6
         AQDUvT9aG5jNSUNlsJoA1pV5HRTBQlzyrsOeX9pKPK/LC3t8z//4wwZOeYUEGjr1Ldqs
         fPjfynzKUwFEwoR1iKMsFTw/IEJTfxJaG2VpwyxcPA26KNtvYkvpMNei+5aA0BBHMgmq
         o3jnDRV9n0hqxXCKKoKNxLMD+U4DK+9t3XxtSVrglKsAYXQi96jSGbKz7OqHrLFvLsVu
         f+E50iyOx/PhRv+ZPzmIA54J78Z25GIBmMoTKioDXO9APWKfO42ePjTWGPp5hGRM4zSf
         bBeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697112424; x=1697717224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zRmCoQd3Oq9RNOHVhy1ujcGBy+u8IR5dYM6AT3Q6bG0=;
        b=nCqkWKBrpGMklf/qC17MANdvNgyJMRw13Hhs9kwwLcRVVGW70TBldJWqbSXFdKtTJt
         EoPPqMLEnJ4TGAZ3TkFuiDsphb8kZD4flHulZFiLZiUAFgs42Zmv4lk7TrJ5YpJIucDH
         5nNE35qIz/fNchEaiqSKKvaT4erGiMMnyXg+0S8ZuUq+5wvFINaMCOf1ffzCAiE1vGw2
         /uqeU9ipX/gl+u0QTe3BugGpNOWanASP7VTOmlWFtPsSwx8KLJjr9u8jgD6GTLk+OjPi
         4cjFPrf1WvIpzurDWBclB8Mq/THc/j117McB9cMhZmoq17kiE+w6KP4u+uzQ0p1l3R4U
         B52g==
X-Gm-Message-State: AOJu0YxsxfYumaCOMhXOCsfIw9AXeSwET+pgPy/tYNwNClUxuWBsTZTM
        DXLwPinQMzccN6RCUiDHl1i5rkWxR3G7BuCa5hsj6Q==
X-Google-Smtp-Source: AGHT+IFfD768bdXYRFSsvy/JMFuJWEBaDQ77nCrh/HomDDjHh/ROfreT4IPAWjr2GZzKWN/ptBLqfNzdF4t+q4ReoG8=
X-Received: by 2002:a5b:f08:0:b0:d81:51ca:ff47 with SMTP id
 x8-20020a5b0f08000000b00d8151caff47mr20341138ybr.10.1697112424110; Thu, 12
 Oct 2023 05:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20231011184823.443959-1-peter.griffin@linaro.org>
 <20231011184823.443959-11-peter.griffin@linaro.org> <CAPLW+4mO1dMjh1EDPbaL0QGe4EM0GnbQ1G7NsdtBaCcPzdmkPw@mail.gmail.com>
In-Reply-To: <CAPLW+4mO1dMjh1EDPbaL0QGe4EM0GnbQ1G7NsdtBaCcPzdmkPw@mail.gmail.com>
From:   Peter Griffin <peter.griffin@linaro.org>
Date:   Thu, 12 Oct 2023 13:06:52 +0100
Message-ID: <CADrjBPqo8kKUr-EPay3zDQiF7XRwN+FDFN5W2tD5Aet50L2KUA@mail.gmail.com>
Subject: Re: [PATCH v3 10/20] clk: samsung: clk-gs101: Add cmu_top registers,
 plls, mux and gates
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        cw00.choi@samsung.com, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, saravanak@google.com,
        willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Sam,

Thanks for the review.

On Thu, 12 Oct 2023 at 01:07, Sam Protsenko <semen.protsenko@linaro.org> wr=
ote:
>
> On Wed, Oct 11, 2023 at 1:49=E2=80=AFPM Peter Griffin <peter.griffin@lina=
ro.org> wrote:
> >
> > CMU_TOP is the top level clock management unit which contains PLLs, mux=
es
> > and gates that feed the other clock management units.
> >
> > Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> > ---
> >  drivers/clk/samsung/Kconfig     |    9 +
> >  drivers/clk/samsung/Makefile    |    2 +
> >  drivers/clk/samsung/clk-gs101.c | 1551 +++++++++++++++++++++++++++++++
> >  3 files changed, 1562 insertions(+)
> >  create mode 100644 drivers/clk/samsung/clk-gs101.c
> >
> > diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
> > index 76a494e95027..14362ec9c543 100644
> > --- a/drivers/clk/samsung/Kconfig
> > +++ b/drivers/clk/samsung/Kconfig
> > @@ -12,6 +12,7 @@ config COMMON_CLK_SAMSUNG
> >         select EXYNOS_5410_COMMON_CLK if ARM && SOC_EXYNOS5410
> >         select EXYNOS_5420_COMMON_CLK if ARM && SOC_EXYNOS5420
> >         select EXYNOS_ARM64_COMMON_CLK if ARM64 && ARCH_EXYNOS
> > +       select GOOGLE_GS101_COMMON_CLK if ARM64 && ARCH_GOOGLE_TENSOR
> >         select TESLA_FSD_COMMON_CLK if ARM64 && ARCH_TESLA_FSD
> >
> >  config S3C64XX_COMMON_CLK
> > @@ -95,6 +96,14 @@ config EXYNOS_CLKOUT
> >           status of the certains clocks from SoC, but it could also be =
tied to
> >           other devices as an input clock.
> >
> > +config GOOGLE_GS101_COMMON_CLK
> > +       bool "Google gs101 clock controller support" if COMPILE_TEST
> > +       depends on COMMON_CLK_SAMSUNG
> > +       depends on EXYNOS_ARM64_COMMON_CLK
> > +       help
> > +         Support for the clock controller present on the Google gs101 =
SoC.
> > +         Choose Y here only if you build for this SoC.
> > +
>
> Why is that new option needed? From the look of it, it could be just a
> part of EXYNOS_ARM64_COMMON_CLK. Like clk-exynos850 or
> clk-exynosautov9. Is there any particular feature that makes it SoC
> special?

No, it could also be added to EXYNOS_ARM64_COMMON_CLK. I was following
the example set by TESLA_FSD which is another custom Exynos based chipset
that added its own config option.

Krzysztof do you have any preference on this?

>
> >  config TESLA_FSD_COMMON_CLK
> >         bool "Tesla FSD clock controller support" if COMPILE_TEST
> >         depends on COMMON_CLK_SAMSUNG
> > diff --git a/drivers/clk/samsung/Makefile b/drivers/clk/samsung/Makefil=
e
> > index ebbeacabe88f..49146937d957 100644
> > --- a/drivers/clk/samsung/Makefile
> > +++ b/drivers/clk/samsung/Makefile
> > @@ -21,6 +21,8 @@ obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK) +=3D clk-exynos=
7.o
> >  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  +=3D clk-exynos7885.o
> >  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  +=3D clk-exynos850.o
> >  obj-$(CONFIG_EXYNOS_ARM64_COMMON_CLK)  +=3D clk-exynosautov9.o
> > +obj-$(CONFIG_GOOGLE_GS101_COMMON_CLK)  +=3D clk-gs101.o
> >  obj-$(CONFIG_S3C64XX_COMMON_CLK)       +=3D clk-s3c64xx.o
> >  obj-$(CONFIG_S5PV210_COMMON_CLK)       +=3D clk-s5pv210.o clk-s5pv210-=
audss.o
> >  obj-$(CONFIG_TESLA_FSD_COMMON_CLK)     +=3D clk-fsd.o
> > +
> > diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-=
gs101.c
> > new file mode 100644
> > index 000000000000..e2c62754b1eb
> > --- /dev/null
> > +++ b/drivers/clk/samsung/clk-gs101.c
> > @@ -0,0 +1,1551 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2023 Linaro Ltd.
> > + * Author: Peter Griffin <peter.griffin@linaro.org>
> > + *
> > + * Common Clock Framework support for GS101.
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> > +
> > +#include <dt-bindings/clock/google,gs101.h>
> > +
> > +#include "clk.h"
> > +#include "clk-exynos-arm64.h"
> > +
> > +/* NOTE: Must be equal to the last clock ID increased by one */
> > +#define TOP_NR_CLK                     (CLK_GOUT_CMU_BOOST + 1)
>
> Please use tab for indentations like that. In this and subsequent patches=
.

will fix

>
> > +
> > +/* ---- CMU_TOP ------------------------------------------------------=
------- */
> > +
> > +/* Register Offset definitions for CMU_TOP (0x1e080000) */
> > +
> > +#define PLL_LOCKTIME_PLL_SHARED0                       0x0000
> > +#define PLL_LOCKTIME_PLL_SHARED1                       0x0004
> > +#define PLL_LOCKTIME_PLL_SHARED2                       0x0008
> > +#define PLL_LOCKTIME_PLL_SHARED3                       0x000c
> > +#define PLL_LOCKTIME_PLL_SPARE                         0x0010
> > +#define PLL_CON0_PLL_SHARED0                           0x0100
> > +#define PLL_CON1_PLL_SHARED0                           0x0104
> > +#define PLL_CON2_PLL_SHARED0                           0x0108
> > +#define PLL_CON3_PLL_SHARED0                           0x010c
> > +#define PLL_CON4_PLL_SHARED0                           0x0110
> > +#define PLL_CON0_PLL_SHARED1                           0x0140
> > +#define PLL_CON1_PLL_SHARED1                           0x0144
> > +#define PLL_CON2_PLL_SHARED1                           0x0148
> > +#define PLL_CON3_PLL_SHARED1                           0x014c
> > +#define PLL_CON4_PLL_SHARED1                           0x0150
> > +#define PLL_CON0_PLL_SHARED2                           0x0180
> > +#define PLL_CON1_PLL_SHARED2                           0x0184
> > +#define PLL_CON2_PLL_SHARED2                           0x0188
> > +#define PLL_CON3_PLL_SHARED2                           0x018c
> > +#define PLL_CON4_PLL_SHARED2                           0x0190
> > +#define PLL_CON0_PLL_SHARED3                           0x01c0
> > +#define PLL_CON1_PLL_SHARED3                           0x01c4
> > +#define PLL_CON2_PLL_SHARED3                           0x01c8
> > +#define PLL_CON3_PLL_SHARED3                           0x01cc
> > +#define PLL_CON4_PLL_SHARED3                           0x01d0
> > +#define PLL_CON0_PLL_SPARE                             0x0200
> > +#define PLL_CON1_PLL_SPARE                             0x0204
> > +#define PLL_CON2_PLL_SPARE                             0x0208
> > +#define PLL_CON3_PLL_SPARE                             0x020c
> > +#define PLL_CON4_PLL_SPARE                             0x0210
> > +#define CMU_CMU_TOP_CONTROLLER_OPTION                  0x0800
> > +#define CLKOUT_CON_BLK_CMU_CMU_TOP_CLKOUT0             0x0810
> > +#define CMU_HCHGEN_CLKMUX_CMU_BOOST                    0x0840
> > +#define CMU_HCHGEN_CLKMUX_TOP_BOOST                    0x0844
> > +#define CMU_HCHGEN_CLKMUX                              0x0850
> > +#define POWER_FAIL_DETECT_PLL                          0x0864
> > +#define EARLY_WAKEUP_FORCED_0_ENABLE                   0x0870
> > +#define EARLY_WAKEUP_FORCED_1_ENABLE                   0x0874
> > +#define EARLY_WAKEUP_APM_CTRL                          0x0878
> > +#define EARLY_WAKEUP_CLUSTER0_CTRL                     0x087c
> > +#define EARLY_WAKEUP_DPU_CTRL                          0x0880
> > +#define EARLY_WAKEUP_CSIS_CTRL                         0x0884
> > +#define EARLY_WAKEUP_APM_DEST                          0x0890
> > +#define EARLY_WAKEUP_CLUSTER0_DEST                     0x0894
> > +#define EARLY_WAKEUP_DPU_DEST                          0x0898
> > +#define EARLY_WAKEUP_CSIS_DEST                         0x089c
> > +#define EARLY_WAKEUP_SW_TRIG_APM                       0x08c0
> > +#define EARLY_WAKEUP_SW_TRIG_APM_SET                   0x08c4
> > +#define EARLY_WAKEUP_SW_TRIG_APM_CLEAR                 0x08c8
> > +#define EARLY_WAKEUP_SW_TRIG_CLUSTER0                  0x08d0
> > +#define EARLY_WAKEUP_SW_TRIG_CLUSTER0_SET              0x08d4
> > +#define EARLY_WAKEUP_SW_TRIG_CLUSTER0_CLEAR            0x08d8
> > +#define EARLY_WAKEUP_SW_TRIG_DPU                       0x08e0
> > +#define EARLY_WAKEUP_SW_TRIG_DPU_SET                   0x08e4
> > +#define EARLY_WAKEUP_SW_TRIG_DPU_CLEAR                 0x08e8
> > +#define EARLY_WAKEUP_SW_TRIG_CSIS                      0x08f0
> > +#define EARLY_WAKEUP_SW_TRIG_CSIS_SET                  0x08f4
> > +#define EARLY_WAKEUP_SW_TRIG_CSIS_CLEAR                        0x08f8
> > +
> > +#define CLK_CON_MUX_MUX_CLKCMU_BO_BUS                  0x1000
> > +#define CLK_CON_MUX_MUX_CLKCMU_BUS0_BUS                        0x1004
> > +#define CLK_CON_MUX_MUX_CLKCMU_BUS1_BUS                        0x1008
> > +#define CLK_CON_MUX_MUX_CLKCMU_BUS2_BUS                        0x100c
> > +#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK0                        0x1010
> > +#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK1                        0x1014
> > +#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK2                        0x1018
> > +#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK3                        0x101c
> > +#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK4                        0x1020
> > +#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK5                        0x1024
> > +#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK6                        0x1028
> > +#define CLK_CON_MUX_MUX_CLKCMU_CIS_CLK7                        0x102c
> > +#define CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST               0x1030
> > +#define CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST_OPTION1       0x1034
> > +#define CLK_CON_MUX_MUX_CLKCMU_CORE_BUS                        0x1038
> > +#define CLK_CON_MUX_MUX_CLKCMU_CPUCL0_DBG              0x103c
> > +#define CLK_CON_MUX_MUX_CLKCMU_CPUCL0_SWITCH           0x1040
> > +#define CLK_CON_MUX_MUX_CLKCMU_CPUCL1_SWITCH           0x1044
> > +#define CLK_CON_MUX_MUX_CLKCMU_CPUCL2_SWITCH           0x1048
> > +#define CLK_CON_MUX_MUX_CLKCMU_CSIS_BUS                        0x104c
> > +#define CLK_CON_MUX_MUX_CLKCMU_DISP_BUS                        0x1050
> > +#define CLK_CON_MUX_MUX_CLKCMU_DNS_BUS                 0x1054
> > +#define CLK_CON_MUX_MUX_CLKCMU_DPU_BUS                 0x1058
> > +#define CLK_CON_MUX_MUX_CLKCMU_EH_BUS                  0x105c
> > +#define CLK_CON_MUX_MUX_CLKCMU_G2D_G2D                 0x1060
> > +#define CLK_CON_MUX_MUX_CLKCMU_G2D_MSCL                        0x1064
> > +#define CLK_CON_MUX_MUX_CLKCMU_G3AA_G3AA               0x1068
> > +#define CLK_CON_MUX_MUX_CLKCMU_G3D_BUSD                        0x106c
> > +#define CLK_CON_MUX_MUX_CLKCMU_G3D_GLB                 0x1070
> > +#define CLK_CON_MUX_MUX_CLKCMU_G3D_SWITCH              0x1074
> > +#define CLK_CON_MUX_MUX_CLKCMU_GDC_GDC0                        0x1078
> > +#define CLK_CON_MUX_MUX_CLKCMU_GDC_GDC1                        0x107c
> > +#define CLK_CON_MUX_MUX_CLKCMU_GDC_SCSC                        0x1080
> > +#define CLK_CON_MUX_MUX_CLKCMU_HPM                     0x1084
> > +#define CLK_CON_MUX_MUX_CLKCMU_HSI0_BUS                        0x1088
> > +#define CLK_CON_MUX_MUX_CLKCMU_HSI0_DPGTC              0x108c
> > +#define CLK_CON_MUX_MUX_CLKCMU_HSI0_USB31DRD           0x1090
> > +#define CLK_CON_MUX_MUX_CLKCMU_HSI0_USBDPDBG           0x1094
> > +#define CLK_CON_MUX_MUX_CLKCMU_HSI1_BUS                        0x1098
> > +#define CLK_CON_MUX_MUX_CLKCMU_HSI1_PCIE               0x109c
> > +#define CLK_CON_MUX_MUX_CLKCMU_HSI2_BUS                        0x10a0
> > +#define CLK_CON_MUX_MUX_CLKCMU_HSI2_MMC_CARD           0x10a4
> > +#define CLK_CON_MUX_MUX_CLKCMU_HSI2_PCIE               0x10a8
> > +#define CLK_CON_MUX_MUX_CLKCMU_HSI2_UFS_EMBD           0x10ac
> > +#define CLK_CON_MUX_MUX_CLKCMU_IPP_BUS                 0x10b0
> > +#define CLK_CON_MUX_MUX_CLKCMU_ITP_BUS                 0x10b4
> > +#define CLK_CON_MUX_MUX_CLKCMU_MCSC_ITSC               0x10b8
> > +#define CLK_CON_MUX_MUX_CLKCMU_MCSC_MCSC               0x10bc
> > +#define CLK_CON_MUX_MUX_CLKCMU_MFC_MFC                 0x10c0
> > +#define CLK_CON_MUX_MUX_CLKCMU_MIF_BUSP                        0x10c4
> > +#define CLK_CON_MUX_MUX_CLKCMU_MIF_SWITCH              0x10c8
> > +#define CLK_CON_MUX_MUX_CLKCMU_MISC_BUS                        0x10cc
> > +#define CLK_CON_MUX_MUX_CLKCMU_MISC_SSS                        0x10d0
> > +#define CLK_CON_MUX_MUX_CLKCMU_PDP_BUS                 0x10d4
> > +#define CLK_CON_MUX_MUX_CLKCMU_PDP_VRA                 0x10d8
> > +#define CLK_CON_MUX_MUX_CLKCMU_PERIC0_BUS              0x10dc
> > +#define CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP               0x10e0
> > +#define CLK_CON_MUX_MUX_CLKCMU_PERIC1_BUS              0x10e4
> > +#define CLK_CON_MUX_MUX_CLKCMU_PERIC1_IP               0x10e8
> > +#define CLK_CON_MUX_MUX_CLKCMU_TNR_BUS                 0x10ec
> > +#define CLK_CON_MUX_MUX_CLKCMU_TOP_BOOST_OPTION1       0x10f0
> > +#define CLK_CON_MUX_MUX_CLKCMU_TOP_CMUREF              0x10f4
> > +#define CLK_CON_MUX_MUX_CLKCMU_TPU_BUS                 0x10f8
> > +#define CLK_CON_MUX_MUX_CLKCMU_TPU_TPU                 0x10fc
> > +#define CLK_CON_MUX_MUX_CLKCMU_TPU_TPUCTL              0x1100
> > +#define CLK_CON_MUX_MUX_CLKCMU_TPU_UART                        0x1104
> > +#define CLK_CON_MUX_MUX_CMU_CMUREF                     0x1108
> > +
> > +#define CLK_CON_DIV_CLKCMU_BO_BUS                      0x1800
> > +#define CLK_CON_DIV_CLKCMU_BUS0_BUS                    0x1804
> > +#define CLK_CON_DIV_CLKCMU_BUS1_BUS                    0x1808
> > +#define CLK_CON_DIV_CLKCMU_BUS2_BUS                    0x180c
> > +#define CLK_CON_DIV_CLKCMU_CIS_CLK0                    0x1810
> > +#define CLK_CON_DIV_CLKCMU_CIS_CLK1                    0x1814
> > +#define CLK_CON_DIV_CLKCMU_CIS_CLK2                    0x1818
> > +#define CLK_CON_DIV_CLKCMU_CIS_CLK3                    0x181c
> > +#define CLK_CON_DIV_CLKCMU_CIS_CLK4                    0x1820
> > +#define CLK_CON_DIV_CLKCMU_CIS_CLK5                    0x1824
> > +#define CLK_CON_DIV_CLKCMU_CIS_CLK6                    0x1828
> > +#define CLK_CON_DIV_CLKCMU_CIS_CLK7                    0x182c
> > +#define CLK_CON_DIV_CLKCMU_CORE_BUS                    0x1830
> > +#define CLK_CON_DIV_CLKCMU_CPUCL0_DBG                  0x1834
> > +#define CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH               0x1838
> > +#define CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH               0x183c
> > +#define CLK_CON_DIV_CLKCMU_CPUCL2_SWITCH               0x1840
> > +#define CLK_CON_DIV_CLKCMU_CSIS_BUS                    0x1844
> > +#define CLK_CON_DIV_CLKCMU_DISP_BUS                    0x1848
> > +#define CLK_CON_DIV_CLKCMU_DNS_BUS                     0x184c
> > +#define CLK_CON_DIV_CLKCMU_DPU_BUS                     0x1850
> > +#define CLK_CON_DIV_CLKCMU_EH_BUS                      0x1854
> > +#define CLK_CON_DIV_CLKCMU_G2D_G2D                     0x1858
> > +#define CLK_CON_DIV_CLKCMU_G2D_MSCL                    0x185c
> > +#define CLK_CON_DIV_CLKCMU_G3AA_G3AA                   0x1860
> > +#define CLK_CON_DIV_CLKCMU_G3D_BUSD                    0x1864
> > +#define CLK_CON_DIV_CLKCMU_G3D_GLB                     0x1868
> > +#define CLK_CON_DIV_CLKCMU_G3D_SWITCH                  0x186c
> > +#define CLK_CON_DIV_CLKCMU_GDC_GDC0                    0x1870
> > +#define CLK_CON_DIV_CLKCMU_GDC_GDC1                    0x1874
> > +#define CLK_CON_DIV_CLKCMU_GDC_SCSC                    0x1878
> > +#define CLK_CON_DIV_CLKCMU_HPM                         0x187c
> > +#define CLK_CON_DIV_CLKCMU_HSI0_BUS                    0x1880
> > +#define CLK_CON_DIV_CLKCMU_HSI0_DPGTC                  0x1884
> > +#define CLK_CON_DIV_CLKCMU_HSI0_USB31DRD               0x1888
> > +#define CLK_CON_DIV_CLKCMU_HSI0_USBDPDBG               0x188c
> > +#define CLK_CON_DIV_CLKCMU_HSI1_BUS                    0x1890
> > +#define CLK_CON_DIV_CLKCMU_HSI1_PCIE                   0x1894
> > +#define CLK_CON_DIV_CLKCMU_HSI2_BUS                    0x1898
> > +#define CLK_CON_DIV_CLKCMU_HSI2_MMC_CARD               0x189c
> > +#define CLK_CON_DIV_CLKCMU_HSI2_PCIE                   0x18a0
> > +#define CLK_CON_DIV_CLKCMU_HSI2_UFS_EMBD               0x18a4
> > +#define CLK_CON_DIV_CLKCMU_IPP_BUS                     0x18a8
> > +#define CLK_CON_DIV_CLKCMU_ITP_BUS                     0x18ac
> > +#define CLK_CON_DIV_CLKCMU_MCSC_ITSC                   0x18b0
> > +#define CLK_CON_DIV_CLKCMU_MCSC_MCSC                   0x18b4
> > +#define CLK_CON_DIV_CLKCMU_MFC_MFC                     0x18b8
> > +#define CLK_CON_DIV_CLKCMU_MIF_BUSP                    0x18bc
> > +#define CLK_CON_DIV_CLKCMU_MISC_BUS                    0x18c0
> > +#define CLK_CON_DIV_CLKCMU_MISC_SSS                    0x18c4
> > +#define CLK_CON_DIV_CLKCMU_OTP                         0x18c8
> > +#define CLK_CON_DIV_CLKCMU_PDP_BUS                     0x18cc
> > +#define CLK_CON_DIV_CLKCMU_PDP_VRA                     0x18d0
> > +#define CLK_CON_DIV_CLKCMU_PERIC0_BUS                  0x18d4
> > +#define CLK_CON_DIV_CLKCMU_PERIC0_IP                   0x18d8
> > +#define CLK_CON_DIV_CLKCMU_PERIC1_BUS                  0x18dc
> > +#define CLK_CON_DIV_CLKCMU_PERIC1_IP                   0x18e0
> > +#define CLK_CON_DIV_CLKCMU_TNR_BUS                     0x18e4
> > +#define CLK_CON_DIV_CLKCMU_TPU_BUS                     0x18e8
> > +#define CLK_CON_DIV_CLKCMU_TPU_TPU                     0x18ec
> > +#define CLK_CON_DIV_CLKCMU_TPU_TPUCTL                  0x18f0
> > +#define CLK_CON_DIV_CLKCMU_TPU_UART                    0x18f4
> > +#define CLK_CON_DIV_DIV_CLKCMU_CMU_BOOST               0x18f8
> > +#define CLK_CON_DIV_DIV_CLK_CMU_CMUREF                 0x18fc
> > +#define CLK_CON_DIV_PLL_SHARED0_DIV2                   0x1900
> > +#define CLK_CON_DIV_PLL_SHARED0_DIV3                   0x1904
> > +#define CLK_CON_DIV_PLL_SHARED0_DIV4                   0x1908
> > +#define CLK_CON_DIV_PLL_SHARED0_DIV5                   0x190c
> > +#define CLK_CON_DIV_PLL_SHARED1_DIV2                   0x1910
> > +#define CLK_CON_DIV_PLL_SHARED1_DIV3                   0x1914
> > +#define CLK_CON_DIV_PLL_SHARED1_DIV4                   0x1918
> > +#define CLK_CON_DIV_PLL_SHARED2_DIV2                   0x191c
> > +#define CLK_CON_DIV_PLL_SHARED3_DIV2                   0x1920
> > +
> > +/* CLK_CON_GAT_UPDATES */
> > +#define CLK_CON_GAT_CLKCMU_BUS0_BOOST                  0x2000
> > +#define CLK_CON_GAT_CLKCMU_BUS1_BOOST                  0x2004
> > +#define CLK_CON_GAT_CLKCMU_BUS2_BOOST                  0x2008
> > +#define CLK_CON_GAT_CLKCMU_CORE_BOOST                  0x200c
> > +#define CLK_CON_GAT_CLKCMU_CPUCL0_BOOST                        0x2010
> > +#define CLK_CON_GAT_CLKCMU_CPUCL1_BOOST                        0x2014
> > +#define CLK_CON_GAT_CLKCMU_CPUCL2_BOOST                        0x2018
> > +#define CLK_CON_GAT_CLKCMU_MIF_BOOST                   0x201c
> > +#define CLK_CON_GAT_CLKCMU_MIF_SWITCH                  0x2020
> > +#define CLK_CON_GAT_GATE_CLKCMU_BO_BUS                 0x2024
> > +#define CLK_CON_GAT_GATE_CLKCMU_BUS0_BUS               0x2028
> > +#define CLK_CON_GAT_GATE_CLKCMU_BUS1_BUS               0x202c
> > +#define CLK_CON_GAT_GATE_CLKCMU_BUS2_BUS               0x2030
> > +#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK0               0x2034
> > +#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK1               0x2038
> > +#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK2               0x203c
> > +#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK3               0x2040
> > +#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK4               0x2044
> > +#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK5               0x2048
> > +#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK6               0x204c
> > +#define CLK_CON_GAT_GATE_CLKCMU_CIS_CLK7               0x2050
> > +#define CLK_CON_GAT_GATE_CLKCMU_CMU_BOOST              0x2054
> > +#define CLK_CON_GAT_GATE_CLKCMU_CORE_BUS               0x2058
> > +#define CLK_CON_GAT_GATE_CLKCMU_CPUCL0_DBG_BUS         0x205c
> > +#define CLK_CON_GAT_GATE_CLKCMU_CPUCL0_SWITCH          0x2060
> > +#define CLK_CON_GAT_GATE_CLKCMU_CPUCL1_SWITCH          0x2064
> > +#define CLK_CON_GAT_GATE_CLKCMU_CPUCL2_SWITCH          0x2068
> > +#define CLK_CON_GAT_GATE_CLKCMU_CSIS_BUS               0x206c
> > +#define CLK_CON_GAT_GATE_CLKCMU_DISP_BUS               0x2070
> > +#define CLK_CON_GAT_GATE_CLKCMU_DNS_BUS                        0x2074
> > +#define CLK_CON_GAT_GATE_CLKCMU_DPU_BUS                        0x2078
> > +#define CLK_CON_GAT_GATE_CLKCMU_EH_BUS                 0x207c
> > +#define CLK_CON_GAT_GATE_CLKCMU_G2D_G2D                        0x2080
> > +#define CLK_CON_GAT_GATE_CLKCMU_G2D_MSCL               0x2084
> > +#define CLK_CON_GAT_GATE_CLKCMU_G3AA_G3AA              0x2088
> > +#define CLK_CON_GAT_GATE_CLKCMU_G3D_BUSD               0x208c
> > +#define CLK_CON_GAT_GATE_CLKCMU_G3D_GLB                        0x2090
> > +#define CLK_CON_GAT_GATE_CLKCMU_G3D_SWITCH             0x2094
> > +#define CLK_CON_GAT_GATE_CLKCMU_GDC_GDC0               0x2098
> > +#define CLK_CON_GAT_GATE_CLKCMU_GDC_GDC1               0x209c
> > +#define CLK_CON_GAT_GATE_CLKCMU_GDC_SCSC               0x20a0
> > +#define CLK_CON_GAT_GATE_CLKCMU_HPM                    0x20a4
> > +#define CLK_CON_GAT_GATE_CLKCMU_HSI0_BUS               0x20a8
> > +#define CLK_CON_GAT_GATE_CLKCMU_HSI0_DPGTC             0x20ac
> > +#define CLK_CON_GAT_GATE_CLKCMU_HSI0_USB31DRD          0x20b0
> > +#define CLK_CON_GAT_GATE_CLKCMU_HSI0_USBDPDBG          0x20b4
> > +#define CLK_CON_GAT_GATE_CLKCMU_HSI1_BUS               0x20b8
> > +#define CLK_CON_GAT_GATE_CLKCMU_HSI1_PCIE              0x20bc
> > +#define CLK_CON_GAT_GATE_CLKCMU_HSI2_BUS               0x20c0
> > +#define CLK_CON_GAT_GATE_CLKCMU_HSI2_MMCCARD           0x20c4
> > +#define CLK_CON_GAT_GATE_CLKCMU_HSI2_PCIE              0x20c8
> > +#define CLK_CON_GAT_GATE_CLKCMU_HSI2_UFS_EMBD          0x20cc
> > +#define CLK_CON_GAT_GATE_CLKCMU_IPP_BUS                        0x20d0
> > +#define CLK_CON_GAT_GATE_CLKCMU_ITP_BUS                        0x20d4
> > +#define CLK_CON_GAT_GATE_CLKCMU_MCSC_ITSC              0x20d8
> > +#define CLK_CON_GAT_GATE_CLKCMU_MCSC_MCSC              0x20dc
> > +#define CLK_CON_GAT_GATE_CLKCMU_MFC_MFC                        0x20e0
> > +#define CLK_CON_GAT_GATE_CLKCMU_MIF_BUSP               0x20e4
> > +#define CLK_CON_GAT_GATE_CLKCMU_MISC_BUS               0x20e8
> > +#define CLK_CON_GAT_GATE_CLKCMU_MISC_SSS               0x20ec
> > +#define CLK_CON_GAT_GATE_CLKCMU_PDP_BUS                        0x20f0
> > +#define CLK_CON_GAT_GATE_CLKCMU_PDP_VRA                        0x20f4
> > +#define CLK_CON_GAT_GATE_CLKCMU_PERIC0_BUS             0x20f8
> > +#define CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP              0x20fc
> > +#define CLK_CON_GAT_GATE_CLKCMU_PERIC1_BUS             0x2100
> > +#define CLK_CON_GAT_GATE_CLKCMU_PERIC1_IP              0x2104
> > +#define CLK_CON_GAT_GATE_CLKCMU_TNR_BUS                        0x2108
> > +#define CLK_CON_GAT_GATE_CLKCMU_TOP_CMUREF             0x210c
> > +#define CLK_CON_GAT_GATE_CLKCMU_TPU_BUS                        0x2110
> > +#define CLK_CON_GAT_GATE_CLKCMU_TPU_TPU                        0x2114
> > +#define CLK_CON_GAT_GATE_CLKCMU_TPU_TPUCTL             0x2118
> > +#define CLK_CON_GAT_GATE_CLKCMU_TPU_UART               0x211c
> > +
> > +#define DMYQCH_CON_CMU_TOP_CMUREF_QCH                  0x3000
> > +#define DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK0             0x3004
> > +#define DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK1             0x3008
> > +#define DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK2             0x300c
> > +#define DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK3             0x3010
> > +#define DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK4             0x3014
> > +#define DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK5             0x3018
> > +#define DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK6             0x301c
> > +#define DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK7             0x3020
> > +#define DMYQCH_CON_OTP_QCH                             0x3024
> > +#define QUEUE_CTRL_REG_BLK_CMU_CMU_TOP                 0x3c00
> > +#define QUEUE_ENTRY0_BLK_CMU_CMU_TOP                   0x3c10
> > +#define QUEUE_ENTRY1_BLK_CMU_CMU_TOP                   0x3c14
> > +#define QUEUE_ENTRY2_BLK_CMU_CMU_TOP                   0x3c18
> > +#define QUEUE_ENTRY3_BLK_CMU_CMU_TOP                   0x3c1c
> > +#define QUEUE_ENTRY4_BLK_CMU_CMU_TOP                   0x3c20
> > +#define QUEUE_ENTRY5_BLK_CMU_CMU_TOP                   0x3c24
> > +#define QUEUE_ENTRY6_BLK_CMU_CMU_TOP                   0x3c28
> > +#define QUEUE_ENTRY7_BLK_CMU_CMU_TOP                   0x3c2c
> > +#define MIFMIRROR_QUEUE_CTRL_REG                       0x3e00
> > +#define MIFMIRROR_QUEUE_ENTRY0                         0x3e10
> > +#define MIFMIRROR_QUEUE_ENTRY1                         0x3e14
> > +#define MIFMIRROR_QUEUE_ENTRY2                         0x3e18
> > +#define MIFMIRROR_QUEUE_ENTRY3                         0x3e1c
> > +#define MIFMIRROR_QUEUE_ENTRY4                         0x3e20
> > +#define MIFMIRROR_QUEUE_ENTRY5                         0x3e24
> > +#define MIFMIRROR_QUEUE_ENTRY6                         0x3e28
> > +#define MIFMIRROR_QUEUE_ENTRY7                         0x3e2c
> > +#define MIFMIRROR_QUEUE_BUSY                           0x3e30
> > +#define GENERALIO_ACD_CHANNEL_0                                0x3f00
> > +#define GENERALIO_ACD_CHANNEL_1                                0x3f04
> > +#define GENERALIO_ACD_CHANNEL_2                                0x3f08
> > +#define GENERALIO_ACD_CHANNEL_3                                0x3f0c
> > +#define GENERALIO_ACD_MASK                             0x3f14
> > +
> > +static const unsigned long cmu_top_clk_regs[] __initconst =3D {
> > +       PLL_LOCKTIME_PLL_SHARED0,
> > +       PLL_LOCKTIME_PLL_SHARED1,
> > +       PLL_LOCKTIME_PLL_SHARED2,
> > +       PLL_LOCKTIME_PLL_SHARED3,
> > +       PLL_LOCKTIME_PLL_SPARE,
> > +       PLL_CON0_PLL_SHARED0,
> > +       PLL_CON1_PLL_SHARED0,
> > +       PLL_CON2_PLL_SHARED0,
> > +       PLL_CON3_PLL_SHARED0,
> > +       PLL_CON4_PLL_SHARED0,
> > +       PLL_CON0_PLL_SHARED1,
> > +       PLL_CON1_PLL_SHARED1,
> > +       PLL_CON2_PLL_SHARED1,
> > +       PLL_CON3_PLL_SHARED1,
> > +       PLL_CON4_PLL_SHARED1,
> > +       PLL_CON0_PLL_SHARED2,
> > +       PLL_CON1_PLL_SHARED2,
> > +       PLL_CON2_PLL_SHARED2,
> > +       PLL_CON3_PLL_SHARED2,
> > +       PLL_CON4_PLL_SHARED2,
> > +       PLL_CON0_PLL_SHARED3,
> > +       PLL_CON1_PLL_SHARED3,
> > +       PLL_CON2_PLL_SHARED3,
> > +       PLL_CON3_PLL_SHARED3,
> > +       PLL_CON4_PLL_SHARED3,
> > +       PLL_CON0_PLL_SPARE,
> > +       PLL_CON1_PLL_SPARE,
> > +       PLL_CON2_PLL_SPARE,
> > +       PLL_CON3_PLL_SPARE,
> > +       PLL_CON4_PLL_SPARE,
> > +       CMU_CMU_TOP_CONTROLLER_OPTION,
> > +       CLKOUT_CON_BLK_CMU_CMU_TOP_CLKOUT0,
> > +       CMU_HCHGEN_CLKMUX_CMU_BOOST,
> > +       CMU_HCHGEN_CLKMUX_TOP_BOOST,
> > +       CMU_HCHGEN_CLKMUX,
> > +       POWER_FAIL_DETECT_PLL,
> > +       EARLY_WAKEUP_FORCED_0_ENABLE,
> > +       EARLY_WAKEUP_FORCED_1_ENABLE,
> > +       EARLY_WAKEUP_APM_CTRL,
> > +       EARLY_WAKEUP_CLUSTER0_CTRL,
> > +       EARLY_WAKEUP_DPU_CTRL,
> > +       EARLY_WAKEUP_CSIS_CTRL,
> > +       EARLY_WAKEUP_APM_DEST,
> > +       EARLY_WAKEUP_CLUSTER0_DEST,
> > +       EARLY_WAKEUP_DPU_DEST,
> > +       EARLY_WAKEUP_CSIS_DEST,
> > +       EARLY_WAKEUP_SW_TRIG_APM,
> > +       EARLY_WAKEUP_SW_TRIG_APM_SET,
> > +       EARLY_WAKEUP_SW_TRIG_APM_CLEAR,
> > +       EARLY_WAKEUP_SW_TRIG_CLUSTER0,
> > +       EARLY_WAKEUP_SW_TRIG_CLUSTER0_SET,
> > +       EARLY_WAKEUP_SW_TRIG_CLUSTER0_CLEAR,
> > +       EARLY_WAKEUP_SW_TRIG_DPU,
> > +       EARLY_WAKEUP_SW_TRIG_DPU_SET,
> > +       EARLY_WAKEUP_SW_TRIG_DPU_CLEAR,
> > +       EARLY_WAKEUP_SW_TRIG_CSIS,
> > +       EARLY_WAKEUP_SW_TRIG_CSIS_SET,
> > +       EARLY_WAKEUP_SW_TRIG_CSIS_CLEAR,
> > +       CLK_CON_MUX_MUX_CLKCMU_BO_BUS,
> > +       CLK_CON_MUX_MUX_CLKCMU_BUS0_BUS,
> > +       CLK_CON_MUX_MUX_CLKCMU_BUS1_BUS,
> > +       CLK_CON_MUX_MUX_CLKCMU_BUS2_BUS,
> > +       CLK_CON_MUX_MUX_CLKCMU_CIS_CLK0,
> > +       CLK_CON_MUX_MUX_CLKCMU_CIS_CLK1,
> > +       CLK_CON_MUX_MUX_CLKCMU_CIS_CLK2,
> > +       CLK_CON_MUX_MUX_CLKCMU_CIS_CLK3,
> > +       CLK_CON_MUX_MUX_CLKCMU_CIS_CLK4,
> > +       CLK_CON_MUX_MUX_CLKCMU_CIS_CLK5,
> > +       CLK_CON_MUX_MUX_CLKCMU_CIS_CLK6,
> > +       CLK_CON_MUX_MUX_CLKCMU_CIS_CLK7,
> > +       CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST,
> > +       CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST_OPTION1,
> > +       CLK_CON_MUX_MUX_CLKCMU_CORE_BUS,
> > +       CLK_CON_MUX_MUX_CLKCMU_CPUCL0_DBG,
> > +       CLK_CON_MUX_MUX_CLKCMU_CPUCL0_SWITCH,
> > +       CLK_CON_MUX_MUX_CLKCMU_CPUCL1_SWITCH,
> > +       CLK_CON_MUX_MUX_CLKCMU_CPUCL2_SWITCH,
> > +       CLK_CON_MUX_MUX_CLKCMU_CSIS_BUS,
> > +       CLK_CON_MUX_MUX_CLKCMU_DISP_BUS,
> > +       CLK_CON_MUX_MUX_CLKCMU_DNS_BUS,
> > +       CLK_CON_MUX_MUX_CLKCMU_DPU_BUS,
> > +       CLK_CON_MUX_MUX_CLKCMU_EH_BUS,
> > +       CLK_CON_MUX_MUX_CLKCMU_G2D_G2D,
> > +       CLK_CON_MUX_MUX_CLKCMU_G2D_MSCL,
> > +       CLK_CON_MUX_MUX_CLKCMU_G3AA_G3AA,
> > +       CLK_CON_MUX_MUX_CLKCMU_G3D_BUSD,
> > +       CLK_CON_MUX_MUX_CLKCMU_G3D_GLB,
> > +       CLK_CON_MUX_MUX_CLKCMU_G3D_SWITCH,
> > +       CLK_CON_MUX_MUX_CLKCMU_GDC_GDC0,
> > +       CLK_CON_MUX_MUX_CLKCMU_GDC_GDC1,
> > +       CLK_CON_MUX_MUX_CLKCMU_GDC_SCSC,
> > +       CLK_CON_MUX_MUX_CLKCMU_HPM,
> > +       CLK_CON_MUX_MUX_CLKCMU_HSI0_BUS,
> > +       CLK_CON_MUX_MUX_CLKCMU_HSI0_DPGTC,
> > +       CLK_CON_MUX_MUX_CLKCMU_HSI0_USB31DRD,
> > +       CLK_CON_MUX_MUX_CLKCMU_HSI0_USBDPDBG,
> > +       CLK_CON_MUX_MUX_CLKCMU_HSI1_BUS,
> > +       CLK_CON_MUX_MUX_CLKCMU_HSI1_PCIE,
> > +       CLK_CON_MUX_MUX_CLKCMU_HSI2_BUS,
> > +       CLK_CON_MUX_MUX_CLKCMU_HSI2_MMC_CARD,
> > +       CLK_CON_MUX_MUX_CLKCMU_HSI2_PCIE,
> > +       CLK_CON_MUX_MUX_CLKCMU_HSI2_UFS_EMBD,
> > +       CLK_CON_MUX_MUX_CLKCMU_IPP_BUS,
> > +       CLK_CON_MUX_MUX_CLKCMU_ITP_BUS,
> > +       CLK_CON_MUX_MUX_CLKCMU_MCSC_ITSC,
> > +       CLK_CON_MUX_MUX_CLKCMU_MCSC_MCSC,
> > +       CLK_CON_MUX_MUX_CLKCMU_MFC_MFC,
> > +       CLK_CON_MUX_MUX_CLKCMU_MIF_BUSP,
> > +       CLK_CON_MUX_MUX_CLKCMU_MIF_SWITCH,
> > +       CLK_CON_MUX_MUX_CLKCMU_MISC_BUS,
> > +       CLK_CON_MUX_MUX_CLKCMU_MISC_SSS,
> > +       CLK_CON_MUX_MUX_CLKCMU_PDP_BUS,
> > +       CLK_CON_MUX_MUX_CLKCMU_PDP_VRA,
> > +       CLK_CON_MUX_MUX_CLKCMU_PERIC0_BUS,
> > +       CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP,
> > +       CLK_CON_MUX_MUX_CLKCMU_PERIC1_BUS,
> > +       CLK_CON_MUX_MUX_CLKCMU_PERIC1_IP,
> > +       CLK_CON_MUX_MUX_CLKCMU_TNR_BUS,
> > +       CLK_CON_MUX_MUX_CLKCMU_TOP_BOOST_OPTION1,
> > +       CLK_CON_MUX_MUX_CLKCMU_TOP_CMUREF,
> > +       CLK_CON_MUX_MUX_CLKCMU_TPU_BUS,
> > +       CLK_CON_MUX_MUX_CLKCMU_TPU_TPU,
> > +       CLK_CON_MUX_MUX_CLKCMU_TPU_TPUCTL,
> > +       CLK_CON_MUX_MUX_CLKCMU_TPU_UART,
> > +       CLK_CON_MUX_MUX_CMU_CMUREF,
> > +       CLK_CON_DIV_CLKCMU_BO_BUS,
> > +       CLK_CON_DIV_CLKCMU_BUS0_BUS,
> > +       CLK_CON_DIV_CLKCMU_BUS1_BUS,
> > +       CLK_CON_DIV_CLKCMU_BUS2_BUS,
> > +       CLK_CON_DIV_CLKCMU_CIS_CLK0,
> > +       CLK_CON_DIV_CLKCMU_CIS_CLK1,
> > +       CLK_CON_DIV_CLKCMU_CIS_CLK2,
> > +       CLK_CON_DIV_CLKCMU_CIS_CLK3,
> > +       CLK_CON_DIV_CLKCMU_CIS_CLK4,
> > +       CLK_CON_DIV_CLKCMU_CIS_CLK5,
> > +       CLK_CON_DIV_CLKCMU_CIS_CLK6,
> > +       CLK_CON_DIV_CLKCMU_CIS_CLK7,
> > +       CLK_CON_DIV_CLKCMU_CORE_BUS,
> > +       CLK_CON_DIV_CLKCMU_CPUCL0_DBG,
> > +       CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH,
> > +       CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH,
> > +       CLK_CON_DIV_CLKCMU_CPUCL2_SWITCH,
> > +       CLK_CON_DIV_CLKCMU_CSIS_BUS,
> > +       CLK_CON_DIV_CLKCMU_DISP_BUS,
> > +       CLK_CON_DIV_CLKCMU_DNS_BUS,
> > +       CLK_CON_DIV_CLKCMU_DPU_BUS,
> > +       CLK_CON_DIV_CLKCMU_EH_BUS,
> > +       CLK_CON_DIV_CLKCMU_G2D_G2D,
> > +       CLK_CON_DIV_CLKCMU_G2D_MSCL,
> > +       CLK_CON_DIV_CLKCMU_G3AA_G3AA,
> > +       CLK_CON_DIV_CLKCMU_G3D_BUSD,
> > +       CLK_CON_DIV_CLKCMU_G3D_GLB,
> > +       CLK_CON_DIV_CLKCMU_G3D_SWITCH,
> > +       CLK_CON_DIV_CLKCMU_GDC_GDC0,
> > +       CLK_CON_DIV_CLKCMU_GDC_GDC1,
> > +       CLK_CON_DIV_CLKCMU_GDC_SCSC,
> > +       CLK_CON_DIV_CLKCMU_HPM,
> > +       CLK_CON_DIV_CLKCMU_HSI0_BUS,
> > +       CLK_CON_DIV_CLKCMU_HSI0_DPGTC,
> > +       CLK_CON_DIV_CLKCMU_HSI0_USB31DRD,
> > +       CLK_CON_DIV_CLKCMU_HSI0_USBDPDBG,
> > +       CLK_CON_DIV_CLKCMU_HSI1_BUS,
> > +       CLK_CON_DIV_CLKCMU_HSI1_PCIE,
> > +       CLK_CON_DIV_CLKCMU_HSI2_BUS,
> > +       CLK_CON_DIV_CLKCMU_HSI2_MMC_CARD,
> > +       CLK_CON_DIV_CLKCMU_HSI2_PCIE,
> > +       CLK_CON_DIV_CLKCMU_HSI2_UFS_EMBD,
> > +       CLK_CON_DIV_CLKCMU_IPP_BUS,
> > +       CLK_CON_DIV_CLKCMU_ITP_BUS,
> > +       CLK_CON_DIV_CLKCMU_MCSC_ITSC,
> > +       CLK_CON_DIV_CLKCMU_MCSC_MCSC,
> > +       CLK_CON_DIV_CLKCMU_MFC_MFC,
> > +       CLK_CON_DIV_CLKCMU_MIF_BUSP,
> > +       CLK_CON_DIV_CLKCMU_MISC_BUS,
> > +       CLK_CON_DIV_CLKCMU_MISC_SSS,
> > +       CLK_CON_DIV_CLKCMU_OTP,
> > +       CLK_CON_DIV_CLKCMU_PDP_BUS,
> > +       CLK_CON_DIV_CLKCMU_PDP_VRA,
> > +       CLK_CON_DIV_CLKCMU_PERIC0_BUS,
> > +       CLK_CON_DIV_CLKCMU_PERIC0_IP,
> > +       CLK_CON_DIV_CLKCMU_PERIC1_BUS,
> > +       CLK_CON_DIV_CLKCMU_PERIC1_IP,
> > +       CLK_CON_DIV_CLKCMU_TNR_BUS,
> > +       CLK_CON_DIV_CLKCMU_TPU_BUS,
> > +       CLK_CON_DIV_CLKCMU_TPU_TPU,
> > +       CLK_CON_DIV_CLKCMU_TPU_TPUCTL,
> > +       CLK_CON_DIV_CLKCMU_TPU_UART,
> > +       CLK_CON_DIV_DIV_CLKCMU_CMU_BOOST,
> > +       CLK_CON_DIV_DIV_CLK_CMU_CMUREF,
> > +       CLK_CON_DIV_PLL_SHARED0_DIV2,
> > +       CLK_CON_DIV_PLL_SHARED0_DIV3,
> > +       CLK_CON_DIV_PLL_SHARED0_DIV4,
> > +       CLK_CON_DIV_PLL_SHARED0_DIV5,
> > +       CLK_CON_DIV_PLL_SHARED1_DIV2,
> > +       CLK_CON_DIV_PLL_SHARED1_DIV3,
> > +       CLK_CON_DIV_PLL_SHARED1_DIV4,
> > +       CLK_CON_DIV_PLL_SHARED2_DIV2,
> > +       CLK_CON_DIV_PLL_SHARED3_DIV2,
> > +       CLK_CON_GAT_CLKCMU_BUS0_BOOST,
> > +       CLK_CON_GAT_CLKCMU_BUS1_BOOST,
> > +       CLK_CON_GAT_CLKCMU_BUS2_BOOST,
> > +       CLK_CON_GAT_CLKCMU_CORE_BOOST,
> > +       CLK_CON_GAT_CLKCMU_CPUCL0_BOOST,
> > +       CLK_CON_GAT_CLKCMU_CPUCL1_BOOST,
> > +       CLK_CON_GAT_CLKCMU_CPUCL2_BOOST,
> > +       CLK_CON_GAT_CLKCMU_MIF_BOOST,
> > +       CLK_CON_GAT_CLKCMU_MIF_SWITCH,
> > +       CLK_CON_GAT_GATE_CLKCMU_BO_BUS,
> > +       CLK_CON_GAT_GATE_CLKCMU_BUS0_BUS,
> > +       CLK_CON_GAT_GATE_CLKCMU_BUS1_BUS,
> > +       CLK_CON_GAT_GATE_CLKCMU_BUS2_BUS,
> > +       CLK_CON_GAT_GATE_CLKCMU_CIS_CLK0,
> > +       CLK_CON_GAT_GATE_CLKCMU_CIS_CLK1,
> > +       CLK_CON_GAT_GATE_CLKCMU_CIS_CLK2,
> > +       CLK_CON_GAT_GATE_CLKCMU_CIS_CLK3,
> > +       CLK_CON_GAT_GATE_CLKCMU_CIS_CLK4,
> > +       CLK_CON_GAT_GATE_CLKCMU_CIS_CLK5,
> > +       CLK_CON_GAT_GATE_CLKCMU_CIS_CLK6,
> > +       CLK_CON_GAT_GATE_CLKCMU_CIS_CLK7,
> > +       CLK_CON_GAT_GATE_CLKCMU_CMU_BOOST,
> > +       CLK_CON_GAT_GATE_CLKCMU_CORE_BUS,
> > +       CLK_CON_GAT_GATE_CLKCMU_CPUCL0_DBG_BUS,
> > +       CLK_CON_GAT_GATE_CLKCMU_CPUCL0_SWITCH,
> > +       CLK_CON_GAT_GATE_CLKCMU_CPUCL1_SWITCH,
> > +       CLK_CON_GAT_GATE_CLKCMU_CPUCL2_SWITCH,
> > +       CLK_CON_GAT_GATE_CLKCMU_CSIS_BUS,
> > +       CLK_CON_GAT_GATE_CLKCMU_DISP_BUS,
> > +       CLK_CON_GAT_GATE_CLKCMU_DNS_BUS,
> > +       CLK_CON_GAT_GATE_CLKCMU_DPU_BUS,
> > +       CLK_CON_GAT_GATE_CLKCMU_EH_BUS,
> > +       CLK_CON_GAT_GATE_CLKCMU_G2D_G2D,
> > +       CLK_CON_GAT_GATE_CLKCMU_G2D_MSCL,
> > +       CLK_CON_GAT_GATE_CLKCMU_G3AA_G3AA,
> > +       CLK_CON_GAT_GATE_CLKCMU_G3D_BUSD,
> > +       CLK_CON_GAT_GATE_CLKCMU_G3D_GLB,
> > +       CLK_CON_GAT_GATE_CLKCMU_G3D_SWITCH,
> > +       CLK_CON_GAT_GATE_CLKCMU_GDC_GDC0,
> > +       CLK_CON_GAT_GATE_CLKCMU_GDC_GDC1,
> > +       CLK_CON_GAT_GATE_CLKCMU_GDC_SCSC,
> > +       CLK_CON_GAT_GATE_CLKCMU_HPM,
> > +       CLK_CON_GAT_GATE_CLKCMU_HSI0_BUS,
> > +       CLK_CON_GAT_GATE_CLKCMU_HSI0_DPGTC,
> > +       CLK_CON_GAT_GATE_CLKCMU_HSI0_USB31DRD,
> > +       CLK_CON_GAT_GATE_CLKCMU_HSI0_USBDPDBG,
> > +       CLK_CON_GAT_GATE_CLKCMU_HSI1_BUS,
> > +       CLK_CON_GAT_GATE_CLKCMU_HSI1_PCIE,
> > +       CLK_CON_GAT_GATE_CLKCMU_HSI2_BUS,
> > +       CLK_CON_GAT_GATE_CLKCMU_HSI2_MMCCARD,
> > +       CLK_CON_GAT_GATE_CLKCMU_HSI2_PCIE,
> > +       CLK_CON_GAT_GATE_CLKCMU_HSI2_UFS_EMBD,
> > +       CLK_CON_GAT_GATE_CLKCMU_IPP_BUS,
> > +       CLK_CON_GAT_GATE_CLKCMU_ITP_BUS,
> > +       CLK_CON_GAT_GATE_CLKCMU_MCSC_ITSC,
> > +       CLK_CON_GAT_GATE_CLKCMU_MCSC_MCSC,
> > +       CLK_CON_GAT_GATE_CLKCMU_MFC_MFC,
> > +       CLK_CON_GAT_GATE_CLKCMU_MIF_BUSP,
> > +       CLK_CON_GAT_GATE_CLKCMU_MISC_BUS,
> > +       CLK_CON_GAT_GATE_CLKCMU_MISC_SSS,
> > +       CLK_CON_GAT_GATE_CLKCMU_PDP_BUS,
> > +       CLK_CON_GAT_GATE_CLKCMU_PDP_VRA,
> > +       CLK_CON_GAT_GATE_CLKCMU_PERIC0_BUS,
> > +       CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP,
> > +       CLK_CON_GAT_GATE_CLKCMU_PERIC1_BUS,
> > +       CLK_CON_GAT_GATE_CLKCMU_PERIC1_IP,
> > +       CLK_CON_GAT_GATE_CLKCMU_TNR_BUS,
> > +       CLK_CON_GAT_GATE_CLKCMU_TOP_CMUREF,
> > +       CLK_CON_GAT_GATE_CLKCMU_TPU_BUS,
> > +       CLK_CON_GAT_GATE_CLKCMU_TPU_TPU,
> > +       CLK_CON_GAT_GATE_CLKCMU_TPU_TPUCTL,
> > +       CLK_CON_GAT_GATE_CLKCMU_TPU_UART,
> > +       DMYQCH_CON_CMU_TOP_CMUREF_QCH,
> > +       DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK0,
> > +       DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK1,
> > +       DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK2,
> > +       DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK3,
> > +       DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK4,
> > +       DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK5,
> > +       DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK6,
> > +       DMYQCH_CON_DFTMUX_CMU_QCH_CIS_CLK7,
> > +       DMYQCH_CON_OTP_QCH,
> > +       QUEUE_CTRL_REG_BLK_CMU_CMU_TOP,
> > +       QUEUE_ENTRY0_BLK_CMU_CMU_TOP,
> > +       QUEUE_ENTRY1_BLK_CMU_CMU_TOP,
> > +       QUEUE_ENTRY2_BLK_CMU_CMU_TOP,
> > +       QUEUE_ENTRY3_BLK_CMU_CMU_TOP,
> > +       QUEUE_ENTRY4_BLK_CMU_CMU_TOP,
> > +       QUEUE_ENTRY5_BLK_CMU_CMU_TOP,
> > +       QUEUE_ENTRY6_BLK_CMU_CMU_TOP,
> > +       QUEUE_ENTRY7_BLK_CMU_CMU_TOP,
> > +       MIFMIRROR_QUEUE_CTRL_REG,
> > +       MIFMIRROR_QUEUE_ENTRY0,
> > +       MIFMIRROR_QUEUE_ENTRY1,
> > +       MIFMIRROR_QUEUE_ENTRY2,
> > +       MIFMIRROR_QUEUE_ENTRY3,
> > +       MIFMIRROR_QUEUE_ENTRY4,
> > +       MIFMIRROR_QUEUE_ENTRY5,
> > +       MIFMIRROR_QUEUE_ENTRY6,
> > +       MIFMIRROR_QUEUE_ENTRY7,
> > +       MIFMIRROR_QUEUE_BUSY,
> > +       GENERALIO_ACD_CHANNEL_0,
> > +       GENERALIO_ACD_CHANNEL_1,
> > +       GENERALIO_ACD_CHANNEL_2,
> > +       GENERALIO_ACD_CHANNEL_3,
> > +       GENERALIO_ACD_MASK,
> > +};
> > +
> > +static const struct samsung_pll_clock cmu_top_pll_clks[] __initconst =
=3D {
> > +       /* CMU_TOP_PURECLKCOMP */
> > +       PLL(pll_0517x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "osccl=
k",
> > +           PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0,
> > +           NULL),
> > +       PLL(pll_0517x, CLK_FOUT_SHARED1_PLL, "fout_shared1_pll", "osccl=
k",
> > +           PLL_LOCKTIME_PLL_SHARED1, PLL_CON3_PLL_SHARED1,
> > +           NULL),
> > +       PLL(pll_0518x, CLK_FOUT_SHARED2_PLL, "fout_shared2_pll", "osccl=
k",
> > +           PLL_LOCKTIME_PLL_SHARED2, PLL_CON3_PLL_SHARED2,
> > +           NULL),
> > +       PLL(pll_0518x, CLK_FOUT_SHARED3_PLL, "fout_shared3_pll", "osccl=
k",
> > +           PLL_LOCKTIME_PLL_SHARED3, PLL_CON3_PLL_SHARED3,
> > +           NULL),
> > +       PLL(pll_0518x, CLK_FOUT_SPARE_PLL, "fout_spare_pll", "oscclk",
> > +           PLL_LOCKTIME_PLL_SPARE, PLL_CON3_PLL_SPARE,
> > +           NULL),
> > +};
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP */
> > +PNAME(mout_shared0_pll_p)      =3D { "oscclk", "fout_shared0_pll" };
> > +PNAME(mout_shared1_pll_p)      =3D { "oscclk", "fout_shared1_pll" };
> > +PNAME(mout_shared2_pll_p)      =3D { "oscclk", "fout_shared2_pll" };
> > +PNAME(mout_shared3_pll_p)      =3D { "oscclk", "fout_shared3_pll" };
> > +PNAME(mout_spare_pll_p)                =3D { "oscclk", "fout_spare_pll=
" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_BUS0 */
> > +PNAME(mout_cmu_bus0_bus_p)     =3D { "dout_shared0_div4", "dout_shared=
1_div4",
> > +                                   "dout_shared2_div2", "dout_shared3_=
div2",
> > +                                   "fout_spare_pll" };
> > +
> > +PNAME(mout_cmu_cmu_boost_p)    =3D { "dout_shared0_div4", "dout_shared=
1_div4",
> > +                                   "dout_shared2_div2", "dout_shared3_=
div2" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_BUS1 */
> > +PNAME(mout_cmu_bus1_bus_p)     =3D { "dout_shared0_div3", "fout_shared=
3_pll",
> > +                                   "dout_shared1_div3", "dout_shared0_=
div4",
> > +                                   "dout_shared1_div4", "dout_shared2_=
div2",
> > +                                   "fout_spare_pll" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_BUS2 */
> > +PNAME(mout_cmu_bus2_bus_p)     =3D { "dout_shared0_div2", "dout_shared=
1_div2",
> > +                                   "fout_shared2_pll", "fout_shared3_p=
ll",
> > +                                   "dout_shared0_div3", "dout_shared1_=
div3",
> > +                                   "dout_shared0_div5", "fout_spare_pl=
l" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_CORE */
> > +PNAME(mout_cmu_core_bus_p)     =3D { "dout_shared0_div2", "dout_shared=
1_div2",
> > +                                   "fout_shared2_pll", "fout_shared3_p=
ll",
> > +                                   "dout_shared0_div3", "dout_shared1_=
div3",
> > +                                   "dout_shared0_div5", "fout_spare_pl=
l" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_EH */
> > +PNAME(mout_cmu_eh_bus_p)       =3D { "dout_shared0_div2", "dout_shared=
1_div2",
> > +                                   "fout_shared2_pll", "fout_shared3_p=
ll",
> > +                                   "dout_shared0_div3", "dout_shared1_=
div3",
> > +                                   "dout_shared0_div5", "fout_spare_pl=
l" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_CPUCL2 */
> > +PNAME(mout_cmu_cpucl2_switch_p)        =3D { "fout_shared1_pll", "dout=
_shared0_div2",
> > +                                   "dout_shared1_div2", "fout_shared2_=
pll",
> > +                                   "fout_shared3_pll", "dout_shared0_d=
iv3",
> > +                                   "dout_shared1_div3", "fout_spare_pl=
l" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_CPUCL1 */
> > +PNAME(mout_cmu_cpucl1_switch_p)        =3D { "fout_shared1_pll", "dout=
_shared0_div2",
> > +                                   "dout_shared1_div2", "fout_shared2_=
pll",
> > +                                   "fout_shared3_pll", "dout_shared0_d=
iv3",
> > +                                   "dout_shared1_div3", "fout_spare_pl=
l" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_CPUCL0 */
> > +PNAME(mout_cmu_cpucl0_switch_p)        =3D { "fout_shared1_pll", "dout=
_shared0_div2",
> > +                                   "dout_shared1_div2", "fout_shared2_=
pll",
> > +                                   "fout_shared3_pll", "dout_shared0_d=
iv3",
> > +                                   "dout_shared1_div3", "fout_spare_pl=
l" };
> > +
> > +PNAME(mout_cmu_cpucl0_dbg_p)   =3D { "fout_shared2_pll", "fout_shared3=
_pll",
> > +                                   "dout_shared0_div4", "dout_shared1_=
div4",
> > +                                   "dout_shared2_div2", "fout_spare_pl=
l" };
> > +
> > +PNAME(mout_cmu_hpm_p)          =3D { "oscclk", "dout_shared1_div3",
> > +                                   "dout_shared0_div4", "dout_shared2_=
div2" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_G3D */
> > +PNAME(mout_cmu_g3d_switch_p)   =3D { "fout_shared2_pll", "dout_shared0=
_div3",
> > +                                   "fout_shared3_pll", "dout_shared1_d=
iv3",
> > +                                   "dout_shared0_div4", "dout_shared1_=
div4",
> > +                                   "fout_spare_pll" };
> > +
> > +PNAME(mout_cmu_g3d_busd_p)     =3D { "dout_shared0_div2", "dout_shared=
1_div2",
> > +                                   "fout_shared2_pll", "fout_shared3_p=
ll",
> > +                                   "dout_shared0_div3", "dout_shared1_=
div3",
> > +                                   "dout_shared0_div4", "fout_spare_pl=
l" };
> > +
> > +PNAME(mout_cmu_g3d_glb_p)      =3D { "dout_shared0_div2", "dout_shared=
1_div2",
> > +                                   "fout_shared2_pll", "fout_shared3_p=
ll",
> > +                                   "dout_shared0_div3", "dout_shared1_=
div3",
> > +                                   "dout_shared0_div4", "fout_spare_pl=
l" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_DPU */
> > +PNAME(mout_cmu_dpu_p)          =3D { "dout_shared0_div3", "fout_shared=
3_pll",
> > +                                   "dout_shared1_div3", "dout_shared0_=
div4",
> > +                                   "dout_shared1_div4", "dout_shared2_=
div2",
> > +                                   "fout_spare_pll" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_DISP */
> > +PNAME(mout_cmu_disp_bus_p)     =3D { "dout_shared0_div3", "fout_shared=
3_pll",
> > +                                   "dout_shared1_div3", "dout_shared0_=
div4",
> > +                                   "dout_shared1_div4", "dout_shared2_=
div2",
> > +                                   "fout_spare_pll" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_G2D */
> > +PNAME(mout_cmu_g2d_g2d_p)      =3D { "dout_shared0_div3", "fout_shared=
3_pll",
> > +                                   "dout_shared1_div3", "dout_shared0_=
div4",
> > +                                   "dout_shared1_div4", "dout_shared2_=
div2",
> > +                                   "fout_spare_pll" };
> > +
> > +PNAME(mout_cmu_g2d_mscl_p)     =3D { "dout_shared0_div4", "dout_shared=
1_div4",
> > +                                   "dout_shared2_div2", "dout_shared3_=
div2",
> > +                                   "fout_spare_pll" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_HSI0 */
> > +PNAME(mout_cmu_hsi0_usb31drd_p)        =3D { "oscclk", "dout_shared2_d=
iv2" };
> > +
> > +PNAME(mout_cmu_hsi0_bus_p)     =3D { "dout_shared0_div4", "dout_shared=
1_div4",
> > +                                   "dout_shared2_div2", "dout_shared3_=
div2",
> > +                                   "fout_spare_pll" };
> > +
> > +PNAME(mout_cmu_hsi0_dpgtc_p)   =3D { "oscclk", "dout_shared0_div4",
> > +                                   "dout_shared2_div2", "fout_spare_pl=
l" };
> > +
> > +PNAME(mout_cmu_hsi0_usbdpdbg_p)        =3D { "oscclk", "dout_shared2_d=
iv2" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_HSI1 */
> > +PNAME(mout_cmu_hsi1_bus_p)     =3D { "dout_shared0_div4", "dout_shared=
1_div4",
> > +                                   "dout_shared2_div2", "dout_shared3_=
div2",
> > +                                   "fout_spare_pll" };
> > +
> > +PNAME(mout_cmu_hsi1_pcie_p)    =3D { "oscclk", "dout_shared2_div2" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_HSI2 */
> > +PNAME(mout_cmu_hsi2_bus_p)     =3D { "dout_shared0_div4", "dout_shared=
1_div4",
> > +                                   "dout_shared2_div2", "dout_shared3_=
div2",
> > +                                   "fout_spare_pll" };
> > +
> > +PNAME(mout_cmu_hsi2_pcie0_p)   =3D { "oscclk", "dout_shared2_div2" };
> > +
> > +PNAME(mout_cmu_hsi2_ufs_embd_p)        =3D { "oscclk", "dout_shared0_d=
iv4",
> > +                                   "dout_shared2_div2", "fout_spare_pl=
l" };
> > +
> > +PNAME(mout_cmu_hsi2_mmc_card_p)        =3D { "fout_shared2_pll", "fout=
_shared3_pll",
> > +                                   "dout_shared0_div4", "fout_spare_pl=
l" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_CSIS */
> > +PNAME(mout_cmu_csis_bus_p)     =3D { "dout_shared0_div3", "fout_shared=
3_pll",
> > +                                   "dout_shared1_div3", "dout_shared0_=
div4",
> > +                                   "dout_shared1_div4", "dout_shared2_=
div2",
> > +                                   "fout_spare_pll" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_PDP */
> > +PNAME(mout_cmu_pdp_bus_p)      =3D { "dout_shared0_div3", "fout_shared=
3_pll",
> > +                                   "dout_shared1_div3", "dout_shared0_=
div4",
> > +                                   "dout_shared1_div4", "dout_shared2_=
div2",
> > +                                   "fout_spare_pll" };
> > +
> > +PNAME(mout_cmu_pdp_vra_p)      =3D { "fout_shared2_pll", "dout_shared0=
_div3",
> > +                                   "fout_shared3_pll", "dout_shared1_d=
iv3",
> > +                                   "dout_shared0_div4", "dout_shared1_=
div4",
> > +                                   "fout_spare_pll" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_IPP */
> > +PNAME(mout_cmu_ipp_bus_p)      =3D { "dout_shared0_div3", "fout_shared=
3_pll",
> > +                                   "dout_shared1_div3", "dout_shared0_=
div4",
> > +                                   "dout_shared1_div4", "dout_shared2_=
div2",
> > +                                   "fout_spare_pll" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_G3AA */
> > +PNAME(mout_cmu_g3aa_p)         =3D { "dout_shared0_div3", "fout_shared=
3_pll",
> > +                                   "dout_shared1_div3", "dout_shared0_=
div4",
> > +                                   "dout_shared1_div4", "dout_shared2_=
div2",
> > +                                   "fout_spare_pll" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_ITP */
> > +PNAME(mout_cmu_itp_bus_p)      =3D { "dout_shared0_div3", "fout_shared=
3_pll",
> > +                                   "dout_shared1_div3", "dout_shared0_=
div4",
> > +                                   "dout_shared1_div4", "dout_shared2_=
div2",
> > +                                   "fout_spare_pll" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_DNS */
> > +PNAME(mout_cmu_dns_bus_p)      =3D { "dout_shared0_div3", "fout_shared=
3_pll",
> > +                                   "dout_shared1_div3", "dout_shared0_=
div4",
> > +                                   "dout_shared1_div4", "dout_shared2_=
div2",
> > +                                   "fout_spare_pll" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_TNR */
> > +PNAME(mout_cmu_tnr_bus_p)      =3D { "dout_shared0_div3", "fout_shared=
3_pll",
> > +                                   "dout_shared1_div3", "dout_shared0_=
div4",
> > +                                   "dout_shared1_div4", "dout_shared2_=
div2",
> > +                                   "fout_spare_pll" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_MCSC */
> > +PNAME(mout_cmu_mcsc_itsc_p)    =3D { "dout_shared0_div3", "fout_shared=
3_pll",
> > +                                   "dout_shared1_div3", "dout_shared0_=
div4",
> > +                                   "dout_shared1_div4", "dout_shared2_=
div2",
> > +                                   "fout_spare_pll" };
> > +
> > +PNAME(mout_cmu_mcsc_mcsc_p)    =3D { "dout_shared0_div3", "fout_shared=
3_pll",
> > +                                   "dout_shared1_div3", "dout_shared0_=
div4",
> > +                                   "dout_shared1_div4", "dout_shared2_=
div2",
> > +                                   "fout_spare_pll" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_GDC */
> > +PNAME(mout_cmu_gdc_scsc_p)     =3D { "dout_shared0_div3", "fout_shared=
3_pll",
> > +                                   "dout_shared1_div3", "dout_shared0_=
div4",
> > +                                   "dout_shared1_div4", "dout_shared2_=
div2",
> > +                                   "fout_spare_pll" };
> > +
> > +PNAME(mout_cmu_gdc_gdc0_p)     =3D { "dout_shared0_div3", "fout_shared=
3_pll",
> > +                                   "dout_shared1_div3", "dout_shared0_=
div4",
> > +                                   "dout_shared1_div4", "dout_shared2_=
div2",
> > +                                   "fout_spare_pll" };
> > +
> > +PNAME(mout_cmu_gdc_gdc1_p)     =3D { "dout_shared0_div3", "fout_shared=
3_pll",
> > +                                   "dout_shared1_div3", "dout_shared0_=
div4",
> > +                                   "dout_shared1_div4", "dout_shared2_=
div2",
> > +                                   "fout_spare_pll" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_MFC */
> > +PNAME(mout_cmu_mfc_mfc_p)      =3D { "dout_shared0_div3", "fout_shared=
3_pll",
> > +                                   "dout_shared1_div3", "dout_shared0_=
div4",
> > +                                   "dout_shared1_div4", "dout_shared2_=
div2",
> > +                                   "fout_spare_pll" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for DDRPHY0/1/2/3 */
> > +
> > +PNAME(mout_cmu_mif_switch_p)   =3D { "fout_shared0_pll", "fout_shared1=
_pll",
> > +                                   "dout_shared0_div2", "dout_shared1_=
div2",
> > +                                   "fout_shared2_pll", "dout_shared0_d=
iv3",
> > +                                   "fout_shared3_pll", "fout_spare_pll=
" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_MIF0/1/2/3 */
> > +PNAME(mout_cmu_mif_busp_p)     =3D { "dout_shared0_div4", "dout_shared=
1_div4",
> > +                                   "dout_shared0_div5", "fout_spare_pl=
l" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_MISC */
> > +PNAME(mout_cmu_misc_bus_p)     =3D { "dout_shared0_div4", "dout_shared=
2_div2",
> > +                                   "dout_shared3_div2", "fout_spare_pl=
l" };
> > +PNAME(mout_cmu_misc_sss_p)     =3D { "dout_shared0_div4", "dout_shared=
2_div2",
> > +                                   "dout_shared3_div2", "fout_spare_pl=
l" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_PERIC0 */
> > +PNAME(mout_cmu_peric0_bus_p)   =3D { "dout_shared0_div4", "dout_shared=
2_div2",
> > +                                   "dout_shared3_div2", "fout_spare_pl=
l" };
> > +PNAME(mout_cmu_peric0_ip_p)    =3D { "dout_shared0_div4", "dout_shared=
2_div2",
> > +                                   "dout_shared3_div2", "fout_spare_pl=
l" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_PERIC1 */
> > +PNAME(mout_cmu_peric1_bus_p)   =3D { "dout_shared0_div4", "dout_shared=
2_div2",
> > +                                   "dout_shared3_div2", "fout_spare_pl=
l" };
> > +PNAME(mout_cmu_peric1_ip_p)    =3D { "dout_shared0_div4", "dout_shared=
2_div2",
> > +                                   "dout_shared3_div2", "fout_spare_pl=
l" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_TPU */
> > +PNAME(mout_cmu_tpu_tpu_p)      =3D { "dout_shared0_div2", "dout_shared=
1_div2",
> > +                                   "fout_shared2_pll", "fout_shared3_p=
ll",
> > +                                   "dout_shared0_div3", "dout_shared1_=
div3",
> > +                                   "dout_shared0_div4", "fout_spare_pl=
l" };
> > +
> > +PNAME(mout_cmu_tpu_tpuctl_p)   =3D { "dout_shared0_div2", "dout_shared=
1_div2",
> > +                                   "fout_shared2_pll", "fout_shared3_p=
ll",
> > +                                   "dout_shared0_div3", "dout_shared1_=
div3",
> > +                                   "dout_shared0_div4", "fout_spare_pl=
l" };
> > +
> > +PNAME(mout_cmu_tpu_bus_p)      =3D { "dout_shared0_div2", "dout_shared=
1_div2",
> > +                                   "fout_shared2_pll", "fout_shared3_p=
ll",
> > +                                   "dout_shared0_div3", "dout_shared1_=
div3",
> > +                                   "dout_shared0_div4", "fout_spare_pl=
l" };
> > +
> > +PNAME(mout_cmu_tpu_uart_p)     =3D { "dout_shared0_div4", "dout_shared=
2_div2",
> > +                                   "dout_shared3_div2", "fout_spare_pl=
l" };
> > +
> > +/* List of parent clocks for Muxes in CMU_TOP: for CMU_BO */
> > +PNAME(mout_cmu_bo_bus_p)       =3D { "fout_shared2_pll", "dout_shared0=
_div3",
> > +                                   "fout_shared3_pll", "dout_shared1_d=
iv3",
> > +                                   "dout_shared0_div4", "dout_shared1_=
div4",
> > +                                   "fout_spare_pll" };
> > +
> > +/* gs101 */
>
> Maybe remove this comment.

will fix
>
> > +static const struct samsung_mux_clock cmu_top_mux_clks[] __initconst =
=3D {
> > +       /* CMU_TOP_PURECLKCOMP */
> > +       MUX(CLK_MOUT_SHARED0_PLL, "mout_shared0_pll", mout_shared0_pll_=
p,
> > +           PLL_CON0_PLL_SHARED0, 4, 1),
> > +       MUX(CLK_MOUT_SHARED1_PLL, "mout_shared1_pll", mout_shared1_pll_=
p,
> > +           PLL_CON0_PLL_SHARED1, 4, 1),
> > +       MUX(CLK_MOUT_SHARED2_PLL, "mout_shared2_pll", mout_shared2_pll_=
p,
> > +           PLL_CON0_PLL_SHARED2, 4, 1),
> > +       MUX(CLK_MOUT_SHARED3_PLL, "mout_shared3_pll", mout_shared3_pll_=
p,
> > +           PLL_CON0_PLL_SHARED3, 4, 1),
> > +       MUX(CLK_MOUT_SPARE_PLL, "mout_spare_pll", mout_spare_pll_p,
> > +           PLL_CON0_PLL_SPARE, 4, 1),
> > +
> > +       /* BUS0 */
> > +       MUX(CLK_MOUT_BUS0_BUS, "mout_cmu_bus0_bus", mout_cmu_bus0_bus_p=
,
> > +           CLK_CON_MUX_MUX_CLKCMU_BUS0_BUS, 0, 2),
> > +       MUX(CLK_MOUT_CMU_BOOST, "mout_cmu_boost", mout_cmu_cmu_boost_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_CMU_BOOST, 0, 2),
> > +
> > +       /* BUS1 */
> > +       MUX(CLK_MOUT_BUS1_BUS, "mout_cmu_bus1_bus", mout_cmu_bus1_bus_p=
,
> > +           CLK_CON_MUX_MUX_CLKCMU_BUS1_BUS, 0, 2),
> > +
> > +       /* BUS2 */
> > +       MUX(CLK_MOUT_BUS2_BUS, "mout_cmu_bus2_bus", mout_cmu_bus2_bus_p=
,
> > +           CLK_CON_MUX_MUX_CLKCMU_BUS2_BUS, 0, 2),
> > +
> > +       /* CORE */
> > +       MUX(CLK_MOUT_CORE_BUS, "mout_cmu_core_bus", mout_cmu_core_bus_p=
,
> > +           CLK_CON_MUX_MUX_CLKCMU_CORE_BUS, 0, 2),
> > +
> > +       /* EH */
> > +       MUX(CLK_MOUT_EH_BUS, "mout_cmu_eh_bus", mout_cmu_eh_bus_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_CORE_BUS, 0, 2),
> > +
> > +       /* CPUCL{0,1,2,} */
> > +       MUX(CLK_MOUT_CPUCL2_SWITCH, "mout_cmu_cpucl2_switch", mout_cmu_=
cpucl2_switch_p,
>
> Here and further: please stick to 80 characters per line when possible.

will fix
>
> > +           CLK_CON_MUX_MUX_CLKCMU_CPUCL2_SWITCH, 0, 2),
> > +
> > +       MUX(CLK_MOUT_CPUCL1_SWITCH, "mout_cmu_cpucl1_switch", mout_cmu_=
cpucl1_switch_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_CPUCL1_SWITCH, 0, 2),
> > +
> > +       MUX(CLK_MOUT_CPUCL0_SWITCH, "mout_cmu_cpucl0_switch", mout_cmu_=
cpucl0_switch_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_CPUCL0_SWITCH, 0, 2),
> > +
> > +       MUX(CLK_MOUT_CPUCL0_DBG, "mout_cmu_cpucl0_dbg", mout_cmu_cpucl0=
_dbg_p,
> > +           CLK_CON_DIV_CLKCMU_CPUCL0_DBG, 0, 2),
> > +
> > +       MUX(CLK_MOUT_CMU_HPM, "mout_cmu_hpm", mout_cmu_hpm_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_HPM, 0, 2),
> > +
> > +       /* G3D */
> > +       MUX(CLK_MOUT_G3D_SWITCH, "mout_cmu_g3d_switch", mout_cmu_g3d_sw=
itch_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_G3D_SWITCH, 0, 2),
> > +
> > +       MUX(CLK_MOUT_G3D_BUSD, "mout_cmu_g3d_busd", mout_cmu_g3d_busd_p=
,
> > +           CLK_CON_MUX_MUX_CLKCMU_G3D_BUSD, 0, 2),
> > +
> > +       MUX(CLK_MOUT_G3D_GLB, "mout_cmu_g3d_glb", mout_cmu_g3d_glb_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_G3D_GLB, 0, 2),
> > +       /* DPU */
> > +       MUX(CLK_MOUT_DPU_BUS, "mout_cmu_dpu_bus", mout_cmu_dpu_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_DPU_BUS, 0, 2),
> > +
> > +       /* DISP */
> > +       MUX(CLK_MOUT_DISP_BUS, "mout_cmu_disp_bus", mout_cmu_disp_bus_p=
,
> > +           CLK_CON_MUX_MUX_CLKCMU_DISP_BUS, 0, 2),
> > +
> > +       /* G2D */
> > +       MUX(CLK_MOUT_G2D_G2D, "mout_cmu_g2d_g2d", mout_cmu_g2d_g2d_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_G2D_G2D, 0, 2),
> > +
> > +       MUX(CLK_MOUT_G2D_MSCL, "mout_cmu_g2d_mscl", mout_cmu_g2d_mscl_p=
,
> > +           CLK_CON_MUX_MUX_CLKCMU_G2D_MSCL, 0, 2),
> > +
> > +       /* HSI0 */
> > +       MUX(CLK_MOUT_HSI0_USB31DRD, "mout_cmu_hsi0_usb31drd", mout_cmu_=
hsi0_usb31drd_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_HSI0_USB31DRD, 0, 2),
> > +
> > +       MUX(CLK_MOUT_HSI0_BUS, "mout_cmu_hsi0_bus", mout_cmu_hsi0_bus_p=
,
> > +           CLK_CON_MUX_MUX_CLKCMU_HSI0_BUS, 0, 2),
> > +
> > +       MUX(CLK_MOUT_HSI0_DPGTC, "mout_cmu_hsi0_dpgtc", mout_cmu_hsi0_d=
pgtc_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_HSI0_DPGTC, 0, 2),
> > +
> > +       MUX(CLK_MOUT_HSI0_USBDPDGB, "mout_cmu_hsi0_usbdpdbg", mout_cmu_=
hsi0_usbdpdbg_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_HSI0_USBDPDBG, 0, 2),
> > +
> > +       /* HSI1 */
> > +       MUX(CLK_MOUT_HSI1_BUS, "mout_cmu_hsi1_bus", mout_cmu_hsi1_bus_p=
,
> > +           CLK_CON_MUX_MUX_CLKCMU_HSI1_BUS, 0, 2),
> > +
> > +       MUX(CLK_MOUT_HSI1_PCIE, "mout_cmu_hsi1_pcie", mout_cmu_hsi1_pci=
e_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_HSI1_PCIE, 0, 2),
> > +       /* HSI2 */
> > +       MUX(CLK_MOUT_HSI2_BUS, "mout_cmu_hsi2_bus", mout_cmu_hsi2_bus_p=
,
> > +           CLK_CON_MUX_MUX_CLKCMU_HSI2_BUS, 0, 2),
> > +
> > +       MUX(CLK_MOUT_HSI2_PCIE, "mout_cmu_hsi2_pcie", mout_cmu_hsi2_pci=
e0_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_HSI2_PCIE, 0, 2),
> > +
> > +       MUX(CLK_MOUT_HSI2_UFS_EMBD, "mout_cmu_hsi2_ufs_embd", mout_cmu_=
hsi2_ufs_embd_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_HSI2_UFS_EMBD, 0, 2),
> > +
> > +       MUX(CLK_MOUT_HSI2_MMC_CARD, "mout_cmu_hsi2_mmc_card", mout_cmu_=
hsi2_mmc_card_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_HSI2_MMC_CARD, 0, 2),
> > +
> > +       /* CSIS */
> > +       MUX(CLK_MOUT_CSIS, "mout_cmu_csis_bus", mout_cmu_csis_bus_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_CSIS_BUS, 0, 2),
> > +
> > +       /* PDP */
> > +       MUX(CLK_MOUT_PDP_BUS, "mout_cmu_pdp_bus", mout_cmu_pdp_bus_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_PDP_BUS, 0, 2),
> > +
> > +       /* PDP */
> > +       MUX(CLK_MOUT_PDP_VRA, "mout_cmu_pdp_vra", mout_cmu_pdp_vra_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_PDP_VRA, 0, 2),
> > +
> > +       /* IPP */
> > +       MUX(CLK_MOUT_IPP_BUS, "mout_cmu_ipp_bus", mout_cmu_ipp_bus_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_IPP_BUS, 0, 2),
> > +
> > +       /* G3AA */
> > +       MUX(CLK_MOUT_G3AA, "mout_cmu_g3aa", mout_cmu_g3aa_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_G3AA_G3AA, 0, 2),
> > +
> > +       /* ITP */
> > +       MUX(CLK_MOUT_ITP, "mout_cmu_itp_bus", mout_cmu_itp_bus_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_ITP_BUS, 0, 2),
> > +
> > +       /* DNS */
> > +       MUX(CLK_MOUT_DNS_BUS, "mout_cmu_dns_bus", mout_cmu_dns_bus_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_DNS_BUS, 0, 2),
> > +
> > +       /* TNR */
> > +       MUX(CLK_MOUT_TNR_BUS, "mout_cmu_tnr_bus", mout_cmu_tnr_bus_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_TNR_BUS, 0, 2),
> > +
> > +       /* MCSC*/
> > +       MUX(CLK_MOUT_MCSC_ITSC, "mout_cmu_mcsc_itsc", mout_cmu_mcsc_its=
c_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_MCSC_ITSC, 0, 2),
> > +
> > +       MUX(CLK_MOUT_MCSC_MCSC, "mout_cmu_mcsc_mcsc", mout_cmu_mcsc_mcs=
c_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_MCSC_MCSC, 0, 2),
> > +
> > +       /* GDC */
> > +       MUX(CLK_MOUT_GDC_SCSC, "mout_cmu_gdc_scsc", mout_cmu_gdc_scsc_p=
,
> > +           CLK_CON_MUX_MUX_CLKCMU_GDC_SCSC, 0, 2),
> > +
> > +       MUX(CLK_MOUT_GDC_GDC0, "mout_cmu_gdc_gdc0", mout_cmu_gdc_gdc0_p=
,
> > +           CLK_CON_MUX_MUX_CLKCMU_GDC_GDC0, 0, 2),
> > +
> > +       MUX(CLK_MOUT_GDC_GDC1, "mout_cmu_gdc_gdc1", mout_cmu_gdc_gdc1_p=
,
> > +           CLK_CON_MUX_MUX_CLKCMU_GDC_GDC1, 0, 2),
> > +
> > +       /* MFC */
> > +       MUX(CLK_MOUT_MFC_MFC, "mout_cmu_mfc_mfc", mout_cmu_mfc_mfc_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_MFC_MFC, 0, 2),
> > +
> > +       /* DDRPHY0/1/2/3 */
> > +       MUX(CLK_MOUT_MIF_SWITCH, "mout_cmu_mif_switch", mout_cmu_mif_sw=
itch_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_MIF_SWITCH, 0, 2),
> > +
> > +       /* MIF0/1/2/3 */
> > +       MUX(CLK_MOUT_MIF_BUS, "mout_cmu_mif_busp", mout_cmu_mif_busp_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_MIF_BUSP, 0, 2),
> > +
> > +       /* MISC */
> > +       MUX(CLK_MOUT_MISC_BUS, "mout_cmu_misc_bus", mout_cmu_misc_bus_p=
,
> > +           CLK_CON_MUX_MUX_CLKCMU_MISC_BUS, 0, 2),
> > +       MUX(CLK_MOUT_MISC_SSS, "mout_cmu_misc_sss", mout_cmu_misc_sss_p=
,
> > +           CLK_CON_MUX_MUX_CLKCMU_MISC_SSS, 0, 2),
> > +
> > +       /* PERI0 */
> > +       MUX(CLK_MOUT_PERIC0_IP, "mout_cmu_peric0_ip", mout_cmu_peric0_i=
p_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP, 0, 2),
> > +       MUX(CLK_MOUT_PERIC0_BUS, "mout_cmu_peric0_bus", mout_cmu_peric0=
_bus_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_PERIC0_BUS, 0, 2),
> > +       /* PERI1 */
> > +       MUX(CLK_MOUT_PERIC1_IP, "mout_cmu_peric1_ip", mout_cmu_peric1_i=
p_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_PERIC0_IP, 0, 2),
> > +       MUX(CLK_MOUT_PERIC1_BUS, "mout_cmu_peric1_bus", mout_cmu_peric1=
_bus_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_PERIC0_BUS, 0, 2),
> > +
> > +       /* TPU */
> > +       MUX(CLK_MOUT_TPU_TPU, "mout_cmu_tpu_tpu", mout_cmu_tpu_tpu_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_TPU_TPU, 0, 2),
> > +
> > +       MUX(CLK_MOUT_TPU_TPUCTL, "mout_cmu_tpu_tpuctl", mout_cmu_tpu_tp=
uctl_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_TPU_TPUCTL, 0, 2),
> > +
> > +       MUX(CLK_MOUT_TPU_BUS, "mout_cmu_tpu_bus", mout_cmu_tpu_bus_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_TPU_BUS, 0, 2),
> > +
> > +       MUX(CLK_MOUT_TPU_UART, "mout_cmu_tpu_uart", mout_cmu_tpu_uart_p=
,
> > +           CLK_CON_MUX_MUX_CLKCMU_TPU_UART, 0, 2),
> > +
> > +       /* BO */
> > +       MUX(CLK_MOUT_BO_BUS, "mout_cmu_bo_bus", mout_cmu_bo_bus_p,
> > +           CLK_CON_MUX_MUX_CLKCMU_BO_BUS, 0, 2),
> > +};
> > +
> > +static const struct samsung_div_clock cmu_top_div_clks[] __initconst =
=3D {
> > +       /* CMU_TOP_PURECLKCOMP */
> > +       DIV(CLK_DOUT_SHARED0_DIV3, "dout_shared0_div3", "mout_shared0_p=
ll",
> > +           CLK_CON_DIV_PLL_SHARED0_DIV3, 0, 2),
> > +       DIV(CLK_DOUT_SHARED0_DIV2, "dout_shared0_div2", "mout_shared0_p=
ll",
> > +           CLK_CON_DIV_PLL_SHARED0_DIV2, 0, 1),
> > +       DIV(CLK_DOUT_SHARED0_DIV5, "dout_shared0_div5", "mout_shared0_p=
ll",
> > +           CLK_CON_DIV_PLL_SHARED0_DIV5, 0, 2),
> > +       DIV(CLK_DOUT_SHARED0_DIV4, "dout_shared0_div4", "dout_shared0_d=
iv2",
> > +           CLK_CON_DIV_PLL_SHARED0_DIV4, 0, 1),
> > +
> > +       DIV(CLK_DOUT_SHARED1_DIV2, "dout_shared1_div2", "mout_shared1_p=
ll",
> > +           CLK_CON_DIV_PLL_SHARED1_DIV2, 0, 1),
> > +       DIV(CLK_DOUT_SHARED1_DIV3, "dout_shared1_div3", "mout_shared1_p=
ll",
> > +           CLK_CON_DIV_PLL_SHARED1_DIV3, 0, 2),
> > +       DIV(CLK_DOUT_SHARED1_DIV4, "dout_shared1_div4", "mout_shared1_p=
ll",
> > +           CLK_CON_DIV_PLL_SHARED1_DIV4, 0, 1),
> > +
> > +       DIV(CLK_DOUT_SHARED2_DIV2, "dout_shared2_div2", "mout_shared2_p=
ll",
> > +           CLK_CON_DIV_PLL_SHARED2_DIV2, 0, 1),
> > +
> > +       DIV(CLK_DOUT_SHARED3_DIV2, "dout_shared3_div2", "mout_shared3_p=
ll",
> > +           CLK_CON_DIV_PLL_SHARED3_DIV2, 0, 1),
> > +
> > +       /* BUS0 */
> > +       DIV(CLK_DOUT_BUS0_BUS, "dout_cmu_bus0_bus_div", "gout_cmu_bus0_=
bus",
> > +           CLK_CON_DIV_CLKCMU_BUS0_BUS, 0, 4),
> > +       DIV(CLK_DOUT_CMU_BOOST, "dout_cmu_boost", "gout_cmu_cmu_boost",
> > +           CLK_CON_DIV_DIV_CLKCMU_CMU_BOOST, 0, 2),
> > +
> > +       /* BUS1 */
> > +       DIV(CLK_DOUT_BUS1_BUS, "dout_cmu_bus1_bus", "gout_cmu_bus1_bus"=
,
> > +           CLK_CON_DIV_CLKCMU_BUS1_BUS, 0, 4),
> > +
> > +       /* BUS2 */
> > +       DIV(CLK_DOUT_BUS2_BUS, "dout_cmu_bus2_bus", "gout_cmu_bus2_bus"=
,
> > +           CLK_CON_DIV_CLKCMU_BUS2_BUS, 0, 4),
> > +
> > +       /* CORE */
> > +       DIV(CLK_DOUT_CORE_BUS, "dout_cmu_core_bus", "gout_cmu_core_bus"=
,
> > +           CLK_CON_DIV_CLKCMU_CORE_BUS, 0, 4),
> > +
> > +       /* EH */
> > +       DIV(CLK_DOUT_EH_BUS, "dout_cmu_eh_bus", "gout_cmu_eh_bus",
> > +           CLK_CON_DIV_CLKCMU_EH_BUS, 0, 4),
> > +
> > +       /* CPUCL{0,1,2,} */
> > +       DIV(CLK_DOUT_CPUCL2_SWITCH, "dout_cmu_cpucl2_switch", "gout_cmu=
_cpucl2_switch",
> > +           CLK_CON_DIV_CLKCMU_CPUCL2_SWITCH, 0, 3),
> > +
> > +       DIV(CLK_DOUT_CPUCL1_SWITCH, "dout_cmu_cpucl1_switch", "gout_cmu=
_cpucl1_switch",
> > +           CLK_CON_DIV_CLKCMU_CPUCL1_SWITCH, 0, 3),
> > +
> > +       DIV(CLK_DOUT_CPUCL0_SWITCH, "dout_cmu_cpucl0_switch", "gout_cmu=
_cpucl0_switch",
> > +           CLK_CON_DIV_CLKCMU_CPUCL0_SWITCH, 0, 3),
> > +
> > +       DIV(CLK_DOUT_CPUCL0_DBG, "dout_cmu_cpucl0_dbg", "gout_cmu_cpucl=
0_dbg",
> > +           CLK_CON_DIV_CLKCMU_CPUCL0_DBG, 0, 4),
> > +
> > +       DIV(CLK_DOUT_CMU_HPM, "dout_cmu_hpm", "gout_cmu_hpm",
> > +           CLK_CON_DIV_CLKCMU_HPM, 0, 2),
> > +
> > +       /* G3D */
> > +       DIV(CLK_DOUT_G3D_SWITCH, "dout_cmu_g3d_switch", "gout_cmu_g3d_s=
witch",
> > +           CLK_CON_DIV_CLKCMU_G3D_SWITCH, 0, 3),
> > +
> > +       DIV(CLK_DOUT_G3D_SWITCH, "dout_cmu_g3d_busd", "gout_cmu_g3d_bus=
d",
> > +           CLK_CON_DIV_CLKCMU_G3D_BUSD, 0, 4),
> > +
> > +       DIV(CLK_DOUT_G3D_GLB, "dout_cmu_g3d_glb", "gout_cmu_g3d_glb",
> > +           CLK_CON_DIV_CLKCMU_G3D_GLB, 0, 4),
> > +
> > +       /* DPU */
> > +       DIV(CLK_DOUT_DPU_BUS, "dout_cmu_dpu_bus", "gout_cmu_dpu_bus",
> > +           CLK_CON_DIV_CLKCMU_DPU_BUS, 0, 4),
> > +
> > +       /* DISP */
> > +       DIV(CLK_DOUT_DISP_BUS, "dout_cmu_disp_bus", "gout_cmu_disp_bus"=
,
> > +           CLK_CON_DIV_CLKCMU_DISP_BUS, 0, 4),
> > +
> > +       /* G2D */
> > +       DIV(CLK_DOUT_G2D_G2D, "dout_cmu_g2d_g2d", "gout_cmu_g2d_g2d",
> > +           CLK_CON_DIV_CLKCMU_G2D_G2D, 0, 4),
> > +
> > +       DIV(CLK_DOUT_G2D_MSCL, "dout_cmu_g2d_mscl", "gout_cmu_g2d_mscl"=
,
> > +           CLK_CON_DIV_CLKCMU_G2D_MSCL, 0, 4),
> > +
> > +       /* HSI0 */
> > +       DIV(CLK_DOUT_HSI0_USB31DRD, "dout_cmu_hsi0_usb31drd", "gout_cmu=
_hsi0_usb31drd",
> > +           CLK_CON_DIV_CLKCMU_HSI0_USB31DRD, 0, 5),
> > +
> > +       DIV(CLK_DOUT_HSI0_BUS, "dout_cmu_hsi0_bus", "gout_cmu_hsi0_bus"=
,
> > +           CLK_CON_DIV_CLKCMU_HSI0_BUS, 0, 4),
> > +
> > +       DIV(CLK_DOUT_HSI0_DPGTC, "dout_cmu_hsi0_dpgtc", "gout_cmu_hsi0_=
dpgtc",
> > +           CLK_CON_DIV_CLKCMU_HSI0_DPGTC, 0, 4),
> > +
> > +       /* TODO register exists but all lower bits are reserved */
> > +       DIV(CLK_DOUT_HSI0_USBDPDGB, "dout_cmu_hsi0_usbdpdbg", "gout_cmu=
_hsi0_usbdpdbg",
> > +           CLK_CON_DIV_CLKCMU_HSI0_USBDPDBG, 0, 0),
> > +
> > +       /* HSI1 */
> > +       DIV(CLK_DOUT_HSI1_BUS, "dout_cmu_hsi1_bus", "gout_cmu_hsi1_bus"=
,
> > +           CLK_CON_DIV_CLKCMU_HSI1_BUS, 0, 4),
> > +
> > +       DIV(CLK_DOUT_HSI1_PCIE, "dout_cmu_hsi1_pcie", "gout_cmu_hsi1_pc=
ie",
> > +           CLK_CON_DIV_CLKCMU_HSI1_PCIE, 0, 3),
> > +       /* HSI2 */
> > +       DIV(CLK_DOUT_HSI2_BUS, "dout_cmu_hsi2_bus", "gout_cmu_hsi2_bus"=
,
> > +           CLK_CON_DIV_CLKCMU_HSI2_BUS, 0, 4),
> > +
> > +       DIV(CLK_DOUT_HSI2_PCIE, "dout_cmu_hsi2_pcie", "gout_cmu_hsi2_pc=
ie",
> > +           CLK_CON_DIV_CLKCMU_HSI2_PCIE, 0, 3),
> > +
> > +       DIV(CLK_DOUT_HSI2_UFS_EMBD, "dout_cmu_hsi2_ufs_embd", "gout_cmu=
_hsi2_ufs_embd",
> > +           CLK_CON_DIV_CLKCMU_HSI2_UFS_EMBD, 0, 4),
> > +
> > +       DIV(CLK_DOUT_HSI2_MMC_CARD, "dout_cmu_hsi2_mmc_card", "gout_cmu=
_hsi2_mmc_card",
> > +           CLK_CON_DIV_CLKCMU_HSI2_MMC_CARD, 0, 9),
> > +
> > +       /* CSIS */
> > +       DIV(CLK_DOUT_CSIS, "dout_cmu_csis_bus", "gout_cmu_csis_bus",
> > +           CLK_CON_DIV_CLKCMU_CSIS_BUS, 0, 4),
> > +
> > +       /* PDP */
> > +       DIV(CLK_DOUT_PDP_BUS, "dout_cmu_pdp_bus", "gout_cmu_pdp_bus",
> > +           CLK_CON_DIV_CLKCMU_PDP_BUS, 0, 4),
> > +
> > +       DIV(CLK_DOUT_PDP_VRA, "dout_cmu_pdp_vra", "gout_cmu_pdp_vra",
> > +           CLK_CON_DIV_CLKCMU_PDP_VRA, 0, 4),
> > +
> > +       /* IPP */
> > +       DIV(CLK_DOUT_IPP_BUS, "dout_cmu_ipp_bus", "gout_cmu_ipp_bus",
> > +           CLK_CON_DIV_CLKCMU_IPP_BUS, 0, 4),
> > +
> > +       /* G3AA */
> > +       DIV(CLK_DOUT_G3AA, "dout_cmu_g3aa", "gout_cmu_g3aa",
> > +           CLK_CON_DIV_CLKCMU_G3AA_G3AA, 0, 4),
> > +
> > +       /* ITP */
> > +       DIV(CLK_DOUT_ITP, "dout_cmu_itp_bus", "gout_cmu_itp_bus",
> > +           CLK_CON_DIV_CLKCMU_ITP_BUS, 0, 4),
> > +
> > +       /* DNS */
> > +       DIV(CLK_DOUT_DNS_BUS, "dout_cmu_dns_bus", "gout_cmu_dns_bus",
> > +           CLK_CON_DIV_CLKCMU_DNS_BUS, 0, 4),
> > +
> > +       /* TNR */
> > +       DIV(CLK_DOUT_TNR_BUS, "dout_cmu_tnr_bus", "gout_cmu_tnr_bus",
> > +           CLK_CON_DIV_CLKCMU_TNR_BUS, 0, 4),
> > +
> > +       /* MCSC*/
> > +       DIV(CLK_DOUT_MCSC_ITSC, "dout_cmu_mcsc_itsc", "gout_cmu_mcsc_it=
sc",
> > +           CLK_CON_DIV_CLKCMU_MCSC_ITSC, 0, 4),
> > +
> > +       DIV(CLK_DOUT_MCSC_MCSC, "dout_cmu_mcsc_mcsc", "gout_cmu_mcsc_mc=
sc",
> > +           CLK_CON_DIV_CLKCMU_MCSC_MCSC, 0, 4),
> > +
> > +       /* GDC */
> > +       DIV(CLK_DOUT_GDC_SCSC, "dout_cmu_gdc_scsc", "gout_cmu_gdc_scsc"=
,
> > +           CLK_CON_DIV_CLKCMU_GDC_SCSC, 0, 4),
> > +
> > +       DIV(CLK_DOUT_GDC_GDC0, "dout_cmu_gdc_gdc0", "gout_cmu_gdc_gdc0"=
,
> > +           CLK_CON_DIV_CLKCMU_GDC_GDC0, 0, 4),
> > +
> > +       DIV(CLK_DOUT_GDC_GDC1, "dout_cmu_gdc_gdc1", "gout_cmu_gdc_gdc1"=
,
> > +           CLK_CON_DIV_CLKCMU_GDC_GDC1, 0, 4),
> > +
> > +       /* MFC */
> > +       DIV(CLK_DOUT_MFC_MFC, "dout_cmu_mfc_mfc", "gout_cmu_mfc_mfc",
> > +           CLK_CON_DIV_CLKCMU_MFC_MFC, 0, 4),
> > +
> > +       /* MIF0/1/2/3 */
> > +       DIV(CLK_DOUT_MIF_BUS, "dout_cmu_mif_busp", "gout_cmu_mif_busp",
> > +           CLK_CON_DIV_CLKCMU_MIF_BUSP, 0, 4),
> > +
> > +       /* MISC */
> > +       DIV(CLK_DOUT_MISC_BUS, "dout_cmu_misc_bus", "gout_cmu_misc_bus"=
,
> > +           CLK_CON_DIV_CLKCMU_MISC_BUS, 0, 4),
> > +       DIV(CLK_DOUT_MISC_SSS, "dout_cmu_misc_sss", "gout_cmu_misc_sss"=
,
> > +           CLK_CON_DIV_CLKCMU_MISC_SSS, 0, 4),
> > +
> > +       /* PERI0 */
> > +       DIV(CLK_DOUT_PERIC0_BUS, "dout_cmu_peric0_bus", "gout_cmu_peric=
0_bus",
> > +           CLK_CON_DIV_CLKCMU_PERIC0_BUS, 0, 4),
> > +       DIV(CLK_DOUT_PERIC0_IP, "dout_cmu_peric0_ip", "gout_cmu_peric0_=
ip",
> > +           CLK_CON_DIV_CLKCMU_PERIC0_IP, 0, 4),
> > +
> > +       /* PERI1 */
> > +       DIV(CLK_DOUT_PERIC1_BUS, "dout_cmu_peric1_bus", "gout_cmu_peric=
1_bus",
> > +           CLK_CON_DIV_CLKCMU_PERIC1_BUS, 0, 4),
> > +       DIV(CLK_DOUT_PERIC1_IP, "dout_cmu_peric1_ip", "gout_cmu_peric1_=
ip",
> > +           CLK_CON_DIV_CLKCMU_PERIC1_IP, 0, 4),
> > +
> > +       /* TPU */
> > +       DIV(CLK_DOUT_TPU_TPU, "dout_cmu_tpu_tpu", "gout_cmu_tpu_tpu",
> > +           CLK_CON_DIV_CLKCMU_TPU_TPU, 0, 4),
> > +
> > +       DIV(CLK_DOUT_TPU_TPUCTL, "dout_cmu_tpu_tpuctl", "gout_cmu_tpu_t=
puctl",
> > +           CLK_CON_DIV_CLKCMU_TPU_TPUCTL, 0, 4),
> > +
> > +       DIV(CLK_DOUT_TPU_BUS, "dout_cmu_tpu_bus", "gout_cmu_tpu_bus",
> > +           CLK_CON_DIV_CLKCMU_TPU_BUS, 0, 4),
> > +
> > +       DIV(CLK_DOUT_TPU_UART, "dout_cmu_tpu_uart", "gout_cmu_tpu_uart"=
,
> > +           CLK_CON_DIV_CLKCMU_TPU_UART, 0, 4),
> > +
> > +       /* BO */
> > +       DIV(CLK_DOUT_BO_BUS, "dout_cmu_bo_bus", "gout_cmu_bo_bus",
> > +           CLK_CON_DIV_CLKCMU_BO_BUS, 0, 4),
> > +
>
> Empty line here is unnecessary.

will fix
>
> > +};
> > +
> > +static const struct samsung_gate_clock cmu_top_gate_clks[] __initconst=
 =3D {
> > +       /* BUS0 */
> > +       GATE(CLK_GOUT_BUS0_BUS, "gout_cmu_bus0_bus", "mout_cmu_bus0_bus=
",
> > +            CLK_CON_GAT_GATE_CLKCMU_BUS0_BUS, 21, 0, 0),
> > +
> > +       /* BUS1 */
> > +       GATE(CLK_GOUT_BUS1_BUS, "gout_cmu_bus1_bus", "mout_cmu_bus1_bus=
",
> > +            CLK_CON_GAT_GATE_CLKCMU_BUS1_BUS, 21, 0, 0),
> > +
> > +       /* BUS2 */
> > +       GATE(CLK_GOUT_BUS2_BUS, "gout_cmu_bus2_bus", "mout_cmu_bus2_bus=
",
> > +            CLK_CON_GAT_GATE_CLKCMU_BUS2_BUS, 21, 0, 0),
> > +
> > +       /* CORE */
> > +       GATE(CLK_GOUT_CORE_BUS, "gout_cmu_core_bus", "mout_cmu_core_bus=
",
> > +            CLK_CON_GAT_GATE_CLKCMU_CORE_BUS, 21, 0, 0),
> > +
> > +       /* EH */
> > +       GATE(CLK_GOUT_EH_BUS, "gout_cmu_eh_bus", "mout_cmu_eh_bus",
> > +            CLK_CON_GAT_GATE_CLKCMU_EH_BUS, 21, 0, 0),
> > +
> > +       /* CPUCL{0,1,2,} */
> > +       GATE(CLK_GOUT_CPUCL2_SWITCH, "gout_cmu_cpucl2_switch", "mout_cm=
u_cpucl2_switch",
> > +            CLK_CON_GAT_GATE_CLKCMU_CPUCL2_SWITCH, 21, 0, 0),
> > +
> > +       GATE(CLK_GOUT_CPUCL1_SWITCH, "gout_cmu_cpucl1_switch", "mout_cm=
u_cpucl1_switch",
> > +            CLK_CON_GAT_GATE_CLKCMU_CPUCL1_SWITCH, 21, 0, 0),
> > +
> > +       GATE(CLK_GOUT_CPUCL0_SWITCH, "gout_cmu_cpucl0_switch", "mout_cm=
u_cpucl0_switch",
> > +            CLK_CON_GAT_GATE_CLKCMU_CPUCL0_SWITCH, 21, 0, 0),
> > +
> > +       GATE(CLK_GOUT_CPUCL0_DBG, "gout_cmu_cpucl0_dbg", "mout_cmu_cpuc=
l0_dbg",
> > +            CLK_CON_GAT_GATE_CLKCMU_CPUCL0_DBG_BUS, 21, 0, 0),
> > +
> > +       GATE(CLK_GOUT_CMU_HPM, "gout_cmu_hpm", "mout_cmu_hpm",
> > +            CLK_CON_GAT_GATE_CLKCMU_HPM, 21, 0, 0),
> > +
> > +       /* G3D */
> > +       GATE(CLK_GOUT_G3D_SWITCH, "gout_cmu_g3d_switch", "mout_cmu_g3d_=
switch",
> > +            CLK_CON_GAT_GATE_CLKCMU_G3D_SWITCH, 21, 0, 0),
> > +
> > +       GATE(CLK_GOUT_G3D_SWITCH, "gout_cmu_g3d_busd", "mout_cmu_g3d_bu=
sd",
> > +            CLK_CON_GAT_GATE_CLKCMU_G3D_BUSD, 21, 0, 0),
> > +
> > +       GATE(CLK_GOUT_G3D_GLB, "gout_cmu_g3d_glb", "mout_cmu_g3d_glb",
> > +            CLK_CON_GAT_GATE_CLKCMU_G3D_GLB, 21, 0, 0),
> > +       /* DPU */
> > +       GATE(CLK_GOUT_DPU_BUS, "gout_cmu_dpu_bus", "mout_cmu_dpu_bus",
> > +            CLK_CON_GAT_GATE_CLKCMU_DPU_BUS, 21, 0, 0),
> > +       /* DISP */
> > +       GATE(CLK_GOUT_DISP_BUS, "gout_cmu_disp_bus", "mout_cmu_disp_bus=
",
> > +            CLK_CON_GAT_GATE_CLKCMU_DISP_BUS, 21, 0, 0),
> > +
> > +       /* G2D */
> > +       GATE(CLK_GOUT_G2D_G2D, "gout_cmu_g2d_g2d", "mout_cmu_g2d_g2d",
> > +            CLK_CON_GAT_GATE_CLKCMU_G2D_G2D, 21, 0, 0),
> > +
> > +       GATE(CLK_GOUT_G2D_MSCL, "gout_cmu_g2d_mscl", "mout_cmu_g2d_mscl=
",
> > +            CLK_CON_GAT_GATE_CLKCMU_G2D_MSCL, 21, 0, 0),
> > +       /* HSI0 */
> > +       GATE(CLK_GOUT_HSI0_USB31DRD, "gout_cmu_hsi0_usb31drd", "mout_cm=
u_hsi0_usb31drd",
> > +            CLK_CON_GAT_GATE_CLKCMU_HSI0_USB31DRD, 21, 0, 0),
> > +
> > +       GATE(CLK_GOUT_HSI0_BUS, "gout_cmu_hsi0_bus", "mout_cmu_hsi0_bus=
",
> > +            CLK_CON_GAT_GATE_CLKCMU_HSI0_BUS, 21, 0, 0),
> > +
> > +       GATE(CLK_GOUT_HSI0_DPGTC, "gout_cmu_hsi0_dpgtc", "mout_cmu_hsi0=
_dpgtc",
> > +            CLK_CON_GAT_GATE_CLKCMU_HSI0_DPGTC, 21, 0, 0),
> > +
> > +       GATE(CLK_GOUT_HSI0_USBDPDGB, "gout_cmu_hsi0_usbdpdbg", "mout_cm=
u_hsi0_usbdpdbg",
> > +            CLK_CON_GAT_GATE_CLKCMU_HSI0_USBDPDBG, 21, 0, 0),
> > +       /* HSI1 */
> > +       GATE(CLK_GOUT_HSI1_BUS, "gout_cmu_hsi1_bus", "mout_cmu_hsi1_bus=
",
> > +            CLK_CON_GAT_GATE_CLKCMU_HSI1_BUS, 21, 0, 0),
> > +
> > +       GATE(CLK_GOUT_HSI1_PCIE, "gout_cmu_hsi1_pcie", "mout_cmu_hsi1_p=
cie",
> > +            CLK_CON_GAT_GATE_CLKCMU_HSI1_PCIE, 21, 0, 0),
> > +       /* HSI2 */
> > +       GATE(CLK_GOUT_HSI2_BUS, "gout_cmu_hsi2_bus", "mout_cmu_hsi2_bus=
",
> > +            CLK_CON_GAT_GATE_CLKCMU_HSI2_BUS, 21, 0, 0),
> > +       GATE(CLK_GOUT_HSI2_PCIE, "gout_cmu_hsi2_pcie", "mout_cmu_hsi2_p=
cie",
> > +            CLK_CON_GAT_GATE_CLKCMU_HSI2_PCIE, 21, 0, 0),
> > +
> > +       GATE(CLK_GOUT_HSI2_UFS_EMBD, "gout_cmu_hsi2_ufs_embd", "mout_cm=
u_hsi2_ufs_embd",
> > +            CLK_CON_GAT_GATE_CLKCMU_HSI2_UFS_EMBD, 21, 0, 0),
> > +       GATE(CLK_GOUT_HSI2_MMC_CARD, "gout_cmu_hsi2_mmc_card", "mout_cm=
u_hsi2_mmc_card",
> > +            CLK_CON_GAT_GATE_CLKCMU_HSI2_MMCCARD, 21, 0, 0),
> > +       /* CSIS */
> > +       GATE(CLK_GOUT_CSIS, "gout_cmu_csis_bus", "mout_cmu_csis_bus",
> > +            CLK_CON_GAT_GATE_CLKCMU_CSIS_BUS, 21, 0, 0),
> > +       /* PDP */
> > +       GATE(CLK_GOUT_PDP_BUS, "gout_cmu_pdp_bus", "mout_cmu_pdp_bus",
> > +            CLK_CON_GAT_GATE_CLKCMU_PDP_BUS, 21, 0, 0),
> > +
> > +       GATE(CLK_GOUT_PDP_VRA, "gout_cmu_pdp_vra", "mout_cmu_pdp_vra",
> > +            CLK_CON_GAT_GATE_CLKCMU_PDP_BUS, 21, 0, 0),
> > +
> > +       /* IPP */
> > +       GATE(CLK_GOUT_IPP_BUS, "gout_cmu_ipp_bus", "mout_cmu_ipp_bus",
> > +            CLK_CON_GAT_GATE_CLKCMU_IPP_BUS, 21, 0, 0),
> > +       /* G3AA */
> > +       GATE(CLK_GOUT_G3AA, "gout_cmu_g3aa", "mout_cmu_g3aa",
> > +            CLK_CON_MUX_MUX_CLKCMU_G3AA_G3AA, 21, 0, 0),
> > +
> > +       /* ITP */
> > +       GATE(CLK_GOUT_ITP, "gout_cmu_itp_bus", "mout_cmu_itp_bus",
> > +            CLK_CON_GAT_GATE_CLKCMU_ITP_BUS, 21, 0, 0),
> > +
> > +       /* DNS */
> > +       GATE(CLK_GOUT_DNS_BUS, "gout_cmu_dns_bus", "mout_cmu_dns_bus",
> > +            CLK_CON_GAT_GATE_CLKCMU_DNS_BUS, 21, 0, 0),
> > +
> > +       /* TNR */
> > +       GATE(CLK_GOUT_TNR_BUS, "gout_cmu_tnr_bus", "mout_cmu_tnr_bus",
> > +            CLK_CON_GAT_GATE_CLKCMU_TNR_BUS, 21, 0, 0),
> > +
> > +       /* MCSC*/
> > +       GATE(CLK_GOUT_MCSC_ITSC, "gout_cmu_mcsc_itsc", "mout_cmu_mcsc_i=
tsc",
> > +            CLK_CON_GAT_GATE_CLKCMU_MCSC_ITSC, 21, 0, 0),
> > +
> > +       GATE(CLK_GOUT_MCSC_MCSC, "gout_cmu_mcsc_mcsc", "mout_cmu_mcsc_m=
csc",
> > +            CLK_CON_GAT_GATE_CLKCMU_MCSC_MCSC, 21, 0, 0),
> > +
> > +       /* GDC */
> > +       GATE(CLK_GOUT_GDC_SCSC, "gout_cmu_gdc_scsc", "mout_cmu_gdc_scsc=
",
> > +            CLK_CON_GAT_GATE_CLKCMU_GDC_SCSC, 21, 0, 0),
> > +
> > +       GATE(CLK_GOUT_GDC_GDC0, "gout_cmu_gdc_gdc0", "mout_cmu_gdc_gdc0=
",
> > +            CLK_CON_GAT_GATE_CLKCMU_GDC_GDC0, 21, 0, 0),
> > +
> > +       GATE(CLK_GOUT_GDC_GDC1, "gout_cmu_gdc_gdc1", "mout_cmu_gdc_gdc1=
",
> > +            CLK_CON_GAT_GATE_CLKCMU_GDC_GDC1, 21, 0, 0),
> > +
> > +       /* MFC */
> > +       GATE(CLK_GOUT_MFC_MFC, "gout_cmu_mfc_mfc", "mout_cmu_mfc_mfc",
> > +            CLK_CON_GAT_GATE_CLKCMU_MFC_MFC, 21, 0, 0),
> > +
> > +       /* DDRPHY0/1/2/3 */
> > +       GATE(CLK_GOUT_MIF_SWITCH, "gout_cmu_mif_switch", "mout_cmu_mif_=
switch",
> > +            CLK_CON_GAT_CLKCMU_MIF_SWITCH, 21, 0, 0),
> > +
> > +       /* MIF0/1/2/3 */
> > +       GATE(CLK_GOUT_MIF_BUS, "gout_cmu_mif_busp", "mout_cmu_mif_busp"=
,
> > +            CLK_CON_GAT_GATE_CLKCMU_MIF_BUSP, 21, 0, 0),
> > +
> > +       GATE(CLK_GOUT_CMU_BOOST, "gout_cmu_cmu_boost", "mout_cmu_boost"=
,
> > +            CLK_CON_GAT_GATE_CLKCMU_CMU_BOOST, 21, 0, 0),
> > +
> > +       /* MISC */
> > +       GATE(CLK_GOUT_MISC_BUS, "gout_cmu_misc_bus", "mout_cmu_misc_bus=
",
> > +            CLK_CON_GAT_GATE_CLKCMU_MISC_BUS, 21, 0, 0),
> > +       GATE(CLK_GOUT_MISC_SSS, "gout_cmu_misc_sss", "mout_cmu_misc_sss=
",
> > +            CLK_CON_GAT_GATE_CLKCMU_MISC_SSS, 21, 0, 0),
> > +
> > +       /* PERI0 */
> > +       GATE(CLK_GOUT_PERIC0_BUS, "gout_cmu_peric0_bus", "mout_cmu_peri=
c0_bus",
> > +            CLK_CON_GAT_GATE_CLKCMU_PERIC0_BUS, 21, 0, 0),
> > +       GATE(CLK_GOUT_PERIC0_IP, "gout_cmu_peric0_ip", "mout_cmu_peric0=
_ip",
> > +            CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP, 21, 0, 0),
> > +
> > +       /* PERI1 */
> > +       GATE(CLK_GOUT_PERIC1_BUS, "gout_cmu_peric1_bus", "mout_cmu_peri=
c1_bus",
> > +            CLK_CON_GAT_GATE_CLKCMU_PERIC1_BUS, 21, 0, 0),
> > +       GATE(CLK_GOUT_PERIC1_IP, "gout_cmu_peric1_ip", "mout_cmu_peric1=
_ip",
> > +            CLK_CON_GAT_GATE_CLKCMU_PERIC1_IP, 21, 0, 0),
> > +
> > +       /* TPU */
> > +       GATE(CLK_GOUT_TPU_TPU, "gout_cmu_tpu_tpu", "mout_cmu_tpu_tpu",
> > +            CLK_CON_GAT_GATE_CLKCMU_TPU_TPU, 21, 0, 0),
> > +       GATE(CLK_GOUT_TPU_TPUCTL, "gout_cmu_tpu_tpuctl", "mout_cmu_tpu_=
tpuctl",
> > +            CLK_CON_GAT_GATE_CLKCMU_TPU_TPUCTL, 21, 0, 0),
> > +       GATE(CLK_GOUT_TPU_BUS, "gout_cmu_tpu_bus", "mout_cmu_tpu_bus",
> > +            CLK_CON_GAT_GATE_CLKCMU_TPU_BUS, 21, 0, 0),
> > +       GATE(CLK_GOUT_TPU_UART, "gout_cmu_tpu_uart", "mout_cmu_tpu_uart=
",
> > +            CLK_CON_GAT_GATE_CLKCMU_TPU_UART, 21, 0, 0),
> > +
> > +       /* BO */
> > +       GATE(CLK_GOUT_BO_BUS, "gout_cmu_bo_bus", "mout_cmu_bo_bus",
> > +            CLK_CON_GAT_GATE_CLKCMU_BO_BUS, 21, 0, 0),
> > +
>
> Empty line here is unnecessary.

will fix

regards,

Peter
