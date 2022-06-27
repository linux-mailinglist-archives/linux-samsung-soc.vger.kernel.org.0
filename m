Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EACB755CB0C
	for <lists+linux-samsung-soc@lfdr.de>; Tue, 28 Jun 2022 14:59:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233159AbiF0Ize (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 27 Jun 2022 04:55:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232930AbiF0Izc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Jun 2022 04:55:32 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 704876374
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jun 2022 01:55:31 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id o10so11996458edi.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Jun 2022 01:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=RsBoiseaTkJc51iVjuUsait0HqgvtgtMrYkH57RHGCU=;
        b=skhj6rL+UZnb3uqF9ljVTdtpJi84kWTrupgEdBvRS3QgaOVnezJVrkAGrGgv6lwF1/
         3d+Cf7kpB4c6T3MDM1IHVWRw4zKkP5ErkBe5MiyNhOb3VHcLptGsyxMN86lyIkSPfLZ6
         8lbuEjmq4yaQwnRR9fvPslm2+S20+4kxiGjZwpc5HTiLopSQPYwhe2WUmzi5Hdz+E5cL
         gnhymObz/v31wdKPoKOsXoWXi99z7gzGLL6WwNDHZO+rx1vx9go6Z0/ebUX3FH4kM5JR
         MAt9z+4m9z7+EVx/bFKLzfIMBbG6Bva2+NVmJO7WBVSc1PcdLs+t9Tx5QU8lIiLWXGJ+
         LUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RsBoiseaTkJc51iVjuUsait0HqgvtgtMrYkH57RHGCU=;
        b=x1Gn/igZOIhlobtEDTaMqfcferdlUyOPrIxtVdrNv9E9QDGZbErt146Zv51bP08yop
         KKsy+8RagekPqWgXIv7NPnZzAuaNhxIC7kfngVsi9pQf/hBfQaddMa8KpgQL9jY/gshX
         Cp7uRSnx7hHYmsvvyCzCtjqoCRVyEVMUGinHAi/gk1Zbuu9VTJm2xXPvuJwDayLyaly0
         lKMC/eTmBr35uApJ1rk5HGjTxcy0cYOd/+UiWKcyostpnQFftD/6HZgPmWBoCNA4JLNJ
         D2cJAPRiRRilmxZxY12Unsd4tkqiOiQua6W4mpKcv5Uu6iSq34+3bckL8vviUAnTyyr2
         fggA==
X-Gm-Message-State: AJIora+/Hjg98bpUrChcyVmCmqtlcNMb+svE1WYQEfv1zS/zXEi9JhXm
        LdRI9xbammSPNYm2FCozpnpxjw==
X-Google-Smtp-Source: AGRyM1uHTpdt+MsqhWdxTZPyIYF7oRz48lzwDRSQCGhJKEvO+cfipqWJDMQS+cbwyV3uuOPXNkhmjA==
X-Received: by 2002:a05:6402:452:b0:434:a373:f9f8 with SMTP id p18-20020a056402045200b00434a373f9f8mr15706814edw.290.1656320130078;
        Mon, 27 Jun 2022 01:55:30 -0700 (PDT)
Received: from [192.168.0.247] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id bg6-20020a170906a04600b00722e31fcf42sm4768843ejb.184.2022.06.27.01.55.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 01:55:29 -0700 (PDT)
Message-ID: <cd6fb785-50d4-8945-b7bc-951856f1c5ae@linaro.org>
Date:   Mon, 27 Jun 2022 10:55:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 1/5] ARM: dts: exynos: align SDHCI node name with dtschema
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        'Ulf Hansson' <ulf.hansson@linaro.org>,
        'Rob Herring' <robh+dt@kernel.org>,
        'Krzysztof Kozlowski' <krzysztof.kozlowski+dt@linaro.org>,
        'Jaehoon Chung' <jh80.chung@samsung.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20220626120342.38851-1-krzysztof.kozlowski@linaro.org>
 <CGME20220626120350epcas5p25a98e0669eeb11ce7959ace0f3634926@epcas5p2.samsung.com>
 <20220626120342.38851-2-krzysztof.kozlowski@linaro.org>
 <000a01d889c5$adb3bd30$091b3790$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <000a01d889c5$adb3bd30$091b3790$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 27/06/2022 03:31, Alim Akhtar wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@linaro.org]
>> Sent: Sunday, June 26, 2022 5:34 PM
>> To: Ulf Hansson <ulf.hansson@linaro.org>; Rob Herring
>> <robh+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; Alim Akhtar
>> <alim.akhtar@samsung.com>; Jaehoon Chung <jh80.chung@samsung.com>;
>> linux-mmc@vger.kernel.org; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>> samsung-soc@vger.kernel.org
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Subject: [PATCH 1/5] ARM: dts: exynos: align SDHCI node name with
>> dtschema
>>
>> The node names should be generic and DT schema expects "mmc".
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
> 
>  (for patch 1 ~ 4)
> 
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

Tooling does not handle such cases.

Best regards,
Krzysztof
