Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6B3F630F1D
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 19 Nov 2022 15:15:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbiKSOPx (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 19 Nov 2022 09:15:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbiKSOPw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 19 Nov 2022 09:15:52 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52ED986FDE
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 Nov 2022 06:15:51 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 90E0184BD2;
        Sat, 19 Nov 2022 15:15:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1668867348;
        bh=7rx9uYnh+rj1G/UCVB8b/JfIpu6ljTHswUOoG1lLnmc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=KHP0+nN89H9kkhl3044qB6VyyWIKWnxmUhThXyO13ab13MLHEsuapyf68GQFy4DdA
         3kTVYeFEWse9cT9d6CPEXekXejYLF6gHkgAfRy1QBCE3EtwhotkNQl0iAXYJIH3QCM
         nS0YkEUOCt3nw/7EeHO2fq09Qe5iNrp3qNS5/L60hQUvclzcW7+Or/gLtrhs3e9+eZ
         4QgagZYg813BmpsbYffONWGW1AO/5W79u7gF7gmL4Wt9EBAVDvj4tFwP116WjuXwYV
         AZ0rITROVQw+8Lj8AiuHFr6sL2M0ESsHiwI2XbUvin3yM4sGBvMPwHqYrzXZ9FOiSu
         LZlp26nz6CXwQ==
Message-ID: <b66b44fc-5d4c-d3a8-8538-79003b14691e@denx.de>
Date:   Sat, 19 Nov 2022 14:36:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v8 06/14] drm: bridge: samsung-dsim: Handle proper DSI
 host initialization
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
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
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-7-jagan@amarulasolutions.com>
 <CGME20221117045817eucas1p1778503aa62ef18ef5ee0502d2189cd15@eucas1p1.samsung.com>
 <04fb17e2-1b55-fbd9-d846-da3e3da4edb8@denx.de>
 <f33142de-862e-9775-b1c9-b871bb9a243c@samsung.com>
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <f33142de-862e-9775-b1c9-b871bb9a243c@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 11/17/22 14:04, Marek Szyprowski wrote:
> On 17.11.2022 05:58, Marek Vasut wrote:
>> On 11/10/22 19:38, Jagan Teki wrote:
>>> DSI host initialization handling in previous exynos dsi driver has
>>> some pitfalls. It initializes the host during host transfer() hook
>>> that is indeed not the desired call flow for I2C and any other DSI
>>> configured downstream bridges.
>>>
>>> Host transfer() is usually triggered for downstream DSI panels or
>>> bridges and I2C-configured-DSI bridges miss these host initialization
>>> as these downstream bridges use bridge operations hooks like pre_enable,
>>> and enable in order to initialize or set up the host.
>>>
>>> This patch is trying to handle the host init handler to satisfy all
>>> downstream panels and bridges. Added the DSIM_STATE_REINITIALIZED state
>>> flag to ensure that host init is also done on first cmd transfer, this
>>> helps existing DSI panels work on exynos platform (form Marek
>>> Szyprowski).
>>>
>>> v8, v7, v6, v5:
>>> * none
>>>
>>> v4:
>>> * update init handling to ensure host init done on first cmd transfer
>>>
>>> v3:
>>> * none
>>>
>>> v2:
>>> * check initialized state in samsung_dsim_init
>>>
>>> v1:
>>> * keep DSI init in host transfer
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>>> ---
>>>    drivers/gpu/drm/bridge/samsung-dsim.c | 25 +++++++++++++++++--------
>>>    include/drm/bridge/samsung-dsim.h     |  5 +++--
>>>    2 files changed, 20 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
>>> index bb1f45fd5a88..ec7e01ae02ea 100644
>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
>>> @@ -1234,12 +1234,17 @@ static void samsung_dsim_disable_irq(struct
>>> samsung_dsim *dsi)
>>>        disable_irq(dsi->irq);
>>>    }
>>>    -static int samsung_dsim_init(struct samsung_dsim *dsi)
>>> +static int samsung_dsim_init(struct samsung_dsim *dsi, unsigned int
>>> flag)
>>>    {
>>>        const struct samsung_dsim_driver_data *driver_data =
>>> dsi->driver_data;
>>>    +    if (dsi->state & flag)
>>> +        return 0;
>>> +
>>>        samsung_dsim_reset(dsi);
>>> -    samsung_dsim_enable_irq(dsi);
>>> +
>>> +    if (!(dsi->state & DSIM_STATE_INITIALIZED))
>>> +        samsung_dsim_enable_irq(dsi);
>>>          if (driver_data->reg_values[RESET_TYPE] == DSIM_FUNCRST)
>>>            samsung_dsim_enable_lane(dsi, BIT(dsi->lanes) - 1);
>>> @@ -1250,6 +1255,8 @@ static int samsung_dsim_init(struct
>>> samsung_dsim *dsi)
>>>        samsung_dsim_set_phy_ctrl(dsi);
>>>        samsung_dsim_init_link(dsi);
>>>    +    dsi->state |= flag;
>>> +
>>>        return 0;
>>>    }
>>>    @@ -1269,6 +1276,10 @@ static void
>>> samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
>>>        }
>>>          dsi->state |= DSIM_STATE_ENABLED;
>>> +
>>> +    ret = samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
>>> +    if (ret)
>>> +        return;
>>>    }
>>>      static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
>>> @@ -1458,12 +1469,9 @@ static ssize_t
>>> samsung_dsim_host_transfer(struct mipi_dsi_host *host,
>>>        if (!(dsi->state & DSIM_STATE_ENABLED))
>>>            return -EINVAL;
>>>    -    if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
>>> -        ret = samsung_dsim_init(dsi);
>>> -        if (ret)
>>> -            return ret;
>>> -        dsi->state |= DSIM_STATE_INITIALIZED;
>>> -    }
>>> +    ret = samsung_dsim_init(dsi, DSIM_STATE_REINITIALIZED);
>>
>> This triggers full controller reset and reprogramming upon first
>> command transfer, is such heavy handed reload really necessary ?
> 
> Yes it is, otherwise the proper DSI panels doesn't work with Exynos DRM
> DSI. If this is a real issue for you, then maybe the driver could do the
> initialization conditionally, in prepare() callback in case of IMX and
> on the first transfer in case of Exynos?

That's odd , it does actually break panel support for me, without this 
double reset the panel works again. But I have to wonder, why would such 
a full reset be necessary at all , even on the exynos ?
