Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 426D65EF6A5
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 29 Sep 2022 15:32:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235242AbiI2Nbw (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 29 Sep 2022 09:31:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235291AbiI2Nbn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Sep 2022 09:31:43 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F412137473
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Sep 2022 06:31:40 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id t16so1564235ljh.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Sep 2022 06:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=X48j3G+qVEopzjYTA1H5u2rml5Mx/9RCCV/6TZYhcIQ=;
        b=hrmIdsn5g/FpEqFeKHHnTpfCSNW5C5r4gCEHVeHwVR80GVFbZg97nDgi41R/Xf3Ymu
         seJNwwjKnFyrmAgj3MKNLgRmGhEByKoLErdEa5A+ZqKkC9tAUD1c3Php845WLUOWrAjq
         5ZlItbbiBVyAvLexJw8/YeEBPs4UYnQxHvSSzeGt5jWbcLDFTtLYDxbNNHFoiFOFzm9y
         fp90/6MsNSvPK1y4kRGgbD0CjwGmTg2k+wqdhLQ/Uzby8fhWkNdV/rsq4WzbE1W2z4lu
         8CC0AQf8cN0S6yZfRX9sm4vpUZbxuBgOKFxY+20QItfwWPCSJrb/2AhcvtR8BBiHcv1M
         gavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=X48j3G+qVEopzjYTA1H5u2rml5Mx/9RCCV/6TZYhcIQ=;
        b=OmVwqVXQYm7PSqf5y7RlfWOSa6zxeOxKHgb74Ayd+ilPDs/KdUWML+IsX9h8cwnNpG
         O+Uehgt25oG9u6fz+jxWkvmBvrwmGUe3kEVQcn+cpuH3V7mel2uZx4bz9gkgxEXmn+L2
         Ll9QYK3JvzuwlJeXGIotIpbER2ZWRweRCJInIiKhONLvBCJkX0z/T2ZRmLaPWK6NprWA
         n5TLQNToNT6yDWN8OMLu6RzouI0wMt5Y4FxJuWnHXEIf3cnzuFdg2iEWaBir27z4NQBR
         2yIiRZDWhYPsqj5AgMaT9xUrUaB3U5UI9RQ9RVibzgIedDNpb3j6M5aEb4mkV6D6PCrE
         ztQw==
X-Gm-Message-State: ACrzQf0H1ifHPNX4C+5PQnYkfy0Ryu/SsSXwTs1tXBfeGoT9MvFrgv3R
        /9KvJJ7XE+dXInmrkUfOZeDYLQ==
X-Google-Smtp-Source: AMsMyM7JjhES7J8Rt6+czIznrc9iO1brCXpNmHy+QfoVtGLJY9kCDF+GU2VyflNmIbaVrNY4L7jUPw==
X-Received: by 2002:a2e:84ca:0:b0:25d:77e0:2566 with SMTP id q10-20020a2e84ca000000b0025d77e02566mr1274760ljh.78.1664458298639;
        Thu, 29 Sep 2022 06:31:38 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u5-20020ac258c5000000b004a0232613desm784574lfo.205.2022.09.29.06.31.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 06:31:38 -0700 (PDT)
Message-ID: <803d6c60-2e10-d831-bbdf-e1aaf9f8800f@linaro.org>
Date:   Thu, 29 Sep 2022 16:31:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v7 13/29] thermal/drivers/qcom: Use generic
 thermal_zone_get_trip() function
Content-Language: en-GB
To:     Daniel Lezcano <daniel.lezcano@linaro.org>, rafael@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        rui.zhang@intel.com, Raju Rangoju <rajur@chelsio.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Amit Kucheria <amitk@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Broadcom Kernel Team <bcm-kernel-feedback-list@broadcom.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Lukasz Luba <lukasz.luba@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>,
        Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Keerthy <j-keerthy@ti.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Antoine Tenart <atenart@kernel.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Dmitry Osipenko <digetx@gmail.com>, netdev@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Thara Gopinath <thara.gopinath@gmail.com>
References: <20220928210059.891387-1-daniel.lezcano@linaro.org>
 <20220928210059.891387-14-daniel.lezcano@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220928210059.891387-14-daniel.lezcano@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 29/09/2022 00:00, Daniel Lezcano wrote:
> The thermal framework gives the possibility to register the trip
> points with the thermal zone. When that is done, no get_trip_* ops are
> needed and they can be removed.
> 
> Convert ops content logic into generic trip points and register them with the
> thermal zone.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Acked-by: Amit Kucheria <amitk@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 39 +++++++++------------
>   1 file changed, 17 insertions(+), 22 deletions(-)
> 

-- 
With best wishes
Dmitry

