Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B8F41658CD3
	for <lists+linux-samsung-soc@lfdr.de>; Thu, 29 Dec 2022 13:48:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233332AbiL2Mrg (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Thu, 29 Dec 2022 07:47:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233374AbiL2MrN (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 29 Dec 2022 07:47:13 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CB8313EB5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Dec 2022 04:47:10 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id p2so3700130ljn.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Dec 2022 04:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rwlHQh/HrIzNcutcWsMZeEMw0aP4F5M3XhGtMBD6WXM=;
        b=pAqZmGU4P85yvDEF63iAQS+tfhpveUvau9apwt4AMUIum53eci+ip3O+KP1vYexcHy
         mJcA1BiaLWRgbnmWoLQx6B4qF8rNcqOMoy/VMC+0SLVocbT7b/2Lwnsd5CxCOHEgtCcK
         rCCT57Pfl5ec/7feP3UZx5AjV4/pCozbBQrb9AHeZowZC4bB2aUKxOl0N7rgq95mfVr6
         bG8nEWFPfn7UHFKbLvTJG1PG4wsb2ulqAXiWfMqrFeNO8l3Vp+FdTlDBCQeLHDItinYq
         esww68BbuNKzXodV6kUgYKlIcxc7VUxDlbMg/7vQ7syaL1b4aq0Ak49Jw7/9yXJodDKY
         TnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rwlHQh/HrIzNcutcWsMZeEMw0aP4F5M3XhGtMBD6WXM=;
        b=OC27pmhFG6A9HO/jDsvtMKxSNzlbKf5t2oPkZQLJ2b5roV6H7SRrenMkYR6py7N8Tt
         lHuEZd5Q+JHl9wmE/n/W9IubO6NChIASUc/z9MRvGg+wk+D6D2wMgsRr58A3yMCKMirP
         Kx8tDgELBLW59WLZ14WiDZ40OxIUwR8RyDga8iJqJKypf/OFMbqczHvgKpqGDFZbEjIk
         aJwyZ70XQoMwVcuFKzx0tWU+gOO/qUNdukPuYprjx5qUX6gAz2ENOe0TP72ocXx6SHup
         sz44/g4aHBWRmYeKkkZjNFrv1xUc/0edhPrmpama0rH05+qK8k5MBWX4JzrGqy0wUDoA
         fS6Q==
X-Gm-Message-State: AFqh2kq+kXytcfcCZ0FhUm7dmG+58Jf4XSD2lGZRtMh6lxi6gNGhP16e
        2MRbr+lvmUpSVgNmevvl82Hf7A==
X-Google-Smtp-Source: AMrXdXudCbA5TUDJ9hNmgsbZrXxH4udzwLP/bRirbMXWHixMbxhSfP9j7YQEq7ObViYmABuCHTPgqA==
X-Received: by 2002:a2e:3c09:0:b0:27a:189f:5716 with SMTP id j9-20020a2e3c09000000b0027a189f5716mr7402647lja.14.1672318028996;
        Thu, 29 Dec 2022 04:47:08 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id y26-20020a2e95da000000b0027fcbcc3bedsm792616ljh.51.2022.12.29.04.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Dec 2022 04:47:08 -0800 (PST)
Message-ID: <7b04573f-8f54-8e38-83ab-f5865da81b88@linaro.org>
Date:   Thu, 29 Dec 2022 13:47:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 16/23] arm64: dts: Update cache properties for qcom
Content-Language: en-US
To:     Pierre Gondois <pierre.gondois@arm.com>,
        linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Tsahee Zidenberg <tsahee@annapurnalabs.com>,
        Antoine Tenart <atenart@kernel.org>,
        Brijesh Singh <brijeshkumar.singh@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        William Zhang <william.zhang@broadcom.com>,
        Anand Gore <anand.gore@broadcom.com>,
        Kursad Oney <kursad.oney@broadcom.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Chester Lin <clin@suse.com>,
        =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
        Matthias Brugger <mbrugger@suse.com>,
        NXP S32 Linux Team <s32@nxp.com>,
        Wei Xu <xuwei5@hisilicon.com>, Chanho Min <chanho.min@lge.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com, Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
        linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-realtek-soc@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org
References: <20221107155825.1644604-1-pierre.gondois@arm.com>
 <20221107155825.1644604-17-pierre.gondois@arm.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221107155825.1644604-17-pierre.gondois@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/11/2022 16:57, Pierre Gondois wrote:
> The DeviceTree Specification v0.3 specifies that the cache node
> 'compatible' and 'cache-level' properties are 'required'. Cf.
> s3.8 Multi-level and Shared Cache Nodes
> The 'cache-unified' property should be present if one of the
> properties for unified cache is present ('cache-size', ...).
> 
> Update the Device Trees accordingly.

Any progress on this? Pierre, are you going to resend to target specific
maintainers or SoC?

Best regards,
Krzysztof

