Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD0F15FFC19
	for <lists+linux-samsung-soc@lfdr.de>; Sat, 15 Oct 2022 23:56:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbiJOV4U (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sat, 15 Oct 2022 17:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbiJOV4T (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 15 Oct 2022 17:56:19 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D55EAE5A
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Oct 2022 14:56:17 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 47F0E84D45;
        Sat, 15 Oct 2022 23:56:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1665870974;
        bh=YGQz6WSJhqYrLbCBc51h+Ti7DPNLJ1i3+ga50QqizIU=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=MAz1BqlcmsVgffzkRn6FlIBAoQUfr/WY73xlziLi8vpO2pC0zAlVN+BI/puezo2vN
         aUocBM5qKa5Z+l1F2AKSmE4qIfobzlVWLQ+xgHxlUbddDm9+5Bc0BdT1bv7Mp0vfTJ
         +f6Wo39UHwqCGNycbxvm3gSJaBCD7dXN/bYG5of6brWoQb9yVI7MBUuzG3rgK0IPLl
         /cU+EFSh6luRuoqr+VLoCXhqFnq/HtJx+slSoGuDczfRTguBcpa5f/bCUM3KJemWGb
         PNmyq/djOnsbEUb7VuLf9kSQi4/2hyaDbaSaQdWqt5xBP7hxScCRHyN+vRJS4sXJsx
         3/IMlho/mG/Zw==
Message-ID: <18b6402b-04a4-9455-f088-5a195a18ce33@denx.de>
Date:   Sat, 15 Oct 2022 23:56:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v7 06/10] drm: bridge: samsung-dsim: Add platform PLL_P
 (PMS_P) offset
Content-Language: en-US
To:     Jagan Teki <jagan@amarulasolutions.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
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
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>
References: <20221005151309.7278-1-jagan@amarulasolutions.com>
 <20221005151309.7278-7-jagan@amarulasolutions.com>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20221005151309.7278-7-jagan@amarulasolutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/5/22 17:13, Jagan Teki wrote:
> Look like PLL PMS_P offset value varies between platforms that have
> Samsung DSIM IP.
> 
> However, there is no clear evidence for it as both Exynos and i.MX
> 8M Mini Application Processor Reference Manual is still referring
> the PMS_P offset as 13.
> 
> The offset 13 is not working for i.MX8M Mini SoCs but the downstream
> NXP sec-dsim.c driver is using offset 14 for i.MX8M Mini SoC platforms
> [1] [2].
> 
> PMS_P value set in sec_mipi_dsim_check_pll_out using PLLCTRL_SET_P()
> with offset 13 and then an additional offset of one bit added in
> sec_mipi_dsim_config_pll via PLLCTRL_SET_PMS().
> 
> Not sure whether it is reference manual documentation or something else
> but this patch trusts the downstream code and handle PLL_P offset via
> platform driver data so-that imx8mm driver data shall use pll_p_offset
> to 14.
> 
> [1] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/gpu/drm/bridge/sec-dsim.c?h=imx_5.4.47_2.2.0#n210
> [2] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/gpu/drm/bridge/sec-dsim.c?h=imx_5.4.47_2.2.0#n211

You also add to the commit message that all of 8M Mini/Nano/Plus have 
P=14 , unlike Exynos. It also seems like the PLL in the DSIM and the 
clock PLLs in the 8M are the same design from Samsung.

Reviewed-by: Marek Vasut <marex@denx.de>
