Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2BDD5F4A93
	for <lists+linux-samsung-soc@lfdr.de>; Tue,  4 Oct 2022 23:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229547AbiJDVBK (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 4 Oct 2022 17:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbiJDVBH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 4 Oct 2022 17:01:07 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27551647CF
        for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Oct 2022 14:01:04 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a2so11363792ejx.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Oct 2022 14:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DUSpKZy1pIehtfifTeG1uHTVtYiF7pH1Vfn1Aaxrnr4=;
        b=hNjgHaSxgFJe9O9AUlLxrS/sfC59d3qbVJo+Gg3PRA5K2HxzLjucN0B4ipFWjeQEdA
         fvOTutycEfre/zBrCEuE+E0eDSn/R/yWMa+LaeP8yS+3oDHGuX2WJEf4wGNlVpsnwn6o
         Oe/TMi/0OBGaRSVU6xslBbZ6CFA5VBcNzISfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DUSpKZy1pIehtfifTeG1uHTVtYiF7pH1Vfn1Aaxrnr4=;
        b=DVVftk7+95e10q1wb4itmYQmEBWPp65KZKS7y9nz7oQ9OuP3+ZEtHeKmeEOPE7x5A1
         YP6qgEmSvS8+H4SGvL9MUPkQEMoawGXmbRK1oV/l40LZYfUDZ8NbPeZVECwKKUOHsYkp
         iGQcqZF6GfXNkWMA0ajtkOjkJrleYs1bHMlckTChEYco1i2tKIRK5QPH8PJyf5XVXvek
         X/WYd1CUdCCQSMpixh9en58vWX9FvbXU9HJgBEl6x4QyMhvQ+9ayfjp+M9mAG6bC/F5w
         uYJxuGNgS0Eb2tNq33250rj2JJeBo3EcGntbT/raPWMxlDKarhg3Fk25ZrwJiVjDEGPr
         +NQA==
X-Gm-Message-State: ACrzQf12Bz/58YaakyjI0fjBOmvnKvJz8feEdhoox3P9V7qs69RJzJIC
        BjNl32abTvi1diT62ZtF3gMXTSaAqC7YgvANV9RDxQ==
X-Google-Smtp-Source: AMsMyM6Y5Mld63PxpEcIWvAH+WQ6xssr5LIa95KQRRdxzoEFSUCTCMhfjQdmoI9vMRi4GKMgbmCtaz7zKDm0fkocOj0=
X-Received: by 2002:a17:907:9727:b0:78a:e09c:f2f9 with SMTP id
 jg39-20020a170907972700b0078ae09cf2f9mr10270865ejc.455.1664917262314; Tue, 04
 Oct 2022 14:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <20221001080650.1007043-1-jagan@amarulasolutions.com>
 <CGME20221001080738eucas1p2fb82ddef1ba52646cc8f2c2f85c936da@eucas1p2.samsung.com>
 <20221001080650.1007043-2-jagan@amarulasolutions.com> <88eb9060-7240-3907-5d78-c05274d082df@samsung.com>
In-Reply-To: <88eb9060-7240-3907-5d78-c05274d082df@samsung.com>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Wed, 5 Oct 2022 02:30:50 +0530
Message-ID: <CAMty3ZBwv+GWF_uMxHou2heSD82+oyXJH1P=z=PuqJ+2e00czg@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] drm: bridge: Add Samsung DSIM bridge driver
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, Oct 3, 2022 at 1:23 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Jagan,
>
> On 01.10.2022 10:06, Jagan Teki wrote:
> > Samsung MIPI DSIM controller is common DSI IP that can be used in various
> > SoCs like Exynos, i.MX8M Mini/Nano.
> >
> > In order to access this DSI controller between various platform SoCs,
> > the ideal way to incorporate this in the drm stack is via the drm bridge
> > driver.
> >
> > This patch is trying to differentiate platform-specific and bridge driver
> > code by maintaining exynos platform glue code in exynos_drm_dsi.c driver
> > and common bridge driver code in samsung-dsim.c providing that the new
> > platform-specific glue should be supported in the bridge driver, unlike
> > exynos platform drm drivers.
> >
> > - Add samsung_dsim_plat_data for keeping platform-specific attributes like
> >    host_ops, irq_ops, and hw_type.
> >
> > - Initialize the plat_data hooks for exynos platform in exynos_drm_dsi.c.
> >
> > - samsung_dsim_probe is the common probe call across exynos_drm_dsi.c and
> >    samsung-dsim.c.
> >
> > - plat_data hooks like host_ops and irq_ops are invoked during the
> >    respective bridge call chains.
> >
> > v6:
> > * handle previous bridge pointer for exynos dsi
>
> There are still issues, see my comments below.
>
> > v5:
> > * [mszyprow] reworked driver initialization using the same approach as in
> >    drivers/gpu/drm/{exynos/exynos_dp.c, bridge/analogix/analogix_dp_core.c},
> >    removed weak functions, moved exynos_dsi_driver back to exynos_drm_dsi.c
> >    and restored integration with exynos_drm custom initialization.
> > * updated the commit message [Jagan]
> >
> > v4:
> > * include Inki Dae in MAINTAINERS
> > * remove dsi_driver probe in exynos_drm_drv to support multi-arch build
> >
> > v3:
> > * restore gpio related fixes
> > * restore proper bridge chain
> > * rework initialization issue
> > * fix header includes in proper way
> >
> > v2:
> > * fixed exynos dsi driver conversion (Marek Szyprowski)
> > * updated commit message
> > * updated MAINTAINERS file

< snip>

> > +     /**
> > +      * FIXME:
> > +      * This has to remove once the bridge chain order is compatible
> > +      * with Exynos DSI drivers.
> > +      *
> > +      * DRM bridge chain ordering is not compatible with Exynos DSI
> > +      * drivers because DSI sink devices typically want the DSI host
> > +      * powered up and configured before they are powered up.
> > +      *
> > +      * Passing NULL to the previous bridge makes Exynos DSI drivers
> > +      * work which is exactly done before.
> > +      */
> > +     if (!(dsi->plat_data->hw_type & SAMSUNG_DSIM_TYPE_IMX8MM))
>
> The above should be 'if (!(dsi->plat_data->hw_type == SAMSUNG_DSIM_TYPE_IMX8MM))', hw_type is not a bitmask. Also SAMSUNG_DSIM_TYPE_IMX8MM is not yet defined in this patch, so this it breaks builds.

I thought I fixed it in previous versions. I will fix this in the next version.

