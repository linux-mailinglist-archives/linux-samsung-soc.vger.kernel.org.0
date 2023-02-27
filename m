Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E555B6A4B53
	for <lists+linux-samsung-soc@lfdr.de>; Mon, 27 Feb 2023 20:41:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbjB0Tln (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 27 Feb 2023 14:41:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230098AbjB0Tlm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 14:41:42 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2AC246B3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 11:41:26 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id F15F28567B;
        Mon, 27 Feb 2023 20:41:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1677526884;
        bh=YYRl5b7WWHh3+9WkztldfCvyMGkLwbzurMasybl3WvE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=eYs/EeuQ4RnAe8Eqz4pJ31NHib6XfubFgaq0yGcTXHJ9L+31HGJWToWyi4XqBx2LD
         ZgbHjMuR2rMUC0vJbxD/XN0lVR6qo59sEvFaAZSXnmOTK4eV3A6lShCRsyUXdP4TST
         T/bO4ytIRSHHv+Ma8aA1/0EaGUtViPhjZgW6SuivfuzGNiOr+pgEAMQ1jWBk7omOLv
         GlotiYanPdvijds+iqpeZhyfzQ+a1XdOcarDqko16cyJbwaJNR4TMmU5omtwyz9j+z
         E2NR54WEFJrXWPs9AaTzgMuULE5Uix6juaPaUX60SvtLjMCjN3uFWF5fIAp9h/RsZU
         Npy00TyZXsDmA==
Message-ID: <47b8ad7d-cfc1-112c-2117-cb3612c1bba5@denx.de>
Date:   Mon, 27 Feb 2023 20:41:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or bridge
 find helper
Content-Language: en-US
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
 <20230227113925.875425-5-jagan@amarulasolutions.com>
 <3c2f91d3-0406-7730-d4e4-c94868f23c91@denx.de>
 <CAMty3ZA6_pKiOK6gWq4iQFtKsoxfUgnSFBqkgDBzEp1DcBEt3A@mail.gmail.com>
 <7b59aaf9-1f72-fd9f-29ac-1857ec3f91f3@denx.de>
 <CAMty3ZC6vqpFfdh2F=KUsAgm_KCksVXBV9ON1csjJd1m+gJpVQ@mail.gmail.com>
 <6066dff9-5a66-0da5-14d9-66162a2fbb39@denx.de>
 <CAMty3ZDjwD+3SKJiOgZLbYYTtq=udWkXbqnsyYaM73rsYxDumQ@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZDjwD+3SKJiOgZLbYYTtq=udWkXbqnsyYaM73rsYxDumQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 2/27/23 20:34, Jagan Teki wrote:
> On Tue, Feb 28, 2023 at 12:54 AM Marek Vasut <marex@denx.de> wrote:
>>
>> On 2/27/23 20:15, Jagan Teki wrote:
>>> On Tue, Feb 28, 2023 at 12:38 AM Marek Vasut <marex@denx.de> wrote:
>>>>
>>>> On 2/27/23 20:01, Jagan Teki wrote:
>>>>> On Tue, Feb 28, 2023 at 12:25 AM Marek Vasut <marex@denx.de> wrote:
>>>>>>
>>>>>> On 2/27/23 12:39, Jagan Teki wrote:
>>>>>>> drm_of_dsi_find_panel_or_bridge is capable of looking up the
>>>>>>> downstream DSI bridge and panel and trying to add a panel bridge
>>>>>>> if the panel is found.
>>>>>>>
>>>>>>> Replace explicit finding calls with drm_of_dsi_find_panel_or_bridge
>>>>>>> followed with drmm_panel_bridge_add.
>>>>>>>
>>>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>>>>>> ---
>>>>>>> Changes for v13, v12, v11:
>>>>>>> - none
>>>>>>> Changes for v10:
>>>>>>> - new patch
>>>>>>>
>>>>>>>      drivers/gpu/drm/exynos/exynos_drm_dsi.c | 25 +++++++++++++------------
>>>>>>>      1 file changed, 13 insertions(+), 12 deletions(-)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>>>>> index df15501b1075..12a6dd987e8f 100644
>>>>>>> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>>>>> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
>>>>>>> @@ -25,6 +25,7 @@
>>>>>>>      #include <drm/drm_atomic_helper.h>
>>>>>>>      #include <drm/drm_bridge.h>
>>>>>>>      #include <drm/drm_mipi_dsi.h>
>>>>>>> +#include <drm/drm_of.h>
>>>>>>>      #include <drm/drm_panel.h>
>>>>>>>      #include <drm/drm_print.h>
>>>>>>>      #include <drm/drm_probe_helper.h>
>>>>>>> @@ -1470,24 +1471,26 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>>>>>>>          struct device *dev = dsi->dev;
>>>>>>>          struct drm_encoder *encoder = &dsi->encoder;
>>>>>>>          struct drm_device *drm = encoder->dev;
>>>>>>> +     struct drm_bridge *bridge;
>>>>>>>          struct drm_panel *panel;
>>>>>>>          int ret;
>>>>>>>
>>>>>>> -     panel = of_drm_find_panel(device->dev.of_node);
>>>>>>> -     if (!IS_ERR(panel)) {
>>>>>>> -             dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
>>>>>>> -     } else {
>>>>>>> -             dsi->out_bridge = of_drm_find_bridge(device->dev.of_node);
>>>>>>> -             if (!dsi->out_bridge)
>>>>>>> -                     dsi->out_bridge = ERR_PTR(-EINVAL);
>>>>>>> -     }
>>>>>>
>>>>>> As far as I understand this from my conversation with Maxime (please put
>>>>>> him on CC of V15), the change here should instead perform the panel look
>>>>>> up NOT in exynos_dsi_host_attach() , but in exynos_dsi_bind() , i.e. in
>>>>>> the component_ops .bind callback . Here is an example of correct
>>>>>> implementation:
>>>>>>
>>>>>> https://cgit.freedesktop.org/drm-misc/tree/drivers/gpu/drm/vc4/vc4_dsi.c#n1805
>>>>>
>>>>> But, we don't have component_ops.bind for imx8m case, so where do we
>>>>> want to place the panel hook?
>>>>>
>>>>> Exynos drm drivers are component-based but, imx8mm is not.
>>>>
>>>> In 14/18 patch, the same should be added to generic_dsim_register_host()
>>>> , which is called from the driver .probe() callback, but that is OK.
>>>>
>>>> That's ^ is the iMX part.
>>>
>>> Ohh. You mean, we need to find the panel hook separately in two places like
>>> - bind for exynos
>>> - probe for imx8mm
>>
>> Yes
>>
>>> If so? how can I find the drm_device pointer in the probe?
>>
>> What for ? The panel lookup uses OF graph . Where do you need the
>> drm_device in it ?
> 
> May I can summarize the whole setback here so that everybody is on the
> same page and find the proper solution?
> 
> The key blocker is accessing the DRM pointer in order to use the
> DRM-managed action helper.
> 
> 1. If we find the panel hook in Exynos component_ops.bind then we can
> use the DRM pointer directly as VC4 does.
> 2. if we find the panel hook in Samsung drm_bridge_funcs.attach (for
> imx8mm) then we can use the DRM pointer directly via bridge->dev.
> 
> If we make 2) has common across like finding the panel hook in
> drm_bridge_funcs.attach the Exynos drm pipeline cannot find the
> panels.
> 
> The common solution for both exynos and imx8m is host.attach but if we
> do so we cannot get find the DRM pointer.

There isn't going to be common solution, you would really have to do the 
look up in component_ops .bind callback for exynos , and 
generic_dsim_register_host() for i.MX .

> If we go ahead with no need for DRM-managed helper at the moment, then
> find the panel hook in host.attach and then drop 2/18.

The panel lookup must happen in .bind/.probe for exynos/imx respectively 
, that's really all that is required here. Then you can drop 1,2,3/18 
and get this series applied (I hope) .

Can you implement just this one change ?

There is no need to use drmm_* helper for now, that can be improved 
later if possible.
