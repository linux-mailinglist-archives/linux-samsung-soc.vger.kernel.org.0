Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4E4B30E418
	for <lists+linux-samsung-soc@lfdr.de>; Wed,  3 Feb 2021 21:33:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232185AbhBCUct (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Wed, 3 Feb 2021 15:32:49 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:32867 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232026AbhBCUcc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 3 Feb 2021 15:32:32 -0500
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1l7OoZ-0002Cg-9A; Wed, 03 Feb 2021 21:31:51 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1l7OoW-0000Yf-PO; Wed, 03 Feb 2021 21:31:48 +0100
Date:   Wed, 3 Feb 2021 21:31:48 +0100
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     Andrzej Hajda <a.hajda@samsung.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
        narmstrong@baylibre.com, b.zolnierkie@samsung.com,
        sw0312.kim@samsung.com, krzk@kernel.org,
        dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
        sylvester.nawrocki@gmail.com, Laurent.pinchart@ideasonboard.com,
        l.stach@pengutronix.de, frieder.schrempf@kontron.de,
        festevam@gmail.com, abel.vesa@nxp.com, aisheng.dong@nxp.com,
        shawnguo@kernel.org, linux-imx@nxp.com, tharvey@gateworks.com,
        ch@denx.de, aford173@gmail.com, marex@denx.de
Subject: Re: [PATCH v2 10/16] drm/exynos: implement a drm bridge
Message-ID: <20210203203148.GA29287@pengutronix.de>
References: <20200911135413.3654800-1-m.tretter@pengutronix.de>
 <CGME20200911164817eucas1p2a0907a3d4c5c0a8d8dc4bc97301f1517@eucas1p2.samsung.com>
 <20200911135413.3654800-11-m.tretter@pengutronix.de>
 <381a553a-5bc6-d070-fc40-7d48fdb89ca9@samsung.com>
 <650db263-df3f-17fa-0298-62cd821b5274@samsung.com>
 <20200914200145.GA8098@pengutronix.de>
 <a5e5e6d5-95a2-1f5a-94a2-27ec3d12e781@samsung.com>
 <2d7f0e5e-070c-971e-1e4f-47a60f00d934@samsung.com>
 <20210201163314.GB26987@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210201163314.GB26987@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 21:01:54 up 63 days,  8:28, 89 users,  load average: 0.90, 0.45,
 0.22
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-samsung-soc@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 01 Feb 2021 17:33:14 +0100, Michael Tretter wrote:
> On Tue, 15 Sep 2020 21:40:40 +0200, Andrzej Hajda wrote:
> > W dniu 14.09.2020 o 23:19, Andrzej Hajda pisze:
> > > On 14.09.2020 22:01, Michael Tretter wrote:
> > >> On Mon, 14 Sep 2020 14:31:19 +0200, Marek Szyprowski wrote:
> > >>> On 14.09.2020 10:29, Marek Szyprowski wrote:
> > >>>> On 11.09.2020 15:54, Michael Tretter wrote:
> > >>>>> Make the exynos_dsi driver a full drm bridge that can be found and 
> > >>>>> used
> > >>>>> from other drivers.
> > >>>>>
> > >>>>> Other drivers can only attach to the bridge, if a mipi dsi device
> > >>>>> already attached to the bridge. This allows to defer the probe of the
> > >>>>> display pipe until the downstream bridges are available, too.
> > >>>>>
> > >>>>> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> > >>>> This one (and the whole series applied) still fails on Exynos boards:
> > >>>>
> > >>>> [drm] Exynos DRM: using 11c00000.fimd device for DMA mapping 
> > >>>> operations
> > >>>> exynos-drm exynos-drm: bound 11c00000.fimd (ops fimd_component_ops)
> > >>>> OF: graph: no port node found in /soc/dsi@11c80000
> > >>>> 8<--- cut here ---
> > >>>> Unable to handle kernel NULL pointer dereference at virtual address 
> > >>>> 00000084
> > >>>> pgd = (ptrval)
> > >>>> [00000084] *pgd=00000000
> > >>>> Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> > >>>> Modules linked in:
> > >>>> CPU: 1 PID: 1 Comm: swapper/0 Not tainted
> > >>>> 5.9.0-rc4-next-20200911-00010-g417dc70d70ec #1608
> > >>>> Hardware name: Samsung Exynos (Flattened Device Tree)
> > >>>> PC is at drm_bridge_attach+0x18/0x164
> > >>>> LR is at exynos_dsi_bind+0x88/0xa8
> > >>>> pc : [<c0628c08>]    lr : [<c064d560>]    psr: 20000013
> > >>>> sp : ef0dfca8  ip : 00000002  fp : c13190e0
> > >>>> r10: 00000000  r9 : ee46d580  r8 : c13190e0
> > >>>> r7 : ee438800  r6 : 00000018  r5 : ef253810  r4 : ef39e840
> > >>>> r3 : 00000000  r2 : 00000018  r1 : ef39e888  r0 : ef39e840
> > >>>> Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> > >>>> Control: 10c5387d  Table: 4000404a  DAC: 00000051
> > >>>> Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
> > >>>> Stack: (0xef0dfca8 to 0xef0e0000)
> > >>>> ...
> > >>>> [<c0628c08>] (drm_bridge_attach) from [<c064d560>]
> > >>>> (exynos_dsi_bind+0x88/0xa8)
> > >>>> [<c064d560>] (exynos_dsi_bind) from [<c066a800>]
> > >>>> (component_bind_all+0xfc/0x290)
> > >>>> [<c066a800>] (component_bind_all) from [<c0649dc0>]
> > >>>> (exynos_drm_bind+0xe4/0x19c)
> > >>>> [<c0649dc0>] (exynos_drm_bind) from [<c066ad74>]
> > >>>> (try_to_bring_up_master+0x1e4/0x2c4)
> > >>>> [<c066ad74>] (try_to_bring_up_master) from [<c066b2b4>]
> > >>>> (component_master_add_with_match+0xd4/0x108)
> > >>>> [<c066b2b4>] (component_master_add_with_match) from [<c0649ae8>]
> > >>>> (exynos_drm_platform_probe+0xe4/0x110)
> > >>>> [<c0649ae8>] (exynos_drm_platform_probe) from [<c0674e6c>]
> > >>>> (platform_drv_probe+0x6c/0xa4)
> > >>>> [<c0674e6c>] (platform_drv_probe) from [<c067242c>]
> > >>>> (really_probe+0x200/0x4fc)
> > >>>> [<c067242c>] (really_probe) from [<c06728f0>]
> > >>>> (driver_probe_device+0x78/0x1fc)
> > >>>> [<c06728f0>] (driver_probe_device) from [<c0672cd8>]
> > >>>> (device_driver_attach+0x58/0x60)
> > >>>> [<c0672cd8>] (device_driver_attach) from [<c0672dbc>]
> > >>>> (__driver_attach+0xdc/0x174)
> > >>>> [<c0672dbc>] (__driver_attach) from [<c06701b4>]
> > >>>> (bus_for_each_dev+0x68/0xb4)
> > >>>> [<c06701b4>] (bus_for_each_dev) from [<c06714e8>]
> > >>>> (bus_add_driver+0x158/0x214)
> > >>>> [<c06714e8>] (bus_add_driver) from [<c0673c1c>] 
> > >>>> (driver_register+0x78/0x110)
> > >>>> [<c0673c1c>] (driver_register) from [<c0649ca8>]
> > >>>> (exynos_drm_init+0xe4/0x118)
> > >>>> [<c0649ca8>] (exynos_drm_init) from [<c0102484>]
> > >>>> (do_one_initcall+0x8c/0x42c)
> > >>>> [<c0102484>] (do_one_initcall) from [<c11011c0>]
> > >>>> (kernel_init_freeable+0x190/0x1dc)
> > >>>> [<c11011c0>] (kernel_init_freeable) from [<c0af7880>]
> > >>>> (kernel_init+0x8/0x118)
> > >>>> [<c0af7880>] (kernel_init) from [<c0100114>] (ret_from_fork+0x14/0x20)
> > >>>> Exception stack(0xef0dffb0 to 0xef0dfff8)
> > >>>> ...
> > >>>> ---[ end trace ee27f313f9ed9da1 ]---
> > >>>>
> > >>>> # arm-linux-gnueabi-addr2line -e vmlinux c0628c08
> > >>>> drivers/gpu/drm/drm_bridge.c:184 (discriminator 1)
> > >>>>
> > >>>> I will try to debug it a bit more today.
> > >>> The above crash has been caused by lack of in_bridge initialization to
> > >>> NULL in exynos_dsi_bind() in this patch. However, fixing it reveals
> > >>> another issue:
> > >>>
> > >>> [drm] Exynos DRM: using 11c00000.fimd device for DMA mapping operations
> > >>> exynos-drm exynos-drm: bound 11c00000.fimd (ops fimd_component_ops)
> > >>> OF: graph: no port node found in /soc/dsi@11c80000
> > >>> 8<--- cut here ---
> > >>> Unable to handle kernel NULL pointer dereference at virtual address 
> > >>> 00000280
> > >>> pgd = (ptrval)
> > >>> [00000280] *pgd=00000000
> > >>> Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> > >>> Modules linked in:
> > >>> CPU: 0 PID: 1 Comm: swapper/0 Not tainted
> > >>> 5.9.0-rc4-next-20200911-00010-g417dc70d70ec-dirty #1613
> > >>> Hardware name: Samsung Exynos (Flattened Device Tree)
> > >>> PC is at __mutex_lock+0x54/0xb18
> > >>> LR is at lock_is_held_type+0x80/0x138
> > >>> pc : [<c0afc920>]    lr : [<c0af63e8>]    psr: 60000013
> > >>> sp : ef0dfd30  ip : 33937b74  fp : c13193c8
> > >>> r10: c1208eec  r9 : 00000000  r8 : ee45f808
> > >>> r7 : c19561a4  r6 : 00000000  r5 : 00000000  r4 : 0000024c
> > >>> r3 : 00000000  r2 : 00204140  r1 : c124f13c  r0 : 00000000
> > >>> Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment none
> > >>> Control: 10c5387d  Table: 4000404a  DAC: 00000051
> > >>> Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
> > >>> Stack: (0xef0dfd30 to 0xef0e0000)
> > >>> ...
> > >>> [<c0afc920>] (__mutex_lock) from [<c0afd400>] 
> > >>> (mutex_lock_nested+0x1c/0x24)
> > >>> [<c0afd400>] (mutex_lock_nested) from [<c064d4b8>]
> > >>> (__exynos_dsi_host_attach+0x20/0x6c)
> > >>> [<c064d4b8>] (__exynos_dsi_host_attach) from [<c064d914>]
> > >>> (exynos_dsi_host_attach+0x70/0x194)
> > >>> [<c064d914>] (exynos_dsi_host_attach) from [<c0656b64>]
> > >>> (s6e8aa0_probe+0x1b0/0x218)
> > >>> [<c0656b64>] (s6e8aa0_probe) from [<c0672530>] 
> > >>> (really_probe+0x200/0x4fc)
> > >>> [<c0672530>] (really_probe) from [<c06729f4>]
> > >>> (driver_probe_device+0x78/0x1fc)
> > >>> [<c06729f4>] (driver_probe_device) from [<c0672ddc>]
> > >>> (device_driver_attach+0x58/0x60)
> > >>> [<c0672ddc>] (device_driver_attach) from [<c0672ec0>]
> > >>> (__driver_attach+0xdc/0x174)
> > >>> [<c0672ec0>] (__driver_attach) from [<c06702b8>]
> > >>> (bus_for_each_dev+0x68/0xb4)
> > >>> [<c06702b8>] (bus_for_each_dev) from [<c06715ec>]
> > >>> (bus_add_driver+0x158/0x214)
> > >>> [<c06715ec>] (bus_add_driver) from [<c0673d20>] 
> > >>> (driver_register+0x78/0x110)
> > >>> [<c0673d20>] (driver_register) from [<c0102484>]
> > >>> (do_one_initcall+0x8c/0x42c)
> > >>> [<c0102484>] (do_one_initcall) from [<c11011c0>]
> > >>> (kernel_init_freeable+0x190/0x1dc)
> > >>> [<c11011c0>] (kernel_init_freeable) from [<c0af7988>]
> > >>> (kernel_init+0x8/0x118)
> > >>> [<c0af7988>] (kernel_init) from [<c0100114>] (ret_from_fork+0x14/0x20)
> > >>> Exception stack(0xef0dffb0 to 0xef0dfff8)
> > >>> ...
> > >>> ---[ end trace c06e996ec2e8234d ]---
> > >>>
> > >>> This means that dsi->encoder.dev is not initialized in
> > >>> __exynos_dsi_host_attach().
> > >>>
> > >>> This happens, because drm_bridge_attach() in exynos_dsi_bind() returned
> > >>> earlier -517 (deferred probe), what causes cleanup of encoder and
> > >>> release of all drm resources.
> > >>>
> > >>> Then however, the panel tries to register itself and
> > >>> exynos_dsi_host_attach() tries to access the released encoder (which is
> > >>> zeroed in drm_encoder_release) and rest of resources, what causes 
> > >>> failure.
> > >>>
> > >>> It looks that something is missing. Maybe mipi host has to be 
> > >>> registered
> > >>> later, when bridge is ready? I have no idea how it is handled before
> > >>> this patch. Andrzej, could you comment it a bit?
> > >> I intentionally changed the order, because if another bridge follows 
> > >> in the
> > >> pipeline, the probe of the drm driver has to be deferred until some 
> > >> bridge
> > >> provides a connector. The next bridge registers itself via the 
> > >> host_attach
> > >> function and the deferral is ensured via the bind for the bind/unbind 
> > >> API or
> > >> the bridge_attach function otherwise.
> > >>
> > >> On the other hand, the bridge does not have an encoder until the mipi 
> > >> device
> > >> has been attached.
> > >>
> > >> As a solution, the exynos dsi driver must initialize the encoder in
> > >> exynos_dsi_probe instead of in exynos_dsi_bind and access the encoder 
> > >> via
> > >> exynos_dsi instead of the bridge.
> > >>
> > >> Can you try to move everything except samsung_dsim_bind from 
> > >> exynos_dsi_bind
> > >> to exynos_dsi_probe (respectively for unbind) and report if it fixes the
> > >> crash.
> > >
> > >
> > > The original behaviour is that encoder (exynos_dsi) is registered 
> > > regardless of sink presence (initially panel, later also bridge) - it 
> > > avoids multiple issues with deferred probe, device driver bind/unbind 
> > > and module load/unload. Appearance or disappearance of sink is 
> > > reported to host nicely via DSI attach/detach callbacks - and it is 
> > > reflected in drm world as change state of the connector.
> > >
> > > Registering DSI host in bind and unregistering in unbind assures that 
> > > if mipi_dsi device is attached/detached the drm device is always 
> > > present - it makes device/driver binding race free and allows to avoid 
> > > additional locking.
> > >
> > > Moving DSI host registration to probe changes everything, for sure it 
> > > breaks the nice feature of DSI attach/detach callbacks and apparently 
> > > can cause different issues depending on device bind order.
> > >
> > > I will try to look at the patches tomorrow and maybe I can find more 
> > > constructive comments :)
> > 
> > 
> > As I said yesterday, exynos_dsi driver uses dsi host attach/detach 
> > callbacks to control appearance/disappearance of downstream device. It 
> > allows to:
> > 
> > 1. Safely bind/unbind different device drivers at any time and at any 
> > order, without killing exynos_drm and/or crashing system.
> > 
> > 2. Avoid issues with late drm init - on some platforms exynos_drm device 
> > appeared too late, due to deferred probe, and resulted in black screen 
> > in userspace.
> > 
> > 
> > Now if we want to convert exynos_dsi to drm_bridge I see following options:
> > 
> > A. Forgot about callbacks and make the exynos_drm to defer probing until 
> > exynos_dsi bridge is available, probably it will cause later exynos_drm 
> > appearance, thus probably black screen on some targets. So for sure it 
> > will be suboptimal. Making it bridge unbind safe would be another 
> > problem, but most developers do not care about it so why should we? :)
> > 
> > B. Try to mimic current behaviour - exynos_dsi register bridge ASAP, 
> > even if downstream devices are not yet attached, on attach/detach notify 
> > drm about it via connector status change, for this dsi_host registration 
> > should be performed from drm_bridge attach, I guess.
> > 
> > 
> > Option A is more standard, but is unsafe and causes other issues.
> > 
> > Option B keeps current behaviour.
> 
> Maybe we can have both, but I am not sure, if I am missing something:
> 
> I still prefer option A for the samsung-dsim driver, because it is more
> standard, simpler and avoids issues with encoders, connectors or handling
> hotplug.
> 
> The idea is to use two bridges in the exynos-dsi driver: One bridge in the
> samsung-dsim driver which implements option A and defers probing of the drm
> driver until the next bridge is attached. And a second bridge in the
> exynos_dsi that attaches to the first bridge (thus, allowing the exynos_drm
> device to appear) and implements the hotplug handling for notifying drm via
> connector status change.
> 
> The driver for the i.MX8M would use the samsung-dsim bridge without an
> additional bridge.
> 
> This allows the samsung-dsim driver to expose the standard behavior while the
> exynos_dsi may stick to the existing behavior for the exynos_drm driver.
> 
> I hope this makes sense and does not sound too crazy. It might be difficult to
> get the probing and mipi host/device registration correct, but I will try, if
> this can work.

Adding two bridges for being able to support hotplugging adds many special
cases to the bridge driver and still requires more custom API to correctly add
the second bridge. I don't think that this a viable path to go.

This leaves us with:

Option A) Standard drm_bridge behavior, which is currently implemented, but
incompatible with the currently expected behavior of exynos_drm.

Option B) Creating the drm device without all bridges being attached, which
would work with the exynos_drm driver, but breaks for the standard drm_bridge
behavior, especially, if the encoder/connector is created at the beginning of
the pipeline and passed downwards when the bridges are attached.

Option C) Extracting only low level register accesses into shared code, adding
a custom interface and implementing the drm_bridge handling in the platform
specific code.

None of the options really convinces me.

Michael
