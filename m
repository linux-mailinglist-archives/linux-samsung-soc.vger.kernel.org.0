Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1F63951B8FE
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  5 May 2022 09:29:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344198AbiEEHbg (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 5 May 2022 03:31:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344241AbiEEHbR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 May 2022 03:31:17 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0FB249697
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 May 2022 00:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1651735622; x=1683271622;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=16InVKGXSkMBY+wpgnTYDz/Uc5LhgfhRL3emboF3uII=;
  b=kd+KWZjNKfLe6GHosLzmM99iTu4k6I5ZtQs0kGbaG/l5w9+Wx/f0irs4
   LYEXbrJUsnK4pIWvehhxPNaKcBzArAA6yUxrv5G3aIkkZ0ocvr/rWSCmf
   2GfSBF/z3eZS+5UmWcFUDUqtXSmKwsyxSlrleksNau6acKLwWKvZltDPV
   eDJJ9HH9T4kf2cYXTlpM0JMAsLpsI8gHhaRi8lC7raSYdL41bZ8WPmNYJ
   mGK25hWay/Xj6mMOUyxXcC0V235GzSD6LVdRv/YAAQTDZyR5nFAI1iLn2
   U1GWONXUgay0W/cyEEjffIHtkmG7eSdhubZ1TbwzkX6I8mizEnHoSWZm1
   g==;
X-IronPort-AV: E=Sophos;i="5.91,200,1647298800"; 
   d="scan'208";a="23685580"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 05 May 2022 09:27:00 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 05 May 2022 09:27:00 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 05 May 2022 09:27:00 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1651735620; x=1683271620;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=16InVKGXSkMBY+wpgnTYDz/Uc5LhgfhRL3emboF3uII=;
  b=Xcrecb/Xhpr5A1T4uQQ2xXBehLG49Uxy33Wq9Z1MlLa2U6woNjC1FHq3
   WLynJ2VJ00/juM7UP/NqtCFYD5PTdlPW8ZgdwIRJusvGf6Fv/I41GRBFR
   Xy4MSIBWuWt2d99C90cf+qZ4/ZRHQkQa65yD7fKWOwL7BqpRX6PaPtNic
   J6dF98DTgr2yF7RSfVN2xxFa++ECj0aVvR/GGGk2FEIINPnu78cbRBTjJ
   FfyhM2HNS57gIEw8kETaO8+sEuQZ2Vb7Az32LuqCCkTgBFyv/qpa79Mwo
   YcsgjT68djHKGdiQ60iCIQUQrVY+xaOfwIRW6iTj1eLQpjjQu92Jx5Ond
   w==;
X-IronPort-AV: E=Sophos;i="5.91,200,1647298800"; 
   d="scan'208";a="23685578"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 05 May 2022 09:27:00 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 35798280070;
        Thu,  5 May 2022 09:27:00 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
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
        linux-arm-kernel@lists.infradead.org,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: (EXT) [PATCH v2 00/12] drm: bridge: Add Samsung MIPI DSIM bridge
Date:   Thu, 05 May 2022 09:26:57 +0200
Message-ID: <2184168.iZASKD2KPV@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220504114021.33265-1-jagan@amarulasolutions.com>
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hello Jagan,

thanks for the second version of this patchset.

Am Mittwoch, 4. Mai 2022, 13:40:09 CEST schrieb Jagan Teki:
> This series supports common bridge support for Samsung MIPI DSIM
> which is used in Exynos and i.MX8MM SoC's.
> 
> Previous v1 can be available here [1].
> 
> The final bridge supports both the Exynos and i.MX8MM DSI devices.
> 
> On, summary this patch-set break the entire DSIM driver into
> - platform specific glue code for platform ops, component_ops.
> - common bridge driver which handle platform glue init and invoke.
> 
> Patch 0000: 	Samsung DSIM bridge
> 
> Patch 0001:	Common lookup code for OF-graph or child
> 
> Patch 0002: 	platform init flag via driver_data
> 
> Patch 0003/10:  bridge fixes, atomic API's
> 
> Patch 0011:	document fsl,imx8mm-mipi-dsim
> 
> Patch 0012:	add i.MX8MM DSIM support
> 
> Tested in Engicam i.Core MX8M Mini SoM.
> 
> Anyone interested, please have a look on this repo [2]
> 
> [2] https://github.com/openedev/kernel/tree/imx8mm-dsi-v2
> [1]
> https://patchwork.kernel.org/project/dri-devel/cover/20220408162108.184583-> 1-jagan@amarulasolutions.com/
> 
> Any inputs?

I was able to get my LVDS display running using this driver and an LVDS 
bridge. Actually my setup is similar to yours. My chain is like this:
MIPI-DSI -> sn65dsi83 -> LVDS panel
I noticed some things though:
My setup only works if I use less than 4 lanes. See [1]. When using 4 lanes 
the image is flickering, but the content is "visible". Your DT has only 2 
lanes configured, do you have the possibility to use 4 lanes? I have no idea 
how to tackle this. It might be the DSIM side or the bridge side.
Apparently the downstream kernel from NXP supports 4 lanes, if I can trust the 
config. I have no way to verify this though.

Another thing is I get the following warning
> sn65dsi83 2-002d: Unsupported LVDS bus format 0x100a, please check output 
bridge driver. Falling back to SPWG24.

This seems to be caused by a wrong bridge chain. Using commit 81e80429 at [2] 
I get the following output:
> bridge chain: /soc@0/bus@30800000/i2c@30a40000/dsi-lvds-bridge@2d -> /
panel_lvds0 -> /soc@0/bus@32c00000/dsi@32e10000 ->
Which seems weird. I would have expected something like
dsi@32e10000 -> dsi-lvds-bridge@2d -> panel_lvds0
Do you happen to see somthing similar? But this is completely unrelated to 
your patchset though.

Also unloading the samsung_dsim driver raises a regulator warning:
------------[ cut here ]------------                                                                                                 
WARNING: CPU: 2 PID: 381 at drivers/regulator/core.c:2275 _regulator_put.part.
0+0x38/0x40                                            
Modules linked in: caam_jr caamhash_desc caamalg_desc crypto_engine rng_core 
authenc libdes hantro_vpu(C) v4l2_vp9 v4l2_h264 snd_soc_
fsl_asoc_card crct10dif_ce snd_soc_tlv320aic32x4_spi videobuf2_dma_contig 
phy_fsl_imx8m_pcie v4l2_mem2mem samsung_dsim(-) snd_soc_tlv
320aic32x4_i2c snd_soc_tlv320aic32x4 caam error imx8mm_thermal imx_sdma 
pwm_beeper fuse ipv6                                         
CPU: 2 PID: 381 Comm: modprobe Tainted: G         C        5.18.0-rc5-
next-20220504+ #204 03c84d7b1600b734091c3159e797071c8f65061c   
Hardware name: TQ-Systems GmbH i.MX8MM TQMa8MxML on MBa8Mx (DT)                                                                      
pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)                                                                      
pc : _regulator_put.part.0+0x38/0x40                                                                                                 
lr : regulator_bulk_free+0x58/0x80                                                                                                   
sp : ffff80000aeb3af0                                                                                                                
x29: ffff80000aeb3af0 x28: ffff00000360bb00 x27: 0000000000000000                                                                    
x26: ffff800009bad438 x25: ffff000000276890 x24: 0000000000000009                                                                    
x23: ffff00000360bb00 x22: ffff000003543268 x21: ffff800009b85280                                                                    
x20: ffff000005587800 x19: ffff000003543238 x18: 0000000000000000                                                                    
x17: 0000000000000000 x16: 0000000000000000 x15: 6d3d4d4554535953                                                                    
x14: 42555300302e6973 x13: 4553003338697364 x12: 0000000000000000                                                                    
x11: 0000000000000000 x10: 0000000000000ab0 x9 : ffff80000aeb38f0
x8 : ffff00000360c610 x7 : 0000000000000000 x6 : 0000000000000000
x5 : ffff8000092dc468 x4 : ffff00000360bb00 x3 : 0000000000000000
x2 : ffff00000360bb00 x1 : 0000000000000001 x0 : ffff000005587800
Call trace:
 _regulator_put.part.0+0x38/0x40
 regulator_bulk_free+0x58/0x80
 devm_regulator_bulk_release+0x18/0x20
 devres_release_all+0xa0/0x100
 device_unbind_cleanup+0x14/0x60
 device_release_driver_internal+0x214/0x2b4
 driver_detach+0x4c/0xe0
 bus_remove_driver+0x68/0x120
 driver_unregister+0x2c/0x5c
 platform_driver_unregister+0x10/0x20
 samsung_mipi_dsim_exit+0x18/0xd20 [samsung_dsim 
f08bbdb06ba3e4aef07da9615e8193297aa99358]
 __do_sys_delete_module.constprop.0+0x134/0x1e4
 __arm64_sys_delete_module+0x10/0x1c
 invoke_syscall+0x6c/0xf0
 el0_svc_common.constprop.0+0xc0/0xe0
 do_el0_svc+0x24/0x30
 el0_svc+0x3c/0xfc
 el0t_64_sync_handler+0xb0/0xb4
 el0t_64_sync+0x148/0x14c
---[ end trace 0000000000000000 ]---

Best regards,
Alexander

[1] https://github.com/tq-steina/linux/blob/imx8mm-dsi-lvds/arch/arm64/boot/
dts/freescale/imx8mm-tqma8mqml-mba8mx-lvds.dts#L45-L46
[2] https://github.com/tq-steina/linux/commit/
81e80429341cd0a4f119ec9cf50839498915443b



