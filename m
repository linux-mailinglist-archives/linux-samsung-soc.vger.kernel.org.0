Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B826E5A24DF
	for <lists+linux-samsung-soc@lfdr.de>; Fri, 26 Aug 2022 11:49:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344092AbiHZJrZ (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Fri, 26 Aug 2022 05:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344070AbiHZJrT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 26 Aug 2022 05:47:19 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CDCCD630C
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Aug 2022 02:47:17 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id u24so1099514lji.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Aug 2022 02:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=7/zLm6wYmIJxefFBwnQ6xTIL94BoETjg8bQDFj+L0EQ=;
        b=HIdAzMqZp+CHMUJvXZDL4kQfbbHEzP9oyvYz1ueQNzPdJuFdzN/xiOWNVvAI5PypY2
         phc7mMSMvv0CqdAk3VeOaSOG1rVJQhyoTe39lWgf29/RQtOFhD7d+DPbjBkxwJtUIkhy
         cta3uW2ybEZW+YD8Fw2dkJR4gv7MOtmY6qC+zYXXmj+Z4l5AhOceFVfeylnXwXhn1Qg4
         ld1fWsPQV5Kf/3HaxA9FJzTVAxTZPdCP38pgrmH64yfQ9etak3X7fthigbG+2fPn57OV
         wm7dDnDP5PGUOjHBGcdSnq4ZOYoc68PuhJYJy371olT9dw/BL1IEEx4esBwhZD/7bnUm
         gpNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=7/zLm6wYmIJxefFBwnQ6xTIL94BoETjg8bQDFj+L0EQ=;
        b=Z/eN/DplTzKObphn0TO0f3qL0t3FohK+l0wNFP6D3OotCtjnC3lzjX2QapI7+l884V
         l1X36F7fsQ8vHW+uNJCiF4ntgw0PaFImBB6GoDWAvGEr3+DRtcbrSSRB7rL8q0DJBEtc
         kjT/npZ8ZPA2QG8aDIODN3d/jkrQMW6dS3zhcYwZ1sdtPGFPoj6ip0uzzKpqpGAJ1YAF
         /uFhq9B6iixJH0EiuQeOHjbNZ/iAfDA2fjxy7en7anKim59c9yN0uhLRAirP/h3cVEf2
         FRrIptK4tWDyrmAJAol5qMipqMVdDlbGofKxT6eTyr2PDRsEYOekIlvJxBYot0uzl5lM
         eOmw==
X-Gm-Message-State: ACgBeo3BUWAC7n2Fjqljl1QF/qa0Dq5VWqerOd4vWudLsQ3T4OVkEM+T
        NPtb5Ux+tPzkpTYOQmX8KiZC7A==
X-Google-Smtp-Source: AA6agR4NooJqTIyf/F5iZCsGcw1gdJa0BYVeuEHWvl+KrvNFJZWMb3qoex5YNXUISP81L4uvAWNr2Q==
X-Received: by 2002:a05:651c:179c:b0:261:8fbe:b729 with SMTP id bn28-20020a05651c179c00b002618fbeb729mr2140443ljb.114.1661507235107;
        Fri, 26 Aug 2022 02:47:15 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q22-20020a194316000000b004931817c487sm320823lfa.197.2022.08.26.02.47.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 02:47:14 -0700 (PDT)
Message-ID: <e4c5a39e-6a47-6814-92f7-c751bd95bdf0@linaro.org>
Date:   Fri, 26 Aug 2022 12:47:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 5/5] dt-bindings: display: drop minItems equal to maxItems
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andre Przywara <andre.przywara@arm.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Marek Vasut <marex@denx.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-ide@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20220825113334.196908-1-krzysztof.kozlowski@linaro.org>
 <20220825113334.196908-5-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220825113334.196908-5-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 25/08/2022 14:33, Krzysztof Kozlowski wrote:
> minItems, if missing, are implicitly equal to maxItems, so drop
> redundant piece to reduce size of code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml   | 1 -
>   .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 --
>   Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml | 2 --

For msm changes:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>   .../bindings/display/samsung/samsung,exynos5433-decon.yaml      | 2 --
>   .../bindings/display/samsung/samsung,exynos5433-mic.yaml        | 1 -
>   .../bindings/display/samsung/samsung,exynos7-decon.yaml         | 1 -
>   .../devicetree/bindings/display/samsung/samsung,fimd.yaml       | 1 -
>   .../devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml  | 1 -
>   .../devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml   | 2 --
>   9 files changed, 13 deletions(-)
> 

-- 
With best wishes
Dmitry

