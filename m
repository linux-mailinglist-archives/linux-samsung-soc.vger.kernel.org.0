Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 728146B9FFD
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 14 Mar 2023 20:49:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjCNTth (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Tue, 14 Mar 2023 15:49:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjCNTtf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Mar 2023 15:49:35 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32AB86185
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Mar 2023 12:49:34 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id fd5so32810569edb.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Mar 2023 12:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678823372;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4KSUmznh2ok6aa4Ci09Di7Dv3MtowRhPOcy1yLcL7PA=;
        b=jhzyPJPIDbGYuM0hUKTd+D6vgjFyeu7ZpRP1qaZS5jT+kvx/4fm6sGjaYRIu1q3Y1A
         PP8VoUGZCDyrTklBaz6k6rwXl9FmVyHyE0vBIPUKe/GrtFFM3RhoS0txQ8iIcUKfzcNA
         6eUzXD0Hju2BVJdAhA/9e7Z3kwgFXE93ZnoU599CdSJeHd8sjxOhdsNwqoZaVQHt4Q2y
         eqPIr1hpvpwgfMp87Q3z7ZrzFnub1rccXEvY6/s8Qf+yg0fCQlW4A8hyRStmfH0zXE5r
         m39vnFOp9KaMCfXrQg2P7jSA8J2UdCsJkhTdBW5nhlJr5Y+RGb5lbcf8uhJb4Dk3zmVm
         NqWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678823372;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4KSUmznh2ok6aa4Ci09Di7Dv3MtowRhPOcy1yLcL7PA=;
        b=0DKs8LJsoAPU0vGFMwsNQanM1kVIOnqU76r89CUoge/HNUk5pXF2NRMDRYh6P+/kCb
         1csX4jsdOOZhnrFWkQfY5/TsjsnSAMJNuKlLd5j0o12xo53qGRnF5n0oGE5tVG0aL6tb
         wSzV45Rm/HW1z0xRLR8KRDXK8T0eluyK07xb3ZbnSc0UhNT2RQ3s5sp8SYMpNQWaM3Q3
         UwsWNXjmnMaHcbqwsOXsNqXR/JxprCsx+P5J4msNP6VkLR/S6f9CFlwCUm4VHNdwpBu5
         Y+ILO1QvyT30ODVpWRnL/P6GmGxVIMHND3KPfAGvaFacMj7YDFosEM5TEPbfQq1nohtR
         tapA==
X-Gm-Message-State: AO0yUKUwpl6EIWFXd75pF5eVZ+Cj8g7mlpehj0P5emCAC8gdUd3Io6og
        gVeEVujj0mcHYQNTaPnfPjnEQw==
X-Google-Smtp-Source: AK7set+Be2eJplmpdWbWUybqVGKj1gD5EKFPFiDQCyOXzQdcw5BoHDAXe4gUNBkyWtrujDRp581wow==
X-Received: by 2002:a17:906:cc54:b0:884:37fd:bf4c with SMTP id mm20-20020a170906cc5400b0088437fdbf4cmr3904484ejb.19.1678823372716;
        Tue, 14 Mar 2023 12:49:32 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:642b:87c2:1efc:c8af? ([2a02:810d:15c0:828:642b:87c2:1efc:c8af])
        by smtp.gmail.com with ESMTPSA id g11-20020a170906348b00b0092b4602f506sm1522869ejb.73.2023.03.14.12.49.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 12:49:32 -0700 (PDT)
Message-ID: <1bd962b1-2fbc-9bdb-8b7a-9f2c70c316e2@linaro.org>
Date:   Tue, 14 Mar 2023 20:49:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v5 1/3] dt-bindings: exynos-dw-mshc-common: add exynos7885
 variants
Content-Language: en-US
To:     Sergey Lisov <sleirsgoevy@gmail.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaehoon Chung <jh80.chung@samsung.com>
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1678644516.665314-1-sleirsgoevy@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1678644516.665314-1-sleirsgoevy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/03/2023 18:58, Sergey Lisov wrote:
> Some Samsung Exynos boards using the arm64 architecture have DW MMC
> controllers configured for a 32-bit data bus but a 64-bit FIFO. On these
> systems the 64-bit FIFO registers must be accessed in two 32-bit halves.
> 
> Add two new compatible strings, "samsung,exynos7885-dw-mshc" and
> "samsung,exynos7885-dw-mshc-smu" respectively, to denote exynos7885
> boards that need this quirk. But it's very possible that all
> "samsung,exynos7-dw-mshc" boards are actually affected.
> ---
>  .../devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
> index fdaa18481..3eebaed2c 100644
> --- a/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
> +++ b/Documentation/devicetree/bindings/mmc/samsung,exynos-dw-mshc.yaml
> @@ -22,6 +22,8 @@ properties:
>        - samsung,exynos5420-dw-mshc-smu
>        - samsung,exynos7-dw-mshc
>        - samsung,exynos7-dw-mshc-smu
> +      - samsung,exynos7885-dw-mshc
> +      - samsung,exynos7885-dw-mshc-smu

What about the if-then at the end? Since this is pretty compatible with
exynos7, then I would expect being added also there.

Best regards,
Krzysztof

