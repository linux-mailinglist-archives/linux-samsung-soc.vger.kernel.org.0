Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB346C009B
	for <lists+linux-samsung-soc@lfdr.de>; Sun, 19 Mar 2023 11:56:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229959AbjCSK4T (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Sun, 19 Mar 2023 06:56:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjCSK4Q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 19 Mar 2023 06:56:16 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBEEB22132
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Mar 2023 03:56:10 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id r11so36427771edd.5
        for <linux-samsung-soc@vger.kernel.org>; Sun, 19 Mar 2023 03:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679223369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zjQK98wMTvC2q3E7fdiQTGy4CfE9nib0P1aeqr32BDM=;
        b=LoyXTmuTmKGgTLGBo0qYnX6Jp8bEDf17eVvP7XGO2qhfRemxtwJtrRH9Ep1JHhGnQk
         DM7G/ianKOJTy+onrcx5K+rasN1+P/5phdjTikcBfSCvls5VoUEtU19R0HbCgCF7aobg
         40WRU2UHhFcDZODehVDDkwN/snWgAt/4QDmupCFnR47uQEZePsVew0+rLxSDOdDvvAwp
         3JMq8P2tanxmPYuvLeuCmLNfn9yRr7Dfe9NF+r536JdXbCdxebQX1OVjBpyJ7mUDvRMU
         iVtQ2+uN79keOw++o+t+UG4w2ddZnZ5CBm+iLIx5uFLx+Pf3+PRu53Jz68pAER7B1gdw
         MxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679223369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zjQK98wMTvC2q3E7fdiQTGy4CfE9nib0P1aeqr32BDM=;
        b=QCdya2F0/GeIoU1W+UUNR8Sddwe4aJUzILlt9BJXqeg7w/u0cOhEznL9YL6iy51szK
         SvdWNJPuhgYt60Y69KuPgbiOnMlQStyoDzHAP2brLiMHj85N8Qd1nnizjWSH9/osJrhH
         4XxvVD5ei2ao0RlxI4wDUp3EJ/tmr2jcmmx+bZ1L4fpwKZbGK7M+grZTfIiwlnYs8ERW
         YQ6OIQrPM4zmUW/+n/0h5u5YWWM+Ue0+WN4GSWCWrBO8MhgzZ1jqKgsVNEaNEk7C8HuQ
         KoWjfqXcHMm2gKh/yyX8pzZWSx937nEXdgVQwgTJOp6gt/8YyWgCRUTsQWTP0poBmxJr
         knvg==
X-Gm-Message-State: AO0yUKWdF4ZVjwPevKQ63yp11aBFk1uFQ7QhtvTGmEGkW6y3kiAjlAAc
        iVHxqpNLLasH370RpSZ8LFHuVA==
X-Google-Smtp-Source: AK7set8aBKLZuOSLuGkgBgWSIN+Nyo0cQB4QbrQUYK+fT1WnG6tZns0BtbZAKs7jswp9C0GRLAkphg==
X-Received: by 2002:a17:906:7fc6:b0:923:812c:a5d3 with SMTP id r6-20020a1709067fc600b00923812ca5d3mr5250858ejs.25.1679223369254;
        Sun, 19 Mar 2023 03:56:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id 21-20020a170906319500b008d68d018153sm3115271ejy.23.2023.03.19.03.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 03:56:08 -0700 (PDT)
Message-ID: <23036bfc-cceb-2ac5-85fb-5e2d0bc0cbb5@linaro.org>
Date:   Sun, 19 Mar 2023 11:56:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
To:     Rob Herring <robh@kernel.org>,
        =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Hector Martin <marcan@marcan.st>,
        Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Andrew Jeffery <andrew@aj.id.au>,
        Joel Stanley <joel@jms.id.au>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Jianlong Huang <jianlong.huang@starfivetech.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>,
        Wells Lu <wellslutw@gmail.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Michal Simek <michal.simek@xilinx.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@lists.linux.dev, asahi@lists.linux.dev,
        linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, patches@opensource.cirrus.com,
        alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20230317233623.3968172-1-robh@kernel.org>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317233623.3968172-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 18/03/2023 00:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

