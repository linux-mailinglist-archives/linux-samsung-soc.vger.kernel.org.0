Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14CB3642449
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  5 Dec 2022 09:14:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231954AbiLEIOi (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 5 Dec 2022 03:14:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231983AbiLEIOX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 03:14:23 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D8EA1658C
        for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Dec 2022 00:14:09 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id y16so17374215wrm.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 05 Dec 2022 00:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mOAaEDQ/+KQ94HSAsqFzfVKtm6woYUzL9fBYQMgBuLc=;
        b=e2HPFLjESRMzz+xhAqeTVs6J7M+U5l/REgtnswgMQLAoEHF/udvkXCFDUTJYrrvMGi
         jHHsPiLyYeKKoRaxUjgoK7P8q2ezNypfzTTxa0qlXXVzoCFdagY3iEM9fu6Pl/3SlkM5
         kNfB4w+ejaH0GTXmk5Cgws3weouY5xJ4dC82oEfJbV//rO+LNGvQzpbG+y9ly+gIi1d2
         ejLRyrd3502i1iV1ag9UqznyKebBPAEpbOWpMlg++nslY0vV10UABAICcYEElgww1IRz
         k3xU+st9iv1wiJ29GiJOjUTyFkkR0atN/Gc/rgw/RldEa7aJdlE5Lm+QB5Jf7FUrW3yh
         0b7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mOAaEDQ/+KQ94HSAsqFzfVKtm6woYUzL9fBYQMgBuLc=;
        b=GdipcWi8w6BG33ULILWJgDmRabFBZTZOrnxjxxTJTshvZCJVXq47/EOcgGPWb4YQXq
         EnWny157M4vETqa6zo80C2GNM3tOCwOZ/ZpwoPBJV1OllMXur8mGjceY/LwCJ5TkGTJK
         vs5HjSBBt0IWPZrs5Xwz3oG7t6VxjASCre8YxRXLfrK8tSlW2vU0/gIFvHIeuo1b/4Gb
         o5X4eTiAbKcYibTOs4GxFrGe6naHG8y/LqtLvCRDI/plUXCunHtysTfoLnlVRNn9AF0K
         iqyFoowyAw2WLhLeviqEYWfT0Flj5a4WiMN6ZihqsBQhZjCwNNBTCYkLcoKch++IS4gd
         MYmQ==
X-Gm-Message-State: ANoB5pmB3QLSkSbTclwUrOFDP9OtgLsw1jKMzkNjS83kYXTWobYf+GUl
        WikCf8U4ioklYXF7bw01W2UByg==
X-Google-Smtp-Source: AA0mqf5Ch2HHmf8vDl45Rz3/ktkKscqe8a3oGxpy7NLT/9M1FQnwqH+PvbPyBevvGm9zi9w+mCtgXw==
X-Received: by 2002:a5d:5685:0:b0:235:f0a6:fafd with SMTP id f5-20020a5d5685000000b00235f0a6fafdmr50278628wrv.75.1670228048267;
        Mon, 05 Dec 2022 00:14:08 -0800 (PST)
Received: from [192.168.7.93] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id z10-20020a05600c0a0a00b003c70191f267sm23656674wmp.39.2022.12.05.00.14.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Dec 2022 00:14:07 -0800 (PST)
Message-ID: <938d6732-adc8-5e45-6177-33cfe8c1ab70@linaro.org>
Date:   Mon, 5 Dec 2022 09:14:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 4/9] media: dt-bindings: amlogic,meson-gx-ao-cec:
 reference common CEC properties
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Joe Tessler <jrt@google.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
 <20221204182908.138910-4-krzysztof.kozlowski@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20221204182908.138910-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04/12/2022 19:29, Krzysztof Kozlowski wrote:
> Reference common HDMI CEC adapter properties to simplify the binding and
> have only one place of definition for common properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/media/cec/amlogic,meson-gx-ao-cec.yaml        | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
> 

<snip>


Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
