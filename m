Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C3D964B5FE
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 13 Dec 2022 14:22:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbiLMNWL (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 13 Dec 2022 08:22:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235065AbiLMNV7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 13 Dec 2022 08:21:59 -0500
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DECDA1FF91
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Dec 2022 05:21:58 -0800 (PST)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id DF88883677;
        Tue, 13 Dec 2022 14:21:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1670937717;
        bh=/oA7YYrsZ6Hcbgzi9zPCaZU8o9VCHft0KWjN7dXnSVY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=k98XfgTxQ4DVLkKaJpwpKULQqgRVT0qfNdHskTbxPezrWiGMeyKSCS55iJbHBoAdt
         3WrG9dB5Unv8apeL214nN/qHPpAX7LtQX+GU6YgFiec//eRdkB/qMF83ULCNYfoKyp
         yBMCOQJeaG9bI/hSWGJIIpzXQ4wFCtQnhcITt0TGSxgmue0sG987hnbjgnkL/fR649
         sMDDBM2WV0JxWuqPS+H40+gJVfNezMCoQ0PI9XmonQq1UrIFAFS8A0xF5xGU+WVh4v
         zkdtYeLK33BlYwE0V8/xvhNdl+A/8q1W/S7iR+CA5sI7Xj8Dg2JFZMzNSiaTIbHw1D
         sD/7cdIwRl3kw==
Message-ID: <35d8e467-fc6d-3b5f-225a-9a11596de771@denx.de>
Date:   Tue, 13 Dec 2022 14:21:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v9 10/18] drm: bridge: samsung-dsim: Init exynos host for
 first DSI transfer
Content-Language: en-US
To:     Jagan Teki <jagan@amarulasolutions.com>
Cc:     Fabio Estevam <festevam@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        dri-devel@lists.freedesktop.org,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        Robert Foss <robert.foss@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Fancy Fang <chen.fang@nxp.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
References: <20221209152343.180139-1-jagan@amarulasolutions.com>
 <CGME20221209152722eucas1p2534c4e4837d3006683fc57c0dcb1ab52@eucas1p2.samsung.com>
 <20221209152343.180139-11-jagan@amarulasolutions.com>
 <df99edbd-7150-7274-2c5e-fe6d4ed4d92d@samsung.com>
 <CAMty3ZCCscqE8e_Rr9KpmUONxh4aCBWB7qh4xSvuCGrUT4kUeQ@mail.gmail.com>
 <b1e38212-985c-21c9-58a5-7504719c3af8@samsung.com>
 <ed13b791-ab47-7aaa-7993-bb49478e7f2a@samsung.com>
 <CAMty3ZBzpmwAV7e7wdBu+GOmg6M7xqqc46QtGzuLsnv2kT0Zdw@mail.gmail.com>
 <395a4762-70fe-1caf-579f-2b5952232470@samsung.com>
 <CAMty3ZABHUjSHRBR6RCnyE19HOWknw67s__0WBKgMnX5nQBy9w@mail.gmail.com>
 <CAOMZO5CPfgYUhXO_JZJvVBoFpddw+LHbd58a2TzPd2nWjzx_rg@mail.gmail.com>
 <CAMty3ZD6fVps-PE=iNR2Zr0_qz--h4wcjO5Wa1czA7w7VN2SqQ@mail.gmail.com>
 <9913c39b-5a52-0b45-eed7-4bdc860aa877@denx.de>
 <CAMty3ZDpYRSTN2u7jg4faKRZwP-CvR52FYe4dZ5GPCpQyuPHXw@mail.gmail.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <CAMty3ZDpYRSTN2u7jg4faKRZwP-CvR52FYe4dZ5GPCpQyuPHXw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 12/13/22 14:18, Jagan Teki wrote:
> On Tue, Dec 13, 2022 at 6:44 PM Marek Vasut <marex@denx.de> wrote:
>>
>> On 12/13/22 11:53, Jagan Teki wrote:
>>> Hi Fabio,
>>
>> Hi,
>>
>>> On Tue, Dec 13, 2022 at 4:17 PM Fabio Estevam <festevam@gmail.com> wrote:
>>>>
>>>> Hi Jagan,
>>>>
>>>> On Tue, Dec 13, 2022 at 7:40 AM Jagan Teki <jagan@amarulasolutions.com> wrote:
>>>>
>>>>> https://gitlab.com/openedev/kernel/-/commits/imx8mm-dsi-v10
>>>>
>>>> Please preserve the authorship of the patches.
>>>>
>>>> This one is from Marek Vasut:
>>>> https://gitlab.com/openedev/kernel/-/commit/e244fa552402caebcf48cd6710fd387429f7f680
>>>
>>> The original patch was changed with respect to this one and that is
>>> the reason I have to keep his signed-off-by.
>>
>> You did change the authorship of the patch, not just a SoB line.
>> It seems that the only change is dropped comment, which was squashed
>> into earlier patch in this series, see the original submission:
> 
> OKay. I will update it on V10 or if you want to send it from your side
> then I will exclude it from the series. let me know.

Just keep the authorship intact, unless there is significant change to 
the patch.

>> https://patchwork.freedesktop.org/patch/507166/
>>
>> btw. it seems hunk 3 has disappeared, the samsung_dsim_attach() hw_type
>> check.
> 
> Do you mean previous = NULL; addition?

Yes, this hunk has been dropped.
