Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-samsung-soc@lfdr.de
Delivered-To: lists+linux-samsung-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1CBF4AC9E2
	for <lists+linux-samsung-soc@lfdr.de>; Mon,  7 Feb 2022 20:49:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233348AbiBGTtB (ORCPT <rfc822;lists+linux-samsung-soc@lfdr.de>);
        Mon, 7 Feb 2022 14:49:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240724AbiBGTpn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 14:45:43 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C05C0401E1
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Feb 2022 11:45:43 -0800 (PST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 15C873F1B4
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Feb 2022 19:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644263133;
        bh=ZFe7GrDYXMM8CLQ5SMwXw4UQni/9UZT69dDdKHMLJTo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=nVhcyPyqr151nRdZriw+7C/a4hdO/eiaROET0s9kpr0T56yNyO5yCLph6LZJvoSZh
         TwqWccufzXPJSH01VjJHCPFhHhng/yJbmF1F8cUpFsUC31mlc8bh2tAE2f0pJxVhlU
         HzhFVWDacXCJgSbJuteeU7ECtCofdn/eb9rpqBcXDddjFCVSC8b5F0jWqgHHnWe0xp
         BQ0qZoww7OPQxg6dVkARdTj8KaHOqvS905o5UMgKUBQFzry51vzZ4X7LlLTKZC64xy
         RpGGGSKXHx6B82lV2jhURXCcDDbpqBp9sZvApwsiMlq+DUpj03qPYaEf+umO60cvVA
         xyGbJVANBV8Gw==
Received: by mail-ed1-f70.google.com with SMTP id l19-20020a056402231300b0040f2d6b4ec4so4463452eda.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Feb 2022 11:45:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZFe7GrDYXMM8CLQ5SMwXw4UQni/9UZT69dDdKHMLJTo=;
        b=A64SYQ4VKfaleuU0H4+pTBm5i5envN6cDjve3fFBKR6OP3/Og5A+13prz3ZSYMaaWJ
         NoUAs3g7MIEzc3TSMR6kDSM/0l88H//jnnaokwyuUWd6lOnQbxRDKL3t5Pl8uiYtBlkL
         i/h8rx8ChOIM3Zvk+bLg6hx3W6FuIA0oWeJbNpS5/xMXz4jZVABazjQLYtMexapgdgHB
         6Q+O5CpBNNPN2TbSwsvjynbyyg4u3QkpXIAm6ClgFfMGFvAqkjm23hOWsbgvffulttJm
         uTETk74QFxXOK5++QwACbAgnE3J2mcYJd3Loki5Ex95ZTWfqDmZMIJLsEJvtqDxEdFOO
         vvYw==
X-Gm-Message-State: AOAM533WwBpERNmYO3bXA5LurPFj0jD1JbcA368LipXT8mUn6JbzoXjx
        bdgMP3zWpSFMdSNWm59Ks0V+5x6umlijAQiR4h3cOMI7pNYZeKeHHNuFKyyfoxToJpbFHaZ0Gdf
        WNUGPcK5iHJbVPeSUwrWaR5kucRSKY6c0ijPa93coG+YKIx2Y
X-Received: by 2002:a17:907:98e8:: with SMTP id ke8mr968005ejc.524.1644263132763;
        Mon, 07 Feb 2022 11:45:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzFbHJhhicQcTAJbCV7XtoidiI0ekXusMyI1v7J4cYe1pPDkuk3WrSncw/sfZC1Yn4c59YKVQ==
X-Received: by 2002:a17:907:98e8:: with SMTP id ke8mr967987ejc.524.1644263132572;
        Mon, 07 Feb 2022 11:45:32 -0800 (PST)
Received: from [192.168.0.91] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id t22sm5595617edv.105.2022.02.07.11.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 11:45:32 -0800 (PST)
Message-ID: <22952187-80c2-a456-f389-f70a2a30f467@canonical.com>
Date:   Mon, 7 Feb 2022 20:45:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 1/4] spi: dt-bindings: samsung: convert to dtschema
Content-Language: en-US
To:     Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Benson Leung <bleung@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andi Shyti <andi@etezian.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Pratyush Yadav <p.yadav@ti.com>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org
References: <20220124082347.32747-1-krzysztof.kozlowski@canonical.com>
 <20220124082347.32747-2-krzysztof.kozlowski@canonical.com>
 <YgFgQsV2bJS6mjQs@sirena.org.uk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <YgFgQsV2bJS6mjQs@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/02/2022 19:09, Mark Brown wrote:
> On Mon, Jan 24, 2022 at 09:23:44AM +0100, Krzysztof Kozlowski wrote:
>> Convert the Samsung SoC (S3C24xx, S3C64xx, S5Pv210, Exynos) SPI
>> controller bindings to DT schema format.
> 
> Reviewed-by: Mark Brown <broonie@kernel.org>

Hi Mark and Lee,

Thanks for the review. The dt-bindings part have Rob's review. I think
this means Lee can pick up the entire set (SPI+MFD)?

Best regards,
Krzysztof
