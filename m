Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7B8A642B8F
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  5 Dec 2022 16:24:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232385AbiLEPYO (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 5 Dec 2022 10:24:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232397AbiLEPXu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 10:23:50 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83A671E706
        for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Dec 2022 07:21:20 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id t5so11364412vsh.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Dec 2022 07:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vtfRXAVDyVrApIXu7REA+f3BkvSYeVsxgHe9hwa3jgU=;
        b=KoYardbg2T8WxytUOPLzBsy8QCDmpUo6HjY3E8sW7cY3j003A4qQuVTDNNLNbidnCN
         BSySIhJQ0RmCw1ElM6spJLjjVpUezCp+CZWNxRuE1I5uTNV8KFS8mfWb8lqdesRPliMp
         dqXcIQgWcPnbPU0waN1NXx3NqBABIejDurEmkdHqVbrblIOYw2/AWMezgV8HqPoksnJI
         1V+HtNL7ww42p91BE5I/jsmVG6y34Uko0FNL7TSmhuRT4r7iNnEeOntJ2Gn7cw2ycU2O
         pG0ZGOHXBO3eoNENR0cOpNHqWjC+IHMOaBv62JCEu61nSaaADhnKM/zEQT6sLf8VhZFr
         CQPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vtfRXAVDyVrApIXu7REA+f3BkvSYeVsxgHe9hwa3jgU=;
        b=CtCghTNCqJHhZk3Q6xsf5SV7p6OkSicY1fqy6fJ26DFyUgx7J+h7jc+9SAOLQA4N/7
         ziVg8c/xKHWIdmpnLHQJYycCFKgNwwihTIeZfmGEERxZ+/p+TvdrS/eChfea7qOInzqH
         xKF00i3JsvZZPdhdE7teVwjEnAkArdpE4KAHMhwDqZUOPCQEtAnoDGveSXjHmQKlOaIP
         kUvsEkGwNmPAllx5OKX8S/lrKs23AflmnNHMzutt7Ng0Ct7/PyxEBhIDHIDK27W21ihc
         /vF78Rl/h5C7JssuG3aqiUgqkxlFTp8fj0lp/ev3nHcfBOUdL+4Ti/1KHY+n5QNz56Lc
         AyuQ==
X-Gm-Message-State: ANoB5plUE18GjzrifuaNtrUH07FgaWPRsB0Uhp6u1EfGGO/rucgDgV/v
        SxjRkmDzZsUBC9nNmoGKcB3UNCmTIQAVCtnGq2LPzw==
X-Google-Smtp-Source: AA0mqf4E58NaogSXtl0ngRb9RXwXk3GAQqpGjhLQHv3E8Ej9Pzvc0yKOw48xyHDg74ltlpHReAMR9peTLdzVeyE099c=
X-Received: by 2002:a67:ec03:0:b0:3b1:1abd:2cc0 with SMTP id
 d3-20020a67ec03000000b003b11abd2cc0mr6631511vso.32.1670253662512; Mon, 05 Dec
 2022 07:21:02 -0800 (PST)
MIME-Version: 1.0
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <20221110183853.3678209-7-jagan@amarulasolutions.com> <CGME20221117045817eucas1p1778503aa62ef18ef5ee0502d2189cd15@eucas1p1.samsung.com>
 <04fb17e2-1b55-fbd9-d846-da3e3da4edb8@denx.de> <f33142de-862e-9775-b1c9-b871bb9a243c@samsung.com>
 <b66b44fc-5d4c-d3a8-8538-79003b14691e@denx.de> <CAMty3ZBfAY86fp7XxS9frrBiT9FRkJaNSRY-4CVpqGOvdpn1fw@mail.gmail.com>
 <58671662-9242-c7ef-53ef-60f9cdc3399a@denx.de> <CAMty3ZDVZJ6TjKjtq9wSHudmeD+7O1vB_j0V1xKjYGWnwMKa6Q@mail.gmail.com>
 <9f08a902-049c-1c00-7fed-3d7ee18b3d2c@samsung.com> <2ef1aae1-8ff9-22bc-9817-69d1eae8b485@denx.de>
 <CAPY8ntDH7QgLfg_MsXSeyD4uwiG7EHMd75qQA6SbDbO1P6ftow@mail.gmail.com> <cc3814d2-a300-be10-168c-7313a7cd9006@kontron.de>
In-Reply-To: <cc3814d2-a300-be10-168c-7313a7cd9006@kontron.de>
From:   Dave Stevenson <dave.stevenson@raspberrypi.com>
Date:   Mon, 5 Dec 2022 15:20:46 +0000
Message-ID: <CAPY8ntCpOitHktqd4W=teYQJ+UDimCZ2czcaxgG5rA6A4XB11Q@mail.gmail.com>
Subject: Re: [PATCH v8 06/14] drm: bridge: samsung-dsim: Handle proper DSI
 host initialization
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     Marek Vasut <marex@denx.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Frieder

On Mon, 5 Dec 2022 at 07:30, Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> On 02.12.22 15:55, Dave Stevenson wrote:
> > Hi Marek
> >
> > On Fri, 2 Dec 2022 at 12:21, Marek Vasut <marex@denx.de> wrote:
> >>
> >> On 12/2/22 11:52, Marek Szyprowski wrote:
> >>> Hi,
> >>>
> >>> Sorry for delay, I was on a sick leave last 2 weeks.
> >>>
> >>> On 28.11.2022 15:43, Jagan Teki wrote:
> >>>> ,On Sat, Nov 26, 2022 at 3:44 AM Marek Vasut <marex@denx.de> wrote:
> >>>>> On 11/23/22 21:09, Jagan Teki wrote:
> >>>>>> On Sat, Nov 19, 2022 at 7:45 PM Marek Vasut <marex@denx.de> wrote:
> >>>>>>> On 11/17/22 14:04, Marek Szyprowski wrote:
> >>>>>>>> On 17.11.2022 05:58, Marek Vasut wrote:
> >>>>>>>>> On 11/10/22 19:38, Jagan Teki wrote:
> >>>>>>>>>> DSI host initialization handling in previous exynos dsi driver=
 has
> >>>>>>>>>> some pitfalls. It initializes the host during host transfer() =
hook
> >>>>>>>>>> that is indeed not the desired call flow for I2C and any other=
 DSI
> >>>>>>>>>> configured downstream bridges.
> >>>>>>>>>>
> >>>>>>>>>> Host transfer() is usually triggered for downstream DSI panels=
 or
> >>>>>>>>>> bridges and I2C-configured-DSI bridges miss these host initial=
ization
> >>>>>>>>>> as these downstream bridges use bridge operations hooks like p=
re_enable,
> >>>>>>>>>> and enable in order to initialize or set up the host.
> >>>>>>>>>>
> >>>>>>>>>> This patch is trying to handle the host init handler to satisf=
y all
> >>>>>>>>>> downstream panels and bridges. Added the DSIM_STATE_REINITIALI=
ZED state
> >>>>>>>>>> flag to ensure that host init is also done on first cmd transf=
er, this
> >>>>>>>>>> helps existing DSI panels work on exynos platform (form Marek
> >>>>>>>>>> Szyprowski).
> >>>>>>>>>>
> >>>>>>>>>> v8, v7, v6, v5:
> >>>>>>>>>> * none
> >>>>>>>>>>
> >>>>>>>>>> v4:
> >>>>>>>>>> * update init handling to ensure host init done on first cmd t=
ransfer
> >>>>>>>>>>
> >>>>>>>>>> v3:
> >>>>>>>>>> * none
> >>>>>>>>>>
> >>>>>>>>>> v2:
> >>>>>>>>>> * check initialized state in samsung_dsim_init
> >>>>>>>>>>
> >>>>>>>>>> v1:
> >>>>>>>>>> * keep DSI init in host transfer
> >>>>>>>>>>
> >>>>>>>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >>>>>>>>>> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> >>>>>>>>>> ---
> >>>>>>>>>>       drivers/gpu/drm/bridge/samsung-dsim.c | 25 +++++++++++++=
++++--------
> >>>>>>>>>>       include/drm/bridge/samsung-dsim.h     |  5 +++--
> >>>>>>>>>>       2 files changed, 20 insertions(+), 10 deletions(-)
> >>>>>>>>>>
> >>>>>>>>>> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>>>>>>> b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>>>>>>> index bb1f45fd5a88..ec7e01ae02ea 100644
> >>>>>>>>>> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>>>>>>> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> >>>>>>>>>> @@ -1234,12 +1234,17 @@ static void samsung_dsim_disable_irq(s=
truct
> >>>>>>>>>> samsung_dsim *dsi)
> >>>>>>>>>>           disable_irq(dsi->irq);
> >>>>>>>>>>       }
> >>>>>>>>>>       -static int samsung_dsim_init(struct samsung_dsim *dsi)
> >>>>>>>>>> +static int samsung_dsim_init(struct samsung_dsim *dsi, unsign=
ed int
> >>>>>>>>>> flag)
> >>>>>>>>>>       {
> >>>>>>>>>>           const struct samsung_dsim_driver_data *driver_data =
=3D
> >>>>>>>>>> dsi->driver_data;
> >>>>>>>>>>       +    if (dsi->state & flag)
> >>>>>>>>>> +        return 0;
> >>>>>>>>>> +
> >>>>>>>>>>           samsung_dsim_reset(dsi);
> >>>>>>>>>> -    samsung_dsim_enable_irq(dsi);
> >>>>>>>>>> +
> >>>>>>>>>> +    if (!(dsi->state & DSIM_STATE_INITIALIZED))
> >>>>>>>>>> +        samsung_dsim_enable_irq(dsi);
> >>>>>>>>>>             if (driver_data->reg_values[RESET_TYPE] =3D=3D DSI=
M_FUNCRST)
> >>>>>>>>>>               samsung_dsim_enable_lane(dsi, BIT(dsi->lanes) - =
1);
> >>>>>>>>>> @@ -1250,6 +1255,8 @@ static int samsung_dsim_init(struct
> >>>>>>>>>> samsung_dsim *dsi)
> >>>>>>>>>>           samsung_dsim_set_phy_ctrl(dsi);
> >>>>>>>>>>           samsung_dsim_init_link(dsi);
> >>>>>>>>>>       +    dsi->state |=3D flag;
> >>>>>>>>>> +
> >>>>>>>>>>           return 0;
> >>>>>>>>>>       }
> >>>>>>>>>>       @@ -1269,6 +1276,10 @@ static void
> >>>>>>>>>> samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
> >>>>>>>>>>           }
> >>>>>>>>>>             dsi->state |=3D DSIM_STATE_ENABLED;
> >>>>>>>>>> +
> >>>>>>>>>> +    ret =3D samsung_dsim_init(dsi, DSIM_STATE_INITIALIZED);
> >>>>>>>>>> +    if (ret)
> >>>>>>>>>> +        return;
> >>>>>>>>>>       }
> >>>>>>>>>>         static void samsung_dsim_atomic_enable(struct drm_brid=
ge *bridge,
> >>>>>>>>>> @@ -1458,12 +1469,9 @@ static ssize_t
> >>>>>>>>>> samsung_dsim_host_transfer(struct mipi_dsi_host *host,
> >>>>>>>>>>           if (!(dsi->state & DSIM_STATE_ENABLED))
> >>>>>>>>>>               return -EINVAL;
> >>>>>>>>>>       -    if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
> >>>>>>>>>> -        ret =3D samsung_dsim_init(dsi);
> >>>>>>>>>> -        if (ret)
> >>>>>>>>>> -            return ret;
> >>>>>>>>>> -        dsi->state |=3D DSIM_STATE_INITIALIZED;
> >>>>>>>>>> -    }
> >>>>>>>>>> +    ret =3D samsung_dsim_init(dsi, DSIM_STATE_REINITIALIZED);
> >>>>>>>>> This triggers full controller reset and reprogramming upon firs=
t
> >>>>>>>>> command transfer, is such heavy handed reload really necessary =
?
> >>>>>>>> Yes it is, otherwise the proper DSI panels doesn't work with Exy=
nos DRM
> >>>>>>>> DSI. If this is a real issue for you, then maybe the driver coul=
d do the
> >>>>>>>> initialization conditionally, in prepare() callback in case of I=
MX and
> >>>>>>>> on the first transfer in case of Exynos?
> >>>>>>> That's odd , it does actually break panel support for me, without=
 this
> >>>>>>> double reset the panel works again. But I have to wonder, why wou=
ld such
> >>>>>>> a full reset be necessary at all , even on the exynos ?
> >>>>>> Is it breaking samsung_dsim_reset from host_transfer? maybe checki=
ng
> >>>>>> whether a reset is required before calling it might fix the issue.=
  I
> >>>>>> agree with double initialization is odd but it seems it is require=
d on
> >>>>>> some panels in Exynos, I think tweaking them and adjusting the pan=
el
> >>>>>> code might resolve this discrepancy.
> >>>>> Can someone provide further details on the exynos problem ?
> >>>> If I'm correct this sequence is required in order to work the existi=
ng
> >>>> panel/bridges on exynos. Adjusting these panel/bridge codes can
> >>>> possibly fix the sequence further.
> >>>>
> >>>> Marek Szyprowski, please add if you have anything.
> >>>
> >>>
> >>> Well, frankly speaking the double initialization is not a correct
> >>> sequence, but this is the only one that actually works on Exynos base=
d
> >>> boards with DSI panels after moving the initialization to bridge's
> >>> .prepare() callback.
> >>
> >> Somehow, I suspect this is related to the LP11 mode handling, which
> >> differs for different panels, right ? I think the RPi people worked on
> >> fixing that.
> >>
> >> +CC Dave
> >
> > Yes. I've just sent out a v3 of that patch set.
> >
> > Hopefully setting the pre_enable_prev_first flag on your peripheral's
> > drm_bridge, or prepare_prev_first if a drm_panel, will result in a
> > more sensible initialisation order for your panel.
> >
> > Note that host_transfer should ensure that the host is initialised, as
> > it is valid to call it with the host in any state. If it has to
> > initialise, then it should deinitialise once the transfer has
> > completed.
> >
> > Dave
> >
> >>> I've already explained this and shared the results
> >>> of my investigation in my replies to the previous versions of this
> >>> patchset. The original Exynos DSI driver does the initialization on t=
he
> >>> first DSI command. This however doesn't work for Jagan with I2C
> >>> controlled panels/bridges, so he moved the initialization to the
> >>> .prepare() callback, what broke the Exynos case (in-short - all teste=
d
> >>> panels works fine only if the DSI host initialization is done AFTER
> >>> turning the panel's power on). For more information, see this thread:
> >>> https://eur04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
ore.kernel.org%2Fall%2Fe96197f9-948a-997e-5453-9f9d179b5f5a%40samsung.com%2=
F&amp;data=3D05%7C01%7Cfrieder.schrempf%40kontron.de%7Cc770caab3f274d9b50d1=
08dad4753e1f%7C8c9d3c973fd941c8a2b1646f3942daf1%7C0%7C0%7C63805589726305668=
0%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha=
WwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=3D1YV551YUhXQAjE4Cg0nAtMdMksWzM=
tscH49O83iKHRo%3D&amp;reserved=3D0
> >>>
> >>> Now, the more I think of it, the more I'm convinced that we simply
> >>> should add a hack based on the HW type: do the initialization in
> >>> .prepare() for non-Exynos case and before the first transfer for the
> >>> Exynos case, as there is no way to detect the panel/next bridge type
> >>> (I2C or DSI controlled).
> >>
> >> Let's see what Dave has to say about this, maybe there is some further=
 help.
>
> Could we agree on adding the HW type based hack Marek S. proposed as a
> quick fix?
>
> This patchset was tested on Exynos so it's likely to not break any
> existing setups. And for i.MX8, this is a new driver so there's not
> really a requirement to have all setups working/supported from the
> beginning.
>
> Also having one or two hacks (marked with FIXME) in the code doesn't
> hurt. As we can see there are drafts to fix them in conjunction with
> changes in the DRM framework.
>
> This has been pending for months and in my opinion if there's a chance
> to get this into v6.2-rc1 we should take it.

My patchset was sent in March with no one seeming to care enough to review =
it.

If the situation is that your devices fall into the same camp as those
for vc4 (the host needs to be initialised before the peripheral), at
least verifying that would be useful before rushing into a hack.

Your other comment references using a TI SN65DSI84. I know for certain
that falls into the category of needing the DSI bus initialised before
it is brought out of reset.

  Dave

> If everyone agrees, Jagan, can you post a v9 which does the host
> initialization in .prepare() for i.MX and on first transfer for Exynos?
>
