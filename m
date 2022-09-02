Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9D0C5AACBD
	for <lists+linux-samsung-soc@lfdr.de>; Fri,  2 Sep 2022 12:47:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233262AbiIBKri (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 2 Sep 2022 06:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232001AbiIBKrh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 2 Sep 2022 06:47:37 -0400
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 708ACBD745
        for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Sep 2022 03:47:32 -0700 (PDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20220902104726euoutp02d7ac244635b4f5f41dd493ad412ff180~RBV_5igow1250212502euoutp02e
        for <linux-samsung-soc@vger.kernel.org>; Fri,  2 Sep 2022 10:47:26 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20220902104726euoutp02d7ac244635b4f5f41dd493ad412ff180~RBV_5igow1250212502euoutp02e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1662115646;
        bh=YagpSWf3K7UL6OhQCW+uCZNYOT6YsGMcBT9nh2OsGCA=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=q2s+CYtbcg2/ouvi/08ys0J3UFV95lIMgKooyw3P5Y+zHqqTsDVlSMTgx3Il29YWB
         mGIy+IRZ+qtL6JBLWBRR2OAHnybDl8xgGvsMvKfm5cMWMxZTZ2yvZNc+A9HyWA2WVm
         sDYOMaRQ4fXzF7EepGfl5sfThYhIBJChdpB96HeU=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20220902104725eucas1p2d34a256cefe6d667079b594fc4499e1e~RBV_UER6C0435704357eucas1p24;
        Fri,  2 Sep 2022 10:47:25 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id EB.98.29727.D3FD1136; Fri,  2
        Sep 2022 11:47:25 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20220902104725eucas1p1a5c89dfd00867a5e5c6d15a59b221870~RBV95Xduw3256432564eucas1p1R;
        Fri,  2 Sep 2022 10:47:25 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220902104725eusmtrp12eb1b1c73430b86ff9b012512c8e6d6a~RBV94IQ9Y0645406454eusmtrp1d;
        Fri,  2 Sep 2022 10:47:25 +0000 (GMT)
X-AuditID: cbfec7f2-21dff7000001741f-7b-6311df3d0793
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id D8.CC.10862.C3FD1136; Fri,  2
        Sep 2022 11:47:24 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220902104723eusmtip27cf700a0ebf4b633498d5f108ca3d59b~RBV805Bqb0329203292eusmtip2M;
        Fri,  2 Sep 2022 10:47:23 +0000 (GMT)
Message-ID: <7511aa28-a944-d241-5bea-8404008e7dce@samsung.com>
Date:   Fri, 2 Sep 2022 12:47:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v4 02/12] drm: bridge: Add Samsung DSIM bridge driver
Content-Language: en-US
To:     Jagan Teki <jagan@amarulasolutions.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220829184031.1863663-3-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Se0xTVxzm9D5626VwKdWegGMJMYsuE1aV7UQZ2ZwzVw0Zi3Ey1M2u3tQ6
        KKS1jm1xikYDtTyGyKDI++WK0NGBYYyHPKRIw0OyFbBAZVQjSCGA89FNM8qdG/993/f7vvOd
        38mhMHEOGUip1CdYjVoeF0IK8evdzwY2vev0V7zVXhiExhw2DDnLlnD00HGVRL/9OU+itIp+
        AmU5M3H0yJJJogcTt3HUd3aWj1K/L+ejqsxWElmm7ATSe37EUO5AKw/NXkgGyPaHGUO9yedx
        1JF+EC0aJ5eHl6ZJdLtnEUNP/urD3lvL1Cw4CWZ+5DyfKTT24Ex2TxfB9BvGSeYX4zifyU/J
        I5iy5mke0/V7GcGM2ZtJxnnRymN+Lj/N1M018pj0ehNglizB0X6xwoijbJzqJKsJizwiPNZ3
        dldi05qkmuzHxBmwROsBRUF6K0xLEemBkBLTVwG0N9ThHHkEoCmrjeDIEoCpQ3+Dl4nBmu84
        vQpAw6CZx5EFAOfSM5bjAkpER8Li+9WkF+P0euhsq+Bzuj+8leda8ayhFdDY3Q28OIDeDcdv
        eVZ0jJbCO66ilUMltJmAblc28BLM22B4Ool5XSQtg3q3fqVBQO+ApXd7+Vz6NXiuIR/zBiCd
        J4S2mVrCO4D0Tlhedw9wOADOWOv5HF4HbZcMOLdbAnyeu4WTk6D94TWMw9vhWL+H9FoweiM0
        N4Vx8vvQ8Ljp36QvHHH7czfwhVnXf8A4WQRTLog59+vQaK39r7N9cAjLBCHGVa9iXLW9cdUu
        xv97iwFuAlJWp41XslqZmv0qVCuP1+rUylBFQrwFLH9d2wvrYiMomFkI7QA8CnQASGEhEtHl
        TlohFh2Vf/0Nq0n4XKOLY7UdIIjCQ6QiheonuZhWyk+wX7JsIqt5OeVRgsAzvDdfOb5trwB8
        mKBmlDUR0T4ZZMGhaUdsXty3PXdmOxVFFcptJnGErHMiTBC4Z5jdIz7dcOCU22THppIcxoHj
        I1PP19p3iVv8YyYPVXmOvBATrpHSG4d9NrdFCLb6SHnho1d6c252P7umK337XGrRhuadyZG5
        e4dRSVeU735K1V5mHXxV/mDd5hsay4bRjYUfdCqjJ+4f2PGO+WRrQIul+m7rxx/dkw2V/OoJ
        Ct7dF/W0uSl1X8MVx7hry2HJaMxcY70oXFL+qbtyXvTk4ClJaHXuJrZytnL7xUTJF+EtaSW6
        zwpy3JQqMb3/Zguc9IuPGv6kdn1whl9+W2yweX/MPlJaHIJrj8llb2AarfwfMEg6+ykEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrNKsWRmVeSWpSXmKPExsVy+t/xe7o29wWTDRY+tba4c/s0s8X9xZ9Z
        LF7fXsFmceXrezaL3qXnWC0m3Z/AYvFl0wQ2ixf3LrJYnG16w27ROXEJu8XyCfvYLDY9vsZq
        0fVrJbPFjPP7mCzetDUyWpx+tJ7Z4lRjK4vFob5oi0+zHgIlJ79ks7h44hOzxfffZ5kdxDzW
        frzP6vH+Riu7x7xZJ1g8ppw4wupxrucum8fOWXfZPWZ3zGT1WLznJZPHkauLWT3uXNvD5nG/
        +ziTx+Yl9R4b3+1g8ujbsorR4/MmuQD+KD2bovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj
        81grI1MlfTublNSczLLUIn27BL2Ms01uBbtEK9ZO+cbawPhZoIuRg0NCwETiwtq6LkYuDiGB
        pYwSl7cfY+ti5ASKy0icnNbACmELS/y51gUWFxJ4zyjR1G4MYvMK2EkseLYaLM4ioCJxf/9S
        doi4oMTJmU9YQGxRgWSJJQ33weYIC3hK3D35CyzOLCAucevJfCaQxSICW1klXm1bxwbiMAt8
        ZJS4NHkLO8RJZxkllpx8yQTSwiZgKNH1FuIMTgEniUUPTrFDjDKT6NraxQhhy0s0b53NPIFR
        aBaSS2Yh2TgLScssJC0LGFlWMYqklhbnpucWG+kVJ+YWl+al6yXn525iBKaabcd+btnBuPLV
        R71DjEwcjIcYJTiYlUR4px4WSBbiTUmsrEotyo8vKs1JLT7EaAoMjonMUqLJ+cBkl1cSb2hm
        YGpoYmZpYGppZqwkzutZ0JEoJJCeWJKanZpakFoE08fEwSnVwLR26eGvvRK2mjuU3xtLv3vx
        Q4hjy36p++2iMcVsCwWSLA/WStft2rrx2szbE+QPiXX5Mq6aNflkxZX5zjyz2W8x7Tr87IkB
        548vB3pn+Er1F1fK3kj+7ifrniK8WLX0BO++y7fW7Gz4rmWapBs+r+vBuzkHj+2x/HXwkXXY
        39p3v3KTnm3n/S1yMqbigu7K3wHXwuWmL0qy+H7jbJi98wK1rqWbvuyaMvUMs+fkM/8bhO38
        DA5FPz2ave7Nl7WTF0YfP/Rr6h3fX8ZrVW56cXrEaYRm8HqIWHMVpP+6PufWIVPeJG/GWTNu
        TXSYaWu39uYnua/LEr6c+H8yVnrxKZ5P8RpdPf2tdxcViT7M1fe+rsRSnJFoqMVcVJwIAMzy
        Wq6+AwAA
X-CMS-MailID: 20220902104725eucas1p1a5c89dfd00867a5e5c6d15a59b221870
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220829184118eucas1p2cda47fa166cafcb904800a55a5f66180
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220829184118eucas1p2cda47fa166cafcb904800a55a5f66180
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
        <CGME20220829184118eucas1p2cda47fa166cafcb904800a55a5f66180@eucas1p2.samsung.com>
        <20220829184031.1863663-3-jagan@amarulasolutions.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 29.08.2022 20:40, Jagan Teki wrote:
> Samsung MIPI DSIM controller is common DSI IP that can be used in various
> SoCs like Exynos, i.MX8M Mini/Nano.
>
> In order to access this DSI controller between various platform SoCs,
> the ideal way to incorporate this in the drm stack is via the drm bridge
> driver.
>
> This patch is trying to differentiate platform-specific and bridge driver
> code and keep maintaining the exynos_drm_dsi.c code as platform-specific
> glue code and samsung-dsim.c as a common bridge driver code.
>
> - Exynos specific glue code is exynos specific te_irq, host_attach, and
>    detach code along with conventional component_ops.
>
> - Samsung DSIM is a bridge driver which is common across all platforms and
>    the respective platform-specific glue will initialize at the end of the
>    probe. The platform-specific operations and other glue calls will invoke
>    on associate code areas.
>
> v4:
> * include Inki Dae in MAINTAINERS
> * remove dsi_driver probe in exynos_drm_drv to support multi-arch build

This breaks Exynos DRM completely as the Exynos DRM driver is not able 
to wait until the DSI driver is probed and registered as component.

I will show how to rework this the way it is done in 
drivers/gpu/drm/exynos/exynos_dp.c and 
drivers/gpu/drm/bridge/analogix/analogix_dp_core.c soon...

> v3:
> * restore gpio related fixes
> * restore proper bridge chain
> * rework initialization issue
> * fix header includes in proper way
>
> v2:
> * fixed exynos dsi driver conversion (Marek Szyprowski)
> * updated commit message
> * updated MAINTAINERS file
>
> v1:
> * don't maintain component_ops in bridge driver
> * don't maintain platform glue code in bridge driver
> * add platform-specific glue code and make a common bridge
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>   MAINTAINERS                             |    9 +
>   drivers/gpu/drm/bridge/Kconfig          |   12 +
>   drivers/gpu/drm/bridge/Makefile         |    1 +
>   drivers/gpu/drm/bridge/samsung-dsim.c   | 1686 ++++++++++++++++++++++
>   drivers/gpu/drm/exynos/Kconfig          |    1 +
>   drivers/gpu/drm/exynos/exynos_drm_drv.c |    3 -
>   drivers/gpu/drm/exynos/exynos_drm_drv.h |    1 -
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 1715 +----------------------
>   include/drm/bridge/samsung-dsim.h       |   99 ++
>   9 files changed, 1868 insertions(+), 1659 deletions(-)
>   create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
>   create mode 100644 include/drm/bridge/samsung-dsim.h
>
> ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