>
> > +             previous = NULL;
> > +
> > +     return drm_bridge_attach(bridge->encoder, dsi->out_bridge, previous,
> > +                              flags);
> > +}
> > +
> > +static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
> > +     .atomic_duplicate_state         = drm_atomic_helper_bridge_duplicate_state,
> > +     .atomic_destroy_state           = drm_atomic_helper_bridge_destroy_state,
> > +     .atomic_reset                   = drm_atomic_helper_bridge_reset,
> > +     .atomic_pre_enable              = samsung_dsim_atomic_pre_enable,
> > +     .atomic_enable                  = samsung_dsim_atomic_enable,
> > +     .atomic_disable                 = samsung_dsim_atomic_disable,
> > +     .atomic_post_disable            = samsung_dsim_atomic_post_disable,
> > +     .mode_set                       = samsung_dsim_mode_set,
> > +     .attach                         = samsung_dsim_attach,
> > +};
> > +
> > +static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
> > +                                 struct mipi_dsi_device *device)
> > +{
> > +     struct samsung_dsim *dsi = host_to_dsi(host);
> > +     const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
> > +     struct device *dev = dsi->dev;
> > +     struct drm_panel *panel;
> > +     int ret;
> > +
> > +     panel = of_drm_find_panel(device->dev.of_node);
> > +     if (!IS_ERR(panel)) {
> > +             dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> > +     } else {
> > +             dsi->out_bridge = of_drm_find_bridge(device->dev.of_node);
> > +             if (!dsi->out_bridge)
> > +                     dsi->out_bridge = ERR_PTR(-EINVAL);
> > +     }
> > +
> > +     if (IS_ERR(dsi->out_bridge)) {
> > +             ret = PTR_ERR(dsi->out_bridge);
> > +             DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     DRM_DEV_INFO(dev, "Attached %s device\n", device->name);
> > +
> > +     drm_bridge_add(&dsi->bridge);
> > +
> > +     if (pdata->host_ops && pdata->host_ops->attach) {
> > +             ret = pdata->host_ops->attach(dsi, device);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +
> > +     dsi->lanes = device->lanes;
> > +     dsi->format = device->format;
> > +     dsi->mode_flags = device->mode_flags;
> > +
> > +     return 0;
> > +}
> > +
> > +static int samsung_dsim_host_detach(struct mipi_dsi_host *host,
> > +                                 struct mipi_dsi_device *device)
> > +{
> > +     struct samsung_dsim *dsi = host_to_dsi(host);
> > +     const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
> > +     int ret;
> > +
> > +     if (dsi->out_bridge->funcs->detach)
> > +             dsi->out_bridge->funcs->detach(dsi->out_bridge);
> > +
> > +     dsi->out_bridge = NULL;
> > +
> > +     if (pdata->host_ops && pdata->host_ops->detach) {
> > +             ret = pdata->host_ops->detach(dsi, device);
> > +             if (ret < 0)
> > +                     return ret;
> > +     }
> > +
> > +     drm_bridge_remove(&dsi->bridge);
> > +
> > +     return 0;
> > +}
> > +
> > +static ssize_t samsung_dsim_host_transfer(struct mipi_dsi_host *host,
> > +                                       const struct mipi_dsi_msg *msg)
> > +{
> > +     struct samsung_dsim *dsi = host_to_dsi(host);
> > +     struct samsung_dsim_transfer xfer;
> > +     int ret;
> > +
> > +     if (!(dsi->state & DSIM_STATE_ENABLED))
> > +             return -EINVAL;
> > +
> > +     if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
> > +             ret = samsung_dsim_init(dsi);
> > +             if (ret)
> > +                     return ret;
> > +             dsi->state |= DSIM_STATE_INITIALIZED;
> > +     }
> > +
> > +     ret = mipi_dsi_create_packet(&xfer.packet, msg);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     xfer.rx_len = msg->rx_len;
> > +     xfer.rx_payload = msg->rx_buf;
> > +     xfer.flags = msg->flags;
> > +
> > +     ret = samsung_dsim_transfer(dsi, &xfer);
> > +     return (ret < 0) ? ret : xfer.rx_done;
> > +}
> > +
> > +static const struct mipi_dsi_host_ops samsung_dsim_ops = {
> > +     .attach = samsung_dsim_host_attach,
> > +     .detach = samsung_dsim_host_detach,
> > +     .transfer = samsung_dsim_host_transfer,
> > +};
> > +
> > +static int samsung_dsim_of_read_u32(const struct device_node *np,
> > +                                 const char *propname, u32 *out_value)
> > +{
> > +     int ret = of_property_read_u32(np, propname, out_value);
> > +
> > +     if (ret < 0)
> > +             pr_err("%pOF: failed to get '%s' property\n", np, propname);
> > +
> > +     return ret;
> > +}
> > +
> > +static int samsung_dsim_parse_dt(struct samsung_dsim *dsi)
> > +{
> > +     struct device *dev = dsi->dev;
> > +     struct device_node *node = dev->of_node;
> > +     int ret;
> > +
> > +     ret = samsung_dsim_of_read_u32(node, "samsung,pll-clock-frequency",
> > +                                    &dsi->pll_clk_rate);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret = samsung_dsim_of_read_u32(node, "samsung,burst-clock-frequency",
> > +                                    &dsi->burst_clk_rate);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     ret = samsung_dsim_of_read_u32(node, "samsung,esc-clock-frequency",
> > +                                    &dsi->esc_clk_rate);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return 0;
> > +}
> > +
> > +static int samsung_dsim_register_host(struct samsung_dsim *dsi)
> > +{
> > +     return mipi_dsi_host_register(&dsi->dsi_host);
> > +}
> > +
> > +static void samsung_dsim_unregister_host(struct samsung_dsim *dsi)
> > +{
> > +     mipi_dsi_host_unregister(&dsi->dsi_host);
> > +}
> > +
> > +static const struct samsung_dsim_host_ops samsung_dsim_generic_host_ops = {
> > +     .register_host = samsung_dsim_register_host,
> > +     .unregister_host = samsung_dsim_unregister_host,
> > +};
> > +
> > +int samsung_dsim_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev = &pdev->dev;
> > +     struct samsung_dsim *dsi;
> > +     int ret, i;
> > +
> > +     dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> > +     if (!dsi)
> > +             return -ENOMEM;
> > +
> > +     init_completion(&dsi->completed);
> > +     spin_lock_init(&dsi->transfer_lock);
> > +     INIT_LIST_HEAD(&dsi->transfer_list);
> > +
> > +     dsi->dsi_host.ops = &samsung_dsim_ops;
> > +     dsi->dsi_host.dev = dev;
> > +
> > +     dsi->dev = dev;
> > +     dsi->plat_data = of_device_get_match_data(dev);
> > +     dsi->driver_data = samsung_dsim_types[dsi->plat_data->hw_type];
> > +
> > +     dsi->supplies[0].supply = "vddcore";
> > +     dsi->supplies[1].supply = "vddio";
> > +     ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(dsi->supplies),
> > +                                   dsi->supplies);
> > +     if (ret)
> > +             return dev_err_probe(dev, ret, "failed to get regulators\n");
> > +
> > +     dsi->clks = devm_kcalloc(dev, dsi->driver_data->num_clks,
> > +                              sizeof(*dsi->clks), GFP_KERNEL);
> > +     if (!dsi->clks)
> > +             return -ENOMEM;
> > +
> > +     for (i = 0; i < dsi->driver_data->num_clks; i++) {
> > +             dsi->clks[i] = devm_clk_get(dev, clk_names[i]);
> > +             if (IS_ERR(dsi->clks[i])) {
> > +                     if (strcmp(clk_names[i], "sclk_mipi") == 0) {
> > +                             dsi->clks[i] = devm_clk_get(dev, OLD_SCLK_MIPI_CLK_NAME);
> > +                             if (!IS_ERR(dsi->clks[i]))
> > +                                     continue;
> > +                     }
> > +
> > +                     dev_info(dev, "failed to get the clock: %s\n", clk_names[i]);
> > +                     return PTR_ERR(dsi->clks[i]);
> > +             }
> > +     }
> > +
> > +     dsi->reg_base = devm_platform_ioremap_resource(pdev, 0);
> > +     if (IS_ERR(dsi->reg_base))
> > +             return PTR_ERR(dsi->reg_base);
> > +
> > +     dsi->phy = devm_phy_get(dev, "dsim");
> > +     if (IS_ERR(dsi->phy)) {
> > +             dev_info(dev, "failed to get dsim phy\n");
> > +             return PTR_ERR(dsi->phy);
> > +     }
> > +
> > +     dsi->irq = platform_get_irq(pdev, 0);
> > +     if (dsi->irq < 0)
> > +             return dsi->irq;
> > +
> > +     ret = devm_request_threaded_irq(dev, dsi->irq, NULL,
> > +                                     samsung_dsim_irq,
> > +                                     IRQF_ONESHOT | IRQF_NO_AUTOEN,
> > +                                     dev_name(dev), dsi);
> > +     if (ret) {
> > +             dev_err(dev, "failed to request dsi irq\n");
> > +             return ret;
> > +     }
> > +
> > +     ret = samsung_dsim_parse_dt(dsi);
> > +     if (ret)
> > +             return ret;
> > +
> > +     platform_set_drvdata(pdev, dsi);
> > +
> > +     pm_runtime_enable(dev);
> > +
> > +     dsi->bridge.funcs = &samsung_dsim_bridge_funcs;
> > +     dsi->bridge.of_node = dev->of_node;
> > +     dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
> > +
> > +     if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->register_host)
> > +             ret = dsi->plat_data->host_ops->register_host(dsi);
> > +
> > +     if (ret)
> > +             goto err_disable_runtime;
> > +
> > +     return 0;
> > +
> > +err_disable_runtime:
> > +     pm_runtime_disable(dev);
> > +
> > +     return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(samsung_dsim_probe);
> > +
> > +int samsung_dsim_remove(struct platform_device *pdev)
> > +{
> > +     struct samsung_dsim *dsi = platform_get_drvdata(pdev);
> > +
> > +     pm_runtime_disable(&pdev->dev);
> > +
> > +     if (dsi->plat_data->host_ops && dsi->plat_data->host_ops->unregister_host)
> > +             dsi->plat_data->host_ops->unregister_host(dsi);
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(samsung_dsim_remove);
> > +
> > +static int __maybe_unused samsung_dsim_suspend(struct device *dev)
> > +{
> > +     struct samsung_dsim *dsi = dev_get_drvdata(dev);
> > +     const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
> > +     int ret, i;
> > +
> > +     usleep_range(10000, 20000);
> > +
> > +     if (dsi->state & DSIM_STATE_INITIALIZED) {
> > +             dsi->state &= ~DSIM_STATE_INITIALIZED;
> > +
> > +             samsung_dsim_disable_clock(dsi);
> > +
> > +             samsung_dsim_disable_irq(dsi);
> > +     }
> > +
> > +     dsi->state &= ~DSIM_STATE_CMD_LPM;
> > +
> > +     phy_power_off(dsi->phy);
> > +
> > +     for (i = driver_data->num_clks - 1; i > -1; i--)
> > +             clk_disable_unprepare(dsi->clks[i]);
> > +
> > +     ret = regulator_bulk_disable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
> > +     if (ret < 0)
> > +             dev_err(dsi->dev, "cannot disable regulators %d\n", ret);
> > +
> > +     return 0;
> > +}
> > +
> > +static int __maybe_unused samsung_dsim_resume(struct device *dev)
> > +{
> > +     struct samsung_dsim *dsi = dev_get_drvdata(dev);
> > +     const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
> > +     int ret, i;
> > +
> > +     ret = regulator_bulk_enable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
> > +     if (ret < 0) {
> > +             dev_err(dsi->dev, "cannot enable regulators %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     for (i = 0; i < driver_data->num_clks; i++) {
> > +             ret = clk_prepare_enable(dsi->clks[i]);
> > +             if (ret < 0)
> > +                     goto err_clk;
> > +     }
> > +
> > +     ret = phy_power_on(dsi->phy);
> > +     if (ret < 0) {
> > +             dev_err(dsi->dev, "cannot enable phy %d\n", ret);
> > +             goto err_clk;
> > +     }
> > +
> > +     return 0;
> > +
> > +err_clk:
> > +     while (--i > -1)
> > +             clk_disable_unprepare(dsi->clks[i]);
> > +     regulator_bulk_disable(ARRAY_SIZE(dsi->supplies), dsi->supplies);
> > +
> > +     return ret;
> > +}
> > +
> > +const struct dev_pm_ops samsung_dsim_pm_ops = {
> > +     SET_RUNTIME_PM_OPS(samsung_dsim_suspend, samsung_dsim_resume, NULL)
> > +     SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> > +                             pm_runtime_force_resume)
> > +};
> > +EXPORT_SYMBOL_GPL(samsung_dsim_pm_ops);
> > +
> > +static const struct of_device_id samsung_dsim_of_match[] = {
> > +     { /* sentinel. */ }
> > +};
> > +MODULE_DEVICE_TABLE(of, samsung_dsim_of_match);
> > +
> > +static struct platform_driver samsung_dsim_driver = {
> > +     .probe = samsung_dsim_probe,
> > +     .remove = samsung_dsim_remove,
> > +     .driver = {
> > +                .name = "samsung-dsim",
> > +                .owner = THIS_MODULE,
> > +                .pm = &samsung_dsim_pm_ops,
> > +                .of_match_table = samsung_dsim_of_match,
> > +     },
> > +};
> > +
> > +module_platform_driver(samsung_dsim_driver);
> > +
> > +MODULE_AUTHOR("Jagan Teki <jagan@amarulasolutions.com>");
> > +MODULE_DESCRIPTION("Samsung MIPI DSIM controller bridge");
> > +MODULE_LICENSE("GPL");
> > diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
> > index 3d2f025d4fd4..a65acfed15b9 100644
> > --- a/drivers/gpu/drm/exynos/Kconfig
> > +++ b/drivers/gpu/drm/exynos/Kconfig
> > @@ -59,6 +59,7 @@ config DRM_EXYNOS_DSI
> >       depends on DRM_EXYNOS_FIMD || DRM_EXYNOS5433_DECON || DRM_EXYNOS7_DECON
> >       select DRM_MIPI_DSI
> >       select DRM_PANEL
> > +     select DRM_SAMSUNG_DSIM
> >       default n
> >       help
> >         This enables support for Exynos MIPI-DSI device.
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > index ec673223d6b7..eac52f438d04 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> > @@ -1,1351 +1,83 @@
> >   // SPDX-License-Identifier: GPL-2.0-only
> >   /*
> > - * Samsung SoC MIPI DSI Master driver.
> > + * Samsung MIPI DSIM glue for Exynos SoCs.
> >    *
> >    * Copyright (c) 2014 Samsung Electronics Co., Ltd
> >    *
> >    * Contacts: Tomasz Figa <t.figa@samsung.com>
> > -*/
> > + */
> >
> > -#include <linux/clk.h>
> > -#include <linux/delay.h>
> >   #include <linux/component.h>
> >   #include <linux/gpio/consumer.h>
> > -#include <linux/irq.h>
> >   #include <linux/of_device.h>
> > -#include <linux/of_graph.h>
> > -#include <linux/phy/phy.h>
> > -#include <linux/regulator/consumer.h>
> >
> > -#include <asm/unaligned.h>
> > -
> > -#include <video/mipi_display.h>
> > -#include <video/videomode.h>
> > -
> > -#include <drm/drm_atomic_helper.h>
> > -#include <drm/drm_bridge.h>
> > -#include <drm/drm_mipi_dsi.h>
> > -#include <drm/drm_panel.h>
> > -#include <drm/drm_print.h>
> > +#include <drm/bridge/samsung-dsim.h>
> >   #include <drm/drm_probe_helper.h>
> >   #include <drm/drm_simple_kms_helper.h>
> >
> >   #include "exynos_drm_crtc.h"
> >   #include "exynos_drm_drv.h"
> >
> > -/* returns true iff both arguments logically differs */
> > -#define NEQV(a, b) (!(a) ^ !(b))
> > -
> > -/* DSIM_STATUS */
> > -#define DSIM_STOP_STATE_DAT(x)               (((x) & 0xf) << 0)
> > -#define DSIM_STOP_STATE_CLK          (1 << 8)
> > -#define DSIM_TX_READY_HS_CLK         (1 << 10)
> > -#define DSIM_PLL_STABLE                      (1 << 31)
> > -
> > -/* DSIM_SWRST */
> > -#define DSIM_FUNCRST                 (1 << 16)
> > -#define DSIM_SWRST                   (1 << 0)
> > -
> > -/* DSIM_TIMEOUT */
> > -#define DSIM_LPDR_TIMEOUT(x)         ((x) << 0)
> > -#define DSIM_BTA_TIMEOUT(x)          ((x) << 16)
> > -
> > -/* DSIM_CLKCTRL */
> > -#define DSIM_ESC_PRESCALER(x)                (((x) & 0xffff) << 0)
> > -#define DSIM_ESC_PRESCALER_MASK              (0xffff << 0)
> > -#define DSIM_LANE_ESC_CLK_EN_CLK     (1 << 19)
> > -#define DSIM_LANE_ESC_CLK_EN_DATA(x) (((x) & 0xf) << 20)
> > -#define DSIM_LANE_ESC_CLK_EN_DATA_MASK       (0xf << 20)
> > -#define DSIM_BYTE_CLKEN                      (1 << 24)
> > -#define DSIM_BYTE_CLK_SRC(x)         (((x) & 0x3) << 25)
> > -#define DSIM_BYTE_CLK_SRC_MASK               (0x3 << 25)
> > -#define DSIM_PLL_BYPASS                      (1 << 27)
> > -#define DSIM_ESC_CLKEN                       (1 << 28)
> > -#define DSIM_TX_REQUEST_HSCLK                (1 << 31)
> > -
> > -/* DSIM_CONFIG */
> > -#define DSIM_LANE_EN_CLK             (1 << 0)
> > -#define DSIM_LANE_EN(x)                      (((x) & 0xf) << 1)
> > -#define DSIM_NUM_OF_DATA_LANE(x)     (((x) & 0x3) << 5)
> > -#define DSIM_SUB_PIX_FORMAT(x)               (((x) & 0x7) << 8)
> > -#define DSIM_MAIN_PIX_FORMAT_MASK    (0x7 << 12)
> > -#define DSIM_MAIN_PIX_FORMAT_RGB888  (0x7 << 12)
> > -#define DSIM_MAIN_PIX_FORMAT_RGB666  (0x6 << 12)
> > -#define DSIM_MAIN_PIX_FORMAT_RGB666_P        (0x5 << 12)
> > -#define DSIM_MAIN_PIX_FORMAT_RGB565  (0x4 << 12)
> > -#define DSIM_SUB_VC                  (((x) & 0x3) << 16)
> > -#define DSIM_MAIN_VC                 (((x) & 0x3) << 18)
> > -#define DSIM_HSA_MODE                        (1 << 20)
> > -#define DSIM_HBP_MODE                        (1 << 21)
> > -#define DSIM_HFP_MODE                        (1 << 22)
> > -#define DSIM_HSE_MODE                        (1 << 23)
> > -#define DSIM_AUTO_MODE                       (1 << 24)
> > -#define DSIM_VIDEO_MODE                      (1 << 25)
> > -#define DSIM_BURST_MODE                      (1 << 26)
> > -#define DSIM_SYNC_INFORM             (1 << 27)
> > -#define DSIM_EOT_DISABLE             (1 << 28)
> > -#define DSIM_MFLUSH_VS                       (1 << 29)
> > -/* This flag is valid only for exynos3250/3472/5260/5430 */
> > -#define DSIM_CLKLANE_STOP            (1 << 30)
> > -
> > -/* DSIM_ESCMODE */
> > -#define DSIM_TX_TRIGGER_RST          (1 << 4)
> > -#define DSIM_TX_LPDT_LP                      (1 << 6)
> > -#define DSIM_CMD_LPDT_LP             (1 << 7)
> > -#define DSIM_FORCE_BTA                       (1 << 16)
> > -#define DSIM_FORCE_STOP_STATE                (1 << 20)
> > -#define DSIM_STOP_STATE_CNT(x)               (((x) & 0x7ff) << 21)
> > -#define DSIM_STOP_STATE_CNT_MASK     (0x7ff << 21)
> > -
> > -/* DSIM_MDRESOL */
> > -#define DSIM_MAIN_STAND_BY           (1 << 31)
> > -#define DSIM_MAIN_VRESOL(x, num_bits)        (((x) & ((1 << (num_bits)) - 1)) << 16)
> > -#define DSIM_MAIN_HRESOL(x, num_bits)        (((x) & ((1 << (num_bits)) - 1)) << 0)
> > -
> > -/* DSIM_MVPORCH */
> > -#define DSIM_CMD_ALLOW(x)            ((x) << 28)
> > -#define DSIM_STABLE_VFP(x)           ((x) << 16)
> > -#define DSIM_MAIN_VBP(x)             ((x) << 0)
> > -#define DSIM_CMD_ALLOW_MASK          (0xf << 28)
> > -#define DSIM_STABLE_VFP_MASK         (0x7ff << 16)
> > -#define DSIM_MAIN_VBP_MASK           (0x7ff << 0)
> > -
> > -/* DSIM_MHPORCH */
> > -#define DSIM_MAIN_HFP(x)             ((x) << 16)
> > -#define DSIM_MAIN_HBP(x)             ((x) << 0)
> > -#define DSIM_MAIN_HFP_MASK           ((0xffff) << 16)
> > -#define DSIM_MAIN_HBP_MASK           ((0xffff) << 0)
> > -
> > -/* DSIM_MSYNC */
> > -#define DSIM_MAIN_VSA(x)             ((x) << 22)
> > -#define DSIM_MAIN_HSA(x)             ((x) << 0)
> > -#define DSIM_MAIN_VSA_MASK           ((0x3ff) << 22)
> > -#define DSIM_MAIN_HSA_MASK           ((0xffff) << 0)
> > -
> > -/* DSIM_SDRESOL */
> > -#define DSIM_SUB_STANDY(x)           ((x) << 31)
> > -#define DSIM_SUB_VRESOL(x)           ((x) << 16)
> > -#define DSIM_SUB_HRESOL(x)           ((x) << 0)
> > -#define DSIM_SUB_STANDY_MASK         ((0x1) << 31)
> > -#define DSIM_SUB_VRESOL_MASK         ((0x7ff) << 16)
> > -#define DSIM_SUB_HRESOL_MASK         ((0x7ff) << 0)
> > -
> > -/* DSIM_INTSRC */
> > -#define DSIM_INT_PLL_STABLE          (1 << 31)
> > -#define DSIM_INT_SW_RST_RELEASE              (1 << 30)
> > -#define DSIM_INT_SFR_FIFO_EMPTY              (1 << 29)
> > -#define DSIM_INT_SFR_HDR_FIFO_EMPTY  (1 << 28)
> > -#define DSIM_INT_BTA                 (1 << 25)
> > -#define DSIM_INT_FRAME_DONE          (1 << 24)
> > -#define DSIM_INT_RX_TIMEOUT          (1 << 21)
> > -#define DSIM_INT_BTA_TIMEOUT         (1 << 20)
> > -#define DSIM_INT_RX_DONE             (1 << 18)
> > -#define DSIM_INT_RX_TE                       (1 << 17)
> > -#define DSIM_INT_RX_ACK                      (1 << 16)
> > -#define DSIM_INT_RX_ECC_ERR          (1 << 15)
> > -#define DSIM_INT_RX_CRC_ERR          (1 << 14)
> > -
> > -/* DSIM_FIFOCTRL */
> > -#define DSIM_RX_DATA_FULL            (1 << 25)
> > -#define DSIM_RX_DATA_EMPTY           (1 << 24)
> > -#define DSIM_SFR_HEADER_FULL         (1 << 23)
> > -#define DSIM_SFR_HEADER_EMPTY                (1 << 22)
> > -#define DSIM_SFR_PAYLOAD_FULL                (1 << 21)
> > -#define DSIM_SFR_PAYLOAD_EMPTY               (1 << 20)
> > -#define DSIM_I80_HEADER_FULL         (1 << 19)
> > -#define DSIM_I80_HEADER_EMPTY                (1 << 18)
> > -#define DSIM_I80_PAYLOAD_FULL                (1 << 17)
> > -#define DSIM_I80_PAYLOAD_EMPTY               (1 << 16)
> > -#define DSIM_SD_HEADER_FULL          (1 << 15)
> > -#define DSIM_SD_HEADER_EMPTY         (1 << 14)
> > -#define DSIM_SD_PAYLOAD_FULL         (1 << 13)
> > -#define DSIM_SD_PAYLOAD_EMPTY                (1 << 12)
> > -#define DSIM_MD_HEADER_FULL          (1 << 11)
> > -#define DSIM_MD_HEADER_EMPTY         (1 << 10)
> > -#define DSIM_MD_PAYLOAD_FULL         (1 << 9)
> > -#define DSIM_MD_PAYLOAD_EMPTY                (1 << 8)
> > -#define DSIM_RX_FIFO                 (1 << 4)
> > -#define DSIM_SFR_FIFO                        (1 << 3)
> > -#define DSIM_I80_FIFO                        (1 << 2)
> > -#define DSIM_SD_FIFO                 (1 << 1)
> > -#define DSIM_MD_FIFO                 (1 << 0)
> > -
> > -/* DSIM_PHYACCHR */
> > -#define DSIM_AFC_EN                  (1 << 14)
> > -#define DSIM_AFC_CTL(x)                      (((x) & 0x7) << 5)
> > -
> > -/* DSIM_PLLCTRL */
> > -#define DSIM_FREQ_BAND(x)            ((x) << 24)
> > -#define DSIM_PLL_EN                  (1 << 23)
> > -#define DSIM_PLL_P(x)                        ((x) << 13)
> > -#define DSIM_PLL_M(x)                        ((x) << 4)
> > -#define DSIM_PLL_S(x)                        ((x) << 1)
> > -
> > -/* DSIM_PHYCTRL */
> > -#define DSIM_PHYCTRL_ULPS_EXIT(x)    (((x) & 0x1ff) << 0)
> > -#define DSIM_PHYCTRL_B_DPHYCTL_VREG_LP       (1 << 30)
> > -#define DSIM_PHYCTRL_B_DPHYCTL_SLEW_UP       (1 << 14)
> > -
> > -/* DSIM_PHYTIMING */
> > -#define DSIM_PHYTIMING_LPX(x)                ((x) << 8)
> > -#define DSIM_PHYTIMING_HS_EXIT(x)    ((x) << 0)
> > -
> > -/* DSIM_PHYTIMING1 */
> > -#define DSIM_PHYTIMING1_CLK_PREPARE(x)       ((x) << 24)
> > -#define DSIM_PHYTIMING1_CLK_ZERO(x)  ((x) << 16)
> > -#define DSIM_PHYTIMING1_CLK_POST(x)  ((x) << 8)
> > -#define DSIM_PHYTIMING1_CLK_TRAIL(x) ((x) << 0)
> > -
> > -/* DSIM_PHYTIMING2 */
> > -#define DSIM_PHYTIMING2_HS_PREPARE(x)        ((x) << 16)
> > -#define DSIM_PHYTIMING2_HS_ZERO(x)   ((x) << 8)
> > -#define DSIM_PHYTIMING2_HS_TRAIL(x)  ((x) << 0)
> > -
> > -#define DSI_MAX_BUS_WIDTH            4
> > -#define DSI_NUM_VIRTUAL_CHANNELS     4
> > -#define DSI_TX_FIFO_SIZE             2048
> > -#define DSI_RX_FIFO_SIZE             256
> > -#define DSI_XFER_TIMEOUT_MS          100
> > -#define DSI_RX_FIFO_EMPTY            0x30800002
> > -
> > -#define OLD_SCLK_MIPI_CLK_NAME "pll_clk"
> > -
> > -static const char *const clk_names[5] = { "bus_clk", "sclk_mipi",
> > -     "phyclk_mipidphy0_bitclkdiv8", "phyclk_mipidphy0_rxclkesc0",
> > -     "sclk_rgb_vclk_to_dsim0" };
> > -
> > -enum exynos_dsi_transfer_type {
> > -     EXYNOS_DSI_TX,
> > -     EXYNOS_DSI_RX,
> > -};
> > -
> > -struct exynos_dsi_transfer {
> > -     struct list_head list;
> > -     struct completion completed;
> > -     int result;
> > -     struct mipi_dsi_packet packet;
> > -     u16 flags;
> > -     u16 tx_done;
> > -
> > -     u8 *rx_payload;
> > -     u16 rx_len;
> > -     u16 rx_done;
> > -};
> > -
> > -#define DSIM_STATE_ENABLED           BIT(0)
> > -#define DSIM_STATE_INITIALIZED               BIT(1)
> > -#define DSIM_STATE_CMD_LPM           BIT(2)
> > -#define DSIM_STATE_VIDOUT_AVAILABLE  BIT(3)
> > -
> > -struct exynos_dsi_driver_data {
> > -     const unsigned int *reg_ofs;
> > -     unsigned int plltmr_reg;
> > -     unsigned int has_freqband:1;
> > -     unsigned int has_clklane_stop:1;
> > -     unsigned int num_clks;
> > -     unsigned int max_freq;
> > -     unsigned int wait_for_reset;
> > -     unsigned int num_bits_resol;
> > -     const unsigned int *reg_values;
> > -};
> > -
> >   struct exynos_dsi {
> >       struct drm_encoder encoder;
> > -     struct mipi_dsi_host dsi_host;
> > -     struct drm_bridge bridge;
> > -     struct drm_bridge *out_bridge;
> > -     struct device *dev;
> > -     struct drm_display_mode mode;
> > -
> > -     void __iomem *reg_base;
> > -     struct phy *phy;
> > -     struct clk **clks;
> > -     struct regulator_bulk_data supplies[2];
> > -     int irq;
> >       struct gpio_desc *te_gpio;
> > -
> > -     u32 pll_clk_rate;
> > -     u32 burst_clk_rate;
> > -     u32 esc_clk_rate;
> > -     u32 lanes;
> > -     u32 mode_flags;
> > -     u32 format;
> > -
> > -     int state;
> > -     struct drm_property *brightness;
> > -     struct completion completed;
> > -
> > -     spinlock_t transfer_lock; /* protects transfer_list */
> > -     struct list_head transfer_list;
> > -
> > -     const struct exynos_dsi_driver_data *driver_data;
> > -};
> > -
> > -#define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
> > -
> > -static inline struct exynos_dsi *bridge_to_dsi(struct drm_bridge *b)
> > -{
> > -     return container_of(b, struct exynos_dsi, bridge);
> > -}
> > -
> > -enum reg_idx {
> > -     DSIM_STATUS_REG,        /* Status register */
> > -     DSIM_SWRST_REG,         /* Software reset register */
> > -     DSIM_CLKCTRL_REG,       /* Clock control register */
> > -     DSIM_TIMEOUT_REG,       /* Time out register */
> > -     DSIM_CONFIG_REG,        /* Configuration register */
> > -     DSIM_ESCMODE_REG,       /* Escape mode register */
> > -     DSIM_MDRESOL_REG,
> > -     DSIM_MVPORCH_REG,       /* Main display Vporch register */
> > -     DSIM_MHPORCH_REG,       /* Main display Hporch register */
> > -     DSIM_MSYNC_REG,         /* Main display sync area register */
> > -     DSIM_INTSRC_REG,        /* Interrupt source register */
> > -     DSIM_INTMSK_REG,        /* Interrupt mask register */
> > -     DSIM_PKTHDR_REG,        /* Packet Header FIFO register */
> > -     DSIM_PAYLOAD_REG,       /* Payload FIFO register */
> > -     DSIM_RXFIFO_REG,        /* Read FIFO register */
> > -     DSIM_FIFOCTRL_REG,      /* FIFO status and control register */
> > -     DSIM_PLLCTRL_REG,       /* PLL control register */
> > -     DSIM_PHYCTRL_REG,
> > -     DSIM_PHYTIMING_REG,
> > -     DSIM_PHYTIMING1_REG,
> > -     DSIM_PHYTIMING2_REG,
> > -     NUM_REGS
> >   };
> >
> > -static inline void exynos_dsi_write(struct exynos_dsi *dsi, enum reg_idx idx,
> > -                                 u32 val)
> > -{
> > -
> > -     writel(val, dsi->reg_base + dsi->driver_data->reg_ofs[idx]);
> > -}
> > -
> > -static inline u32 exynos_dsi_read(struct exynos_dsi *dsi, enum reg_idx idx)
> > -{
> > -     return readl(dsi->reg_base + dsi->driver_data->reg_ofs[idx]);
> > -}
> > -
> > -static const unsigned int exynos_reg_ofs[] = {
> > -     [DSIM_STATUS_REG] =  0x00,
> > -     [DSIM_SWRST_REG] =  0x04,
> > -     [DSIM_CLKCTRL_REG] =  0x08,
> > -     [DSIM_TIMEOUT_REG] =  0x0c,
> > -     [DSIM_CONFIG_REG] =  0x10,
> > -     [DSIM_ESCMODE_REG] =  0x14,
> > -     [DSIM_MDRESOL_REG] =  0x18,
> > -     [DSIM_MVPORCH_REG] =  0x1c,
> > -     [DSIM_MHPORCH_REG] =  0x20,
> > -     [DSIM_MSYNC_REG] =  0x24,
> > -     [DSIM_INTSRC_REG] =  0x2c,
> > -     [DSIM_INTMSK_REG] =  0x30,
> > -     [DSIM_PKTHDR_REG] =  0x34,
> > -     [DSIM_PAYLOAD_REG] =  0x38,
> > -     [DSIM_RXFIFO_REG] =  0x3c,
> > -     [DSIM_FIFOCTRL_REG] =  0x44,
> > -     [DSIM_PLLCTRL_REG] =  0x4c,
> > -     [DSIM_PHYCTRL_REG] =  0x5c,
> > -     [DSIM_PHYTIMING_REG] =  0x64,
> > -     [DSIM_PHYTIMING1_REG] =  0x68,
> > -     [DSIM_PHYTIMING2_REG] =  0x6c,
> > -};
> > -
> > -static const unsigned int exynos5433_reg_ofs[] = {
> > -     [DSIM_STATUS_REG] = 0x04,
> > -     [DSIM_SWRST_REG] = 0x0C,
> > -     [DSIM_CLKCTRL_REG] = 0x10,
> > -     [DSIM_TIMEOUT_REG] = 0x14,
> > -     [DSIM_CONFIG_REG] = 0x18,
> > -     [DSIM_ESCMODE_REG] = 0x1C,
> > -     [DSIM_MDRESOL_REG] = 0x20,
> > -     [DSIM_MVPORCH_REG] = 0x24,
> > -     [DSIM_MHPORCH_REG] = 0x28,
> > -     [DSIM_MSYNC_REG] = 0x2C,
> > -     [DSIM_INTSRC_REG] = 0x34,
> > -     [DSIM_INTMSK_REG] = 0x38,
> > -     [DSIM_PKTHDR_REG] = 0x3C,
> > -     [DSIM_PAYLOAD_REG] = 0x40,
> > -     [DSIM_RXFIFO_REG] = 0x44,
> > -     [DSIM_FIFOCTRL_REG] = 0x4C,
> > -     [DSIM_PLLCTRL_REG] = 0x94,
> > -     [DSIM_PHYCTRL_REG] = 0xA4,
> > -     [DSIM_PHYTIMING_REG] = 0xB4,
> > -     [DSIM_PHYTIMING1_REG] = 0xB8,
> > -     [DSIM_PHYTIMING2_REG] = 0xBC,
> > -};
> > -
> > -enum reg_value_idx {
> > -     RESET_TYPE,
> > -     PLL_TIMER,
> > -     STOP_STATE_CNT,
> > -     PHYCTRL_ULPS_EXIT,
> > -     PHYCTRL_VREG_LP,
> > -     PHYCTRL_SLEW_UP,
> > -     PHYTIMING_LPX,
> > -     PHYTIMING_HS_EXIT,
> > -     PHYTIMING_CLK_PREPARE,
> > -     PHYTIMING_CLK_ZERO,
> > -     PHYTIMING_CLK_POST,
> > -     PHYTIMING_CLK_TRAIL,
> > -     PHYTIMING_HS_PREPARE,
> > -     PHYTIMING_HS_ZERO,
> > -     PHYTIMING_HS_TRAIL
> > -};
> > -
> > -static const unsigned int reg_values[] = {
> > -     [RESET_TYPE] = DSIM_SWRST,
> > -     [PLL_TIMER] = 500,
> > -     [STOP_STATE_CNT] = 0xf,
> > -     [PHYCTRL_ULPS_EXIT] = DSIM_PHYCTRL_ULPS_EXIT(0x0af),
> > -     [PHYCTRL_VREG_LP] = 0,
> > -     [PHYCTRL_SLEW_UP] = 0,
> > -     [PHYTIMING_LPX] = DSIM_PHYTIMING_LPX(0x06),
> > -     [PHYTIMING_HS_EXIT] = DSIM_PHYTIMING_HS_EXIT(0x0b),
> > -     [PHYTIMING_CLK_PREPARE] = DSIM_PHYTIMING1_CLK_PREPARE(0x07),
> > -     [PHYTIMING_CLK_ZERO] = DSIM_PHYTIMING1_CLK_ZERO(0x27),
> > -     [PHYTIMING_CLK_POST] = DSIM_PHYTIMING1_CLK_POST(0x0d),
> > -     [PHYTIMING_CLK_TRAIL] = DSIM_PHYTIMING1_CLK_TRAIL(0x08),
> > -     [PHYTIMING_HS_PREPARE] = DSIM_PHYTIMING2_HS_PREPARE(0x09),
> > -     [PHYTIMING_HS_ZERO] = DSIM_PHYTIMING2_HS_ZERO(0x0d),
> > -     [PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0b),
> > -};
> > -
> > -static const unsigned int exynos5422_reg_values[] = {
> > -     [RESET_TYPE] = DSIM_SWRST,
> > -     [PLL_TIMER] = 500,
> > -     [STOP_STATE_CNT] = 0xf,
> > -     [PHYCTRL_ULPS_EXIT] = DSIM_PHYCTRL_ULPS_EXIT(0xaf),
> > -     [PHYCTRL_VREG_LP] = 0,
> > -     [PHYCTRL_SLEW_UP] = 0,
> > -     [PHYTIMING_LPX] = DSIM_PHYTIMING_LPX(0x08),
> > -     [PHYTIMING_HS_EXIT] = DSIM_PHYTIMING_HS_EXIT(0x0d),
> > -     [PHYTIMING_CLK_PREPARE] = DSIM_PHYTIMING1_CLK_PREPARE(0x09),
> > -     [PHYTIMING_CLK_ZERO] = DSIM_PHYTIMING1_CLK_ZERO(0x30),
> > -     [PHYTIMING_CLK_POST] = DSIM_PHYTIMING1_CLK_POST(0x0e),
> > -     [PHYTIMING_CLK_TRAIL] = DSIM_PHYTIMING1_CLK_TRAIL(0x0a),
> > -     [PHYTIMING_HS_PREPARE] = DSIM_PHYTIMING2_HS_PREPARE(0x0c),
> > -     [PHYTIMING_HS_ZERO] = DSIM_PHYTIMING2_HS_ZERO(0x11),
> > -     [PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0d),
> > -};
> > -
> > -static const unsigned int exynos5433_reg_values[] = {
> > -     [RESET_TYPE] = DSIM_FUNCRST,
> > -     [PLL_TIMER] = 22200,
> > -     [STOP_STATE_CNT] = 0xa,
> > -     [PHYCTRL_ULPS_EXIT] = DSIM_PHYCTRL_ULPS_EXIT(0x190),
> > -     [PHYCTRL_VREG_LP] = DSIM_PHYCTRL_B_DPHYCTL_VREG_LP,
> > -     [PHYCTRL_SLEW_UP] = DSIM_PHYCTRL_B_DPHYCTL_SLEW_UP,
> > -     [PHYTIMING_LPX] = DSIM_PHYTIMING_LPX(0x07),
> > -     [PHYTIMING_HS_EXIT] = DSIM_PHYTIMING_HS_EXIT(0x0c),
> > -     [PHYTIMING_CLK_PREPARE] = DSIM_PHYTIMING1_CLK_PREPARE(0x09),
> > -     [PHYTIMING_CLK_ZERO] = DSIM_PHYTIMING1_CLK_ZERO(0x2d),
> > -     [PHYTIMING_CLK_POST] = DSIM_PHYTIMING1_CLK_POST(0x0e),
> > -     [PHYTIMING_CLK_TRAIL] = DSIM_PHYTIMING1_CLK_TRAIL(0x09),
> > -     [PHYTIMING_HS_PREPARE] = DSIM_PHYTIMING2_HS_PREPARE(0x0b),
> > -     [PHYTIMING_HS_ZERO] = DSIM_PHYTIMING2_HS_ZERO(0x10),
> > -     [PHYTIMING_HS_TRAIL] = DSIM_PHYTIMING2_HS_TRAIL(0x0c),
> > -};
> > -
> > -static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
> > -     .reg_ofs = exynos_reg_ofs,
> > -     .plltmr_reg = 0x50,
> > -     .has_freqband = 1,
> > -     .has_clklane_stop = 1,
> > -     .num_clks = 2,
> > -     .max_freq = 1000,
> > -     .wait_for_reset = 1,
> > -     .num_bits_resol = 11,
> > -     .reg_values = reg_values,
> > -};
> > -
> > -static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
> > -     .reg_ofs = exynos_reg_ofs,
> > -     .plltmr_reg = 0x50,
> > -     .has_freqband = 1,
> > -     .has_clklane_stop = 1,
> > -     .num_clks = 2,
> > -     .max_freq = 1000,
> > -     .wait_for_reset = 1,
> > -     .num_bits_resol = 11,
> > -     .reg_values = reg_values,
> > -};
> > -
> > -static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
> > -     .reg_ofs = exynos_reg_ofs,
> > -     .plltmr_reg = 0x58,
> > -     .num_clks = 2,
> > -     .max_freq = 1000,
> > -     .wait_for_reset = 1,
> > -     .num_bits_resol = 11,
> > -     .reg_values = reg_values,
> > -};
> > -
> > -static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
> > -     .reg_ofs = exynos5433_reg_ofs,
> > -     .plltmr_reg = 0xa0,
> > -     .has_clklane_stop = 1,
> > -     .num_clks = 5,
> > -     .max_freq = 1500,
> > -     .wait_for_reset = 0,
> > -     .num_bits_resol = 12,
> > -     .reg_values = exynos5433_reg_values,
> > -};
> > -
> > -static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
> > -     .reg_ofs = exynos5433_reg_ofs,
> > -     .plltmr_reg = 0xa0,
> > -     .has_clklane_stop = 1,
> > -     .num_clks = 2,
> > -     .max_freq = 1500,
> > -     .wait_for_reset = 1,
> > -     .num_bits_resol = 12,
> > -     .reg_values = exynos5422_reg_values,
> > -};
> > -
> > -static const struct of_device_id exynos_dsi_of_match[] = {
> > -     { .compatible = "samsung,exynos3250-mipi-dsi",
> > -       .data = &exynos3_dsi_driver_data },
> > -     { .compatible = "samsung,exynos4210-mipi-dsi",
> > -       .data = &exynos4_dsi_driver_data },
> > -     { .compatible = "samsung,exynos5410-mipi-dsi",
> > -       .data = &exynos5_dsi_driver_data },
> > -     { .compatible = "samsung,exynos5422-mipi-dsi",
> > -       .data = &exynos5422_dsi_driver_data },
> > -     { .compatible = "samsung,exynos5433-mipi-dsi",
> > -       .data = &exynos5433_dsi_driver_data },
> > -     { }
> > -};
> > -
> > -static void exynos_dsi_wait_for_reset(struct exynos_dsi *dsi)
> > -{
> > -     if (wait_for_completion_timeout(&dsi->completed, msecs_to_jiffies(300)))
> > -             return;
> > -
> > -     dev_err(dsi->dev, "timeout waiting for reset\n");
> > -}
> > -
> > -static void exynos_dsi_reset(struct exynos_dsi *dsi)
> > -{
> > -     u32 reset_val = dsi->driver_data->reg_values[RESET_TYPE];
> > -
> > -     reinit_completion(&dsi->completed);
> > -     exynos_dsi_write(dsi, DSIM_SWRST_REG, reset_val);
> > -}
> > -
> > -#ifndef MHZ
> > -#define MHZ  (1000*1000)
> > -#endif
> > -
> > -static unsigned long exynos_dsi_pll_find_pms(struct exynos_dsi *dsi,
> > -             unsigned long fin, unsigned long fout, u8 *p, u16 *m, u8 *s)
> > -{
> > -     const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
> > -     unsigned long best_freq = 0;
> > -     u32 min_delta = 0xffffffff;
> > -     u8 p_min, p_max;
> > -     u8 _p, best_p;
> > -     u16 _m, best_m;
> > -     u8 _s, best_s;
> > -
> > -     p_min = DIV_ROUND_UP(fin, (12 * MHZ));
> > -     p_max = fin / (6 * MHZ);
> > -
> > -     for (_p = p_min; _p <= p_max; ++_p) {
> > -             for (_s = 0; _s <= 5; ++_s) {
> > -                     u64 tmp;
> > -                     u32 delta;
> > -
> > -                     tmp = (u64)fout * (_p << _s);
> > -                     do_div(tmp, fin);
> > -                     _m = tmp;
> > -                     if (_m < 41 || _m > 125)
> > -                             continue;
> > -
> > -                     tmp = (u64)_m * fin;
> > -                     do_div(tmp, _p);
> > -                     if (tmp < 500 * MHZ ||
> > -                                     tmp > driver_data->max_freq * MHZ)
> > -                             continue;
> > -
> > -                     tmp = (u64)_m * fin;
> > -                     do_div(tmp, _p << _s);
> > -
> > -                     delta = abs(fout - tmp);
> > -                     if (delta < min_delta) {
> > -                             best_p = _p;
> > -                             best_m = _m;
> > -                             best_s = _s;
> > -                             min_delta = delta;
> > -                             best_freq = tmp;
> > -                     }
> > -             }
> > -     }
> > -
> > -     if (best_freq) {
> > -             *p = best_p;
> > -             *m = best_m;
> > -             *s = best_s;
> > -     }
> > -
> > -     return best_freq;
> > -}
> > -
> > -static unsigned long exynos_dsi_set_pll(struct exynos_dsi *dsi,
> > -                                     unsigned long freq)
> > -{
> > -     const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
> > -     unsigned long fin, fout;
> > -     int timeout;
> > -     u8 p, s;
> > -     u16 m;
> > -     u32 reg;
> > -
> > -     fin = dsi->pll_clk_rate;
> > -     fout = exynos_dsi_pll_find_pms(dsi, fin, freq, &p, &m, &s);
> > -     if (!fout) {
> > -             dev_err(dsi->dev,
> > -                     "failed to find PLL PMS for requested frequency\n");
> > -             return 0;
> > -     }
> > -     dev_dbg(dsi->dev, "PLL freq %lu, (p %d, m %d, s %d)\n", fout, p, m, s);
> > -
> > -     writel(driver_data->reg_values[PLL_TIMER],
> > -                     dsi->reg_base + driver_data->plltmr_reg);
> > -
> > -     reg = DSIM_PLL_EN | DSIM_PLL_P(p) | DSIM_PLL_M(m) | DSIM_PLL_S(s);
> > -
> > -     if (driver_data->has_freqband) {
> > -             static const unsigned long freq_bands[] = {
> > -                     100 * MHZ, 120 * MHZ, 160 * MHZ, 200 * MHZ,
> > -                     270 * MHZ, 320 * MHZ, 390 * MHZ, 450 * MHZ,
> > -                     510 * MHZ, 560 * MHZ, 640 * MHZ, 690 * MHZ,
> > -                     770 * MHZ, 870 * MHZ, 950 * MHZ,
> > -             };
> > -             int band;
> > -
> > -             for (band = 0; band < ARRAY_SIZE(freq_bands); ++band)
> > -                     if (fout < freq_bands[band])
> > -                             break;
> > -
> > -             dev_dbg(dsi->dev, "band %d\n", band);
> > -
> > -             reg |= DSIM_FREQ_BAND(band);
> > -     }
> > -
> > -     exynos_dsi_write(dsi, DSIM_PLLCTRL_REG, reg);
> > -
> > -     timeout = 1000;
> > -     do {
> > -             if (timeout-- == 0) {
> > -                     dev_err(dsi->dev, "PLL failed to stabilize\n");
> > -                     return 0;
> > -             }
> > -             reg = exynos_dsi_read(dsi, DSIM_STATUS_REG);
> > -     } while ((reg & DSIM_PLL_STABLE) == 0);
> > -
> > -     return fout;
> > -}
> > -
> > -static int exynos_dsi_enable_clock(struct exynos_dsi *dsi)
> > -{
> > -     unsigned long hs_clk, byte_clk, esc_clk;
> > -     unsigned long esc_div;
> > -     u32 reg;
> > -
> > -     hs_clk = exynos_dsi_set_pll(dsi, dsi->burst_clk_rate);
> > -     if (!hs_clk) {
> > -             dev_err(dsi->dev, "failed to configure DSI PLL\n");
> > -             return -EFAULT;
> > -     }
> > -
> > -     byte_clk = hs_clk / 8;
> > -     esc_div = DIV_ROUND_UP(byte_clk, dsi->esc_clk_rate);
> > -     esc_clk = byte_clk / esc_div;
> > -
> > -     if (esc_clk > 20 * MHZ) {
> > -             ++esc_div;
> > -             esc_clk = byte_clk / esc_div;
> > -     }
> > -
> > -     dev_dbg(dsi->dev, "hs_clk = %lu, byte_clk = %lu, esc_clk = %lu\n",
> > -             hs_clk, byte_clk, esc_clk);
> > -
> > -     reg = exynos_dsi_read(dsi, DSIM_CLKCTRL_REG);
> > -     reg &= ~(DSIM_ESC_PRESCALER_MASK | DSIM_LANE_ESC_CLK_EN_CLK
> > -                     | DSIM_LANE_ESC_CLK_EN_DATA_MASK | DSIM_PLL_BYPASS
> > -                     | DSIM_BYTE_CLK_SRC_MASK);
> > -     reg |= DSIM_ESC_CLKEN | DSIM_BYTE_CLKEN
> > -                     | DSIM_ESC_PRESCALER(esc_div)
> > -                     | DSIM_LANE_ESC_CLK_EN_CLK
> > -                     | DSIM_LANE_ESC_CLK_EN_DATA(BIT(dsi->lanes) - 1)
> > -                     | DSIM_BYTE_CLK_SRC(0)
> > -                     | DSIM_TX_REQUEST_HSCLK;
> > -     exynos_dsi_write(dsi, DSIM_CLKCTRL_REG, reg);
> > -
> > -     return 0;
> > -}
> > -
> > -static void exynos_dsi_set_phy_ctrl(struct exynos_dsi *dsi)
> > -{
> > -     const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
> > -     const unsigned int *reg_values = driver_data->reg_values;
> > -     u32 reg;
> > -
> > -     if (driver_data->has_freqband)
> > -             return;
> > -
> > -     /* B D-PHY: D-PHY Master & Slave Analog Block control */
> > -     reg = reg_values[PHYCTRL_ULPS_EXIT] | reg_values[PHYCTRL_VREG_LP] |
> > -             reg_values[PHYCTRL_SLEW_UP];
> > -     exynos_dsi_write(dsi, DSIM_PHYCTRL_REG, reg);
> > -
> > -     /*
> > -      * T LPX: Transmitted length of any Low-Power state period
> > -      * T HS-EXIT: Time that the transmitter drives LP-11 following a HS
> > -      *      burst
> > -      */
> > -     reg = reg_values[PHYTIMING_LPX] | reg_values[PHYTIMING_HS_EXIT];
> > -     exynos_dsi_write(dsi, DSIM_PHYTIMING_REG, reg);
> > -
> > -     /*
> > -      * T CLK-PREPARE: Time that the transmitter drives the Clock Lane LP-00
> > -      *      Line state immediately before the HS-0 Line state starting the
> > -      *      HS transmission
> > -      * T CLK-ZERO: Time that the transmitter drives the HS-0 state prior to
> > -      *      transmitting the Clock.
> > -      * T CLK_POST: Time that the transmitter continues to send HS clock
> > -      *      after the last associated Data Lane has transitioned to LP Mode
> > -      *      Interval is defined as the period from the end of T HS-TRAIL to
> > -      *      the beginning of T CLK-TRAIL
> > -      * T CLK-TRAIL: Time that the transmitter drives the HS-0 state after
> > -      *      the last payload clock bit of a HS transmission burst
> > -      */
> > -     reg = reg_values[PHYTIMING_CLK_PREPARE] |
> > -             reg_values[PHYTIMING_CLK_ZERO] |
> > -             reg_values[PHYTIMING_CLK_POST] |
> > -             reg_values[PHYTIMING_CLK_TRAIL];
> > -
> > -     exynos_dsi_write(dsi, DSIM_PHYTIMING1_REG, reg);
> > -
> > -     /*
> > -      * T HS-PREPARE: Time that the transmitter drives the Data Lane LP-00
> > -      *      Line state immediately before the HS-0 Line state starting the
> > -      *      HS transmission
> > -      * T HS-ZERO: Time that the transmitter drives the HS-0 state prior to
> > -      *      transmitting the Sync sequence.
> > -      * T HS-TRAIL: Time that the transmitter drives the flipped differential
> > -      *      state after last payload data bit of a HS transmission burst
> > -      */
> > -     reg = reg_values[PHYTIMING_HS_PREPARE] | reg_values[PHYTIMING_HS_ZERO] |
> > -             reg_values[PHYTIMING_HS_TRAIL];
> > -     exynos_dsi_write(dsi, DSIM_PHYTIMING2_REG, reg);
> > -}
> > -
> > -static void exynos_dsi_disable_clock(struct exynos_dsi *dsi)
> > -{
> > -     u32 reg;
> > -
> > -     reg = exynos_dsi_read(dsi, DSIM_CLKCTRL_REG);
> > -     reg &= ~(DSIM_LANE_ESC_CLK_EN_CLK | DSIM_LANE_ESC_CLK_EN_DATA_MASK
> > -                     | DSIM_ESC_CLKEN | DSIM_BYTE_CLKEN);
> > -     exynos_dsi_write(dsi, DSIM_CLKCTRL_REG, reg);
> > -
> > -     reg = exynos_dsi_read(dsi, DSIM_PLLCTRL_REG);
> > -     reg &= ~DSIM_PLL_EN;
> > -     exynos_dsi_write(dsi, DSIM_PLLCTRL_REG, reg);
> > -}
> > -
> > -static void exynos_dsi_enable_lane(struct exynos_dsi *dsi, u32 lane)
> > -{
> > -     u32 reg = exynos_dsi_read(dsi, DSIM_CONFIG_REG);
> > -     reg |= (DSIM_NUM_OF_DATA_LANE(dsi->lanes - 1) | DSIM_LANE_EN_CLK |
> > -                     DSIM_LANE_EN(lane));
> > -     exynos_dsi_write(dsi, DSIM_CONFIG_REG, reg);
> > -}
> > -
> > -static int exynos_dsi_init_link(struct exynos_dsi *dsi)
> > -{
> > -     const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
> > -     int timeout;
> > -     u32 reg;
> > -     u32 lanes_mask;
> > -
> > -     /* Initialize FIFO pointers */
> > -     reg = exynos_dsi_read(dsi, DSIM_FIFOCTRL_REG);
> > -     reg &= ~0x1f;
> > -     exynos_dsi_write(dsi, DSIM_FIFOCTRL_REG, reg);
> > -
> > -     usleep_range(9000, 11000);
> > -
> > -     reg |= 0x1f;
> > -     exynos_dsi_write(dsi, DSIM_FIFOCTRL_REG, reg);
> > -     usleep_range(9000, 11000);
> > -
> > -     /* DSI configuration */
> > -     reg = 0;
> > -
> > -     /*
> > -      * The first bit of mode_flags specifies display configuration.
> > -      * If this bit is set[= MIPI_DSI_MODE_VIDEO], dsi will support video
> > -      * mode, otherwise it will support command mode.
> > -      */
> > -     if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
> > -             reg |= DSIM_VIDEO_MODE;
> > -
> > -             /*
> > -              * The user manual describes that following bits are ignored in
> > -              * command mode.
> > -              */
> > -             if (!(dsi->mode_flags & MIPI_DSI_MODE_VSYNC_FLUSH))
> > -                     reg |= DSIM_MFLUSH_VS;
> > -             if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE)
> > -                     reg |= DSIM_SYNC_INFORM;
> > -             if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST)
> > -                     reg |= DSIM_BURST_MODE;
> > -             if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_AUTO_VERT)
> > -                     reg |= DSIM_AUTO_MODE;
> > -             if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_HSE)
> > -                     reg |= DSIM_HSE_MODE;
> > -             if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP))
> > -                     reg |= DSIM_HFP_MODE;
> > -             if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP))
> > -                     reg |= DSIM_HBP_MODE;
> > -             if (!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA))
> > -                     reg |= DSIM_HSA_MODE;
> > -     }
> > -
> > -     if (!(dsi->mode_flags & MIPI_DSI_MODE_NO_EOT_PACKET))
> > -             reg |= DSIM_EOT_DISABLE;
> > -
> > -     switch (dsi->format) {
> > -     case MIPI_DSI_FMT_RGB888:
> > -             reg |= DSIM_MAIN_PIX_FORMAT_RGB888;
> > -             break;
> > -     case MIPI_DSI_FMT_RGB666:
> > -             reg |= DSIM_MAIN_PIX_FORMAT_RGB666;
> > -             break;
> > -     case MIPI_DSI_FMT_RGB666_PACKED:
> > -             reg |= DSIM_MAIN_PIX_FORMAT_RGB666_P;
> > -             break;
> > -     case MIPI_DSI_FMT_RGB565:
> > -             reg |= DSIM_MAIN_PIX_FORMAT_RGB565;
> > -             break;
> > -     default:
> > -             dev_err(dsi->dev, "invalid pixel format\n");
> > -             return -EINVAL;
> > -     }
> > -
> > -     /*
> > -      * Use non-continuous clock mode if the periparal wants and
> > -      * host controller supports
> > -      *
> > -      * In non-continous clock mode, host controller will turn off
> > -      * the HS clock between high-speed transmissions to reduce
> > -      * power consumption.
> > -      */
> > -     if (driver_data->has_clklane_stop &&
> > -                     dsi->mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) {
> > -             reg |= DSIM_CLKLANE_STOP;
> > -     }
> > -     exynos_dsi_write(dsi, DSIM_CONFIG_REG, reg);
> > -
> > -     lanes_mask = BIT(dsi->lanes) - 1;
> > -     exynos_dsi_enable_lane(dsi, lanes_mask);
> > -
> > -     /* Check clock and data lane state are stop state */
> > -     timeout = 100;
> > -     do {
> > -             if (timeout-- == 0) {
> > -                     dev_err(dsi->dev, "waiting for bus lanes timed out\n");
> > -                     return -EFAULT;
> > -             }
> > -
> > -             reg = exynos_dsi_read(dsi, DSIM_STATUS_REG);
> > -             if ((reg & DSIM_STOP_STATE_DAT(lanes_mask))
> > -                 != DSIM_STOP_STATE_DAT(lanes_mask))
> > -                     continue;
> > -     } while (!(reg & (DSIM_STOP_STATE_CLK | DSIM_TX_READY_HS_CLK)));
> > -
> > -     reg = exynos_dsi_read(dsi, DSIM_ESCMODE_REG);
> > -     reg &= ~DSIM_STOP_STATE_CNT_MASK;
> > -     reg |= DSIM_STOP_STATE_CNT(driver_data->reg_values[STOP_STATE_CNT]);
> > -     exynos_dsi_write(dsi, DSIM_ESCMODE_REG, reg);
> > -
> > -     reg = DSIM_BTA_TIMEOUT(0xff) | DSIM_LPDR_TIMEOUT(0xffff);
> > -     exynos_dsi_write(dsi, DSIM_TIMEOUT_REG, reg);
> > -
> > -     return 0;
> > -}
> > -
> > -static void exynos_dsi_set_display_mode(struct exynos_dsi *dsi)
> > -{
> > -     struct drm_display_mode *m = &dsi->mode;
> > -     unsigned int num_bits_resol = dsi->driver_data->num_bits_resol;
> > -     u32 reg;
> > -
> > -     if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
> > -             reg = DSIM_CMD_ALLOW(0xf)
> > -                     | DSIM_STABLE_VFP(m->vsync_start - m->vdisplay)
> > -                     | DSIM_MAIN_VBP(m->vtotal - m->vsync_end);
> > -             exynos_dsi_write(dsi, DSIM_MVPORCH_REG, reg);
> > -
> > -             reg = DSIM_MAIN_HFP(m->hsync_start - m->hdisplay)
> > -                     | DSIM_MAIN_HBP(m->htotal - m->hsync_end);
> > -             exynos_dsi_write(dsi, DSIM_MHPORCH_REG, reg);
> > -
> > -             reg = DSIM_MAIN_VSA(m->vsync_end - m->vsync_start)
> > -                     | DSIM_MAIN_HSA(m->hsync_end - m->hsync_start);
> > -             exynos_dsi_write(dsi, DSIM_MSYNC_REG, reg);
> > -     }
> > -     reg =  DSIM_MAIN_HRESOL(m->hdisplay, num_bits_resol) |
> > -             DSIM_MAIN_VRESOL(m->vdisplay, num_bits_resol);
> > -
> > -     exynos_dsi_write(dsi, DSIM_MDRESOL_REG, reg);
> > -
> > -     dev_dbg(dsi->dev, "LCD size = %dx%d\n", m->hdisplay, m->vdisplay);
> > -}
> > -
> > -static void exynos_dsi_set_display_enable(struct exynos_dsi *dsi, bool enable)
> > -{
> > -     u32 reg;
> > -
> > -     reg = exynos_dsi_read(dsi, DSIM_MDRESOL_REG);
> > -     if (enable)
> > -             reg |= DSIM_MAIN_STAND_BY;
> > -     else
> > -             reg &= ~DSIM_MAIN_STAND_BY;
> > -     exynos_dsi_write(dsi, DSIM_MDRESOL_REG, reg);
> > -}
> > -
> > -static int exynos_dsi_wait_for_hdr_fifo(struct exynos_dsi *dsi)
> > -{
> > -     int timeout = 2000;
> > -
> > -     do {
> > -             u32 reg = exynos_dsi_read(dsi, DSIM_FIFOCTRL_REG);
> > -
> > -             if (!(reg & DSIM_SFR_HEADER_FULL))
> > -                     return 0;
> > -
> > -             if (!cond_resched())
> > -                     usleep_range(950, 1050);
> > -     } while (--timeout);
> > -
> > -     return -ETIMEDOUT;
> > -}
> > -
> > -static void exynos_dsi_set_cmd_lpm(struct exynos_dsi *dsi, bool lpm)
> > -{
> > -     u32 v = exynos_dsi_read(dsi, DSIM_ESCMODE_REG);
> > -
> > -     if (lpm)
> > -             v |= DSIM_CMD_LPDT_LP;
> > -     else
> > -             v &= ~DSIM_CMD_LPDT_LP;
> > -
> > -     exynos_dsi_write(dsi, DSIM_ESCMODE_REG, v);
> > -}
> > -
> > -static void exynos_dsi_force_bta(struct exynos_dsi *dsi)
> > -{
> > -     u32 v = exynos_dsi_read(dsi, DSIM_ESCMODE_REG);
> > -     v |= DSIM_FORCE_BTA;
> > -     exynos_dsi_write(dsi, DSIM_ESCMODE_REG, v);
> > -}
> > -
> > -static void exynos_dsi_send_to_fifo(struct exynos_dsi *dsi,
> > -                                     struct exynos_dsi_transfer *xfer)
> > -{
> > -     struct device *dev = dsi->dev;
> > -     struct mipi_dsi_packet *pkt = &xfer->packet;
> > -     const u8 *payload = pkt->payload + xfer->tx_done;
> > -     u16 length = pkt->payload_length - xfer->tx_done;
> > -     bool first = !xfer->tx_done;
> > -     u32 reg;
> > -
> > -     dev_dbg(dev, "< xfer %pK: tx len %u, done %u, rx len %u, done %u\n",
> > -             xfer, length, xfer->tx_done, xfer->rx_len, xfer->rx_done);
> > -
> > -     if (length > DSI_TX_FIFO_SIZE)
> > -             length = DSI_TX_FIFO_SIZE;
> > -
> > -     xfer->tx_done += length;
> > -
> > -     /* Send payload */
> > -     while (length >= 4) {
> > -             reg = get_unaligned_le32(payload);
> > -             exynos_dsi_write(dsi, DSIM_PAYLOAD_REG, reg);
> > -             payload += 4;
> > -             length -= 4;
> > -     }
> > -
> > -     reg = 0;
> > -     switch (length) {
> > -     case 3:
> > -             reg |= payload[2] << 16;
> > -             fallthrough;
> > -     case 2:
> > -             reg |= payload[1] << 8;
> > -             fallthrough;
> > -     case 1:
> > -             reg |= payload[0];
> > -             exynos_dsi_write(dsi, DSIM_PAYLOAD_REG, reg);
> > -             break;
> > -     }
> > -
> > -     /* Send packet header */
> > -     if (!first)
> > -             return;
> > -
> > -     reg = get_unaligned_le32(pkt->header);
> > -     if (exynos_dsi_wait_for_hdr_fifo(dsi)) {
> > -             dev_err(dev, "waiting for header FIFO timed out\n");
> > -             return;
> > -     }
> > -
> > -     if (NEQV(xfer->flags & MIPI_DSI_MSG_USE_LPM,
> > -              dsi->state & DSIM_STATE_CMD_LPM)) {
> > -             exynos_dsi_set_cmd_lpm(dsi, xfer->flags & MIPI_DSI_MSG_USE_LPM);
> > -             dsi->state ^= DSIM_STATE_CMD_LPM;
> > -     }
> > -
> > -     exynos_dsi_write(dsi, DSIM_PKTHDR_REG, reg);
> > -
> > -     if (xfer->flags & MIPI_DSI_MSG_REQ_ACK)
> > -             exynos_dsi_force_bta(dsi);
> > -}
> > -
> > -static void exynos_dsi_read_from_fifo(struct exynos_dsi *dsi,
> > -                                     struct exynos_dsi_transfer *xfer)
> > -{
> > -     u8 *payload = xfer->rx_payload + xfer->rx_done;
> > -     bool first = !xfer->rx_done;
> > -     struct device *dev = dsi->dev;
> > -     u16 length;
> > -     u32 reg;
> > -
> > -     if (first) {
> > -             reg = exynos_dsi_read(dsi, DSIM_RXFIFO_REG);
> > -
> > -             switch (reg & 0x3f) {
> > -             case MIPI_DSI_RX_GENERIC_SHORT_READ_RESPONSE_2BYTE:
> > -             case MIPI_DSI_RX_DCS_SHORT_READ_RESPONSE_2BYTE:
> > -                     if (xfer->rx_len >= 2) {
> > -                             payload[1] = reg >> 16;
> > -                             ++xfer->rx_done;
> > -                     }
> > -                     fallthrough;
> > -             case MIPI_DSI_RX_GENERIC_SHORT_READ_RESPONSE_1BYTE:
> > -             case MIPI_DSI_RX_DCS_SHORT_READ_RESPONSE_1BYTE:
> > -                     payload[0] = reg >> 8;
> > -                     ++xfer->rx_done;
> > -                     xfer->rx_len = xfer->rx_done;
> > -                     xfer->result = 0;
> > -                     goto clear_fifo;
> > -             case MIPI_DSI_RX_ACKNOWLEDGE_AND_ERROR_REPORT:
> > -                     dev_err(dev, "DSI Error Report: 0x%04x\n",
> > -                             (reg >> 8) & 0xffff);
> > -                     xfer->result = 0;
> > -                     goto clear_fifo;
> > -             }
> > -
> > -             length = (reg >> 8) & 0xffff;
> > -             if (length > xfer->rx_len) {
> > -                     dev_err(dev,
> > -                             "response too long (%u > %u bytes), stripping\n",
> > -                             xfer->rx_len, length);
> > -                     length = xfer->rx_len;
> > -             } else if (length < xfer->rx_len)
> > -                     xfer->rx_len = length;
> > -     }
> > -
> > -     length = xfer->rx_len - xfer->rx_done;
> > -     xfer->rx_done += length;
> > -
> > -     /* Receive payload */
> > -     while (length >= 4) {
> > -             reg = exynos_dsi_read(dsi, DSIM_RXFIFO_REG);
> > -             payload[0] = (reg >>  0) & 0xff;
> > -             payload[1] = (reg >>  8) & 0xff;
> > -             payload[2] = (reg >> 16) & 0xff;
> > -             payload[3] = (reg >> 24) & 0xff;
> > -             payload += 4;
> > -             length -= 4;
> > -     }
> > -
> > -     if (length) {
> > -             reg = exynos_dsi_read(dsi, DSIM_RXFIFO_REG);
> > -             switch (length) {
> > -             case 3:
> > -                     payload[2] = (reg >> 16) & 0xff;
> > -                     fallthrough;
> > -             case 2:
> > -                     payload[1] = (reg >> 8) & 0xff;
> > -                     fallthrough;
> > -             case 1:
> > -                     payload[0] = reg & 0xff;
> > -             }
> > -     }
> > -
> > -     if (xfer->rx_done == xfer->rx_len)
> > -             xfer->result = 0;
> > -
> > -clear_fifo:
> > -     length = DSI_RX_FIFO_SIZE / 4;
> > -     do {
> > -             reg = exynos_dsi_read(dsi, DSIM_RXFIFO_REG);
> > -             if (reg == DSI_RX_FIFO_EMPTY)
> > -                     break;
> > -     } while (--length);
> > -}
> > -
> > -static void exynos_dsi_transfer_start(struct exynos_dsi *dsi)
> > -{
> > -     unsigned long flags;
> > -     struct exynos_dsi_transfer *xfer;
> > -     bool start = false;
> > -
> > -again:
> > -     spin_lock_irqsave(&dsi->transfer_lock, flags);
> > -
> > -     if (list_empty(&dsi->transfer_list)) {
> > -             spin_unlock_irqrestore(&dsi->transfer_lock, flags);
> > -             return;
> > -     }
> > -
> > -     xfer = list_first_entry(&dsi->transfer_list,
> > -                                     struct exynos_dsi_transfer, list);
> > -
> > -     spin_unlock_irqrestore(&dsi->transfer_lock, flags);
> > -
> > -     if (xfer->packet.payload_length &&
> > -         xfer->tx_done == xfer->packet.payload_length)
> > -             /* waiting for RX */
> > -             return;
> > -
> > -     exynos_dsi_send_to_fifo(dsi, xfer);
> > -
> > -     if (xfer->packet.payload_length || xfer->rx_len)
> > -             return;
> > -
> > -     xfer->result = 0;
> > -     complete(&xfer->completed);
> > -
> > -     spin_lock_irqsave(&dsi->transfer_lock, flags);
> > -
> > -     list_del_init(&xfer->list);
> > -     start = !list_empty(&dsi->transfer_list);
> > -
> > -     spin_unlock_irqrestore(&dsi->transfer_lock, flags);
> > -
> > -     if (start)
> > -             goto again;
> > -}
> > -
> > -static bool exynos_dsi_transfer_finish(struct exynos_dsi *dsi)
> > -{
> > -     struct exynos_dsi_transfer *xfer;
> > -     unsigned long flags;
> > -     bool start = true;
> > -
> > -     spin_lock_irqsave(&dsi->transfer_lock, flags);
> > -
> > -     if (list_empty(&dsi->transfer_list)) {
> > -             spin_unlock_irqrestore(&dsi->transfer_lock, flags);
> > -             return false;
> > -     }
> > -
> > -     xfer = list_first_entry(&dsi->transfer_list,
> > -                                     struct exynos_dsi_transfer, list);
> > -
> > -     spin_unlock_irqrestore(&dsi->transfer_lock, flags);
> > -
> > -     dev_dbg(dsi->dev,
> > -             "> xfer %pK, tx_len %zu, tx_done %u, rx_len %u, rx_done %u\n",
> > -             xfer, xfer->packet.payload_length, xfer->tx_done, xfer->rx_len,
> > -             xfer->rx_done);
> > -
> > -     if (xfer->tx_done != xfer->packet.payload_length)
> > -             return true;
> > -
> > -     if (xfer->rx_done != xfer->rx_len)
> > -             exynos_dsi_read_from_fifo(dsi, xfer);
> > -
> > -     if (xfer->rx_done != xfer->rx_len)
> > -             return true;
> > -
> > -     spin_lock_irqsave(&dsi->transfer_lock, flags);
> > -
> > -     list_del_init(&xfer->list);
> > -     start = !list_empty(&dsi->transfer_list);
> > -
> > -     spin_unlock_irqrestore(&dsi->transfer_lock, flags);
> > -
> > -     if (!xfer->rx_len)
> > -             xfer->result = 0;
> > -     complete(&xfer->completed);
> > -
> > -     return start;
> > -}
> > -
> > -static void exynos_dsi_remove_transfer(struct exynos_dsi *dsi,
> > -                                     struct exynos_dsi_transfer *xfer)
> > +static void exynos_dsi_enable_irq(struct samsung_dsim *dsim)
> >   {
> > -     unsigned long flags;
> > -     bool start;
> > -
> > -     spin_lock_irqsave(&dsi->transfer_lock, flags);
> > -
> > -     if (!list_empty(&dsi->transfer_list) &&
> > -         xfer == list_first_entry(&dsi->transfer_list,
> > -                                  struct exynos_dsi_transfer, list)) {
> > -             list_del_init(&xfer->list);
> > -             start = !list_empty(&dsi->transfer_list);
> > -             spin_unlock_irqrestore(&dsi->transfer_lock, flags);
> > -             if (start)
> > -                     exynos_dsi_transfer_start(dsi);
> > -             return;
> > -     }
> > +     struct exynos_dsi *dsi = dsim->priv;
> >
> > -     list_del_init(&xfer->list);
> > -
> > -     spin_unlock_irqrestore(&dsi->transfer_lock, flags);
> > +     if (dsi->te_gpio)
> > +             enable_irq(gpiod_to_irq(dsi->te_gpio));
> >   }
> >
> > -static int exynos_dsi_transfer(struct exynos_dsi *dsi,
> > -                                     struct exynos_dsi_transfer *xfer)
> > +static void exynos_dsi_disable_irq(struct samsung_dsim *dsim)
> >   {
> > -     unsigned long flags;
> > -     bool stopped;
> > +     struct exynos_dsi *dsi = dsim->priv;
> >
> > -     xfer->tx_done = 0;
> > -     xfer->rx_done = 0;
> > -     xfer->result = -ETIMEDOUT;
> > -     init_completion(&xfer->completed);
> > -
> > -     spin_lock_irqsave(&dsi->transfer_lock, flags);
> > -
> > -     stopped = list_empty(&dsi->transfer_list);
> > -     list_add_tail(&xfer->list, &dsi->transfer_list);
> > -
> > -     spin_unlock_irqrestore(&dsi->transfer_lock, flags);
> > -
> > -     if (stopped)
> > -             exynos_dsi_transfer_start(dsi);
> > -
> > -     wait_for_completion_timeout(&xfer->completed,
> > -                                 msecs_to_jiffies(DSI_XFER_TIMEOUT_MS));
> > -     if (xfer->result == -ETIMEDOUT) {
> > -             struct mipi_dsi_packet *pkt = &xfer->packet;
> > -             exynos_dsi_remove_transfer(dsi, xfer);
> > -             dev_err(dsi->dev, "xfer timed out: %*ph %*ph\n", 4, pkt->header,
> > -                     (int)pkt->payload_length, pkt->payload);
> > -             return -ETIMEDOUT;
> > -     }
> > -
> > -     /* Also covers hardware timeout condition */
> > -     return xfer->result;
> > +     if (dsi->te_gpio)
> > +             disable_irq(gpiod_to_irq(dsi->te_gpio));
> >   }
> >
> > -static irqreturn_t exynos_dsi_irq(int irq, void *dev_id)
> > -{
> > -     struct exynos_dsi *dsi = dev_id;
> > -     u32 status;
> > -
> > -     status = exynos_dsi_read(dsi, DSIM_INTSRC_REG);
> > -     if (!status) {
> > -             static unsigned long int j;
> > -             if (printk_timed_ratelimit(&j, 500))
> > -                     dev_warn(dsi->dev, "spurious interrupt\n");
> > -             return IRQ_HANDLED;
> > -     }
> > -     exynos_dsi_write(dsi, DSIM_INTSRC_REG, status);
> > -
> > -     if (status & DSIM_INT_SW_RST_RELEASE) {
> > -             u32 mask = ~(DSIM_INT_RX_DONE | DSIM_INT_SFR_FIFO_EMPTY |
> > -                     DSIM_INT_SFR_HDR_FIFO_EMPTY | DSIM_INT_RX_ECC_ERR |
> > -                     DSIM_INT_SW_RST_RELEASE);
> > -             exynos_dsi_write(dsi, DSIM_INTMSK_REG, mask);
> > -             complete(&dsi->completed);
> > -             return IRQ_HANDLED;
> > -     }
> > -
> > -     if (!(status & (DSIM_INT_RX_DONE | DSIM_INT_SFR_FIFO_EMPTY |
> > -                     DSIM_INT_PLL_STABLE)))
> > -             return IRQ_HANDLED;
> > -
> > -     if (exynos_dsi_transfer_finish(dsi))
> > -             exynos_dsi_transfer_start(dsi);
> > -
> > -     return IRQ_HANDLED;
> > -}
> > +static const struct samsung_dsim_irq_ops samsung_dsim_exynos_host_irq = {
> > +     .enable = exynos_dsi_enable_irq,
> > +     .disable = exynos_dsi_disable_irq,
> > +};
> >
> >   static irqreturn_t exynos_dsi_te_irq_handler(int irq, void *dev_id)
> >   {
> > -     struct exynos_dsi *dsi = (struct exynos_dsi *)dev_id;
> > +     struct samsung_dsim *dsim = (struct samsung_dsim *)dev_id;
> > +     struct exynos_dsi *dsi = dsim->priv;
> >       struct drm_encoder *encoder = &dsi->encoder;
> >
> > -     if (dsi->state & DSIM_STATE_VIDOUT_AVAILABLE)
> > +     if (dsim->state & DSIM_STATE_VIDOUT_AVAILABLE)
> >               exynos_drm_crtc_te_handler(encoder->crtc);
> >
> >       return IRQ_HANDLED;
> >   }
> >
> > -static void exynos_dsi_enable_irq(struct exynos_dsi *dsi)
> > +static int exynos_dsi_register_te_irq(struct samsung_dsim *dsim, struct device *panel)
> >   {
> > -     enable_irq(dsi->irq);
> > -
> > -     if (dsi->te_gpio)
> > -             enable_irq(gpiod_to_irq(dsi->te_gpio));
> > -}
> > -
> > -static void exynos_dsi_disable_irq(struct exynos_dsi *dsi)
> > -{
> > -     if (dsi->te_gpio)
> > -             disable_irq(gpiod_to_irq(dsi->te_gpio));
> > -
> > -     disable_irq(dsi->irq);
> > -}
> > -
> > -static int exynos_dsi_init(struct exynos_dsi *dsi)
> > -{
> > -     const struct exynos_dsi_driver_data *driver_data = dsi->driver_data;
> > -
> > -     exynos_dsi_reset(dsi);
> > -     exynos_dsi_enable_irq(dsi);
> > -
> > -     if (driver_data->reg_values[RESET_TYPE] == DSIM_FUNCRST)
> > -             exynos_dsi_enable_lane(dsi, BIT(dsi->lanes) - 1);
> > -
> > -     exynos_dsi_enable_clock(dsi);
> > -     if (driver_data->wait_for_reset)
> > -             exynos_dsi_wait_for_reset(dsi);
> > -     exynos_dsi_set_phy_ctrl(dsi);
> > -     exynos_dsi_init_link(dsi);
> > -
> > -     return 0;
> > -}
> > -
> > -static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
> > -                                   struct device *panel)
> > -{
> > -     int ret;
> > +     struct exynos_dsi *dsi = dsim->priv;
> >       int te_gpio_irq;
> > +     int ret;
> >
> > -     dsi->te_gpio = gpiod_get_optional(panel, "te", GPIOD_IN);
> > +     dsi->te_gpio = devm_gpiod_get_optional(panel, "te", GPIOD_IN);
> >       if (!dsi->te_gpio) {
> >               return 0;
> >       } else if (IS_ERR(dsi->te_gpio)) {
> > -             dev_err(dsi->dev, "gpio request failed with %ld\n",
> > -                             PTR_ERR(dsi->te_gpio));
> > +             dev_err(dsim->dev, "gpio request failed with %ld\n",
> > +                     PTR_ERR(dsi->te_gpio));
> >               return PTR_ERR(dsi->te_gpio);
> >       }
> >
> >       te_gpio_irq = gpiod_to_irq(dsi->te_gpio);
> >
> >       ret = request_threaded_irq(te_gpio_irq, exynos_dsi_te_irq_handler, NULL,
> > -                                IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN, "TE", dsi);
> > +                                IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN, "TE",
> > +                                dsim);
> >       if (ret) {
> > -             dev_err(dsi->dev, "request interrupt failed with %d\n", ret);
> > +             dev_err(dsim->dev, "request interrupt failed with %d\n", ret);
> >               gpiod_put(dsi->te_gpio);
> >               return ret;
> >       }
> > @@ -1353,128 +85,28 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
> >       return 0;
> >   }
> >
> > -static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
> > +static void exynos_dsi_unregister_te_irq(struct samsung_dsim *dsim)
> >   {
> > +     struct exynos_dsi *dsi = dsim->priv;
> > +
> >       if (dsi->te_gpio) {
> >               free_irq(gpiod_to_irq(dsi->te_gpio), dsi);
> >               gpiod_put(dsi->te_gpio);
> >       }
> >   }
> >
> > -static void exynos_dsi_atomic_pre_enable(struct drm_bridge *bridge,
> > -                                      struct drm_bridge_state *old_bridge_state)
> > -{
> > -     struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> > -     int ret;
> > -
> > -     if (dsi->state & DSIM_STATE_ENABLED)
> > -             return;
> > -
> > -     ret = pm_runtime_resume_and_get(dsi->dev);
> > -     if (ret < 0) {
> > -             dev_err(dsi->dev, "failed to enable DSI device.\n");
> > -             return;
> > -     }
> > -
> > -     dsi->state |= DSIM_STATE_ENABLED;
> > -}
> > -
> > -static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
> > -                                  struct drm_bridge_state *old_bridge_state)
> > -{
> > -     struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> > -
> > -     exynos_dsi_set_display_mode(dsi);
> > -     exynos_dsi_set_display_enable(dsi, true);
> > -
> > -     dsi->state |= DSIM_STATE_VIDOUT_AVAILABLE;
> > -
> > -     return;
> > -}
> > -
> > -static void exynos_dsi_atomic_disable(struct drm_bridge *bridge,
> > -                                   struct drm_bridge_state *old_bridge_state)
> > -{
> > -     struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> > -
> > -     if (!(dsi->state & DSIM_STATE_ENABLED))
> > -             return;
> > -
> > -     dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
> > -}
> > -
> > -static void exynos_dsi_atomic_post_disable(struct drm_bridge *bridge,
> > -                                        struct drm_bridge_state *old_bridge_state)
> > -{
> > -     struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> > -
> > -     exynos_dsi_set_display_enable(dsi, false);
> > -
> > -     dsi->state &= ~DSIM_STATE_ENABLED;
> > -     pm_runtime_put_sync(dsi->dev);
> > -}
> > -
> > -static void exynos_dsi_mode_set(struct drm_bridge *bridge,
> > -                             const struct drm_display_mode *mode,
> > -                             const struct drm_display_mode *adjusted_mode)
> > -{
> > -     struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> > -
> > -     drm_mode_copy(&dsi->mode, adjusted_mode);
> > -}
> > -
> > -static int exynos_dsi_attach(struct drm_bridge *bridge,
> > -                          enum drm_bridge_attach_flags flags)
> > -{
> > -     struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> > -
> > -     return drm_bridge_attach(bridge->encoder, dsi->out_bridge, NULL, flags);
> > -}
> > -
> > -static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
> > -     .atomic_duplicate_state         = drm_atomic_helper_bridge_duplicate_state,
> > -     .atomic_destroy_state           = drm_atomic_helper_bridge_destroy_state,
> > -     .atomic_reset                   = drm_atomic_helper_bridge_reset,
> > -     .atomic_pre_enable              = exynos_dsi_atomic_pre_enable,
> > -     .atomic_enable                  = exynos_dsi_atomic_enable,
> > -     .atomic_disable                 = exynos_dsi_atomic_disable,
> > -     .atomic_post_disable            = exynos_dsi_atomic_post_disable,
> > -     .mode_set                       = exynos_dsi_mode_set,
> > -     .attach                         = exynos_dsi_attach,
> > -};
> > -
> > -MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
> > -
> > -static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
> > +static int exynos_dsi_host_attach(struct samsung_dsim *dsim,
> >                                 struct mipi_dsi_device *device)
> >   {
> > -     struct exynos_dsi *dsi = host_to_dsi(host);
> > -     struct device *dev = dsi->dev;
> > +     struct exynos_dsi *dsi = dsim->priv;
> >       struct drm_encoder *encoder = &dsi->encoder;
> >       struct drm_device *drm = encoder->dev;
> > -     struct drm_panel *panel;
> >       int ret;
> >
> > -     panel = of_drm_find_panel(device->dev.of_node);
> > -     if (!IS_ERR(panel)) {
> > -             dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
> > -     } else {
> > -             dsi->out_bridge = of_drm_find_bridge(device->dev.of_node);
> > -             if (!dsi->out_bridge)
> > -                     dsi->out_bridge = ERR_PTR(-EINVAL);
> > -     }
> > -
> > -     if (IS_ERR(dsi->out_bridge)) {
> > -             ret = PTR_ERR(dsi->out_bridge);
> > -             DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
> > -             return ret;
> > -     }
> > -
> > -     DRM_DEV_INFO(dev, "Attached %s device\n", device->name);
> > -
> > -     drm_bridge_add(&dsi->bridge);
> > -
> > -     drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
> > +     drm_bridge_attach(encoder, &dsim->bridge,
> > +                       list_first_entry_or_null(&encoder->bridge_chain,
> > +                                                struct drm_bridge,
> > +                                                chain_node), 0);
>
> The above change a part of dropped "drm: exynos: dsi: Restore proper
> bridge chain order" patch, we should keep the current code:
>
> "drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);"

Yes, I will fix it in v7.

Jagan.
