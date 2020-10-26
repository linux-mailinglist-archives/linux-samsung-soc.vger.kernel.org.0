Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA2E829969E
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 26 Oct 2020 20:14:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1792750AbgJZTOk (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 26 Oct 2020 15:14:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:53190 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1792747AbgJZTOj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 15:14:39 -0400
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 49B2821655;
        Mon, 26 Oct 2020 19:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603739678;
        bh=74Unn6Ai9ZIXJEMD55nBhYBrnwY/aYsnnkENlc+iGok=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=P95QjQ7AGk9eYGu+utKeicidMNg6U08y3LTYknd4MZWHpy03BwxCah4R5BbYXOuNN
         l5QaI2+H5qD/jPf+XFN9BN6LtgrPWhvfLsMUty0yPoT84y27Tku3d0QCf9SAhsxAnH
         D46o6MUS6mb01Gm4DcxlbmJ3pxspCn0Wt+4JNqM8=
Received: by mail-ot1-f47.google.com with SMTP id e20so8988797otj.11;
        Mon, 26 Oct 2020 12:14:38 -0700 (PDT)
X-Gm-Message-State: AOAM530N3eLCOWvgUl5IxL2h1dlWtM6/w+1Ji3UxOw5E8mKlSLiogPcI
        pSBm5khykux4J9KODgWYX9jVx97X9JUhZSfbbg==
X-Google-Smtp-Source: ABdhPJzyn9o5sS10ig+KW1uxqEnWhDYwpCP3g/LZdknhA3lu8640Q2yOWV0IgYODGM5KZqUGRnv17E1PP2y7qW2301o=
X-Received: by 2002:a9d:7993:: with SMTP id h19mr14941631otm.129.1603739677284;
 Mon, 26 Oct 2020 12:14:37 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20201023075756eucas1p18765653e747842eef4b438aff32ef136@eucas1p1.samsung.com>
 <20201023075744.26200-1-m.szyprowski@samsung.com> <20201023075744.26200-6-m.szyprowski@samsung.com>
In-Reply-To: <20201023075744.26200-6-m.szyprowski@samsung.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 26 Oct 2020 14:14:25 -0500
X-Gmail-Original-Message-ID: <CAL_JsqK+kVOzLaYS6Xk9RoK8AOpVF+n5nNC1EBS-+UxR334d3g@mail.gmail.com>
Message-ID: <CAL_JsqK+kVOzLaYS6Xk9RoK8AOpVF+n5nNC1EBS-+UxR334d3g@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] pci: dwc: pci-exynos: rework the driver to support
 Exynos5433 variant
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        PCI <linux-pci@vger.kernel.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, Oct 23, 2020 at 2:58 AM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> From: Jaehoon Chung <jh80.chung@samsung.com>
>
> Exynos5440 SoC support has been dropped since commit 8c83315da1cf ("ARM:
> dts: exynos: Remove Exynos5440"). Rework this driver to support DWC PCIe
> variant found in the Exynos5433 SoCs.
>
> The main difference in Exynos5433 variant is lack of the MSI support
> (the MSI interrupt is not even routed to the CPU).
>
> Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
> [mszyprow: reworked the driver to support only Exynos5433 variant,
>            simplified code, rebased onto current kernel code, added
>            regulator support, converted to the regular platform driver,
>            removed MSI related code, rewrote commit message]
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/pci/controller/dwc/Kconfig      |   3 +-
>  drivers/pci/controller/dwc/pci-exynos.c | 358 ++++++++++--------------
>  drivers/pci/quirks.c                    |   1 +
>  3 files changed, 145 insertions(+), 217 deletions(-)
>
> diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
> index bc049865f8e0..ade07abd23c9 100644
> --- a/drivers/pci/controller/dwc/Kconfig
> +++ b/drivers/pci/controller/dwc/Kconfig
> @@ -84,8 +84,7 @@ config PCIE_DW_PLAT_EP
>
>  config PCI_EXYNOS
>         bool "Samsung Exynos PCIe controller"
> -       depends on SOC_EXYNOS5440 || COMPILE_TEST
> -       depends on PCI_MSI_IRQ_DOMAIN
> +       depends on ARCH_EXYNOS || COMPILE_TEST
>         select PCIE_DW_HOST
>
>  config PCI_IMX6
> diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
> index 242683cde04a..58056fbdc2fa 100644
> --- a/drivers/pci/controller/dwc/pci-exynos.c
> +++ b/drivers/pci/controller/dwc/pci-exynos.c
> @@ -2,26 +2,23 @@
>  /*
>   * PCIe host controller driver for Samsung Exynos SoCs
>   *
> - * Copyright (C) 2013 Samsung Electronics Co., Ltd.
> + * Copyright (C) 2013-2020 Samsung Electronics Co., Ltd.
>   *             https://www.samsung.com
>   *
>   * Author: Jingoo Han <jg1.han@samsung.com>
> + *        Jaehoon Chung <jh80.chung@samsung.com>
>   */
>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> -#include <linux/gpio.h>
>  #include <linux/interrupt.h>
>  #include <linux/kernel.h>
>  #include <linux/init.h>
>  #include <linux/of_device.h>
> -#include <linux/of_gpio.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
>  #include <linux/phy/phy.h>
> -#include <linux/resource.h>
> -#include <linux/signal.h>
> -#include <linux/types.h>
> +#include <linux/regulator/consumer.h>
>
>  #include "pcie-designware.h"
>
> @@ -37,102 +34,47 @@
>  #define PCIE_IRQ_SPECIAL               0x008
>  #define PCIE_IRQ_EN_PULSE              0x00c
>  #define PCIE_IRQ_EN_LEVEL              0x010
> -#define IRQ_MSI_ENABLE                 BIT(2)
>  #define PCIE_IRQ_EN_SPECIAL            0x014
> -#define PCIE_PWR_RESET                 0x018
> +#define PCIE_SW_WAKE                   0x018
> +#define PCIE_BUS_EN                    BIT(1)
>  #define PCIE_CORE_RESET                        0x01c
>  #define PCIE_CORE_RESET_ENABLE         BIT(0)
>  #define PCIE_STICKY_RESET              0x020
>  #define PCIE_NONSTICKY_RESET           0x024
>  #define PCIE_APP_INIT_RESET            0x028
>  #define PCIE_APP_LTSSM_ENABLE          0x02c
> -#define PCIE_ELBI_RDLH_LINKUP          0x064
> +#define PCIE_ELBI_RDLH_LINKUP          0x074
> +#define PCIE_ELBI_XMLH_LINKUP          BIT(4)
>  #define PCIE_ELBI_LTSSM_ENABLE         0x1
>  #define PCIE_ELBI_SLV_AWMISC           0x11c
>  #define PCIE_ELBI_SLV_ARMISC           0x120
>  #define PCIE_ELBI_SLV_DBI_ENABLE       BIT(21)
>
> -struct exynos_pcie_mem_res {
> -       void __iomem *elbi_base;   /* DT 0th resource: PCIe CTRL */
> -};
> -
> -struct exynos_pcie_clk_res {
> -       struct clk *clk;
> -       struct clk *bus_clk;
> -};
> +/* DBI register */
> +#define PCIE_MISC_CONTROL_1_OFF                0x8BC
> +#define DBI_RO_WR_EN                   BIT(0)

Standard DWC port logic register. The core already handles this
mostly. And provides a function to it where it doesn't. Looking at
your use, I think you can drop the access.

>  struct exynos_pcie {
> -       struct dw_pcie                  *pci;
> -       struct exynos_pcie_mem_res      *mem_res;
> -       struct exynos_pcie_clk_res      *clk_res;
> -       const struct exynos_pcie_ops    *ops;
> -       int                             reset_gpio;
> -
> +       struct dw_pcie                  pci;
> +       void __iomem                    *elbi_base;
> +       struct clk                      *clk;
> +       struct clk                      *bus_clk;
>         struct phy                      *phy;
> +       struct regulator_bulk_data      supplies[2];
>  };
>
> -struct exynos_pcie_ops {
> -       int (*get_mem_resources)(struct platform_device *pdev,
> -                       struct exynos_pcie *ep);
> -       int (*get_clk_resources)(struct exynos_pcie *ep);
> -       int (*init_clk_resources)(struct exynos_pcie *ep);
> -       void (*deinit_clk_resources)(struct exynos_pcie *ep);
> -};
> -
> -static int exynos5440_pcie_get_mem_resources(struct platform_device *pdev,
> -                                            struct exynos_pcie *ep)
> -{
> -       struct dw_pcie *pci = ep->pci;
> -       struct device *dev = pci->dev;
> -
> -       ep->mem_res = devm_kzalloc(dev, sizeof(*ep->mem_res), GFP_KERNEL);
> -       if (!ep->mem_res)
> -               return -ENOMEM;
> -
> -       ep->mem_res->elbi_base = devm_platform_ioremap_resource(pdev, 0);
> -       if (IS_ERR(ep->mem_res->elbi_base))
> -               return PTR_ERR(ep->mem_res->elbi_base);
> -
> -       return 0;
> -}
> -
> -static int exynos5440_pcie_get_clk_resources(struct exynos_pcie *ep)
> -{
> -       struct dw_pcie *pci = ep->pci;
> -       struct device *dev = pci->dev;
> -
> -       ep->clk_res = devm_kzalloc(dev, sizeof(*ep->clk_res), GFP_KERNEL);
> -       if (!ep->clk_res)
> -               return -ENOMEM;
> -
> -       ep->clk_res->clk = devm_clk_get(dev, "pcie");
> -       if (IS_ERR(ep->clk_res->clk)) {
> -               dev_err(dev, "Failed to get pcie rc clock\n");
> -               return PTR_ERR(ep->clk_res->clk);
> -       }
> -
> -       ep->clk_res->bus_clk = devm_clk_get(dev, "pcie_bus");
> -       if (IS_ERR(ep->clk_res->bus_clk)) {
> -               dev_err(dev, "Failed to get pcie bus clock\n");
> -               return PTR_ERR(ep->clk_res->bus_clk);
> -       }
> -
> -       return 0;
> -}
> -
> -static int exynos5440_pcie_init_clk_resources(struct exynos_pcie *ep)
> +static int exynos_pcie_init_clk_resources(struct exynos_pcie *ep)
>  {
> -       struct dw_pcie *pci = ep->pci;
> -       struct device *dev = pci->dev;
> +       struct device *dev = ep->pci.dev;
>         int ret;
>
> -       ret = clk_prepare_enable(ep->clk_res->clk);
> +       ret = clk_prepare_enable(ep->clk);
>         if (ret) {
>                 dev_err(dev, "cannot enable pcie rc clock");
>                 return ret;
>         }
>
> -       ret = clk_prepare_enable(ep->clk_res->bus_clk);
> +       ret = clk_prepare_enable(ep->bus_clk);
>         if (ret) {
>                 dev_err(dev, "cannot enable pcie bus clock");
>                 goto err_bus_clk;
> @@ -141,24 +83,17 @@ static int exynos5440_pcie_init_clk_resources(struct exynos_pcie *ep)
>         return 0;
>
>  err_bus_clk:
> -       clk_disable_unprepare(ep->clk_res->clk);
> +       clk_disable_unprepare(ep->clk);
>
>         return ret;
>  }
>
> -static void exynos5440_pcie_deinit_clk_resources(struct exynos_pcie *ep)
> +static void exynos_pcie_deinit_clk_resources(struct exynos_pcie *ep)
>  {
> -       clk_disable_unprepare(ep->clk_res->bus_clk);
> -       clk_disable_unprepare(ep->clk_res->clk);
> +       clk_disable_unprepare(ep->bus_clk);
> +       clk_disable_unprepare(ep->clk);
>  }
>
> -static const struct exynos_pcie_ops exynos5440_pcie_ops = {
> -       .get_mem_resources      = exynos5440_pcie_get_mem_resources,
> -       .get_clk_resources      = exynos5440_pcie_get_clk_resources,
> -       .init_clk_resources     = exynos5440_pcie_init_clk_resources,
> -       .deinit_clk_resources   = exynos5440_pcie_deinit_clk_resources,
> -};
> -
>  static void exynos_pcie_writel(void __iomem *base, u32 val, u32 reg)
>  {
>         writel(val, base + reg);
> @@ -173,67 +108,57 @@ static void exynos_pcie_sideband_dbi_w_mode(struct exynos_pcie *ep, bool on)
>  {
>         u32 val;
>
> -       val = exynos_pcie_readl(ep->mem_res->elbi_base, PCIE_ELBI_SLV_AWMISC);
> +       val = exynos_pcie_readl(ep->elbi_base, PCIE_ELBI_SLV_AWMISC);
>         if (on)
>                 val |= PCIE_ELBI_SLV_DBI_ENABLE;
>         else
>                 val &= ~PCIE_ELBI_SLV_DBI_ENABLE;
> -       exynos_pcie_writel(ep->mem_res->elbi_base, val, PCIE_ELBI_SLV_AWMISC);
> +       exynos_pcie_writel(ep->elbi_base, val, PCIE_ELBI_SLV_AWMISC);
>  }
>
>  static void exynos_pcie_sideband_dbi_r_mode(struct exynos_pcie *ep, bool on)
>  {
>         u32 val;
>
> -       val = exynos_pcie_readl(ep->mem_res->elbi_base, PCIE_ELBI_SLV_ARMISC);
> +       val = exynos_pcie_readl(ep->elbi_base, PCIE_ELBI_SLV_ARMISC);
>         if (on)
>                 val |= PCIE_ELBI_SLV_DBI_ENABLE;
>         else
>                 val &= ~PCIE_ELBI_SLV_DBI_ENABLE;
> -       exynos_pcie_writel(ep->mem_res->elbi_base, val, PCIE_ELBI_SLV_ARMISC);
> +       exynos_pcie_writel(ep->elbi_base, val, PCIE_ELBI_SLV_ARMISC);
>  }
>
>  static void exynos_pcie_assert_core_reset(struct exynos_pcie *ep)
>  {
>         u32 val;
>
> -       val = exynos_pcie_readl(ep->mem_res->elbi_base, PCIE_CORE_RESET);
> +       val = exynos_pcie_readl(ep->elbi_base, PCIE_CORE_RESET);
>         val &= ~PCIE_CORE_RESET_ENABLE;
> -       exynos_pcie_writel(ep->mem_res->elbi_base, val, PCIE_CORE_RESET);
> -       exynos_pcie_writel(ep->mem_res->elbi_base, 0, PCIE_PWR_RESET);
> -       exynos_pcie_writel(ep->mem_res->elbi_base, 0, PCIE_STICKY_RESET);
> -       exynos_pcie_writel(ep->mem_res->elbi_base, 0, PCIE_NONSTICKY_RESET);
> +       exynos_pcie_writel(ep->elbi_base, val, PCIE_CORE_RESET);
> +       exynos_pcie_writel(ep->elbi_base, 0, PCIE_STICKY_RESET);
> +       exynos_pcie_writel(ep->elbi_base, 0, PCIE_NONSTICKY_RESET);
>  }
>
>  static void exynos_pcie_deassert_core_reset(struct exynos_pcie *ep)
>  {
>         u32 val;
>
> -       val = exynos_pcie_readl(ep->mem_res->elbi_base, PCIE_CORE_RESET);
> +       val = exynos_pcie_readl(ep->elbi_base, PCIE_CORE_RESET);
>         val |= PCIE_CORE_RESET_ENABLE;
>
> -       exynos_pcie_writel(ep->mem_res->elbi_base, val, PCIE_CORE_RESET);
> -       exynos_pcie_writel(ep->mem_res->elbi_base, 1, PCIE_STICKY_RESET);
> -       exynos_pcie_writel(ep->mem_res->elbi_base, 1, PCIE_NONSTICKY_RESET);
> -       exynos_pcie_writel(ep->mem_res->elbi_base, 1, PCIE_APP_INIT_RESET);
> -       exynos_pcie_writel(ep->mem_res->elbi_base, 0, PCIE_APP_INIT_RESET);
> -}
> -
> -static void exynos_pcie_assert_reset(struct exynos_pcie *ep)
> -{
> -       struct dw_pcie *pci = ep->pci;
> -       struct device *dev = pci->dev;
> -
> -       if (ep->reset_gpio >= 0)
> -               devm_gpio_request_one(dev, ep->reset_gpio,
> -                               GPIOF_OUT_INIT_HIGH, "RESET");
> +       exynos_pcie_writel(ep->elbi_base, val, PCIE_CORE_RESET);
> +       exynos_pcie_writel(ep->elbi_base, 1, PCIE_STICKY_RESET);
> +       exynos_pcie_writel(ep->elbi_base, 1, PCIE_NONSTICKY_RESET);
> +       exynos_pcie_writel(ep->elbi_base, 1, PCIE_APP_INIT_RESET);
> +       exynos_pcie_writel(ep->elbi_base, 0, PCIE_APP_INIT_RESET);
>  }
>
>  static int exynos_pcie_establish_link(struct exynos_pcie *ep)
>  {
> -       struct dw_pcie *pci = ep->pci;
> +       struct dw_pcie *pci = &ep->pci;
>         struct pcie_port *pp = &pci->pp;
>         struct device *dev = pci->dev;
> +       u32 val;
>
>         if (dw_pcie_link_up(pci)) {
>                 dev_err(dev, "Link already up\n");
> @@ -243,19 +168,25 @@ static int exynos_pcie_establish_link(struct exynos_pcie *ep)
>         exynos_pcie_assert_core_reset(ep);
>
>         phy_reset(ep->phy);
> -
> -       exynos_pcie_writel(ep->mem_res->elbi_base, 1,
> -                       PCIE_PWR_RESET);
> -
>         phy_power_on(ep->phy);
>         phy_init(ep->phy);
>
>         exynos_pcie_deassert_core_reset(ep);
> +
> +       val = exynos_pcie_readl(ep->elbi_base, PCIE_SW_WAKE);
> +       val &= ~PCIE_BUS_EN;
> +       exynos_pcie_writel(ep->elbi_base, val, PCIE_SW_WAKE);
> +
> +       /*
> +        * Enable DBI_RO_WR_EN bit.
> +        * - When set to 1, some RO and HWinit bits are wriatble from
> +        *   the local application through the DBI.
> +        */
> +       dw_pcie_writel_dbi(pci, PCIE_MISC_CONTROL_1_OFF, DBI_RO_WR_EN);
>         dw_pcie_setup_rc(pp);

First thing this function does is set DBI_RO_WR_EN.

> -       exynos_pcie_assert_reset(ep);
>
>         /* assert LTSSM enable */
> -       exynos_pcie_writel(ep->mem_res->elbi_base, PCIE_ELBI_LTSSM_ENABLE,
> +       exynos_pcie_writel(ep->elbi_base, PCIE_ELBI_LTSSM_ENABLE,
>                           PCIE_APP_LTSSM_ENABLE);
>
>         /* check if the link is up or not */
> @@ -270,18 +201,8 @@ static void exynos_pcie_clear_irq_pulse(struct exynos_pcie *ep)
>  {
>         u32 val;
>
> -       val = exynos_pcie_readl(ep->mem_res->elbi_base, PCIE_IRQ_PULSE);
> -       exynos_pcie_writel(ep->mem_res->elbi_base, val, PCIE_IRQ_PULSE);
> -}
> -
> -static void exynos_pcie_enable_irq_pulse(struct exynos_pcie *ep)
> -{
> -       u32 val;
> -
> -       /* enable INTX interrupt */
> -       val = IRQ_INTA_ASSERT | IRQ_INTB_ASSERT |
> -               IRQ_INTC_ASSERT | IRQ_INTD_ASSERT;
> -       exynos_pcie_writel(ep->mem_res->elbi_base, val, PCIE_IRQ_EN_PULSE);
> +       val = exynos_pcie_readl(ep->elbi_base, PCIE_IRQ_PULSE);
> +       exynos_pcie_writel(ep->elbi_base, val, PCIE_IRQ_PULSE);
>  }
>
>  static irqreturn_t exynos_pcie_irq_handler(int irq, void *arg)
> @@ -292,26 +213,14 @@ static irqreturn_t exynos_pcie_irq_handler(int irq, void *arg)
>         return IRQ_HANDLED;
>  }
>
> -static void exynos_pcie_msi_init(struct exynos_pcie *ep)
> -{
> -       struct dw_pcie *pci = ep->pci;
> -       struct pcie_port *pp = &pci->pp;
> -       u32 val;
> -
> -       dw_pcie_msi_init(pp);
> -
> -       /* enable MSI interrupt */
> -       val = exynos_pcie_readl(ep->mem_res->elbi_base, PCIE_IRQ_EN_LEVEL);
> -       val |= IRQ_MSI_ENABLE;
> -       exynos_pcie_writel(ep->mem_res->elbi_base, val, PCIE_IRQ_EN_LEVEL);
> -}
> -
> -static void exynos_pcie_enable_interrupts(struct exynos_pcie *ep)
> +static void exynos_pcie_enable_irq_pulse(struct exynos_pcie *ep)
>  {
> -       exynos_pcie_enable_irq_pulse(ep);
> +       u32 val = IRQ_INTA_ASSERT | IRQ_INTB_ASSERT |
> +                 IRQ_INTC_ASSERT | IRQ_INTD_ASSERT;
>
> -       if (IS_ENABLED(CONFIG_PCI_MSI))
> -               exynos_pcie_msi_init(ep);
> +       exynos_pcie_writel(ep->elbi_base, val, PCIE_IRQ_EN_PULSE);
> +       exynos_pcie_writel(ep->elbi_base, 0, PCIE_IRQ_EN_LEVEL);
> +       exynos_pcie_writel(ep->elbi_base, 0, PCIE_IRQ_EN_SPECIAL);
>  }
>
>  static u32 exynos_pcie_read_dbi(struct dw_pcie *pci, void __iomem *base,
> @@ -372,11 +281,8 @@ static int exynos_pcie_link_up(struct dw_pcie *pci)
>         struct exynos_pcie *ep = to_exynos_pcie(pci);
>         u32 val;
>
> -       val = exynos_pcie_readl(ep->mem_res->elbi_base, PCIE_ELBI_RDLH_LINKUP);
> -       if (val == PCIE_ELBI_LTSSM_ENABLE)
> -               return 1;
> -
> -       return 0;
> +       val = exynos_pcie_readl(ep->elbi_base, PCIE_ELBI_RDLH_LINKUP);
> +       return (val & PCIE_ELBI_XMLH_LINKUP);
>  }
>
>  static int exynos_pcie_host_init(struct pcie_port *pp)
> @@ -386,10 +292,8 @@ static int exynos_pcie_host_init(struct pcie_port *pp)
>
>         pp->bridge->ops = &exynos_pci_ops;
>
> -       exynos_pcie_establish_link(ep);
> -       exynos_pcie_enable_interrupts(ep);
> -
> -       return 0;
> +       exynos_pcie_enable_irq_pulse(ep);
> +       return exynos_pcie_establish_link(ep);
>  }
>
>  static const struct dw_pcie_host_ops exynos_pcie_host_ops = {
> @@ -399,28 +303,22 @@ static const struct dw_pcie_host_ops exynos_pcie_host_ops = {
>  static int __init exynos_add_pcie_port(struct exynos_pcie *ep,
>                                        struct platform_device *pdev)
>  {
> -       struct dw_pcie *pci = ep->pci;
> +       struct dw_pcie *pci = &ep->pci;
>         struct pcie_port *pp = &pci->pp;
>         struct device *dev = &pdev->dev;
>         int ret;
>
> -       pp->irq = platform_get_irq(pdev, 1);
> +       pp->irq = platform_get_irq(pdev, 0);
>         if (pp->irq < 0)
>                 return pp->irq;
>
>         ret = devm_request_irq(dev, pp->irq, exynos_pcie_irq_handler,
> -                               IRQF_SHARED, "exynos-pcie", ep);
> +                              IRQF_SHARED, "exynos-pcie", ep);
>         if (ret) {
>                 dev_err(dev, "failed to request irq\n");
>                 return ret;
>         }
>
> -       if (IS_ENABLED(CONFIG_PCI_MSI)) {
> -               pp->msi_irq = platform_get_irq(pdev, 0);
> -               if (pp->msi_irq < 0)
> -                       return pp->msi_irq;
> -       }
> -
>         pp->ops = &exynos_pcie_host_ops;
>
>         ret = dw_pcie_host_init(pp);
> @@ -438,10 +336,9 @@ static const struct dw_pcie_ops dw_pcie_ops = {
>         .link_up = exynos_pcie_link_up,
>  };
>
> -static int __init exynos_pcie_probe(struct platform_device *pdev)
> +static int exynos_pcie_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
> -       struct dw_pcie *pci;
>         struct exynos_pcie *ep;
>         struct device_node *np = dev->of_node;
>         int ret;
> @@ -450,42 +347,49 @@ static int __init exynos_pcie_probe(struct platform_device *pdev)
>         if (!ep)
>                 return -ENOMEM;
>
> -       pci = devm_kzalloc(dev, sizeof(*pci), GFP_KERNEL);
> -       if (!pci)
> -               return -ENOMEM;
> -
> -       pci->dev = dev;
> -       pci->ops = &dw_pcie_ops;
> +       ep->pci.dev = dev;
> +       ep->pci.ops = &dw_pcie_ops;
>
> -       ep->pci = pci;
> -       ep->ops = (const struct exynos_pcie_ops *)
> -               of_device_get_match_data(dev);
> +       ep->phy = devm_of_phy_get(dev, np, NULL);
> +       if (IS_ERR(ep->phy))
> +               return PTR_ERR(ep->phy);
>
> -       ep->reset_gpio = of_get_named_gpio(np, "reset-gpio", 0);
> +       /* External Local Bus interface (ELBI) registers */
> +       ep->elbi_base = devm_platform_ioremap_resource_byname(pdev, "elbi");
> +       if (IS_ERR(ep->elbi_base))
> +               return PTR_ERR(ep->elbi_base);
>
> -       ep->phy = devm_of_phy_get(dev, np, NULL);
> -       if (IS_ERR(ep->phy)) {
> -               if (PTR_ERR(ep->phy) != -ENODEV)
> -                       return PTR_ERR(ep->phy);
> +       /* Data Bus Interface (DBI) registers */
> +       ep->pci.dbi_base = devm_platform_ioremap_resource_byname(pdev, "dbi");
> +       if (IS_ERR(ep->pci.dbi_base))
> +               return PTR_ERR(ep->pci.dbi_base);

This is going to get moved to the DWC core code.


>
> -               ep->phy = NULL;
> +       ep->clk = devm_clk_get(dev, "pcie");
> +       if (IS_ERR(ep->clk)) {
> +               dev_err(dev, "Failed to get pcie rc clock\n");
> +               return PTR_ERR(ep->clk);
>         }
>
> -       if (ep->ops && ep->ops->get_mem_resources) {
> -               ret = ep->ops->get_mem_resources(pdev, ep);
> -               if (ret)
> -                       return ret;
> +       ep->bus_clk = devm_clk_get(dev, "pcie_bus");
> +       if (IS_ERR(ep->bus_clk)) {
> +               dev_err(dev, "Failed to get pcie bus clock\n");
> +               return PTR_ERR(ep->bus_clk);
>         }
>
> -       if (ep->ops && ep->ops->get_clk_resources &&
> -                       ep->ops->init_clk_resources) {
> -               ret = ep->ops->get_clk_resources(ep);
> -               if (ret)
> -                       return ret;
> -               ret = ep->ops->init_clk_resources(ep);
> -               if (ret)
> -                       return ret;
> -       }
> +       ep->supplies[0].supply = "vdd18";
> +       ep->supplies[1].supply = "vdd10";
> +       ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ep->supplies),
> +                                     ep->supplies);
> +       if (ret)
> +               return ret;
> +
> +       ret = exynos_pcie_init_clk_resources(ep);
> +       if (ret)
> +               return ret;
> +
> +       ret = regulator_bulk_enable(ARRAY_SIZE(ep->supplies), ep->supplies);
> +       if (ret)
> +               return ret;
>
>         platform_set_drvdata(pdev, ep);
>
> @@ -497,9 +401,9 @@ static int __init exynos_pcie_probe(struct platform_device *pdev)
>
>  fail_probe:
>         phy_exit(ep->phy);
> +       exynos_pcie_deinit_clk_resources(ep);
> +       regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
>
> -       if (ep->ops && ep->ops->deinit_clk_resources)
> -               ep->ops->deinit_clk_resources(ep);
>         return ret;
>  }
>
> @@ -507,32 +411,56 @@ static int __exit exynos_pcie_remove(struct platform_device *pdev)
>  {
>         struct exynos_pcie *ep = platform_get_drvdata(pdev);
>
> -       if (ep->ops && ep->ops->deinit_clk_resources)
> -               ep->ops->deinit_clk_resources(ep);
> +       phy_power_off(ep->phy);
> +       phy_exit(ep->phy);
> +       exynos_pcie_deinit_clk_resources(ep);
> +       regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
>
>         return 0;
>  }
>
> +static int __maybe_unused exynos_pcie_suspend_noirq(struct device *dev)
> +{

Why noirq variant needed? Lot's of PCI host drivers do this and I've
yet to get a reason...

Adding suspend/resume should probably be a separate patch. What I'd
like to do here is have common DWC suspend/resume functions that the
platform drivers can use or wrap.

> +       struct exynos_pcie *ep = dev_get_drvdata(dev);
> +
> +       phy_power_off(ep->phy);
> +       phy_exit(ep->phy);
> +       regulator_bulk_disable(ARRAY_SIZE(ep->supplies), ep->supplies);
> +
> +       return 0;
> +}
> +
> +static int __maybe_unused exynos_pcie_resume_noirq(struct device *dev)
> +{
> +       struct exynos_pcie *ep = dev_get_drvdata(dev);
> +       struct dw_pcie *pci = &ep->pci;
> +       struct pcie_port *pp = &pci->pp;
> +       int ret;
> +
> +       ret = regulator_bulk_enable(ARRAY_SIZE(ep->supplies), ep->supplies);
> +       if (ret)
> +               return ret;
> +       /* exynos_pcie_host_init controls ep->phy */
> +       return exynos_pcie_host_init(pp);
> +}
> +
> +static const struct dev_pm_ops exynos_pcie_pm_ops = {
> +       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(exynos_pcie_suspend_noirq,
> +                                     exynos_pcie_resume_noirq)
> +};
> +
>  static const struct of_device_id exynos_pcie_of_match[] = {
> -       {
> -               .compatible = "samsung,exynos5440-pcie",
> -               .data = &exynos5440_pcie_ops
> -       },
> -       {},
> +       { .compatible = "samsung,exynos5433-pcie", },
> +       { },
>  };
>
>  static struct platform_driver exynos_pcie_driver = {
> +       .probe          = exynos_pcie_probe,
>         .remove         = __exit_p(exynos_pcie_remove),
>         .driver = {
>                 .name   = "exynos-pcie",
>                 .of_match_table = exynos_pcie_of_match,
> +               .pm             = &exynos_pcie_pm_ops,
>         },
>  };
> -
> -/* Exynos PCIe driver does not allow module unload */
> -
> -static int __init exynos_pcie_init(void)
> -{
> -       return platform_driver_probe(&exynos_pcie_driver, exynos_pcie_probe);
> -}
> -subsys_initcall(exynos_pcie_init);

Good that this is gone, but...

> +builtin_platform_driver(exynos_pcie_driver);

I would like to make all the host drivers modules.

Rob
