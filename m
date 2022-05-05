Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD3C351B975
	for <lists+linux-samsung-soc@lfdr.de>; Thu,  5 May 2022 09:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233840AbiEEHwT (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 5 May 2022 03:52:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241934AbiEEHwS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 May 2022 03:52:18 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 213D432ED1
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 May 2022 00:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1651736919; x=1683272919;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F4dENisAXGRQZLCjLMdR77U0d0wTf0aLrQGcAe07jmg=;
  b=cE+l6MftVPYtBDnsaTktIHr3z3E3PlBSUdCMTok0AIFT2TOCgHWzcKM0
   V1oZZ/5PudcS1l4ra3rOV6zsi5ImjeQ3mZxcDHVpDmx+9IsVQjY9sBy8d
   COgsfG0yuLwVt0lR95A4sK8q176Crf/ta3PSAZyD1FoseUtB9ZWw2PS+y
   7zp2VA/lXirsw17R9mhxgpt+49Y3iTbfTPr/zDoHKfCldEqkKHAvDvAgm
   fh047ZbG6SHsEC6s0LtI+wJb18okN8AU2z/4AKkmbFiOosSokBZbor+Uv
   m9L291yXm/yTXY0ZlXQC8pAtqo1pOPDf0KUVQo4A0Xch5GtOZPR/T9xp0
   w==;
X-IronPort-AV: E=Sophos;i="5.91,200,1647298800"; 
   d="scan'208";a="23686397"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 05 May 2022 09:48:37 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 05 May 2022 09:48:37 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 05 May 2022 09:48:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1651736917; x=1683272917;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F4dENisAXGRQZLCjLMdR77U0d0wTf0aLrQGcAe07jmg=;
  b=COoldgr9FO3FV21yHf7gZp5ZmhOoIWrWCP0OmGxmUxfFh2DQYvSpOlKq
   vuPxResIGjMeoBOY/sZ6+x4Ux27GqIdD2HnAn4EgfOd7PMTkITUVETLYR
   zku7qfFROcjiN87YPJSsCaJfXd3ol8gRVBwd4F/nDeEsh6nyg49vzNqy3
   zHJZv3cmlbWgXWE6ibUGXMVohVHWAmH52h4l/NwG1RTtHeRp/RfsgXLof
   Qc140HEPK1+x958abZIi9LogQL4U1NIcUcct7r7D0g58sYi59zdxMxNpS
   SogtCeo0uB/OSOjEwVb0qz5AO+6FIFvmbsmQGE0TiuNHL7r2VZv5iRDWl
   g==;
X-IronPort-AV: E=Sophos;i="5.91,200,1647298800"; 
   d="scan'208";a="23686396"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 05 May 2022 09:48:37 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id CF0DD280075;
        Thu,  5 May 2022 09:48:36 +0200 (CEST)
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
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Subject: Re: (EXT) Re: (EXT) [PATCH v2 00/12] drm: bridge: Add Samsung MIPI DSIM bridge
Date:   Thu, 05 May 2022 09:48:34 +0200
Message-ID: <3431938.iIbC2pHGDl@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <CAMty3ZAuTzdzj9v4weqJfxQKhM57XuwSzSAX86NHTcCp14uBBw@mail.gmail.com>
References: <20220504114021.33265-1-jagan@amarulasolutions.com> <2184168.iZASKD2KPV@steina-w> <CAMty3ZAuTzdzj9v4weqJfxQKhM57XuwSzSAX86NHTcCp14uBBw@mail.gmail.com>
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

thanks for the quick response.

Am Donnerstag, 5. Mai 2022, 09:38:48 CEST schrieb Jagan Teki:
> On Thu, May 5, 2022 at 12:57 PM Alexander Stein
> 
> <alexander.stein@ew.tq-group.com> wrote:
> > Hello Jagan,
> > 
> > thanks for the second version of this patchset.
> > 
> > Am Mittwoch, 4. Mai 2022, 13:40:09 CEST schrieb Jagan Teki:
> > > This series supports common bridge support for Samsung MIPI DSIM
> > > which is used in Exynos and i.MX8MM SoC's.
> > > 
> > > Previous v1 can be available here [1].
> > > 
> > > The final bridge supports both the Exynos and i.MX8MM DSI devices.
> > > 
> > > On, summary this patch-set break the entire DSIM driver into
> > > - platform specific glue code for platform ops, component_ops.
> > > - common bridge driver which handle platform glue init and invoke.
> > > 
> > > Patch 0000:   Samsung DSIM bridge
> > > 
> > > Patch 0001:   Common lookup code for OF-graph or child
> > > 
> > > Patch 0002:   platform init flag via driver_data
> > > 
> > > Patch 0003/10:  bridge fixes, atomic API's
> > > 
> > > Patch 0011:   document fsl,imx8mm-mipi-dsim
> > > 
> > > Patch 0012:   add i.MX8MM DSIM support
> > > 
> > > Tested in Engicam i.Core MX8M Mini SoM.
> > > 
> > > Anyone interested, please have a look on this repo [2]
> > > 
> > > [2] https://github.com/openedev/kernel/tree/imx8mm-dsi-v2
> > > [1]
> > > https://patchwork.kernel.org/project/dri-devel/cover/20220408162108.1845
> > > 83-> 1-jagan@amarulasolutions.com/
> > > 
> > > Any inputs?
> > 
> > I was able to get my LVDS display running using this driver and an LVDS
> > bridge. Actually my setup is similar to yours. My chain is like this:
> > MIPI-DSI -> sn65dsi83 -> LVDS panel
> > I noticed some things though:
> > My setup only works if I use less than 4 lanes. See [1]. When using 4
> > lanes
> > the image is flickering, but the content is "visible". Your DT has only 2
> > lanes configured, do you have the possibility to use 4 lanes? I have no
> > idea how to tackle this. It might be the DSIM side or the bridge side.
> > Apparently the downstream kernel from NXP supports 4 lanes, if I can trust
> > the config. I have no way to verify this though.
> 
> What is dsi_lvds_bridge node? have you added your dts changes on top
> of imx8mm-dsi-v2 branch I'm pointing it.

I cherry-picked your commits and applied them on (currently) next-20220504.
Maybe you missed the links at the end of my mail. The branch I am talking 
about is https://github.com/tq-steina/linux/commits/imx8mm-dsi-lvds
This includes your commits as well as my additions.

> I will check 4 lanes and let you know.

Great, thanks.

> > Another thing is I get the following warning
> > 
> > > sn65dsi83 2-002d: Unsupported LVDS bus format 0x100a, please check
> > > output
> > 
> > bridge driver. Falling back to SPWG24.
> 
> This couldn't be much affected but will fix it.
> 
> > This seems to be caused by a wrong bridge chain. Using commit 81e80429 at
> > [2]> 
> > I get the following output:
> > > bridge chain: /soc@0/bus@30800000/i2c@30a40000/dsi-lvds-bridge@2d -> /
> > 
> > panel_lvds0 -> /soc@0/bus@32c00000/dsi@32e10000 ->
> > Which seems weird. I would have expected something like
> > dsi@32e10000 -> dsi-lvds-bridge@2d -> panel_lvds0
> > Do you happen to see somthing similar? But this is completely unrelated to
> > your patchset though.
> 
> Can you share the link to the exact commit?

This is the commit introducing this output:
https://github.com/tq-steina/linux/commit/
81e80429341cd0a4f119ec9cf50839498915443b

Best regards,
Alexander



